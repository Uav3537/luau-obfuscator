import type { Expression } from "luau-parser"
import { numberLiteral, binary, paren } from "./nodeFactory"

/**
 * "모든 정수에 대해 항상 참/거짓"인 조건식을 만드는 공용 헬퍼.
 * OpaquePredicates(실제 코드를 감싸는 쪽)와 InsertJunk(정크 분기를 지키는 쪽)에서
 * 공유한다.
 *
 * 리터럴 상수만 쓰므로 뒤에서 도는 숫자 난독화 패스(NumbersToExpressions 등)가
 * 상수를 런타임 식으로 바꾸면 단순 상수 접기(constant folding)로는 참/거짓을
 * 판정하기 어려워진다. (정보이론적으로 안전한 건 아니다 — 완전 평가기는 여전히
 * 접을 수 있다. `숫자 == 다른숫자` 수준의 자명한 술어보다 한 단계 올리는 용도.)
 */

function randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min
}

/** 모든 피연산자를 괄호로 감싸 연산자 우선순위에 의존하지 않는다(printer는
 *  ParenthesizedExpression을 그대로 `( … )`로 찍는다). */
function p(e: Expression): Expression {
    return paren(e)
}

/**
 * 항상 참(∀ 정수 n):
 *   - n·(n+1) 은 짝수            -> (n*n + n) % 2 == 0
 *   - 완전제곱수 mod 4 ∈ {0,1}   -> (n*n) % 4 ~= 2,  (n*n) % 4 ~= 3
 *   - 완전제곱수 mod 7 ∈{0,1,2,4}-> (n*n + 1) % 7 ~= 0
 */
export function opaqueTrueExpr(): Expression {
    const v = randomInt(2, 5000)
    const sq = () => p(binary("*", numberLiteral(v), numberLiteral(v)))

    const templates: Array<() => Expression> = [
        () => binary("==", p(binary("%", p(binary("+", sq(), numberLiteral(v))), numberLiteral(2))), numberLiteral(0)),
        () => binary("~=", p(binary("%", sq(), numberLiteral(4))), numberLiteral(2)),
        () => binary("~=", p(binary("%", sq(), numberLiteral(4))), numberLiteral(3)),
        () => binary("~=", p(binary("%", p(binary("+", sq(), numberLiteral(1))), numberLiteral(7))), numberLiteral(0)),
    ]
    return templates[randomInt(0, templates.length - 1)]()
}

/**
 * 항상 거짓(∀ 정수 n): 위 항등식들의 부정형. 절대 실행되지 않는 dead 분기를
 * 지키는 데 쓴다 — dead 본문은 실행되지 않으므로 더 과감한(호출/인덱싱 등) 정크를
 * 안전하게 넣을 수 있다.
 */
export function opaqueFalseExpr(): Expression {
    const v = randomInt(2, 5000)
    const sq = () => p(binary("*", numberLiteral(v), numberLiteral(v)))

    const templates: Array<() => Expression> = [
        () => binary("~=", p(binary("%", p(binary("+", sq(), numberLiteral(v))), numberLiteral(2))), numberLiteral(0)),
        () => binary("==", p(binary("%", sq(), numberLiteral(4))), numberLiteral(2)),
        () => binary("==", p(binary("%", sq(), numberLiteral(4))), numberLiteral(3)),
        () => binary("==", p(binary("%", p(binary("+", sq(), numberLiteral(1))), numberLiteral(7))), numberLiteral(0)),
    ]
    return templates[randomInt(0, templates.length - 1)]()
}
