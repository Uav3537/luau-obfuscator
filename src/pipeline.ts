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
    "StringsToExpressions",
    "NumbersToExpressions",
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