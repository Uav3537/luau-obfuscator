import type { Expression, TableField } from "luau-parser"
import type { Proto, ConstValue } from "./chunk"
import { Opcode } from "./opcodes"
import type { VmNames } from "./names"
import {
    table, positionalField, namedField, numberLiteral, stringLiteral, booleanLiteral, nilLiteral,
} from "../nodeFactory"

/** proto.consts[]를 Luau 배열 리터럴로: { [1] = v1, [2] = v2, ... } (1-based는 그대로 유지) */
function serializeConsts(consts: ConstValue[]): Expression {
    const fields: TableField[] = consts.map((v) => positionalField(serializeConstValue(v)))
    return table(fields)
}

function serializeConstValue(v: ConstValue): Expression {
    if (v === null) return nilLiteral()
    if (typeof v === "string") return stringLiteral(v)
    if (typeof v === "number") return numberLiteral(v)
    return booleanLiteral(v)
}

/**
 * Instr/Proto를 Luau 테이블 리터럴로 찍을 때 쓰는 필드 키는 고정 문자열("op","a","b","c",
 * "numParams", ...)이 아니라 names(names.ts)에서 빌드마다 새로 뽑은 이름을 쓴다 —
 * 이 키 이름이 고정이면 산출물에서 `{op=6, a=0, ...}` 같은 패턴만 grep해도 VM 청크
 * 테이블을 바로 찾아낼 수 있기 때문. runtime.ts가 같은 names로 instr.<key>를 읽으므로
 * 반드시 컴파일 시점에 쓴 것과 동일한 VmNames 인스턴스를 넘겨야 한다.
 */
function serializeInstrs(proto: Proto, names: VmNames): Expression {
    const fields: TableField[] = proto.code.map((instr) =>
        positionalField(
            table([
                namedField(names.op, numberLiteral(instr.op as number)),
                namedField(names.a, numberLiteral(instr.a)),
                namedField(names.b, numberLiteral(instr.b)),
                namedField(names.c, numberLiteral(instr.c)),
            ]),
        ))
    return table(fields)
}

function serializeUpvalDescs(proto: Proto, names: VmNames): Expression {
    const fields: TableField[] = proto.upvalDescs.map((d) =>
        positionalField(
            table([
                namedField(names.kind, stringLiteral(d.kind)),
                namedField(names.index, numberLiteral(d.index)),
            ]),
        ))
    return table(fields)
}

/** Proto 하나를 { numParams=.., hasVarargs=.., maxRegs=.., code={...}, consts={...}, upvalDescs={...}, protos={...} }로
 *  (필드 키는 전부 names에서 온 무작위 이름). */
export function serializeProto(proto: Proto, names: VmNames): Expression {
    const fields: TableField[] = [
        namedField(names.numParams, numberLiteral(proto.numParams)),
        namedField(names.hasVarargs, booleanLiteral(proto.hasVarargs)),
        namedField(names.maxRegs, numberLiteral(proto.maxRegs)),
        namedField(names.code, serializeInstrs(proto, names)),
        namedField(names.consts, serializeConsts(proto.consts)),
        namedField(names.upvalDescs, serializeUpvalDescs(proto, names)),
        namedField(names.protos, table(proto.protos.map((p) => positionalField(serializeProto(p, names))))),
    ]
    return table(fields)
}

export { Opcode }
