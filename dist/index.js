// src/index.ts
import { luauparser as luauparser3 } from "luau-parser";

// src/config.ts
var ObfuscateDefault = {
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
  WrapInFunction: { active: true }
};
function mergeConfig(defaults, partial) {
  const result = {};
  for (const key of Object.keys(defaults)) {
    const def = defaults[key];
    const part = partial[key];
    if (!part) {
      result[key] = def;
    } else if (part.active === false) {
      result[key] = { active: false };
    } else {
      result[key] = { ...def, ...part, active: true };
    }
  }
  return result;
}

// src/passes/StripTypes.ts
function runStripTypes(program) {
  stripBlock(program.body);
}
function stripBlock(block2) {
  const kept = [];
  for (const stmt of block2.statements) {
    if (stmt.type === "TypeAliasStatement" || stmt.type === "ExportTypeAliasStatement") {
      continue;
    }
    stripStatement(stmt);
    kept.push(stmt);
  }
  block2.statements = kept;
}
function stripFunctionBody(func) {
  func.generics = [];
  for (const param of func.params) delete param.typeAnnotation;
  delete func.varargTypeAnnotation;
  delete func.returnType;
  stripBlock(func.body);
}
function stripStatement(stmt) {
  switch (stmt.type) {
    case "LocalStatement":
      for (const name of stmt.names) delete name.typeAnnotation;
      for (let i = 0; i < stmt.init.length; i++) stmt.init[i] = stripExpr(stmt.init[i]);
      return;
    case "LocalFunctionStatement":
      stripFunctionBody(stmt.func);
      return;
    case "FunctionDeclarationStatement":
      stripFunctionBody(stmt.func);
      return;
    case "AssignmentStatement":
      for (let i = 0; i < stmt.targets.length; i++) stmt.targets[i] = stripExpr(stmt.targets[i]);
      for (let i = 0; i < stmt.values.length; i++) stmt.values[i] = stripExpr(stmt.values[i]);
      return;
    case "CompoundAssignmentStatement":
      stmt.target = stripExpr(stmt.target);
      stmt.value = stripExpr(stmt.value);
      return;
    case "CallStatement":
      stmt.expression = stripExpr(stmt.expression);
      return;
    case "DoStatement":
      stripBlock(stmt.body);
      return;
    case "WhileStatement":
      stmt.condition = stripExpr(stmt.condition);
      stripBlock(stmt.body);
      return;
    case "RepeatStatement":
      stripBlock(stmt.body);
      stmt.condition = stripExpr(stmt.condition);
      return;
    case "IfStatement":
      for (const clause of stmt.clauses) {
        clause.condition = stripExpr(clause.condition);
        stripBlock(clause.body);
      }
      if (stmt.alternate) stripBlock(stmt.alternate);
      return;
    case "NumericForStatement":
      delete stmt.variable.typeAnnotation;
      stmt.start = stripExpr(stmt.start);
      stmt.end = stripExpr(stmt.end);
      if (stmt.step) stmt.step = stripExpr(stmt.step);
      stripBlock(stmt.body);
      return;
    case "GenericForStatement":
      for (const v of stmt.variables) delete v.typeAnnotation;
      for (let i = 0; i < stmt.iterators.length; i++) stmt.iterators[i] = stripExpr(stmt.iterators[i]);
      stripBlock(stmt.body);
      return;
    case "ReturnStatement":
      for (let i = 0; i < stmt.arguments.length; i++) stmt.arguments[i] = stripExpr(stmt.arguments[i]);
      return;
    case "BreakStatement":
    case "ContinueStatement":
      return;
  }
}
function stripExpr(expr) {
  switch (expr.type) {
    case "InterpolatedStringExpression":
      for (const part of expr.parts) {
        if (part.kind === "expression") part.expression = stripExpr(part.expression);
      }
      return expr;
    case "FunctionExpression":
      stripFunctionBody(expr.func);
      return expr;
    case "TableExpression":
      for (const field of expr.fields) {
        if (field.type === "TableFieldPositional") {
          field.value = stripExpr(field.value);
        } else if (field.type === "TableFieldNamed") {
          field.value = stripExpr(field.value);
        } else if (field.type === "TableFieldComputed") {
          field.key = stripExpr(field.key);
          field.value = stripExpr(field.value);
        }
      }
      return expr;
    case "BinaryExpression":
      expr.left = stripExpr(expr.left);
      expr.right = stripExpr(expr.right);
      return expr;
    case "UnaryExpression":
      expr.argument = stripExpr(expr.argument);
      return expr;
    case "MemberExpression":
      expr.object = stripExpr(expr.object);
      return expr;
    case "IndexExpression":
      expr.object = stripExpr(expr.object);
      expr.index = stripExpr(expr.index);
      return expr;
    case "CallExpression":
      expr.callee = stripExpr(expr.callee);
      for (let i = 0; i < expr.arguments.length; i++) expr.arguments[i] = stripExpr(expr.arguments[i]);
      return expr;
    case "MethodCallExpression":
      expr.object = stripExpr(expr.object);
      for (let i = 0; i < expr.arguments.length; i++) expr.arguments[i] = stripExpr(expr.arguments[i]);
      return expr;
    case "ParenthesizedExpression":
      expr.expression = stripExpr(expr.expression);
      return expr;
    case "TypeAssertionExpression":
      return stripExpr(expr.expression);
    case "IfElseExpression":
      for (const clause of expr.clauses) {
        clause.condition = stripExpr(clause.condition);
        clause.body = stripExpr(clause.body);
      }
      expr.alternate = stripExpr(expr.alternate);
      return expr;
    default:
      return expr;
  }
}

// src/passes/walk.ts
function visitArray(arr, visitor) {
  for (let i = 0; i < arr.length; i++) {
    arr[i] = mapExpression(arr[i], visitor);
  }
}
function mapExpression(expr, visitor) {
  switch (expr.type) {
    case "InterpolatedStringExpression":
      for (const part of expr.parts) {
        if (part.kind === "expression") {
          part.expression = mapExpression(part.expression, visitor);
        }
      }
      break;
    case "FunctionExpression":
      walkFunctionBody(expr.func, visitor);
      break;
    case "TableExpression":
      for (const field of expr.fields) {
        if (field.type === "TableFieldPositional") {
          field.value = mapExpression(field.value, visitor);
        } else if (field.type === "TableFieldNamed") {
          field.value = mapExpression(field.value, visitor);
        } else if (field.type === "TableFieldComputed") {
          field.key = mapExpression(field.key, visitor);
          field.value = mapExpression(field.value, visitor);
        }
      }
      break;
    case "BinaryExpression":
      expr.left = mapExpression(expr.left, visitor);
      expr.right = mapExpression(expr.right, visitor);
      break;
    case "UnaryExpression":
      expr.argument = mapExpression(expr.argument, visitor);
      break;
    case "MemberExpression":
      expr.object = mapExpression(expr.object, visitor);
      break;
    case "IndexExpression":
      expr.object = mapExpression(expr.object, visitor);
      expr.index = mapExpression(expr.index, visitor);
      break;
    case "CallExpression":
      expr.callee = mapExpression(expr.callee, visitor);
      visitArray(expr.arguments, visitor);
      break;
    case "MethodCallExpression":
      expr.object = mapExpression(expr.object, visitor);
      visitArray(expr.arguments, visitor);
      break;
    case "ParenthesizedExpression":
      expr.expression = mapExpression(expr.expression, visitor);
      break;
    case "TypeAssertionExpression":
      expr.expression = mapExpression(expr.expression, visitor);
      break;
    case "IfElseExpression":
      for (const clause of expr.clauses) {
        clause.condition = mapExpression(clause.condition, visitor);
        clause.body = mapExpression(clause.body, visitor);
      }
      expr.alternate = mapExpression(expr.alternate, visitor);
      break;
  }
  return visitor(expr) ?? expr;
}
function walkFunctionBody(func, visitor) {
  walkBlock(func.body, visitor);
}
function walkBlock(block2, visitor) {
  for (const stmt of block2.statements) walkStatement(stmt, visitor);
}
function walkStatement(stmt, visitor) {
  switch (stmt.type) {
    case "LocalStatement":
      visitArray(stmt.init, visitor);
      return;
    case "LocalFunctionStatement":
      walkFunctionBody(stmt.func, visitor);
      return;
    case "FunctionDeclarationStatement":
      walkFunctionBody(stmt.func, visitor);
      return;
    case "AssignmentStatement":
      visitArray(stmt.targets, visitor);
      visitArray(stmt.values, visitor);
      return;
    case "CompoundAssignmentStatement":
      stmt.target = mapExpression(stmt.target, visitor);
      stmt.value = mapExpression(stmt.value, visitor);
      return;
    case "CallStatement":
      stmt.expression = mapExpression(stmt.expression, visitor);
      return;
    case "DoStatement":
      walkBlock(stmt.body, visitor);
      return;
    case "WhileStatement":
      stmt.condition = mapExpression(stmt.condition, visitor);
      walkBlock(stmt.body, visitor);
      return;
    case "RepeatStatement":
      walkBlock(stmt.body, visitor);
      stmt.condition = mapExpression(stmt.condition, visitor);
      return;
    case "IfStatement":
      for (const clause of stmt.clauses) {
        clause.condition = mapExpression(clause.condition, visitor);
        walkBlock(clause.body, visitor);
      }
      if (stmt.alternate) walkBlock(stmt.alternate, visitor);
      return;
    case "NumericForStatement":
      stmt.start = mapExpression(stmt.start, visitor);
      stmt.end = mapExpression(stmt.end, visitor);
      if (stmt.step) stmt.step = mapExpression(stmt.step, visitor);
      walkBlock(stmt.body, visitor);
      return;
    case "GenericForStatement":
      visitArray(stmt.iterators, visitor);
      walkBlock(stmt.body, visitor);
      return;
    case "ReturnStatement":
      visitArray(stmt.arguments, visitor);
      return;
    case "BreakStatement":
    case "ContinueStatement":
    case "TypeAliasStatement":
    case "ExportTypeAliasStatement":
      return;
  }
}
function transformExpressions(program, visitor) {
  walkBlock(program.body, visitor);
}

// src/passes/nodeFactory.ts
var POS = { start: 0, end: 0 };
function identifier(name) {
  return { type: "Identifier", name, line: POS, column: POS };
}
function typedIdentifier(name) {
  return { type: "TypedIdentifier", name, line: POS, column: POS };
}
function stringLiteral(value) {
  return { type: "StringLiteral", value, raw: JSON.stringify(value), line: POS, column: POS };
}
function numberLiteral(value) {
  return { type: "NumberLiteral", value, raw: String(value), line: POS, column: POS };
}
function binary(operator, left, right) {
  return { type: "BinaryExpression", operator, left, right, line: POS, column: POS };
}
function unary(operator, argument) {
  return { type: "UnaryExpression", operator, argument, line: POS, column: POS };
}
function call(callee, args) {
  return { type: "CallExpression", callee, arguments: args, line: POS, column: POS };
}
function member(object, property) {
  return { type: "MemberExpression", object, property: identifier(property), line: POS, column: POS };
}
function index(object, key) {
  return { type: "IndexExpression", object, index: key, line: POS, column: POS };
}
function paren(expression) {
  return { type: "ParenthesizedExpression", expression, line: POS, column: POS };
}
function table(fields) {
  return { type: "TableExpression", fields, line: POS, column: POS };
}
function computedField(key, value) {
  return { type: "TableFieldComputed", key, value };
}
function positionalField(value) {
  return { type: "TableFieldPositional", value };
}
function namedField(name, value) {
  return { type: "TableFieldNamed", name: identifier(name), value };
}
function booleanLiteral(value) {
  return { type: "BooleanLiteral", value, line: POS, column: POS };
}
function nilLiteral() {
  return { type: "NilLiteral", line: POS, column: POS };
}
function localStatement(name, init) {
  return {
    type: "LocalStatement",
    names: [typedIdentifier(name)],
    init: [init],
    line: POS,
    column: POS
  };
}
function block(statements) {
  return { type: "Block", statements, line: POS, column: POS };
}
function assignmentStatement(targets, values) {
  return { type: "AssignmentStatement", targets, values, line: POS, column: POS };
}
function returnStatement(args) {
  return { type: "ReturnStatement", arguments: args, line: POS, column: POS };
}
function numericForStatement(variableName, start, end, body) {
  return {
    type: "NumericForStatement",
    variable: typedIdentifier(variableName),
    start,
    end,
    body,
    line: POS,
    column: POS
  };
}
function functionParam(name) {
  return { type: "FunctionParameter", name, line: POS, column: POS };
}
function functionBody(params, body, hasVarargs = false) {
  return {
    type: "FunctionBody",
    generics: [],
    params,
    hasVarargs,
    body,
    line: POS,
    column: POS
  };
}
function functionExpression(func) {
  return { type: "FunctionExpression", func, line: POS, column: POS };
}
function localFunctionStatement(name, func) {
  return {
    type: "LocalFunctionStatement",
    name: identifier(name),
    func,
    line: POS,
    column: POS
  };
}
function doStatement(body) {
  return { type: "DoStatement", body, line: POS, column: POS };
}
function ifClause(condition, body) {
  return { type: "IfClause", condition, body, line: POS, column: POS };
}
function ifStatement(clauses, alternate) {
  return { type: "IfStatement", clauses, alternate, line: POS, column: POS };
}
function whileStatement(condition, body) {
  return { type: "WhileStatement", condition, body, line: POS, column: POS };
}
function vararg() {
  return { type: "VarargExpression", line: POS, column: POS };
}

// src/passes/StringsToExpressions.ts
var CONTROL_FLOW_PROBABILITY_DEFAULT = 0.6;
function randomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}
function randomName() {
  return "_" + globalThis.crypto.randomUUID().replace(/-/g, "");
}
function toUtf8Bytes(value) {
  return Array.from(new TextEncoder().encode(value));
}
function splitByteChunks(bytes, min, max) {
  const chunks = [];
  let i = 0;
  while (i < bytes.length) {
    const size = Math.max(1, randomInt(min, max));
    chunks.push(bytes.slice(i, i + size));
    i += size;
  }
  return chunks.length > 0 ? chunks : [bytes];
}
function stringCharCall(bytes) {
  return call(member(identifier("string"), "char"), bytes.map(numberLiteral));
}
function buildConcatChain(chunks) {
  let expr = stringCharCall(chunks[0]);
  for (let i = 1; i < chunks.length; i++) {
    expr = binary("..", expr, stringCharCall(chunks[i]));
  }
  return expr;
}
function shuffledIndices(n) {
  const arr = Array.from({ length: n }, (_, i) => i);
  for (let i = n - 1; i > 0; i--) {
    const j = randomInt(0, i);
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}
function iife(statements) {
  return call(paren(functionExpression(functionBody([], block(statements)))), []);
}
function buildShuffledTables(chunks) {
  const n = chunks.length;
  const storageOrder = shuffledIndices(n);
  const storeVar = randomName();
  const orderVar = randomName();
  const storeFields = storageOrder.map((originalIdx) => positionalField(stringCharCall(chunks[originalIdx])));
  const order = new Array(n);
  for (let slot = 0; slot < n; slot++) {
    order[storageOrder[slot]] = slot + 1;
  }
  const orderFields = order.map((slot) => positionalField(numberLiteral(slot)));
  return {
    storeVar,
    orderVar,
    stmts: [
      localStatement(storeVar, table(storeFields)),
      localStatement(orderVar, table(orderFields))
    ]
  };
}
function buildForLoopStringExpr(chunks) {
  const { storeVar, orderVar, stmts } = buildShuffledTables(chunks);
  const accVar = randomName();
  const iVar = randomName();
  return iife([
    ...stmts,
    localStatement(accVar, stringLiteral("")),
    numericForStatement(
      iVar,
      numberLiteral(1),
      unary("#", identifier(orderVar)),
      block([
        assignmentStatement(
          [identifier(accVar)],
          [
            binary(
              "..",
              identifier(accVar),
              index(identifier(storeVar), index(identifier(orderVar), identifier(iVar)))
            )
          ]
        )
      ])
    ),
    returnStatement([identifier(accVar)])
  ]);
}
function buildRecursiveStringExpr(chunks) {
  const { storeVar, orderVar, stmts } = buildShuffledTables(chunks);
  const recName = randomName();
  const iParam = randomName();
  const accParam = randomName();
  const body = block([
    ifStatement([
      ifClause(
        binary(">", identifier(iParam), unary("#", identifier(orderVar))),
        block([returnStatement([identifier(accParam)])])
      )
    ]),
    returnStatement([
      call(identifier(recName), [
        binary("+", identifier(iParam), numberLiteral(1)),
        binary(
          "..",
          identifier(accParam),
          index(identifier(storeVar), index(identifier(orderVar), identifier(iParam)))
        )
      ])
    ])
  ]);
  return iife([
    ...stmts,
    localFunctionStatement(recName, functionBody([functionParam(iParam), functionParam(accParam)], body)),
    returnStatement([call(identifier(recName), [numberLiteral(1), stringLiteral("")])])
  ]);
}
function pickControlFlowStrategy() {
  return Math.random() < 0.5 ? "forLoop" : "recursive";
}
function runStringsToExpressions(program, options) {
  const controlFlowProbability = options.controlFlowProbability ?? CONTROL_FLOW_PROBABILITY_DEFAULT;
  transformExpressions(program, (expr) => {
    if (expr.type !== "StringLiteral") return;
    if (expr.value.length === 0) return;
    const bytes = toUtf8Bytes(expr.value);
    const chunks = splitByteChunks(bytes, options.min, options.max);
    if (chunks.length > 1 && Math.random() < controlFlowProbability) {
      return pickControlFlowStrategy() === "forLoop" ? buildForLoopStringExpr(chunks) : buildRecursiveStringExpr(chunks);
    }
    return buildConcatChain(chunks);
  });
}

// src/passes/NumbersToExpressions.ts
var MAX_DEPTH = 1;
var NEST_PROBABILITY = 0.35;
var CONTROL_FLOW_PROBABILITY_DEFAULT2 = 0.35;
function randomInt2(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}
function randomName2() {
  return "_" + globalThis.crypto.randomUUID().replace(/-/g, "");
}
function randSign() {
  return Math.random() < 0.5 ? 1 : -1;
}
function iife2(statements) {
  return call(paren(functionExpression(functionBody([], block(statements)))), []);
}
function pickStrategy(value, min, max) {
  const candidates = ["add", "sub"];
  if (value !== 0) {
    for (let a = min; a <= max; a++) {
      if (a !== 0 && value % a === 0) {
        candidates.push("mul");
        break;
      }
    }
  }
  return candidates[randomInt2(0, candidates.length - 1)];
}
function operand(n, min, max, depth) {
  if (depth < MAX_DEPTH && Math.random() < NEST_PROBABILITY) {
    return buildNumberExpr(n, min, max, depth + 1);
  }
  return numberLiteral(n);
}
function buildNumberExpr(value, min, max, depth = 0) {
  const strategy = pickStrategy(value, min, max);
  let inner;
  switch (strategy) {
    case "add": {
      const a = randomInt2(min, max) * randSign();
      const b = value - a;
      inner = binary("+", operand(a, min, max, depth), operand(b, min, max, depth));
      break;
    }
    case "sub": {
      const a = randomInt2(min, max) * randSign();
      const b = a - value;
      inner = binary("-", operand(a, min, max, depth), operand(b, min, max, depth));
      break;
    }
    case "mul": {
      let a = 1;
      for (let cand = min; cand <= max; cand++) {
        if (cand !== 0 && value % cand === 0) {
          a = cand;
          break;
        }
      }
      const b = value / a;
      inner = binary("*", operand(a, min, max, depth), operand(b, min, max, depth));
      break;
    }
  }
  return paren(inner);
}
function randomPartition(value, n, min, max) {
  const parts = [];
  let remaining = value;
  for (let i = 0; i < n - 1; i++) {
    const part = randomInt2(min, max) * randSign();
    parts.push(part);
    remaining -= part;
  }
  parts.push(remaining);
  return parts;
}
function buildForLoopNumberExpr(value, min, max) {
  const n = randomInt2(3, 6);
  const steps = randomPartition(value, n, min, max);
  const accVar = randomName2();
  const stepsVar = randomName2();
  const iVar = randomName2();
  const stmts = [
    localStatement(stepsVar, table(steps.map((s) => positionalField(numberLiteral(s))))),
    localStatement(accVar, numberLiteral(0)),
    numericForStatement(
      iVar,
      numberLiteral(1),
      unary("#", identifier(stepsVar)),
      block([
        assignmentStatement(
          [identifier(accVar)],
          [binary("+", identifier(accVar), index(identifier(stepsVar), identifier(iVar)))]
        )
      ])
    ),
    returnStatement([identifier(accVar)])
  ];
  return iife2(stmts);
}
function buildWhileLoopNumberExpr(value, min, max) {
  const n = randomInt2(3, 6);
  const step = randomInt2(min, max) * randSign();
  const base = value - n * step;
  const accVar = randomName2();
  const nVar = randomName2();
  const stmts = [
    localStatement(accVar, numberLiteral(base)),
    localStatement(nVar, numberLiteral(n)),
    whileStatement(
      binary(">", identifier(nVar), numberLiteral(0)),
      block([
        assignmentStatement([identifier(accVar)], [binary("+", identifier(accVar), numberLiteral(step))]),
        assignmentStatement([identifier(nVar)], [binary("-", identifier(nVar), numberLiteral(1))])
      ])
    ),
    returnStatement([identifier(accVar)])
  ];
  return iife2(stmts);
}
function buildRecursiveNumberExpr(value, min, max) {
  const n = randomInt2(3, 6);
  const step = randomInt2(min, max) * randSign();
  const base = value - n * step;
  const recName = randomName2();
  const nParam = randomName2();
  const body = block([
    ifStatement([
      ifClause(
        binary("<=", identifier(nParam), numberLiteral(0)),
        block([returnStatement([numberLiteral(base)])])
      )
    ]),
    returnStatement([
      binary(
        "+",
        numberLiteral(step),
        call(identifier(recName), [binary("-", identifier(nParam), numberLiteral(1))])
      )
    ])
  ]);
  return iife2([
    localFunctionStatement(recName, functionBody([functionParam(nParam)], body)),
    returnStatement([call(identifier(recName), [numberLiteral(n)])])
  ]);
}
function pickControlFlowStrategy2() {
  const options = ["forLoop", "whileLoop", "recursive"];
  return options[randomInt2(0, options.length - 1)];
}
function buildControlFlowNumberExpr(value, min, max) {
  switch (pickControlFlowStrategy2()) {
    case "forLoop":
      return buildForLoopNumberExpr(value, min, max);
    case "whileLoop":
      return buildWhileLoopNumberExpr(value, min, max);
    case "recursive":
      return buildRecursiveNumberExpr(value, min, max);
  }
}
function runNumbersToExpressions(program, options) {
  const controlFlowProbability = options.controlFlowProbability ?? CONTROL_FLOW_PROBABILITY_DEFAULT2;
  transformExpressions(program, (expr) => {
    if (expr.type !== "NumberLiteral") return;
    if (Number.isInteger(expr.value) && Math.random() < controlFlowProbability) {
      return buildControlFlowNumberExpr(expr.value, options.min, options.max);
    }
    return buildNumberExpr(expr.value, options.min, options.max);
  });
}

// src/passes/RenameVariables.ts
import { analyzeScopes, isGlobal } from "luau-parser";
function runRenameVariables(program, options) {
  const analysis = analyzeScopes(program);
  for (const binding of analysis.bindings.values()) {
    if (isGlobal(binding)) continue;
    if (binding.kind === "self") continue;
    const newName = options.random();
    binding.name = newName;
    if (binding.declarationNode) {
      binding.declarationNode.name = newName;
    }
    for (const ref of binding.references) {
      ref.name = newName;
    }
  }
}

// src/passes/GlobalMapping.ts
import { analyzeScopes as analyzeScopes2, isGlobal as isGlobal2, getBinding } from "luau-parser";
function randomInt3(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}
function randomKey() {
  if (Math.random() < 0.5) return randomInt3(1, 50);
  const chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  const len = randomInt3(2, 4);
  let s = "";
  for (let i = 0; i < len; i++) s += chars[randomInt3(0, chars.length - 1)];
  return s;
}
function randomPath() {
  const depth = randomInt3(2, 4);
  const path = [];
  for (let i = 0; i < depth; i++) path.push(randomKey());
  return path;
}
function isLeaf(v) {
  return !(v instanceof Map);
}
function insertPath(root, path, globalName) {
  let node = root;
  for (let i = 0; i < path.length - 1; i++) {
    const key = path[i];
    let next = node.get(key);
    if (next === void 0) {
      next = /* @__PURE__ */ new Map();
      node.set(key, next);
    } else if (isLeaf(next)) {
      return false;
    }
    node = next;
  }
  const lastKey = path[path.length - 1];
  if (node.has(lastKey)) return false;
  node.set(lastKey, { leaf: globalName });
  return true;
}
function assignPaths(globalNames) {
  const root = /* @__PURE__ */ new Map();
  const paths = /* @__PURE__ */ new Map();
  for (const name of globalNames) {
    let path = [];
    let attempts = 0;
    let ok = false;
    while (!ok && attempts < 200) {
      path = randomPath();
      ok = insertPath(root, path, name);
      attempts++;
    }
    paths.set(name, path);
  }
  return { root, paths };
}
function keyExpression(key) {
  return typeof key === "number" ? numberLiteral(key) : stringLiteral(key);
}
function buildTreeTableExpr(node) {
  const fields = [...node.entries()].map(
    ([key, value]) => computedField(
      keyExpression(key),
      isLeaf(value) ? identifier(value.leaf) : buildTreeTableExpr(value)
    )
  );
  return table(fields);
}
function buildIndexChain(tableName, path) {
  let expr = identifier(tableName);
  for (const key of path) {
    expr = index(expr, keyExpression(key));
  }
  return expr;
}
function morphIntoIndexChain(node, tableName, path) {
  const built = buildIndexChain(tableName, path);
  const target = node;
  for (const k of Object.keys(target)) delete target[k];
  Object.assign(target, built);
}
function collectUnsafeFunctionDeclGlobals(program, analysis) {
  const unsafe = /* @__PURE__ */ new Set();
  function visitBlock(block2) {
    for (const stmt of block2.statements) visitStatement(stmt);
  }
  function visitStatement(stmt) {
    switch (stmt.type) {
      case "FunctionDeclarationStatement": {
        const binding = getBinding(analysis, stmt.target.base);
        if (binding && isGlobal2(binding)) unsafe.add(binding.name);
        visitBlock(stmt.func.body);
        return;
      }
      case "LocalFunctionStatement":
        visitBlock(stmt.func.body);
        return;
      case "DoStatement":
        visitBlock(stmt.body);
        return;
      case "WhileStatement":
        visitBlock(stmt.body);
        return;
      case "RepeatStatement":
        visitBlock(stmt.body);
        return;
      case "IfStatement":
        for (const clause of stmt.clauses) visitBlock(clause.body);
        if (stmt.alternate) visitBlock(stmt.alternate);
        return;
      case "NumericForStatement":
        visitBlock(stmt.body);
        return;
      case "GenericForStatement":
        visitBlock(stmt.body);
        return;
      default:
        return;
    }
  }
  visitBlock(program.body);
  return unsafe;
}
function runGlobalMapping(program, options) {
  const analysis = analyzeScopes2(program);
  const unsafe = collectUnsafeFunctionDeclGlobals(program, analysis);
  const globalBindings = [...analysis.bindings.values()].filter(
    (b) => isGlobal2(b) && b.references.length > 0 && !unsafe.has(b.name)
  );
  if (globalBindings.length === 0) return;
  const { root, paths } = assignPaths(globalBindings.map((b) => b.name));
  for (const binding of globalBindings) {
    const path = paths.get(binding.name);
    for (const ref of binding.references) {
      morphIntoIndexChain(ref, options.tableName, path);
    }
  }
  program.body.statements.unshift(
    localStatement(options.tableName, buildTreeTableExpr(root))
  );
}

// src/passes/ConstantArray.ts
function keyOf(kind, value) {
  return kind === "string" ? `s:${value}` : `n:${value}`;
}
function shuffleIndices(length) {
  const order = Array.from({ length }, (_, i) => i);
  for (let i = order.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [order[i], order[j]] = [order[j], order[i]];
  }
  return order;
}
function defaultArrayName() {
  return "_CA" + Math.random().toString(36).slice(2, 8);
}
function runConstantArray(program, options) {
  const order = [];
  const seen = /* @__PURE__ */ new Set();
  transformExpressions(program, (expr) => {
    if (expr.type === "StringLiteral") {
      const k = keyOf("string", expr.value);
      if (!seen.has(k)) {
        seen.add(k);
        order.push({ kind: "string", value: expr.value });
      }
    } else if (expr.type === "NumberLiteral") {
      const k = keyOf("number", expr.value);
      if (!seen.has(k)) {
        seen.add(k);
        order.push({ kind: "number", value: expr.value });
      }
    }
    return void 0;
  });
  if (order.length === 0) return;
  const shuffledOrder = shuffleIndices(order.length);
  const indexOf = /* @__PURE__ */ new Map();
  shuffledOrder.forEach((originalIndex, slot) => {
    const entry = order[originalIndex];
    indexOf.set(keyOf(entry.kind, entry.value), slot + 1);
  });
  const arrayName = options.arrayName ?? defaultArrayName();
  transformExpressions(program, (expr) => {
    if (expr.type === "StringLiteral") {
      const idx = indexOf.get(keyOf("string", expr.value));
      return index(identifier(arrayName), numberLiteral(idx));
    }
    if (expr.type === "NumberLiteral") {
      const idx = indexOf.get(keyOf("number", expr.value));
      return index(identifier(arrayName), numberLiteral(idx));
    }
    return void 0;
  });
  const fields = shuffledOrder.map((originalIndex) => {
    const entry = order[originalIndex];
    const value = entry.kind === "string" ? stringLiteral(entry.value) : numberLiteral(entry.value);
    return { type: "TableFieldPositional", value };
  });
  program.body.statements.unshift(localStatement(arrayName, table(fields)));
}

// src/passes/EncryptStrings.ts
var MIN_KEY_LEN = 4;
var MAX_KEY_LEN = 12;
function randomInt4(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}
function randomName3() {
  return "_" + globalThis.crypto.randomUUID().replace(/-/g, "");
}
function toUtf8Bytes2(value) {
  return Array.from(new TextEncoder().encode(value));
}
function lrotate32(x, disp) {
  const d = (disp % 32 + 32) % 32;
  const xu = x >>> 0;
  if (d === 0) return xu;
  return (xu << d | xu >>> 32 - d) >>> 0;
}
function keystreamByte(keys, mult, i) {
  const nKeys = keys.length;
  const keyByte = keys[(i - 1) % nKeys];
  const rotated = lrotate32(keyByte, i % 8) & 255;
  const posByte = i * mult & 255;
  return (rotated ^ posByte) & 255;
}
function obfuscatedNumber(value) {
  const variant = randomInt4(0, 2);
  if (variant === 0) {
    const a2 = randomInt4(0, value);
    return binary("+", numberLiteral(a2), numberLiteral(value - a2));
  }
  if (variant === 1) {
    const a2 = randomInt4(0, 16777215);
    return binary("-", numberLiteral(value + a2), numberLiteral(a2));
  }
  const a = randomInt4(0, 16777215);
  const b = (value ^ a) >>> 0;
  return call(member(identifier("bit32"), "bxor"), [numberLiteral(a), numberLiteral(b)]);
}
function buildDecoderStatement(name) {
  const dataParam = randomName3();
  const keysParam = randomName3();
  const multParam = randomName3();
  const outVar = randomName3();
  const iVar = randomName3();
  const nKeysVar = randomName3();
  const idxExpr = binary(
    "+",
    binary("%", binary("-", identifier(iVar), numberLiteral(1)), identifier(nKeysVar)),
    numberLiteral(1)
  );
  const keyByte = index(identifier(keysParam), idxExpr);
  const mixed = call(member(identifier("bit32"), "band"), [
    call(member(identifier("bit32"), "lrotate"), [keyByte, binary("%", identifier(iVar), numberLiteral(8))]),
    numberLiteral(255)
  ]);
  const posByte = call(member(identifier("bit32"), "band"), [
    binary("*", identifier(iVar), identifier(multParam)),
    numberLiteral(255)
  ]);
  const keystream = call(member(identifier("bit32"), "bxor"), [mixed, posByte]);
  const finalByte = call(member(identifier("bit32"), "bxor"), [
    index(identifier(dataParam), identifier(iVar)),
    keystream
  ]);
  const body = block([
    localStatement(nKeysVar, unary("#", identifier(keysParam))),
    localStatement(outVar, table([])),
    numericForStatement(
      iVar,
      numberLiteral(1),
      unary("#", identifier(dataParam)),
      block([
        assignmentStatement(
          [index(identifier(outVar), identifier(iVar))],
          [call(member(identifier("string"), "char"), [finalByte])]
        )
      ])
    ),
    returnStatement([call(member(identifier("table"), "concat"), [identifier(outVar)])])
  ]);
  return localFunctionStatement(
    name,
    functionBody([functionParam(dataParam), functionParam(keysParam), functionParam(multParam)], body)
  );
}
function runEncryptStrings(program, _options) {
  const decoderName = randomName3();
  let used = false;
  transformExpressions(program, (expr) => {
    if (expr.type !== "StringLiteral") return;
    if (expr.value.length === 0) return;
    used = true;
    const keyLen = randomInt4(MIN_KEY_LEN, MAX_KEY_LEN);
    const keys = Array.from({ length: keyLen }, () => randomInt4(1, 255));
    const mult = randomInt4(1, 255);
    const plainBytes = toUtf8Bytes2(expr.value);
    const cipherBytes = plainBytes.map((b, idx) => b ^ keystreamByte(keys, mult, idx + 1));
    const dataTable = table(cipherBytes.map((b) => positionalField(numberLiteral(b))));
    const keysTable = table(keys.map((k) => positionalField(obfuscatedNumber(k))));
    const multExpr = obfuscatedNumber(mult);
    return call(identifier(decoderName), [dataTable, keysTable, multExpr]);
  });
  if (!used) return;
  program.body.statements.unshift(buildDecoderStatement(decoderName));
}

// src/passes/EncryptNumbers.ts
var UINT32_MAX = 4294967295;
var MOD32 = 4294967296;
function randomInt5(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}
function randomName4() {
  return "_" + globalThis.crypto.randomUUID().replace(/-/g, "");
}
function isEncryptable(value) {
  return Number.isInteger(value) && value >= 0 && value <= UINT32_MAX;
}
function xor32(a, b) {
  return (a ^ b) >>> 0;
}
function modAdd32(a, b) {
  return ((a + b) % MOD32 + MOD32) % MOD32;
}
function obfuscatedNumber2(value) {
  const variant = randomInt5(0, 2);
  if (variant === 0) {
    const a2 = randomInt5(0, value);
    return binary("+", numberLiteral(a2), numberLiteral(value - a2));
  }
  if (variant === 1) {
    const a2 = randomInt5(0, 16777215);
    return binary("-", numberLiteral(value + a2), numberLiteral(a2));
  }
  const a = randomInt5(0, 16777215);
  const b = xor32(value, a);
  return call(member(identifier("bit32"), "bxor"), [numberLiteral(a), numberLiteral(b)]);
}
function buildDecoderStatement2(name) {
  const xParam = randomName4();
  const keyAParam = randomName4();
  const keyBParam = randomName4();
  const tVar = randomName4();
  const body = block([
    localStatement(
      tVar,
      binary(
        "%",
        binary("-", identifier(xParam), identifier(keyBParam)),
        numberLiteral(MOD32)
      )
    ),
    returnStatement([call(member(identifier("bit32"), "bxor"), [identifier(tVar), identifier(keyAParam)])])
  ]);
  return localFunctionStatement(
    name,
    functionBody([functionParam(xParam), functionParam(keyAParam), functionParam(keyBParam)], body)
  );
}
function runEncryptNumbers(program, _options) {
  const decoderName = randomName4();
  let used = false;
  transformExpressions(program, (expr) => {
    if (expr.type !== "NumberLiteral") return;
    if (!isEncryptable(expr.value)) return;
    used = true;
    const keyA = randomInt5(1, 16777215);
    const keyB = randomInt5(1, 16777215);
    const t1 = xor32(expr.value, keyA);
    const encoded = modAdd32(t1, keyB);
    return call(identifier(decoderName), [
      obfuscatedNumber2(encoded),
      obfuscatedNumber2(keyA),
      obfuscatedNumber2(keyB)
    ]);
  });
  if (!used) return;
  program.body.statements.unshift(buildDecoderStatement2(decoderName));
}

// src/passes/InsertJunk.ts
function randomInt6(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}
function randomName5() {
  return "_" + globalThis.crypto.randomUUID().replace(/-/g, "");
}
function junkNumberExpr() {
  const op = Math.random() < 0.5 ? "+" : "*";
  return binary(op, numberLiteral(randomInt6(1, 999)), numberLiteral(randomInt6(1, 999)));
}
function buildJunkStatement() {
  const variants = [
    () => localStatement(randomName5(), junkNumberExpr()),
    () => doStatement(block([localStatement(randomName5(), junkNumberExpr())])),
    () => ifStatement([
      ifClause(
        binary("==", numberLiteral(randomInt6(1, 999)), numberLiteral(randomInt6(1, 999))),
        block([localStatement(randomName5(), junkNumberExpr())])
      )
    ])
  ];
  return variants[randomInt6(0, variants.length - 1)]();
}
function runInsertJunk(program, options) {
  function processExpr(expr) {
    switch (expr.type) {
      case "InterpolatedStringExpression":
        for (const part of expr.parts) {
          if (part.kind === "expression") processExpr(part.expression);
        }
        return;
      case "FunctionExpression":
        processBlock(expr.func.body);
        return;
      case "TableExpression":
        for (const field of expr.fields) {
          if (field.type === "TableFieldPositional") processExpr(field.value);
          else if (field.type === "TableFieldNamed") processExpr(field.value);
          else {
            processExpr(field.key);
            processExpr(field.value);
          }
        }
        return;
      case "BinaryExpression":
        processExpr(expr.left);
        processExpr(expr.right);
        return;
      case "UnaryExpression":
        processExpr(expr.argument);
        return;
      case "MemberExpression":
        processExpr(expr.object);
        return;
      case "IndexExpression":
        processExpr(expr.object);
        processExpr(expr.index);
        return;
      case "CallExpression":
        processExpr(expr.callee);
        expr.arguments.forEach(processExpr);
        return;
      case "MethodCallExpression":
        processExpr(expr.object);
        expr.arguments.forEach(processExpr);
        return;
      case "ParenthesizedExpression":
        processExpr(expr.expression);
        return;
      case "TypeAssertionExpression":
        processExpr(expr.expression);
        return;
      case "IfElseExpression":
        for (const clause of expr.clauses) {
          processExpr(clause.condition);
          processExpr(clause.body);
        }
        processExpr(expr.alternate);
        return;
      default:
        return;
    }
  }
  function processStatement(stmt) {
    switch (stmt.type) {
      case "LocalStatement":
        stmt.init.forEach(processExpr);
        return;
      case "LocalFunctionStatement":
        processBlock(stmt.func.body);
        return;
      case "FunctionDeclarationStatement":
        processBlock(stmt.func.body);
        return;
      case "AssignmentStatement":
        stmt.targets.forEach(processExpr);
        stmt.values.forEach(processExpr);
        return;
      case "CompoundAssignmentStatement":
        processExpr(stmt.target);
        processExpr(stmt.value);
        return;
      case "CallStatement":
        processExpr(stmt.expression);
        return;
      case "DoStatement":
        processBlock(stmt.body);
        return;
      case "WhileStatement":
        processExpr(stmt.condition);
        processBlock(stmt.body);
        return;
      case "RepeatStatement":
        processBlock(stmt.body);
        processExpr(stmt.condition);
        return;
      case "IfStatement":
        for (const clause of stmt.clauses) {
          processExpr(clause.condition);
          processBlock(clause.body);
        }
        if (stmt.alternate) processBlock(stmt.alternate);
        return;
      case "NumericForStatement":
        processExpr(stmt.start);
        processExpr(stmt.end);
        if (stmt.step) processExpr(stmt.step);
        processBlock(stmt.body);
        return;
      case "GenericForStatement":
        stmt.iterators.forEach(processExpr);
        processBlock(stmt.body);
        return;
      case "ReturnStatement":
        stmt.arguments.forEach(processExpr);
        return;
      default:
        return;
    }
  }
  function processBlock(blk) {
    for (const stmt of blk.statements) processStatement(stmt);
    const result = [];
    let inserted = 0;
    for (const stmt of blk.statements) {
      if (inserted < options.maxPerBlock && Math.random() < options.probability) {
        result.push(buildJunkStatement());
        inserted++;
      }
      result.push(stmt);
    }
    blk.statements = result;
  }
  processBlock(program.body);
}

// src/passes/WrapInFunction.ts
function runWrapInFunction(program, _options) {
  const innerBody = program.body;
  const wrapper = functionExpression(functionBody([], innerBody, true));
  const iife3 = call(paren(wrapper), [vararg()]);
  program.body = block([returnStatement([iife3])]);
}

// src/passes/Vmify.ts
import { luauparser as luauparser2 } from "luau-parser";

// src/passes/vmify/compiler.ts
import { luauparser } from "luau-parser";

// src/passes/vmify/opcodes.ts
var Opcode = /* @__PURE__ */ ((Opcode2) => {
  Opcode2[Opcode2["MOVE"] = 0] = "MOVE";
  Opcode2[Opcode2["LOADK"] = 1] = "LOADK";
  Opcode2[Opcode2["LOADBOOL"] = 2] = "LOADBOOL";
  Opcode2[Opcode2["LOADNIL"] = 3] = "LOADNIL";
  Opcode2[Opcode2["GETUPVAL"] = 4] = "GETUPVAL";
  Opcode2[Opcode2["SETUPVAL"] = 5] = "SETUPVAL";
  Opcode2[Opcode2["GETGLOBAL"] = 6] = "GETGLOBAL";
  Opcode2[Opcode2["SETGLOBAL"] = 7] = "SETGLOBAL";
  Opcode2[Opcode2["GETTABLE"] = 8] = "GETTABLE";
  Opcode2[Opcode2["SETTABLE"] = 9] = "SETTABLE";
  Opcode2[Opcode2["NEWTABLE"] = 10] = "NEWTABLE";
  Opcode2[Opcode2["SELF"] = 11] = "SELF";
  Opcode2[Opcode2["ADD"] = 12] = "ADD";
  Opcode2[Opcode2["SUB"] = 13] = "SUB";
  Opcode2[Opcode2["MUL"] = 14] = "MUL";
  Opcode2[Opcode2["DIV"] = 15] = "DIV";
  Opcode2[Opcode2["MOD"] = 16] = "MOD";
  Opcode2[Opcode2["POW"] = 17] = "POW";
  Opcode2[Opcode2["CONCAT"] = 18] = "CONCAT";
  Opcode2[Opcode2["UNM"] = 19] = "UNM";
  Opcode2[Opcode2["NOT"] = 20] = "NOT";
  Opcode2[Opcode2["LEN"] = 21] = "LEN";
  Opcode2[Opcode2["JMP"] = 22] = "JMP";
  Opcode2[Opcode2["EQ"] = 23] = "EQ";
  Opcode2[Opcode2["LT"] = 24] = "LT";
  Opcode2[Opcode2["LE"] = 25] = "LE";
  Opcode2[Opcode2["TEST"] = 26] = "TEST";
  Opcode2[Opcode2["CALL"] = 27] = "CALL";
  Opcode2[Opcode2["RETURN"] = 28] = "RETURN";
  Opcode2[Opcode2["FORPREP"] = 29] = "FORPREP";
  Opcode2[Opcode2["FORLOOP"] = 30] = "FORLOOP";
  Opcode2[Opcode2["CLOSURE"] = 31] = "CLOSURE";
  Opcode2[Opcode2["VARARG"] = 32] = "VARARG";
  Opcode2[Opcode2["SETLIST"] = 33] = "SETLIST";
  Opcode2[Opcode2["IDIV"] = 34] = "IDIV";
  return Opcode2;
})(Opcode || {});
function RK(regOrConstIdx, isConst) {
  return isConst ? -(regOrConstIdx + 1) : regOrConstIdx;
}
var OPCODE_COUNT = Object.keys(Opcode).filter((k) => Number.isNaN(Number(k))).length;
function createOpcodeMap(random = Math.random) {
  const perm = Array.from({ length: OPCODE_COUNT }, (_, i) => i);
  for (let i = perm.length - 1; i > 0; i--) {
    const j = Math.floor(random() * (i + 1));
    const tmp = perm[i];
    perm[i] = perm[j];
    perm[j] = tmp;
  }
  return perm;
}

// src/passes/vmify/chunk.ts
function createProto(id) {
  return {
    id,
    numParams: 0,
    hasVarargs: false,
    maxRegs: 0,
    code: [],
    consts: [],
    upvalDescs: [],
    protos: []
  };
}
function internConst(proto, value) {
  for (let i = 0; i < proto.consts.length; i++) {
    if (proto.consts[i] === value) return i;
  }
  proto.consts.push(value);
  return proto.consts.length - 1;
}

// src/passes/vmify/registers.ts
var RegisterAllocator = class {
  /** 현재 스코프에서 지역변수가 차지하고 있는, 즉 "보호된" 레지스터 개수. */
  localCount = 0;
  /** 다음에 할당할 임시 레지스터 인덱스. */
  freereg = 0;
  /** 지금까지 이 함수에서 동시에 살아있었던 최대 레지스터 수(Proto.maxRegs에 기록). */
  maxUsed = 0;
  /** 지역변수 하나를 위한 슬롯을 새로 확정한다. 반환값이 그 변수의 레지스터 번호. */
  declareLocal() {
    const slot = this.localCount;
    this.localCount++;
    if (this.freereg < this.localCount) this.freereg = this.localCount;
    this.track();
    return slot;
  }
  /** 블록/함수 스코프가 끝날 때, 그 스코프에서 선언된 지역변수 슬롯들을 반납. */
  releaseLocalsTo(savedLocalCount) {
    this.localCount = savedLocalCount;
    this.freereg = savedLocalCount;
  }
  saveLocalCount() {
    return this.localCount;
  }
  /** 표현식 평가용 임시 레지스터 하나 할당. */
  allocTemp() {
    const r = this.freereg;
    this.freereg++;
    this.track();
    return r;
  }
  /**
   * 임시 레지스터 n개를 반납(freereg를 내림). 지역변수 보호 슬롯 밑으로는
   * 절대 안 내려가도록 clamp — 호출 순서가 꼬여도 지역변수는 항상 안전.
   */
  freeTemp(toReg) {
    this.freereg = Math.max(toReg, this.localCount);
  }
  /** 지금 이 시점의 freereg. 임시 레지스터 블록 할당 전 저장해뒀다가 freeTemp에 씀. */
  top() {
    return this.freereg;
  }
  track() {
    if (this.freereg > this.maxUsed) this.maxUsed = this.freereg;
  }
};

// src/passes/vmify/scope-walk.ts
function buildEnclosingFunctionMap(program) {
  const ownerOf = /* @__PURE__ */ new Map();
  const parentOf = /* @__PURE__ */ new Map();
  const topMarker = { tag: "top" };
  parentOf.set(topMarker, void 0);
  function mark(node, fn) {
    ownerOf.set(node, fn);
  }
  function walkBlock2(block2, fn) {
    for (const stmt of block2.statements) walkStatement2(stmt, fn);
  }
  function walkFunctionBody2(fb, parent) {
    const self = { tag: "fn", node: fb };
    parentOf.set(self, parent);
    mark(fb, self);
    for (const p of fb.params) mark(p, self);
    walkBlock2(fb.body, self);
  }
  function walkExpr(expr, fn) {
    mark(expr, fn);
    switch (expr.type) {
      case "Identifier":
        mark(expr, fn);
        break;
      case "InterpolatedStringExpression":
        for (const part of expr.parts) if (part.kind === "expression") walkExpr(part.expression, fn);
        break;
      case "FunctionExpression":
        walkFunctionBody2(expr.func, fn);
        break;
      case "TableExpression":
        for (const field of expr.fields) {
          if (field.type === "TableFieldPositional") walkExpr(field.value, fn);
          else if (field.type === "TableFieldNamed") walkExpr(field.value, fn);
          else {
            walkExpr(field.key, fn);
            walkExpr(field.value, fn);
          }
        }
        break;
      case "BinaryExpression":
        walkExpr(expr.left, fn);
        walkExpr(expr.right, fn);
        break;
      case "UnaryExpression":
        walkExpr(expr.argument, fn);
        break;
      case "MemberExpression":
        walkExpr(expr.object, fn);
        break;
      case "IndexExpression":
        walkExpr(expr.object, fn);
        walkExpr(expr.index, fn);
        break;
      case "CallExpression":
        walkExpr(expr.callee, fn);
        for (const a of expr.arguments) walkExpr(a, fn);
        break;
      case "MethodCallExpression":
        walkExpr(expr.object, fn);
        for (const a of expr.arguments) walkExpr(a, fn);
        break;
      case "ParenthesizedExpression":
      case "TypeAssertionExpression":
        walkExpr(expr.expression, fn);
        break;
      case "IfElseExpression":
        for (const c of expr.clauses) {
          walkExpr(c.condition, fn);
          walkExpr(c.body, fn);
        }
        walkExpr(expr.alternate, fn);
        break;
    }
  }
  function walkStatement2(stmt, fn) {
    mark(stmt, fn);
    switch (stmt.type) {
      case "LocalStatement":
        for (const n of stmt.names) mark(n, fn);
        for (const e of stmt.init) walkExpr(e, fn);
        return;
      case "LocalFunctionStatement":
        mark(stmt.name, fn);
        walkFunctionBody2(stmt.func, fn);
        return;
      case "FunctionDeclarationStatement":
        mark(stmt.target.base, fn);
        walkFunctionBody2(stmt.func, fn);
        return;
      case "AssignmentStatement":
        for (const t of stmt.targets) walkExpr(t, fn);
        for (const v of stmt.values) walkExpr(v, fn);
        return;
      case "CompoundAssignmentStatement":
        walkExpr(stmt.target, fn);
        walkExpr(stmt.value, fn);
        return;
      case "CallStatement":
        walkExpr(stmt.expression, fn);
        return;
      case "DoStatement":
        walkBlock2(stmt.body, fn);
        return;
      case "WhileStatement":
        walkExpr(stmt.condition, fn);
        walkBlock2(stmt.body, fn);
        return;
      case "RepeatStatement":
        walkBlock2(stmt.body, fn);
        walkExpr(stmt.condition, fn);
        return;
      case "IfStatement":
        for (const c of stmt.clauses) {
          walkExpr(c.condition, fn);
          walkBlock2(c.body, fn);
        }
        if (stmt.alternate) walkBlock2(stmt.alternate, fn);
        return;
      case "NumericForStatement":
        mark(stmt.variable, fn);
        walkExpr(stmt.start, fn);
        walkExpr(stmt.end, fn);
        if (stmt.step) walkExpr(stmt.step, fn);
        walkBlock2(stmt.body, fn);
        return;
      case "GenericForStatement":
        for (const v of stmt.variables) mark(v, fn);
        for (const it of stmt.iterators) walkExpr(it, fn);
        walkBlock2(stmt.body, fn);
        return;
      case "ReturnStatement":
        for (const a of stmt.arguments) walkExpr(a, fn);
        return;
      default:
        return;
    }
  }
  walkBlock2(program.body, topMarker);
  return { ownerOf, parentOf, topMarker };
}
function ownerFunctionOf(map, node) {
  const fn = map.ownerOf.get(node);
  if (!fn) throw new Error("scope-walk: node was not visited \u2014 walker/compiler are out of sync");
  return fn;
}

// src/passes/vmify/compiler.ts
var BOX_FIELD = "v";
var DEFAULT_BUILTIN_GLOBALS = [
  "game",
  "script",
  "workspace",
  "print",
  "warn",
  "error",
  "pairs",
  "ipairs",
  "pcall",
  "xpcall",
  "type",
  "typeof",
  "tostring",
  "tonumber",
  "select",
  "unpack",
  "table",
  "string",
  "math",
  "os",
  "task",
  "Instance",
  "Vector3",
  "CFrame",
  "Color3",
  "require",
  "setmetatable",
  "getmetatable",
  "rawget",
  "rawset",
  "rawequal",
  "next"
];
var VmCompiler = class {
  constructor(program, builtinGlobals = DEFAULT_BUILTIN_GLOBALS, opcodeMap) {
    this.program = program;
    this.opcodeMap = opcodeMap;
    this.analysis = luauparser.analyzeScopes(program, { builtinGlobals });
    this.enclosing = buildEnclosingFunctionMap(program);
    for (const [id, binding] of this.analysis.bindings) {
      if (binding.declarationNode) this.declToBinding.set(binding.declarationNode, id);
    }
    this.computeCaptured();
  }
  program;
  opcodeMap;
  analysis;
  enclosing;
  captured = /* @__PURE__ */ new Set();
  protoIdCounter = 0;
  declToBinding = /* @__PURE__ */ new Map();
  computeCaptured() {
    for (const binding of this.analysis.bindings.values()) {
      if (binding.kind === "global") continue;
      if (!binding.declarationNode) continue;
      const ownerFn = ownerFunctionOf(this.enclosing, binding.declarationNode);
      for (const ref of binding.references) {
        const refFn = ownerFunctionOf(this.enclosing, ref);
        if (refFn !== ownerFn) {
          this.captured.add(binding.id);
          break;
        }
      }
    }
  }
  compile() {
    const top = this.newFuncState(void 0, this.enclosing.topMarker);
    top.proto.hasVarargs = true;
    this.compileBlock(this.program.body, top);
    this.emit(top, 28 /* RETURN */, 0, 1, 0);
    top.proto.maxRegs = top.regs.maxUsed;
    return top.proto;
  }
  newFuncState(parent, marker) {
    return {
      proto: createProto(this.protoIdCounter++),
      parent,
      marker,
      regs: new RegisterAllocator(),
      localSlots: /* @__PURE__ */ new Map(),
      upvalIndexByBinding: /* @__PURE__ */ new Map(),
      breakPatchStack: [],
      continuePatchStack: []
    };
  }
  emit(state, op, a, b, c, comment) {
    const physicalOp = this.opcodeMap ? this.opcodeMap[op] : op;
    state.proto.code.push({ op: physicalOp, a, b, c, comment });
    return state.proto.code.length - 1;
  }
  konst(state, value) {
    return internConst(state.proto, value);
  }
  bindingIdOf(node) {
    return this.analysis.bindingOf.get(node);
  }
  getOrCreateUpval(state, bindingId) {
    const existing = state.upvalIndexByBinding.get(bindingId);
    if (existing !== void 0) return existing;
    const parent = state.parent;
    if (!parent) throw new Error("vmify: binding not found in any enclosing function (compiler bug)");
    const parentLocal = parent.localSlots.get(bindingId);
    const idx = state.proto.upvalDescs.length;
    if (parentLocal) {
      state.proto.upvalDescs.push({ kind: "local", index: parentLocal.reg });
    } else {
      const parentUpvalIdx = this.getOrCreateUpval(parent, bindingId);
      state.proto.upvalDescs.push({ kind: "upval", index: parentUpvalIdx });
    }
    state.upvalIndexByBinding.set(bindingId, idx);
    return idx;
  }
  bindingIsLocalSomewhereUp(state, bindingId) {
    let s = state;
    while (s) {
      if (s.localSlots.has(bindingId)) return true;
      s = s.parent;
    }
    return false;
  }
  declareLocalBinding(state, bindingId) {
    const reg = state.regs.declareLocal();
    state.localSlots.set(bindingId, { reg, boxed: this.captured.has(bindingId) });
    if (this.captured.has(bindingId)) this.emitNewBox(state, reg);
    return reg;
  }
  emitNewBox(state, reg) {
    this.emit(state, 10 /* NEWTABLE */, reg, 0, 0, "box");
  }
  emitLoadBinding(state, bindingId, dest) {
    const local = state.localSlots.get(bindingId);
    if (local) {
      if (local.boxed) {
        const k = this.konst(state, BOX_FIELD);
        this.emit(state, 8 /* GETTABLE */, dest, local.reg, RK(k, true));
      } else if (dest !== local.reg) {
        this.emit(state, 0 /* MOVE */, dest, local.reg, 0);
      }
      return;
    }
    if (this.bindingIsLocalSomewhereUp(state, bindingId)) {
      const idx = this.getOrCreateUpval(state, bindingId);
      this.emit(state, 4 /* GETUPVAL */, dest, idx, 0);
      const k = this.konst(state, BOX_FIELD);
      this.emit(state, 8 /* GETTABLE */, dest, dest, RK(k, true));
      return;
    }
    const binding = this.analysis.bindings.get(bindingId);
    const nameIdx = this.konst(state, binding.name);
    this.emit(state, 6 /* GETGLOBAL */, dest, nameIdx, 0);
  }
  emitStoreBinding(state, bindingId, src) {
    const local = state.localSlots.get(bindingId);
    if (local) {
      if (local.boxed) {
        const k = this.konst(state, BOX_FIELD);
        this.emit(state, 9 /* SETTABLE */, local.reg, RK(k, true), src);
      } else if (src !== local.reg) {
        this.emit(state, 0 /* MOVE */, local.reg, src, 0);
      }
      return;
    }
    if (this.bindingIsLocalSomewhereUp(state, bindingId)) {
      const idx = this.getOrCreateUpval(state, bindingId);
      const tmp = state.regs.allocTemp();
      this.emit(state, 4 /* GETUPVAL */, tmp, idx, 0);
      const k = this.konst(state, BOX_FIELD);
      this.emit(state, 9 /* SETTABLE */, tmp, RK(k, true), src);
      state.regs.freeTemp(tmp);
      return;
    }
    const binding = this.analysis.bindings.get(bindingId);
    const nameIdx = this.konst(state, binding.name);
    this.emit(state, 7 /* SETGLOBAL */, src, nameIdx, 0);
  }
  compileBlock(block2, state) {
    const saved = state.regs.saveLocalCount();
    for (const stmt of block2.statements) this.compileStatement(stmt, state);
    state.regs.releaseLocalsTo(saved);
  }
  compileStatement(stmt, state) {
    switch (stmt.type) {
      case "LocalStatement": {
        const bindingIds = stmt.names.map((n) => this.bindingIdOfDecl(n));
        for (const id of bindingIds) this.declareLocalBinding(state, id);
        const boundary = state.regs.top();
        let filledUpTo = 0;
        if (stmt.init.length > 0) {
          for (let i = 0; i < stmt.init.length - 1; i++) {
            this.compileExprTo(stmt.init[i], state, boundary + i);
          }
          const lastIdx = stmt.init.length - 1;
          const remaining = Math.max(bindingIds.length - lastIdx, 1);
          this.compileExprMultiInto(stmt.init[lastIdx], state, boundary + lastIdx, remaining);
          filledUpTo = lastIdx + remaining;
        }
        for (let i = filledUpTo; i < bindingIds.length; i++) {
          this.emit(state, 3 /* LOADNIL */, boundary + i, boundary + i, 0);
        }
        for (let i = 0; i < bindingIds.length; i++) {
          this.emitStoreBinding(state, bindingIds[i], boundary + i);
        }
        state.regs.freeTemp(boundary);
        return;
      }
      case "AssignmentStatement": {
        const valueRegs = stmt.values.map((e) => this.compileExpr(e, state));
        stmt.targets.forEach((target, i) => {
          const srcReg = valueRegs[i] ?? valueRegs[valueRegs.length - 1];
          this.compileAssignTarget(target, srcReg, state);
        });
        return;
      }
      case "CompoundAssignmentStatement":
        this.compileCompoundAssignment(stmt, state);
        return;
      case "CallStatement":
        this.compileExpr(stmt.expression, state, true);
        return;
      case "IfStatement":
        this.compileIf(stmt, state);
        return;
      case "WhileStatement":
        this.compileWhile(stmt, state);
        return;
      case "RepeatStatement":
        this.compileRepeat(stmt, state);
        return;
      case "NumericForStatement":
        this.compileNumericFor(stmt, state);
        return;
      case "GenericForStatement":
        this.compileGenericFor(stmt, state);
        return;
      case "DoStatement":
        this.compileBlock(stmt.body, state);
        return;
      case "ReturnStatement": {
        if (stmt.arguments.length === 0) {
          this.emit(state, 28 /* RETURN */, state.regs.top(), 1, 0);
          return;
        }
        if (stmt.arguments.length === 1 && this.isMultiValueExpr(stmt.arguments[0])) {
          const base = state.regs.top();
          this.compileExprOpenInto(stmt.arguments[0], state, base);
          this.emit(state, 28 /* RETURN */, base, 0, 0);
          state.regs.freeTemp(base);
          return;
        }
        const boundary = state.regs.top();
        for (let i = 0; i < stmt.arguments.length - 1; i++) {
          this.compileExprTo(stmt.arguments[i], state, boundary + i);
        }
        const lastIdx = stmt.arguments.length - 1;
        if (this.isMultiValueExpr(stmt.arguments[lastIdx])) {
          this.compileExprOpenInto(stmt.arguments[lastIdx], state, boundary + lastIdx);
          this.emit(state, 28 /* RETURN */, boundary, 0, 0);
        } else {
          this.compileExprTo(stmt.arguments[lastIdx], state, boundary + lastIdx);
          this.emit(state, 28 /* RETURN */, boundary, stmt.arguments.length + 1, 0);
        }
        state.regs.freeTemp(boundary);
        return;
      }
      case "LocalFunctionStatement": {
        const bindingId = this.bindingIdOfDecl(stmt.name);
        const reg = this.declareLocalBinding(state, bindingId);
        const protoIdx = this.compileFunctionBody(stmt.func, state);
        const boxed = state.localSlots.get(bindingId).boxed;
        if (boxed) {
          const tmp = state.regs.allocTemp();
          this.emitClosure(state, tmp, protoIdx);
          this.emitStoreBinding(state, bindingId, tmp);
          state.regs.freeTemp(tmp);
        } else {
          this.emitClosure(state, reg, protoIdx);
        }
        return;
      }
      case "FunctionDeclarationStatement":
        this.compileFunctionDeclaration(stmt, state);
        return;
      case "BreakStatement": {
        if (state.breakPatchStack.length === 0) throw new Error("vmify: break outside loop");
        const idx = this.emit(state, 22 /* JMP */, 0, 0, 0, "break");
        state.breakPatchStack[state.breakPatchStack.length - 1].push(idx);
        return;
      }
      case "ContinueStatement": {
        if (state.continuePatchStack.length === 0) throw new Error("vmify: continue outside loop");
        const idx = this.emit(state, 22 /* JMP */, 0, 0, 0, "continue");
        state.continuePatchStack[state.continuePatchStack.length - 1].push(idx);
        return;
      }
      case "TypeAliasStatement":
      case "ExportTypeAliasStatement":
        return;
      default: {
        const _exhaustive = stmt;
        throw new Error(`vmify: unhandled statement ${_exhaustive.type}`);
      }
    }
  }
  compileAssignTarget(target, srcReg, state) {
    if (target.type === "Identifier") {
      const bindingId = this.bindingIdOf(target);
      if (bindingId === void 0) throw new Error("vmify: unresolved identifier target");
      this.emitStoreBinding(state, bindingId, srcReg);
      return;
    }
    if (target.type === "MemberExpression") {
      const objReg = this.compileExpr(target.object, state);
      const k = this.konst(state, target.property.name);
      this.emit(state, 9 /* SETTABLE */, objReg, RK(k, true), srcReg);
      state.regs.freeTemp(objReg);
      return;
    }
    if (target.type === "IndexExpression") {
      const objReg = this.compileExpr(target.object, state);
      const keyReg = this.compileExpr(target.index, state);
      this.emit(state, 9 /* SETTABLE */, objReg, keyReg, srcReg);
      state.regs.freeTemp(objReg);
      return;
    }
    throw new Error(`vmify: unsupported assignment target ${target.type}`);
  }
  compileCompoundAssignment(stmt, state) {
    const opMap = {
      "+=": 12 /* ADD */,
      "-=": 13 /* SUB */,
      "*=": 14 /* MUL */,
      "/=": 15 /* DIV */,
      "//=": 34 /* IDIV */,
      "%=": 16 /* MOD */,
      "^=": 17 /* POW */,
      "..=": 18 /* CONCAT */
    };
    const op = opMap[stmt.operator];
    if (!op) throw new Error(`vmify: unsupported compound operator ${stmt.operator}`);
    const target = stmt.target;
    if (target.type === "Identifier") {
      const bindingId = this.bindingIdOf(target);
      if (bindingId === void 0) throw new Error("vmify: unresolved identifier target");
      const cur = state.regs.allocTemp();
      this.emitLoadBinding(state, bindingId, cur);
      const rhs = this.compileExpr(stmt.value, state);
      this.emit(state, op, cur, cur, rhs);
      state.regs.freeTemp(rhs);
      this.emitStoreBinding(state, bindingId, cur);
      state.regs.freeTemp(cur);
      return;
    }
    if (target.type === "MemberExpression") {
      const objReg = this.compileExpr(target.object, state);
      const k = this.konst(state, target.property.name);
      const cur = state.regs.allocTemp();
      this.emit(state, 8 /* GETTABLE */, cur, objReg, RK(k, true));
      const rhs = this.compileExpr(stmt.value, state);
      this.emit(state, op, cur, cur, rhs);
      this.emit(state, 9 /* SETTABLE */, objReg, RK(k, true), cur);
      state.regs.freeTemp(objReg);
      return;
    }
    if (target.type === "IndexExpression") {
      const objReg = this.compileExpr(target.object, state);
      const keyReg = this.compileExpr(target.index, state);
      const cur = state.regs.allocTemp();
      this.emit(state, 8 /* GETTABLE */, cur, objReg, keyReg);
      const rhs = this.compileExpr(stmt.value, state);
      this.emit(state, op, cur, cur, rhs);
      this.emit(state, 9 /* SETTABLE */, objReg, keyReg, cur);
      state.regs.freeTemp(objReg);
      return;
    }
    throw new Error(`vmify: unsupported compound assignment target ${target.type}`);
  }
  compileFunctionDeclaration(stmt, state) {
    const protoIdx = this.compileFunctionBody(stmt.func, state);
    const fnReg = state.regs.allocTemp();
    this.emitClosure(state, fnReg, protoIdx);
    const target = stmt.target;
    if (target.path.length === 0 && !target.method) {
      const bindingId = this.bindingIdOf(target.base);
      if (bindingId === void 0) throw new Error("vmify: unresolved function name");
      this.emitStoreBinding(state, bindingId, fnReg);
      state.regs.freeTemp(fnReg);
      return;
    }
    const baseBindingId = this.bindingIdOf(target.base);
    if (baseBindingId === void 0) throw new Error("vmify: unresolved function name base");
    let objReg = state.regs.allocTemp();
    this.emitLoadBinding(state, baseBindingId, objReg);
    const navigateSegments = target.method ? target.path : target.path.slice(0, -1);
    for (const seg of navigateSegments) {
      const k2 = this.konst(state, seg.name);
      const next = state.regs.allocTemp();
      this.emit(state, 8 /* GETTABLE */, next, objReg, RK(k2, true));
      objReg = next;
    }
    const finalKeyName = target.method ? target.method.name : target.path[target.path.length - 1].name;
    const k = this.konst(state, finalKeyName);
    this.emit(state, 9 /* SETTABLE */, objReg, RK(k, true), fnReg);
    state.regs.freeTemp(fnReg);
  }
  compileIf(stmt, state) {
    const endPatches = [];
    for (const clause of stmt.clauses) {
      const condReg = this.compileExpr(clause.condition, state);
      this.emit(state, 26 /* TEST */, condReg, 0, 1);
      const jmpOverBody = this.emit(state, 22 /* JMP */, 0, 0, 0, "skip-then");
      state.regs.freeTemp(condReg);
      this.compileBlock(clause.body, state);
      const jmpToEnd = this.emit(state, 22 /* JMP */, 0, 0, 0, "then->end");
      endPatches.push(jmpToEnd);
      this.patchJump(state, jmpOverBody, state.proto.code.length);
    }
    if (stmt.alternate) this.compileBlock(stmt.alternate, state);
    for (const p of endPatches) this.patchJump(state, p, state.proto.code.length);
  }
  compileWhile(stmt, state) {
    const loopStart = state.proto.code.length;
    const condReg = this.compileExpr(stmt.condition, state);
    this.emit(state, 26 /* TEST */, condReg, 0, 1);
    const exitJmp = this.emit(state, 22 /* JMP */, 0, 0, 0, "while-exit");
    state.regs.freeTemp(condReg);
    state.breakPatchStack.push([]);
    state.continuePatchStack.push([]);
    this.compileBlock(stmt.body, state);
    this.emit(state, 22 /* JMP */, loopStart - state.proto.code.length, 0, 0, "while-back");
    const target = state.proto.code.length;
    this.patchJump(state, exitJmp, target);
    for (const b of state.breakPatchStack.pop()) this.patchJump(state, b, target);
    for (const c of state.continuePatchStack.pop()) this.patchJump(state, c, loopStart);
  }
  compileRepeat(stmt, state) {
    const loopStart = state.proto.code.length;
    state.breakPatchStack.push([]);
    state.continuePatchStack.push([]);
    const saved = state.regs.saveLocalCount();
    for (const s of stmt.body.statements) this.compileStatement(s, state);
    const condCheckStart = state.proto.code.length;
    const condReg = this.compileExpr(stmt.condition, state);
    this.emit(state, 26 /* TEST */, condReg, 0, 1);
    const jmpBack = this.emit(state, 22 /* JMP */, 0, 0, 0, "repeat-back");
    state.regs.freeTemp(condReg);
    this.patchJump(state, jmpBack, loopStart);
    state.regs.releaseLocalsTo(saved);
    const endIdx = state.proto.code.length;
    for (const b of state.breakPatchStack.pop()) this.patchJump(state, b, endIdx);
    for (const c of state.continuePatchStack.pop()) this.patchJump(state, c, condCheckStart);
  }
  compileNumericFor(stmt, state) {
    const saved = state.regs.saveLocalCount();
    const base = state.regs.declareLocal();
    state.regs.declareLocal();
    state.regs.declareLocal();
    const cursor = state.regs.declareLocal();
    const startTmp = this.compileExpr(stmt.start, state);
    this.emit(state, 0 /* MOVE */, base, startTmp, 0);
    state.regs.freeTemp(startTmp);
    const endTmp = this.compileExpr(stmt.end, state);
    this.emit(state, 0 /* MOVE */, base + 1, endTmp, 0);
    state.regs.freeTemp(endTmp);
    const stepTmp = stmt.step ? this.compileExpr(stmt.step, state) : this.loadConst(state, 1);
    this.emit(state, 0 /* MOVE */, base + 2, stepTmp, 0);
    state.regs.freeTemp(stepTmp);
    const prep = this.emit(state, 29 /* FORPREP */, base, 0, 0, "forprep");
    const loopBodyStart = state.proto.code.length;
    const bindingId = this.bindingIdOfDecl(stmt.variable);
    const captured = this.captured.has(bindingId);
    let varReg;
    if (captured) {
      varReg = state.regs.declareLocal();
      this.emitNewBox(state, varReg);
      const k = this.konst(state, BOX_FIELD);
      this.emit(state, 9 /* SETTABLE */, varReg, RK(k, true), cursor);
    } else {
      varReg = cursor;
    }
    state.localSlots.set(bindingId, { reg: varReg, boxed: captured });
    state.breakPatchStack.push([]);
    state.continuePatchStack.push([]);
    this.compileBlock(stmt.body, state);
    const loopInstr = this.emit(state, 30 /* FORLOOP */, base, 0, 0, "forloop");
    this.patchJumpField(state, prep, loopInstr, "b");
    this.patchJumpField(state, loopInstr, loopBodyStart, "b");
    const endIdx = state.proto.code.length;
    for (const b of state.breakPatchStack.pop()) this.patchJump(state, b, endIdx);
    for (const c of state.continuePatchStack.pop()) this.patchJump(state, c, loopInstr);
    state.regs.releaseLocalsTo(saved);
  }
  compileGenericFor(stmt, state) {
    const saved = state.regs.saveLocalCount();
    const base = state.regs.declareLocal();
    state.regs.declareLocal();
    state.regs.declareLocal();
    const iterators = stmt.iterators;
    if (iterators.length === 1 && iterators[0].type === "CallExpression") {
      const firstReg = this.compileCallMultiInto(iterators[0], state, 3);
      for (let i = 0; i < 3; i++) this.emit(state, 0 /* MOVE */, base + i, firstReg + i, 0);
      state.regs.freeTemp(firstReg);
    } else {
      for (let i = 0; i < 3; i++) {
        if (i < iterators.length) {
          const r = this.compileExpr(iterators[i], state);
          this.emit(state, 0 /* MOVE */, base + i, r, 0);
          state.regs.freeTemp(r);
        } else {
          this.emit(state, 3 /* LOADNIL */, base + i, base + i, 0);
        }
      }
    }
    const loopStart = state.proto.code.length;
    const nVars = stmt.variables.length;
    const callBase = state.regs.top();
    const fnSlot = state.regs.allocTemp();
    const stateSlot = state.regs.allocTemp();
    const ctrlSlot = state.regs.allocTemp();
    this.emit(state, 0 /* MOVE */, fnSlot, base, 0);
    this.emit(state, 0 /* MOVE */, stateSlot, base + 1, 0);
    this.emit(state, 0 /* MOVE */, ctrlSlot, base + 2, 0);
    this.emit(state, 27 /* CALL */, fnSlot, 3, nVars + 1);
    state.regs.freeTemp(callBase);
    const resultRegs = [];
    for (let i = 0; i < nVars; i++) resultRegs.push(state.regs.declareLocal());
    const firstResult = resultRegs[0];
    this.emit(state, 26 /* TEST */, firstResult, 0, 1);
    const exitJmp = this.emit(state, 22 /* JMP */, 0, 0, 0, "generic-for-exit");
    this.emit(state, 0 /* MOVE */, base + 2, firstResult, 0);
    for (let i = 0; i < nVars; i++) {
      const bindingId = this.bindingIdOfDecl(stmt.variables[i]);
      if (this.captured.has(bindingId)) {
        const boxReg = state.regs.declareLocal();
        state.localSlots.set(bindingId, { reg: boxReg, boxed: true });
        this.emitNewBox(state, boxReg);
        const k = this.konst(state, BOX_FIELD);
        this.emit(state, 9 /* SETTABLE */, boxReg, RK(k, true), resultRegs[i]);
      } else {
        state.localSlots.set(bindingId, { reg: resultRegs[i], boxed: false });
      }
    }
    state.breakPatchStack.push([]);
    state.continuePatchStack.push([]);
    this.compileBlock(stmt.body, state);
    this.emit(state, 22 /* JMP */, loopStart - state.proto.code.length, 0, 0, "generic-for-back");
    const endIdx = state.proto.code.length;
    this.patchJump(state, exitJmp, endIdx);
    for (const b of state.breakPatchStack.pop()) this.patchJump(state, b, endIdx);
    for (const c of state.continuePatchStack.pop()) this.patchJump(state, c, loopStart);
    state.regs.releaseLocalsTo(saved);
  }
  compileCallMultiInto(callExpr, state, wantCount) {
    const base = this.compileExpr(callExpr.callee, state);
    this.compileArgsContiguous(callExpr.arguments, state, base + 1);
    this.emit(state, 27 /* CALL */, base, callExpr.arguments.length + 1, wantCount + 1);
    return base;
  }
  loadConst(state, value) {
    const reg = state.regs.allocTemp();
    const k = this.konst(state, value);
    this.emit(state, 1 /* LOADK */, reg, k, 0);
    return reg;
  }
  patchJump(state, instrIdx, targetIdx) {
    this.patchJumpField(state, instrIdx, targetIdx, "a");
  }
  patchJumpField(state, instrIdx, targetIdx, field) {
    state.proto.code[instrIdx][field] = targetIdx - instrIdx;
  }
  bindingIdOfDecl(node) {
    const id = this.declToBinding.get(node);
    if (id === void 0) throw new Error("vmify: could not resolve declaration binding (compiler bug)");
    return id;
  }
  /** expr을 컴파일해서 결과가 정확히 target 레지스터에 오도록 강제(필요하면 MOVE 한 번 추가). */
  compileExprTo(expr, state, target) {
    const r = this.compileExpr(expr, state);
    if (r !== target) this.emit(state, 0 /* MOVE */, target, r, 0);
    state.regs.freeTemp(target + 1);
  }
  /**
   * CALL/RETURN처럼 "레지스터 base부터 연속으로 n개"를 요구하는 명령을 위해, 인자 표현식
   * 목록을 base, base+1, base+2 ...에 강제로 배치한다. 단순히 순서대로 compileExpr만
   * 호출하면 개별 인자는 각자 "자기 자신의 결과+1"이 다음 top이 되는 게 맞지만, 그 인자가
   * 복합 표현식(예: 이항연산 `i > 2`)이라 내부에서 스크래치 레지스터를 여러 개 쓰면 다음
   * 인자와의 사이에 빈틈이 생겨 CALL/RETURN이 잘못된 레지스터를 읽게 된다 — 그래서 매
   * 인자마다 목표 레지스터를 명시하고 필요하면 MOVE로 맞춰준다.
   */
  compileArgsContiguous(exprs, state, base) {
    for (let i = 0; i < exprs.length; i++) this.compileExprTo(exprs[i], state, base + i);
  }
  /** Call/MethodCall/Vararg처럼 "여러 값"을 낼 수 있는 표현식인지. */
  isMultiValueExpr(expr) {
    return expr.type === "CallExpression" || expr.type === "MethodCallExpression" || expr.type === "VarargExpression";
  }
  /**
   * expr을 컴파일해서 "정확히 wantCount개"의 값을 base..base+wantCount-1에 채운다
   * (모자라면 nil로 패딩). Call/MethodCall/Vararg만 1개 이상을 낼 수 있고, 그 외
   * 표현식은 항상 1개만 내므로 나머지는 자동으로 nil 패딩된다.
   */
  compileExprMultiInto(expr, state, base, wantCount) {
    if (wantCount <= 0) return;
    if (expr.type === "CallExpression") {
      const calleeReg = this.compileExpr(expr.callee, state);
      const b = this.compileCallArgsAndGetB(expr.arguments, state, calleeReg + 1);
      this.emit(state, 27 /* CALL */, calleeReg, b, wantCount + 1);
      for (let i = 0; i < wantCount; i++) {
        if (calleeReg + i !== base + i) this.emit(state, 0 /* MOVE */, base + i, calleeReg + i, 0);
      }
      state.regs.freeTemp(base + wantCount);
      return;
    }
    if (expr.type === "MethodCallExpression") {
      const objReg = this.compileExpr(expr.object, state);
      const k = this.konst(state, expr.method.name);
      const fnSlot = state.regs.allocTemp();
      this.emit(state, 11 /* SELF */, fnSlot, objReg, RK(k, true));
      state.regs.allocTemp();
      const argB = this.compileCallArgsAndGetB(expr.arguments, state, fnSlot + 2);
      const b = argB === 0 ? 0 : expr.arguments.length + 2;
      this.emit(state, 27 /* CALL */, fnSlot, b, wantCount + 1);
      for (let i = 0; i < wantCount; i++) {
        if (fnSlot + i !== base + i) this.emit(state, 0 /* MOVE */, base + i, fnSlot + i, 0);
      }
      state.regs.freeTemp(base + wantCount);
      return;
    }
    if (expr.type === "VarargExpression") {
      this.emit(state, 32 /* VARARG */, base, wantCount + 1, 0);
      state.regs.freeTemp(base + wantCount);
      return;
    }
    this.compileExprTo(expr, state, base);
    for (let i = 1; i < wantCount; i++) this.emit(state, 3 /* LOADNIL */, base + i, base + i, 0);
  }
  /**
   * expr을 컴파일해서 "런타임이 결정하는 개수만큼" base부터 이어서 채운다(frame.multiTop
   * 갱신). Call/MethodCall/Vararg가 아니면 그냥 1개로 취급(compileExprTo와 동일).
   * `return f()`나 `g(a, f())`의 마지막 인자처럼 다중값을 그대로 전파할 때 씀.
   */
  compileExprOpenInto(expr, state, base) {
    if (expr.type === "CallExpression") {
      const calleeReg = this.compileExpr(expr.callee, state);
      if (calleeReg !== base) this.emit(state, 0 /* MOVE */, base, calleeReg, 0);
      state.regs.freeTemp(base + 1);
      const b = this.compileCallArgsAndGetB(expr.arguments, state, base + 1);
      this.emit(state, 27 /* CALL */, base, b, 0);
      return;
    }
    if (expr.type === "MethodCallExpression") {
      const objReg = this.compileExpr(expr.object, state);
      const k = this.konst(state, expr.method.name);
      const fnSlot = state.regs.allocTemp();
      this.emit(state, 11 /* SELF */, fnSlot, objReg, RK(k, true));
      state.regs.allocTemp();
      if (fnSlot !== base) {
        this.emit(state, 0 /* MOVE */, base, fnSlot, 0);
        this.emit(state, 0 /* MOVE */, base + 1, fnSlot + 1, 0);
      }
      state.regs.freeTemp(base + 2);
      const argB = this.compileCallArgsAndGetB(expr.arguments, state, base + 2);
      const b = argB === 0 ? 0 : expr.arguments.length + 2;
      this.emit(state, 27 /* CALL */, base, b, 0);
      return;
    }
    if (expr.type === "VarargExpression") {
      this.emit(state, 32 /* VARARG */, base, 0, 0);
      return;
    }
    this.compileExprTo(expr, state, base);
  }
  /**
   * 호출 인자 목록을 base부터 컴파일. 마지막 인자가 다중값 가능한 표현식이면 열어서
   * 끝까지 전파(`f(a, g())`가 g()의 모든 반환값을 다 넘기도록)하고 CALL의 b로 쓸 값(0)을
   * 반환한다. 아니면 고정 개수(b=args.length+1)를 반환.
   */
  compileCallArgsAndGetB(args, state, base) {
    if (args.length === 0) return 1;
    for (let i = 0; i < args.length - 1; i++) this.compileExprTo(args[i], state, base + i);
    const last = args[args.length - 1];
    const lastBase = base + args.length - 1;
    if (this.isMultiValueExpr(last)) {
      this.compileExprOpenInto(last, state, lastBase);
      return 0;
    }
    this.compileExprTo(last, state, lastBase);
    return args.length + 1;
  }
  compileExpr(expr, state, discard = false) {
    switch (expr.type) {
      case "NilLiteral": {
        const r = state.regs.allocTemp();
        this.emit(state, 3 /* LOADNIL */, r, r, 0);
        return r;
      }
      case "BooleanLiteral": {
        const r = state.regs.allocTemp();
        this.emit(state, 2 /* LOADBOOL */, r, expr.value ? 1 : 0, 0);
        return r;
      }
      case "NumberLiteral":
        return this.loadConst(state, expr.value);
      case "StringLiteral":
        return this.loadConst(state, expr.value);
      case "Identifier": {
        const bindingId = this.bindingIdOf(expr);
        if (bindingId === void 0) throw new Error("vmify: unresolved identifier");
        const r = state.regs.allocTemp();
        this.emitLoadBinding(state, bindingId, r);
        return r;
      }
      case "ParenthesizedExpression":
        return this.compileExpr(expr.expression, state);
      case "TypeAssertionExpression":
        return this.compileExpr(expr.expression, state);
      case "BinaryExpression": {
        if (expr.operator === "and" || expr.operator === "or") {
          return this.compileLogical(expr.operator, expr.left, expr.right, state);
        }
        let leftExpr = expr.left;
        let rightExpr = expr.right;
        let op;
        let swap = false;
        let negate = false;
        switch (expr.operator) {
          case "+":
            op = 12 /* ADD */;
            break;
          case "-":
            op = 13 /* SUB */;
            break;
          case "*":
            op = 14 /* MUL */;
            break;
          case "/":
            op = 15 /* DIV */;
            break;
          case "//":
            op = 34 /* IDIV */;
            break;
          case "%":
            op = 16 /* MOD */;
            break;
          case "^":
            op = 17 /* POW */;
            break;
          case "..":
            op = 18 /* CONCAT */;
            break;
          case "==":
            op = 23 /* EQ */;
            break;
          case "~=":
            op = 23 /* EQ */;
            negate = true;
            break;
          case "<":
            op = 24 /* LT */;
            break;
          case "<=":
            op = 25 /* LE */;
            break;
          case ">":
            op = 24 /* LT */;
            swap = true;
            break;
          case ">=":
            op = 25 /* LE */;
            swap = true;
            break;
          default:
            throw new Error(`vmify: unsupported binary operator ${expr.operator}`);
        }
        if (swap) {
          const t = leftExpr;
          leftExpr = rightExpr;
          rightExpr = t;
        }
        const l = this.compileExpr(leftExpr, state);
        const r = this.compileExpr(rightExpr, state);
        const dest = state.regs.allocTemp();
        this.emit(state, op, dest, l, r);
        if (negate) this.emit(state, 20 /* NOT */, dest, dest, 0);
        state.regs.freeTemp(dest + 1);
        return dest;
      }
      case "UnaryExpression": {
        const argReg = this.compileExpr(expr.argument, state);
        const dest = state.regs.allocTemp();
        const op = expr.operator === "-" ? 19 /* UNM */ : expr.operator === "not" ? 20 /* NOT */ : 21 /* LEN */;
        this.emit(state, op, dest, argReg, 0);
        state.regs.freeTemp(dest + 1);
        return dest;
      }
      case "TableExpression": {
        const dest = state.regs.allocTemp();
        this.emit(state, 10 /* NEWTABLE */, dest, 0, 0);
        let posIndex = 1;
        for (let fi = 0; fi < expr.fields.length; fi++) {
          const field = expr.fields[fi];
          const isLast = fi === expr.fields.length - 1;
          if (field.type === "TableFieldPositional") {
            if (isLast && this.isMultiValueExpr(field.value)) {
              const valuesBase = state.regs.allocTemp();
              this.compileExprOpenInto(field.value, state, valuesBase);
              this.emit(state, 33 /* SETLIST */, dest, valuesBase, posIndex);
              state.regs.freeTemp(valuesBase);
            } else {
              const v = this.compileExpr(field.value, state);
              const k = this.konst(state, posIndex++);
              this.emit(state, 9 /* SETTABLE */, dest, RK(k, true), v);
              state.regs.freeTemp(v);
            }
          } else if (field.type === "TableFieldNamed") {
            const v = this.compileExpr(field.value, state);
            const k = this.konst(state, field.name.name);
            this.emit(state, 9 /* SETTABLE */, dest, RK(k, true), v);
            state.regs.freeTemp(v);
          } else {
            const k = this.compileExpr(field.key, state);
            const v = this.compileExpr(field.value, state);
            this.emit(state, 9 /* SETTABLE */, dest, k, v);
            state.regs.freeTemp(k);
          }
        }
        return dest;
      }
      case "MemberExpression": {
        const objReg = this.compileExpr(expr.object, state);
        const k = this.konst(state, expr.property.name);
        const dest = state.regs.allocTemp();
        this.emit(state, 8 /* GETTABLE */, dest, objReg, RK(k, true));
        state.regs.freeTemp(dest + 1);
        return dest;
      }
      case "IndexExpression": {
        const objReg = this.compileExpr(expr.object, state);
        const keyReg = this.compileExpr(expr.index, state);
        const dest = state.regs.allocTemp();
        this.emit(state, 8 /* GETTABLE */, dest, objReg, keyReg);
        state.regs.freeTemp(dest + 1);
        return dest;
      }
      case "CallExpression": {
        const base = this.compileExpr(expr.callee, state);
        const b = this.compileCallArgsAndGetB(expr.arguments, state, base + 1);
        this.emit(state, 27 /* CALL */, base, b, discard ? 1 : 2);
        state.regs.freeTemp(base + (discard ? 0 : 1));
        return base;
      }
      case "MethodCallExpression": {
        const objReg = this.compileExpr(expr.object, state);
        const k = this.konst(state, expr.method.name);
        const fnSlot = state.regs.allocTemp();
        this.emit(state, 11 /* SELF */, fnSlot, objReg, RK(k, true));
        state.regs.allocTemp();
        const argB = this.compileCallArgsAndGetB(expr.arguments, state, fnSlot + 2);
        const b = argB === 0 ? 0 : expr.arguments.length + 2;
        this.emit(state, 27 /* CALL */, fnSlot, b, discard ? 1 : 2);
        state.regs.freeTemp(fnSlot + (discard ? 0 : 1));
        return fnSlot;
      }
      case "FunctionExpression": {
        const protoIdx = this.compileFunctionBody(expr.func, state);
        const dest = state.regs.allocTemp();
        this.emitClosure(state, dest, protoIdx);
        return dest;
      }
      case "InterpolatedStringExpression": {
        let acc = null;
        for (const part of expr.parts) {
          const partReg = part.kind === "string" ? this.loadConst(state, part.value) : this.compileExpr(part.expression, state);
          if (acc === null) {
            acc = partReg;
          } else {
            const dest = state.regs.allocTemp();
            this.emit(state, 18 /* CONCAT */, dest, acc, partReg);
            state.regs.freeTemp(dest + 1);
            acc = dest;
          }
        }
        return acc ?? this.loadConst(state, "");
      }
      case "VarargExpression": {
        const r = state.regs.allocTemp();
        this.emit(state, 32 /* VARARG */, r, 2, 0, "vararg (1 value)");
        return r;
      }
      case "IfElseExpression": {
        const dest = state.regs.allocTemp();
        const endPatches = [];
        for (const clause of expr.clauses) {
          const condReg = this.compileExpr(clause.condition, state);
          this.emit(state, 26 /* TEST */, condReg, 0, 1);
          const skip = this.emit(state, 22 /* JMP */, 0, 0, 0);
          state.regs.freeTemp(condReg);
          const bodyReg = this.compileExpr(clause.body, state);
          if (bodyReg !== dest) this.emit(state, 0 /* MOVE */, dest, bodyReg, 0);
          state.regs.freeTemp(dest + 1);
          const toEnd = this.emit(state, 22 /* JMP */, 0, 0, 0);
          endPatches.push(toEnd);
          this.patchJump(state, skip, state.proto.code.length);
        }
        const altReg = this.compileExpr(expr.alternate, state);
        if (altReg !== dest) this.emit(state, 0 /* MOVE */, dest, altReg, 0);
        state.regs.freeTemp(dest + 1);
        for (const p of endPatches) this.patchJump(state, p, state.proto.code.length);
        return dest;
      }
      default: {
        const _exhaustive = expr;
        throw new Error(`vmify: unhandled expression ${_exhaustive.type}`);
      }
    }
  }
  compileLogical(operator, left, right, state) {
    const dest = this.compileExpr(left, state);
    this.emit(state, 26 /* TEST */, dest, 0, operator === "and" ? 1 : 0, `${operator} short-circuit`);
    const skip = this.emit(state, 22 /* JMP */, 0, 0, 0);
    state.regs.freeTemp(dest);
    const rightReg = this.compileExpr(right, state);
    if (rightReg !== dest) this.emit(state, 0 /* MOVE */, dest, rightReg, 0);
    this.patchJump(state, skip, state.proto.code.length);
    state.regs.freeTemp(dest + 1);
    return dest;
  }
  emitClosure(state, dest, protoIdx) {
    this.emit(state, 31 /* CLOSURE */, dest, protoIdx, 0);
    const proto = state.proto.protos[protoIdx];
    for (const desc of proto.upvalDescs) {
      if (desc.kind === "local") this.emit(state, 0 /* MOVE */, 0, desc.index, 0, "capture local");
      else this.emit(state, 4 /* GETUPVAL */, 0, desc.index, 0, "capture upval");
    }
  }
  compileFunctionBody(fb, parent) {
    const marker = ownerFunctionOf(this.enclosing, fb);
    const child = this.newFuncState(parent, marker);
    child.proto.numParams = fb.params.length;
    child.proto.hasVarargs = fb.hasVarargs;
    const naturalRegs = fb.params.map(() => child.regs.declareLocal());
    for (let i = 0; i < fb.params.length; i++) {
      const bindingId = this.bindingIdOfDecl(fb.params[i]);
      if (this.captured.has(bindingId)) {
        const boxReg = child.regs.declareLocal();
        this.emitNewBox(child, boxReg);
        const k = this.konst(child, BOX_FIELD);
        this.emit(child, 9 /* SETTABLE */, boxReg, RK(k, true), naturalRegs[i]);
        child.localSlots.set(bindingId, { reg: boxReg, boxed: true });
      } else {
        child.localSlots.set(bindingId, { reg: naturalRegs[i], boxed: false });
      }
    }
    this.compileBlock(fb.body, child);
    this.emit(child, 28 /* RETURN */, 0, 1, 0);
    child.proto.maxRegs = child.regs.maxUsed;
    parent.proto.protos.push(child.proto);
    return parent.proto.protos.length - 1;
  }
};

// src/passes/vmify/serialize.ts
function serializeConsts(consts) {
  const fields = consts.map((v) => positionalField(serializeConstValue(v)));
  return table(fields);
}
function serializeConstValue(v) {
  if (v === null) return nilLiteral();
  if (typeof v === "string") return stringLiteral(v);
  if (typeof v === "number") return numberLiteral(v);
  return booleanLiteral(v);
}
function serializeInstrs(proto, names) {
  const fields = proto.code.map((instr) => positionalField(
    table([
      namedField(names.op, numberLiteral(instr.op)),
      namedField(names.a, numberLiteral(instr.a)),
      namedField(names.b, numberLiteral(instr.b)),
      namedField(names.c, numberLiteral(instr.c))
    ])
  ));
  return table(fields);
}
function serializeUpvalDescs(proto, names) {
  const fields = proto.upvalDescs.map((d) => positionalField(
    table([
      namedField(names.kind, stringLiteral(d.kind)),
      namedField(names.index, numberLiteral(d.index))
    ])
  ));
  return table(fields);
}
function serializeProto(proto, names) {
  const fields = [
    namedField(names.numParams, numberLiteral(proto.numParams)),
    namedField(names.hasVarargs, booleanLiteral(proto.hasVarargs)),
    namedField(names.maxRegs, numberLiteral(proto.maxRegs)),
    namedField(names.code, serializeInstrs(proto, names)),
    namedField(names.consts, serializeConsts(proto.consts)),
    namedField(names.upvalDescs, serializeUpvalDescs(proto, names)),
    namedField(names.protos, table(proto.protos.map((p) => positionalField(serializeProto(p, names)))))
  ];
  return table(fields);
}

// src/passes/vmify/runtime.ts
function buildVmRuntimeSource(names, opcodeMap) {
  const N = names;
  const op = (o) => opcodeMap[o];
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
${N.handlers}[${op(0 /* MOVE */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.frame}.${N.R}[instr.${N.b}]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- LOADK
${N.handlers}[${op(1 /* LOADK */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.frame}.${N.K}[instr.${N.b} + 1]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- LOADBOOL
${N.handlers}[${op(2 /* LOADBOOL */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = (instr.${N.b} ~= 0)
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- LOADNIL
${N.handlers}[${op(3 /* LOADNIL */)}] = function(${N.frame}, pc, instr)
    for i = instr.${N.a}, instr.${N.b} do ${N.frame}.${N.R}[i] = nil end
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- GETUPVAL
${N.handlers}[${op(4 /* GETUPVAL */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.frame}.${N.upvals}[instr.${N.b} + 1]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- SETUPVAL
${N.handlers}[${op(5 /* SETUPVAL */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.upvals}[instr.${N.b} + 1] = ${N.frame}.${N.R}[instr.${N.a}]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- GETGLOBAL (b\uB294 RK\uAC00 \uC544\uB2C8\uB77C \uC0C1\uC218\uD480 \uC21C\uC218 \uC778\uB371\uC2A4)
${N.handlers}[${op(6 /* GETGLOBAL */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.globals}[${N.frame}.${N.K}[instr.${N.b} + 1]]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- SETGLOBAL
${N.handlers}[${op(7 /* SETGLOBAL */)}] = function(${N.frame}, pc, instr)
    ${N.globals}[${N.frame}.${N.K}[instr.${N.b} + 1]] = ${N.frame}.${N.R}[instr.${N.a}]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- GETTABLE
${N.handlers}[${op(8 /* GETTABLE */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.frame}.${N.R}[instr.${N.b}][${N.rk}(${N.frame}, instr.${N.c})]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- SETTABLE
${N.handlers}[${op(9 /* SETTABLE */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}][${N.rk}(${N.frame}, instr.${N.b})] = ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- NEWTABLE
${N.handlers}[${op(10 /* NEWTABLE */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = {}
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- SELF  (R[a] = R[b][key]; R[a+1] = R[b])
${N.handlers}[${op(11 /* SELF */)}] = function(${N.frame}, pc, instr)
    local obj = ${N.frame}.${N.R}[instr.${N.b}]
    ${N.frame}.${N.R}[instr.${N.a}] = obj[${N.rk}(${N.frame}, instr.${N.c})]
    ${N.frame}.${N.R}[instr.${N.a} + 1] = obj
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- ADD SUB MUL DIV MOD POW
${N.handlers}[${op(12 /* ADD */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) + ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(13 /* SUB */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) - ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(14 /* MUL */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) * ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(15 /* DIV */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) / ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(16 /* MOD */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) % ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(17 /* POW */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) ^ ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- IDIV (Luau \uBC14\uB2E5 \uB098\uB217\uC148)
${N.handlers}[${op(34 /* IDIV */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) // ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- CONCAT
${N.handlers}[${op(18 /* CONCAT */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) .. ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- UNM
${N.handlers}[${op(19 /* UNM */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = -${N.frame}.${N.R}[instr.${N.b}]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- NOT
${N.handlers}[${op(20 /* NOT */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = not ${N.frame}.${N.R}[instr.${N.b}]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- LEN
${N.handlers}[${op(21 /* LEN */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = #${N.frame}.${N.R}[instr.${N.b}]
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- JMP (pc += a)
${N.handlers}[${op(22 /* JMP */)}] = function(${N.frame}, pc, instr)
    return ${N.dispatch}(${N.frame}, pc + instr.${N.a})
end

-- EQ LT LE (\uAC12 \uC0DD\uC131\uD615 \uBE44\uAD50)
${N.handlers}[${op(23 /* EQ */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) == ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(24 /* LT */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) < ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end
${N.handlers}[${op(25 /* LE */)}] = function(${N.frame}, pc, instr)
    ${N.frame}.${N.R}[instr.${N.a}] = ${N.rk}(${N.frame}, instr.${N.b}) <= ${N.rk}(${N.frame}, instr.${N.c})
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- TEST (if (not R[a]) != (c!=0) then pc += 2 else pc += 1 \u2014 \uBCF4\uD1B5 \uB2E4\uC74C \uBA85\uB839\uC740 JMP)
${N.handlers}[${op(26 /* TEST */)}] = function(${N.frame}, pc, instr)
    if (not ${N.frame}.${N.R}[instr.${N.a}]) ~= (instr.${N.c} ~= 0) then
        return ${N.dispatch}(${N.frame}, pc + 2)
    end
    return ${N.dispatch}(${N.frame}, pc + 1)
end

-- CALL
${N.handlers}[${op(27 /* CALL */)}] = function(${N.frame}, pc, instr)
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
${N.handlers}[${op(28 /* RETURN */)}] = function(${N.frame}, pc, instr)
    local a, b = instr.${N.a}, instr.${N.b}
    if b == 0 then
        return table.unpack(${N.frame}.${N.R}, a, (${N.frame}.${N.multiTop} or (a + 1)) - 1)
    end
    return table.unpack(${N.frame}.${N.R}, a, a + b - 2)
end

-- FORPREP
${N.handlers}[${op(29 /* FORPREP */)}] = function(${N.frame}, pc, instr)
    local a = instr.${N.a}
    ${N.frame}.${N.R}[a] = ${N.frame}.${N.R}[a] - ${N.frame}.${N.R}[a + 2]
    return ${N.dispatch}(${N.frame}, pc + instr.${N.b})
end

-- FORLOOP
${N.handlers}[${op(30 /* FORLOOP */)}] = function(${N.frame}, pc, instr)
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
${N.handlers}[${op(31 /* CLOSURE */)}] = function(${N.frame}, pc, instr)
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
${N.handlers}[${op(32 /* VARARG */)}] = function(${N.frame}, pc, instr)
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
${N.handlers}[${op(33 /* SETLIST */)}] = function(${N.frame}, pc, instr)
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
`;
}

// src/passes/vmify/names.ts
var ID_CHARS_HEAD = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_";
var ID_CHARS_TAIL = ID_CHARS_HEAD + "0123456789";
function makeIdGenerator(random) {
  const used = /* @__PURE__ */ new Set();
  return () => {
    let id;
    do {
      const len = 5 + Math.floor(random() * 5);
      let s = ID_CHARS_HEAD[Math.floor(random() * ID_CHARS_HEAD.length)];
      for (let i = 1; i < len; i++) s += ID_CHARS_TAIL[Math.floor(random() * ID_CHARS_TAIL.length)];
      id = s;
    } while (used.has(id));
    used.add(id);
    return id;
  };
}
function generateVmNames(random = Math.random) {
  const id = makeIdGenerator(random);
  return {
    globals: id(),
    protoRoot: id(),
    execute: id(),
    handlers: id(),
    dispatch: id(),
    rk: id(),
    frame: id(),
    R: id(),
    K: id(),
    code: id(),
    protos: id(),
    upvals: id(),
    varargs: id(),
    nVarargs: id(),
    multiTop: id(),
    op: id(),
    a: id(),
    b: id(),
    c: id(),
    numParams: id(),
    hasVarargs: id(),
    maxRegs: id(),
    consts: id(),
    upvalDescs: id(),
    kind: id(),
    index: id()
  };
}

// src/passes/Vmify.ts
function runVmify(program, options) {
  const globalNames = options.builtinGlobals ?? DEFAULT_BUILTIN_GLOBALS;
  const random = options.random ?? Math.random;
  const opcodeMap = createOpcodeMap(random);
  const names = generateVmNames(random);
  const compiler = new VmCompiler(program, globalNames, opcodeMap);
  const topProto = compiler.compile();
  const globalsTable = table(
    globalNames.map((name) => namedField(name, identifier(name)))
  );
  const runtimeSource = buildVmRuntimeSource(names, opcodeMap);
  const runtimeProgram = luauparser2.parse(runtimeSource);
  const runtimeStatements = runtimeProgram.body.statements;
  const protoLiteral = serializeProto(topProto, names);
  const newBody = [
    localStatement(names.globals, globalsTable),
    ...runtimeStatements,
    localStatement(names.protoRoot, protoLiteral),
    returnStatement([call(identifier(names.execute), [identifier(names.protoRoot), table([]), vararg()])])
  ];
  program.body.statements = newBody;
}

// src/pipeline.ts
var PASS_ORDER = [
  "Vmify",
  "GlobalMapping",
  "StringsToExpressions",
  "NumbersToExpressions",
  "RenameVariables",
  "ConstantArray",
  "EncryptStrings",
  "EncryptNumbers",
  "InsertJunk",
  "WrapInFunction",
  "Minify"
];
var PASS_MAP = {
  GlobalMapping: runGlobalMapping,
  StringsToExpressions: runStringsToExpressions,
  NumbersToExpressions: runNumbersToExpressions,
  RenameVariables: runRenameVariables,
  ConstantArray: runConstantArray,
  EncryptStrings: runEncryptStrings,
  EncryptNumbers: runEncryptNumbers,
  InsertJunk: runInsertJunk,
  WrapInFunction: runWrapInFunction,
  Vmify: runVmify
};
function runPipeline(program, config) {
  runStripTypes(program);
  for (const key of PASS_ORDER) {
    const feature = config[key];
    if (!feature.active) continue;
    const pass = PASS_MAP[key];
    if (!pass) continue;
    const { active, ...options } = feature;
    pass(program, options);
  }
}

// src/passes/Minify.ts
function minifyPrinted(code) {
  return code.replace(/\r\n|\r|\n/g, " ").replace(/[ \t]+/g, " ").trim();
}

// src/index.ts
function obfuscateByAst(program, PConfig) {
  const config = mergeConfig(ObfuscateDefault, PConfig ?? {});
  runPipeline(program, config);
  const printed = luauparser3.print(program);
  return config.Minify.active ? minifyPrinted(printed) : printed;
}
function obfuscate(source, PConfig) {
  const program = luauparser3.parse(source);
  return obfuscateByAst(program, PConfig);
}
export {
  ObfuscateDefault,
  PASS_MAP,
  PASS_ORDER,
  obfuscate,
  obfuscateByAst
};
