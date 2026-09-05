import type {
    Program, Block, Statement, Expression, FunctionBody, Identifier,
} from "luau-parser"

/** 함수 하나(최상위 프로그램 포함)를 가리키는 식별용 토큰. 객체 identity만 씀. */
export type FuncMarker = { readonly tag: "top" } | { readonly tag: "fn"; readonly node: FunctionBody }

export interface EnclosingFunctionMap {
    /** 식별자 사용/선언 노드 하나가 어느 함수 안에 있는지. */
    ownerOf: Map<object, FuncMarker>
    /** 함수 마커 -> 그 함수를 감싸는 바깥 함수 마커(최상위는 undefined). */
    parentOf: Map<FuncMarker, FuncMarker | undefined>
    topMarker: FuncMarker
}

/**
 * analyzeScopes()가 주는 건 "이 식별자가 어떤 binding을 가리키는가"까지고,
 * "그 식별자가 물리적으로 어느 함수 몸통 안에 있는가"는 안 알려주기 때문에
 * upvalue 캡처를 판단하려면 이 정보를 직접 한 번 더 walk해서 구해야 한다.
 * (binding 선언 위치의 함수 != 어떤 참조 위치의 함수 라면 그 참조는 upvalue를 필요로 함)
 */
export function buildEnclosingFunctionMap(program: Program): EnclosingFunctionMap {
    const ownerOf = new Map<object, FuncMarker>()
    const parentOf = new Map<FuncMarker, FuncMarker | undefined>()
    const topMarker: FuncMarker = { tag: "top" }
    parentOf.set(topMarker, undefined)

    function mark(node: object, fn: FuncMarker): void {
        ownerOf.set(node, fn)
    }

    function walkBlock(block: Block, fn: FuncMarker): void {
        for (const stmt of block.statements) walkStatement(stmt, fn)
    }

    function walkFunctionBody(fb: FunctionBody, parent: FuncMarker): void {
        const self: FuncMarker = { tag: "fn", node: fb }
        parentOf.set(self, parent)
        mark(fb, self)
        for (const p of fb.params) mark(p, self)
        walkBlock(fb.body, self)
    }

    function walkExpr(expr: Expression, fn: FuncMarker): void {
        mark(expr, fn)
        switch (expr.type) {
            case "Identifier":
                mark(expr, fn)
                break
            case "InterpolatedStringExpression":
                for (const part of expr.parts) if (part.kind === "expression") walkExpr(part.expression, fn)
                break
            case "FunctionExpression":
                walkFunctionBody(expr.func, fn)
                break
            case "TableExpression":
                for (const field of expr.fields) {
                    if (field.type === "TableFieldPositional") walkExpr(field.value, fn)
                    else if (field.type === "TableFieldNamed") walkExpr(field.value, fn)
                    else {
                        walkExpr(field.key, fn)
                        walkExpr(field.value, fn)
                    }
                }
                break
            case "BinaryExpression":
                walkExpr(expr.left, fn)
                walkExpr(expr.right, fn)
                break
            case "UnaryExpression":
                walkExpr(expr.argument, fn)
                break
            case "MemberExpression":
                walkExpr(expr.object, fn)
                break
            case "IndexExpression":
                walkExpr(expr.object, fn)
                walkExpr(expr.index, fn)
                break
            case "CallExpression":
                walkExpr(expr.callee, fn)
                for (const a of expr.arguments) walkExpr(a, fn)
                break
            case "MethodCallExpression":
                walkExpr(expr.object, fn)
                for (const a of expr.arguments) walkExpr(a, fn)
                break
            case "ParenthesizedExpression":
            case "TypeAssertionExpression":
                walkExpr(expr.expression, fn)
                break
            case "IfElseExpression":
                for (const c of expr.clauses) {
                    walkExpr(c.condition, fn)
                    walkExpr(c.body, fn)
                }
                walkExpr(expr.alternate, fn)
                break
        }
    }

    function walkStatement(stmt: Statement, fn: FuncMarker): void {
        mark(stmt, fn)
        switch (stmt.type) {
            case "LocalStatement":
                for (const n of stmt.names) mark(n, fn)
                for (const e of stmt.init) walkExpr(e, fn)
                return
            case "LocalFunctionStatement":
                mark(stmt.name, fn)
                walkFunctionBody(stmt.func, fn)
                return
            case "FunctionDeclarationStatement":
                mark(stmt.target.base, fn)
                walkFunctionBody(stmt.func, fn)
                return
            case "AssignmentStatement":
                for (const t of stmt.targets) walkExpr(t, fn)
                for (const v of stmt.values) walkExpr(v, fn)
                return
            case "CompoundAssignmentStatement":
                walkExpr(stmt.target, fn)
                walkExpr(stmt.value, fn)
                return
            case "CallStatement":
                walkExpr(stmt.expression, fn)
                return
            case "DoStatement":
                walkBlock(stmt.body, fn)
                return
            case "WhileStatement":
                walkExpr(stmt.condition, fn)
                walkBlock(stmt.body, fn)
                return
            case "RepeatStatement":
                walkBlock(stmt.body, fn)
                walkExpr(stmt.condition, fn)
                return
            case "IfStatement":
                for (const c of stmt.clauses) {
                    walkExpr(c.condition, fn)
                    walkBlock(c.body, fn)
                }
                if (stmt.alternate) walkBlock(stmt.alternate, fn)
                return
            case "NumericForStatement":
                mark(stmt.variable, fn)
                walkExpr(stmt.start, fn)
                walkExpr(stmt.end, fn)
                if (stmt.step) walkExpr(stmt.step, fn)
                walkBlock(stmt.body, fn)
                return
            case "GenericForStatement":
                for (const v of stmt.variables) mark(v, fn)
                for (const it of stmt.iterators) walkExpr(it, fn)
                walkBlock(stmt.body, fn)
                return
            case "ReturnStatement":
                for (const a of stmt.arguments) walkExpr(a, fn)
                return
            default:
                return
        }
    }

    walkBlock(program.body, topMarker)
    return { ownerOf, parentOf, topMarker }
}

/** Identifier 참조 하나가 속한 함수를 찾는다(선언/참조 둘 다 이 맵에 들어있음). */
export function ownerFunctionOf(map: EnclosingFunctionMap, node: object): FuncMarker {
    const fn = map.ownerOf.get(node)
    if (!fn) throw new Error("scope-walk: node was not visited — walker/compiler are out of sync")
    return fn
}
