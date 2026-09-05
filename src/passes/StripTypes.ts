import type {
    Program, Block, Statement, Expression, FunctionBody,
} from "luau-parser"

/**
 * 파이프라인 맨 앞에서 실행되어야 하는 패스.
 *
 * 이후 패스들(GlobalMapping, RenameVariables 등)은 값 트리만 순회하고
 * `typeof(x)`, `x :: T` 같은 타입 노드 내부의 expression은 건드리지 않는다.
 * 타입을 나중까지 들고 있으면 값 쪽 식별자는 바뀌는데 타입 쪽 참조는 원래
 * 이름 그대로 남아 출력물이 타입체크 불가능한 상태가 된다
 * (`typeof(runtimeValue)`가 obfuscate 이후에도 원본 이름을 참조하는 것이 그 예).
 *
 * 그래서 타입 정보 자체를 파이프라인 시작 시점에 전부 지워서 이 클래스의
 * 버그를 원천 차단한다:
 *  - TypeAliasStatement / ExportTypeAliasStatement 문 자체를 블록에서 제거
 *  - TypedIdentifier / FunctionParameter 의 typeAnnotation 제거
 *  - FunctionBody 의 generics / varargTypeAnnotation / returnType 제거
 *  - `expr :: T` (TypeAssertionExpression) 은 T를 버리고 expr로 치환
 */
export function runStripTypes(program: Program): void {
    stripBlock(program.body)
}

function stripBlock(block: Block): void {
    const kept: Statement[] = []
    for (const stmt of block.statements) {
        if (stmt.type === "TypeAliasStatement" || stmt.type === "ExportTypeAliasStatement") {
            continue
        }
        stripStatement(stmt)
        kept.push(stmt)
    }
    block.statements = kept
}

function stripFunctionBody(func: FunctionBody): void {
    func.generics = []
    for (const param of func.params) delete param.typeAnnotation
    delete func.varargTypeAnnotation
    delete func.returnType
    stripBlock(func.body)
}

function stripStatement(stmt: Statement): void {
    switch (stmt.type) {
        case "LocalStatement":
            for (const name of stmt.names) delete name.typeAnnotation
            for (let i = 0; i < stmt.init.length; i++) stmt.init[i] = stripExpr(stmt.init[i])
            return

        case "LocalFunctionStatement":
            stripFunctionBody(stmt.func)
            return

        case "FunctionDeclarationStatement":
            stripFunctionBody(stmt.func)
            return

        case "AssignmentStatement":
            for (let i = 0; i < stmt.targets.length; i++) stmt.targets[i] = stripExpr(stmt.targets[i])
            for (let i = 0; i < stmt.values.length; i++) stmt.values[i] = stripExpr(stmt.values[i])
            return

        case "CompoundAssignmentStatement":
            stmt.target = stripExpr(stmt.target)
            stmt.value = stripExpr(stmt.value)
            return

        case "CallStatement":
            stmt.expression = stripExpr(stmt.expression) as typeof stmt.expression
            return

        case "DoStatement":
            stripBlock(stmt.body)
            return

        case "WhileStatement":
            stmt.condition = stripExpr(stmt.condition)
            stripBlock(stmt.body)
            return

        case "RepeatStatement":
            stripBlock(stmt.body)
            stmt.condition = stripExpr(stmt.condition)
            return

        case "IfStatement":
            for (const clause of stmt.clauses) {
                clause.condition = stripExpr(clause.condition)
                stripBlock(clause.body)
            }
            if (stmt.alternate) stripBlock(stmt.alternate)
            return

        case "NumericForStatement":
            delete stmt.variable.typeAnnotation
            stmt.start = stripExpr(stmt.start)
            stmt.end = stripExpr(stmt.end)
            if (stmt.step) stmt.step = stripExpr(stmt.step)
            stripBlock(stmt.body)
            return

        case "GenericForStatement":
            for (const v of stmt.variables) delete v.typeAnnotation
            for (let i = 0; i < stmt.iterators.length; i++) stmt.iterators[i] = stripExpr(stmt.iterators[i])
            stripBlock(stmt.body)
            return

        case "ReturnStatement":
            for (let i = 0; i < stmt.arguments.length; i++) stmt.arguments[i] = stripExpr(stmt.arguments[i])
            return

        case "BreakStatement":
        case "ContinueStatement":
            return
    }
}

function stripExpr(expr: Expression): Expression {
    switch (expr.type) {
        case "InterpolatedStringExpression":
            for (const part of expr.parts) {
                if (part.kind === "expression") part.expression = stripExpr(part.expression)
            }
            return expr

        case "FunctionExpression":
            stripFunctionBody(expr.func)
            return expr

        case "TableExpression":
            for (const field of expr.fields) {
                if (field.type === "TableFieldPositional") {
                    field.value = stripExpr(field.value)
                } else if (field.type === "TableFieldNamed") {
                    field.value = stripExpr(field.value)
                } else if (field.type === "TableFieldComputed") {
                    field.key = stripExpr(field.key)
                    field.value = stripExpr(field.value)
                }
            }
            return expr

        case "BinaryExpression":
            expr.left = stripExpr(expr.left)
            expr.right = stripExpr(expr.right)
            return expr

        case "UnaryExpression":
            expr.argument = stripExpr(expr.argument)
            return expr

        case "MemberExpression":
            expr.object = stripExpr(expr.object)
            return expr

        case "IndexExpression":
            expr.object = stripExpr(expr.object)
            expr.index = stripExpr(expr.index)
            return expr

        case "CallExpression":
            expr.callee = stripExpr(expr.callee)
            for (let i = 0; i < expr.arguments.length; i++) expr.arguments[i] = stripExpr(expr.arguments[i])
            return expr

        case "MethodCallExpression":
            expr.object = stripExpr(expr.object)
            for (let i = 0; i < expr.arguments.length; i++) expr.arguments[i] = stripExpr(expr.arguments[i])
            return expr

        case "ParenthesizedExpression":
            expr.expression = stripExpr(expr.expression)
            return expr

        case "TypeAssertionExpression":
            // `expr :: T` -> T를 버리고 expr만 남김 (괄호로 감싸서 우선순위 보존)
            return stripExpr(expr.expression)

        case "IfElseExpression":
            for (const clause of expr.clauses) {
                clause.condition = stripExpr(clause.condition)
                clause.body = stripExpr(clause.body)
            }
            expr.alternate = stripExpr(expr.alternate)
            return expr

        default:
            return expr
    }
}