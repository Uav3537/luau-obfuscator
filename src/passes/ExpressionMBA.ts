import type { Program, Expression } from "luau-parser"
import { transformExpressions } from "./walk"
import {
    identifier, call, member, binary, vmNumberLiteral, vmStructuralNumbers,
} from "./nodeFactory"

export interface ExpressionMBAOptions {
    /** 변환 대상 조건을 만족하는 정수 리터럴 하나를 실제로 MBA 식으로 바꿀 확률.
     *  (0~1) 산출물 크기를 조절한다. 기본 0.6. */
    probability?: number
}

// bit32는 32비트 부호 없는 정수만 다룬다. MBA 항등식도 이 범위 안에서만 값이
// 보존되므로, 정수이면서 [0, 2^32) 인 리터럴만 변환한다. (EncryptNumbers의
// isEncryptable과 같은 기준.)
const UINT32_MAX = 0xFFFFFFFF
const PROBABILITY_DEFAULT = 0.6

function randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min
}

/** bit32.<fn>(...args) */
function bit32(fn: string, args: Expression[]): Expression {
    return call(member(identifier("bit32"), fn), args)
}

// 방출하는 보조 상수는 vmNumberLiteral(= structural)로 만든다. 그래야 뒤이어 도는
// NumbersToExpressions / EncryptNumbers가 이 값들을 건드리지 않아(둘 다
// vmStructuralNumbers를 skip) 숫자 패스끼리 곱셈적으로 부풀지 않는다. MBA 식의
// "구조" 자체가 난독화이고, Vmify가 켜져 있으면 이 식 전체가 바이트코드로 들어간다.
function k(value: number): Expression {
    return vmNumberLiteral(value)
}

/**
 * 정수 상수 K를 "값은 같지만 비트연산+산술이 섞인" 식(Mixed Boolean-Arithmetic)으로
 * 치환한다. 세 항등식 모두 32비트 범위의 모든 정수에서 값 보존이 증명된다:
 *
 *   (A) 덧셈 캐리 분해:  a + b = (a ⊕ b) + 2·(a & b)
 *   (B) OR/AND 분해:    a + b = (a | b) + (a & b)
 *   (C) 뺄셈 분해:      a - c = (a ⊕ c) − 2·(¬a & c)        (a ≥ c)
 *
 * 핵심은 K가 식에 "그대로" 남지 않도록, K를 임의의 a/b(또는 a/c)로 쪼개 넣는 것이다.
 * (bit32 결과는 [0, 2^32), 2·(…)는 < 2^33 이라 모든 중간값이 f64에서 정확히 표현되고,
 *  최종값은 항등식상 정확히 K가 된다.)
 */
function encodeMBA(value: number): Expression {
    const variant = randomInt(0, 2)

    if (variant === 0) {
        // (A) a + b = (a⊕b) + 2·(a&b),  a+b = value
        const a = randomInt(0, value)
        const b = value - a
        return binary(
            "+",
            bit32("bxor", [k(a), k(b)]),
            binary("*", k(2), bit32("band", [k(a), k(b)])),
        )
    }

    if (variant === 1) {
        // (B) a + b = (a|b) + (a&b),  a+b = value
        const a = randomInt(0, value)
        const b = value - a
        return binary(
            "+",
            bit32("bor", [k(a), k(b)]),
            bit32("band", [k(a), k(b)]),
        )
    }

    // (C) a - c = (a⊕c) − 2·(¬a & c),  a ≥ c,  a - c = value
    const a = randomInt(value, UINT32_MAX)
    const c = a - value
    return binary(
        "-",
        bit32("bxor", [k(a), k(c)]),
        binary("*", k(2), bit32("band", [bit32("bnot", [k(a)]), k(c)])),
    )
}

function isEligible(value: number): boolean {
    return Number.isInteger(value) && value >= 0 && value <= UINT32_MAX
}

/**
 * Mixed Boolean-Arithmetic 치환.
 *
 * NumbersToExpressions의 "강화판"으로, 정수 리터럴을 bit32 기반 MBA 항등식으로 바꾼다.
 * NumbersToExpressions/EncryptNumbers와 중복 레이어가 될 수 있어 기본값은 off이며,
 * 켤 경우 PASS_ORDER상 다른 숫자 패스보다 "먼저" 돌아(구조 상수를 structural로
 * 찍어두므로 뒤 패스들이 건드리지 않음) 사실상 숫자 난독화 레이어를 MBA로 교체한다.
 */
export function runExpressionMBA(program: Program, options: ExpressionMBAOptions): void {
    const probability = options.probability ?? PROBABILITY_DEFAULT

    transformExpressions(program, (expr: Expression) => {
        if (expr.type !== "NumberLiteral") return
        if (vmStructuralNumbers.has(expr)) return
        if (!isEligible(expr.value)) return
        if (Math.random() >= probability) return

        return encodeMBA(expr.value)
    })
}
