import type {
    Program, Block, Statement, Expression,
} from "luau-parser"
import {
    identifier, numberLiteral, stringLiteral, booleanLiteral, nilLiteral,
    binary, unary, table, positionalField, localStatement, doStatement,
    ifStatement, ifClause, whileStatement, numericForStatement, repeatStatement,
    localFunctionStatement, functionBody, functionParam, block, call, member,
    callStatement, assignmentStatement, index,
} from "./nodeFactory"
import { opaqueTrueExpr, opaqueFalseExpr } from "./predicates"

export interface InsertJunkOptions {
    /** 기존 statement 하나 앞에 junk를 끼워넣을 확률 (0~1) */
    probability: number
    /** 블록 하나당 최대 삽입 개수 */
    maxPerBlock: number
}

const LIVE_DEPTH = 2
const DEAD_DEPTH = 2

function randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min
}

function randomName(): string {
    return "_" + globalThis.crypto.randomUUID().replace(/-/g, "")
}

/** 짧은 무작위 식별자/문자열 조각. */
function randomWord(): string {
    return "_" + Math.random().toString(36).slice(2, 2 + randomInt(3, 9))
}

function pick<T>(arr: Array<() => T>): T {
    return arr[randomInt(0, arr.length - 1)]()
}

// ---------------------------------------------------------------------------
// LIVE junk: 실행돼도 "관찰 가능한 부작용 없음 + 런타임 에러 없음"이 보장돼야 한다.
//   - 호출/인덱싱/멤버접근/혼합타입 연산 금지(런타임 에러 위험).
//   - 산술은 숫자끼리 +,-,* 만. 그 외에는 단독 리터럴/테이블.
// ---------------------------------------------------------------------------

/** 숫자끼리의 +,-,* 트리. 항상 number라 런타임 에러가 날 수 없다. */
function liveNumberExpr(depth: number): Expression {
    if (depth <= 0) return numberLiteral(randomInt(1, 999999))
    const op = (["+", "-", "*"] as const)[randomInt(0, 2)]
    return binary(op, liveNumberExpr(depth - 1), liveNumberExpr(depth - 1))
}

function liveLeaf(): Expression {
    return pick<Expression>([
        () => numberLiteral(randomInt(1, 999999)),
        () => stringLiteral(randomWord()),
        () => booleanLiteral(Math.random() < 0.5),
        () => nilLiteral(),
    ])
}

function liveJunkExpr(depth: number): Expression {
    if (depth <= 0) return liveLeaf()
    return pick<Expression>([
        () => liveLeaf(),
        () => liveNumberExpr(depth),
        // 테이블 리터럴(필드는 숫자/문자열만 — 생성만 하고 인덱싱 안 하므로 안전).
        () => table(
            Array.from({ length: randomInt(1, 4) }, () =>
                positionalField(Math.random() < 0.5
                    ? numberLiteral(randomInt(1, 9999))
                    : stringLiteral(randomWord()))),
        ),
    ])
}

// ---------------------------------------------------------------------------
// DEAD junk: 절대 실행되지 않는 분기(opaque-false if / while-false / for 1,0 /
//   미호출 함수 본문) 안에만 들어간다. 실행되지 않으므로 nil 호출/인덱싱/혼합
//   연산/error 등 "그럴듯하지만 위험한" 코드를 마음껏 넣어 역분석을 교란한다.
//   (문법적으로만 유효하면 된다. return/break/continue는 "블록 끝에만" 제약이
//    있어 넣지 않는다.)
// ---------------------------------------------------------------------------

function deadExpr(depth: number): Expression {
    if (depth <= 0) return liveLeaf()
    return pick<Expression>([
        () => liveLeaf(),
        () => binary((["+", "-", "*", "/", "%", ".."] as const)[randomInt(0, 5)],
            deadExpr(depth - 1), deadExpr(depth - 1)),
        () => call(identifier(randomName()), [deadExpr(depth - 1)]),        // nil 호출 (dead)
        () => index(identifier(randomName()), deadExpr(depth - 1)),         // nil 인덱싱 (dead)
        () => member(identifier(randomName()), randomWord()),               // nil.field (dead)
        () => unary("#", deadExpr(depth - 1)),                              // #nil (dead)
        () => call(member(identifier("string"), "format"),
            [stringLiteral("%d:%s"), deadExpr(depth - 1), deadExpr(depth - 1)]),
    ])
}

function deadJunkStatement(depth: number): Statement {
    const flat: Array<() => Statement> = [
        () => localStatement(randomName(), deadExpr(depth)),
        () => assignmentStatement([identifier(randomName())], [deadExpr(depth)]),
        () => callStatement(call(identifier(randomName()), [deadExpr(depth)])),
        () => callStatement(call(identifier("error"), [stringLiteral(randomWord())])),
    ]
    if (depth <= 0) return pick(flat)

    const nested: Array<() => Statement> = [
        () => doStatement(block(deadJunkStatements(depth - 1))),
        () => ifStatement([ifClause(opaqueFalseExpr(), block(deadJunkStatements(depth - 1)))]),
        () => whileStatement(opaqueFalseExpr(), block(deadJunkStatements(depth - 1))),
    ]
    return pick([...flat, ...nested])
}

function deadJunkStatements(depth: number): Statement[] {
    return Array.from({ length: randomInt(1, 3) }, () => deadJunkStatement(depth))
}

/**
 * 실행돼도 부작용이 전혀 없는 더미 statement 하나를 만든다. 10종 변형:
 *   1. live local 선언
 *   2. live do-블록
 *   3. opaque-true로 감싼 live 분기(+선택적 dead else)
 *   4. opaque-false dead if
 *   5. while-false dead 루프
 *   6. `for i=1,0`(절대 안 도는) dead 루프
 *   7. `repeat … until true`(한 번만 도는) live
 *   8. 호출되지 않는 local function(본문은 dead)
 *   9. do-블록 안 live 대입 체인
 *  10. 작게 도는(1~3회) 무해한 live 루프
 *
 * 매번 새 랜덤 이름을 쓰므로 실제 변수와 충돌하지 않고, opaque 술어는 자명한
 * `숫자==숫자`가 아니라 정수 항등식 기반이라 단순 패턴 매칭으로는 걸러내기 어렵다.
 */
function buildJunkStatement(): Statement {
    return pick<Statement>([
        // 1
        () => localStatement(randomName(), liveJunkExpr(LIVE_DEPTH)),
        // 2
        () => doStatement(block([
            localStatement(randomName(), liveJunkExpr(LIVE_DEPTH)),
            localStatement(randomName(), liveJunkExpr(1)),
        ])),
        // 3
        () => ifStatement(
            [ifClause(opaqueTrueExpr(), block([localStatement(randomName(), liveJunkExpr(LIVE_DEPTH))]))],
            Math.random() < 0.5 ? block(deadJunkStatements(1)) : undefined,
        ),
        // 4
        () => ifStatement([ifClause(opaqueFalseExpr(), block(deadJunkStatements(DEAD_DEPTH)))]),
        // 5
        () => whileStatement(opaqueFalseExpr(), block(deadJunkStatements(DEAD_DEPTH))),
        // 6
        () => numericForStatement(randomName(), numberLiteral(1), numberLiteral(0),
            block(deadJunkStatements(DEAD_DEPTH))),
        // 7
        () => repeatStatement(
            block([localStatement(randomName(), liveJunkExpr(LIVE_DEPTH))]),
            booleanLiteral(true),
        ),
        // 8
        () => localFunctionStatement(randomName(),
            functionBody([functionParam(randomName())], block(deadJunkStatements(DEAD_DEPTH)))),
        // 9
        () => {
            const a = randomName()
            return doStatement(block([
                localStatement(a, numberLiteral(randomInt(1, 9999))),
                assignmentStatement([identifier(a)], [binary("+", identifier(a), numberLiteral(randomInt(1, 9999)))]),
            ]))
        },
        // 10
        () => {
            const f = randomName()
            return numericForStatement(f, numberLiteral(1), numberLiteral(randomInt(1, 3)),
                block([localStatement(randomName(), binary("*", identifier(f), numberLiteral(randomInt(1, 99))))]))
        },
    ])
}

export function runInsertJunk(program: Program, options: InsertJunkOptions): void {
    function processExpr(expr: Expression): void {
        switch (expr.type) {
            case "InterpolatedStringExpression":
                for (const part of expr.parts) {
                    if (part.kind === "expression") processExpr(part.expression)
                }
                return
            case "FunctionExpression":
                processBlock(expr.func.body)
                return
            case "TableExpression":
                for (const field of expr.fields) {
                    if (field.type === "TableFieldPositional") processExpr(field.value)
                    else if (field.type === "TableFieldNamed") processExpr(field.value)
                    else { processExpr(field.key); processExpr(field.value) }
                }
                return
            case "BinaryExpression":
                processExpr(expr.left)
                processExpr(expr.right)
                return
            case "UnaryExpression":
                processExpr(expr.argument)
                return
            case "MemberExpression":
                processExpr(expr.object)
                return
            case "IndexExpression":
                processExpr(expr.object)
                processExpr(expr.index)
                return
            case "CallExpression":
                processExpr(expr.callee)
                expr.arguments.forEach(processExpr)
                return
            case "MethodCallExpression":
                processExpr(expr.object)
                expr.arguments.forEach(processExpr)
                return
            case "ParenthesizedExpression":
                processExpr(expr.expression)
                return
            case "TypeAssertionExpression":
                processExpr(expr.expression)
                return
            case "IfElseExpression":
                for (const clause of expr.clauses) {
                    processExpr(clause.condition)
                    processExpr(clause.body)
                }
                processExpr(expr.alternate)
                return
            default:
                return
        }
    }

    function processStatement(stmt: Statement): void {
        switch (stmt.type) {
            case "LocalStatement":
                stmt.init.forEach(processExpr)
                return
            case "LocalFunctionStatement":
                processBlock(stmt.func.body)
                return
            case "FunctionDeclarationStatement":
                processBlock(stmt.func.body)
                return
            case "AssignmentStatement":
                stmt.targets.forEach(processExpr)
                stmt.values.forEach(processExpr)
                return
            case "CompoundAssignmentStatement":
                processExpr(stmt.target)
                processExpr(stmt.value)
                return
            case "CallStatement":
                processExpr(stmt.expression)
                return
            case "DoStatement":
                processBlock(stmt.body)
                return
            case "WhileStatement":
                processExpr(stmt.condition)
                processBlock(stmt.body)
                return
            case "RepeatStatement":
                processBlock(stmt.body)
                processExpr(stmt.condition)
                return
            case "IfStatement":
                for (const clause of stmt.clauses) {
                    processExpr(clause.condition)
                    processBlock(clause.body)
                }
                if (stmt.alternate) processBlock(stmt.alternate)
                return
            case "NumericForStatement":
                processExpr(stmt.start)
                processExpr(stmt.end)
                if (stmt.step) processExpr(stmt.step)
                processBlock(stmt.body)
                return
            case "GenericForStatement":
                stmt.iterators.forEach(processExpr)
                processBlock(stmt.body)
                return
            case "ReturnStatement":
                stmt.arguments.forEach(processExpr)
                return
            default:
                return
        }
    }

    /** 자식 블록들을 먼저 처리한 뒤(재귀 무한 방지 — 새로 끼워넣는 junk는 다시
     *  처리하지 않음), 현재 블록에 junk를 끼워넣는다. junk는 기존 statement "앞"에만
     *  넣으므로 return/break/continue(항상 블록 맨 끝에만 올 수 있음) 뒤에 잘못
     *  삽입될 일이 없다. */
    function processBlock(blk: Block): void {
        for (const stmt of blk.statements) processStatement(stmt)

        const result: Statement[] = []
        let inserted = 0
        for (const stmt of blk.statements) {
            if (inserted < options.maxPerBlock && Math.random() < options.probability) {
                result.push(buildJunkStatement())
                inserted++
            }
            result.push(stmt)
        }
        blk.statements = result
    }

    processBlock(program.body)
}
