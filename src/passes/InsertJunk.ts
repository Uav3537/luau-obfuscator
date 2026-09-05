import type {
    Program, Block, Statement, Expression,
} from "luau-parser"
import {
    identifier, numberLiteral, binary, localStatement, doStatement, block,
    ifStatement, ifClause,
} from "./nodeFactory"

export interface InsertJunkOptions {
    /** 기존 statement 하나 앞에 junk를 끼워넣을 확률 (0~1) */
    probability: number
    /** 블록 하나당 최대 삽입 개수 */
    maxPerBlock: number
}

function randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min
}

function randomName(): string {
    return "_" + globalThis.crypto.randomUUID().replace(/-/g, "")
}

function junkNumberExpr(): Expression {
    const op = Math.random() < 0.5 ? "+" : "*"
    return binary(op, numberLiteral(randomInt(1, 999)), numberLiteral(randomInt(1, 999)))
}

/**
 * 실행돼도 관찰 가능한 부작용이 전혀 없는 더미 statement 하나를 만듦.
 * - 매번 새 랜덤 이름을 쓰므로 다른 변수와 충돌하지 않음
 * - if 분기 조건이 실제로 참/거짓 어느 쪽이어도 몸통이 쓸모없는 local 선언뿐이라
 *   상관없음 (opaque predicate를 엄밀하게 항상 거짓으로 만들 필요가 없음)
 */
function buildJunkStatement(): Statement {
    const variants: Array<() => Statement> = [
        () => localStatement(randomName(), junkNumberExpr()),
        () => doStatement(block([localStatement(randomName(), junkNumberExpr())])),
        () => ifStatement([
            ifClause(
                binary("==", numberLiteral(randomInt(1, 999)), numberLiteral(randomInt(1, 999))),
                block([localStatement(randomName(), junkNumberExpr())]),
            ),
        ]),
    ]
    return variants[randomInt(0, variants.length - 1)]()
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

    /** 자식 블록들부터 먼저 처리한 뒤(재귀 무한 방지 — 새로 끼워넣는 junk는
     *  다시 처리하지 않음), 현재 블록에 junk를 끼워넣음. junk는 기존 statement
     *  "앞"에만 넣으므로 return/break/continue(항상 블록 맨 끝에만 올 수 있음)
     *  뒤에 잘못 삽입될 일이 없음. */
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