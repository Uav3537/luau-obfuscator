import type { Program } from "luau-parser"
import { analyzeScopes, isGlobal } from "luau-parser"

export interface RenameVariablesOptions {
    random: () => string
}

export function runRenameVariables(program: Program, options: RenameVariablesOptions): void {
    const analysis = analyzeScopes(program)

    for (const binding of analysis.bindings.values()) {
        if (isGlobal(binding)) continue
        if (binding.kind === "self") continue

        const newName = options.random()
        binding.name = newName

        if (binding.declarationNode) {
            binding.declarationNode.name = newName
        }
        for (const ref of binding.references) {
            ref.name = newName
        }
    }
}
