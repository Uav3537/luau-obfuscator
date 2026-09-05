import type {
    Program, Block, Statement, Expression, Identifier, ScopeAnalysis,
} from "luau-parser"
import { analyzeScopes, isGlobal, getBinding } from "luau-parser"
import {
    identifier, numberLiteral, stringLiteral, index as indexExpr,
    table, computedField, localStatement,
} from "./nodeFactory"

export interface GlobalMappingOptions {
    /** 전역들을 담아둘 최상단 local 테이블 변수 이름. RenameVariables가 이후에
     *  다시 실행되면 이 이름도 다른 이름으로 한 번 더 바뀜. */
    tableName: string
}

type Key = number | string

function randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min
}

function randomKey(): Key {
    // 숫자 키/문자열 키를 섞어서 접근 패턴을 예측하기 어렵게 함
    if (Math.random() < 0.5) return randomInt(1, 50)
    const chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    const len = randomInt(2, 4)
    let s = ""
    for (let i = 0; i < len; i++) s += chars[randomInt(0, chars.length - 1)]
    return s
}

function randomPath(): Key[] {
    const depth = randomInt(2, 4)
    const path: Key[] = []
    for (let i = 0; i < depth; i++) path.push(randomKey())
    return path
}

type TreeLeaf = { leaf: string }
type TreeNode = Map<Key, TreeNode | TreeLeaf>

function isLeaf(v: TreeNode | TreeLeaf): v is TreeLeaf {
    return !(v instanceof Map)
}

/** path를 따라 내려가며 중간 노드를 만들고 마지막 키에 리프를 심음.
 *  경로 충돌(이미 다른 값이 있음)이 나면 false를 반환 — 호출 쪽에서 다른 경로로 재시도. */
function insertPath(root: TreeNode, path: Key[], globalName: string): boolean {
    let node = root
    for (let i = 0; i < path.length - 1; i++) {
        const key = path[i]
        let next = node.get(key)
        if (next === undefined) {
            next = new Map()
            node.set(key, next)
        } else if (isLeaf(next)) {
            return false
        }
        node = next as TreeNode
    }
    const lastKey = path[path.length - 1]
    if (node.has(lastKey)) return false
    node.set(lastKey, { leaf: globalName })
    return true
}

function assignPaths(globalNames: string[]): { root: TreeNode; paths: Map<string, Key[]> } {
    const root: TreeNode = new Map()
    const paths = new Map<string, Key[]>()

    for (const name of globalNames) {
        let path: Key[] = []
        let attempts = 0
        let ok = false
        while (!ok && attempts < 200) {
            path = randomPath()
            ok = insertPath(root, path, name)
            attempts++
        }
        paths.set(name, path)
    }

    return { root, paths }
}

function keyExpression(key: Key): Expression {
    return typeof key === "number" ? numberLiteral(key) : stringLiteral(key)
}

function buildTreeTableExpr(node: TreeNode): Expression {
    const fields = [...node.entries()].map(([key, value]) =>
        computedField(
            keyExpression(key),
            isLeaf(value) ? identifier(value.leaf) : buildTreeTableExpr(value),
        ),
    )
    return table(fields)
}

function buildIndexChain(tableName: string, path: Key[]): Expression {
    let expr: Expression = identifier(tableName)
    for (const key of path) {
        expr = indexExpr(expr, keyExpression(key))
    }
    return expr
}

/** node(원래 Identifier)를 같은 객체 참조를 유지한 채로 IndexExpression으로
 *  제자리 변형함 — 이 객체를 들고 있는 부모 필드(BinaryExpression.left 등)는
 *  어디 있는지 몰라도 되고, 그냥 이 객체가 바뀌면 자동으로 반영됨. */
function morphIntoIndexChain(node: Identifier, tableName: string, path: Key[]): void {
    const built = buildIndexChain(tableName, path) as unknown as Record<string, unknown>
    const target = node as unknown as Record<string, unknown>
    for (const k of Object.keys(target)) delete target[k]
    Object.assign(target, built)
}

/**
 * `function Foo() end` / `function T.m() end` 형태의 target.base는 리터럴
 * 이름만 허용되는 문법 자리라 인덱스 체인으로 바꿀 수 없음. 이런 자리에 쓰인
 * 전역 이름은 매핑 대상에서 제외한다.
 * (statement 트리를 따라 내려가며 찾음 — 익명함수 표현식 내부에 중첩된
 * 전역 함수 선언 같은 극단적 케이스는 대상에서 빠질 수 있음)
 */
function collectUnsafeFunctionDeclGlobals(program: Program, analysis: ScopeAnalysis): Set<string> {
    const unsafe = new Set<string>()

    function visitBlock(block: Block): void {
        for (const stmt of block.statements) visitStatement(stmt)
    }

    function visitStatement(stmt: Statement): void {
        switch (stmt.type) {
            case "FunctionDeclarationStatement": {
                const binding = getBinding(analysis, stmt.target.base)
                if (binding && isGlobal(binding)) unsafe.add(binding.name)
                visitBlock(stmt.func.body)
                return
            }
            case "LocalFunctionStatement":
                visitBlock(stmt.func.body)
                return
            case "DoStatement":
                visitBlock(stmt.body)
                return
            case "WhileStatement":
                visitBlock(stmt.body)
                return
            case "RepeatStatement":
                visitBlock(stmt.body)
                return
            case "IfStatement":
                for (const clause of stmt.clauses) visitBlock(clause.body)
                if (stmt.alternate) visitBlock(stmt.alternate)
                return
            case "NumericForStatement":
                visitBlock(stmt.body)
                return
            case "GenericForStatement":
                visitBlock(stmt.body)
                return
            default:
                return
        }
    }

    visitBlock(program.body)
    return unsafe
}

export function runGlobalMapping(program: Program, options: GlobalMappingOptions): void {
    const analysis = analyzeScopes(program)
    const unsafe = collectUnsafeFunctionDeclGlobals(program, analysis)

    const globalBindings = [...analysis.bindings.values()].filter(
        (b) => isGlobal(b) && b.references.length > 0 && !unsafe.has(b.name),
    )
    if (globalBindings.length === 0) return

    const { root, paths } = assignPaths(globalBindings.map((b) => b.name))

    for (const binding of globalBindings) {
        const path = paths.get(binding.name)!
        // declarationNode(대입으로 정의된 경우)는 이미 references에 포함된
        // 같은 객체라 references만 돌면 전부 커버됨
        for (const ref of binding.references) {
            morphIntoIndexChain(ref, options.tableName, path)
        }
    }

    program.body.statements.unshift(
        localStatement(options.tableName, buildTreeTableExpr(root)),
    )
}