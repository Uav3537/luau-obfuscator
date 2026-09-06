import type {
    Program, Block, Statement, Expression, FunctionBody,
} from "luau-parser"

export type ExpressionVisitor = (expr: Expression) => Expression | undefined | void

function visitArray(arr: Expression[], visitor: ExpressionVisitor): void {
    for (let i = 0; i < arr.length; i++) {
        arr[i] = mapExpression(arr[i], visitor)
    }
}

interface ChildAccessor {
    get(): Expression
    set(v: Expression): void
}

/**
 * expr의 "자식 Expression"들에 대한 getter/setter 목록을 반환한다.
 * (FunctionExpression은 별도 처리하므로 여기서는 빈 배열을 반환한다.)
 */
function getExpressionChildren(expr: Expression): ChildAccessor[] {
    switch (expr.type) {
        case "InterpolatedStringExpression": {
            const children: ChildAccessor[] = []
            for (const part of expr.parts) {
                if (part.kind === "expression") {
                    children.push({
                        get: () => part.expression,
                        set: (v) => { part.expression = v },
                    })
                }
            }
            return children
        }

        case "FunctionExpression":
            return []

        case "TableExpression": {
            const children: ChildAccessor[] = []
            for (const field of expr.fields) {
                if (field.type === "TableFieldPositional") {
                    children.push({ get: () => field.value, set: (v) => { field.value = v } })
                } else if (field.type === "TableFieldNamed") {
                    children.push({ get: () => field.value, set: (v) => { field.value = v } })
                } else if (field.type === "TableFieldComputed") {
                    children.push({ get: () => field.key, set: (v) => { field.key = v } })
                    children.push({ get: () => field.value, set: (v) => { field.value = v } })
                }
            }
            return children
        }

        case "BinaryExpression":
            return [
                { get: () => expr.left, set: (v) => { expr.left = v } },
                { get: () => expr.right, set: (v) => { expr.right = v } },
            ]

        case "UnaryExpression":
            return [{ get: () => expr.argument, set: (v) => { expr.argument = v } }]

        case "MemberExpression":
            return [{ get: () => expr.object, set: (v) => { expr.object = v } }]

        case "IndexExpression":
            return [
                { get: () => expr.object, set: (v) => { expr.object = v } },
                { get: () => expr.index, set: (v) => { expr.index = v } },
            ]

        case "CallExpression": {
            const children: ChildAccessor[] = [
                { get: () => expr.callee, set: (v) => { expr.callee = v } },
            ]
            for (let i = 0; i < expr.arguments.length; i++) {
                const idx = i
                children.push({
                    get: () => expr.arguments[idx],
                    set: (v) => { expr.arguments[idx] = v },
                })
            }
            return children
        }

        case "MethodCallExpression": {
            const children: ChildAccessor[] = [
                { get: () => expr.object, set: (v) => { expr.object = v } },
            ]
            for (let i = 0; i < expr.arguments.length; i++) {
                const idx = i
                children.push({
                    get: () => expr.arguments[idx],
                    set: (v) => { expr.arguments[idx] = v },
                })
            }
            return children
        }

        case "ParenthesizedExpression":
            return [{ get: () => expr.expression, set: (v) => { expr.expression = v } }]

        case "TypeAssertionExpression":
            return [{ get: () => expr.expression, set: (v) => { expr.expression = v } }]

        case "IfElseExpression": {
            const children: ChildAccessor[] = []
            for (const clause of expr.clauses) {
                children.push({ get: () => clause.condition, set: (v) => { clause.condition = v } })
                children.push({ get: () => clause.body, set: (v) => { clause.body = v } })
            }
            children.push({ get: () => expr.alternate, set: (v) => { expr.alternate = v } })
            return children
        }

        default:
            return []
    }
}

interface WalkFrame {
    expr: Expression
    children: ChildAccessor[]
    index: number
    setInParent: ((v: Expression) => void) | null
}

/**
 * Expression 트리를 후위순회(post-order)로 변형한다.
 *
 * 원래는 재귀 함수였지만, 문자열/숫자 난독화 패스가 만들어내는 매우 깊은
 * BinaryExpression 체인(예: 수천 개의 `..` concat)을 순회할 때 네이티브
 * 콜스택이 트리 깊이만큼 쌓여 "Maximum call stack size exceeded"가
 * 발생했다. 그래서 재귀 대신 힙에 할당되는 명시적 스택을 사용해
 * 트리 깊이와 무관하게 동작하도록 구현했다.
 */
export function mapExpression(root: Expression, visitor: ExpressionVisitor): Expression {
    // FunctionExpression은 본문(statement 트리)을 별도로 순회해야 하므로 특별 취급한다.
    // 함수 중첩 깊이는 보통 얕아서(재귀해도 안전) 그대로 재귀를 사용한다.
    if (root.type === "FunctionExpression") {
        walkFunctionBody(root.func, visitor)
        return visitor(root) ?? root
    }

    let result: Expression = root
    const stack: WalkFrame[] = [{
        expr: root,
        children: getExpressionChildren(root),
        index: 0,
        setInParent: (v) => { result = v },
    }]

    while (stack.length > 0) {
        const frame = stack[stack.length - 1]

        if (frame.index < frame.children.length) {
            const child = frame.children[frame.index]
            frame.index++
            const childExpr = child.get()

            if (childExpr.type === "FunctionExpression") {
                walkFunctionBody(childExpr.func, visitor)
                child.set(visitor(childExpr) ?? childExpr)
                continue
            }

            stack.push({
                expr: childExpr,
                children: getExpressionChildren(childExpr),
                index: 0,
                setInParent: child.set,
            })
            continue
        }

        // 모든 자식 처리가 끝났으면 visitor를 실행하고, 부모에 반영한 뒤 pop한다.
        const finished = visitor(frame.expr) ?? frame.expr
        frame.setInParent?.(finished)
        stack.pop()
    }

    return result
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