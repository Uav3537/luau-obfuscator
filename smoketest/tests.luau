-- ObfuscationTest.lua
--
-- 사용법:
-- 1) 이 스크립트를 원본 그대로 한 번 Roblox Studio(ServerScriptService 등)에서 실행해서
--    콘솔에 "ALL TESTS PASSED" 가 뜨는지 확인 (원본이 정상 동작하는지 베이스라인 확인).
-- 2) 이 파일을 obfuscator에 통과시켜 나온 결과물을 같은 위치에 붙여넣고 다시 실행.
-- 3) 두 경우 모두 콘솔 출력이 "[OK] ..." 목록 + 마지막 "ALL TESTS PASSED"로 동일하면
--    난독화가 값을 깨뜨리지 않았다는 뜻.
--    중간에 assert가 실패하면 어떤 케이스가 깨졌는지 에러 메시지로 바로 알 수 있음.

local failCount = 0

local function check(name, actual, expected)
    if actual == expected then
        print(string.format("[OK] %s -> %s", name, tostring(actual)))
    else
        failCount += 1
        warn(string.format(
            "[FAIL] %s -> got %s (%s), expected %s (%s)",
            name, tostring(actual), typeof(actual), tostring(expected), typeof(expected)
        ))
    end
end

print("===== ObfuscationTest start =====")

-- 1) 문자열 리터럴: ASCII / 한글 / 이모지 / 빈 문자열 / 특수문자(따옴표, 개행, 이스케이프)
check("ascii string", "Hello, Roblox!", "Hello, Roblox!")
check("korean string", "안녕하세요, 로블록스", "안녕하세요, 로블록스")
check("emoji string", "😀🔥✨", "😀🔥✨")
check("empty string", "", "")
check("quote/escape string", "he said \"hi\"\nnext line\ttab", "he said \"hi\"\nnext line\ttab")

-- 2) 문자열 연결(concat) : 리터럴끼리, 변수와 리터럴 혼합
local name = "World"
check("concat literal+var", "Hello, " .. name .. "! Welcome to Roblox.", "Hello, World! Welcome to Roblox.")

local parts = "A" .. "B" .. "C" .. "D" .. "E" .. "F" .. "G" .. "H"
check("long concat chain", parts, "ABCDEFGH")

-- 3) 숫자 리터럴: 0, 양수, 음수, 큰 정수, 소수
check("zero", 0, 0)
check("positive int", 42, 42)
check("negative int", -17, -17)
check("large int", 1234567, 1234567)
check("negative large int", -987654, -987654)
check("float", 3.14, 3.14)
check("negative float", -2.5, -2.5)

-- 4) 산술식으로 위장됐을 법한 값들의 실제 계산 결과
local total = 5 + 10 * 2
check("arithmetic literal combo", total, 25)

local mixed = (100 - 37) * 2 + 1
check("mixed arithmetic", mixed, 127)

-- 5) 테이블 안의 숫자 리터럴들
local nums = { 1, 2, 3, 4, 5, -6, 7, 100 }
local sum = 0
for i = 1, #nums do
    sum += nums[i]
end
check("table of numbers sum", sum, 116)

-- 6) 테이블 안의 문자열 리터럴들 + 순회
local words = { "alpha", "beta", "gamma", "delta" }
local joined = table.concat(words, "-")
check("table of strings joined", joined, "alpha-beta-gamma-delta")

-- 7) 반복문 경계값(숫자 리터럴)이 정확히 유지되는지
local loopSum = 0
for i = 1, 10 do
    loopSum += i
end
check("for-loop 1..10 sum", loopSum, 55)

local countdown = 0
local n = 5
while n > 0 do
    countdown += 1
    n -= 1
end
check("while-loop countdown", countdown, 5)

-- 8) 함수 인자/리턴 값으로 쓰인 문자열, 숫자
local function greet(personName, times)
    local msg = ""
    for i = 1, times do
        msg = msg .. personName .. ";"
    end
    return msg
end
check("function with literal args", greet("Bob", 3), "Bob;Bob;Bob;")

-- 9) 재귀 함수 자체가 난독화 후에도 정상 동작하는지 (사용자 스크립트 자체의 재귀, 별개 검증용)
local function factorial(k)
    if k <= 1 then
        return 1
    end
    return k * factorial(k - 1)
end
check("recursive factorial(6)", factorial(6), 720)

-- 10) 문자열 인덱싱/길이 (UTF-8 바이트 변환이 안 깨졌는지 간접 확인)
check("string length ascii", #"Roblox", 6)
check("string.upper", string.upper("mixedCase"), "MIXEDCASE")
check("string.sub", string.sub("Hello, Roblox!", 1, 5), "Hello")

print("===== ObfuscationTest end =====")

if failCount == 0 then
    print("ALL TESTS PASSED")
else
    warn(string.format("%d TEST(S) FAILED", failCount))
end