/**
 * Vmify 런타임/청크에서 쓰는 모든 이름(전역 식별자 + Luau 테이블 필드 키)을 빌드마다
 * 무작위로 새로 뽑는다. opcode 번호 셔플(opcodes.ts)만으로는 부족한 게, "__VM_GLOBALS",
 * "__vm_execute", "frame.R/K/code" 같은 이름 자체가 모든 산출물에서 동일하면 그 문자열
 * 만으로 grep 한 방에 VM 시그니처를 찾아낼 수 있기 때문. 여기서 만든 이름들은
 * runtime.ts(핸들러 본문), serialize.ts(Proto/Instr을 Luau 테이블로 찍을 때 쓰는 키),
 * Vmify.ts(바깥에서 __vm_execute를 부르는 wrapper 코드) 세 곳이 전부 같은 VmNames
 * 인스턴스를 공유해야 앞뒤가 맞는다.
 */
export interface VmNames {
    /** local __VM_GLOBALS = { ... } 에 해당하는 최상위 local 이름 */
    globals: string
    /** local __VM_PROTO = { ... } */
    protoRoot: string
    /** function __vm_execute(proto, upvals, ...) */
    execute: string
    /** local __vm_handlers = {} */
    handlers: string
    /** local function __vm_dispatch(frame, pc) */
    dispatch: string
    /** local function __vm_rk(frame, x) */
    rk: string
    /** __vm_execute/핸들러의 frame 파라미터 이름 */
    frame: string
    // frame 테이블 필드
    R: string
    K: string
    code: string
    protos: string
    upvals: string
    varargs: string
    nVarargs: string
    multiTop: string
    // Instr 테이블 필드 (serialize.ts가 찍고 runtime.ts가 읽음)
    op: string
    a: string
    b: string
    c: string
    // Proto 테이블 필드
    numParams: string
    hasVarargs: string
    maxRegs: string
    consts: string
    upvalDescs: string
    kind: string
    index: string
}

const ID_CHARS_HEAD = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_"
const ID_CHARS_TAIL = ID_CHARS_HEAD + "0123456789"

function makeIdGenerator(random: () => number): () => string {
    const used = new Set<string>()
    return () => {
        let id: string
        do {
            const len = 5 + Math.floor(random() * 5)
            let s = ID_CHARS_HEAD[Math.floor(random() * ID_CHARS_HEAD.length)]
            for (let i = 1; i < len; i++) s += ID_CHARS_TAIL[Math.floor(random() * ID_CHARS_TAIL.length)]
            id = s
        } while (used.has(id))
        used.add(id)
        return id
    }
}

export function generateVmNames(random: () => number = Math.random): VmNames {
    const id = makeIdGenerator(random)
    return {
        globals: id(), protoRoot: id(), execute: id(), handlers: id(), dispatch: id(), rk: id(),
        frame: id(),
        R: id(), K: id(), code: id(), protos: id(), upvals: id(), varargs: id(),
        nVarargs: id(), multiTop: id(),
        op: id(), a: id(), b: id(), c: id(),
        numParams: id(), hasVarargs: id(), maxRegs: id(), consts: id(), upvalDescs: id(),
        kind: id(), index: id(),
    }
}
