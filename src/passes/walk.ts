import type {
    Program, Block, Statement, Expression, FunctionBody,
} from "luau-parser"

export type ExpressionVisitor = (expr: Expression) => Expression | undefined | void

function visitArray(arr: Expression[], visitor: ExpressionVisitor): void {
    for (let i = 0; i < arr.length; i++) {
        arr[i] = mapExpression(arr[i], visitor)
    }
}

export function mapExpression(expr: Expression, visitor: ExpressionVisitor): Expression {
    switch (expr.type) {
        case "InterpolatedStringExpression":
            for (const part of expr.parts) {
                if (part.kind === "expression") {
                    part.expression = mapExpression(part.expression, visitor)
                }
            }
            break

        case "FunctionExpression":
            walkFunctionBody(expr.func, visitor)
            break

        case "TableExpression":
            for (const field of expr.fields) {
                if (field.type === "TableFieldPositional") {
                    field.value = mapExpression(field.value, visitor)
                } else if (field.type === "TableFieldNamed") {
                    field.value = mapExpression(field.value, visitor)
                } else if (field.type === "TableFieldComputed") {
                    field.key = mapExpression(field.key, visitor)
                    field.value = mapExpression(field.value, visitor)
                }
            }
            break

        case "BinaryExpression":
            expr.left = mapExpression(expr.left, visitor)
            expr.right = mapExpression(expr.right, visitor)
            break

        case "UnaryExpression":
            expr.argument = mapExpression(expr.argument, visitor)
            break

        case "MemberExpression":
            expr.object = mapExpression(expr.object, visitor)
            break

        case "IndexExpression":
            expr.object = mapExpression(expr.object, visitor)
            expr.index = mapExpression(expr.index, visitor)
            break

        case "CallExpression":
            expr.callee = mapExpression(expr.callee, visitor)
            visitArray(expr.arguments, visitor)
            break

        case "MethodCallExpression":
            expr.object = mapExpression(expr.object, visitor)
            visitArray(expr.arguments, visitor)
            break

        case "ParenthesizedExpression":
            expr.expression = mapExpression(expr.expression, visitor)
            break

        case "TypeAssertionExpression":
            expr.expression = mapExpression(expr.expression, visitor)
            break

        case "IfElseExpression":
            for (const clause of expr.clauses) {
                clause.condition = mapExpression(clause.condition, visitor)
                clause.body = mapExpression(clause.body, visitor)
            }
            expr.alternate = mapExpression(expr.alternate, visitor)
            break
    }

    return visitor(expr) ?? expr
}

function walkFunctionBody(func: FunctionBody, visitor: ExpressionVisitor): void {
    walkBlock(func.body, visitor)
}

function walkBlock(block: Block, visitor: ExpressionVisitor): void {
    for (const stmt of block.statements) walkStatement(stmt, visitor)
}

function walkStatement(stmt: Statement, visitor: ExpressionVisitor): void {
    switch (stmt.type) {
        case "LocalStatement":
            visitArray(stmt.init, visitor)
            return

        case "LocalFunctionStatement":
            walkFunctionBody(stmt.func, visitor)
            return

        case "FunctionDeclarationStatement":
            walkFunctionBody(stmt.func, visitor)
            return

        case "AssignmentStatement":
            visitArray(stmt.targets, visitor)
            visitArray(stmt.values, visitor)
            return

        case "CompoundAssignmentStatement":
            stmt.target = mapExpression(stmt.target, visitor)
            stmt.value = mapExpression(stmt.value, visitor)
            return

        case "CallStatement":
            stmt.expression = mapExpression(stmt.expression, visitor) as typeof stmt.expression
            return

        case "DoStatement":
            walkBlock(stmt.body, visitor)
            return

        case "WhileStatement":
            stmt.condition = mapExpression(stmt.condition, visitor)
            walkBlock(stmt.body, visitor)
            return

        case "RepeatStatement":
            walkBlock(stmt.body, visitor)
            stmt.condition = mapExpression(stmt.condition, visitor)
            return

        case "IfStatement":
            for (const clause of stmt.clauses) {
                clause.condition = mapExpression(clause.condition, visitor)
                walkBlock(clause.body, visitor)
            }
            if (stmt.alternate) walkBlock(stmt.alternate, visitor)
            return

        case "NumericForStatement":
            stmt.start = mapExpression(stmt.start, visitor)
            stmt.end = mapExpression(stmt.end, visitor)
            if (stmt.step) stmt.step = mapExpression(stmt.step, visitor)
            walkBlock(stmt.body, visitor)
            return

        case "GenericForStatement":
            visitArray(stmt.iterators, visitor)
            walkBlock(stmt.body, visitor)
            return

        case "ReturnStatement":
            visitArray(stmt.arguments, visitor)
            return

        case "BreakStatement":
        case "ContinueStatement":
        case "TypeAliasStatement":
        case "ExportTypeAliasStatement":
            return
    }
}

/** Program 전체를 순회하며 모든 Expression 노드에 visitor를 적용(제자리 변형). */
export function transformExpressions(program: Program, visitor: ExpressionVisitor): void {
    walkBlock(program.body, visitor)
}
