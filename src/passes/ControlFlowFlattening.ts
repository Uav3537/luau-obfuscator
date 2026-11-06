import type {
    Program, Block, Statement, Identifier, TypedIdentifier, Binding,
} from "luau-parser"

type DeclarationNode = NonNullable<Binding["declarationNode"]>
import { analyzeScopes } from "luau-parser"
import { transformExpressions } from "./walk"
import {
    identifier, numberLiteral, binary, assignmentStatement, localStatement, localDeclare,
    block, ifClause, ifStatement, whileStatement, functionExpression,
} from "./nodeFactory"

export interface ControlFlowFlatteningOptions {
    /** 이 개수 미만의 statement만 가진 본문은 평탄화해도 의미가 없으므로 건너뜀. */
    minStatements?: number
    /** 호이스팅할 로컬과 state 변수에 붙일 고유 이름 생성기.
     *  생략하면 UUID 기반(충돌 불가능)으로 만든다. RenameVariables가 이후에
     *  한 번 더 이름을 바꿔주긴 하지만, 여기서 이미 "전역적으로 유일"해야
     *  호이스팅 시 바깥 스코프의 동명 변수를 가리는 일이 없다. */
    random?: () => string
}

function randomInt(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min
}

/** 서로 겹치지 않는 정수 count개. state 번호 + 종료 번호로 쓴다.
 *  (이 값들은 뒤쪽 숫자 난독화 패스가 다시 표현식으로 부풀려 숨긴다.) */
function distinctInts(count: number): number[] {
    const seen = new Set<number>()
    while (seen.size < count) seen.add(randomInt(1000, 9_000_000))
    return [...seen]
}

/**
 * 제어 흐름 평탄화(control flow flattening).
 *
 * 함수 본문/프로그램 본문의 "직속 statement 열"을 `state` 변수로 다음 블록을
 * 지정하는 while+if 디스패처로 바꿔 선형 실행 순서를 숨긴다.
 *
 *   local state = <시작번호>
 *   while state ~= <종료번호> do
 *       if     state == k0 then s0; state = k1
 *       elseif state == k1 then s1; state = k2
 *       ...
 *       end
 *   end
 *
 * 상태 전이는 "원래 순서"대로 사슬로 이어지므로(번호만 섞여 있음) 런타임
 * 실행 순서와 데이터 의존성은 완전히 보존된다.
 *
 * 적용 범위를 "함수 본문 + 프로그램 본문"으로 제한하는 이유:
 *   루프/if/do 본문을 while로 감싸면 그 안의 `break`/`continue`가 우리가
 *   끼워넣은 디스패처 while을 가리키게 되어 의미가 깨진다. 반면 함수/프로그램
 *   본문 직속에는 (루프 밖) break/continue가 문법적으로 올 수 없고, 루프 안에
 *   있는 break/continue는 그 루프에 그대로 묶이므로 안전하다.
 *
 * 로컬 선언 처리:
 *   각 절(clause) 본문은 별도의 블록 스코프라서, `local x`를 한 절에 두고
 *   다음 절에서 x를 쓰면 스코프 밖이 된다. 그래서 블록 직속 로컬을 전부
 *   "유일한 새 이름으로 리네임한 뒤" 디스패처 위로 호이스팅하고, 원래 선언은
 *   대입문으로 바꾼다. 이름을 유일하게 만들기 때문에 호이스팅해도 바깥
 *   스코프의 동명 변수를 가리는 부작용이 없다. (리네임은 analyzeScopes가 찾아준
 *   선언/참조 노드에만 적용 — RenameVariables와 동일한 방식.)
 */
export function runControlFlowFlattening(program: Program, options: ControlFlowFlatteningOptions): void {
    const minStatements = options.minStatements ?? 3
    const makeName = options.random
        ?? (() => "_" + globalThis.crypto.randomUUID().replace(/-/g, ""))

    // 선언 노드 -> 바인딩. 블록 직속 로컬을 유일 이름으로 리네임할 때 쓴다.
    const analysis = analyzeScopes(program)
    const declToBinding = new Map<DeclarationNode, Binding>()
    for (const b of analysis.bindings.values()) {
        if (b.declarationNode) declToBinding.set(b.declarationNode, b)
    }

    // 평탄화 대상 블록(= 모든 함수 본문 + 프로그램 본문)을 먼저 전부 모은다.
    // 평탄화가 statement 열을 바꾸므로, 수집을 끝낸 뒤에 변형해야 한다.
    const bodies: Block[] = [program.body]

    // (1) 표현식 어디에든 있는 FunctionExpression 본문
    transformExpressions(program, (e) => {
        if (e.type === "FunctionExpression") bodies.push(e.func.body)
        return undefined
    })

    // (2) local function / function 선언문 본문 (FunctionExpression이 아님)
    function collectDeclaredFunctions(b: Block): void {
        for (const s of b.statements) {
            switch (s.type) {
                case "LocalFunctionStatement":
                case "FunctionDeclarationStatement":
                    bodies.push(s.func.body)
                    collectDeclaredFunctions(s.func.body)
                    break
                case "DoStatement":
                case "WhileStatement":
                case "RepeatStatement":
                case "NumericForStatement":
                case "GenericForStatement":
                    collectDeclaredFunctions(s.body)
                    break
                case "IfStatement":
                    for (const c of s.clauses) collectDeclaredFunctions(c.body)
                    if (s.alternate) collectDeclaredFunctions(s.alternate)
                    break
                default:
                    break
            }
        }
    }
    collectDeclaredFunctions(program.body)

    for (const body of bodies) flattenBody(body)

    function flattenBody(body: Block): void {
        const stmts = body.statements
        if (stmts.length < minStatements) return

        // 블록 직속 로컬 선언의 이름 노드 수집 + 평탄화 불가 조건 검사.
        const declNodes: Array<TypedIdentifier | Identifier> = []
        for (const s of stmts) {
            if (s.type === "LocalStatement") {
                // const 로컬은 대입문으로 재할당할 수 없으므로 통째로 포기.
                if (s.isConst) return
                declNodes.push(...s.names)
            } else if (s.type === "LocalFunctionStatement") {
                // const / @native 등 attribute가 붙으면 대입문 변환 시 정보가
                // 사라지므로 안전하게 포기.
                if (s.isConst || (s.attributes && s.attributes.length > 0)) return
                declNodes.push(s.name)
            }
        }

        // 하나라도 바인딩을 못 찾으면(이례적) 리네임이 불완전해져 섀도잉 위험이
        // 있으니 이 블록은 건드리지 않는다.
        const bindings: Binding[] = []
        for (const node of declNodes) {
            const binding = declToBinding.get(node)
            if (!binding) return
            bindings.push(binding)
        }

        // 직속 로컬을 전부 유일한 이름으로 리네임(선언 노드 + 모든 참조 노드).
        for (const binding of bindings) {
            const newName = makeName()
            binding.name = newName
            if (binding.declarationNode) binding.declarationNode.name = newName
            for (const ref of binding.references) ref.name = newName
        }

        // 각 원본 statement를 "절에서 실행할 형태"로 변환.
        const hoistNames: string[] = []
        const transformed: Array<Statement | null> = []
        for (const s of stmts) {
            if (s.type === "LocalStatement") {
                const names = s.names.map((n) => n.name)
                hoistNames.push(...names)
                // `local a` (초기값 없음) -> 호이스팅만 하고 런타임 동작 없음.
                if (s.init.length === 0) transformed.push(null)
                else transformed.push(assignmentStatement(names.map(identifier), s.init))
            } else if (s.type === "LocalFunctionStatement") {
                hoistNames.push(s.name.name)
                transformed.push(assignmentStatement(
                    [identifier(s.name.name)],
                    [functionExpression(s.func)],
                ))
            } else {
                transformed.push(s)
            }
        }

        const n = transformed.length
        const ids = distinctInts(n + 1)
        const stateIds = ids.slice(0, n)
        const terminal = ids[n]
        const stateVar = makeName()

        const clauses = transformed.map((t, i) => {
            const bodyStmts: Statement[] = []
            if (t !== null) bodyStmts.push(t)
            // return은 블록 맨 끝에만 올 수 있고 함수 자체를 빠져나가므로 상태
            // 전이를 붙이지 않는다(붙이면 문법 오류이자 도달 불가 코드).
            const isReturn = t !== null && t.type === "ReturnStatement"
            if (!isReturn) {
                const next = i < n - 1 ? stateIds[i + 1] : terminal
                bodyStmts.push(assignmentStatement([identifier(stateVar)], [numberLiteral(next)]))
            }
            return ifClause(
                binary("==", identifier(stateVar), numberLiteral(stateIds[i])),
                block(bodyStmts),
            )
        })

        const dispatcher = whileStatement(
            binary("~=", identifier(stateVar), numberLiteral(terminal)),
            block([ifStatement(clauses)]),
        )

        const newStmts: Statement[] = []
        if (hoistNames.length > 0) newStmts.push(localDeclare(hoistNames))
        newStmts.push(localStatement(stateVar, numberLiteral(stateIds[0])))
        newStmts.push(dispatcher)
        body.statements = newStmts
    }
}
