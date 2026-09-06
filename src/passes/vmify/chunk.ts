import type { Instr } from "./opcodes"

/** 상수 풀에 들어갈 수 있는 값. */
export type ConstValue = string | number | boolean | null

/**
 * upvalue 하나가 부모 함수 기준으로 어디서 오는지.
 * - "local": 부모 함수의 레지스터(박스)를 그대로 캡처
 * - "upval": 부모 함수 자신의 upvalue를 한 단계 더 전달(중첩 클로저)
 */
export interface UpvalDesc {
    kind: "local" | "upval"
    index: number
}

/** 함수 하나(최상위 청크 포함)에 대응하는 컴파일 결과. Lua의 Proto와 동일한 역할. */
export interface Proto {
    id: number
    numParams: number
    hasVarargs: boolean
    maxRegs: number
    code: Instr[]
    consts: ConstValue[]
    /** consts 배열과 별도로 유지하는 value -> index 조회용 인덱스 (interning을 O(1)로). */
    constIndex: Map<ConstValue, number>
    /** 이 함수가 캡처하는 upvalue들이 "부모" 기준 어디서 오는지. */
    upvalDescs: UpvalDesc[]
    /** 중첩 함수 표현식들. CLOSURE 명령의 B는 이 배열의 인덱스. */
    protos: Proto[]
}

export function createProto(id: number): Proto {
    return {
        id,
        numParams: 0,
        hasVarargs: false,
        maxRegs: 0,
        code: [],
        consts: [],
        constIndex: new Map(),
        upvalDescs: [],
        protos: [],
    }
}

/** 상수 풀에 값 추가(중복 제거) 후 인덱스 반환. */
export function internConst(proto: Proto, value: ConstValue): number {
    const existing = proto.constIndex.get(value)
    if (existing !== undefined) return existing
    proto.consts.push(value)
    const idx = proto.consts.length - 1
    proto.constIndex.set(value, idx)
    return idx
}