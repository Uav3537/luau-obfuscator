import type { Program, Expression, Statement } from "luau-parser"
import { transformExpressions } from "./walk"
import {
    vmNumberLiteral, binary, call, member, identifier, table, positionalField, index,
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
    return call(member(identifier("string"), "char"), bytes.map(vmNumberLiteral))
}

/**
 * 청크를 소스에 보이는 순서 그대로 ".."로 이어붙인다.
 *
 * 예전에는 왼쪽으로만 쌓는 선형 체인(`(((a..b)..c)..d)...`)이었는데, 이러면
 * depth == chunks.length라서 큰 문자열 리터럴(수백만 바이트) 하나만 있어도
 * 표현식 중첩 깊이가 수백만까지 치솟는다. 이 트랜스파일러 자체의 스택뿐 아니라
 * 실제 Luau/Lua 컴파일러도 문법 중첩 레벨에 제한(대략 200선)이 있어서, 그 한계를
 * 넘는 순간 우리 쪽이 아니라 Roblox/Luau 파서에서 컴파일이 실패한다.
 * 그래서 균형 이진 트리로 묶어 depth를 O(log n)으로 낮춘다 — 결합 순서만 바뀔 뿐
 * ".."는 결합법칙이 성립하므로 결과 문자열은 동일하다.
 */
function buildConcatChain(chunks: number[][]): Expression {
    function build(lo: number, hi: number): Expression {
        if (hi - lo === 1) return stringCharCall(chunks[lo])
        const mid = lo + Math.floor((hi - lo) / 2)
        return binary("..", build(lo, mid), build(mid, hi))
    }
    return build(0, chunks.length)
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
    const orderFields = order.map((slot) => positionalField(vmNumberLiteral(slot)))

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
            vmNumberLiteral(1),
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
                binary("+", identifier(iParam), vmNumberLiteral(1)),
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
        returnStatement([call(identifier(recName), [vmNumberLiteral(1), stringLiteral("")])]),
    ])
}

type ControlFlowStrategy = "forLoop" | "recursive"

function pickControlFlowStrategy(): ControlFlowStrategy {
    return Math.random() < 0.5 ? "forLoop" : "recursive"
}

// 바이트 단위로 쪼개면 청크 하나당 AST 노드(CallExpression+MemberExpression+인자들)가
// 하나씩 생긴다. 수 MB짜리 문자열 리터럴(예: 임베드된 데이터 블롭)을 5~10바이트 청크로
// 쪼개면 수십~수백만 개 노드가 나와서 이 트랜스파일러 자체가 OOM으로 죽는다.
// 그 크기의 문자열은 바이트 단위로 흩뿌려봐야 어차피 노출 표면이 커서 난독화 효과도
// 떨어지므로, 청크 개수가 이 상한을 넘으면 통째로 하나의 string.char(...)/원본 리터럴로
// 두고 건드리지 않는다 (EncryptStrings 등 다른 패스가 필요하면 별도로 암호화하면 됨).
const MAX_CHUNKS_PER_STRING = 20000

export function runStringsToExpressions(program: Program, options: StringsToExpressionsOptions): void {
    const controlFlowProbability = options.controlFlowProbability ?? CONTROL_FLOW_PROBABILITY_DEFAULT

    transformExpressions(program, (expr) => {
        if (expr.type !== "StringLiteral") return
        if (expr.value.length === 0) return

        const bytes = toUtf8Bytes(expr.value)

        // 너무 큰 문자열은 청크 단위 폭발을 피하기 위해 손대지 않는다.
        const estimatedChunks = Math.ceil(bytes.length / Math.max(1, options.min))
        if (estimatedChunks > MAX_CHUNKS_PER_STRING) return

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