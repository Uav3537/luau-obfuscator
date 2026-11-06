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
    /** 암호화된 바이트를 소스에 흩뿌릴 때 청크 하나의 최소 바이트 수. 기본 4. */
    chunkMin?: number;
    /** 청크 하나의 최대 바이트 수. 기본 9. */
    chunkMax?: number;
    /**
     * 0~1. 암호문 바이트 배열을 소스에 보이는 순서 그대로가 아니라, 청크 단위로
     * 뒤섞어 저장해두고 for 루프나 재귀 함수로 원래 순서를 되짚어가며 런타임에
     * 재조립할 확률. 암호문이라 눈으로는 어차피 못 읽지만, 이걸 켜면 배열이
     * 소스상 연속/정렬된 리터럴로 남지 않아 정적 추적이 한 겹 더 어려워진다.
     * 기본값 0.7.
     */
    controlFlowProbability?: number;
    /**
     * "VM화 전"에 돌 때 켜는 최소 모드. pipeline이 Vmify가 켜져 있으면 자동으로
     * 주입한다. 이 패스의 결과(decoder 호출 + 데이터)가 곧바로 Vmify에 의해
     * 바이트코드로 컴파일되므로:
     *  - 자체 제어흐름 래핑(셔플/IIFE/재귀 재조립)을 끈다. 제어흐름 은닉은 VM이
     *    이미 제공하고, 이 기계를 문자열마다 컴파일하면 산출물이 곱셈적으로
     *    폭발하기 때문(= 원래 키를 VM 옆에 두던 구조의 유일한 실익을 날리는 주범).
     *  - key/mult/seed를 산술식으로 위장하지 않고 평이한 숫자로 둔다. 어차피 VM
     *    상수풀의 "그냥 숫자"가 되어 역할을 알 수 없으므로 위장이 불필요하고,
     *    위장을 빼면 바이트코드가 더 작아진다.
     */
    preVm?: boolean;
}

interface EncryptNumbersOptions {
}

interface ControlFlowFlatteningOptions {
    /** 이 개수 미만의 statement만 가진 본문은 평탄화해도 의미가 없으므로 건너뜀. */
    minStatements?: number;
    /** 호이스팅할 로컬과 state 변수에 붙일 고유 이름 생성기.
     *  생략하면 UUID 기반(충돌 불가능)으로 만든다. RenameVariables가 이후에
     *  한 번 더 이름을 바꿔주긴 하지만, 여기서 이미 "전역적으로 유일"해야
     *  호이스팅 시 바깥 스코프의 동명 변수를 가리는 일이 없다. */
    random?: () => string;
}

interface OpaquePredicatesOptions {
    /** 감쌀 수 있는 statement 하나를 실제로 감쌀 확률 (0~1). */
    probability?: number;
    /** true면 `else`에 절대 실행되지 않는 더미 분기를 붙여 혼란을 키운다. */
    deadBranch?: boolean;
}

interface ExpressionMBAOptions {
    /** 변환 대상 조건을 만족하는 정수 리터럴 하나를 실제로 MBA 식으로 바꿀 확률.
     *  (0~1) 산출물 크기를 조절한다. 기본 0.6. */
    probability?: number;
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
    /**
     * 디버그 빌드. 켜면 각 인스트럭션에 원본 소스 줄 번호를, CALL에는 호출 대상 이름을
     * 함께 직렬화하고, 런타임 CALL 핸들러가 non-callable 값을 부르려 할 때 그냥
     * "attempt to call a nil value"가 아니라 "[vmdebug] ... '대상이름' (source line N)"으로
     * 원본 위치를 찍어준다. 산출물이 조금 커지고 VM 시그니처가 노출되므로 진단용으로만 쓸 것.
     */
    debug?: boolean;
}

type ObfuscateConfigEach<C> = ({
    active: true;
} & C) | {
    active: false;
};
type ObfuscateConfig = {
    Vmify: ObfuscateConfigEach<VmifyOptions>;
    ControlFlowFlattening: ObfuscateConfigEach<ControlFlowFlatteningOptions>;
    OpaquePredicates: ObfuscateConfigEach<OpaquePredicatesOptions>;
    Minify: ObfuscateConfigEach<{}>;
    StringsToExpressions: ObfuscateConfigEach<StringsToExpressionsOptions>;
    NumbersToExpressions: ObfuscateConfigEach<NumbersToExpressionsOptions>;
    ExpressionMBA: ObfuscateConfigEach<ExpressionMBAOptions>;
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
