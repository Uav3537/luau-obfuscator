import type { Program } from "luau-parser"
import {
    block, functionBody, functionExpression, paren, call, vararg, returnStatement,
} from "./nodeFactory"

export interface WrapInFunctionOptions {}

/**
 * 전체 프로그램을:
 *   return (function(...)
 *       <원래 코드>
 *   end)(...)
 * 로 감쌈.
 *
 * - `return`을 쓰는 이유: Script/LocalScript에서는 top-level return이 그냥 청크를
 *   조기 종료시킬 뿐 무해하고, ModuleScript라면 IIFE의 결과값이 그대로 require()
 *   호출자에게 전달돼야 하므로 필요함. 즉 스크립트 종류를 가리지 않고 안전.
 * - `...`을 파라미터로 받아서 다시 그대로 넘겨주는 이유: 원본 청크가 최상위에서
 *   `...`(스크립트 인자)을 참조하는 경우를 대비. 그냥 지워버리면 그런 코드가
 *   깨짐.
 *
 * 반드시 파이프라인 맨 마지막 근처에서 실행돼야 함 — 이 패스 이후에 실행되는
 * 다른 패스가 top-level 스코프를 순회/변형한다면 이미 감싸인 함수 내부까지
 * 안 보고 지나칠 수 있음.
 */
export function runWrapInFunction(program: Program, _options: WrapInFunctionOptions): void {
    const innerBody = program.body
    const wrapper = functionExpression(functionBody([], innerBody, true))
    const iife = call(paren(wrapper), [vararg()])

    program.body = block([returnStatement([iife])])
}