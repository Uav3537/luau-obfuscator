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

type PassFn = (program: Program, options: any) => void

export const PASS_ORDER: (keyof ObfuscateConfig)[] = [
    "Vmify",
    "GlobalMapping",
    "RenameVariables",
    "ConstantArray",
    // EncryptStrings가 StringsToExpressions보다 먼저 와야 한다.
    // 두 패스 모두 StringLiteral 노드만 변환하는데, 먼저 도는 쪽이 리터럴을 소비한다.
    // EncryptStrings는 문자열을 암호문 바이트 + 셔플/제어흐름 조립으로 바꿔 원문이
    // 소스에 전혀 남지 않게 하므로 이쪽을 우선한다. (StringsToExpressions는
    // EncryptStrings가 꺼졌을 때만 동작하는 평문 string.char 기반 경량 폴백으로 남는다.)
    "EncryptStrings",
    "StringsToExpressions",
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
}

export function runPipeline(program: Program, config: ObfuscateConfig): void {
    runStripTypes(program)

    for (const key of PASS_ORDER) {
        const feature = config[key]
        if (!feature.active) continue

        const pass = PASS_MAP[key]
        if (!pass) continue

        const { active, ...options } = feature as { active: true } & Record<string, unknown>
        pass(program, options)
    }
}