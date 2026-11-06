import type { Program } from "luau-parser"
import type { ObfuscateConfig } from "./config"
import { runStripTypes } from "./passes/StripTypes"
import { runStringsToExpressions } from "./passes/StringsToExpressions"
import { runNumbersToExpressions } from "./passes/NumbersToExpressions"
import { runRenameVariables } from "./passes/RenameVariables"
import { runGlobalMapping } from "./passes/GlobalMapping"
import { runConstantArray } from "./passes/ConstantArray"
import { runEncryptStrings } from "./passes/EncryptStrings"
import { runEncryptNumbers } from "./passes/EncryptNumbers"
import { runInsertJunk } from "./passes/InsertJunk"
import { runWrapInFunction } from "./passes/WrapInFunction"
import { runVmify } from "./passes/Vmify"
import { runControlFlowFlattening } from "./passes/ControlFlowFlattening"
import { runOpaquePredicates } from "./passes/OpaquePredicates"
import { runExpressionMBA } from "./passes/ExpressionMBA"

type PassFn = (program: Program, options: any) => void

export const PASS_ORDER: (keyof ObfuscateConfig)[] = [
    // 문자열 암호화는 Vmify "앞"에서 돈다. 그래야 복호 호출(decoder(...))과
    // decoder 본문, 마스터 시드 결합까지 Vmify가 바이트코드로 삼켜서, 공격자가
    // VM을 에뮬레이트하지 않고 문자열 풀만 정적 평가해 평문을 복원하는 길이
    // 막힌다. (Vmify가 켜져 있으면 runPipeline이 EncryptStrings에 preVm을 주입해
    // 자체 제어흐름 래핑을 끈다 — 그 래핑까지 컴파일되면 산출물이 폭발하므로.)
    //
    // EncryptStrings가 StringsToExpressions보다 먼저 와야 한다.
    // 두 패스 모두 StringLiteral 노드만 변환하는데, 먼저 도는 쪽이 리터럴을 소비한다.
    // EncryptStrings는 문자열을 암호문 바이트로 바꿔 원문이 소스에 전혀 남지 않게
    // 하므로 이쪽을 우선한다. (StringsToExpressions는 EncryptStrings가 꺼졌을 때만
    // 동작하는 평문 string.char 기반 경량 폴백으로 남는다.)
    "EncryptStrings",
    "StringsToExpressions",
    "Vmify",
    // 구조 변형(제어 흐름)은 이름/상수 난독화보다 먼저 돌린다. 여기서 새로
    // 생기는 숫자(state 번호, opaque predicate 상수)는 뒤쪽 숫자 패스가 다시
    // 표현식으로 부풀려 숨기고, state 변수/호이스팅 로컬은 RenameVariables가
    // 한 번 더 이름을 바꿔준다.
    "ControlFlowFlattening",
    "OpaquePredicates",
    "GlobalMapping",
    "RenameVariables",
    "ConstantArray",
    // ExpressionMBA는 다른 숫자 패스보다 먼저 돈다 — 출력 상수를 structural로
    // 찍으므로 뒤의 NumbersToExpressions/EncryptNumbers가 그 값들을 건너뛴다.
    "ExpressionMBA",
    "NumbersToExpressions",
    "EncryptNumbers",
    "InsertJunk",
    "WrapInFunction",
    "Minify",
]

export const PASS_MAP: Partial<Record<keyof ObfuscateConfig, PassFn>> = {
    GlobalMapping: runGlobalMapping,
    StringsToExpressions: runStringsToExpressions,
    NumbersToExpressions: runNumbersToExpressions,
    RenameVariables: runRenameVariables,
    ConstantArray: runConstantArray,
    EncryptStrings: runEncryptStrings,
    EncryptNumbers: runEncryptNumbers,
    InsertJunk: runInsertJunk,
    WrapInFunction: runWrapInFunction,
    Vmify: runVmify,
    ControlFlowFlattening: runControlFlowFlattening,
    OpaquePredicates: runOpaquePredicates,
    ExpressionMBA: runExpressionMBA,
}

export function runPipeline(program: Program, config: ObfuscateConfig): void {
    runStripTypes(program)

    for (const key of PASS_ORDER) {
        const feature = config[key]
        if (!feature.active) continue

        const pass = PASS_MAP[key]
        if (!pass) continue

        const { active, ...options } = feature as { active: true } & Record<string, unknown>

        // Vmify가 켜져 있으면 EncryptStrings는 "VM화 전 최소 모드"로 돈다.
        // (자체 제어흐름 래핑/숫자 위장을 끄고, 그 은닉은 VM에 맡긴다.)
        if (key === "EncryptStrings" && config.Vmify.active) {
            ;(options as Record<string, unknown>).preVm = true
        }

        pass(program, options)
    }
}