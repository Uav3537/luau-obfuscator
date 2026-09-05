import type {
    Identifier, StringLiteral, NumberLiteral, BinaryExpression, UnaryExpression,
    CallExpression, MemberExpression, IndexExpression,
    ParenthesizedExpression, Expression, TableExpression, TableField,
    LocalStatement, LocalFunctionStatement, FunctionBody, FunctionParameter,
    TypedIdentifier, Block, Statement, AssignmentStatement, NumericForStatement,
    ReturnStatement, DoStatement, IfStatement, IfClause, VarargExpression,
    FunctionExpression, BooleanLiteral, NilLiteral, WhileStatement,
} from "luau-parser"

/** 합성 노드는 실제 소스 위치가 없으므로 0으로 채움(printer는 구조만 봄). */
const POS = { start: 0, end: 0 }

export function identifier(name: string): Identifier {
    return { type: "Identifier", name, line: POS, column: POS }
}

export function typedIdentifier(name: string): TypedIdentifier {
    return { type: "TypedIdentifier", name, line: POS, column: POS }
}

export function stringLiteral(value: string): StringLiteral {
    return { type: "StringLiteral", value, raw: JSON.stringify(value), line: POS, column: POS }
}

export function numberLiteral(value: number): NumberLiteral {
    return { type: "NumberLiteral", value, raw: String(value), line: POS, column: POS }
}

export function binary(
    operator: BinaryExpression["operator"],
    left: Expression,
    right: Expression,
): BinaryExpression {
    return { type: "BinaryExpression", operator, left, right, line: POS, column: POS }
}

export function unary(operator: UnaryExpression["operator"], argument: Expression): UnaryExpression {
    return { type: "UnaryExpression", operator, argument, line: POS, column: POS }
}

export function call(callee: Expression, args: Expression[]): CallExpression {
    return { type: "CallExpression", callee, arguments: args, line: POS, column: POS }
}

export function member(object: Expression, property: string): MemberExpression {
    return { type: "MemberExpression", object, property: identifier(property), line: POS, column: POS }
}

export function index(object: Expression, key: Expression): IndexExpression {
    return { type: "IndexExpression", object, index: key, line: POS, column: POS }
}

export function paren(expression: Expression): ParenthesizedExpression {
    return { type: "ParenthesizedExpression", expression, line: POS, column: POS }
}

export function table(fields: TableField[]): TableExpression {
    return { type: "TableExpression", fields, line: POS, column: POS }
}

export function computedField(key: Expression, value: Expression): TableField {
    return { type: "TableFieldComputed", key, value }
}

export function positionalField(value: Expression): TableField {
    return { type: "TableFieldPositional", value }
}

export function namedField(name: string, value: Expression): TableField {
    return { type: "TableFieldNamed", name: identifier(name), value }
}

export function booleanLiteral(value: boolean): BooleanLiteral {
    return { type: "BooleanLiteral", value, line: POS, column: POS }
}

export function nilLiteral(): NilLiteral {
    return { type: "NilLiteral", line: POS, column: POS }
}

export function localStatement(name: string, init: Expression): LocalStatement {
    return {
        type: "LocalStatement",
        names: [typedIdentifier(name)],
        init: [init],
        line: POS,
        column: POS,
    }
}

export function block(statements: Statement[]): Block {
    return { type: "Block", statements, line: POS, column: POS }
}

export function assignmentStatement(targets: Expression[], values: Expression[]): AssignmentStatement {
    return { type: "AssignmentStatement", targets, values, line: POS, column: POS }
}

export function returnStatement(args: Expression[]): ReturnStatement {
    return { type: "ReturnStatement", arguments: args, line: POS, column: POS }
}

export function numericForStatement(
    variableName: string,
    start: Expression,
    end: Expression,
    body: Block,
): NumericForStatement {
    return {
        type: "NumericForStatement",
        variable: typedIdentifier(variableName),
        start,
        end,
        body,
        line: POS,
        column: POS,
    }
}

export function functionParam(name: string): FunctionParameter {
    return { type: "FunctionParameter", name, line: POS, column: POS }
}

export function functionBody(params: FunctionParameter[], body: Block, hasVarargs = false): FunctionBody {
    return {
        type: "FunctionBody", generics: [], params, hasVarargs, body, line: POS, column: POS,
    }
}

export function functionExpression(func: FunctionBody): FunctionExpression {
    return { type: "FunctionExpression", func, line: POS, column: POS }
}

export function localFunctionStatement(name: string, func: FunctionBody): LocalFunctionStatement {
    return {
        type: "LocalFunctionStatement", name: identifier(name), func, line: POS, column: POS,
    }
}

export function doStatement(body: Block): DoStatement {
    return { type: "DoStatement", body, line: POS, column: POS }
}

export function ifClause(condition: Expression, body: Block): IfClause {
    return { type: "IfClause", condition, body, line: POS, column: POS }
}

export function ifStatement(clauses: IfClause[], alternate?: Block): IfStatement {
    return { type: "IfStatement", clauses, alternate, line: POS, column: POS }
}

export function whileStatement(condition: Expression, body: Block): WhileStatement {
    return { type: "WhileStatement", condition, body, line: POS, column: POS }
}

export function vararg(): VarargExpression {
    return { type: "VarargExpression", line: POS, column: POS }
}