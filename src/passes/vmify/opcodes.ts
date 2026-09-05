/**
 * Lua 5.1 스타일 레지스터 기반 opcode 세트 (Prometheus VM 모듈과 동일한 접근).
 * 각 opcode의 "구현"은 런타임 인터프리터(runtime.ts)에서 실제 Luau 연산자로
 * 그대로 매핑되므로, 여기서는 opcode 자체의 의미와 A/B/C 피연산자 규약만 정의한다.
 *
 * 규약 (Lua 5.1 바이트코드와 동일):
 *   A = 목적 레지스터
 *   B, C = 소스 레지스터 또는 상수 인덱스(RK) 또는 즉시값(점프 오프셋 등)
 *   RK(x): x >= 0 이면 레지스터 R[x], x < 0 이면 상수 K[-x-1] (상수/레지스터 구분을
 *   비트 하나로 안 하고 부호로 하는 이유: 구현 단순화. 실제 Lua는 비트 플래그를 씀)
 */
export enum Opcode {
    MOVE,        // R[A] = R[B]
    LOADK,       // R[A] = K[B]
    LOADBOOL,    // R[A] = (B != 0);  C != 0 이면 다음 명령 skip (조건부 분기 최적화용, 지금은 미사용)
    LOADNIL,     // R[A..B] = nil
    GETUPVAL,    // R[A] = U[B]
    SETUPVAL,    // U[B] = R[A]
    GETGLOBAL,   // R[A] = _G-equivalent[K[B]]  (아래 GlobalMapping 참고: 실제로는 GLOBAL 테이블 인덱싱)
    SETGLOBAL,   // GLOBAL[K[B]] = R[A]
    GETTABLE,    // R[A] = R[B][RK(C)]
    SETTABLE,    // R[A][RK(B)] = RK(C)
    NEWTABLE,    // R[A] = {}
    SELF,        // R[A+1] = R[B]; R[A] = R[B][RK(C)]   (메서드 호출 준비, TODO: 아직 컴파일러 미구현)
    ADD, SUB, MUL, DIV, MOD, POW,   // R[A] = RK(B) <op> RK(C)
    CONCAT,      // R[A] = R[B] .. .. R[C] (B..C 레지스터 범위 전부 이어붙임)
    UNM,         // R[A] = -R[B]
    NOT,         // R[A] = not R[B]
    LEN,         // R[A] = #R[B]
    JMP,         // pc += A  (무조건 점프, A는 부호 있는 오프셋)
    EQ, LT, LE,  // if (RK(B) <op> RK(C)) != A then pc++  (다음 명령은 보통 JMP)
    TEST,        // if (not R[A]) != C then pc++          (and/or 단락 평가, if 조건 등)
    CALL,        // R[A], ..., R[A+C-2] = R[A](R[A+1], ..., R[A+B-1])
                 //   B=0: 인자 전부 스택 끝까지(가변인자 호출), C=0: 반환값 전부 받음(가변반환)
    RETURN,      // return R[A], ..., R[A+B-2]   (B=0: R[A]부터 스택 끝까지 전부 반환)
    FORPREP,     // numeric for 초기화 + 조건 미충족 시 FORLOOP 뒤로 점프
    FORLOOP,     // numeric for 증분 + 조건 충족 시 루프 헤더로 점프
    CLOSURE,     // R[A] = 클로저(protos[B], 캡처된 upvalue 목록은 뒤따르는 pseudo-instr로 인코딩)
    VARARG,      // R[A..A+B-2] = ...   (B=0: 가변인자 전부)
    SETLIST,     // R[A][C], R[A][C+1], ... = R[B], R[B+1], ... (frame.multiTop까지) — 테이블
                 //   생성자 마지막 필드가 Call/MethodCall/Vararg로 다중값을 낼 때 씀 (`{f()}`, `{...}`)
    IDIV,        // R[A] = RK(B) // RK(C)  (Luau 바닥 나눗셈 연산자, 뒤에 추가되어 기존 opcode
                 //   번호를 안 건드림 — enum 중간에 끼워넣으면 runtime.ts의 숫자 인덱스가 전부 밀림)
}

export interface Instr {
    op: Opcode
    a: number
    b: number
    c: number
    /** JMP/EQ/LT/LE/TEST/CALL 등에서 사람이 읽을 디버깅용 주석. 런타임엔 안 쓰임. */
    comment?: string
}

/** RK 인코딩 헬퍼: 상수는 음수(-idx-1), 레지스터는 그대로 양수. */
export function RK(regOrConstIdx: number, isConst: boolean): number {
    return isConst ? -(regOrConstIdx + 1) : regOrConstIdx
}

/** 논리 opcode(Opcode enum) -> 실제 바이트코드 숫자. 빌드마다 무작위로 재배치된다. */
export type OpcodeMap = number[]

const OPCODE_COUNT = Object.keys(Opcode).filter((k) => Number.isNaN(Number(k))).length

/**
 * opcode 번호를 빌드마다 무작위로 섞는다. 이게 없으면 "MOVE=0, LOADK=1, ..." 같은
 * 고정 번호가 모든 산출물에서 동일해서, 한 번 리버싱해두면 opcode 핸들러 배열 인덱스만
 * 보고 바로 어떤 명령인지 알 수 있는 상수 시그니처가 되어버린다(디컴파일러가 제일
 * 먼저 노리는 지점). random을 주입받게 해서 테스트에서는 결정적 시퀀스도 쓸 수 있게 함.
 */
export function createOpcodeMap(random: () => number = Math.random): OpcodeMap {
    const perm = Array.from({ length: OPCODE_COUNT }, (_, i) => i)
    for (let i = perm.length - 1; i > 0; i--) {
        const j = Math.floor(random() * (i + 1))
        const tmp = perm[i]
        perm[i] = perm[j]
        perm[j] = tmp
    }
    return perm
}
