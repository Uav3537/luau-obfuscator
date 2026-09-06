import type { Program, Statement, Expression } from "luau-parser"
import { luauparser } from "luau-parser"
import { VmCompiler, DEFAULT_BUILTIN_GLOBALS } from "./vmify/compiler"
import { serializeProto } from "./vmify/serialize"
import { buildVmRuntimeSource } from "./vmify/runtime"
import { createOpcodeMap } from "./vmify/opcodes"
import { generateVmNames } from "./vmify/names"
import {
    localStatement, identifier, call, table, namedField, returnStatement, vararg,
    vmStructuralNumbers,
} from "./nodeFactory"
import { transformExpressions } from "./walk"

/** 파싱된 서브트리(런타임 인터프리터 소스) 안의 모든 NumberLiteral을 vmStructuralNumbers로
 *  표시한다 — 인터프리터 자신의 +1/-1/패딩 같은 구현 디테일 상수는 사용자 데이터가 아닌데,
 *  수십 개 opcode 핸들러에 반복 등장해서 EncryptNumbers/NumbersToExpressions/ConstantArray가
 *  건드리면 곱셈적으로 부풀어 오른다. */
function markRuntimeNumbersAsStructural(body: { statements: Statement[] }): void {
    transformExpressions({ body } as Program, (expr) => {
        if (expr.type === "NumberLiteral") vmStructuralNumbers.add(expr)
        return undefined
    })
}

export interface VmifyOptions {
    /**
     * VM 밖에서 값을 그대로 참조해야 하는 전역 이름 목록(GETGLOBAL/SETGLOBAL 대상).
     * Luau엔 getfenv가 없어서 "임의의 전역 읽기"를 흉내낼 수 없기 때문에,
     * 여기 나열된 이름들만 브리지 테이블에 실제 값으로 미리 채워 넣는다.
     * 나열되지 않은 전역을 참조하면 컴파일은 되지만 런타임에 nil이 나온다 — 실사용 전
     * 반드시 프로그램에서 실제로 쓰는 전역 이름을 전부 이 목록에 채워야 함(TODO: 컴파일러가
     * ScopeAnalysis.globalsByName을 이용해 자동으로 목록을 뽑아주도록 개선 가능).
     */
    builtinGlobals?: readonly string[]
    /**
     * opcode 번호 셔플 + 전역/필드 이름 무작위화에 쓸 난수 생성기. 지정하지 않으면
     * Math.random. 재현 가능한 빌드가 필요하면(테스트 등) 시드 고정 PRNG를 넘길 것.
     */
    random?: () => number
}

/**
 * program 전체를 바이트코드로 컴파일하고, program.body를 다음 구조로 치환한다:
 *
 *   local <globals> = { print = print, game = game, ... }
 *   <런타임 인터프리터 함수 정의 — 식별자/opcode 번호는 매 빌드 무작위>
 *   local <protoRoot> = { ...직렬화된 바이트코드... }
 *   return <execute>(<protoRoot>, {}, ...)
 *
 * opcode 번호(opcodes.ts:createOpcodeMap)와 전역/필드 이름(names.ts:generateVmNames)을
 * 매 빌드 새로 뽑기 때문에, 컴파일된 청크와 런타임 인터프리터가 산출물마다 구조적으로
 * 달라진다 — "이 VM은 opcode 6이 GETGLOBAL이다" 같은 지식이 다음 빌드에는 안 통함.
 *
 * 주의: 이 패스는 pipeline.ts상 반드시 "가장 먼저"(StripTypes 다음) 실행돼야 한다 —
 * 컴파일이 끝나면 원본 statement/expression 노드 대부분이 바이트코드 숫자로 바뀌어
 * 사라지므로, 이후 패스(RenameVariables, EncryptStrings 등)가 손댈 원본 AST가 없다.
 */
export function runVmify(program: Program, options: VmifyOptions): void {
    const globalNames = options.builtinGlobals ?? DEFAULT_BUILTIN_GLOBALS
    const random = options.random ?? Math.random

    const opcodeMap = createOpcodeMap(random)
    const names = generateVmNames(random)

    const compiler = new VmCompiler(program, globalNames, opcodeMap)
    const topProto = compiler.compile()

    const globalsTable = table(
        globalNames.map((name) => namedField(name, identifier(name))),
    )

    const runtimeSource = buildVmRuntimeSource(names, opcodeMap)
    const runtimeProgram = luauparser.parse(runtimeSource)
    const runtimeStatements: Statement[] = runtimeProgram.body.statements
    markRuntimeNumbersAsStructural(runtimeProgram.body)

    const protoLiteral = serializeProto(topProto, names)

    const newBody: Statement[] = [
        localStatement(names.globals, globalsTable),
        ...runtimeStatements,
        localStatement(names.protoRoot, protoLiteral),
        returnStatement([call(identifier(names.execute), [identifier(names.protoRoot), table([]), vararg()])]),
    ]

    program.body.statements = newBody
}