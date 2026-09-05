import type { Program, TableField } from "luau-parser"
import { transformExpressions } from "./walk"
import {
    stringLiteral, numberLiteral, index as indexExpr, identifier, table, localStatement,
} from "./nodeFactory"

export interface ConstantArrayOptions {
    /** 상수 배열을 담을 local 변수 이름. 생략하면 랜덤 생성됨
     *  (어차피 RenameVariables가 이후에 한 번 더 이름을 바꿔줌). */
    arrayName?: string
}

type Entry = { kind: "string"; value: string } | { kind: "number"; value: number }
type ConstKey = string

function keyOf(kind: Entry["kind"], value: string | number): ConstKey {
    return kind === "string" ? `s:${value}` : `n:${value}`
}

function shuffleIndices(length: number): number[] {
    const order = Array.from({ length }, (_, i) => i)
    for (let i = order.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1))
        ;[order[i], order[j]] = [order[j], order[i]]
    }
    return order
}

function defaultArrayName(): string {
    return "_CA" + Math.random().toString(36).slice(2, 8)
}

export function runConstantArray(program: Program, options: ConstantArrayOptions): void {
    const order: Entry[] = []
    const seen = new Set<ConstKey>()

    transformExpressions(program, (expr) => {
        if (expr.type === "StringLiteral") {
            const k = keyOf("string", expr.value)
            if (!seen.has(k)) {
                seen.add(k)
                order.push({ kind: "string", value: expr.value })
            }
        } else if (expr.type === "NumberLiteral") {
            const k = keyOf("number", expr.value)
            if (!seen.has(k)) {
                seen.add(k)
                order.push({ kind: "number", value: expr.value })
            }
        }
        return undefined
    })

    if (order.length === 0) return

    // 2) 배열 안에서 실제로 놓일 위치를 등장 순서와 다르게 섞음.
    //    shuffledOrder[슬롯] = order 배열에서의 원래 인덱스
    const shuffledOrder = shuffleIndices(order.length)
    const indexOf = new Map<ConstKey, number>() // 상수 키 -> 1-based 배열 인덱스
    shuffledOrder.forEach((originalIndex, slot) => {
        const entry = order[originalIndex]
        indexOf.set(keyOf(entry.kind, entry.value), slot + 1)
    })

    const arrayName = options.arrayName ?? defaultArrayName()

    // 3) 기존 트리를 돌면서 리터럴을 ARR[idx] 접근으로 치환.
    //    배열 선언문은 아직 트리에 넣지 않은 상태에서 해야 함 — 넣고 나서 돌리면
    //    배열 자신의 값들까지 자기 자신을 가리키게 치환돼서 깨짐.
    transformExpressions(program, (expr) => {
        if (expr.type === "StringLiteral") {
            const idx = indexOf.get(keyOf("string", expr.value))!
            return indexExpr(identifier(arrayName), numberLiteral(idx))
        }
        if (expr.type === "NumberLiteral") {
            const idx = indexOf.get(keyOf("number", expr.value))!
            return indexExpr(identifier(arrayName), numberLiteral(idx))
        }
        return undefined
    })

    // 4) 치환이 끝난 뒤에야 배열 선언문을 맨 위에 삽입.
    const fields: TableField[] = shuffledOrder.map((originalIndex) => {
        const entry = order[originalIndex]
        const value = entry.kind === "string" ? stringLiteral(entry.value) : numberLiteral(entry.value)
        return { type: "TableFieldPositional", value }
    })

    program.body.statements.unshift(localStatement(arrayName, table(fields)))
}