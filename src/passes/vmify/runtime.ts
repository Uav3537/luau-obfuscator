import { Opcode, type OpcodeMap } from "./opcodes"
import type { VmNames } from "./names"

/**
 * VM 런타임 v3 — opcode마다 독립된 핸들러 함수를 만들고 서로 tail call로 이어지는
 * 구조는 v2와 동일하다. 다만 이제 모든 전역 식별자(__vm_execute, __vm_handlers, ...)와
 * frame/Instr/Proto의 테이블 필드 키가 고정 문자열이 아니라, 빌드마다 무작위로 뽑힌
 * names(names.ts)와 opcode 번호 재배치 opcodeMap(opcodes.ts)을 받아 그때그때
 * 소스를 새로 찍어낸다.
 *
 * 왜 이렇게 하나:
 *  - Luau는 proper tail call을 보장하므로(스택 안 쌓임, 성능도 loop와 동급),
 *    "재귀처럼 보이지만 실제론 loop"인 구조를 공짜로 얻을 수 있다.
 *  - "거대한 while+if-chain" 자체가 디컴파일러가 제일 먼저 찾는 VM 시그니처인데,
 *    이 구조는 그 패턴이 아예 없다.
 *  - opcode 번호 + 식별자 이름을 빌드마다 다르게 뽑기 때문에, 한 번 리버싱해서
 *    "MOVE=0, __vm_execute라는 함수가 진입점" 같은 지식을 얻어도 다음 산출물에는
 *    그대로 안 먹힌다 — 매번 새로 분석해야 함.
 *
 * opcode 번호는 opcodeMap[Opcode.X]로 이 빌드에서 실제로 쓰인 숫자를 얻는다
 * (compiler.ts가 emit() 시점에 같은 opcodeMap으로 인스트럭션에 번호를 박아 넣으므로
 * 반드시 컴파일과 런타임 생성에 동일한 opcodeMap 인스턴스를 넘겨야 함).
 */
export function buildVmRuntimeSource(names: VmNames, opcodeMap: OpcodeMap): string {
    const N = names
    const op = (o: Opcode) => opcodeMap[o]

    return `
local ${N.handlers} = {}

local function ${N.dispatch}(${N.frame}, pc)
    local instr = ${N.frame}.${N.code}[pc]
    return ${N.handlers}[instr.${N.op}](${N.frame}, pc, instr)
end

local function ${N.rk}(${N.frame}, x)
    if x < 0 then
        return ${N.frame}.${N.K}[-x - 1 + 1]
    else
        return ${N.frame}.${N.R}[x]
    end
end

-- MOVE
${N.handlers}[${op(Opcode.MOVE)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.frame}.${N.R}[instr.${N.b}]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- LOADK
${N.handlers}[${op(Opcode.LOADK)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.frame}.${N.K}[instr.${N.b} + 1]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- LOADBOOL
${N.handlers}[${op(Opcode.LOADBOOL)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = (instr.${N.b} ~= 0)
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- LOADNIL
${N.handlers}[${op(Opcode.LOADNIL)}] = function(${N.frame}, pc, instr)
    for i = instr.${N.a}, instr.${N.b} do ${N.frame}.${N.R}[i] = nil end
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- GETUPVAL
${N.handlers}[${op(Opcode.GETUPVAL)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.frame}.${N.upvals}[instr.${N.b} + 1]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- SETUPVAL
${N.handlers}[${op(Opcode.SETUPVAL)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.upvals}[instr.${N.b} + 1] = ${N.frame}.${N.R}[instr.${N.a}]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- GETGLOBAL (b는 RK가 아니라 상수풀 순수 인덱스)
${N.handlers}[${op(Opcode.GETGLOBAL)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.globals}[${N.frame}.${N.K}[instr.${N.b} + 1]]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- SETGLOBAL
${N.handlers}[${op(Opcode.SETGLOBAL)}] = function(${N.frame}, pc, instr)
    ${N.globals}[${N.frame}.${N.K}[instr.${N.b} + 1]] = ${N.frame}.${N.R}[instr.${N.a}]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- GETTABLE
${N.handlers}[${op(Opcode.GETTABLE)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.frame}.${N.R}[instr.${N.b}][${N.rk}(${N.frame}, instr.${N.c})]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- SETTABLE
${N.handlers}[${op(Opcode.SETTABLE)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}][${N.rk}(${N.frame}, instr.${N.b})] = ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- NEWTABLE
${N.handlers}[${op(Opcode.NEWTABLE)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = {}
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- SELF  (R[a] = R[b][key]; R[a+1] = R[b])
${N.handlers}[${op(Opcode.SELF)}] = function(${N.frame}, pc, instr)
    local obj = ${N.frame}.${N.R}[instr.${N.b}]
    ${N.frame}.${N.R}[instr.${N.a}] = obj[${N.rk}(${N.frame}, instr.${N.c})]
    ${N.frame}.${N.R}[instr.${N.a} + 1] = obj
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- ADD SUB MUL DIV MOD POW
${N.handlers}[${op(Opcode.ADD)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) + ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(Opcode.SUB)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) - ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(Opcode.MUL)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) * ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(Opcode.DIV)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) / ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(Opcode.MOD)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) % ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(Opcode.POW)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) ^ ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- IDIV (Luau 바닥 나눗셈)
${N.handlers}[${op(Opcode.IDIV)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) // ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- CONCAT
${N.handlers}[${op(Opcode.CONCAT)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) .. ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- UNM
${N.handlers}[${op(Opcode.UNM)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = -${N.frame}.${N.R}[instr.${N.b}]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- NOT
${N.handlers}[${op(Opcode.NOT)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = not ${N.frame}.${N.R}[instr.${N.b}]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- LEN
${N.handlers}[${op(Opcode.LEN)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = #${N.frame}.${N.R}[instr.${N.b}]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- JMP (pc += a)
${N.handlers}[${op(Opcode.JMP)}] = function(${N.frame}, pc, instr)
    return ${N.dispatch}(${N.frame}, pc + instr.${N.a})
end

-- EQ LT LE (값 생성형 비교)
${N.handlers}[${op(Opcode.EQ)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) == ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(Opcode.LT)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) < ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(Opcode.LE)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) <= ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- TEST (if (not R[a]) != (c!=0) then pc += 2 else pc += 1 — 보통 다음 명령은 JMP)
${N.handlers}[${op(Opcode.TEST)}] = function(${N.frame}, pc, instr)
    if (not ${N.frame}.${N.R}[instr.${N.a}]) ~= (instr.${N.c} ~= 0) then
        return ${N.dispatch}(${N.frame}, pc + 2)
    end
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- CALL
${N.handlers}[${op(Opcode.CALL)}] = function(${N.frame}, pc, instr)
    local a, b, c = instr.${N.a}, instr.${N.b}, instr.${N.c}
    local fn = ${N.frame}.${N.R}[a]
    local nargs
    if b == 0 then
        nargs = (${N.frame}.${N.multiTop} or (a + 1)) - (a + 1)
    else
        nargs = b - 1
    end
    local args = table.create(nargs)
    for i = 1, nargs do args[i] = ${N.frame}.${N.R}[a + i] end
    local rets = table.pack(fn(table.unpack(args, 1, nargs)))
    if c == 1 then
        -- discard
    elseif c == 0 then
        for i = 1, rets.n do ${N.frame}.${N.R}[a + i - 1] = rets[i] end
        ${N.frame}.${N.multiTop} = a + rets.n
    else
        local want = c - 1
        for i = 1, want do ${N.frame}.${N.R}[a + i - 1] = rets[i] end
    end
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- RETURN
${N.handlers}[${op(Opcode.RETURN)}] = function(${N.frame}, pc, instr)
    local a, b = instr.${N.a}, instr.${N.b}
    if b == 0 then
        return table.unpack(${N.frame}.${N.R}, a, (${N.frame}.${N.multiTop} or (a + 1)) - 1)
    end
    return table.unpack(${N.frame}.${N.R}, a, a + b - 2)
end

-- FORPREP
${N.handlers}[${op(Opcode.FORPREP)}] = function(${N.frame}, pc, instr)
    local a = instr.${N.a}
    ${N.frame}.${N.R}[a] = ${N.frame}.${N.R}[a] - ${N.frame}.${N.R}[a + 2]
    return ${N.dispatch}(${N.frame}, pc + instr.${N.b})
end

-- FORLOOP
${N.handlers}[${op(Opcode.FORLOOP)}] = function(${N.frame}, pc, instr)
    local a = instr.${N.a}
    local step = ${N.frame}.${N.R}[a + 2]
    ${N.frame}.${N.R}[a] = ${N.frame}.${N.R}[a] + step
    local ok
    if step > 0 then
        ok = ${N.frame}.${N.R}[a] <= ${N.frame}.${N.R}[a + 1]
    else
        ok = ${N.frame}.${N.R}[a] >= ${N.frame}.${N.R}[a + 1]
    end
    if ok then
        ${N.frame}.${N.R}[a + 3] = ${N.frame}.${N.R}[a]
        return ${N.dispatch}(${N.frame}, pc + instr.${N.b})
    end
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- CLOSURE
${N.handlers}[${op(Opcode.CLOSURE)}] = function(${N.frame}, pc, instr)
    local childProto = ${N.frame}.${N.protos}[instr.${N.b} + 1]
    local n = #childProto.${N.upvalDescs}
    local capturedUpvals = table.create(n)
    for i = 1, n do
        local desc = childProto.${N.upvalDescs}[i]
        local captureInstr = ${N.frame}.${N.code}[pc + i]
        if desc.${N.kind} == "local" then
            capturedUpvals[i] = ${N.frame}.${N.R}[captureInstr.${N.b}]
        else
            capturedUpvals[i] = ${N.frame}.${N.upvals}[captureInstr.${N.b} + 1]
        end
    end
    ${N.frame}.${N.R}[instr.${N.a}] = function(...)
        return ${N.execute}(childProto, capturedUpvals, ...)
    end
    return ${N.dispatch}(${N.frame}, pc + 1 + n)
end

-- VARARG
${N.handlers}[${op(Opcode.VARARG)}] = function(${N.frame}, pc, instr)
    local count = instr.${N.b} == 0 and ${N.frame}.${N.nVarargs} or (instr.${N.b} - 1)
    for i = 1, count do
        ${N.frame}.${N.R}[instr.${N.a} + i - 1] = ${N.frame}.${N.varargs}[i]
    end
    if instr.${N.b} == 0 then
        ${N.frame}.${N.multiTop} = instr.${N.a} + count
    end
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- SETLIST
${N.handlers}[${op(Opcode.SETLIST)}] = function(${N.frame}, pc, instr)
    local tbl = ${N.frame}.${N.R}[instr.${N.a}]
    local valuesBase = instr.${N.b}
    local top = ${N.frame}.${N.multiTop} or (valuesBase + 1)
    local startIdx = instr.${N.c}
    local n = top - valuesBase
    for i = 0, n - 1 do
        tbl[startIdx + i] = ${N.frame}.${N.R}[valuesBase + i]
    end
    return ${N.dispatch}(${N.frame}, pc + 1)
end

function ${N.execute}(proto, upvals, ...)
    local nArgs = select("#", ...)
    local packedArgs = table.pack(...)
    local R = table.create(proto.${N.maxRegs} + 8)
    for i = 1, proto.${N.numParams} do
        R[i - 1] = packedArgs[i]
    end
    local nVarargs = 0
    local varargs = {}
    if proto.${N.hasVarargs} and nArgs > proto.${N.numParams} then
        nVarargs = nArgs - proto.${N.numParams}
        for i = 1, nVarargs do
            varargs[i] = packedArgs[proto.${N.numParams} + i]
        end
    end

    local ${N.frame} = {
        ${N.R} = R,
        ${N.K} = proto.${N.consts},
        ${N.code} = proto.${N.code},
        ${N.protos} = proto.${N.protos},
        ${N.upvals} = upvals,
        ${N.varargs} = varargs,
        ${N.nVarargs} = nVarargs,
    }

    return ${N.dispatch}(${N.frame}, 1)
end
`
}
