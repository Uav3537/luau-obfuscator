import type { Program, Expression, Statement } from "luau-parser"
import { transformExpressions } from "./walk"
import {
    identifier, vmNumberLiteral, call, member, index, table, positionalField,
    localFunctionStatement, functionParam, functionBody, block, localStatement,
    assignmentStatement, numericForStatement, returnStatement, unary, binary,
    functionExpression, paren, ifStatement, ifClause, callStatement,
} from "./nodeFactory"

export interface EncryptStringsOptions {
    /** 암호화된 바이트를 소스에 흩뿌릴 때 청크 하나의 최소 바이트 수. 기본 4. */
    chunkMin?: number
    /** 청크 하나의 최대 바이트 수. 기본 9. */
    chunkMax?: number
    /**
     * 0~1. 암호문 바이트 배열을 소스에 보이는 순서 그대로가 아니라, 청크 단위로
     * 뒤섞어 저장해두고 for 루프나 재귀 함수로 원래 순서를 되짚어가며 런타임에
     * 재조립할 확률. 암호문이라 눈으로는 어차피 못 읽지만, 이걸 켜면 배열이
     * 소스상 연속/정렬된 리터럴로 남지 않아 정적 추적이 한 겹 더 어려워진다.
     * 기본값 0.7.
     */
    controlFlowProbability?: number
}

const CHUNK_MIN_DEFAULT = 4
const CHUNK_MAX_DEFAULT = 9
const CONTROL_FLOW_PROBABILITY_DEFAULT = 0.7

// 청크 수가 이 상한을 넘기는 거대한 문자열(수 MB짜리 임베드 블롭 등)은 제어흐름
// 래핑 시 노드가 폭발하므로, 암호화만 적용하고 평문 배열 리터럴(단, 내용은 암호문)로
// 둔다. StringsToExpressions의 MAX_CHUNKS_PER_STRING과 같은 취지.
const MAX_CHUNKS_FOR_CONTROL_FLOW = 20000

function randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min
}

function randomName(): string {
    return "_" + globalThis.crypto.randomUUID().replace(/-/g, "")
}

/** Luau 소스는 UTF-8 바이트 스트림이므로 charCodeAt이 아니라 실제 UTF-8 바이트로 변환. */
function toUtf8Bytes(value: string): number[] {
    return Array.from(new TextEncoder().encode(value))
}

/** bit32.lrotate(x, disp)와 동일한 32비트 좌회전. disp는 0~31 범위로 정규화. */
function lrotate32(x: number, disp: number): number {
    const d = ((disp % 32) + 32) % 32
    const xu = x >>> 0
    if (d === 0) return xu
    return ((xu << d) | (xu >>> (32 - d))) >>> 0
}

/**
 * i번째(1-indexed) 바이트에 적용할 키스트림 바이트.
 * - 롤링 키 배열에서 위치별로 다른 키 바이트를 뽑고
 * - 좌회전으로 비트를 섞은 뒤
 * - 위치(i)에 종속적인 바이트와 다시 섞는다.
 * 같은 평문 바이트가 반복돼도 위치가 다르면 암호문 바이트가 달라져
 * (반복 키 XOR과 달리) 단순 빈도분석/Kasiski류 공격에 내성을 갖는다.
 */
function keystreamByte(keys: number[], mult: number, i: number): number {
    const nKeys = keys.length
    const keyByte = keys[(i - 1) % nKeys]
    const rotated = lrotate32(keyByte, i % 8) & 0xFF
    const posByte = (i * mult) & 0xFF
    return (rotated ^ posByte) & 0xFF
}

/**
 * 숫자 리터럴을 곧이곧대로 노출하지 않고, 산술식/bit32.bxor 호출로 위장한다.
 * "decoder(literal, literal)" 패턴을 그대로 상수 접기(constant fold)하는
 * 단순 정적 분석 스크립트를 무력화하기 위함.
 */
function obfuscatedNumber(value: number): Expression {
    const variant = randomInt(0, 2)
    if (variant === 0) {
        const a = randomInt(0, value)
        return binary("+", vmNumberLiteral(a), vmNumberLiteral(value - a))
    }
    if (variant === 1) {
        const a = randomInt(0, 0xFFFFFF)
        return binary("-", vmNumberLiteral(value + a), vmNumberLiteral(a))
    }
    const a = randomInt(0, 0xFFFFFF)
    const b = (value ^ a) >>> 0
    return call(member(identifier("bit32"), "bxor"), [vmNumberLiteral(a), vmNumberLiteral(b)])
}

/**
 * 런타임 디코더를 조립:
 *   local function <name>(data, keys, mult)
 *       local nKeys = #keys
 *       local out = {}
 *       for i = 1, #data do
 *           local keyByte = keys[((i - 1) % nKeys) + 1]
 *           local mixed = bit32.band(bit32.lrotate(keyByte, i % 8), 0xFF)
 *           local posByte = bit32.band(i * mult, 0xFF)
 *           out[i] = string.char(bit32.bxor(data[i], bit32.bxor(mixed, posByte)))
 *       end
 *       return table.concat(out)
 *   end
 */
function buildDecoderStatement(name: string) {
    const dataParam = randomName()
    const keysParam = randomName()
    const multParam = randomName()
    const outVar = randomName()
    const iVar = randomName()
    const nKeysVar = randomName()

    const idxExpr = binary(
        "+",
        binary("%", binary("-", identifier(iVar), vmNumberLiteral(1)), identifier(nKeysVar)),
        vmNumberLiteral(1),
    )
    const keyByte = index(identifier(keysParam), idxExpr)
    const mixed = call(member(identifier("bit32"), "band"), [
        call(member(identifier("bit32"), "lrotate"), [keyByte, binary("%", identifier(iVar), vmNumberLiteral(8))]),
        vmNumberLiteral(0xFF),
    ])
    const posByte = call(member(identifier("bit32"), "band"), [
        binary("*", identifier(iVar), identifier(multParam)),
        vmNumberLiteral(0xFF),
    ])
    const keystream = call(member(identifier("bit32"), "bxor"), [mixed, posByte])
    const finalByte = call(member(identifier("bit32"), "bxor"), [
        index(identifier(dataParam), identifier(iVar)),
        keystream,
    ])

    const body = block([
        localStatement(nKeysVar, unary("#", identifier(keysParam))),
        localStatement(outVar, table([])),
        numericForStatement(
            iVar,
            vmNumberLiteral(1),
            unary("#", identifier(dataParam)),
            block([
                assignmentStatement(
                    [index(identifier(outVar), identifier(iVar))],
                    [call(member(identifier("string"), "char"), [finalByte])],
                ),
            ]),
        ),
        returnStatement([call(member(identifier("table"), "concat"), [identifier(outVar)])]),
    ])

    return localFunctionStatement(
        name,
        functionBody([functionParam(dataParam), functionParam(keysParam), functionParam(multParam)], body),
    )
}

// ---------------------------------------------------------------------------
// 암호문 바이트 배열을 만드는 쪽. 작은~보통 크기 문자열은 청크로 쪼개 "뒤섞인 순서"로
// 저장한 뒤, 런타임에 order 테이블을 통해 원래 순서로 재조립해 `data` 배열을 돌려준다.
// (평문이 아니라 암호문 바이트를 다루므로, StringsToExpressions의 string 조립과 달리
//  결과물은 string이 아니라 number 배열이다.)
// ---------------------------------------------------------------------------

function splitIntoChunks(bytes: number[], min: number, max: number): number[][] {
    const lo = Math.max(1, min)
    const hi = Math.max(lo, max)
    const chunks: number[][] = []
    let i = 0
    while (i < bytes.length) {
        const size = randomInt(lo, hi)
        chunks.push(bytes.slice(i, i + size))
        i += size
    }
    return chunks.length > 0 ? chunks : [bytes]
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

/** 암호문 바이트 배열을 그대로(순서대로) 담은 테이블 리터럴. 거대 문자열용 폴백. */
function buildPlainDataTable(cipherBytes: number[]): Expression {
    return table(cipherBytes.map((b) => positionalField(vmNumberLiteral(b))))
}

/**
 * 청크들을 뒤섞어 store 테이블에 저장하고, 원래 순서를 가리키는 order 테이블을 따로 둔다.
 * store[slot] = { 암호문바이트... } (positional 하위 테이블), order[원본청크 인덱스] = slot(1-based).
 */
function buildShuffledTables(chunks: number[][]): { storeVar: string; orderVar: string; stmts: Statement[] } {
    const n = chunks.length
    const storageOrder = shuffledIndices(n) // storageOrder[slot] = 원본 청크 인덱스
    const storeVar = randomName()
    const orderVar = randomName()

    const storeFields = storageOrder.map((originalIdx) =>
        positionalField(table(chunks[originalIdx].map((b) => positionalField(vmNumberLiteral(b))))),
    )

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
 *       local store = { ... 뒤섞인 순서의 { 암호문바이트... } 조각들 ... }
 *       local order = { ... }
 *       local out = {}
 *       local n = 0
 *       for i = 1, #order do
 *           local ch = store[order[i]]
 *           for j = 1, #ch do
 *               n = n + 1
 *               out[n] = ch[j]
 *           end
 *       end
 *       return out
 *   end)()
 */
function buildForLoopDataExpr(chunks: number[][]): Expression {
    const { storeVar, orderVar, stmts } = buildShuffledTables(chunks)
    const outVar = randomName()
    const nVar = randomName()
    const iVar = randomName()
    const jVar = randomName()
    const chVar = randomName()

    const innerLoop = numericForStatement(
        jVar,
        vmNumberLiteral(1),
        unary("#", identifier(chVar)),
        block([
            assignmentStatement([identifier(nVar)], [binary("+", identifier(nVar), vmNumberLiteral(1))]),
            assignmentStatement(
                [index(identifier(outVar), identifier(nVar))],
                [index(identifier(chVar), identifier(jVar))],
            ),
        ]),
    )

    return iife([
        ...stmts,
        localStatement(outVar, table([])),
        localStatement(nVar, vmNumberLiteral(0)),
        numericForStatement(
            iVar,
            vmNumberLiteral(1),
            unary("#", identifier(orderVar)),
            block([
                localStatement(chVar, index(identifier(storeVar), index(identifier(orderVar), identifier(iVar)))),
                innerLoop,
            ]),
        ),
        returnStatement([identifier(outVar)]),
    ])
}

/**
 *   (function()
 *       local store = { ... }
 *       local order = { ... }
 *       local out = {}
 *       local n = 0
 *       local function build(i)
 *           if i > #order then return end
 *           local ch = store[order[i]]
 *           for j = 1, #ch do
 *               n = n + 1
 *               out[n] = ch[j]
 *           end
 *           return build(i + 1)
 *       end
 *       build(1)
 *       return out
 *   end)()
 */
function buildRecursiveDataExpr(chunks: number[][]): Expression {
    const { storeVar, orderVar, stmts } = buildShuffledTables(chunks)
    const outVar = randomName()
    const nVar = randomName()
    const recName = randomName()
    const iParam = randomName()
    const jVar = randomName()
    const chVar = randomName()

    const innerLoop = numericForStatement(
        jVar,
        vmNumberLiteral(1),
        unary("#", identifier(chVar)),
        block([
            assignmentStatement([identifier(nVar)], [binary("+", identifier(nVar), vmNumberLiteral(1))]),
            assignmentStatement(
                [index(identifier(outVar), identifier(nVar))],
                [index(identifier(chVar), identifier(jVar))],
            ),
        ]),
    )

    const recBody = block([
        ifStatement([
            ifClause(
                binary(">", identifier(iParam), unary("#", identifier(orderVar))),
                block([returnStatement([])]),
            ),
        ]),
        localStatement(chVar, index(identifier(storeVar), index(identifier(orderVar), identifier(iParam)))),
        innerLoop,
        returnStatement([call(identifier(recName), [binary("+", identifier(iParam), vmNumberLiteral(1))])]),
    ])

    return iife([
        ...stmts,
        localStatement(outVar, table([])),
        localStatement(nVar, vmNumberLiteral(0)),
        localFunctionStatement(recName, functionBody([functionParam(iParam)], recBody)),
        callStatement(call(identifier(recName), [vmNumberLiteral(1)])),
        returnStatement([identifier(outVar)]),
    ])
}

function buildDataExpr(cipherBytes: number[], options: Required<EncryptStringsOptions>): Expression {
    const estimatedChunks = Math.ceil(cipherBytes.length / Math.max(1, options.chunkMin))

    const useControlFlow =
        cipherBytes.length > 1 &&
        estimatedChunks <= MAX_CHUNKS_FOR_CONTROL_FLOW &&
        Math.random() < options.controlFlowProbability

    if (!useControlFlow) return buildPlainDataTable(cipherBytes)

    const chunks = splitIntoChunks(cipherBytes, options.chunkMin, options.chunkMax)
    if (chunks.length <= 1) return buildPlainDataTable(cipherBytes)

    return Math.random() < 0.5 ? buildForLoopDataExpr(chunks) : buildRecursiveDataExpr(chunks)
}

export function runEncryptStrings(program: Program, options: EncryptStringsOptions): void {
    const resolved: Required<EncryptStringsOptions> = {
        chunkMin: options.chunkMin ?? CHUNK_MIN_DEFAULT,
        chunkMax: options.chunkMax ?? CHUNK_MAX_DEFAULT,
        controlFlowProbability: options.controlFlowProbability ?? CONTROL_FLOW_PROBABILITY_DEFAULT,
    }

    const decoderName = randomName()
    let used = false

    transformExpressions(program, (expr: Expression) => {
        if (expr.type !== "StringLiteral") return
        if (expr.value.length === 0) return

        used = true

        const keyLen = randomInt(4, 12)
        const keys = Array.from({ length: keyLen }, () => randomInt(1, 255))
        const mult = randomInt(1, 255)

        const plainBytes = toUtf8Bytes(expr.value)
        const cipherBytes = plainBytes.map((b, idx) => b ^ keystreamByte(keys, mult, idx + 1))

        const dataExpr = buildDataExpr(cipherBytes, resolved)
        const keysTable = table(keys.map((k) => positionalField(obfuscatedNumber(k))))
        const multExpr = obfuscatedNumber(mult)

        return call(identifier(decoderName), [dataExpr, keysTable, multExpr])
    })

    if (!used) return

    program.body.statements.unshift(buildDecoderStatement(decoderName))
}
