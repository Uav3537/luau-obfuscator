import type { Program, Expression, Statement } from "luau-parser"
import { transformExpressions } from "./walk"
import {
    numberLiteral, binary, call, member, identifier, table, positionalField, index,
    localStatement, localFunctionStatement, functionParam, functionBody, functionExpression,
    block, ifStatement, ifClause, returnStatement, paren, unary, stringLiteral,
    numericForStatement, assignmentStatement,
} from "./nodeFactory"

export interface StringsToExpressionsOptions {
    /** 청크 하나에 들어가는 바이트 개수 최소값 */
    min: number
    /** 청크 하나에 들어가는 바이트 개수 최대값 */
    max: number
    /**
     * 0~1. 청크를 소스 순서 그대로 이어붙이는 대신, 순서를 섞어 저장해두고
     * for 루프나 재귀 함수로 원래 순서를 되짚어가며 런타임에 조립할 확률.
     * 소스에 보이는 조각 순서와 실제 결합 순서가 달라지므로, 단순 텍스트 상의
     * concat 체인 스캔만으로는 원문을 복원할 수 없다. 기본값 0.6.
     */
    controlFlowProbability?: number
}

const CONTROL_FLOW_PROBABILITY_DEFAULT = 0.6

function randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min
}

function randomName(): string {
    return "_" + globalThis.crypto.randomUUID().replace(/-/g, "")
}

/** Luau 소스는 UTF-8 바이트 스트림이므로 charCodeAt이 아니라 실제 UTF-8 바이트로 변환.
 *  Buffer(Node 전용) 대신 표준 TextEncoder 사용 — 브라우저/번들러 환경에서도 동작. */
function toUtf8Bytes(value: string): number[] {
    return Array.from(new TextEncoder().encode(value))
}

function splitByteChunks(bytes: number[], min: number, max: number): number[][] {
    const chunks: number[][] = []
    let i = 0
    while (i < bytes.length) {
        const size = Math.max(1, randomInt(min, max))
        chunks.push(bytes.slice(i, i + size))
        i += size
    }
    return chunks.length > 0 ? chunks : [bytes]
}

function stringCharCall(bytes: number[]): Expression {
    // string.char(b1, b2, ...) — 원문 텍스트가 소스에 전혀 남지 않음
    return call(member(identifier("string"), "char"), bytes.map(numberLiteral))
}

/** 기존 방식: 청크를 소스에 보이는 순서 그대로 ".."로 이어붙임. */
function buildConcatChain(chunks: number[][]): Expression {
    let expr: Expression = stringCharCall(chunks[0])
    for (let i = 1; i < chunks.length; i++) {
        expr = binary("..", expr, stringCharCall(chunks[i]))
    }
    return expr
}

/** [0, n)의 무작위 순열 (Fisher-Yates) */
function shuffledIndices(n: number): number[] {
    const arr = Array.from({ length: n }, (_, i) => i)
    for (let i = n - 1; i > 0; i--) {
        const j = randomInt(0, i)
        ;[arr[i], arr[j]] = [arr[j], arr[i]]
    }
    return arr
}

/** (function() ... end)() — 문(statement)들을 하나의 표현식으로 감싸는 즉시실행 함수. */
function iife(statements: Statement[]): Expression {
    return call(paren(functionExpression(functionBody([], block(statements)))), [])
}

/**
 * 청크들을 뒤섞어 store 테이블에 저장하고, 원래 순서를 가리키는 order 테이블을 따로 둔다.
 * store에 나타나는 물리적 순서 == 원문 순서가 아니므로, 소스를 눈으로 읽거나
 * 텍스트 패턴만으로 concat해서는 원문이 나오지 않는다 — order를 통해 런타임에
 * 역참조해야만 올바른 순서가 나온다.
 */
function buildShuffledTables(chunks: number[][]): { storeVar: string; orderVar: string; stmts: Statement[] } {
    const n = chunks.length
    const storageOrder = shuffledIndices(n) // storageOrder[slot] = 원본 청크 인덱스
    const storeVar = randomName()
    const orderVar = randomName()

    const storeFields = storageOrder.map((originalIdx) => positionalField(stringCharCall(chunks[originalIdx])))

    // order[originalIdx] = slot(1-based) — 원본 위치 k에 해당하는 조각이 store의 몇 번째에 있는지
    const order = new Array<number>(n)
    for (let slot = 0; slot < n; slot++) {
        order[storageOrder[slot]] = slot + 1
    }
    const orderFields = order.map((slot) => positionalField(numberLiteral(slot)))

    return {
        storeVar,
        orderVar,
        stmts: [
            localStatement(storeVar, table(storeFields)),
            localStatement(orderVar, table(orderFields)),
        ],
    }
}

/**
 *   (function()
 *       local store = { ... 뒤섞인 순서의 string.char(...) 조각들 ... }
 *       local order = { ... }
 *       local acc = ""
 *       for i = 1, #order do
 *           acc = acc .. store[order[i]]
 *       end
 *       return acc
 *   end)()
 */
function buildForLoopStringExpr(chunks: number[][]): Expression {
    const { storeVar, orderVar, stmts } = buildShuffledTables(chunks)
    const accVar = randomName()
    const iVar = randomName()

    return iife([
        ...stmts,
        localStatement(accVar, stringLiteral("")),
        numericForStatement(
            iVar,
            numberLiteral(1),
            unary("#", identifier(orderVar)),
            block([
                assignmentStatement(
                    [identifier(accVar)],
                    [
                        binary(
                            "..",
                            identifier(accVar),
                            index(identifier(storeVar), index(identifier(orderVar), identifier(iVar))),
                        ),
                    ],
                ),
            ]),
        ),
        returnStatement([identifier(accVar)]),
    ])
}

/**
 *   (function()
 *       local store = { ... }
 *       local order = { ... }
 *       local function build(i, acc)
 *           if i > #order then
 *               return acc
 *           end
 *           return build(i + 1, acc .. store[order[i]])
 *       end
 *       return build(1, "")
 *   end)()
 */
function buildRecursiveStringExpr(chunks: number[][]): Expression {
    const { storeVar, orderVar, stmts } = buildShuffledTables(chunks)
    const recName = randomName()
    const iParam = randomName()
    const accParam = randomName()

    const body = block([
        ifStatement([
            ifClause(
                binary(">", identifier(iParam), unary("#", identifier(orderVar))),
                block([returnStatement([identifier(accParam)])]),
            ),
        ]),
        returnStatement([
            call(identifier(recName), [
                binary("+", identifier(iParam), numberLiteral(1)),
                binary(
                    "..",
                    identifier(accParam),
                    index(identifier(storeVar), index(identifier(orderVar), identifier(iParam))),
                ),
            ]),
        ]),
    ])

    return iife([
        ...stmts,
        localFunctionStatement(recName, functionBody([functionParam(iParam), functionParam(accParam)], body)),
        returnStatement([call(identifier(recName), [numberLiteral(1), stringLiteral("")])]),
    ])
}

type ControlFlowStrategy = "forLoop" | "recursive"

function pickControlFlowStrategy(): ControlFlowStrategy {
    return Math.random() < 0.5 ? "forLoop" : "recursive"
}

export function runStringsToExpressions(program: Program, options: StringsToExpressionsOptions): void {
    const controlFlowProbability = options.controlFlowProbability ?? CONTROL_FLOW_PROBABILITY_DEFAULT

    transformExpressions(program, (expr) => {
        if (expr.type !== "StringLiteral") return
        if (expr.value.length === 0) return

        const bytes = toUtf8Bytes(expr.value)
        const chunks = splitByteChunks(bytes, options.min, options.max)

        // 청크가 하나뿐이면 순서를 흩뜨려도 얻는 게 없으니 그냥 원래 방식대로.
        if (chunks.length > 1 && Math.random() < controlFlowProbability) {
            return pickControlFlowStrategy() === "forLoop"
                ? buildForLoopStringExpr(chunks)
                : buildRecursiveStringExpr(chunks)
        }

        return buildConcatChain(chunks)
    })
}