/**
 * Lua 레퍼런스 컴파일러와 동일한 방식의 레지스터 할당기.
 * - 지역변수는 선언 시점에 고정 슬롯을 받고, 그 슬롯은 스코프가 끝날 때까지 유지.
 * - 표현식 평가용 임시 레지스터는 `freereg`(다음으로 쓸 수 있는 첫 슬롯) 하나로 관리:
 *   필요하면 freereg 위치를 하나 배정하고 freereg++, 다 쓰면 다시 freereg--.
 *   "스택처럼" 위에서부터 빌렸다 반납하기 때문에, 지역변수 슬롯보다 아래로는
 *   절대 freereg가 내려가지 않는다(지역변수 보호).
 */
export class RegisterAllocator {
    /** 현재 스코프에서 지역변수가 차지하고 있는, 즉 "보호된" 레지스터 개수. */
    private localCount = 0
    /** 다음에 할당할 임시 레지스터 인덱스. */
    private freereg = 0
    /** 지금까지 이 함수에서 동시에 살아있었던 최대 레지스터 수(Proto.maxRegs에 기록). */
    maxUsed = 0

    /** 지역변수 하나를 위한 슬롯을 새로 확정한다. 반환값이 그 변수의 레지스터 번호. */
    declareLocal(): number {
        const slot = this.localCount
        this.localCount++
        if (this.freereg < this.localCount) this.freereg = this.localCount
        this.track()
        return slot
    }

    /** 블록/함수 스코프가 끝날 때, 그 스코프에서 선언된 지역변수 슬롯들을 반납. */
    releaseLocalsTo(savedLocalCount: number): void {
        this.localCount = savedLocalCount
        // 무조건 리셋(위로도 아래로도) — 스코프가 끝나면 그 안에서 쓴 지역/임시 레지스터는
        // 전부 죽은 값이다. freereg가 이미 더 높았다고 해서 그대로 두면(예전 버그), 그
        // 누수가 이후 모든 문장의 "top()" 기준점을 계속 밀어 올려서 눈덩이처럼 커진다.
        this.freereg = savedLocalCount
    }

    saveLocalCount(): number {
        return this.localCount
    }

    /** 표현식 평가용 임시 레지스터 하나 할당. */
    allocTemp(): number {
        const r = this.freereg
        this.freereg++
        this.track()
        return r
    }

    /**
     * 임시 레지스터 n개를 반납(freereg를 내림). 지역변수 보호 슬롯 밑으로는
     * 절대 안 내려가도록 clamp — 호출 순서가 꼬여도 지역변수는 항상 안전.
     */
    freeTemp(toReg: number): void {
        this.freereg = Math.max(toReg, this.localCount)
    }

    /** 지금 이 시점의 freereg. 임시 레지스터 블록 할당 전 저장해뒀다가 freeTemp에 씀. */
    top(): number {
        return this.freereg
    }

    private track(): void {
        if (this.freereg > this.maxUsed) this.maxUsed = this.freereg
    }
}
