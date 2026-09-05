import type {
    Program, Block, Statement, Expression, FunctionBody, Binding, BindingId, ScopeAnalysis,
    CallExpression,
} from "luau-parser"
import { luauparser } from "luau-parser"
import { Opcode, RK, type Instr, type OpcodeMap } from "./opcodes"
import { type Proto, type ConstValue, createProto, internConst } from "./chunk"
import { RegisterAllocator } from "./registers"
import { buildEnclosingFunctionMap, ownerFunctionOf, type EnclosingFunctionMap, type FuncMarker } from "./scope-walk"

/** 박스({v = value}) 안의 값에 접근할 때 쓰는 고정 키. 상수 풀에 인턴됨. */
const BOX_FIELD = "v"

/** Roblox/Luau 표준 전역 중 최소한. 실제 사용 시 프로젝트에 맞게 채워야 함. */
export const DEFAULT_BUILTIN_GLOBALS = [
    "game", "script", "workspace", "print", "warn", "error", "pairs", "ipairs",
    "pcall", "xpcall", "type", "typeof", "tostring", "tonumber", "select", "unpack",
    "table", "string", "math", "os", "task", "Instance", "Vector3", "CFrame", "Color3",
    "require", "setmetatable", "getmetatable", "rawget", "rawset", "rawequal", "next",
]

interface LocalSlot {
    reg: number
    boxed: boolean
}

interface FuncState {
    proto: Proto
    parent?: FuncState
    marker: FuncMarker
    regs: RegisterAllocator
    localSlots: Map<BindingId, LocalSlot>
    upvalIndexByBinding: Map<BindingId, number>
    breakPatchStack: number[][]
    continuePatchStack: number[][]
}

export class VmCompiler {
    private analysis: ScopeAnalysis
    private enclosing: EnclosingFunctionMap
    private captured = new Set<BindingId>()
    private protoIdCounter = 0
    private declToBinding = new Map<object, BindingId>()

    constructor(
        private program: Program,
        builtinGlobals: readonly string[] = DEFAULT_BUILTIN_GLOBALS,
        private opcodeMap?: OpcodeMap,
    ) {
        this.analysis = luauparser.analyzeScopes(program, { builtinGlobals })
        this.enclosing = buildEnclosingFunctionMap(program)
        for (const [id, binding] of this.analysis.bindings) {
            if (binding.declarationNode) this.declToBinding.set(binding.declarationNode, id)
        }
        this.computeCaptured()
    }

    private computeCaptured(): void {
        for (const binding of this.analysis.bindings.values()) {
            if (binding.kind === "global") continue
            if (!binding.declarationNode) continue
            const ownerFn = ownerFunctionOf(this.enclosing, binding.declarationNode)
            for (const ref of binding.references) {
                const refFn = ownerFunctionOf(this.enclosing, ref)
                if (refFn !== ownerFn) {
                    this.captured.add(binding.id)
                    break
                }
            }
        }
    }

    compile(): Proto {
        const top = this.newFuncState(undefined, this.enclosing.topMarker)
        top.proto.hasVarargs = true
        this.compileBlock(this.program.body, top)
        this.emit(top, Opcode.RETURN, 0, 1, 0)
        top.proto.maxRegs = top.regs.maxUsed
        return top.proto
    }

    private newFuncState(parent: FuncState | undefined, marker: FuncMarker): FuncState {
        return {
            proto: createProto(this.protoIdCounter++),
            parent,
            marker,
            regs: new RegisterAllocator(),
            localSlots: new Map(),
            upvalIndexByBinding: new Map(),
            breakPatchStack: [],
            continuePatchStack: [],
        }
    }

    private emit(state: FuncState, op: Opcode, a: number, b: number, c: number, comment?: string): number {
        // opcodeMap이 주어지면(runVmify 경유 실행) 논리 opcode 번호를 이 빌드의 무작위
        // 물리 번호로 바꿔서 저장한다. 직접 VmCompiler를 쓰는 테스트/디버깅 코드가
        // opcodeMap 없이 호출할 수도 있으니 없으면 항등(그대로) 매핑으로 폴백.
        const physicalOp = this.opcodeMap ? this.opcodeMap[op] : op
        state.proto.code.push({ op: physicalOp, a, b, c, comment } as Instr)
        return state.proto.code.length - 1
    }

    private konst(state: FuncState, value: ConstValue): number {
        return internConst(state.proto, value)
    }

    private bindingIdOf(node: object): BindingId | undefined {
        return (this.analysis.bindingOf as Map<object, BindingId>).get(node)
    }

    private getOrCreateUpval(state: FuncState, bindingId: BindingId): number {
        const existing = state.upvalIndexByBinding.get(bindingId)
        if (existing !== undefined) return existing
        const parent = state.parent
        if (!parent) throw new Error("vmify: binding not found in any enclosing function (compiler bug)")
        const parentLocal = parent.localSlots.get(bindingId)
        const idx = state.proto.upvalDescs.length
        if (parentLocal) {
            state.proto.upvalDescs.push({ kind: "local", index: parentLocal.reg })
        } else {
            const parentUpvalIdx = this.getOrCreateUpval(parent, bindingId)
            state.proto.upvalDescs.push({ kind: "upval", index: parentUpvalIdx })
        }
        state.upvalIndexByBinding.set(bindingId, idx)
        return idx
    }

    private bindingIsLocalSomewhereUp(state: FuncState, bindingId: BindingId): boolean {
        let s: FuncState | undefined = state
        while (s) {
            if (s.localSlots.has(bindingId)) return true
            s = s.parent
        }
        return false
    }

    private declareLocalBinding(state: FuncState, bindingId: BindingId): number {
        const reg = state.regs.declareLocal()
        state.localSlots.set(bindingId, { reg, boxed: this.captured.has(bindingId) })
        if (this.captured.has(bindingId)) this.emitNewBox(state, reg)
        return reg
    }

    private emitNewBox(state: FuncState, reg: number): void {
        this.emit(state, Opcode.NEWTABLE, reg, 0, 0, "box")
    }

    private emitLoadBinding(state: FuncState, bindingId: BindingId, dest: number): void {
        const local = state.localSlots.get(bindingId)
        if (local) {
            if (local.boxed) {
                const k = this.konst(state, BOX_FIELD)
                this.emit(state, Opcode.GETTABLE, dest, local.reg, RK(k, true))
            } else if (dest !== local.reg) {
                this.emit(state, Opcode.MOVE, dest, local.reg, 0)
            }
            return
        }
        if (this.bindingIsLocalSomewhereUp(state, bindingId)) {
            const idx = this.getOrCreateUpval(state, bindingId)
            this.emit(state, Opcode.GETUPVAL, dest, idx, 0)
            const k = this.konst(state, BOX_FIELD)
            this.emit(state, Opcode.GETTABLE, dest, dest, RK(k, true))
            return
        }
        const binding = this.analysis.bindings.get(bindingId) as Binding
        const nameIdx = this.konst(state, binding.name)
        this.emit(state, Opcode.GETGLOBAL, dest, nameIdx, 0)
    }

    private emitStoreBinding(state: FuncState, bindingId: BindingId, src: number): void {
        const local = state.localSlots.get(bindingId)
        if (local) {
            if (local.boxed) {
                const k = this.konst(state, BOX_FIELD)
                this.emit(state, Opcode.SETTABLE, local.reg, RK(k, true), src)
            } else if (src !== local.reg) {
                this.emit(state, Opcode.MOVE, local.reg, src, 0)
            }
            return
        }
        if (this.bindingIsLocalSomewhereUp(state, bindingId)) {
            const idx = this.getOrCreateUpval(state, bindingId)
            const tmp = state.regs.allocTemp()
            this.emit(state, Opcode.GETUPVAL, tmp, idx, 0)
            const k = this.konst(state, BOX_FIELD)
            this.emit(state, Opcode.SETTABLE, tmp, RK(k, true), src)
            state.regs.freeTemp(tmp)
            return
        }
        const binding = this.analysis.bindings.get(bindingId) as Binding
        const nameIdx = this.konst(state, binding.name)
        this.emit(state, Opcode.SETGLOBAL, src, nameIdx, 0)
    }

    private compileBlock(block: Block, state: FuncState): void {
        const saved = state.regs.saveLocalCount()
        for (const stmt of block.statements) this.compileStatement(stmt, state)
        state.regs.releaseLocalsTo(saved)
    }

    private compileStatement(stmt: Statement, state: FuncState): void {
        switch (stmt.type) {
            case "LocalStatement": {
                // 순서 중요: 로컬(및 캡처된 것의 박스)을 "먼저" 선언해서 레지스터를 확정한 뒤에
                // 초기화식을 컴파일해야 한다. 반대로 하면(예전 버그) 초기화값을 임시 레지스터에
                // 계산해놓고 나서 declareLocalBinding이 캡처 여부를 보고 "같은" 레지스터에
                // NEWTABLE(박스)을 찍어버려 방금 계산한 값이 통째로 날아간다.
                // bindingId 해석 자체는 analyzeScopes가 정적으로 끝내놓기 때문에
                // (`local x = x`의 우변은 바깥쪽 x를 정확히 가리킴) 레지스터를 먼저 확정해도
                // 셰도잉 문제는 생기지 않는다.
                const bindingIds = stmt.names.map((n) => this.bindingIdOfDecl(n))
                for (const id of bindingIds) this.declareLocalBinding(state, id)
                const boundary = state.regs.top()
                // 초기화식 목록: 마지막 식이 Call/MethodCall/Vararg면 남은 이름 개수만큼
                // 확장하고(`local a, b = pair()`), 그 외엔 각자 1개씩 채우고 모자란 이름은 nil.
                let filledUpTo = 0 // boundary 기준으로 이미 값이 채워진 슬롯 수(패딩 시작점)
                if (stmt.init.length > 0) {
                    for (let i = 0; i < stmt.init.length - 1; i++) {
                        this.compileExprTo(stmt.init[i], state, boundary + i)
                    }
                    const lastIdx = stmt.init.length - 1
                    const remaining = Math.max(bindingIds.length - lastIdx, 1)
                    this.compileExprMultiInto(stmt.init[lastIdx], state, boundary + lastIdx, remaining)
                    filledUpTo = lastIdx + remaining // 마지막 식이 채운 슬롯까지 전부 포함
                }
                for (let i = filledUpTo; i < bindingIds.length; i++) {
                    this.emit(state, Opcode.LOADNIL, boundary + i, boundary + i, 0)
                }
                for (let i = 0; i < bindingIds.length; i++) {
                    this.emitStoreBinding(state, bindingIds[i], boundary + i)
                }
                state.regs.freeTemp(boundary)
                return
            }
            case "AssignmentStatement": {
                const valueRegs = stmt.values.map((e) => this.compileExpr(e, state))
                stmt.targets.forEach((target, i) => {
                    const srcReg = valueRegs[i] ?? valueRegs[valueRegs.length - 1]
                    this.compileAssignTarget(target, srcReg, state)
                })
                return
            }
            case "CompoundAssignmentStatement":
                this.compileCompoundAssignment(stmt, state)
                return
            case "CallStatement":
                this.compileExpr(stmt.expression, state, true)
                return
            case "IfStatement":
                this.compileIf(stmt, state)
                return
            case "WhileStatement":
                this.compileWhile(stmt, state)
                return
            case "RepeatStatement":
                this.compileRepeat(stmt, state)
                return
            case "NumericForStatement":
                this.compileNumericFor(stmt, state)
                return
            case "GenericForStatement":
                this.compileGenericFor(stmt, state)
                return
            case "DoStatement":
                this.compileBlock(stmt.body, state)
                return
            case "ReturnStatement": {
                if (stmt.arguments.length === 0) {
                    this.emit(state, Opcode.RETURN, state.regs.top(), 1, 0)
                    return
                }
                // `return f()` / `return ...` (인자가 딱 하나뿐이고 다중값 가능) — 결과 개수를
                // 컴파일 타임에 모르니 열어서 그대로 전파(RETURN b=0, 런타임 multiTop 기준).
                if (stmt.arguments.length === 1 && this.isMultiValueExpr(stmt.arguments[0])) {
                    const base = state.regs.top()
                    this.compileExprOpenInto(stmt.arguments[0], state, base)
                    this.emit(state, Opcode.RETURN, base, 0, 0)
                    state.regs.freeTemp(base)
                    return
                }
                // 여러 개 있으면 마지막 것만 열어서 전파, 나머지는 고정 1개씩.
                const boundary = state.regs.top()
                for (let i = 0; i < stmt.arguments.length - 1; i++) {
                    this.compileExprTo(stmt.arguments[i], state, boundary + i)
                }
                const lastIdx = stmt.arguments.length - 1
                if (this.isMultiValueExpr(stmt.arguments[lastIdx])) {
                    this.compileExprOpenInto(stmt.arguments[lastIdx], state, boundary + lastIdx)
                    this.emit(state, Opcode.RETURN, boundary, 0, 0)
                } else {
                    this.compileExprTo(stmt.arguments[lastIdx], state, boundary + lastIdx)
                    this.emit(state, Opcode.RETURN, boundary, stmt.arguments.length + 1, 0)
                }
                state.regs.freeTemp(boundary)
                return
            }
            case "LocalFunctionStatement": {
                // 캡처되는 경우 CLOSURE를 박스 레지스터에 직접 쓰면 안 된다 — 그 순간
                // 박스(테이블)가 함수 값으로 덮어써져서 사라진다. 임시 레지스터에 만든 뒤
                // emitStoreBinding으로 박스 안에 넣어야 함(재귀 함수 자기 참조도 이 순서로 지원됨).
                const bindingId = this.bindingIdOfDecl(stmt.name)
                const reg = this.declareLocalBinding(state, bindingId)
                const protoIdx = this.compileFunctionBody(stmt.func, state)
                const boxed = state.localSlots.get(bindingId)!.boxed
                if (boxed) {
                    const tmp = state.regs.allocTemp()
                    this.emitClosure(state, tmp, protoIdx)
                    this.emitStoreBinding(state, bindingId, tmp)
                    state.regs.freeTemp(tmp)
                } else {
                    this.emitClosure(state, reg, protoIdx)
                }
                return
            }
            case "FunctionDeclarationStatement":
                this.compileFunctionDeclaration(stmt, state)
                return
            case "BreakStatement": {
                if (state.breakPatchStack.length === 0) throw new Error("vmify: break outside loop")
                const idx = this.emit(state, Opcode.JMP, 0, 0, 0, "break")
                state.breakPatchStack[state.breakPatchStack.length - 1].push(idx)
                return
            }
            case "ContinueStatement": {
                if (state.continuePatchStack.length === 0) throw new Error("vmify: continue outside loop")
                const idx = this.emit(state, Opcode.JMP, 0, 0, 0, "continue")
                state.continuePatchStack[state.continuePatchStack.length - 1].push(idx)
                return
            }
            case "TypeAliasStatement":
            case "ExportTypeAliasStatement":
                return
            default: {
                const _exhaustive: never = stmt
                throw new Error(`vmify: unhandled statement ${(_exhaustive as Statement).type}`)
            }
        }
    }

    private compileAssignTarget(target: Expression, srcReg: number, state: FuncState): void {
        if (target.type === "Identifier") {
            const bindingId = this.bindingIdOf(target)
            if (bindingId === undefined) throw new Error("vmify: unresolved identifier target")
            this.emitStoreBinding(state, bindingId, srcReg)
            return
        }
        if (target.type === "MemberExpression") {
            const objReg = this.compileExpr(target.object, state)
            const k = this.konst(state, target.property.name)
            this.emit(state, Opcode.SETTABLE, objReg, RK(k, true), srcReg)
            state.regs.freeTemp(objReg)
            return
        }
        if (target.type === "IndexExpression") {
            const objReg = this.compileExpr(target.object, state)
            const keyReg = this.compileExpr(target.index, state)
            this.emit(state, Opcode.SETTABLE, objReg, keyReg, srcReg)
            state.regs.freeTemp(objReg)
            return
        }
        throw new Error(`vmify: unsupported assignment target ${target.type}`)
    }

    private compileCompoundAssignment(
        stmt: Extract<Statement, { type: "CompoundAssignmentStatement" }>,
        state: FuncState,
    ): void {
        const opMap: Partial<Record<string, Opcode>> = {
            "+=": Opcode.ADD, "-=": Opcode.SUB, "*=": Opcode.MUL, "/=": Opcode.DIV,
            "//=": Opcode.IDIV, "%=": Opcode.MOD, "^=": Opcode.POW, "..=": Opcode.CONCAT,
        }
        const op = opMap[stmt.operator]
        if (!op) throw new Error(`vmify: unsupported compound operator ${stmt.operator}`)

        const target = stmt.target
        if (target.type === "Identifier") {
            const bindingId = this.bindingIdOf(target)
            if (bindingId === undefined) throw new Error("vmify: unresolved identifier target")
            const cur = state.regs.allocTemp()
            this.emitLoadBinding(state, bindingId, cur)
            const rhs = this.compileExpr(stmt.value, state)
            this.emit(state, op, cur, cur, rhs)
            state.regs.freeTemp(rhs)
            this.emitStoreBinding(state, bindingId, cur)
            state.regs.freeTemp(cur)
            return
        }
        if (target.type === "MemberExpression") {
            const objReg = this.compileExpr(target.object, state)
            const k = this.konst(state, target.property.name)
            const cur = state.regs.allocTemp()
            this.emit(state, Opcode.GETTABLE, cur, objReg, RK(k, true))
            const rhs = this.compileExpr(stmt.value, state)
            this.emit(state, op, cur, cur, rhs)
            this.emit(state, Opcode.SETTABLE, objReg, RK(k, true), cur)
            state.regs.freeTemp(objReg)
            return
        }
        if (target.type === "IndexExpression") {
            const objReg = this.compileExpr(target.object, state)
            const keyReg = this.compileExpr(target.index, state)
            const cur = state.regs.allocTemp()
            this.emit(state, Opcode.GETTABLE, cur, objReg, keyReg)
            const rhs = this.compileExpr(stmt.value, state)
            this.emit(state, op, cur, cur, rhs)
            this.emit(state, Opcode.SETTABLE, objReg, keyReg, cur)
            state.regs.freeTemp(objReg)
            return
        }
        throw new Error(`vmify: unsupported compound assignment target ${target.type}`)
    }

    private compileFunctionDeclaration(
        stmt: Extract<Statement, { type: "FunctionDeclarationStatement" }>,
        state: FuncState,
    ): void {
        const protoIdx = this.compileFunctionBody(stmt.func, state)
        const fnReg = state.regs.allocTemp()
        this.emitClosure(state, fnReg, protoIdx)

        const target = stmt.target
        if (target.path.length === 0 && !target.method) {
            const bindingId = this.bindingIdOf(target.base)
            if (bindingId === undefined) throw new Error("vmify: unresolved function name")
            this.emitStoreBinding(state, bindingId, fnReg)
            state.regs.freeTemp(fnReg)
            return
        }

        const baseBindingId = this.bindingIdOf(target.base)
        if (baseBindingId === undefined) throw new Error("vmify: unresolved function name base")
        let objReg = state.regs.allocTemp()
        this.emitLoadBinding(state, baseBindingId, objReg)

        const navigateSegments = target.method ? target.path : target.path.slice(0, -1)
        for (const seg of navigateSegments) {
            const k = this.konst(state, seg.name)
            const next = state.regs.allocTemp()
            this.emit(state, Opcode.GETTABLE, next, objReg, RK(k, true))
            objReg = next
        }
        const finalKeyName = target.method ? target.method.name : target.path[target.path.length - 1].name
        const k = this.konst(state, finalKeyName)
        this.emit(state, Opcode.SETTABLE, objReg, RK(k, true), fnReg)
        state.regs.freeTemp(fnReg)
    }

    private compileIf(stmt: Extract<Statement, { type: "IfStatement" }>, state: FuncState): void {
        const endPatches: number[] = []
        for (const clause of stmt.clauses) {
            const condReg = this.compileExpr(clause.condition, state)
            this.emit(state, Opcode.TEST, condReg, 0, 1)  // skip next(jump-away) when truthy
            const jmpOverBody = this.emit(state, Opcode.JMP, 0, 0, 0, "skip-then")
            state.regs.freeTemp(condReg)
            this.compileBlock(clause.body, state)
            const jmpToEnd = this.emit(state, Opcode.JMP, 0, 0, 0, "then->end")
            endPatches.push(jmpToEnd)
            this.patchJump(state, jmpOverBody, state.proto.code.length)
        }
        if (stmt.alternate) this.compileBlock(stmt.alternate, state)
        for (const p of endPatches) this.patchJump(state, p, state.proto.code.length)
    }

    private compileWhile(stmt: Extract<Statement, { type: "WhileStatement" }>, state: FuncState): void {
        const loopStart = state.proto.code.length
        const condReg = this.compileExpr(stmt.condition, state)
        this.emit(state, Opcode.TEST, condReg, 0, 1)  // skip next(jump-away) when truthy
        const exitJmp = this.emit(state, Opcode.JMP, 0, 0, 0, "while-exit")
        state.regs.freeTemp(condReg)
        state.breakPatchStack.push([])
        state.continuePatchStack.push([])
        this.compileBlock(stmt.body, state)
        this.emit(state, Opcode.JMP, loopStart - state.proto.code.length, 0, 0, "while-back")
        const target = state.proto.code.length
        this.patchJump(state, exitJmp, target)
        for (const b of state.breakPatchStack.pop()!) this.patchJump(state, b, target)
        for (const c of state.continuePatchStack.pop()!) this.patchJump(state, c, loopStart)
    }

    private compileRepeat(stmt: Extract<Statement, { type: "RepeatStatement" }>, state: FuncState): void {
        const loopStart = state.proto.code.length
        state.breakPatchStack.push([])
        state.continuePatchStack.push([])
        const saved = state.regs.saveLocalCount()
        for (const s of stmt.body.statements) this.compileStatement(s, state)
        const condCheckStart = state.proto.code.length
        const condReg = this.compileExpr(stmt.condition, state)
        this.emit(state, Opcode.TEST, condReg, 0, 1)  // skip next(jump-away) when truthy
        const jmpBack = this.emit(state, Opcode.JMP, 0, 0, 0, "repeat-back")
        state.regs.freeTemp(condReg)
        this.patchJump(state, jmpBack, loopStart)
        state.regs.releaseLocalsTo(saved)
        const endIdx = state.proto.code.length
        for (const b of state.breakPatchStack.pop()!) this.patchJump(state, b, endIdx)
        for (const c of state.continuePatchStack.pop()!) this.patchJump(state, c, condCheckStart)
    }

    private compileNumericFor(stmt: Extract<Statement, { type: "NumericForStatement" }>, state: FuncState): void {
        const saved = state.regs.saveLocalCount()
        const base = state.regs.declareLocal()
        state.regs.declareLocal()
        state.regs.declareLocal()
        const cursor = state.regs.declareLocal()

        const startTmp = this.compileExpr(stmt.start, state)
        this.emit(state, Opcode.MOVE, base, startTmp, 0)
        state.regs.freeTemp(startTmp)

        const endTmp = this.compileExpr(stmt.end, state)
        this.emit(state, Opcode.MOVE, base + 1, endTmp, 0)
        state.regs.freeTemp(endTmp)

        const stepTmp = stmt.step ? this.compileExpr(stmt.step, state) : this.loadConst(state, 1)
        this.emit(state, Opcode.MOVE, base + 2, stepTmp, 0)
        state.regs.freeTemp(stepTmp)

        const prep = this.emit(state, Opcode.FORPREP, base, 0, 0, "forprep")
        const loopBodyStart = state.proto.code.length

        const bindingId = this.bindingIdOfDecl(stmt.variable)
        const captured = this.captured.has(bindingId)
        let varReg: number
        if (captured) {
            varReg = state.regs.declareLocal()
            this.emitNewBox(state, varReg)
            const k = this.konst(state, BOX_FIELD)
            this.emit(state, Opcode.SETTABLE, varReg, RK(k, true), cursor)
        } else {
            varReg = cursor
        }
        state.localSlots.set(bindingId, { reg: varReg, boxed: captured })

        state.breakPatchStack.push([])
        state.continuePatchStack.push([])
        this.compileBlock(stmt.body, state)
        const loopInstr = this.emit(state, Opcode.FORLOOP, base, 0, 0, "forloop")
        this.patchJumpField(state, prep, loopInstr, "b")
        this.patchJumpField(state, loopInstr, loopBodyStart, "b")
        const endIdx = state.proto.code.length
        for (const b of state.breakPatchStack.pop()!) this.patchJump(state, b, endIdx)
        for (const c of state.continuePatchStack.pop()!) this.patchJump(state, c, loopInstr)

        state.regs.releaseLocalsTo(saved)
    }

    private compileGenericFor(stmt: Extract<Statement, { type: "GenericForStatement" }>, state: FuncState): void {
        const saved = state.regs.saveLocalCount()
        const base = state.regs.declareLocal()
        state.regs.declareLocal()
        state.regs.declareLocal()

        const iterators = stmt.iterators
        if (iterators.length === 1 && iterators[0].type === "CallExpression") {
            const firstReg = this.compileCallMultiInto(iterators[0] as CallExpression, state, 3)
            for (let i = 0; i < 3; i++) this.emit(state, Opcode.MOVE, base + i, firstReg + i, 0)
            state.regs.freeTemp(firstReg)
        } else {
            for (let i = 0; i < 3; i++) {
                if (i < iterators.length) {
                    const r = this.compileExpr(iterators[i], state)
                    this.emit(state, Opcode.MOVE, base + i, r, 0)
                    state.regs.freeTemp(r)
                } else {
                    this.emit(state, Opcode.LOADNIL, base + i, base + i, 0)
                }
            }
        }

        const loopStart = state.proto.code.length
        const nVars = stmt.variables.length
        const callBase = state.regs.top()
        const fnSlot = state.regs.allocTemp()
        const stateSlot = state.regs.allocTemp()
        const ctrlSlot = state.regs.allocTemp()
        this.emit(state, Opcode.MOVE, fnSlot, base, 0)
        this.emit(state, Opcode.MOVE, stateSlot, base + 1, 0)
        this.emit(state, Opcode.MOVE, ctrlSlot, base + 2, 0)
        this.emit(state, Opcode.CALL, fnSlot, 3, nVars + 1)
        state.regs.freeTemp(callBase)

        const resultRegs: number[] = []
        for (let i = 0; i < nVars; i++) resultRegs.push(state.regs.declareLocal())
        const firstResult = resultRegs[0]

        this.emit(state, Opcode.TEST, firstResult, 0, 1)  // skip next(jump-away) when truthy
        const exitJmp = this.emit(state, Opcode.JMP, 0, 0, 0, "generic-for-exit")
        this.emit(state, Opcode.MOVE, base + 2, firstResult, 0)

        for (let i = 0; i < nVars; i++) {
            const bindingId = this.bindingIdOfDecl(stmt.variables[i])
            if (this.captured.has(bindingId)) {
                const boxReg = state.regs.declareLocal()
                state.localSlots.set(bindingId, { reg: boxReg, boxed: true })
                this.emitNewBox(state, boxReg)
                const k = this.konst(state, BOX_FIELD)
                this.emit(state, Opcode.SETTABLE, boxReg, RK(k, true), resultRegs[i])
            } else {
                state.localSlots.set(bindingId, { reg: resultRegs[i], boxed: false })
            }
        }

        state.breakPatchStack.push([])
        state.continuePatchStack.push([])
        this.compileBlock(stmt.body, state)
        this.emit(state, Opcode.JMP, loopStart - state.proto.code.length, 0, 0, "generic-for-back")
        const endIdx = state.proto.code.length
        this.patchJump(state, exitJmp, endIdx)
        for (const b of state.breakPatchStack.pop()!) this.patchJump(state, b, endIdx)
        for (const c of state.continuePatchStack.pop()!) this.patchJump(state, c, loopStart)

        state.regs.releaseLocalsTo(saved)
    }

    private compileCallMultiInto(callExpr: CallExpression, state: FuncState, wantCount: number): number {
        // CallExpression과 동일한 이유로 top()을 미리 캐싱하지 않고 callee의 반환값을 base로 씀.
        const base = this.compileExpr(callExpr.callee, state)
        this.compileArgsContiguous(callExpr.arguments, state, base + 1)
        this.emit(state, Opcode.CALL, base, callExpr.arguments.length + 1, wantCount + 1)
        return base
    }

    private loadConst(state: FuncState, value: ConstValue): number {
        const reg = state.regs.allocTemp()
        const k = this.konst(state, value)
        this.emit(state, Opcode.LOADK, reg, k, 0)
        return reg
    }

    private patchJump(state: FuncState, instrIdx: number, targetIdx: number): void {
        this.patchJumpField(state, instrIdx, targetIdx, "a")
    }

    private patchJumpField(state: FuncState, instrIdx: number, targetIdx: number, field: "a" | "b"): void {
        state.proto.code[instrIdx][field] = targetIdx - instrIdx
    }

    private bindingIdOfDecl(node: object): BindingId {
        const id = this.declToBinding.get(node)
        if (id === undefined) throw new Error("vmify: could not resolve declaration binding (compiler bug)")
        return id
    }

    /** expr을 컴파일해서 결과가 정확히 target 레지스터에 오도록 강제(필요하면 MOVE 한 번 추가). */
    private compileExprTo(expr: Expression, state: FuncState, target: number): void {
        const r = this.compileExpr(expr, state)
        if (r !== target) this.emit(state, Opcode.MOVE, target, r, 0)
        state.regs.freeTemp(target + 1)
    }

    /**
     * CALL/RETURN처럼 "레지스터 base부터 연속으로 n개"를 요구하는 명령을 위해, 인자 표현식
     * 목록을 base, base+1, base+2 ...에 강제로 배치한다. 단순히 순서대로 compileExpr만
     * 호출하면 개별 인자는 각자 "자기 자신의 결과+1"이 다음 top이 되는 게 맞지만, 그 인자가
     * 복합 표현식(예: 이항연산 `i > 2`)이라 내부에서 스크래치 레지스터를 여러 개 쓰면 다음
     * 인자와의 사이에 빈틈이 생겨 CALL/RETURN이 잘못된 레지스터를 읽게 된다 — 그래서 매
     * 인자마다 목표 레지스터를 명시하고 필요하면 MOVE로 맞춰준다.
     */
    private compileArgsContiguous(exprs: Expression[], state: FuncState, base: number): void {
        for (let i = 0; i < exprs.length; i++) this.compileExprTo(exprs[i], state, base + i)
    }

    /** Call/MethodCall/Vararg처럼 "여러 값"을 낼 수 있는 표현식인지. */
    private isMultiValueExpr(expr: Expression): boolean {
        return expr.type === "CallExpression" || expr.type === "MethodCallExpression" || expr.type === "VarargExpression"
    }

    /**
     * expr을 컴파일해서 "정확히 wantCount개"의 값을 base..base+wantCount-1에 채운다
     * (모자라면 nil로 패딩). Call/MethodCall/Vararg만 1개 이상을 낼 수 있고, 그 외
     * 표현식은 항상 1개만 내므로 나머지는 자동으로 nil 패딩된다.
     */
    private compileExprMultiInto(expr: Expression, state: FuncState, base: number, wantCount: number): void {
        if (wantCount <= 0) return
        if (expr.type === "CallExpression") {
            const calleeReg = this.compileExpr(expr.callee, state)
            const b = this.compileCallArgsAndGetB(expr.arguments, state, calleeReg + 1)
            this.emit(state, Opcode.CALL, calleeReg, b, wantCount + 1)
            for (let i = 0; i < wantCount; i++) {
                if (calleeReg + i !== base + i) this.emit(state, Opcode.MOVE, base + i, calleeReg + i, 0)
            }
            state.regs.freeTemp(base + wantCount)
            return
        }
        if (expr.type === "MethodCallExpression") {
            const objReg = this.compileExpr(expr.object, state)
            const k = this.konst(state, expr.method.name)
            const fnSlot = state.regs.allocTemp()
            this.emit(state, Opcode.SELF, fnSlot, objReg, RK(k, true))
            state.regs.allocTemp()
            const argB = this.compileCallArgsAndGetB(expr.arguments, state, fnSlot + 2)
            const b = argB === 0 ? 0 : expr.arguments.length + 2
            this.emit(state, Opcode.CALL, fnSlot, b, wantCount + 1)
            for (let i = 0; i < wantCount; i++) {
                if (fnSlot + i !== base + i) this.emit(state, Opcode.MOVE, base + i, fnSlot + i, 0)
            }
            state.regs.freeTemp(base + wantCount)
            return
        }
        if (expr.type === "VarargExpression") {
            this.emit(state, Opcode.VARARG, base, wantCount + 1, 0)
            state.regs.freeTemp(base + wantCount)
            return
        }
        // 다중값 불가능 — 1개만 채우고 나머지는 nil.
        this.compileExprTo(expr, state, base)
        for (let i = 1; i < wantCount; i++) this.emit(state, Opcode.LOADNIL, base + i, base + i, 0)
    }

    /**
     * expr을 컴파일해서 "런타임이 결정하는 개수만큼" base부터 이어서 채운다(frame.multiTop
     * 갱신). Call/MethodCall/Vararg가 아니면 그냥 1개로 취급(compileExprTo와 동일).
     * `return f()`나 `g(a, f())`의 마지막 인자처럼 다중값을 그대로 전파할 때 씀.
     */
    private compileExprOpenInto(expr: Expression, state: FuncState, base: number): void {
        if (expr.type === "CallExpression") {
            // 결과 개수를 컴파일 타임에 모르므로(=open) CALL 이후엔 값들을 재배치할 수 없다.
            // 그래서 CALL "전에" callee 자체를 base로 강제 이동시켜, CALL이 쓰는 'a'가
            // 곧 base가 되도록 만든다(그래야 열린 결과가 정확히 base부터 채워짐).
            const calleeReg = this.compileExpr(expr.callee, state)
            if (calleeReg !== base) this.emit(state, Opcode.MOVE, base, calleeReg, 0)
            state.regs.freeTemp(base + 1)
            const b = this.compileCallArgsAndGetB(expr.arguments, state, base + 1)
            this.emit(state, Opcode.CALL, base, b, 0)
            return
        }
        if (expr.type === "MethodCallExpression") {
            const objReg = this.compileExpr(expr.object, state)
            const k = this.konst(state, expr.method.name)
            const fnSlot = state.regs.allocTemp()
            this.emit(state, Opcode.SELF, fnSlot, objReg, RK(k, true))
            state.regs.allocTemp() // fnSlot+1 = self
            if (fnSlot !== base) {
                this.emit(state, Opcode.MOVE, base, fnSlot, 0)
                this.emit(state, Opcode.MOVE, base + 1, fnSlot + 1, 0)
            }
            state.regs.freeTemp(base + 2)
            const argB = this.compileCallArgsAndGetB(expr.arguments, state, base + 2)
            const b = argB === 0 ? 0 : expr.arguments.length + 2
            this.emit(state, Opcode.CALL, base, b, 0)
            return
        }
        if (expr.type === "VarargExpression") {
            this.emit(state, Opcode.VARARG, base, 0, 0)
            return
        }
        this.compileExprTo(expr, state, base)
    }

    /**
     * 호출 인자 목록을 base부터 컴파일. 마지막 인자가 다중값 가능한 표현식이면 열어서
     * 끝까지 전파(`f(a, g())`가 g()의 모든 반환값을 다 넘기도록)하고 CALL의 b로 쓸 값(0)을
     * 반환한다. 아니면 고정 개수(b=args.length+1)를 반환.
     */
    private compileCallArgsAndGetB(args: Expression[], state: FuncState, base: number): number {
        if (args.length === 0) return 1
        for (let i = 0; i < args.length - 1; i++) this.compileExprTo(args[i], state, base + i)
        const last = args[args.length - 1]
        const lastBase = base + args.length - 1
        if (this.isMultiValueExpr(last)) {
            this.compileExprOpenInto(last, state, lastBase)
            return 0
        }
        this.compileExprTo(last, state, lastBase)
        return args.length + 1
    }

    private compileExpr(expr: Expression, state: FuncState, discard = false): number {
        switch (expr.type) {
            case "NilLiteral": {
                const r = state.regs.allocTemp()
                this.emit(state, Opcode.LOADNIL, r, r, 0)
                return r
            }
            case "BooleanLiteral": {
                const r = state.regs.allocTemp()
                this.emit(state, Opcode.LOADBOOL, r, expr.value ? 1 : 0, 0)
                return r
            }
            case "NumberLiteral":
                return this.loadConst(state, expr.value)
            case "StringLiteral":
                return this.loadConst(state, expr.value)
            case "Identifier": {
                const bindingId = this.bindingIdOf(expr)
                if (bindingId === undefined) throw new Error("vmify: unresolved identifier")
                const r = state.regs.allocTemp()
                this.emitLoadBinding(state, bindingId, r)
                return r
            }
            case "ParenthesizedExpression":
                return this.compileExpr(expr.expression, state)
            case "TypeAssertionExpression":
                return this.compileExpr(expr.expression, state)
            case "BinaryExpression": {
                if (expr.operator === "and" || expr.operator === "or") {
                    return this.compileLogical(expr.operator, expr.left, expr.right, state)
                }
                let leftExpr = expr.left
                let rightExpr = expr.right
                let op: Opcode
                let swap = false
                let negate = false
                switch (expr.operator) {
                    case "+": op = Opcode.ADD; break
                    case "-": op = Opcode.SUB; break
                    case "*": op = Opcode.MUL; break
                    case "/": op = Opcode.DIV; break
                    case "//": op = Opcode.IDIV; break
                    case "%": op = Opcode.MOD; break
                    case "^": op = Opcode.POW; break
                    case "..": op = Opcode.CONCAT; break
                    case "==": op = Opcode.EQ; break
                    case "~=": op = Opcode.EQ; negate = true; break
                    case "<": op = Opcode.LT; break
                    case "<=": op = Opcode.LE; break
                    case ">": op = Opcode.LT; swap = true; break
                    case ">=": op = Opcode.LE; swap = true; break
                    default:
                        throw new Error(`vmify: unsupported binary operator ${expr.operator}`)
                }
                if (swap) { const t = leftExpr; leftExpr = rightExpr; rightExpr = t }
                const l = this.compileExpr(leftExpr, state)
                const r = this.compileExpr(rightExpr, state)
                const dest = state.regs.allocTemp()
                this.emit(state, op, dest, l, r)
                if (negate) this.emit(state, Opcode.NOT, dest, dest, 0)
                state.regs.freeTemp(dest + 1)
                return dest
            }
            case "UnaryExpression": {
                const argReg = this.compileExpr(expr.argument, state)
                const dest = state.regs.allocTemp()
                const op = expr.operator === "-" ? Opcode.UNM : expr.operator === "not" ? Opcode.NOT : Opcode.LEN
                this.emit(state, op, dest, argReg, 0)
                state.regs.freeTemp(dest + 1)
                return dest
            }
            case "TableExpression": {
                const dest = state.regs.allocTemp()
                this.emit(state, Opcode.NEWTABLE, dest, 0, 0)
                let posIndex = 1
                for (let fi = 0; fi < expr.fields.length; fi++) {
                    const field = expr.fields[fi]
                    const isLast = fi === expr.fields.length - 1
                    if (field.type === "TableFieldPositional") {
                        // 마지막 positional 필드가 Call/MethodCall/Vararg면 다중값을 전부
                        // 펼쳐서 posIndex, posIndex+1, ...에 채운다 (`{...}`, `{f()}`).
                        if (isLast && this.isMultiValueExpr(field.value)) {
                            const valuesBase = state.regs.allocTemp()
                            this.compileExprOpenInto(field.value, state, valuesBase)
                            this.emit(state, Opcode.SETLIST, dest, valuesBase, posIndex)
                            state.regs.freeTemp(valuesBase)
                        } else {
                            const v = this.compileExpr(field.value, state)
                            const k = this.konst(state, posIndex++)
                            this.emit(state, Opcode.SETTABLE, dest, RK(k, true), v)
                            state.regs.freeTemp(v)
                        }
                    } else if (field.type === "TableFieldNamed") {
                        const v = this.compileExpr(field.value, state)
                        const k = this.konst(state, field.name.name)
                        this.emit(state, Opcode.SETTABLE, dest, RK(k, true), v)
                        state.regs.freeTemp(v)
                    } else {
                        const k = this.compileExpr(field.key, state)
                        const v = this.compileExpr(field.value, state)
                        this.emit(state, Opcode.SETTABLE, dest, k, v)
                        state.regs.freeTemp(k)
                    }
                }
                return dest
            }
            case "MemberExpression": {
                const objReg = this.compileExpr(expr.object, state)
                const k = this.konst(state, expr.property.name)
                const dest = state.regs.allocTemp()
                this.emit(state, Opcode.GETTABLE, dest, objReg, RK(k, true))
                state.regs.freeTemp(dest + 1)
                return dest
            }
            case "IndexExpression": {
                const objReg = this.compileExpr(expr.object, state)
                const keyReg = this.compileExpr(expr.index, state)
                const dest = state.regs.allocTemp()
                this.emit(state, Opcode.GETTABLE, dest, objReg, keyReg)
                state.regs.freeTemp(dest + 1)
                return dest
            }
            case "CallExpression": {
                // 주의: base는 반드시 compileExpr(callee)의 "반환값"이어야 한다 — top()을
                // 미리 캐싱하면 안 됨. callee가 MemberExpression/IndexExpression처럼 내부에서
                // 스크래치 레지스터를 소모하는 표현식이면 실제 함수 값은 사전 계산한 top()보다
                // 한 칸 이상 위에 놓이기 때문(예: `Account.new(...)`에서 Account를 읽는 데
                // 쓴 임시 레지스터 때문에 함수 값 자체는 그 다음 슬롯에 옴).
                const base = this.compileExpr(expr.callee, state)
                const b = this.compileCallArgsAndGetB(expr.arguments, state, base + 1)
                this.emit(state, Opcode.CALL, base, b, discard ? 1 : 2)
                state.regs.freeTemp(base + (discard ? 0 : 1))
                return base
            }
            case "MethodCallExpression": {
                const objReg = this.compileExpr(expr.object, state)
                const k = this.konst(state, expr.method.name)
                const fnSlot = state.regs.allocTemp()
                this.emit(state, Opcode.SELF, fnSlot, objReg, RK(k, true))
                state.regs.allocTemp()
                const argB = this.compileCallArgsAndGetB(expr.arguments, state, fnSlot + 2)
                // self가 항상 고정으로 하나 더 붙으므로: 열려있으면(0) 그대로 0(런타임이
                // multiTop까지 다 잡아줌, self도 그 범위 안에 포함됨), 아니면 +1(self 몫).
                const b = argB === 0 ? 0 : expr.arguments.length + 2
                this.emit(state, Opcode.CALL, fnSlot, b, discard ? 1 : 2)
                state.regs.freeTemp(fnSlot + (discard ? 0 : 1))
                return fnSlot
            }
            case "FunctionExpression": {
                const protoIdx = this.compileFunctionBody(expr.func, state)
                const dest = state.regs.allocTemp()
                this.emitClosure(state, dest, protoIdx)
                return dest
            }
            case "InterpolatedStringExpression": {
                let acc: number | null = null
                for (const part of expr.parts) {
                    const partReg = part.kind === "string"
                        ? this.loadConst(state, part.value)
                        : this.compileExpr(part.expression, state)
                    if (acc === null) {
                        acc = partReg
                    } else {
                        const dest = state.regs.allocTemp()
                        this.emit(state, Opcode.CONCAT, dest, acc, partReg)
                        state.regs.freeTemp(dest + 1)
                        acc = dest
                    }
                }
                return acc ?? this.loadConst(state, "")
            }
            case "VarargExpression": {
                const r = state.regs.allocTemp()
                this.emit(state, Opcode.VARARG, r, 2, 0, "vararg (1 value)")
                return r
            }
            case "IfElseExpression": {
                const dest = state.regs.allocTemp()
                const endPatches: number[] = []
                for (const clause of expr.clauses) {
                    const condReg = this.compileExpr(clause.condition, state)
                    this.emit(state, Opcode.TEST, condReg, 0, 1)  // skip next(jump-away) when truthy
                    const skip = this.emit(state, Opcode.JMP, 0, 0, 0)
                    state.regs.freeTemp(condReg)
                    const bodyReg = this.compileExpr(clause.body, state)
                    if (bodyReg !== dest) this.emit(state, Opcode.MOVE, dest, bodyReg, 0)
                    state.regs.freeTemp(dest + 1)
                    const toEnd = this.emit(state, Opcode.JMP, 0, 0, 0)
                    endPatches.push(toEnd)
                    this.patchJump(state, skip, state.proto.code.length)
                }
                const altReg = this.compileExpr(expr.alternate, state)
                if (altReg !== dest) this.emit(state, Opcode.MOVE, dest, altReg, 0)
                state.regs.freeTemp(dest + 1)
                for (const p of endPatches) this.patchJump(state, p, state.proto.code.length)
                return dest
            }
            default: {
                const _exhaustive: never = expr
                throw new Error(`vmify: unhandled expression ${(_exhaustive as Expression).type}`)
            }
        }
    }

    private compileLogical(operator: "and" | "or", left: Expression, right: Expression, state: FuncState): number {
        const dest = this.compileExpr(left, state)
        // and: 왼쪽이 falsy면 단락(오른쪽 평가 JMP를 반드시 실행) -> "JMP가 실행돼야 함"은
        //      skip-조건이 falsy일 때 거짓이어야 한다는 뜻 -> skip-on-truthy -> c=1.
        // or:  왼쪽이 truthy면 단락 -> 반대로 skip-on-falsy -> c=0.
        this.emit(state, Opcode.TEST, dest, 0, operator === "and" ? 1 : 0, `${operator} short-circuit`)
        const skip = this.emit(state, Opcode.JMP, 0, 0, 0)
        state.regs.freeTemp(dest)
        const rightReg = this.compileExpr(right, state)
        if (rightReg !== dest) this.emit(state, Opcode.MOVE, dest, rightReg, 0)
        this.patchJump(state, skip, state.proto.code.length)
        state.regs.freeTemp(dest + 1)
        return dest
    }

    private emitClosure(state: FuncState, dest: number, protoIdx: number): void {
        this.emit(state, Opcode.CLOSURE, dest, protoIdx, 0)
        const proto = state.proto.protos[protoIdx]
        for (const desc of proto.upvalDescs) {
            if (desc.kind === "local") this.emit(state, Opcode.MOVE, 0, desc.index, 0, "capture local")
            else this.emit(state, Opcode.GETUPVAL, 0, desc.index, 0, "capture upval")
        }
    }

    private compileFunctionBody(fb: FunctionBody, parent: FuncState): number {
        const marker = ownerFunctionOf(this.enclosing, fb)
        const child = this.newFuncState(parent, marker)
        child.proto.numParams = fb.params.length
        child.proto.hasVarargs = fb.hasVarargs
        // 자연 파라미터 레지스터(0..numParams-1)를 "전부 먼저" 확정해야 한다 — 런타임
        // 프롤로그가 정확히 그 범위에 인자를 채워 넣기 때문(R[i-1]=args[i]). 캡처되는
        // 파라미터가 있다고 해서 중간에 박스 레지스터를 끼워 넣으면 그 뒤 파라미터들의
        // 자연 슬롯 번호가 밀려서 호출 규약이 깨진다 — 그래서 박스는 반드시 "두 번째 패스"에서,
        // 이미 확정된 자연 레지스터 값을 따로 옮겨 담는 방식으로 만든다.
        const naturalRegs: number[] = fb.params.map(() => child.regs.declareLocal())
        for (let i = 0; i < fb.params.length; i++) {
            const bindingId = this.bindingIdOfDecl(fb.params[i])
            if (this.captured.has(bindingId)) {
                const boxReg = child.regs.declareLocal()
                this.emitNewBox(child, boxReg)
                const k = this.konst(child, BOX_FIELD)
                this.emit(child, Opcode.SETTABLE, boxReg, RK(k, true), naturalRegs[i])
                child.localSlots.set(bindingId, { reg: boxReg, boxed: true })
            } else {
                child.localSlots.set(bindingId, { reg: naturalRegs[i], boxed: false })
            }
        }
        this.compileBlock(fb.body, child)
        this.emit(child, Opcode.RETURN, 0, 1, 0)
        child.proto.maxRegs = child.regs.maxUsed
        parent.proto.protos.push(child.proto)
        return parent.proto.protos.length - 1
    }
}
