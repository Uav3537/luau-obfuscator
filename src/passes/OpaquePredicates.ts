import type {
    Program, Block, Statement, Expression,
} from "luau-parser"
import {
    numberLiteral, binary, ifStatement, ifClause, block, localStatement,
} from "./nodeFactory"
import { opaqueTrueExpr } from "./predicates"

export interface OpaquePredicatesOptions {
    /** 감쌀 수 있는 statement 하나를 실제로 감쌀 확률 (0~1). */
    probability?: number
    /** true면 `else`에 절대 실행되지 않는 더미 분기를 붙여 혼란을 키운다. */
    deadBranch?: boolean
}

function randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min
}

function randomName(): string {
    return "_" + globalThis.crypto.randomUUID().replace(/-/g, "")
}

/** 절대 실행되지 않는(dead) 더미 statement. 자기 완결적이라 다른 변수와
 *  충돌하지 않고, 어차피 도달 불가라 부작용도 없다. */
function deadStatement(): Statement {
    const op = Math.random() < 0.5 ? "+" : "*"
    return localStatement(
        randomName(),
        binary(op, numberLiteral(randomInt(1, 999)), numberLiteral(randomInt(1, 999))),
    )
}

/**
 * local 선언 계열은 감싸면 안 된다. `if … then local x = 1 end`로 감싸면 x가
 * if 블록 스코프에 갇혀 바깥 형제 statement에서 보이지 않게 되기 때문이다.
 * 나머지(대입/호출/제어문/return/break/continue 등)는 블록 스코프 바인딩을
 * 새로 만들지 않으므로 감싸도 의미가 보존된다.
 */
function isWrappable(stmt: Statement): boolean {
    switch (stmt.type) {
        case "LocalStatement":
        case "LocalFunctionStatement":
        case "TypeAliasStatement":
        case "ExportTypeAliasStatement":
            return false
        default:
            return true
    }
}

/**
 * 불투명 조건식(opaque predicate) 삽입.
 *
 * 감쌀 수 있는 statement를 `if <항상참> then stmt [else <dead>] end`로 감싼다.
 * return/break/continue는 "블록의 마지막 statement"라는 제약이 있는데, 이들을
 * 감싸도 결과 if 문이 블록의 마지막이 되고 그 안에서 마지막 statement로 남으므로
 * 문법적으로 문제없다.
 */
export function runOpaquePredicates(program: Program, options: OpaquePredicatesOptions): void {
    const probability = options.probability ?? 0.4
    const deadBranch = options.deadBranch ?? true

    function wrap(stmt: Statement): Statement {
        const clause = ifClause(opaqueTrueExpr(), block([stmt]))
        return deadBranch
            ? ifStatement([clause], block([deadStatement()]))
            : ifStatement([clause])
    }

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

    /** 자식 블록들을 먼저 처리한 뒤(새로 만든 wrapper는 다시 처리하지 않음),
     *  현재 블록의 감쌀 수 있는 statement들을 확률적으로 감싼다. */
    function processBlock(blk: Block): void {
        for (const stmt of blk.statements) processStatement(stmt)

        blk.statements = blk.statements.map((stmt) =>
            (isWrappable(stmt) && Math.random() < probability ? wrap(stmt) : stmt))
    }

    processBlock(program.body)
}
