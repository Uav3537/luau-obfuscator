import type { Program, Expression } from "luau-parser"
import { transformExpressions } from "./walk"
import {
    identifier, numberLiteral, call, member,
    localFunctionStatement, functionParam, functionBody, block, returnStatement,
    localStatement, binary,
} from "./nodeFactory"

export interface EncryptNumbersOptions {}

// bit32.bxor는 32비트 부호 없는 정수만 다룸. 실수/음수/범위 밖 값은 그대로 둔다
// (그런 값은 NumbersToExpressions 쪽 산술식 위장으로 커버).
const UINT32_MAX = 0xFFFFFFFF
const MOD32 = 4294967296 // 2^32

function randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min
}

function randomName(): string {
    return "_" + globalThis.crypto.randomUUID().replace(/-/g, "")
}

function isEncryptable(value: number): boolean {
    return Number.isInteger(value) && value >= 0 && value <= UINT32_MAX
}

/** JS의 ^ 연산자는 32비트 부호 있는 정수로 계산하므로 >>> 0으로 다시
 *  부호 없는 32비트 표현으로 맞춰줌 — bit32.bxor와 동일한 비트 결과가 나옴. */
function xor32(a: number, b: number): number {
    return (a ^ b) >>> 0
}

/** Luau의 %는 항상 피제수와 같은 부호(양수 나눗셈이면 0 이상)를 반환하므로
 *  음수가 나와도 자동으로 [0, 2^32) 범위로 랩어라운드된다. */
function modAdd32(a: number, b: number): number {
    return ((a + b) % MOD32 + MOD32) % MOD32
}

/**
 * 숫자 리터럴을 곧이곧대로 노출하지 않고 산술식/bit32.bxor 호출로 위장한다.
 * "decoder(literal, literal, literal)" 형태를 그대로 상수 접기(constant fold)
 * 하는 단순 정적 분석 스크립트를 무력화하기 위함.
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
    const b = xor32(value, a)
    return call(member(identifier("bit32"), "bxor"), [numberLiteral(a), numberLiteral(b)])
}

/**
 * 런타임 디코더를 조립. 단순 XOR 한 번이 아니라 XOR + 모듈러 덧셈 두 단계를 거치므로,
 * "bit32.bxor(literalA, literalB)" 같은 단일 호출 패턴 매칭으로는 상수 접기가 안 된다:
 *
 *   local function <name>(x, keyA, keyB)
 *       local t = (x - keyB) % 4294967296
 *       return bit32.bxor(t, keyA)
 *   end
 */
function buildDecoderStatement(name: string) {
    const xParam = randomName()
    const keyAParam = randomName()
    const keyBParam = randomName()
    const tVar = randomName()

    const body = block([
        localStatement(
            tVar,
            binary(
                "%",
                binary("-", identifier(xParam), identifier(keyBParam)),
                numberLiteral(MOD32),
            ),
        ),
        returnStatement([call(member(identifier("bit32"), "bxor"), [identifier(tVar), identifier(keyAParam)])]),
    ])

    return localFunctionStatement(
        name,
        functionBody([functionParam(xParam), functionParam(keyAParam), functionParam(keyBParam)], body),
    )
}

export function runEncryptNumbers(program: Program, _options: EncryptNumbersOptions): void {
    const decoderName = randomName()
    let used = false

    transformExpressions(program, (expr: Expression) => {
        if (expr.type !== "NumberLiteral") return
        if (!isEncryptable(expr.value)) return

        used = true

        const keyA = randomInt(1, 0xFFFFFF)
        const keyB = randomInt(1, 0xFFFFFF)

        // decode(encode(value)) == value 가 되도록 순전파를 정의:
        //   t1 = value xor keyA
        //   encoded = (t1 + keyB) mod 2^32
        const t1 = xor32(expr.value, keyA)
        const encoded = modAdd32(t1, keyB)

        return call(identifier(decoderName), [
            obfuscatedNumber(encoded),
            obfuscatedNumber(keyA),
            obfuscatedNumber(keyB),
        ])
    })

    if (!used) return

    program.body.statements.unshift(buildDecoderStatement(decoderName))
}