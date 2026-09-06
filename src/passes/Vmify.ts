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
     * 스코프 분석에 미리 등록해둘 전역 이름 시드 목록. 여기 없는 이름이라도 프로그램에서
     * 실제로 참조되면(로컬/파라미터/업밸류로 안 풀리는 식별자는 전부) 스코프 분석이
     * 자동으로 전역으로 잡아내므로, 브릿지 테이블은 이 옵션이 아니라
     * VmCompiler.getUsedGlobalNames()(실제 사용된 전역 전체)로 만든다 — 옛날엔 이 목록에
     * 없는 이름을 쓰면 컴파일은 되는데 GETGLOBAL이 조용히 nil을 반환해서
     * "attempt to call a nil value"로 터졌었음.
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
    const builtinGlobals = options.builtinGlobals ?? DEFAULT_BUILTIN_GLOBALS
    const random = options.random ?? Math.random

    const opcodeMap = createOpcodeMap(random)
    const names = generateVmNames(random)

    const compiler = new VmCompiler(program, builtinGlobals, opcodeMap)
    const topProto = compiler.compile()

    // builtinGlobals(시드 목록)가 아니라 실제로 프로그램이 참조한 전역 전체로 브릿지를
    // 만든다 — game/task 같은 시드 목록에 없는 Roblox API나 실행기 전역을 스크립트가
    // 쓰더라도 스코프 분석이 이미 전역으로 잡아뒀으므로 여기서 다 커버된다.
    const usedGlobalNames = compiler.getUsedGlobalNames()

    const globalsTable = table(
        usedGlobalNames.map((name) => namedField(name, identifier(name))),
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