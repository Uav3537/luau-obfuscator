import type { StringsToExpressionsOptions } from "./passes/StringsToExpressions"
import type { NumbersToExpressionsOptions } from "./passes/NumbersToExpressions"
import type { RenameVariablesOptions } from "./passes/RenameVariables"
import type { GlobalMappingOptions } from "./passes/GlobalMapping"
import type { EncryptStringsOptions } from "./passes/EncryptStrings"
import type { EncryptNumbersOptions } from "./passes/EncryptNumbers"
import { VmifyOptions } from "./passes/Vmify"

export type ObfuscateConfigEach<C> = ({
    active: true
} & C) | {
    active: false
}

// 각 feature의 옵션 타입은 여기서 새로 선언하지 않고 해당 패스 파일에서 export한
// *Options 타입을 그대로 참조한다. 옵션 모양이 바뀌면 패스 파일 하나만 고치면 됨.
export type ObfuscateConfig = {
    Vmify: ObfuscateConfigEach<VmifyOptions>
    Minify: ObfuscateConfigEach<{}>
    StringsToExpressions: ObfuscateConfigEach<StringsToExpressionsOptions>
    NumbersToExpressions: ObfuscateConfigEach<NumbersToExpressionsOptions>
    EncryptStrings: ObfuscateConfigEach<EncryptStringsOptions>
    EncryptNumbers: ObfuscateConfigEach<EncryptNumbersOptions>
    RenameVariables: ObfuscateConfigEach<RenameVariablesOptions>
    GlobalMapping: ObfuscateConfigEach<GlobalMappingOptions>
    ConstantArray: ObfuscateConfigEach<{}>
    InsertJunk: ObfuscateConfigEach<{ probability: number, maxPerBlock: number }>
    WrapInFunction: ObfuscateConfigEach<{}>
}

// active:true 분기의 옵션 타입만 추출 (naked type param에 대한 distributive conditional type)
type ExtractOptions<T> = T extends { active: true } ? Omit<T, "active"> : never

/**
 * 사용자가 넘기는 partial config.
 * 각 feature는 `{active:false}`를 통째로 넘기거나,
 * `{active:true}` + 옵션 일부만 override 하는 형태만 허용.
 * (재귀적 DeepMerge는 이 판별 유니온 구조를 깨서 쓰지 않음)
 */
export type ObfuscatePartialConfig = {
    [K in keyof ObfuscateConfig]?:
        | { active: false }
        | ({ active: true } & Partial<ExtractOptions<ObfuscateConfig[K]>>)
}

export const ObfuscateDefault: ObfuscateConfig = {
    Vmify: { active: true },
    Minify: { active: true },
    StringsToExpressions: { active: true, min: 5, max: 10 },
    NumbersToExpressions: { active: true, min: 5, max: 10 },
    EncryptStrings: { active: true },
    EncryptNumbers: { active: true },
    RenameVariables: { active: true, random: () => "_" + globalThis.crypto.randomUUID().replace(/-/g, "") },
    GlobalMapping: { active: true, tableName: "GLOBAL" },
    ConstantArray: { active: true },
    InsertJunk: { active: true, probability: 0.7, maxPerBlock: 5 },
    WrapInFunction: { active: true },
}

export function mergeConfig(
    defaults: ObfuscateConfig,
    partial: ObfuscatePartialConfig,
): ObfuscateConfig {
    const result = {} as ObfuscateConfig

    for (const key of Object.keys(defaults) as (keyof ObfuscateConfig)[]) {
        const def = defaults[key]
        const part = partial[key]

        if (!part) {
            (result as any)[key] = def
        } else if (part.active === false) {
            (result as any)[key] = { active: false }
        } else {
            // active:true -> 기본값 위에 override만 얕게 덮어씀 (재귀 병합 없음)
            (result as any)[key] = { ...(def as object), ...(part as object), active: true }
        }
    }

    return result
}