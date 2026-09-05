import type { Program, Expression } from "luau-parser"
import { transformExpressions } from "./walk"
import {
    identifier, numberLiteral, call, member, index, table, positionalField,
    localFunctionStatement, functionParam, functionBody, block, localStatement,
    assignmentStatement, numericForStatement, returnStatement, unary, binary,
} from "./nodeFactory"

export interface EncryptStringsOptions {}

const MIN_KEY_LEN = 4
const MAX_KEY_LEN = 12

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
        return binary("+", numberLiteral(a), numberLiteral(value - a))
    }
    if (variant === 1) {
        const a = randomInt(0, 0xFFFFFF)
        return binary("-", numberLiteral(value + a), numberLiteral(a))
    }
    const a = randomInt(0, 0xFFFFFF)
    const b = (value ^ a) >>> 0
    return call(member(identifier("bit32"), "bxor"), [numberLiteral(a), numberLiteral(b)])
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
        binary("%", binary("-", identifier(iVar), numberLiteral(1)), identifier(nKeysVar)),
        numberLiteral(1),
    )
    const keyByte = index(identifier(keysParam), idxExpr)
    const mixed = call(member(identifier("bit32"), "band"), [
        call(member(identifier("bit32"), "lrotate"), [keyByte, binary("%", identifier(iVar), numberLiteral(8))]),
        numberLiteral(0xFF),
    ])
    const posByte = call(member(identifier("bit32"), "band"), [
        binary("*", identifier(iVar), identifier(multParam)),
        numberLiteral(0xFF),
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
            numberLiteral(1),
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

export function runEncryptStrings(program: Program, _options: EncryptStringsOptions): void {
    const decoderName = randomName()
    let used = false

    transformExpressions(program, (expr: Expression) => {
        if (expr.type !== "StringLiteral") return
        if (expr.value.length === 0) return

        used = true

        const keyLen = randomInt(MIN_KEY_LEN, MAX_KEY_LEN)
        const keys = Array.from({ length: keyLen }, () => randomInt(1, 255))
        const mult = randomInt(1, 255)

        const plainBytes = toUtf8Bytes(expr.value)
        const cipherBytes = plainBytes.map((b, idx) => b ^ keystreamByte(keys, mult, idx + 1))

        const dataTable = table(cipherBytes.map((b) => positionalField(numberLiteral(b))))
        const keysTable = table(keys.map((k) => positionalField(obfuscatedNumber(k))))
        const multExpr = obfuscatedNumber(mult)

        return call(identifier(decoderName), [dataTable, keysTable, multExpr])
    })

    if (!used) return

    program.body.statements.unshift(buildDecoderStatement(decoderName))
}