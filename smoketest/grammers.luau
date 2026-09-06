--!nolint

----------------------------------------------------------------
-- 1. Primitive values / literals
----------------------------------------------------------------

local nilValue = nil
local booleanValue = true
local falseValue = false

local integer = 123
local negative = -456
local decimal = 123.456
local exponent = 1.5e3

local hex = 0xFF
local binary = 0b10101010

local separatedInteger = 1_000_000
local separatedHex = 0xFF_FF
local separatedBinary = 0b1010_1010

local stringValue = "hello"
local singleQuoted = 'world'

local longString = [[
	This is a long string.
	It can contain "quotes" and 'quotes'.
]]

local escaped = "line\nnext\tcolumn\\slash\"quote"

----------------------------------------------------------------
-- 2. String interpolation
----------------------------------------------------------------

local name = "Luau"
local version = 1

local interpolated = `Hello, {name}!`
local interpolatedExpression = `Version: {version + 1}`
local nestedInterpolation = `Result: {if version > 0 then "valid" else "invalid"}`

----------------------------------------------------------------
-- 3. Basic operators
----------------------------------------------------------------

local add = 10 + 20
local subtract = 20 - 10
local multiply = 5 * 4
local divide = 20 / 4
local floorDivide = 21 // 4
local modulo = 21 % 4
local power = 2 ^ 8
local concat = "hello" .. " " .. "world"

local equal = 1 == 1
local notEqual = 1 ~= 2
local less = 1 < 2
local lessEqual = 1 <= 2
local greater = 2 > 1
local greaterEqual = 2 >= 1

local logicalAnd = true and false
local logicalOr = false or true
local logicalNot = not false

local length = #"hello"

----------------------------------------------------------------
-- 4. Compound assignments
----------------------------------------------------------------

local compound = "value"

compound += 1
compound -= 2
compound *= 3
compound /= 2
compound //= 2
compound %= 3
compound ^= 2
compound ..= "!"

----------------------------------------------------------------
-- 5. Local declarations
----------------------------------------------------------------

local a
local b, c
local d = 1
local e, f = 2, 3
local g, h, i = 4, 5, 6

----------------------------------------------------------------
-- 6. Tables
----------------------------------------------------------------
local emptyTable = {}

local array = {
	10,
	20,
	30,
	40,
}

local recordTable = {
	name = "Luau",
	version = 1,
}

local explicitStringKey = {
	["key"] = "value",
}

local computedStringKey = {
	["complex" .. "Key"] = 123,
}

local explicitNumberKey = {
	[1] = "value",
}

local nestedTable = {
	{
		id = 1,
		name = "one",
	},
	{
		id = 2,
		name = "two",
	},
}
----------------------------------------------------------------
-- 7. Table access / assignment
----------------------------------------------------------------

----------------------------------------------------------------
-- 8. Functions
----------------------------------------------------------------

local function noArguments()
	return 42
end

local function oneArgument(value)
	return value
end

local function multipleArguments(a, b, c)
	return a + b + c
end

local function multipleReturns()
	return "hello", 123, true
end

local function ignoredReturn()
	local x, y, z = multipleReturns()

	return x, y, z
end

----------------------------------------------------------------
-- 9. Anonymous functions
----------------------------------------------------------------

local anonymous = function(value)
	return value * 2
end

local function makeMultiplier(multiplier)
	return function(value)
		return value * multiplier
	end
end

local double = makeMultiplier(2)
local quadruple = makeMultiplier(4)

----------------------------------------------------------------
-- 10. Method syntax
----------------------------------------------------------------

local object = {
	value = 10,
}

function object:getValue()
	return self.value
end

function object:setValue(value)
	self.value = value
end

function object:add(value)
	self.value += value
	return self
end

object:setValue(20)
object:add(5)

----------------------------------------------------------------
-- 11. Colon function declaration
----------------------------------------------------------------

local calculator = {}

function calculator:add(a, b)
	return a + b
end

function calculator:subtract(a, b)
	return a - b
end

----------------------------------------------------------------
-- 12. Nested function names
----------------------------------------------------------------

local module = {
	utils = {
		math = {},
	},
}

function module.utils.identity(value)
	return value
end

function module.utils.math.add(a, b)
	return a + b
end

----------------------------------------------------------------
-- 13. If statements
----------------------------------------------------------------

local condition = true

if condition then
	print("true")
end

if condition then
	print("true")
else
	print("false")
end

if a == 1 then
	print("one")
elseif a == 2 then
	print("two")
elseif a == 3 then
	print("three")
else
	print("other")
end

----------------------------------------------------------------
-- 14. If expressions
----------------------------------------------------------------

local result = if condition then "yes" else "no"

local numberResult = if a > 10 then 100 elseif a > 5 then 50 else 0

local nestedIfExpression = if condition
	then if a > 0 then "positive" else "zero"
	else "disabled"

----------------------------------------------------------------
-- 15. Do blocks
----------------------------------------------------------------

do
	local scoped = "inside"
	print(scoped)
end

do
	local x = 10

	do
		local y = 20
		print(x + y)
	end
end

----------------------------------------------------------------
-- 16. While loop
----------------------------------------------------------------

local counter = 0

while counter < 5 do
	counter += 1
end

----------------------------------------------------------------
-- 17. Repeat loop
----------------------------------------------------------------

local repeatCounter = 0

repeat
	repeatCounter += 1
until repeatCounter >= 5

----------------------------------------------------------------
-- 18. Numeric for
----------------------------------------------------------------

for index = 1, 10 do
	print(index)
end

for index = 10, 1, -1 do
	print(index)
end

for index = 1, 100, 2 do
	print(index)
end

----------------------------------------------------------------
-- 19. Generic for / ipairs
----------------------------------------------------------------

for index, value in ipairs(array) do
	print(index, value)
end

----------------------------------------------------------------
-- 20. Generic for / pairs
----------------------------------------------------------------

----------------------------------------------------------------
-- 21. Generic iteration with multiple variables
----------------------------------------------------------------

local entries = {
	{ name = "A", value = 1 },
	{ name = "B", value = 2 },
	{ name = "C", value = 3 },
}

for index, entry in ipairs(entries) do
	print(index, entry.name, entry.value)
end

----------------------------------------------------------------
-- 22. Break / continue
----------------------------------------------------------------

for i = 1, 100 do
	if i == 10 then
		break
	end
end

for i = 1, 20 do
	if i % 2 == 0 then
		continue
	end

	print(i)
end

----------------------------------------------------------------
-- 23. Nested loops
----------------------------------------------------------------

for i = 1, 5 do
	for j = 1, 5 do
		if i == j then
			print("diagonal", i, j)
		end
	end
end

----------------------------------------------------------------
-- 24. Multiple assignment
----------------------------------------------------------------

local x1, x2 = 10, 20
x1, x2 = x2, x1

local r1, r2, r3 = multipleReturns()

----------------------------------------------------------------
-- 25. Function calls
----------------------------------------------------------------

print("hello")
print("a", "b", "c")
print(object:getValue())

local callResult = anonymous(10)

----------------------------------------------------------------
-- 26. String call syntax
----------------------------------------------------------------

local stringCall = print "hello"

----------------------------------------------------------------
-- 27. Table call syntax
----------------------------------------------------------------

local tableCall = print {
	value = 123,
	message = "hello",
}

----------------------------------------------------------------
-- 28. Parenthesized expressions
----------------------------------------------------------------

local grouped = (1 + 2) * (3 + 4)

local functionResult = (anonymous)(100)

----------------------------------------------------------------
-- 29. Type aliases - Luau
----------------------------------------------------------------

type UserId = number
type UserName = string
type Enabled = boolean

type StringArray = {string}
type NumberArray = {number}

type StringMap = {
	[string]: string,
}

type NumberMap = {
	[string]: number,
}

----------------------------------------------------------------
-- 30. Named table types
----------------------------------------------------------------

type User = {
	id: number,
	name: string,
	active: boolean,
}

type Point = {
	x: number,
	y: number,
}

type OptionalUser = {
	id: number,
	name: string?,
}

----------------------------------------------------------------
-- 31. Optional properties
----------------------------------------------------------------

type Config = {
	name: string,
	debug: boolean?,
	retries: number?,
}

----------------------------------------------------------------
-- 32. Union types
----------------------------------------------------------------

type StringOrNumber = string | number

type Result =
	{
		ok: true,
		value: string,
	}
	|
	{
		ok: false,
		error: string,
	}

----------------------------------------------------------------
-- 33. Intersection types
----------------------------------------------------------------

type Named = {
	name: string,
}

type Identified = {
	id: number,
}

type NamedIdentified = Named & Identified

----------------------------------------------------------------
-- 34. Function types
----------------------------------------------------------------

type Callback = (number) -> string
type BinaryOperation = (number, number) -> number
type NoArguments = () -> ()
type VariadicFunction = (...string) -> ()

----------------------------------------------------------------
-- 35. Function type with multiple returns
----------------------------------------------------------------

type ParseResult = (string) -> (boolean, string)

----------------------------------------------------------------
-- 36. Type annotations on variables
----------------------------------------------------------------

local typedNumber: number = 123
local typedString: string = "hello"
local typedBoolean: boolean = true

local typedArray: {number} = {1, 2, 3}

local typedPoint: Point = {
	x = 10,
	y = 20,
}

local typedCallback: Callback = function(value)
	return tostring(value)
end

----------------------------------------------------------------
-- 37. Typed function parameters / return values
----------------------------------------------------------------

local function typedIdentity(value: string): string
	return value
end

local function addNumbers(a: number, b: number): number
	return a + b
end

local function createPoint(x: number, y: number): Point
	return {
		x = x,
		y = y,
	}
end

----------------------------------------------------------------
-- 38. Optional parameters
----------------------------------------------------------------

local function greet(name: string?)
	if name then
		return `Hello, {name}`
	end

	return "Hello"
end

----------------------------------------------------------------
-- 39. Variadic parameters
----------------------------------------------------------------

local function collect(...: string): {string}
	local result: {string} = {}

	for _, value in ipairs({...}) do
		table.insert(result, value)
	end

	return result
end

----------------------------------------------------------------
-- 40. Generic type aliases
----------------------------------------------------------------

type Pair<T> = {
	first: T,
	second: T,
}

type Dictionary<K, V> = {
	[K]: V,
}

type Box<T> = {
	value: T,
}

----------------------------------------------------------------
-- 41. Generic functions
----------------------------------------------------------------

local function identity<T>(value: T): T
	return value
end

local function makePair<T>(first: T, second: T): Pair<T>
	return {
		first = first,
		second = second,
	}
end

local function first<T>(values: {T}): T?
	return values[1]
end

----------------------------------------------------------------
-- 42. Generic type packs
----------------------------------------------------------------

type CallbackPack<A...> = (A...) -> ()

----------------------------------------------------------------
-- 43. Generic function with type pack
----------------------------------------------------------------

local function passthrough<A...>(...: A...): A...
	return ...
end

----------------------------------------------------------------
-- 44. Type casts
----------------------------------------------------------------

local unknownValue: any = "hello"

local castedString = unknownValue :: string

local castedNumber = (unknownValue :: any) :: number

----------------------------------------------------------------
-- 45. typeof
----------------------------------------------------------------

local runtimeValue = 123

type RuntimeValueType = typeof(runtimeValue)
type UserType = typeof(createPoint)

----------------------------------------------------------------
-- 46. typeof expressions
----------------------------------------------------------------

local inferredPoint = createPoint(10, 20)
local inferredType = inferredPoint :: typeof(inferredPoint)

----------------------------------------------------------------
-- 47. Type aliases referencing other aliases
----------------------------------------------------------------

type UserList = {User}
type UserDictionary = {[number]: User}

local users: UserList = {
	{
		id = 1,
		name = "Alice",
		active = true,
	},
	{
		id = 2,
		name = "Bob",
		active = false,
	},
}

----------------------------------------------------------------
-- 48. Type annotations on multiple locals
----------------------------------------------------------------

local width: number, height: number = 100, 200

----------------------------------------------------------------
-- 49. Const declarations
----------------------------------------------------------------

const constantNumber: number = 123
const constantString: string = "constant"

const constantTable: {
	value: number,
} = {
	value = 10,
}

const constA, constB = 1, 2

----------------------------------------------------------------
-- 50. Const function
----------------------------------------------------------------

const function constantFunction(value: number): number
	return value * 2
end

----------------------------------------------------------------
-- 51. Exported type aliases
----------------------------------------------------------------

export type PublicPoint = {
	x: number,
	y: number,
}

export type PublicUser = {
	id: number,
	name: string,
}

----------------------------------------------------------------
-- 52. Exported generic type
----------------------------------------------------------------

export type PublicBox<T> = {
	value: T,
}

----------------------------------------------------------------
-- 53. Type function declarations
-- Kept as syntax coverage for current Luau grammar.
----------------------------------------------------------------

----------------------------------------------------------------
-- 54. Attributes
----------------------------------------------------------------

@deprecated
local function oldFunction()
	return 123
end

@native
local function nativeCandidate(value: number): number
	return value + 1
end

----------------------------------------------------------------
-- 55. Attribute on local function
----------------------------------------------------------------

@deprecated
local function deprecatedFunction(value: string): string
	return value
end

----------------------------------------------------------------
-- 56. Attribute on method/function declaration
----------------------------------------------------------------

local attributedObject = {}

@native
function attributedObject:calculate(value: number): number
	return value * 2
end

----------------------------------------------------------------
-- 57. Closures
----------------------------------------------------------------

local function makeCounter()
	local value = 0

	return function()
		value += 1
		return value
	end
end

local counterFunction = makeCounter()

counterFunction()
counterFunction()
counterFunction()

----------------------------------------------------------------
-- 58. Nested closures
----------------------------------------------------------------

local function outer(a: number)
	local function middle(b: number)
		local function inner(c: number): number
			return a + b + c
		end

		return inner
	end

	return middle
end

local closure = outer(1)(2)
local closureResult = closure(3)

----------------------------------------------------------------
-- 59. Recursive function
----------------------------------------------------------------

local function factorial(n: number): number
	if n <= 1 then
		return 1
	end

	return n * factorial(n - 1)
end

----------------------------------------------------------------
-- 60. Mutual recursion
----------------------------------------------------------------

local isEven: (number) -> boolean
local isOdd: (number) -> boolean

function isEven(value)
	if value == 0 then
		return true
	end

	return isOdd(value - 1)
end

function isOdd(value)
	if value == 0 then
		return false
	end

	return isEven(value - 1)
end

----------------------------------------------------------------
-- 61. Method chaining
----------------------------------------------------------------

local chainObject = {
	value = 0,
}

function chainObject:addValue(value: number)
	self.value += value
	return self
end

function chainObject:multiplyValue(value: number)
	self.value *= value
	return self
end

local chainResult = chainObject
	:addValue(10)
	:multiplyValue(2)
	:addValue(5)

----------------------------------------------------------------
-- 62. Complex indexing
----------------------------------------------------------------

local complex = {
	items = {
		{
			value = 10,
		},
		{
			value = 20,
		},
	},
}

local complexValue = complex.items[1].value

complex.items[2].value = 999

----------------------------------------------------------------
-- 63. Metatable syntax
----------------------------------------------------------------

----------------------------------------------------------------
-- 64. Metamethods
----------------------------------------------------------------

local MetaVector = {}
MetaVector.__index = MetaVector

function MetaVector.new(x: number, y: number)
	return setmetatable({
		x = x,
		y = y,
	}, MetaVector)
end

function MetaVector.__add(a, b)
	return MetaVector.new(
		a.x + b.x,
		a.y + b.y
	)
end

function MetaVector.__sub(a, b)
	return MetaVector.new(
		a.x - b.x,
		a.y - b.y
	)
end

function MetaVector.__tostring(value)
	return `({value.x}, {value.y})`
end

local vectorA = MetaVector.new(1, 2)
local vectorB = MetaVector.new(3, 4)

local vectorC = vectorA + vectorB
local vectorD = vectorC - vectorA

print(vectorD)

----------------------------------------------------------------
-- 65. Protected calls
----------------------------------------------------------------

local success, result = pcall(function()
	return 123
end)

local success2, result2 = xpcall(
	function()
		error("example")
	end,
	function(errorMessage)
		return tostring(errorMessage)
	end
)

----------------------------------------------------------------
-- 66. Assert
----------------------------------------------------------------

local value = 123

assert(value ~= nil)
assert(type(value) == "number", "value must be a number")

----------------------------------------------------------------
-- 67. Error / return
----------------------------------------------------------------

local function requirePositive(value: number): number
	if value <= 0 then
		error("value must be positive")
	end

	return value
end

----------------------------------------------------------------
-- 68. Short-circuit expressions
----------------------------------------------------------------

local maybeName: string? = nil

local displayName = maybeName or "Anonymous"
local hasName = maybeName ~= nil and true or false

----------------------------------------------------------------
-- 69. Function as table values
----------------------------------------------------------------

local operations: {[string]: (number, number) -> number} = {
	add = function(a, b)
		return a + b
	end,

	subtract = function(a, b)
		return a - b
	end,

	multiply = function(a, b)
		return a * b
	end,
}

local operationResult = operations.add(10, 20)

----------------------------------------------------------------
-- 70. Nested type structures
----------------------------------------------------------------

type Service = {
	name: string,
	enabled: boolean,

	config: {
		retries: number,
		timeout: number,
	},

	run: (self: Service) -> (),
}

----------------------------------------------------------------
-- 71. Recursive type
----------------------------------------------------------------

type TreeNode = {
	value: number,
	left: TreeNode?,
	right: TreeNode?,
}

local tree: TreeNode = {
	value = 10,
	left = {
		value = 5,
		left = nil,
		right = nil,
	},
	right = {
		value = 15,
		left = nil,
		right = nil,
	},
}

----------------------------------------------------------------
-- 72. Type aliases with unions
----------------------------------------------------------------

type State = "idle" | "running" | "finished" | "failed"

local state: State = "idle"

if state == "idle" then
	state = "running"
end

----------------------------------------------------------------
-- 73. Singleton types
----------------------------------------------------------------

type Success = {
	kind: "success",
	value: string,
}

type Failure = {
	kind: "failure",
	error: string,
}

type OperationResult = Success | Failure

----------------------------------------------------------------
-- 74. Discriminated union
----------------------------------------------------------------

local operation: OperationResult = {
	kind = "success",
	value = "done",
}

if operation.kind == "success" then
	print(operation.value)
else
	print(operation.error)
end

----------------------------------------------------------------
-- 75. Generic dictionary
----------------------------------------------------------------

local scores: Dictionary<string, number> = {
	Alice = 100,
	Bob = 80,
	Charlie = 95,
}

----------------------------------------------------------------
-- 76. Generic pair
----------------------------------------------------------------

local numberPair: Pair<number> = {
	first = 10,
	second = 20,
}

local stringPair: Pair<string> = {
	first = "hello",
	second = "world",
}

----------------------------------------------------------------
-- 77. Repeat complex expressions
----------------------------------------------------------------

local complexExpression =
	((10 + 20) * 3 - 5) / 2
	+ (4 ^ 2)
	- (100 // 3)
	% 7

----------------------------------------------------------------
-- 78. Anonymous nested table callbacks
----------------------------------------------------------------

local processors = {
	{
		name = "double",
		process = function(value: number): number
			return value * 2
		end,
	},

	{
		name = "square",
		process = function(value: number): number
			return value ^ 2
		end,
	},
}

for _, processor in ipairs(processors) do
	print(
		processor.name,
		processor.process(10)
	)
end

----------------------------------------------------------------
-- 79. Multiple return propagation
----------------------------------------------------------------

local function getCoordinates(): (number, number)
	return 100, 200
end

local function useCoordinates()
	local x, y = getCoordinates()

	return x + 10, y + 20
end

local finalX, finalY = useCoordinates()

----------------------------------------------------------------
-- 80. Final parser smoke test
----------------------------------------------------------------

local function smokeTest(value: string): string
	local prefix = if value == "" then "empty" else "value"

	local result = {
		prefix = prefix,
		value = value,
		length = #value,
	}

	return `{result.prefix}: {result.value} ({result.length})`
end

print(smokeTest("Luau"))
