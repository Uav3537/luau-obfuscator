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

/**
 * Vmify가 인스트럭션 op/a/b/c, numParams, maxRegs 같은 "VM 구조 메타데이터"용으로
 * 찍어내는 숫자는 이 표시를 달아 만든다. 이런 값은 원본 소스에 쓰인 상수가 아니라
 * Vmify 자신이 만들어낸, 개수가 코드 크기에 비례해 수천~수만 개까지 불어날 수 있는
 * 내부 값이고, 로직 자체는 이미 Vmify 컴파일로 구조적으로 숨겨져 있다.
 * NumbersToExpressions/EncryptNumbers 같은 뒤쪽 패스가 이 값들까지 하나하나
 * for-loop/재귀 함수/디코더 호출로 부풀리면, 두 패스가 곱셈적으로 상호작용해
 * 출력이 기하급수적으로 커진다 (실측: 4400줄 샘플에서 Vmify+NumbersToExpressions만
 * 켜면 0.9MB가 아니라 7.7MB가 나옴). 그래서 이 표시가 붙은 노드는 뒤쪽 숫자
 * 난독화 패스들이 건드리지 않고 그대로 둔다.
 */
export const vmStructuralNumbers = new WeakSet<NumberLiteral>()

export function vmNumberLiteral(value: number): NumberLiteral {
    const node = numberLiteral(value)
    vmStructuralNumbers.add(node)
    return node
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