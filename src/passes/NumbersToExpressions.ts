import type { Program, Expression, Statement } from "luau-parser"
import { transformExpressions } from "./walk"
import {
    numberLiteral, binary, paren, identifier, call, index, table, positionalField,
    localStatement, localFunctionStatement, functionParam, functionBody, functionExpression,
    block, assignmentStatement, numericForStatement, whileStatement, ifStatement, ifClause,
    returnStatement, unary, vmStructuralNumbers,
} from "./nodeFactory"

export interface NumbersToExpressionsOptions {
    /** 랜덤 보조항의 최소 절댓값 */
    min: number
    /** 랜덤 보조항의 최대 절댓값 */
    max: number
    /**
     * 0~1. 정수 리터럴을 순수 산술식(depth 얕은 a+b 형태) 대신
     * for/while 루프나 재귀 함수 호출로 "런타임에 조립"할 확률.
     * 단순 트리 순회형 상수 접기(constant folding)는 문(statement)/제어흐름을
     * 해석하지 못하므로 이 경로로 만든 값은 그런 도구로는 복원되지 않는다.
     * 기본값 0.35.
     */
    controlFlowProbability?: number
}

const MAX_DEPTH = 1
const NEST_PROBABILITY = 0.35
const CONTROL_FLOW_PROBABILITY_DEFAULT = 0.35

function randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min
}

function randomName(): string {
    return "_" + globalThis.crypto.randomUUID().replace(/-/g, "")
}

function randSign(): 1 | -1 {
    return Math.random() < 0.5 ? 1 : -1
}

/** (function() ... end)() — 문(statement)들을 하나의 표현식으로 감싸는 즉시실행 함수. */
function iife(statements: Statement[]): Expression {
    return call(paren(functionExpression(functionBody([], block(statements)))), [])
}

type Strategy = "add" | "sub" | "mul"

/** value를 min~max 범위 정수로 나눌 수 있으면 mul도 후보에 추가 */
function pickStrategy(value: number, min: number, max: number): Strategy {
    const candidates: Strategy[] = ["add", "sub"]
    if (value !== 0) {
        for (let a = min; a <= max; a++) {
            if (a !== 0 && value % a === 0) {
                candidates.push("mul")
                break
            }
        }
    }
    return candidates[randomInt(0, candidates.length - 1)]
}

/** 확률적으로 피연산자를 리터럴 대신 한 단계 더 중첩된 식으로 치환 */
function operand(n: number, min: number, max: number, depth: number): Expression {
    if (depth < MAX_DEPTH && Math.random() < NEST_PROBABILITY) {
        return buildNumberExpr(n, min, max, depth + 1)
    }
    return numberLiteral(n)
}

/** 얕은 산술식(a+b, a-b, a*b) 하나로 값을 위장 — 기존 방식, 가벼운 기본 경로로 유지. */
function buildNumberExpr(value: number, min: number, max: number, depth = 0): Expression {
    const strategy = pickStrategy(value, min, max)
    let inner: Expression

    switch (strategy) {
        case "add": {
            const a = randomInt(min, max) * randSign()
            const b = value - a
            inner = binary("+", operand(a, min, max, depth), operand(b, min, max, depth))
            break
        }
        case "sub": {
            const a = randomInt(min, max) * randSign()
            const b = a - value
            inner = binary("-", operand(a, min, max, depth), operand(b, min, max, depth))
            break
        }
        case "mul": {
            let a = 1
            for (let cand = min; cand <= max; cand++) {
                if (cand !== 0 && value % cand === 0) {
                    a = cand
                    break
                }
            }
            const b = value / a
            inner = binary("*", operand(a, min, max, depth), operand(b, min, max, depth))
            break
        }
    }

    return paren(inner)
}

/** n개의 정수 조각(합이 정확히 value)으로 분할. 마지막 조각은 나머지를 정확히 채운다. */
function randomPartition(value: number, n: number, min: number, max: number): number[] {
    const parts: number[] = []
    let remaining = value
    for (let i = 0; i < n - 1; i++) {
        const part = randomInt(min, max) * randSign()
        parts.push(part)
        remaining -= part
    }
    parts.push(remaining)
    return parts
}

/**
 *   (function()
 *       local steps = { s1, s2, ..., sn }
 *       local acc = 0
 *       for i = 1, #steps do
 *           acc = acc + steps[i]
 *       end
 *       return acc
 *   end)()
 */
function buildForLoopNumberExpr(value: number, min: number, max: number): Expression {
    const n = randomInt(3, 6)
    const steps = randomPartition(value, n, min, max)

    const accVar = randomName()
    const stepsVar = randomName()
    const iVar = randomName()

    const stmts: Statement[] = [
        localStatement(stepsVar, table(steps.map((s) => positionalField(numberLiteral(s))))),
        localStatement(accVar, numberLiteral(0)),
        numericForStatement(
            iVar,
            numberLiteral(1),
            unary("#", identifier(stepsVar)),
            block([
                assignmentStatement(
                    [identifier(accVar)],
                    [binary("+", identifier(accVar), index(identifier(stepsVar), identifier(iVar)))],
                ),
            ]),
        ),
        returnStatement([identifier(accVar)]),
    ]

    return iife(stmts)
}

/**
 *   (function()
 *       local acc = BASE
 *       local n = N
 *       while n > 0 do
 *           acc = acc + STEP
 *           n = n - 1
 *       end
 *       return acc
 *   end)()
 */
function buildWhileLoopNumberExpr(value: number, min: number, max: number): Expression {
    const n = randomInt(3, 6)
    const step = randomInt(min, max) * randSign()
    const base = value - n * step

    const accVar = randomName()
    const nVar = randomName()

    const stmts: Statement[] = [
        localStatement(accVar, numberLiteral(base)),
        localStatement(nVar, numberLiteral(n)),
        whileStatement(
            binary(">", identifier(nVar), numberLiteral(0)),
            block([
                assignmentStatement([identifier(accVar)], [binary("+", identifier(accVar), numberLiteral(step))]),
                assignmentStatement([identifier(nVar)], [binary("-", identifier(nVar), numberLiteral(1))]),
            ]),
        ),
        returnStatement([identifier(accVar)]),
    ]

    return iife(stmts)
}

/**
 *   (function()
 *       local function <rec>(n)
 *           if n <= 0 then
 *               return BASE
 *           end
 *           return STEP + <rec>(n - 1)
 *       end
 *       return <rec>(N)
 *   end)()
 */
function buildRecursiveNumberExpr(value: number, min: number, max: number): Expression {
    const n = randomInt(3, 6)
    const step = randomInt(min, max) * randSign()
    const base = value - n * step

    const recName = randomName()
    const nParam = randomName()

    const body = block([
        ifStatement([
            ifClause(
                binary("<=", identifier(nParam), numberLiteral(0)),
                block([returnStatement([numberLiteral(base)])]),
            ),
        ]),
        returnStatement([
            binary(
                "+",
                numberLiteral(step),
                call(identifier(recName), [binary("-", identifier(nParam), numberLiteral(1))]),
            ),
        ]),
    ])

    return iife([
        localFunctionStatement(recName, functionBody([functionParam(nParam)], body)),
        returnStatement([call(identifier(recName), [numberLiteral(n)])]),
    ])
}

type ControlFlowStrategy = "forLoop" | "whileLoop" | "recursive"

function pickControlFlowStrategy(): ControlFlowStrategy {
    const options: ControlFlowStrategy[] = ["forLoop", "whileLoop", "recursive"]
    return options[randomInt(0, options.length - 1)]
}

function buildControlFlowNumberExpr(value: number, min: number, max: number): Expression {
    switch (pickControlFlowStrategy()) {
        case "forLoop":
            return buildForLoopNumberExpr(value, min, max)
        case "whileLoop":
            return buildWhileLoopNumberExpr(value, min, max)
        case "recursive":
            return buildRecursiveNumberExpr(value, min, max)
    }
}

export function runNumbersToExpressions(program: Program, options: NumbersToExpressionsOptions): void {
    const controlFlowProbability = options.controlFlowProbability ?? CONTROL_FLOW_PROBABILITY_DEFAULT

    transformExpressions(program, (expr) => {
        if (expr.type !== "NumberLiteral") return
        // Vmify가 만든 op/a/b/c 같은 내부 메타데이터는 건드리지 않는다
        // (개수가 코드 크기에 비례해 폭증하고, 로직은 이미 Vmify가 구조적으로 숨긴 값).
        if (vmStructuralNumbers.has(expr)) return

        // 루프/재귀 조립은 정수 배분(합이 정확히 일치)에 의존하므로 정수에만 적용하고,
        // 실수/범위를 벗어난 값은 기존 산술식 위장으로 처리한다.
        if (Number.isInteger(expr.value) && Math.random() < controlFlowProbability) {
            return buildControlFlowNumberExpr(expr.value, options.min, options.max)
        }

        return buildNumberExpr(expr.value, options.min, options.max)
    })
}