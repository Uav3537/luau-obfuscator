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
    "StringsToExpressions",
    "NumbersToExpressions",
    "RenameVariables",
    "ConstantArray",
    "EncryptStrings",
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
    Vmify: runVmify
}

export function runPipeline(program: Program, config: ObfuscateConfig): void {
    // 타입 주석/별칭은 값 트리와 독립적으로 원본 이름을 참조하고 있어서
    // (예: typeof(x)) 어떤 pass보다도 먼저 지워야 함. 끄면 무조건 깨지므로
    // config로 조절 가능한 옵션이 아니라 파이프라인 진입 시 항상 실행.
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