import { Program } from 'luau-parser';

interface StringsToExpressionsOptions {
    /** 청크 하나에 들어가는 바이트 개수 최소값 */
    min: number;
    /** 청크 하나에 들어가는 바이트 개수 최대값 */
    max: number;
    /**
     * 0~1. 청크를 소스 순서 그대로 이어붙이는 대신, 순서를 섞어 저장해두고
     * for 루프나 재귀 함수로 원래 순서를 되짚어가며 런타임에 조립할 확률.
     * 소스에 보이는 조각 순서와 실제 결합 순서가 달라지므로, 단순 텍스트 상의
     * concat 체인 스캔만으로는 원문을 복원할 수 없다. 기본값 0.6.
     */
    controlFlowProbability?: number;
}

interface NumbersToExpressionsOptions {
    /** 랜덤 보조항의 최소 절댓값 */
    min: number;
    /** 랜덤 보조항의 최대 절댓값 */
    max: number;
    /**
     * 0~1. 정수 리터럴을 순수 산술식(depth 얕은 a+b 형태) 대신
     * for/while 루프나 재귀 함수 호출로 "런타임에 조립"할 확률.
     * 단순 트리 순회형 상수 접기(constant folding)는 문(statement)/제어흐름을
     * 해석하지 못하므로 이 경로로 만든 값은 그런 도구로는 복원되지 않는다.
     * 기본값 0.35.
     */
    controlFlowProbability?: number;
}

interface RenameVariablesOptions {
    random: () => string;
}

interface GlobalMappingOptions {
    /** 전역들을 담아둘 최상단 local 테이블 변수 이름. RenameVariables가 이후에
     *  다시 실행되면 이 이름도 다른 이름으로 한 번 더 바뀜. */
    tableName: string;
}

interface EncryptStringsOptions {
}

interface EncryptNumbersOptions {
}

interface VmifyOptions {
    /**
     * 스코프 분석에 미리 등록해둘 전역 이름 시드 목록. 여기 없는 이름이라도 프로그램에서
     * 실제로 참조되면(로컬/파라미터/업밸류로 안 풀리는 식별자는 전부) 스코프 분석이
     * 자동으로 전역으로 잡아내므로, 브릿지 테이블은 이 옵션이 아니라
     * VmCompiler.getUsedGlobalNames()(실제 사용된 전역 전체)로 만든다 — 옛날엔 이 목록에
     * 없는 이름을 쓰면 컴파일은 되는데 GETGLOBAL이 조용히 nil을 반환해서
     * "attempt to call a nil value"로 터졌었음.
     */
    builtinGlobals?: readonly string[];
    /**
     * opcode 번호 셔플 + 전역/필드 이름 무작위화에 쓸 난수 생성기. 지정하지 않으면
     * Math.random. 재현 가능한 빌드가 필요하면(테스트 등) 시드 고정 PRNG를 넘길 것.
     */
    random?: () => number;
}

type ObfuscateConfigEach<C> = ({
    active: true;
} & C) | {
    active: false;
};
type ObfuscateConfig = {
    Vmify: ObfuscateConfigEach<VmifyOptions>;
    Minify: ObfuscateConfigEach<{}>;
    StringsToExpressions: ObfuscateConfigEach<StringsToExpressionsOptions>;
    NumbersToExpressions: ObfuscateConfigEach<NumbersToExpressionsOptions>;
    EncryptStrings: ObfuscateConfigEach<EncryptStringsOptions>;
    EncryptNumbers: ObfuscateConfigEach<EncryptNumbersOptions>;
    RenameVariables: ObfuscateConfigEach<RenameVariablesOptions>;
    GlobalMapping: ObfuscateConfigEach<GlobalMappingOptions>;
    ConstantArray: ObfuscateConfigEach<{}>;
    InsertJunk: ObfuscateConfigEach<{
        probability: number;
        maxPerBlock: number;
    }>;
    WrapInFunction: ObfuscateConfigEach<{}>;
};
type ExtractOptions<T> = T extends {
    active: true;
} ? Omit<T, "active"> : never;
/**
 * 사용자가 넘기는 partial config.
 * 각 feature는 `{active:false}`를 통째로 넘기거나,
 * `{active:true}` + 옵션 일부만 override 하는 형태만 허용.
 * (재귀적 DeepMerge는 이 판별 유니온 구조를 깨서 쓰지 않음)
 */
type ObfuscatePartialConfig = {
    [K in keyof ObfuscateConfig]?: {
        active: false;
    } | ({
        active: true;
    } & Partial<ExtractOptions<ObfuscateConfig[K]>>);
};
declare const ObfuscateDefault: ObfuscateConfig;

type PassFn = (program: Program, options: any) => void;
declare const PASS_ORDER: (keyof ObfuscateConfig)[];
declare const PASS_MAP: Partial<Record<keyof ObfuscateConfig, PassFn>>;

declare function obfuscateByAst(program: Program, PConfig?: ObfuscatePartialConfig): string;
declare function obfuscate(source: string, PConfig?: ObfuscatePartialConfig): string;

export { type ObfuscateConfig, type ObfuscateConfigEach, ObfuscateDefault, type ObfuscatePartialConfig, PASS_MAP, PASS_ORDER, obfuscate, obfuscateByAst };
