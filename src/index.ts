import type { Program } from "luau-parser"
import { luauparser } from "luau-parser"
import type { ObfuscateConfig, ObfuscateConfigEach, ObfuscatePartialConfig } from "./config"
import { ObfuscateDefault, mergeConfig } from "./config"
import { runPipeline } from "./pipeline"
import { minifyPrinted } from "./passes/Minify"

export type { ObfuscateConfig, ObfuscateConfigEach, ObfuscatePartialConfig } from "./config"
export { ObfuscateDefault } from "./config"
export { PASS_ORDER, PASS_MAP } from "./pipeline"

export function obfuscateByAst(program: Program, PConfig?: ObfuscatePartialConfig): string {
    const config = mergeConfig(ObfuscateDefault, PConfig ?? {})
    runPipeline(program, config)
    const printed = luauparser.print(program)
    return config.Minify.active ? minifyPrinted(printed) : printed
}

export function obfuscate(source: string, PConfig?: ObfuscatePartialConfig): string {
    const program = luauparser.parse(source)
    return obfuscateByAst(program, PConfig)
}