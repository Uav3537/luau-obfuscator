do

        --!nocheck
        --!nolint
        print("---------------------------------------- Loading 9979b343a289753678c125ff70a06f68 ----------------------------------------")
        local GS, GD = pcall(function(...)
            local G681feb21476efd1ee8a21eb826ee8cc55ceb7ddb56530a304c498d148b8d6b
            G681feb21476efd1ee8a21eb826ee8cc55ceb7ddb56530a304c498d148b8d6b = {
                Global=table.pack(...),
                ScriptFunctions={
                    
                },
                ScriptNames={
                    
                },
                ScriptCache={},
                ScriptLoading={},
                ScriptGet=function(Self, name, caller)
                    local DisplayName = Self.ScriptNames[name] or name
                    local Cache = Self.ScriptCache[name]
                    if Cache then
                        print(([=[ [Cached] require("%s") <- %s]=]):format(DisplayName, caller or "?"))
                        return table.unpack(Cache, 1, Cache.n)
                    end
                    if Self.ScriptLoading[name] then
                        error(("Circular Dependency Detected: %s"):format(DisplayName))
                    end
                    print(([=[ [Loaded] require("%s") <- %s]=]):format(DisplayName, caller or "?"))
                    local Func = Self.ScriptFunctions[name]
                    if not Func then error(("Wrong Dependency: %s"):format(DisplayName)) end
                    Self.ScriptLoading[name] = true
                    local Result = table.pack(Func(Self))
                    Self.ScriptLoading[name] = nil
                    Self.ScriptCache[name] = Result
                    return table.unpack(Result, 1, Result.n)
                end
            }
            

            local FinalOk, FinalErr = pcall(function()
                
        local RootFunc, RootLoadErr = loadstring([====[
            local G681feb21476efd1ee8a21eb826ee8cc55ceb7ddb56530a304c498d148b8d6b = ...
            local Players = game:GetService("Players")

local RequestId = tonumber("10765521856")
if not RequestId then return end

local Debug = ("false" :: any) :: "true"|"false" == "true"

if Debug then print("BOOSTRAPPER | Loaded") end
if Players.LocalPlayer.UserId ~= RequestId then error("RequestId Doesn't Match The Local UserId") end

        ]====], "9979b343a289753678c125ff70a06f68")
        if not RootFunc then
            error(("[%s] Compile Error: %s"):format("9979b343a289753678c125ff70a06f68", tostring(RootLoadErr)))
        end
        local RootOk, RootErrOrResult = pcall(RootFunc, G681feb21476efd1ee8a21eb826ee8cc55ceb7ddb56530a304c498d148b8d6b)
        if not RootOk then
            G681feb21476efd1ee8a21eb826ee8cc55ceb7ddb56530a304c498d148b8d6b = nil
            error(RootErrOrResult)
        end
    
            end)

            G681feb21476efd1ee8a21eb826ee8cc55ceb7ddb56530a304c498d148b8d6b = nil

            if not FinalOk then
                error(FinalErr, 0)
            end
        end, ...)
        print("---------------------------------------- Loaded ----------------------------------------")
        if not GS then error(GD) end
    
end

do

        --!nocheck
        --!nolint
        print("---------------------------------------- Loading 08ced6cdfbf50a84183be1af4b4c8dc5 ----------------------------------------")
        local GS, GD = pcall(function(...)
            local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df
            G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = {
                Global=table.pack(...),
                ScriptFunctions={
                    ["2a7bb31d62e706c8eb498d59f4f9a667"]=(function(Self)
            local Func, LoadErr = loadstring([====[
                local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
                --!nocheck
--!nolint

local Module = {}

Module.Metadata = {
    PlaceIds={
        ABL=8573962925,
		ABA=12283052444
    },
	ServerUrl="http://localhost:3000/api/v1",
	Debug=("false" :: any) :: "true"|"false" == "true"
}

Module.UNC = {
	WriteFile = (writefile or writeFile) :: ((path: string, data: string) -> ())?,
	ReadFile = (readfile or readFile) :: ((path: string) -> string)?,
	AppendFile = (appendfile or appendFile) :: ((path: string, data: string) -> ())?,
	IsFile = (isfile or isFile) :: ((path: string) -> boolean)?,
	IsFolder = (isfolder or isFolder) :: ((path: string) -> boolean)?,
	MakeFolder = (makefolder or makeFolder) :: ((path: string) -> ())?,
	DelFile = (delfile or delFile) :: ((path: string) -> ())?,
	DelFolder = (delfolder or delFolder) :: ((path: string) -> ())?,
	ListFiles = (listfiles or listFiles) :: ((path: string) -> { string })?,
	LoadFile = (loadfile or loadFile) :: ((path: string) -> ((...any) -> any)?)?,
	GetCustomAsset = (getcustomasset or getCustomAsset) :: ((path: string) -> string)?,

	Replicate = (replicatesignal or replicateSignal) :: ((signal: RBXScriptSignal, ...any) -> ())?,
	FireSignal = (firesignal or fireSignal) :: ((signal: RBXScriptSignal, ...any) -> ())?,
	GetConnections = (getconnections or getConnections) :: ((signal: RBXScriptSignal) -> { RBXScriptConnection })?,

	FireClickDetector = (fireclickdetector or fireClickDetector) :: ((detector: ClickDetector, distance: number?) -> ())?,
	FireTouchInterest = (firetouchinterest or fireTouchInterest) :: ((part: BasePart, otherPart: BasePart, toggle: number) -> ())?,
	FireProximityPrompt = (fireproximityprompt or fireProximityPrompt) :: ((prompt: ProximityPrompt) -> ())?,

	Request = (request or http_request) :: ((...any) -> any)?,

	Mouse1Click = mouse1click :: () -> ()?,
	Mouse2Click = mouse2click :: () -> ()?
}

return Module
            ]====], "2a7bb31d62e706c8eb498d59f4f9a667")
            if not Func then
                error(("[%s] Compile Error: %s"):format("2a7bb31d62e706c8eb498d59f4f9a667", tostring(LoadErr)))
            end
            local Ok, ErrOrResult = pcall(Func, Self)
            if not Ok then
                error(ErrOrResult)
            end
            return ErrOrResult
        end),
["11e8106c399d65a976e76ad6e7a1d5bb"]=(function(Self)
            local Func, LoadErr = loadstring([====[
                local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
                --!strict
--!nolint
local Players = game:GetService("Players")
local MetaModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("2a7bb31d62e706c8eb498d59f4f9a667", "11e8106c399d65a976e76ad6e7a1d5bb")
local Module = {}

function Module.GetLocal()
    return Players.LocalPlayer, Players.LocalPlayer.Character
end

function Module.GetPlaceId()
    return game.PlaceId
end

function Module.GetJobId()
    return game.JobId
end

function Module.GetUniverseId()
    return game.GameId
end

function Module.CreateHolder()
    local fired = false
    local args
    local waitingThreads: { thread } = {}

    return {
        Fire = function(...)
            if fired then return end
            fired = true
            args = table.pack(...)
            for _, thread in ipairs(waitingThreads) do
                task.spawn(thread, table.unpack(args, 1, args.n))
            end
            waitingThreads = {}
        end,
        Wait = function()
            if fired then
                return table.unpack(args, 1, args.n)
            end
            table.insert(waitingThreads, coroutine.running())
            return coroutine.yield()
        end,
    }
end

function Module.PredictCFrame(TargetRoot: Part, Multiplier: number, MAX_PREDICT_DISTANCE: number)
    local LocalPlayer = Players.LocalPlayer

    local Ping = LocalPlayer:GetNetworkPing()

    local Velocity = TargetRoot.AssemblyLinearVelocity
    local Offset = Velocity * Ping * Multiplier
    if Offset.Magnitude > MAX_PREDICT_DISTANCE then
        Offset = Offset.Unit * MAX_PREDICT_DISTANCE
    end

    local PredictedPosition = TargetRoot.Position + Offset

    local PredictedCFrame
    if Offset.Magnitude > 0.01 then
        PredictedCFrame = CFrame.new(PredictedPosition, PredictedPosition + Offset.Unit)
    else
        PredictedCFrame = (TargetRoot.CFrame - TargetRoot.Position) + PredictedPosition
    end

    return PredictedCFrame
end

function Module.HookAnimation(TargetCharacters: {Model}, AnimationIds: {string}, Callback: (Player?, string) -> ())
    local EventManager
    EventManager = {
        Connections = {} :: {RBXScriptConnection},
        Disconnect = function()
            for _, Connection in ipairs(EventManager.Connections) do
                Connection:Disconnect()
            end
            table.clear(EventManager.Connections)
        end
    }
    local AnimationLookup = {}

    for _, Id in ipairs(AnimationIds) do
        AnimationLookup[Id] = true
    end
    for _, TargetCharacter in ipairs(TargetCharacters) do
        local Humanoid = TargetCharacter:WaitForChild("Humanoid", 0.5)
        if not Humanoid then continue end
        local Animator = Humanoid:WaitForChild("Animator", 0.5) :: Animator
        if not Animator then continue end
        table.insert(EventManager.Connections, Animator.AnimationPlayed:Connect(function(Track)
            local Animation = Track.Animation
            local AnimationId = Animation.AnimationId
            if not AnimationLookup[AnimationId] then return end
            Callback(Players:GetPlayerFromCharacter(TargetCharacter), AnimationId)
        end))
    end
    return EventManager
end

function Module.ResetForce()
    local LocalPlayer, LocalCharacter = Module.GetLocal()
    if not LocalCharacter then return end
    local Humanoid = LocalCharacter:FindFirstChild("Humanoid") :: Humanoid
    if MetaModule.UNC.Replicate then
        MetaModule.UNC.Replicate(LocalPlayer.Kill)
    elseif Humanoid then
        Humanoid.Health = 0
        Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
    else
        LocalCharacter:BreakJoints()
    end
end

function Module.GetPingAwait()
    local LocalPlayer = Players.LocalPlayer
    local Ping = LocalPlayer:GetNetworkPing()
    local PingAwait = math.max(Ping * 1000 / 500 * 2, 0.2)

    return PingAwait
end

export type HolderType = typeof(Module.CreateHolder())

return Module
            ]====], "11e8106c399d65a976e76ad6e7a1d5bb")
            if not Func then
                error(("[%s] Compile Error: %s"):format("11e8106c399d65a976e76ad6e7a1d5bb", tostring(LoadErr)))
            end
            local Ok, ErrOrResult = pcall(Func, Self)
            if not Ok then
                error(ErrOrResult)
            end
            return ErrOrResult
        end),
["532a982c55798c9f10f990c18c748348"]=(function(Self)
            local Func, LoadErr = loadstring([====[
                local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
                --!strict
--!nolint
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")

local MetaModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("2a7bb31d62e706c8eb498d59f4f9a667", "532a982c55798c9f10f990c18c748348")
local BaseModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("11e8106c399d65a976e76ad6e7a1d5bb", "532a982c55798c9f10f990c18c748348")
local GuiModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("5fc274f1b48de9284581ec642e9549af", "532a982c55798c9f10f990c18c748348")

local Module = {}
type ModuleType = typeof(Module)?

if BaseModule.GetPlaceId() ~= MetaModule.Metadata.PlaceIds.ABL then warn("ABLModule Ignored: PlaceId MisMatch"); return nil :: ModuleType end

local Remotes = {
    Char = ReplicatedStorage:FindFirstChild("Char") :: RemoteEvent,
    ResetDeath = ReplicatedStorage:FindFirstChild("ResetDeath") :: RemoteEvent,
    MeleeA = (ReplicatedStorage:FindFirstChild("Melee") and (ReplicatedStorage:FindFirstChild("Melee") :: Instance):FindFirstChild("A")) :: RemoteEvent,
    GenericEvent = (ReplicatedStorage:FindFirstChild("GenericEvents") and (ReplicatedStorage:FindFirstChild("GenericEvents") :: Instance):FindFirstChild("Ban")) :: RemoteEvent,
    GetSettings = ReplicatedStorage:FindFirstChild("GetSettings") :: RemoteFunction,
    SetSettings = ReplicatedStorage:FindFirstChild("SetSettings") :: RemoteEvent,
    CmdrFunction = (ReplicatedStorage:FindFirstChild("CmdrClient") and (ReplicatedStorage:FindFirstChild("CmdrClient") :: Instance):FindFirstChild("CmdrFunction")) :: RemoteFunction,
    Telek = (ReplicatedStorage:FindFirstChild("Sans") and (ReplicatedStorage:FindFirstChild("Sans") :: Instance):FindFirstChild("Telek")) :: RemoteEvent,
}

for RemoteName: string, Remote in pairs(Remotes) do
    if Remote == nil then warn(("ABLModule Ignored: Remote %s Missing"):format(RemoteName)); return nil end
end

local FolderMapper: { [string]: Instance? } = {
    Sans=ReplicatedStorage:FindFirstChild("Sans"),
    Asgore=ReplicatedStorage:FindFirstChild("Asgore"),
    GTFrisk=ReplicatedStorage:FindFirstChild("GTFrisk"),
    GTGaster=ReplicatedStorage:FindFirstChild("GTGaster"),
    XTFrisk=ReplicatedStorage:FindFirstChild("XFrisk"),
    XTCross=ReplicatedStorage:FindFirstChild("Cross"),
    SSChara=ReplicatedStorage:FindFirstChild("SSChara"),
    FunGang=ReplicatedStorage:FindFirstChild("FunGang")
}
for FolderName: string, Folder in pairs(FolderMapper) do
    if Folder == nil then warn(("ABLModule.Skill Ignored: Folder %s Missing"):format(FolderName)); return nil end
end

local Cooldowns = Workspace:FindFirstChild("Cooldowns")
if not (Cooldowns and Cooldowns:IsA("Folder")) then warn("Cooldowns Folder Not Found"); return nil end

export type ClassType = "Sans"|"Asgore"|"GTFrisk"|"GTGaster"|"XTFrisk"|"XTCross"|"SSChara"|"FunGang"|
    "Limitless"|"Sakuya"|"Marisa"|"Homelander"|"Broly"|"Minos"|"Silver"|
    "None"

Module.Classes = (function()
    local Classes: { {Name: ClassType, Thumbnail: string} } = {
        { Name="Sans", Thumbnail="rbxassetid://18756329922" },
        { Name="Asgore", Thumbnail="rbxassetid://18756330949" },
        { Name="GTFrisk", Thumbnail="rbxassetid://18756331342" },
        { Name="GTGaster", Thumbnail="rbxassetid://18756331799" },
        { Name="XTFrisk", Thumbnail="rbxassetid://18756329522" },
        { Name="XTCross", Thumbnail="rbxassetid://18756330454" },
        { Name="SSChara", Thumbnail="rbxassetid://18756328975" },
        { Name="FunGang", Thumbnail="rbxassetid://18756332430" }
    }
    return Classes
end)()

Module.PrivateClasses = (function()
    local Classes: { {Name: ClassType, Thumbnail: string} } = {
        { Name="Broly", Thumbnail="rbxassetid://15217574947" },
        { Name="Sakuya", Thumbnail="rbxassetid://13704272085" },
        { Name="Marisa", Thumbnail="rbxassetid://13103690695" },
        { Name="Homelander", Thumbnail="rbxassetid://13455493275" },
        { Name="Silver", Thumbnail="rbxassetid://35736829" },
        { Name="Minos", Thumbnail="rbxassetid://10822249944" },
        { Name="Limitless", Thumbnail="rbxassetid://15810153659" },
    }
    return Classes
end)()

function Module.GetClass(TargetPlayer: Player?): ClassType
    local Target = TargetPlayer or Players.LocalPlayer
    if not Target.Character then return "None" end
    local Char = Target:FindFirstChild("Char")
    if not (Char and Char:IsA("StringValue")) then return "None" end
    return Char.Value :: ClassType
end

function Module.ResetDeath()
    Remotes.ResetDeath:FireServer()
    local LocalPlayer, LocalCharacter = BaseModule.GetLocal()
    local LocalCooldown = Cooldowns:FindFirstChild(LocalPlayer.Name) :: Folder
    for _, Child in ipairs(LocalCooldown:GetChildren()) do Child:Destroy() end
end

function Module.ResetForce()
    local LocalPlayer, LocalCharacter = BaseModule.GetLocal()
    if not LocalCharacter then return end
    local LocalCooldown = Cooldowns:FindFirstChild(LocalPlayer.Name) :: Folder
    for _, Child in ipairs(LocalCooldown:GetChildren()) do Child:Destroy() end
    BaseModule.ResetForce()
end

function Module.PickClass(Class: ClassType): Model?
    if Class == "None" then return nil end
    local LocalPlayer = BaseModule.GetLocal()
    Module.ResetForce()
    
    task.spawn(function()
        local PlayerGui = GuiModule.GetPlayerGui()
        local SelectionMenu = PlayerGui:WaitForChild("SelectionMenu")
        SelectionMenu:Destroy()
        Remotes.Char:FireServer(Class, ((LocalPlayer:FindFirstChild("Skins") :: Folder):FindFirstChild(Class) :: StringValue).Value)
    end)
    
    local LocalCharacter = LocalPlayer.CharacterAdded:Wait()
    
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
    return LocalCharacter
end

function Module.Skill(Page: string, Code: string, ...)
    local Class: ClassType = Module.GetClass()
    if Class == "None" then return end
    if Class == "Sans" and Page == "Telekinesis" and Code == "One" then
        local TargetChar, Key, Delay = ...
        if typeof(Delay) ~= "number" then Delay = 1.5 end
        Remotes.Telek:FireServer(_G.Pass, "Telekinesis", "One", TargetChar)
        task.delay(Delay, function()
            Remotes.Telek:FireServer(_G.Pass, "Telekinesis", "One", TargetChar, Key)
        end)
        return
    end
    local Folder = FolderMapper[Class]
    if not Folder then return end
    local Projectile = Folder:FindFirstChild("Projectile") :: RemoteEvent?
    if not Projectile then return end
    Projectile:FireServer(_G.Pass, Page, Code, ...)
end

function Module.Cooldown(TargetPlayer: Player?, Page: string, Code: string)
    local Target = TargetPlayer or Players.LocalPlayer
    local LocalCooldown = Cooldowns:FindFirstChild(Target.Name) :: Folder
    local Object = LocalCooldown:FindFirstChild(Page .. "/" .. Code)
    return Object and true or false
end

function Module.Tags(TargetPlayer: Player?): { [Player]: number }?
    local Target = TargetPlayer or Players.LocalPlayer
    local Character = Target.Character
    if not Character then return nil end

    local Data = Character:WaitForChild("Data", 0.5) :: Folder?
    if not Data then return nil end

    local Tags = Data:WaitForChild("Tags", 0.5) :: Folder
    
    local T = {}
    for _, TC in ipairs(Tags:GetChildren()) do
        local TI = TC :: IntValue
        local Player = Players:FindFirstChild(TI.Name) :: Player
        T[Player] = TI.Value
    end
    return T
end

function Module.Melee(TargetCharacter: Model, MeleeCount: number)
    if not MeleeCount then MeleeCount = 1 end

    local _, LocalCharacter = BaseModule.GetLocal()
    if not LocalCharacter then return end
    
    Remotes.MeleeA:FireServer(
        (TargetCharacter:FindFirstChild("HumanoidRootPart") :: Part).CFrame,
        TargetCharacter,
        MeleeCount,
        MeleeCount >= 5,
        nil,
        false
    )
end

function Module.Block(Time: number)
    Remotes.GenericEvent:FireServer(
        "Blocking",
        true
    )
    task.wait(Time)
    Remotes.GenericEvent:FireServer(
        "Blocking",
        false
    )
end

export type StatType = 
    "Blocking"|"BlockingTick"|
    "Running"|
    "CanDash"|"CanLook"|"CanRun"|"CanTP"|
    "Cutscene"|"FakeCutscene"|
    "Health"|"HealthKR"|"HealthMax"|
    "Attack"|"Defense"|
    "Dodge"|"DodgeBar"|"DodgeBarMax"|
    "RunStamina"|"RunStaminaMax"|
    "Stamina"|"StaminaMax"|
    "Frozen"|"FrozenTick"|
    "Stunned"|"StunnedTick"|
    "HitTick"|
    "LastMove"|
    "TimeMulti"|
    "ULT"|
    "Partner"|
    "Air"|"Floor"|"Wall"|"Knocked"|
    "Phase"

local StatPaths: {[StatType]: {string}} = {
    Blocking = {"Blocking"},
    BlockingTick = {"Blocking", "Tick"},

    Running = {"Running"},

    CanDash = {"CanDash"},
    CanLook = {"CanLook"},
    CanRun = {"CanRun"},
    CanTP = {"CanTP"},

    Cutscene = {"Cutscene"},
    FakeCutscene = {"FakeCutscene"},

    Health = {"Health"},
    HealthKR = {"Health", "KR"},
    HealthMax = {"Health", "Max"},

    Attack = {"Attack"},
    Defense = {"Defense"},

    Dodge = {"Dodge"},
    DodgeBar = {"DodgeBar"},
    DodgeBarMax = {"DodgeBar", "Max"},

    RunStamina = {"RunStamina"},
    RunStaminaMax = {"RunStamina", "Max"},

    Stamina = {"Stamina"},
    StaminaMax = {"Stamina", "Max"},

    Frozen = {"Frozen"},
    FrozenTick = {"Frozen", "Tick"},

    Stunned = {"Stunned"},
    StunnedTick = {"Stunned", "Tick"},

    HitTick = {"HitTick"},
    LastMove = {"LastMove"},
    TimeMulti = {"TimeMulti"},
    ULT = {"ULT"},
    Partner = {"vspartner"},
    Air={"Air"},
    Floor={"Floor"},
    Wall={"Wall"},
}

type StatOverload = 
    & ((TargetPlayer: Player?, Stat: "Blocking") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "BlockingTick") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "Running") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "CanDash") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "CanLook") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "CanRun") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "CanTP") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "Cutscene") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "FakeCutscene") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "Health") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "HealthKR") -> IntValue?)
    & ((TargetPlayer: Player?, Stat: "HealthMax") -> IntValue?)
    & ((TargetPlayer: Player?, Stat: "Attack") -> IntValue?)
    & ((TargetPlayer: Player?, Stat: "Defense") -> IntValue?)
    & ((TargetPlayer: Player?, Stat: "Dodge") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "DodgeBar") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "DodgeBarMax") -> IntValue?)
    & ((TargetPlayer: Player?, Stat: "RunStamina") -> IntValue?)
    & ((TargetPlayer: Player?, Stat: "RunStaminaMax") -> IntValue?)
    & ((TargetPlayer: Player?, Stat: "Stamina") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "StaminaMax") -> IntValue?)
    & ((TargetPlayer: Player?, Stat: "Frozen") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "FrozenTick") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "Stunned") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "StunnedTick") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "HitTick") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "LastMove") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "TimeMulti") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "ULT") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "Partner") -> ObjectValue?)
    & ((TargetPlayer: Player?, Stat: "KB") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "Floor") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "Wall") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "Air") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "Knocked") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "Phase") -> NumberValue?)

Module.Stat = (function()
    return ((function(TargetPlayer: Player?, Stat: any): ValueBase?
        local Target = TargetPlayer or Players.LocalPlayer
        local Character = Target.Character
        if not Character then return nil end

        local Data = Character:WaitForChild("Data", 0.5) :: Folder?
        if not Data then return nil end

        if Stat == "Phase" then
            local Class: ClassType = Module.GetClass(TargetPlayer)
            local Phase = Instance.new("NumberValue")
            Phase.Value = 1
            if TargetPlayer and TargetPlayer.Character then
                if Class == "GTFrisk" then
                    local function GetGTFriskPhase()
                        Phase.Value = (Character:FindFirstChild("GTShield") or Character:FindFirstChild("MirageEdge")) and 1 or 2
                    end
                    GetGTFriskPhase()
                    Character.ChildAdded:Connect(GetGTFriskPhase) 
                    Character.ChildRemoved:Connect(GetGTFriskPhase)
                elseif Class == "XTFrisk" then
                    local Head = Character:WaitForChild("Head")
                    local function GetXTFriskPhase()
                        Phase.Value =  Head:FindFirstChild("Aura") and 2 or 1
                    end
                    GetXTFriskPhase()
                    Head.ChildAdded:Connect(GetXTFriskPhase) 
                    Head.ChildRemoved:Connect(GetXTFriskPhase)
                elseif Class == "XTCross" then
                    local function GetXTCrossPhase()
                        Phase.Value =  Character:FindFirstChild("KnifePurple") and 2 or 1
                    end
                    GetXTCrossPhase()
                    Character.ChildAdded:Connect(GetXTCrossPhase) 
                    Character.ChildRemoved:Connect(GetXTCrossPhase)
                elseif Class == "SSChara" then
                    local Dodge = (Module :: any).Stat(TargetPlayer, "Dodge") :: BoolValue
                    if not Dodge then
                        print("SSChara Dodge Not", TargetPlayer, Dodge)
                    else
                        local function GetSSCharaPhase()
                            Phase.Value =  Dodge.Value and 1 or 2
                        end
                        Dodge.Changed:Connect(GetSSCharaPhase)
                    end
                end
            end
            return Phase
        end

        if Stat == "KB" then
            local KB = Instance.new("BoolValue")

            local KBStack = 0

            for _, child in ipairs(Data:GetChildren()) do
                if child.Name == "KB" then
                    KBStack += 1
                end
            end
            KB.Value = KBStack > 0
            Data.ChildAdded:Connect(function(Child)
                if Child.Name ~= "KB" then return end
                KBStack+=1
                KB.Value = KBStack > 0
            end)
            Data.ChildRemoved:Connect(function(Child)
                if Child.Name ~= "KB" then return end
                KBStack-=1
                KB.Value = KBStack > 0
            end)
            return KB
        end

        if Stat == "Knocked" then
            local Knocked = Instance.new("BoolValue")

            local Air = (Module :: any).Stat(TargetPlayer, "Air") :: BoolValue
            local Floor = (Module :: any).Stat(TargetPlayer, "Floor") :: BoolValue
            local Wall = (Module :: any).Stat(TargetPlayer, "Wall") :: BoolValue
            
            local function RefreshKnocked()
                Knocked.Value = Air.Value or Floor.Value or Wall.Value
            end

            Air.Changed:Connect(RefreshKnocked)
            Floor.Changed:Connect(RefreshKnocked)
            Wall.Changed:Connect(RefreshKnocked)

            RefreshKnocked()

            return Knocked
        end

        local Path = StatPaths[Stat :: StatType]
        if not Path then return nil end

        local Current: Instance = Data
        for _, Name in Path do
            local Next = Current:WaitForChild(Name, 0.5)
            if not Next then return nil end
            Current = Next
        end

        return Current :: ValueBase
    end) :: any) :: StatOverload
end)()

function Module.TimeMulti(Multiplier: number)
    local TimeMulti = Module.Stat(nil, "TimeMulti")
    if not TimeMulti then return false end
    TimeMulti.Value = Multiplier
    return true
end

Module.Positions = {
    {Name="Spawn", Position=Vector3.new(-31, 952, 793)},
    {Name="Ceiling", Position=Vector3.new(-19, 1489, 799)},
    {Name="Atrain", Position=Vector3.new(-494, 139, -51458)},
    {Name="FNF", Position=Vector3.new(6620, 15, -89)},
    {Name="JudgementHall", Position=Vector3.new(33301, -302, 13)},
    {Name="KrisUlt", Position=Vector3.new(6015, 190, 3490)},
    {Name="MarisaUlt", Position=Vector3.new(49988, 450, 26852)},
    {Name="NightmareBox", Position=Vector3.new(5433, 3352, 1883)},
    {Name="ReaperO3", Position=Vector3.new(34, 6420, -13)},
    {Name="ReaperO4", Position=Vector3.new(-1012, 6385, 76)},
    {Name="Arena1", Position=Vector3.new(9950, 20, 13499)},
    {Name="Arena2", Position=Vector3.new(9950, 20, 16955)},
    {Name="Arena3", Position=Vector3.new(9950, 20, 20428)},
    {Name="Arena4", Position=Vector3.new(9950, 20, 23948)},
    {Name="Arena5", Position=Vector3.new(9950, 20, 27359)},
    {Name="Arena6", Position=Vector3.new(9950, 20, 30904)},
    {Name="Arena7", Position=Vector3.new(9950, 20, 34506)},
    {Name="Arena8", Position=Vector3.new(9950, 20, 37956)},
}

function Module.GetPosition(PositionName: "Spawn"| "Ceiling"| "Atrain"| "FNF"| "JudgementHall"|
    "KrisUlt"| "MarisaUlt"| "NightmareBox"| "ReaperO3"| "ReaperO4"|
    "Arena1"| "Arena2"| "Arena3"| "Arena4"| "Arena5"| "Arena6"| "Arena7"| "Arena8"
): Vector3
    local Position = nil
    for _, Pos in ipairs(Module.Positions) do
        if Pos.Name == PositionName then
            Position = Pos.Position
            break
        end
    end

    return Position
end

export type SettingType =
	"ShowHitboxes"
	| "ShowImpactFrames"
	| "FOVChanges"
	| "CameraShake"
	| "Morphs"
	| "GameTips"
	| "HUDMovement"
	| "ClickableMoveButtons"
	| "Respawn After Kill"
	| "Skip Intros"
	| "Preferred Friend ID"

export type SettingValueMap = {
	ShowHitboxes: string,
	ShowImpactFrames: string,
	FOVChanges: string,
	CameraShake: string,
	Morphs: string,
	GameTips: string,
	HUDMovement: string,
	ClickableMoveButtons: string,
	["Respawn After Kill"]: string,
	["Skip Intros"]: string,
	["Preferred Friend ID"]: number,
}

export type ConfigType = {
	Settings: SettingValueMap,
	MobileSettings: { [string]: string }?,
	Positions: { [string]: any }?,
	Special: { [string]: any }?,
	ButtonSize: number?,
	Outfits: { [string]: any }?,
}

Module.DefaultSettings = (function()
	local DefaultSettings: SettingValueMap = {
		ShowHitboxes = "False",
		ShowImpactFrames = "False",
		FOVChanges = "True",
		CameraShake = "True",
		Morphs = "False",
		GameTips = "On",
		HUDMovement = "On",
		ClickableMoveButtons = "On",
		["Respawn After Kill"] = "True",
		["Skip Intros"] = "False",
		["Preferred Friend ID"] = 0,
	}
	return DefaultSettings
end)()

local function mergeDefaults(Settings: { [string]: any }?): SettingValueMap
	local Result: { [string]: any } = Settings and table.clone(Settings) or {}
	for k, v in pairs(Module.DefaultSettings :: any) do
		if Result[k] == nil then
			Result[k] = v
		end
	end
	return Result :: SettingValueMap
end

function Module.GetConfig(): ConfigType
	local ConfigRaw = Remotes.GetSettings:InvokeServer()

	if ConfigRaw == nil then
		return {
			Settings = table.clone(Module.DefaultSettings),
		}
	end

	local Config = HttpService:JSONDecode(ConfigRaw)
	Config.Settings = mergeDefaults(Config.Settings)
	return Config
end

function Module.SetConfig(Config: ConfigType)
	local SettingsRaw = HttpService:JSONEncode(Config)
	Remotes.SetSettings:FireServer(SettingsRaw)
end

function Module.GetSetting(Types: { SettingType }): { [string]: string | number }
	local Config = Module.GetConfig()
	local Settings = Config.Settings

	local Result: { [string]: string | number } = {}
	for _, Type in ipairs(Types) do
		Result[Type] = (Settings :: any)[Type]
	end

	return Result
end

function Module.SetSetting(Changes: { [string]: string | number }?)
	local Config = Module.GetConfig()

	local Settings: SettingValueMap
	if Changes == nil then
		Settings = table.clone(Module.DefaultSettings)
	else
		Settings = table.clone(Config.Settings)
		for Type, Value in pairs(Changes) do
			(Settings :: any)[Type] = Value
		end
	end

	Config.Settings = Settings
	Module.SetConfig(Config)
end

function Module.CmdrCommand(Cmd: string)
    local Response = Remotes.CmdrFunction:InvokeServer(Cmd) :: string
    return Response
end

return Module

            ]====], "532a982c55798c9f10f990c18c748348")
            if not Func then
                error(("[%s] Compile Error: %s"):format("532a982c55798c9f10f990c18c748348", tostring(LoadErr)))
            end
            local Ok, ErrOrResult = pcall(Func, Self)
            if not Ok then
                error(ErrOrResult)
            end
            return ErrOrResult
        end),
["8f8cd2148959a6855c0043dd204d6592"]=(function(Self)
            local Func, LoadErr = loadstring([====[
                local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
                --!strict
--!nolint
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")

local MetaModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("2a7bb31d62e706c8eb498d59f4f9a667", "8f8cd2148959a6855c0043dd204d6592")
local BaseModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("11e8106c399d65a976e76ad6e7a1d5bb", "8f8cd2148959a6855c0043dd204d6592")
local GuiModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("5fc274f1b48de9284581ec642e9549af", "8f8cd2148959a6855c0043dd204d6592")

local Module = {}
type ModuleType = typeof(Module)?

if BaseModule.GetPlaceId() ~= MetaModule.Metadata.PlaceIds.ABA then warn("ABAModule Ignored: PlaceId MisMatch"); return nil :: ModuleType end

type OrderType = 
    "Invoke"|"InvokeReply"|"Tween"|"Sound"|"AwaitInput"|"Effect"|"Block"|"Line"|"Warn"|
    "Sync"|"Obj"|"MoverRep"|"KBSmooth"|"RemoveWeld"|"Cutscene"|"Proj"|"UI"|"Beam"|
    "VelSmooth"|"TChargeSmoothing"|"Chat"|"Provider"|"CFInterpolation"|"Emote"|"Music"|
    "ForceLock"|"Melee"|"Stat"|"Move"|"MoveD"|"Dash"|"Utility"|"UtilityH"|"Reset"|"Spawn"|"Jump"

local Order: {OrderType} = {
    "Invoke", "InvokeReply", "Tween", "Sound", "AwaitInput", "Effect", "Block", "Line",
    "Warn", "Sync", "Obj", "MoverRep", "KBSmooth", "RemoveWeld", "Cutscene", "Proj",
    "UI", "Beam", "VelSmooth", "TChargeSmoothing", "Chat", "Provider", "CFInterpolation",
    "Emote", "Music", "ForceLock", "Melee", "Stat", "Move", "MoveD", "Dash", "Utility",
    "UtilityH", "Reset", "Spawn", "Jump",
} -- BridgeNet Order

local Remotes = {
    BridgeEvent = (ReplicatedStorage:FindFirstChild("BindEvents") and (ReplicatedStorage:FindFirstChild("BindEvents") :: Folder):FindFirstChild("UIEvent")) :: RemoteEvent
}

for RemoteName, Remote in pairs(Remotes) do
    if Remote == nil then warn(("ABLModule Ignored: Remote %s Missing"):format(RemoteName)); return nil end
end

type ClassType = "None"|"Sans"|"Asgore"|"GTFrisk"|"XTCross"
type StatType = 
    "BlockTick"|"LastJumpTick"|"ArmoredTick"|"LightArmoredTick"|"StunTick"|
    "CanGetup"|"CanJump"|
    "Class"|
    "Combat"|
    "CurrentSpeed"|
    "Dodge"|
    "FreezeTick"|
    "IsArmored"|"IsBlocking"|"IsDebounce"|"IsFrozen"|"IsKB"|"IsLightArmored"|"IsMeleeing"|"IsMoveStunned"|"IsPhased"|"IsUnbreakable"|
    "KBState"|
    "Mana"|"MaxMana"|
    "Stamina"|"MaxStamina"|
    "MaxHealth"|
    "Phase"|
    "TimeMulti"

--[[
    ABA uses BridgeNet
    This is an BridgeNet Mimitation
]]
Module.BridgeFire = (function()
    local MapSequential = {}
    local MapReverse = {}

    for i, name in ipairs(Order) do
        if name ~= "_" then
            local id = string.pack("B", i)
            MapSequential[name] = id
            MapReverse[id] = name
        end
    end

    return function(RemoteName: OrderType, ...)
        local RemoteId = MapSequential[RemoteName]
        if not RemoteId then error(("Remote name %s does not exist"):format(RemoteName)) end
        local args = {...}
        for i = 1, #args do
            if args[i] == nil then
                args[i] = "null"
            end
        end
        
        Remotes.BridgeEvent:FireServer({
            {
                RemoteId,
                table.unpack(args)
            }
        })
    end
end)()

function Module.ResetDeath()
    Module.BridgeFire("Reset")
end

function Module.ResetForce()
    BaseModule.ResetForce()
end

type StatOverload = 
    & ((TargetPlayer: Player?, Stat: "BlockTick") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "LastJumpTick") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "ArmoredTick") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "LightArmoredTick") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "StunTick") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "CanGetup") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "CanJump") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "Class") -> StringValue?)
    & ((TargetPlayer: Player?, Stat: "Combat") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "CurrentSpeed") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "Dodge") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "FreezeTick") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "IsArmored") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "IsBlocking") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "IsDebounce") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "IsFrozen") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "IsKB") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "IsLightArmored") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "IsMeleeing") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "IsMoveStunned") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "IsPhased") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "IsUnBreakable") -> BoolValue?)
    & ((TargetPlayer: Player?, Stat: "KBState") -> StringValue?)
    & ((TargetPlayer: Player?, Stat: "Mana") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "MaxMana") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "Stamina") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "MaxStamina") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "MaxHealth") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "Phase") -> NumberValue?)
    & ((TargetPlayer: Player?, Stat: "TimeMulti") -> NumberValue?)
    
Module.Stat = (function()
    return ((function(TargetPlayer: Player?, Stat: StatType): ValueBase?
        local Target = TargetPlayer or Players.LocalPlayer
        local Character = Target.Character
        if not Character then return nil end

        local Obj: ValueBase

        if Stat == "BlockTick" then
            Obj = Instance.new("NumberValue")
        elseif Stat == "LastJumpTick" then
            Obj = Instance.new("NumberValue")
        elseif Stat == "ArmoredTick" then
            Obj = Instance.new("NumberValue")
        elseif Stat == "LightArmoredTick" then
            Obj = Instance.new("NumberValue")
        elseif Stat == "StunTick" then
            Obj = Instance.new("NumberValue")
        elseif Stat == "CanGetup" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "CanJump" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "Class" then
            Obj = Instance.new("StringValue")
        elseif Stat == "Combat" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "CurrentSpeed" then
            Obj = Instance.new("NumberValue")
        elseif Stat == "Dodge" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "FreezeTick" then
            Obj = Instance.new("NumberValue")
        elseif Stat == "IsArmored" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "IsBlocking" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "IsDebounce" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "IsFrozen" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "IsKB" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "IsLightArmored" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "IsMeleeing" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "IsMoveStunned" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "IsPhased" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "IsUnbreakable" then
            Obj = Instance.new("BoolValue")
        elseif Stat == "KBState" then
            Obj = Instance.new("StringValue")
        elseif Stat == "Mana" then
            Obj = Instance.new("NumberValue")
        elseif Stat == "MaxMana" then
            Obj = Instance.new("NumberValue")
        elseif Stat == "Stamina" then
            Obj = Instance.new("NumberValue")
        elseif Stat == "MaxStamina" then
            Obj = Instance.new("NumberValue")
        elseif Stat == "MaxHealth" then
            Obj = Instance.new("NumberValue")
        elseif Stat == "Phase" then
            Obj = Instance.new("NumberValue")
        elseif Stat == "TimeMulti" then
            Obj = Instance.new("NumberValue")
        else
            return nil
        end

        local AttributeName = Stat
        local Syncing = false
        local AnyObj = Obj :: any

        local Initial = Character:GetAttribute(AttributeName)
        if Initial ~= nil then
            Syncing = true
            AnyObj.Value = Initial
            Syncing = false
        end

        -- Attribute -> ValueObject
        Character:GetAttributeChangedSignal(AttributeName):Connect(function()
            if Syncing then return end
            Syncing = true
            AnyObj.Value = Character:GetAttribute(AttributeName)
            Syncing = false
        end)

        -- ValueObject -> Attribute
        AnyObj.Changed:Connect(function(NewValue)
            if Syncing then return end
            Syncing = true
            Character:SetAttribute(AttributeName, NewValue)
            Syncing = false
        end)

        return Obj
    end) :: any) :: StatOverload
end)()

function Module.GetClass(TargetPlayer: Player?): ClassType|"None"
    local Target = TargetPlayer or Players.LocalPlayer
    if not Target.Character then return "None" end
    local Char = Module.Stat(Target, "Class")
    if not Char then return "None" end
    return Char.Value :: ClassType
end

function Module.PickClass(Class: ClassType) --[Class: string]
    local LocalPlayer = BaseModule.GetLocal()
    local PlayerGui = GuiModule.GetPlayerGui()
    Module.ResetDeath()
    task.spawn(function()
        local Menu = PlayerGui:WaitForChild("Menu")
        if Menu then Menu:Destroy() end
    end)
    Module.BridgeFire("Spawn", Class)
    local LocalCharacter = LocalPlayer.CharacterAdded:Wait()
    return LocalCharacter
end

function Module.Skill(Page: string, AttackIndex: number, Position: Vector3)
    Module.BridgeFire("Proj",
        true,
        Page,
        AttackIndex,
        Position,
        false
    )
end

function Module.Melee(TargetCharacter, MeleeCount) --[TargetCharacter: CharacterModel, MeleeCount: number]
    Module.BridgeFire("Melee",
        false,
        MeleeCount
    )
    task.wait()
    Module.BridgeFire("Melee",
        true,
        MeleeCount,
        TargetCharacter,
        TargetCharacter:FindFirstChild("HumanoidRootPart").CFrame
    )
end

function Module.TimeMulti(Multiplier: number)
    local TimeMulti = Module.Stat(nil, "TimeMulti")
    if not TimeMulti then return end
    TimeMulti.Value = Multiplier
end

return Module
            ]====], "8f8cd2148959a6855c0043dd204d6592")
            if not Func then
                error(("[%s] Compile Error: %s"):format("8f8cd2148959a6855c0043dd204d6592", tostring(LoadErr)))
            end
            local Ok, ErrOrResult = pcall(Func, Self)
            if not Ok then
                error(ErrOrResult)
            end
            return ErrOrResult
        end),
["738d560ed168b91824099e89eff88cd6"]=(function(Self)
            local Func, LoadErr = loadstring([====[
                local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
                local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local SHA256 = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("f0682ea99a292fc9094538d2bc669f5f", "738d560ed168b91824099e89eff88cd6")
local BaseModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("11e8106c399d65a976e76ad6e7a1d5bb", "738d560ed168b91824099e89eff88cd6")
local StorageModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("1aca2df133555861b6da8ce8681dca83", "738d560ed168b91824099e89eff88cd6")
local GuiModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("5fc274f1b48de9284581ec642e9549af", "738d560ed168b91824099e89eff88cd6")

local Module = {}

type CleanupFunc = (Context) -> ()

type Context = {
    Cleanups: {CleanupFunc},
    Connections: {RBXScriptConnection}
}

type Storage = {
    Loading: BaseModule.HolderType,
    Context: Context
}

local function BuildTools(Context: Context)
    local Tools
    Tools = {
        String = {
            Trim = function(str: string | any): string
                return tostring(str):gsub("^%s*(.-)%s*$", "%1")
            end,
            Includes = function(str: string, sub: string): boolean
                return string.find(str, sub, 1, true) ~= nil
            end,
            StartsWith = function(str: string, search: string, starting: number?): boolean
                local pos = starting or 1
                if pos < 1 then
                    pos = 1
                end
                return string.sub(str, pos, pos + #search - 1) == search
            end,
            EndsWith = function(str: string, search: string, ending: number?): boolean
                local pos = ending or #str
                if pos > #str then
                    pos = #str
                end
                return string.sub(str, pos - #search + 1, pos) == search
            end,
            Match = function(t1: string, t2: string): boolean
                return Tools.String.Trim(t1):lower() == Tools.String.Trim(t2):lower()
            end,
            MatchContain = function(str: string, sub: string): boolean
                return Tools.String.Includes(
                    Tools.String.Trim(str):lower(),
                    Tools.String.Trim(sub):lower()
                )
            end,
        },
        Array = {
            Filter = function<T>(arr: { T }, callback: (item: T) -> boolean): { T }
                local result: { T } = {}
                for _, item in ipairs(arr) do
                    if callback(item) then
                        table.insert(result, item)
                    end
                end
                return result
            end,
            Map = function<T, U>(arr: { T }, callback: (item: T) -> U): { U }
                local result: { U } = {}
                for _, item in ipairs(arr) do
                    table.insert(result, callback(item))
                end
                return result
            end,
        },
        Object = {
            Assign = function<T>(target: T, ...: any): T
                local args = { ... }
                for _, arg in ipairs(args) do
                    for key, val in pairs(arg) do
                        (target :: any)[key] = val
                    end
                end
                return target
            end,
            PrettyPrint = function(tbl: { [any]: any }, indentSize: number?, level: number?, _isRoot: boolean?): string
                local size: number = indentSize or 4
                local lvl: number = level or 0
                local isRoot = (_isRoot == nil) and true or _isRoot
                local indent = string.rep(" ", size * lvl)
                local childIndent = string.rep(" ", size * (lvl + 1))

                local function formatValue(value: any): string
                    local t = typeof(value)
                    if t == "string" then
                        return string.format("%q", value)
                    elseif t == "table" then
                        return Tools.Object.PrettyPrint(value, size, lvl + 1, false)
                    elseif t == "Instance" then
                        return string.format("%q", value:GetFullName())
                    else
                        return tostring(value)
                    end
                end

                if next(tbl) == nil then
                    if isRoot then
                        print("{}")
                    end
                    return "{}"
                end

                local lines: { string } = {}
                table.insert(lines, "{")

                local arrayKeys: { number } = {}
                for key in pairs(tbl) do
                    if typeof(key) == "number" and key == math.floor(key) and key >= 1 then
                        table.insert(arrayKeys, key)
                    end
                end
                table.sort(arrayKeys)

                local isArrayIndex: { [number]: boolean } = {}
                for _, i in ipairs(arrayKeys) do
                    table.insert(lines, childIndent .. formatValue(tbl[i]) .. ",")
                    isArrayIndex[i] = true
                end

                for key, value in pairs(tbl) do
                    if not (typeof(key) == "number" and isArrayIndex[key]) then
                        local keyStr: string
                        if typeof(key) == "string" then
                            keyStr = string.format("[%q]", key)
                        elseif typeof(key) == "Instance" then
                            keyStr = string.format("[%q]", key:GetFullName())
                        else
                            keyStr = "[" .. tostring(key) .. "]"
                        end
                        table.insert(lines, childIndent .. keyStr .. " = " .. formatValue(value) .. ",")
                    end
                end

                table.insert(lines, indent .. "}")

                local result = table.concat(lines, "\n")

                if isRoot then
                    print(result)
                end

                return result
            end,
        },
        Frame = {
            MakeDraggable = function(MainFrame: GuiObject, Handler: GuiObject)
                local dragging = false
                local dragStart: Vector3?
                local baseOffX: number, baseOffY: number
                local scaleX: number, scaleY: number
                local pendingX: number, pendingY: number
                local dirty = false

                Tools.Events.ConnectEvent(Handler.InputBegan, function(input: InputObject, processed: boolean?)
                    if processed then
                        return
                    end
                    if input.UserInputType == Enum.UserInputType.MouseButton1
                        or input.UserInputType == Enum.UserInputType.Touch
                    then
                        dragging = true
                        dragStart = input.Position
                        local p = MainFrame.Position
                        scaleX, scaleY = p.X.Scale, p.Y.Scale
                        baseOffX, baseOffY = p.X.Offset, p.Y.Offset
                        pendingX, pendingY = baseOffX, baseOffY
                    end
                end)

                Tools.Events.ConnectEvent(Handler.InputEnded, function(input: InputObject, _processed: boolean?)
                    if input.UserInputType == Enum.UserInputType.MouseButton1
                        or input.UserInputType == Enum.UserInputType.Touch
                    then
                        dragging = false
                    end
                end)

                Tools.Events.ConnectEvent(UserInputService.InputChanged, function(input: InputObject, _processed: boolean?)
                    if not dragging then
                        return
                    end
                    if input.UserInputType ~= Enum.UserInputType.MouseMovement
                        and input.UserInputType ~= Enum.UserInputType.Touch
                    then
                        return
                    end
                    local delta = input.Position - (dragStart :: Vector3)
                    pendingX = baseOffX + delta.X
                    pendingY = baseOffY + delta.Y
                    dirty = true
                end)

                Tools.Events.ConnectEvent(RunService.RenderStepped, function()
                    if not dirty then
                        return
                    end
                    dirty = false
                    MainFrame.Position = UDim2.new(scaleX, pendingX, scaleY, pendingY)
                end)
            end,
            Hover = function(Button: GuiObject, onLeave: () -> (), onHover: () -> ())
                local enterConn = Tools.Events.ConnectEvent(Button.MouseEnter, function()
                    onHover()
                end)
                local leaveConn = Tools.Events.ConnectEvent(Button.MouseLeave, function()
                    onLeave()
                end)
                onLeave()
                return { enterConn, leaveConn }
            end,
            Round = function(instance: GuiObject, radius: UDim?): UICorner
                local corner = Instance.new("UICorner")
                corner.CornerRadius = radius or UDim.new(0, 10)
                corner.Parent = instance
                return corner
            end,
        },
        Events = {
            ConnectEvent = (function<T...>(signal: RBXScriptSignal, callback: (...any) -> ())
                local connection: RBXScriptConnection?
                local attempt = 1

                local function Disconnect()
                    if connection then
                        connection:Disconnect()
                    end
                    local idx = table.find(Context.Connections, connection :: RBXScriptConnection)
                    if idx then
                        table.remove(Context.Connections, idx)
                    end
                    connection = nil
                end

                local EventManagerRef

                connection = signal:Connect(function(...: T...)
                    EventManagerRef.Attempt = attempt
                    callback(...)
                    attempt += 1
                end)

                local function Reconnect()
                    Disconnect()
                    EventManagerRef = Tools.Events.ConnectEvent(signal, callback)
                    return EventManagerRef
                end

                EventManagerRef = {
                    Attempt = 0,
                    Reconnect = Reconnect,
                    Disconnect = Disconnect,
                    Connection = connection,
                }

                table.insert(Context.Connections, connection :: RBXScriptConnection)
                return EventManagerRef
            end) :: <T...>(signal: RBXScriptSignal<T...>, callback: (T...) -> ()) -> {
                Attempt: number,
                Reconnect: () -> (),
                Disconnect: () -> (),
                Connection: RBXScriptConnection
            },
            Parallel = function(...: () -> any): ...any
                local Funcs = { ... }
                local Total = #Funcs
                if Total == 0 then
                    return
                end
                local Results: { any } = {}
                local Completed = 0
                local MainThread = coroutine.running()

                for i, Func in ipairs(Funcs) do
                    task.spawn(function()
                        local s, r = pcall(Func)
                        Results[i] = s and r or nil
                        Completed += 1
                        if coroutine.status(MainThread) == "suspended" and Completed == Total then
                            task.defer(function()
                                coroutine.resume(MainThread)
                            end)
                        end
                    end)
                end
                coroutine.yield()
                return table.unpack(Results)
            end,
        },
        Players = {
            GetThumbnail = function(Id: number, Config: { Width: number?, Height: number?, Type: string? }?): string
                local cfg: { Width: number?, Height: number?, Type: string? } = Config or {}
                local Width: number = cfg.Width or 420
                local Height: number = cfg.Height or 420
                local Type: string = cfg.Type or "AvatarHeadShot"
                return ("rbxthumb://type=%s&id=%d&w=%d&h=%d"):format(Type, Id, Width, Height)
            end,
            Teleport = function(TargetCFrame: CFrame): boolean
                local LocalPlayer = Players.LocalPlayer
                local LocalCharacter = LocalPlayer.Character
                if not LocalCharacter then
                    return false
                end

                local LocalRoot = LocalCharacter:WaitForChild("HumanoidRootPart", 0.5) :: BasePart?
                if not LocalRoot then
                    return false
                end

                local OverlapCheckParams = OverlapParams.new()
                OverlapCheckParams.FilterType = Enum.RaycastFilterType.Exclude
                OverlapCheckParams.FilterDescendantsInstances = { LocalCharacter }
                OverlapCheckParams.RespectCanCollide = true

                local RootSize = LocalRoot.Size

                local function IsStuck(Position: Vector3): boolean
                    local CheckCFrame = CFrame.new(Position)
                    local Parts = workspace:GetPartBoundsInBox(CheckCFrame, RootSize, OverlapCheckParams)
                    return #Parts > 0
                end

                local TargetPosition = TargetCFrame.Position
                local FinalPosition = TargetPosition

                if IsStuck(TargetPosition) then
                    local Current = TargetPosition
                    local Found = false
                    for _ = 1, 25 do
                        Current = Current + Vector3.new(0, 2, 0)
                        if not IsStuck(Current) then
                            FinalPosition = Current
                            Found = true
                            break
                        end
                    end
                    if not Found then
                        return false
                    end
                else
                    local Current = TargetPosition
                    local LastSafe = TargetPosition
                    for _ = 1, 25 do
                        local Next = Current - Vector3.new(0, 2, 0)
                        if IsStuck(Next) then
                            break
                        end
                        LastSafe = Next
                        Current = Next
                    end
                    FinalPosition = LastSafe
                end

                LocalRoot.CFrame = CFrame.new(FinalPosition) * (TargetCFrame - TargetCFrame.Position)
                return true
            end,
            GetRoot = function(Target: Player | Model): Part?
                if not Target then return nil end
                if Target:IsA("Player") then
                    return Target.Character and Target.Character:WaitForChild("HumanoidRootPart", 0.5) :: Part?
                end
                return Target:WaitForChild("HumanoidRootPart", 0.5) :: Part?
            end,
        },
        Games = {
            GetGameIcon = function(GameId: number?): string
                return ("rbxthumb://type=GameIcon&id=%s&w=256&h=256"):format(tostring(GameId or BaseModule.GetJobId()))
            end,
            GetProductInfo = function(PlaceId: number?)
                return MarketplaceService:GetProductInfo(PlaceId or BaseModule.GetPlaceId())
            end
        },
    }
    return Tools
end

local function BuildManager(Context: Context, Container: Instance, Title: string)
    local Manager = {}
    function Manager.AddCleanup(Func: CleanupFunc)
        table.insert(Context.Cleanups, Func)
    end
    function Manager.AddBaseGui()
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = Title
        ScreenGui.Parent = Container

        Manager.AddCleanup(function()
            ScreenGui:Destroy()
        end)

        return ScreenGui
    end
    return Manager
end

export type ToolsType = typeof(BuildTools((nil :: any) :: Context))
export type ManagerType = typeof(BuildManager((nil :: any) :: Context, (nil :: any) :: Instance, ""))

function Module.Create(Title: string)
    local G = StorageModule.Global()
    local Hashed = SHA256.hash(Title)

    local Context = (function()
        local Loading = BaseModule.CreateHolder()
        pcall(function()
            local BeforeStorage = G[Hashed] :: Storage?
            if BeforeStorage then
                local BeforeLoading = BeforeStorage.Loading
                if BeforeLoading then BeforeLoading.Wait() end
                BeforeStorage.Loading = Loading
                local BeforeContext = BeforeStorage.Context
                for _, Cleanup in ipairs(BeforeContext.Cleanups) do
                    pcall(Cleanup, BeforeContext)
                end
                for _, Connection in ipairs(BeforeContext.Connections) do
                    Connection:Disconnect()
                end
                table.clear(BeforeContext.Cleanups)
                table.clear(BeforeContext.Connections)
            end
        end)
        Loading.Fire()
        local NewStorage: Storage = {
            Loading = Loading,
            Context = {
                Cleanups = {},
                Connections = {},
            },
        }
        G[Hashed] = NewStorage
        return NewStorage.Context
    end)()

    local Tools = BuildTools(Context)
    local Container = GuiModule.GetContainer()
    local Manager = BuildManager(Context, Container, Title)

    return Tools, Manager
end

return Module
            ]====], "738d560ed168b91824099e89eff88cd6")
            if not Func then
                error(("[%s] Compile Error: %s"):format("738d560ed168b91824099e89eff88cd6", tostring(LoadErr)))
            end
            local Ok, ErrOrResult = pcall(Func, Self)
            if not Ok then
                error(ErrOrResult)
            end
            return ErrOrResult
        end),
["5799bfb39ce31a94790c66ad18b65b74"]=(function(Self)
            local Func, LoadErr = loadstring([====[
                local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
                local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Nova = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("738d560ed168b91824099e89eff88cd6", "5799bfb39ce31a94790c66ad18b65b74")

type ToolsType = Nova.ToolsType
type ManagerType = Nova.ManagerType

local Palette = {
    Card         = Color3.fromRGB(24, 24, 28),
    CardStroke   = Color3.fromRGB(50, 50, 58),
    Sidebar      = Color3.fromRGB(24, 24, 28),
    TopBar       = Color3.fromRGB(20, 20, 24),
    TextPrimary  = Color3.fromRGB(235, 235, 235),
    TextMuted    = Color3.fromRGB(170, 170, 178),
    Accent       = Color3.fromRGB(88, 135, 240),
    AccentStroke = Color3.fromRGB(108, 152, 250),
    Danger       = Color3.fromRGB(190, 50, 50),
    DangerStroke = Color3.fromRGB(220, 80, 80),
}

-- ============================================================
-- Shared primitive types
-- ============================================================

-- Item identity key used across selectable lists. Kept as a
-- concrete union instead of `any` so lookups (itemDataByKey[key])
-- stay type-checked end-to-end.
export type ItemKey = number | string

type StateColors = {
    Background: Color3,
    BackgroundTransparency: number,
    Stroke: Color3,
    StrokeTransparency: number,
    Text: Color3,
}

-- Partial<StateColors> equivalent (Luau has no built-in Partial<T>).
type StateColorsPartial = {
    Background: Color3?,
    BackgroundTransparency: number?,
    Stroke: Color3?,
    StrokeTransparency: number?,
    Text: Color3?,
}

type ColorSet = {
    Idle: StateColors,
    Hover: StateColors,
    Selected: StateColors,
    Locked: StateColors,
    LockedSelected: StateColors?,
}

type ColorSetOverride = {
    Idle: StateColorsPartial?,
    Hover: StateColorsPartial?,
    Selected: StateColorsPartial?,
    Locked: StateColorsPartial?,
    LockedSelected: StateColorsPartial?,
}

-- Named states of a ColorSet. Kept as a type only now — merging and
-- resolution below use explicit field access instead of iterating this,
-- so no `any`-typed dynamic indexing is needed anywhere.
type ColorSetState = "Idle" | "Hover" | "Selected" | "Locked" | "LockedSelected"

-- 기본 파랑(Accent) / 눌림(Selected) 빨강(Danger) — DEFAULT_ACTION_COLORS와
-- 동일한 배색을 기본값으로 쓴다. Colors를 따로 안 넘긴 모든 버튼
-- (Button.Instant/Toggle/Loop, DescriptionButton 포함)이 이 기본값을 탄다.
local DEFAULT_BUTTON_COLORS: ColorSet = {
    Idle = {
        Background = Palette.Accent, BackgroundTransparency = 0,
        Stroke = Palette.AccentStroke, StrokeTransparency = 0.3,
        Text = Palette.TextPrimary,
    },
    Hover = {
        Background = Color3.fromRGB(108, 152, 250), BackgroundTransparency = 0,
        Stroke = Color3.fromRGB(128, 168, 255), StrokeTransparency = 0.1,
        Text = Palette.TextPrimary,
    },
    Selected = {
        Background = Palette.Danger, BackgroundTransparency = 0,
        Stroke = Palette.DangerStroke, StrokeTransparency = 0.2,
        Text = Palette.TextPrimary,
    },
    Locked = {
        Background = Color3.fromRGB(50, 25, 25), BackgroundTransparency = 0,
        Stroke = Palette.DangerStroke, StrokeTransparency = 0.3,
        Text = Color3.fromRGB(200, 140, 140),
    },
}

-- 사이드바 탭 버튼 전용 배색(원래 DEFAULT_BUTTON_COLORS였던 값). 탭은 위의
-- 파랑/빨강 기본값과 무관하게 원래 모습(기본 투명, 선택 시 파랑) 그대로 둔다.
local SIDEBAR_TAB_COLORS: ColorSet = {
    Idle = {
        Background = Palette.Sidebar, BackgroundTransparency = 1,
        Stroke = Color3.fromRGB(50, 50, 58), StrokeTransparency = 0.6,
        Text = Palette.TextMuted,
    },
    Hover = {
        Background = Color3.fromRGB(40, 40, 46), BackgroundTransparency = 0.5,
        Stroke = Color3.fromRGB(70, 70, 80), StrokeTransparency = 0.2,
        Text = Palette.TextPrimary,
    },
    Selected = {
        Background = Palette.Accent, BackgroundTransparency = 0,
        Stroke = Palette.AccentStroke, StrokeTransparency = 0.2,
        Text = Palette.TextPrimary,
    },
    Locked = {
        Background = Color3.fromRGB(50, 25, 25), BackgroundTransparency = 0,
        Stroke = Palette.DangerStroke, StrokeTransparency = 0.3,
        Text = Color3.fromRGB(200, 140, 140),
    },
}

local DEFAULT_CARD_SELECT_COLORS: ColorSet = {
    Idle = {
        Background = Palette.Card, BackgroundTransparency = 0,
        Stroke = Palette.CardStroke, StrokeTransparency = 0.5,
        Text = Palette.TextPrimary,
    },
    Hover = {
        Background = Color3.fromRGB(32, 32, 38), BackgroundTransparency = 0,
        Stroke = Color3.fromRGB(70, 70, 80), StrokeTransparency = 0.3,
        Text = Palette.TextPrimary,
    },
    Selected = {
        Background = Color3.fromRGB(45, 65, 110), BackgroundTransparency = 0,
        Stroke = Palette.AccentStroke, StrokeTransparency = 0.1,
        Text = Palette.TextPrimary,
    },
    Locked = {
        Background = Color3.fromRGB(50, 25, 25), BackgroundTransparency = 0,
        Stroke = Palette.DangerStroke, StrokeTransparency = 0.2,
        Text = Color3.fromRGB(210, 150, 150),
    },
    LockedSelected = {
        Background = Color3.fromRGB(45, 55, 95),
        BackgroundTransparency = 0,
        Stroke = Palette.AccentStroke,
        StrokeTransparency = 0,
        Text = Palette.TextPrimary,
    },
}

local DEFAULT_ACTION_COLORS: ColorSet = {
    Idle = {
        Background = Palette.Accent, BackgroundTransparency = 0,
        Stroke = Palette.AccentStroke, StrokeTransparency = 0.3,
        Text = Palette.TextPrimary,
    },
    Hover = {
        Background = Color3.fromRGB(108, 152, 250), BackgroundTransparency = 0,
        Stroke = Color3.fromRGB(128, 168, 255), StrokeTransparency = 0.1,
        Text = Palette.TextPrimary,
    },
    Selected = {
        Background = Palette.Danger, BackgroundTransparency = 0,
        Stroke = Palette.DangerStroke, StrokeTransparency = 0.2,
        Text = Palette.TextPrimary,
    },
    Locked = {
        Background = Color3.fromRGB(50, 25, 25), BackgroundTransparency = 0,
        Stroke = Palette.DangerStroke, StrokeTransparency = 0.3,
        Text = Color3.fromRGB(200, 140, 140),
    },
}

-- Merge a ColorSetOverride into a base ColorSet without ever touching `any`.
-- Explicit state/key enumeration means a typo in a state or field name is a
-- compile-time error instead of a silently-ignored runtime no-op.
-- Apply a StateColorsPartial onto a StateColors in place, field by field.
-- No dynamic indexing / `any` casts: every field is named explicitly, so a
-- typo or a renamed field in StateColors is a compile error here too.
local function applyStateColorsPartial(target: StateColors, patch: StateColorsPartial)
    if patch.Background ~= nil then target.Background = patch.Background end
    if patch.BackgroundTransparency ~= nil then target.BackgroundTransparency = patch.BackgroundTransparency end
    if patch.Stroke ~= nil then target.Stroke = patch.Stroke end
    if patch.StrokeTransparency ~= nil then target.StrokeTransparency = patch.StrokeTransparency end
    if patch.Text ~= nil then target.Text = patch.Text end
end

local function mergeColors(base: ColorSet, override: ColorSetOverride?): ColorSet
    if not override then return base end

    local result: ColorSet = {
        Idle = table.clone(base.Idle),
        Hover = table.clone(base.Hover),
        Selected = table.clone(base.Selected),
        Locked = table.clone(base.Locked),
        LockedSelected = base.LockedSelected and table.clone(base.LockedSelected) or nil,
    }

    if override.Idle then
        applyStateColorsPartial(result.Idle, override.Idle)
    end
    if override.Hover then
        applyStateColorsPartial(result.Hover, override.Hover)
    end
    if override.Selected then
        applyStateColorsPartial(result.Selected, override.Selected)
    end
    if override.Locked then
        applyStateColorsPartial(result.Locked, override.Locked)
    end
    if override.LockedSelected then
        if not result.LockedSelected then
            -- Overriding LockedSelected when the base ColorSet doesn't
            -- define one yet: start from Selected as a sane baseline.
            result.LockedSelected = table.clone(result.Selected)
        end
        applyStateColorsPartial(result.LockedSelected :: StateColors, override.LockedSelected)
    end

    return result
end

local ANIM = {
    Fast   = TweenInfo.new(0.15, Enum.EasingStyle.Quad,  Enum.EasingDirection.Out),
    Normal = TweenInfo.new(0.4,  Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    Enter  = TweenInfo.new(0.5,  Enum.EasingStyle.Back,  Enum.EasingDirection.Out),
    Exit   = TweenInfo.new(0.20, Enum.EasingStyle.Quad,  Enum.EasingDirection.In),
    Ripple = TweenInfo.new(0.8,  Enum.EasingStyle.Quad,  Enum.EasingDirection.Out),
}

local CHECKBOX_SIZE = 18

-- ============================================================
-- SelectableButton
-- ============================================================

type SelectableButtonMode = "Single" | "Toggle" | "Action"

export type SelectableButton = {
    Mode: SelectableButtonMode,
    Colors: ColorSet,
    Selected: boolean,
    Group: { Current: SelectableButton? }?,
    Locked: boolean,
    Instance: GuiButton,
    Stroke: UIStroke,
    Label: TextLabel?,
    Render: (self: SelectableButton) -> (),
    SetSelected: (self: SelectableButton, value: boolean, silent: boolean?) -> (),
    SetLocked: (self: SelectableButton, value: boolean) -> (),
    _hovering: boolean,
    _textConfig: (string | ((boolean) -> string))?,
    _itemKey: ItemKey?,
    -- Destroy 시 정리해야 할 이 버튼 소유의 Connection들(Hover, Click 등).
    -- CreatePlayerCard가 카드 단위로 취합해서 RemoveItem에서 한꺼번에 끊는다.
    _connections: { { Disconnect: () -> () } },
}

type ButtonText = string | ((selected: boolean) -> string)

type SelectableButtonConfig = {
    Parent: Instance?,
    TargetInstance: GuiButton?,
    TargetStroke: UIStroke?,
    Mode: SelectableButtonMode?,
    Colors: ColorSetOverride?,
    Initial: boolean?,
    Group: { Current: SelectableButton? }?,
    Locked: boolean?,
    Size: UDim2?,
    CornerRadius: UDim?,
    Text: ButtonText?,
    TextAlign: Enum.TextXAlignment?,
    OnClick: ((self: SelectableButton, selected: boolean) -> ())?,
    OnStateChanged: ((self: SelectableButton, selected: boolean) -> ())?,
    OnLockedClick: ((self: SelectableButton) -> ())?,
}

export type CheckboxOption = {
    Checked: boolean,
    Instance: GuiObject,
    SetChecked: (value: boolean, silent: boolean?) -> (),
}

type CheckboxOptionConfig = {
    Parent: Instance,
    Text: string?,
    Initial: boolean?,
    LayoutOrder: number?,
    OnChanged: ((checked: boolean) -> ())?,
}

-- Text + toggle-button row ("[텍스트 [토글버튼]]"). Distinct from
-- CheckboxOption (which renders a checkbox glyph) — this renders a
-- pill-style SelectableButton in Toggle mode next to a label.
export type ToggleRowConfig = {
    Text: string?,
    Initial: boolean?,
    LayoutOrder: number?,
    OnChanged: ((checked: boolean) -> ())?,
}

type ToggleRowCreateConfig = ToggleRowConfig & {
    Parent: Instance,
}

-- ============================================================
-- TextRunner (텍스트 입력 + 실행 버튼 + 결과 표시)
-- ============================================================

export type TextRunner = {
    Instance: GuiObject,
    -- addScreen이 요구하는 {Screen: GuiObject} 형태를 만족시키기 위한 별칭.
    -- Instance와 동일한 인스턴스를 가리키므로 addScreen(MainGuiScreenData)에
    -- CreateTextRunner의 반환값을 Screen 인자로 그대로 넘길 수 있다.
    Screen: GuiObject,
    Text: string,
    Result: string,
    SetResult: (result: string) -> (),
}

type TextRunnerConfig = {
    -- Parent가 없으면 부모를 지정하지 않은 채 화면(Frame)만 만들어 반환한다.
    -- CreateSelectableList와 동일한 패턴: addScreen에
    -- 직접 넘겨서 나중에 부모를 붙이는 용도로 쓸 수 있다.
    Parent: Instance?,
    Label: string?,
    Placeholder: string?,
    -- 실행 버튼에 표시될 텍스트. addScreen의 ButtonText(탭 이름)와는
    -- 별개이므로 이름을 다르게 뒀다 — CreateSelectableList의
    -- RunButtonText와 동일한 명명 규칙.
    RunButtonText: string?,
    LayoutOrder: number?,
    -- OnRun의 반환값이 그대로 결과 라벨에 표시됩니다.
    OnRun: ((text: string) -> string)?,
}

-- ============================================================
-- PlayerCard
-- ============================================================

export type PlayerCard = {
    Instance: GuiObject,
    TitleLabel: TextLabel,
    SubtitleLabel: TextLabel,
    Avatar: ImageLabel?,
    Button: SelectableButton?,
    Selectable: SelectableButton?,
    -- Button/Selectable이 만든 Connection들을 카드 단위로 취합해둔 것.
    -- RemoveItem이 카드를 Destroy하기 직전 여기 있는 걸 전부 Disconnect한다.
    _connections: { { Disconnect: () -> () } },
}

type PlayerCardButtonConfig = {
    Text: ButtonText?,
    Mode: SelectableButtonMode?,
    Group: { Current: SelectableButton? }?,
    Initial: boolean?,
    Colors: ColorSetOverride?,
    Width: number?,
    OnClick: ((btn: SelectableButton, selected: boolean, card: PlayerCard) -> ())?,
    OnStateChanged: ((btn: SelectableButton, selected: boolean, card: PlayerCard) -> ())?,
}

type PlayerCardSelectableConfig = {
    Mode: SelectableButtonMode?,
    Group: { Current: SelectableButton? }?,
    Initial: boolean?,
    Colors: ColorSetOverride?,
    OnClick: ((btn: SelectableButton, selected: boolean, card: PlayerCard) -> ())?,
    OnStateChanged: ((btn: SelectableButton, selected: boolean, card: PlayerCard) -> ())?,
}

type PlayerCardConfig = {
    Parent: Instance,
    LayoutOrder: number?,
    Height: number?,
    UserId: number?,
    Icon: string?,
    Title: string?,
    Subtitle: string?,
    ThumbnailSize: number?,
    Selectable: PlayerCardSelectableConfig?,
    Button: PlayerCardButtonConfig?,
    Footer: ((card: PlayerCard) -> ())?,
    AnimateIn: boolean?,
}

-- ============================================================
-- Misc widgets
-- ============================================================

export type NumberInput = {
    Instance: GuiObject,
    Value: number,
    SetValue: (v: number) -> (),
}

type NumberInputConfig = {
    Parent: Instance,
    Label: string?,
    Placeholder: string?,
    Default: number?,
    LayoutOrder: number?,
    OnChanged: ((value: number) -> ())?,
}

export type DSLNumberInputHandle = {
    GetValue: () -> number,
    SetValue: (value: number) -> (),
    Destroy: () -> (),
}

type DSLNumberInputConfig = {
    Label: string?,
    Placeholder: string?,
    Default: number?,
    OnChanged: ((value: number) -> ())?,
}

-- ============================================================
-- Selectable list (generic over an optional custom payload `T`)
-- ============================================================

-- `T` lets callers attach a strongly typed payload to each item instead of
-- stuffing extra fields into ItemData or reaching for `any`. Callers that
-- don't need one can leave it as the default `nil`.
export type ItemData<T = nil> = {
    Key: ItemKey,
    UserId: number?,
    Icon: string?,
    Instance: Instance?,
    Title: string?,
    Subtitle: string?,
    Selected: boolean?,
    Locked: boolean?,
    -- Explicit visual order. When set, items keep this order even if they
    -- are added out of sequence (e.g. from parallel/async calls) — the
    -- underlying UIListLayout always sorts by LayoutOrder, never by
    -- insertion time, so callers get deterministic ordering by declaring
    -- it once in the data instead of relying on call timing.
    LayoutOrder: number?,
    Data: T?,
}

export type RunTarget<T = nil> = {
    Current: ItemData<T>,
    List: { ItemData<T> },
    Looping: boolean,
}

export type ActionControl = {
    Start: () -> (),
    End: () -> (),
}

export type SelectableList<T = nil> = {
    ButtonText: string,
    Screen: GuiObject,
    AddItem: (itemData: ItemData<T>) -> (),
    RemoveItem: (key: ItemKey) -> (),
    SetItemSelected: (key: ItemKey, value: boolean, silent: boolean?) -> (),
    IsItemSelected: (key: ItemKey) -> boolean,
    GetSelected: () -> { ItemData<T> },
    SetLocked: (value: boolean) -> (),
    IsLocked: () -> boolean,
    SetItemLocked: (key: ItemKey, value: boolean) -> (),
    IsItemLocked: (key: ItemKey) -> boolean,
    UpdateItem: (itemData: ItemData<T>) -> (),
    Refresh: (targets: { ItemData<T> }) -> (),
    Destroy: (() -> ())?,
}

type SelectableListMode = "Instant" | "SingleSelect" | "MultiSelect"

type HeaderBuilder = (
    content: Instance,
    createNumberInput: (NumberInputConfig) -> NumberInput,
    addOption: (text: string, initial: boolean?, onChanged: ((boolean) -> ())?) -> CheckboxOption
) -> ()

export type SelectableListConfig<T = nil> = {
    Mode: SelectableListMode?,
    ButtonText: string?,
    ActionText: string?,
    ItemColors: ColorSetOverride?,
    ShowSelectAll: boolean?,
    SelectAllText: string?,
    Targets: { ItemData<T> }?,
    Header: HeaderBuilder?,
    -- Instant 전용: 항목마다 뜨는 "실행" 버튼.
    OnAction: ((itemData: ItemData<T>, control: ActionControl) -> ())?,
    OnActionStart: ((itemData: ItemData<T>, card: PlayerCard) -> ())?,
    OnActionEnd: ((itemData: ItemData<T>, card: PlayerCard) -> ())?,
    -- SingleSelect/MultiSelect 전용. 버튼 없음 — 선택이 바뀔 때마다(클릭할
    -- 때마다) 그 순간의 선택 상태를 그대로 전달한다. Run 버튼을 만들고 싶으면
    -- 그건 SelectableList의 관심사가 아니라 Screen.Button 쪽에서 별도로
    -- 만들고, 여기 OnChange로 받은 선택 상태를 참조하면 된다.
    OnChange: ((target: RunTarget<T>) -> ())?,
}

export type PlayerSelectableListConfig<T = nil> = SelectableListConfig<T> & {
    ExcludeLocalPlayer: boolean?,
    AutoSelectText: string?,
    IsPlayerSelected: ((player: Player) -> boolean)?,
    IsPlayerLocked: ((player: Player) -> boolean)?,
}


-- ============================================================
-- Screen DSL (CreateScreen)
-- ============================================================

type ListItem<T = nil> = {
    -- Explicit key. Omit it to fall back to the item's position in the
    -- Items array (matches the old index-only behavior), or set it when
    -- callers need a stable/custom identity (e.g. a name) instead.
    Key: ItemKey?,
    Img: string?,
    Title: string?,
    SubTitle: string?,
    -- Arbitrary payload carried through to RunTarget<T> untouched — lets
    -- callers attach custom data (coordinates, ids, ...) to a list item
    -- without having to re-look it up from a parallel array afterwards.
    Data: T?,
}

type DSLInstantConfig = {
    ButtonText: string,
    Description: string?,
    OnAction: () -> (),
    -- 지정하면 nextOrder() 대신 이 값을 그대로 LayoutOrder로 사용한다.
    -- 화면 맨 아래에 항상 고정해야 하는 버튼(팀 추가 등 동적으로 위쪽에
    -- 요소가 계속 늘어나는 경우)에 큰 값을 줘서 위치를 고정할 때 쓴다.
    LayoutOrder: number?,
}

type DSLToggleConfig = {
    ButtonText: string,
    Description: string?,
    -- 반환값이 그대로 OnAfterEnd의 인자로 전달된다 (GetSnapshot/SetSnapshot
    -- 같은 짝 함수 패턴).
    OnBeforeStart: (() -> unknown)?,
    OnStart: (() -> ())?,
    OnEnd: (() -> ())?,
    OnAfterEnd: ((setupValue: unknown) -> ())?,
}

type DSLLoopConfig = {
    ButtonText: string,
    Description: string?,
    -- 반환값이 그대로 OnAfterEnd의 인자로 전달된다 (GetSnapshot/SetSnapshot
    -- 같은 짝 함수 패턴).
    OnBeforeStart: (() -> unknown)?,
    OnStart: (() -> ())?,
    OnAction: (() -> ())?,
    OnEnd: (() -> ())?,
    OnAfterEnd: ((setupValue: unknown) -> ())?,
}

type DSLCheckboxConfig = {
    ButtonText: string,
    Description: string?,
    OnAction: (value: boolean) -> (),
}

-- Button.Checkbox가 리턴하는 핸들. 외부에서 강제로 체크 상태를 바꿔야 할 때
-- (예: 여러 체크박스 중 하나만 켜지는 라디오 그룹) 사용한다.
export type DSLCheckboxHandle = {
    SetChecked: (value: boolean, silent: boolean?) -> (),
    IsChecked: () -> boolean,
    Destroy: () -> (),
}

type DSLButtonNamespace = {
    Instant: (config: DSLInstantConfig) -> (),
    Toggle: (config: DSLToggleConfig) -> (),
    Loop: (config: DSLLoopConfig) -> (),
    Checkbox: (config: DSLCheckboxConfig) -> DSLCheckboxHandle,
}

-- Input은 Button 소속이 아니다: 텍스트 입력 + 실행 버튼 + 결과 표시(Result)까지
-- 묶인 별개의 위젯(TextRunner)이라서 Screen.TextRunner로 노출한다. Button.*는
-- 결과를 보여줄 자리가 없는 순수 버튼들만 다룬다.
export type DSLTextRunnerConfig = {
    ButtonText: string?,
    Description: string?,
    Placeholder: string?,
    -- 반환값이 그대로 결과 라벨에 표시된다.
    OnRun: (text: string) -> string,
}

export type DSLSelectableListInstantConfig<T = nil> = {
    Items: { ListItem<T> },
    -- Instant는 클릭한 항목이 항상 정확히 하나이므로 RunTarget으로 감싸지
    -- 않고 그 항목 자체를 그대로 넘긴다.
    OnClick: (item: ItemData<T>) -> (),
}

export type DSLSelectableListChangeConfig<T = nil> = {
    Items: { ListItem<T> },
    -- SingleSelect/MultiSelect는 버튼이 없다 — 선택 여부만 결정한다.
    -- 클릭/토글로 선택이 바뀔 때마다 그 순간의 선택 상태를 그대로 전달한다
    -- (SingleSelect: target.Current, MultiSelect: target.List).
    OnChange: (target: RunTarget<T>) -> (),
}

-- Handle returned by SelectableList.Instant/SingleSelect/MultiSelect.
-- Wraps the underlying SelectableList<T> so callers can update the list
-- after creation (e.g. re-scan the world every Heartbeat) without having
-- to reach past the DSL into internal Create* functions. Refresh/AddItem/
-- UpdateItem take the same ListItem<T> shape used to build Items, so
-- callers never need to hand-build ItemData<T> or manage Key indices
-- themselves.
export type DSLSelectableListHandle<T = nil> = {
    Refresh: (items: { ListItem<T> }) -> (),
    AddItem: (item: ListItem<T>) -> (),
    UpdateItem: (item: ListItem<T>) -> (),
    RemoveItem: (key: ItemKey) -> (),
    SetItemSelected: (key: ItemKey, value: boolean, silent: boolean?) -> (),
    IsItemSelected: (key: ItemKey) -> boolean,
    GetSelected: () -> { ItemData<T> },
    SetLocked: (value: boolean) -> (),
    IsLocked: () -> boolean,
    SetItemLocked: (key: ItemKey, value: boolean) -> (),
    IsItemLocked: (key: ItemKey) -> boolean,
}

type DSLSelectableListNamespace = {
    Instant: <T>(config: DSLSelectableListInstantConfig<T>) -> DSLSelectableListHandle<T>,
    SingleSelect: <T>(config: DSLSelectableListChangeConfig<T>) -> DSLSelectableListHandle<T>,
    MultiSelect: <T>(config: DSLSelectableListChangeConfig<T>) -> DSLSelectableListHandle<T>,
}


export type DSLPlayerListInstantConfig = {
    -- Instant는 클릭한 대상이 항상 정확히 한 명이므로 배열로 감싸지 않고
    -- 그 플레이어를 그대로 넘긴다.
    OnClick: (player: Player) -> (),
    -- 기본값 true(로컬 플레이어 제외). 명시적으로 false를 줘야 목록에 포함된다.
    ExcludeLocalPlayer: boolean?,
}

export type DSLPlayerListSingleChangeConfig = {
    -- 버튼 없음 — 선택이 바뀔 때마다 그 순간 선택된 플레이어 목록을 그대로 전달.
    OnChange: (player: Player?) -> (),
    -- 기본값 true(로컬 플레이어 제외). 명시적으로 false를 줘야 목록에 포함된다.
    ExcludeLocalPlayer: boolean?,
    -- 생성 시점에 "이 플레이어는 잠겨야 하는가"를 판단하는 콜백. 리스트가
    -- (재)렌더링될 때마다 각 플레이어에 대해 호출된다.
    IsPlayerLocked: ((player: Player) -> boolean)?,
}

export type DSLPlayerListChangeConfig = {
    -- 버튼 없음 — 선택이 바뀔 때마다 그 순간 선택된 플레이어 목록을 그대로 전달.
    OnChange: (players: { Player }) -> (),
    -- 기본값 true(로컬 플레이어 제외). 명시적으로 false를 줘야 목록에 포함된다.
    ExcludeLocalPlayer: boolean?,
    IsPlayerLocked: ((player: Player) -> boolean)?,
}

-- PlayerSelectableList.SingleSelect/MultiSelect가 리턴하는 핸들. Player 키는
-- 항상 player.UserId를 쓴다 (CreatePlayerSelectableList 내부와 동일).
export type DSLPlayerListHandle = {
    SetItemSelected: (userId: ItemKey, value: boolean, silent: boolean?) -> (),
    IsItemSelected: (userId: ItemKey) -> boolean,
    GetSelected: () -> { ItemData<nil> },
    SetLocked: (value: boolean) -> (),
    IsLocked: () -> boolean,
    SetItemLocked: (userId: ItemKey, value: boolean) -> (),
    IsItemLocked: (userId: ItemKey) -> boolean,
    -- PlayerSync 등록 해제 + 리스트 UI(Screen)까지 함께 제거한다.
    Destroy: () -> (),
}

type DSLPlayerListNamespace = {
    Instant: (config: DSLPlayerListInstantConfig) -> (),
    SingleSelect: (config: DSLPlayerListSingleChangeConfig) -> DSLPlayerListHandle,
    MultiSelect: (config: DSLPlayerListChangeConfig) -> DSLPlayerListHandle,
}

export type ScreenConfig = {
    TabName: string,
    LayoutOrder: number?,
    -- false면 사이드바 탭 글씨가 Locked 색(빨강 계열)으로 표시되고 클릭해도
    -- 탭이 열리지 않는다. 화면 자체를 아예 안 만드는 것과 달리, 탭이 계속
    -- 보이되 잠긴 상태로만 남는다. 기본값 true.
    Active: boolean?,
}

export type Screen = {
    ButtonText: string,
    Screen: GuiObject,
    LayoutOrder: number?,
    Active: boolean?,
    DescriptionButton: DSLButtonNamespace,
    Button: DSLButtonNamespace,
    SectionText: (config: { Text: string }) -> { Destroy: () -> () },
    SelectableList: DSLSelectableListNamespace,
    PlayerSelectableList: DSLPlayerListNamespace,
    TextRunner: (config: DSLTextRunnerConfig) -> TextRunner,
    NumberInput: (config: DSLNumberInputConfig) -> DSLNumberInputHandle, -- 추가
}

-- ============================================================
-- Main GUI
-- ============================================================

type MainGuiScreenData = {
    ButtonText: string,
    -- Accepts either a raw GuiObject, or the {ButtonText, Screen, ...}
    -- handle returned by CreateHomeScreen / CreateScreen /
    -- (내부) CreatePlayerSelectableList. Passing the whole
    -- handle (instead of remembering to unwrap `.Screen` yourself) is a
    -- common call-site pattern, so addScreen auto-unwraps it below rather
    -- than silently parenting a plain data table and showing nothing.
    Screen: GuiObject | { Screen: GuiObject },
    -- Explicit tab order. When several addScreen calls are fired from
    -- task.spawn (or otherwise run concurrently/out of order — e.g. one
    -- does a yielding thumbnail fetch and finishes after a later call),
    -- arrival order is not reliable. Passing LayoutOrder pins the tab (and
    -- which one starts selected) to the order you intend, independent of
    -- which call actually finishes first. Omit it to fall back to plain
    -- call order (fine for purely synchronous addScreen/addScreens use).
    LayoutOrder: number?,
    -- false면 탭 글씨가 Locked 색으로 바뀌고 클릭해도 안 열린다. CreateScreen이
    -- 반환하는 Screen을 그대로 넘기면 Screen.Active가 자동으로 여기 실린다.
    Active: boolean?,
}

type MainGui = {
    ScreenGui: ScreenGui,
    MainHolder: Frame,
    Frame: CanvasGroup,
    Left: ScrollingFrame,
    Right: CanvasGroup,
    addScreen: (screenData: MainGuiScreenData) -> (),
    -- Batch variant of addScreen: adds several tabs in one call, in the
    -- order given. Equivalent to calling addScreen in a loop, provided so
    -- callers adding many screens at once (e.g. built from a data list)
    -- don't have to hand-roll the loop themselves.
    addScreens: (screens: { MainGuiScreenData }) -> (),
}

type MainGuiConfig = {
    Title: string?,
    OnClose: (() -> ())?,
}

type HomeScreenConfig = {
    LayoutOrder: number?,
    UserId: number?,
    DisplayName: string?,
    Username: string?,
    GameIcon: string?,
    GameName: string?,
    PlayerCountText: string?,
    GameDescription: string?,
}

type HomeScreen = {
    ButtonText: string,
    Screen: GuiObject,
    LayoutOrder: number?,
    SetPlayerCount: (text: string) -> (),
}

export type UI = {
    CreateMainGui: (config: MainGuiConfig?) -> MainGui,
    CreateHomeScreen: (config: HomeScreenConfig) -> HomeScreen,
    CreateScreen: (config: ScreenConfig) -> Screen,
}

return function(Tools: ToolsType, Manager: ManagerType): UI
    local UI: UI = {} :: any

    local function Tween(obj: Instance, info: TweenInfo, props: { [string]: any }, onComplete: (() -> ())?)
        local tween = TweenService:Create(obj, info, props)
        if onComplete then
            Tools.Events.ConnectEvent(tween.Completed, function()
                onComplete()
            end)
        end
        tween:Play()
        return tween
    end

    local function PlayEntranceAnimation(instance: GuiObject, offsetX: number?)
        local offX = offsetX or 34

        task.defer(function()
            if not instance or not instance.Parent then return end

            local originalPosition = instance.Position

            type TransparencyTarget = { Object: Instance, Prop: string, Value: number }
            local transparencyTargets: { TransparencyTarget } = {}
            local function capture(obj: Instance, prop: string)
                table.insert(transparencyTargets, { Object = obj, Prop = prop, Value = (obj :: any)[prop] })
            end

            if instance:IsA("GuiObject") then
                capture(instance, "BackgroundTransparency")
            end

            for _, desc in ipairs(instance:GetDescendants()) do
                if desc:IsA("UIStroke") then
                    capture(desc, "Transparency")
                elseif desc:IsA("TextLabel") or desc:IsA("TextButton") or desc:IsA("TextBox") then
                    capture(desc, "TextTransparency")
                    if desc:IsA("GuiButton") then
                        capture(desc, "BackgroundTransparency")
                    end
                elseif desc:IsA("ImageLabel") or desc:IsA("ImageButton") then
                    capture(desc, "ImageTransparency")
                end
            end

            instance.Position = originalPosition + UDim2.new(0, offX, 0, 0)
            for _, t in ipairs(transparencyTargets) do
                (t.Object :: any)[t.Prop] = 1
            end

            Tween(instance, ANIM.Enter, { Position = originalPosition })
            for _, t in ipairs(transparencyTargets) do
                Tween(t.Object, ANIM.Normal, { [t.Prop] = t.Value })
            end
        end)
    end

    local function PlayExitAnimation(instance: GuiObject, onComplete: (() -> ())?)
        if not instance or not instance.Parent then
            if onComplete then onComplete() end
            return
        end

        if instance:IsA("GuiObject") then
            instance.ClipsDescendants = true
        end

        local targetSize = UDim2.new(instance.Size.X.Scale, instance.Size.X.Offset, 0, 0)

        local done = false
        local function finish()
            if done then return end
            done = true
            if onComplete then onComplete() end
        end

        Tween(instance, ANIM.Exit, { Size = targetSize }, finish)

        if instance:IsA("GuiObject") then
            Tween(instance, ANIM.Exit, { BackgroundTransparency = 1 })
        end

        task.delay(ANIM.Exit.Time + 0.05, finish)
    end

    local function PlayRippleEffect(screenGui: ScreenGui?, matchSize: UDim2?)
        if not screenGui then return end
        local size = matchSize or UDim2.new(0.6, 0, 0.6, 0)

        local Ripple = Instance.new("Frame")
        Ripple.Name = "RippleEffect"
        Ripple.AnchorPoint = Vector2.new(0.5, 0.5)
        Ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
        Ripple.Size = size
        Ripple.BackgroundColor3 = Palette.Accent
        Ripple.BackgroundTransparency = 0.4
        Ripple.BorderSizePixel = 0
        Ripple.ZIndex = 10000
        Ripple.Parent = screenGui

        Tools.Frame.Round(Ripple, UDim.new(1, 0))

        local RippleScale = Instance.new("UIScale")
        RippleScale.Scale = 0.05
        RippleScale.Parent = Ripple

        local RippleStroke = Instance.new("UIStroke")
        RippleStroke.Color = Palette.AccentStroke
        RippleStroke.Thickness = 3
        RippleStroke.Transparency = 0.1
        RippleStroke.Parent = Ripple

        Tween(RippleScale, ANIM.Ripple, { Scale = 3 })
        Tween(Ripple, ANIM.Ripple, { BackgroundTransparency = 1 })
        Tween(RippleStroke, ANIM.Ripple, { Transparency = 1 }, function()
            Ripple:Destroy()
        end)
    end

    local function CreateClickRipple(parent: Instance, x: number, y: number)
        local Ripple = Instance.new("Frame")
        Ripple.Name = "ClickRipple"
        Ripple.AnchorPoint = Vector2.new(0.5, 0.5)
        Ripple.Position = UDim2.new(0, x, 0, y)
        Ripple.Size = UDim2.new(0, 0, 0, 0)
        Ripple.BackgroundColor3 = Palette.Accent
        Ripple.BackgroundTransparency = 0.35
        Ripple.BorderSizePixel = 0
        Ripple.ZIndex = 50
        Ripple.Parent = parent

        Tools.Frame.Round(Ripple, UDim.new(1, 0))

        local RippleStroke = Instance.new("UIStroke")
        RippleStroke.Color = Palette.AccentStroke
        RippleStroke.Thickness = 1.5
        RippleStroke.Transparency = 0.4
        RippleStroke.Parent = Ripple

        local info = TweenInfo.new(0.55, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        Tween(Ripple, info, {
            Size = UDim2.new(0, 170, 0, 170),
            BackgroundTransparency = 1,
        }, function()
            Ripple:Destroy()
        end)
        Tween(RippleStroke, info, { Transparency = 1 })
    end

    type PlayerSyncListener = {
        OnPlayerAdded: ((player: Player) -> ())?,
        OnPlayerRemoving: ((player: Player) -> ())?,
    }

    local PlayerSync = {}
    do
        local listeners: { PlayerSyncListener } = {}

        function PlayerSync.Register(listener: PlayerSyncListener): PlayerSyncListener
            table.insert(listeners, listener)
            return listener
        end

        function PlayerSync.Unregister(listener: PlayerSyncListener)
            for i, l in ipairs(listeners) do
                if l == listener then
                    table.remove(listeners, i)
                    break
                end
            end
        end

        Tools.Events.ConnectEvent(Players.PlayerAdded, function(player: Player)
            for _, listener in ipairs(listeners) do
                if listener.OnPlayerAdded then
                    listener.OnPlayerAdded(player)
                end
            end
        end)

        Tools.Events.ConnectEvent(Players.PlayerRemoving, function(player: Player)
            for _, listener in ipairs(listeners) do
                if listener.OnPlayerRemoving then
                    listener.OnPlayerRemoving(player)
                end
            end
        end)
    end

    local function CreateSelectableButton(config: SelectableButtonConfig): SelectableButton?
        if not (config.Parent or config.TargetInstance) then
            warn("CreateSelectableButton: Parent or TargetInstance is required")
            return nil
        end

        local Mode: SelectableButtonMode = config.Mode or "Action"
        local Colors = mergeColors(DEFAULT_BUTTON_COLORS, config.Colors)

        local self: SelectableButton = {
            Mode = Mode,
            Colors = Colors,
            Selected = config.Initial or false,
            Group = config.Group,
            Locked = config.Locked or false,
            _hovering = false,
            _textConfig = config.Text,
        } :: SelectableButton

        local Button = config.TargetInstance
        if not Button then
            local NewButton = Instance.new("TextButton")
            NewButton.Name = "SelectableButton"
            NewButton.Size = config.Size or UDim2.new(1, 0, 0, 36)
            NewButton.AutoButtonColor = false
            NewButton.BackgroundTransparency = Colors.Idle.BackgroundTransparency
            NewButton.BackgroundColor3 = Colors.Idle.Background
            NewButton.Text = ""
            NewButton.Parent = config.Parent

            Tools.Frame.Round(NewButton, config.CornerRadius or UDim.new(0, 8))
            Button = NewButton
        end
        self.Instance = Button :: GuiButton

        local Stroke = config.TargetStroke
        if not Stroke then
            local NewStroke = Instance.new("UIStroke")
            NewStroke.Thickness = 1
            NewStroke.Parent = Button
            Stroke = NewStroke
        end
        self.Stroke = Stroke :: UIStroke

        if self._textConfig ~= nil then
            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Size = UDim2.new(1, -16, 1, 0)
            Label.Position = UDim2.new(0, 8, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.GothamBold
            Label.TextSize = 13
            Label.TextXAlignment = config.TextAlign or Enum.TextXAlignment.Center
            Label.Parent = self.Instance
            self.Label = Label
        end

        local function resolveText(): string
            local textConfig = self._textConfig
            if type(textConfig) == "function" then
                return textConfig(self.Selected)
            end
            return textConfig or ""
        end

        -- Resolve a ColorSetState to its StateColors without any dynamic
        -- indexing — an unmatched state is a compile-time exhaustiveness
        -- gap, not a silent `nil` from an `any`-typed lookup.
        local function resolveStateColors(stateName: ColorSetState): StateColors?
            if stateName == "Idle" then return self.Colors.Idle
            elseif stateName == "Hover" then return self.Colors.Hover
            elseif stateName == "Selected" then return self.Colors.Selected
            elseif stateName == "Locked" then return self.Colors.Locked
            elseif stateName == "LockedSelected" then return self.Colors.LockedSelected
            end
            return nil
        end

        local function applyState(stateName: ColorSetState)
            local c = resolveStateColors(stateName)
            if not c then return end

            Tween(self.Instance, ANIM.Fast, {
                BackgroundColor3 = c.Background,
                BackgroundTransparency = c.BackgroundTransparency,
            })
            Tween(self.Stroke, ANIM.Fast, {
                Color = c.Stroke,
                Transparency = c.StrokeTransparency,
            })
            if self.Label then
                self.Label.Text = resolveText()
                Tween(self.Label :: Instance, ANIM.Fast, { TextColor3 = c.Text })
            end
        end

        function self.Render(selfArg: SelectableButton)
            if selfArg.Locked then
                if selfArg.Selected and selfArg.Colors.LockedSelected then
                    applyState("LockedSelected")
                else
                    applyState("Locked")
                end
            elseif selfArg.Selected then
                applyState("Selected")
            elseif selfArg._hovering then
                applyState("Hover")
            else
                applyState("Idle")
            end
        end

        function self.SetSelected(selfArg: SelectableButton, value: boolean, silent: boolean?)
            if selfArg.Selected == value then return end
            selfArg.Selected = value
            selfArg:Render()
            if not silent and config.OnStateChanged then
                config.OnStateChanged(selfArg, selfArg.Selected)
            end
        end

        function self.SetLocked(selfArg: SelectableButton, value: boolean)
            if selfArg.Locked == value then return end
            selfArg.Locked = value
            selfArg:Render()
        end

        -- Hover가 만드는 MouseEnter/Leave Connection들. Tools.Frame.Hover가
        -- 아직 반환값을 안 주는 구버전이면 hoverConns가 nil이 되므로, 그 경우
        -- 빈 배열로 대체해 아래 취합 로직이 깨지지 않게 한다.
        local hoverConns = Tools.Frame.Hover(self.Instance,
            function()
                self._hovering = false
                self:Render()
            end,
            function()
                self._hovering = true
                self:Render()
            end
        ) or {}

        local clickConn = Tools.Events.ConnectEvent((self.Instance :: TextButton).MouseButton1Click, function()
            if self.Locked then
                if config.OnLockedClick then
                    config.OnLockedClick(self)
                end
                return
            end

            if Mode == "Single" then
                local group = self.Group
                if not group then
                    warn("CreateSelectableButton: Group is required when Mode is 'Single'")
                    return
                end
                if group.Current ~= self then
                    local current = group.Current
                    if current then
                        current:SetSelected(false)
                    end
                    group.Current = self
                    self:SetSelected(true)
                end
            elseif Mode == "Toggle" then
                self:SetSelected(not self.Selected)
            end

            if config.OnClick then
                config.OnClick(self, self.Selected)
            end
        end)

        self._connections = { clickConn }
        for _, conn in ipairs(hoverConns) do
            table.insert(self._connections, conn)
        end

        self:Render()
        if Mode == "Single" and self.Selected and self.Group then
            self.Group.Current = self
        end

        return self
    end

    local function CreateCheckboxOption(config: CheckboxOptionConfig): CheckboxOption?
        if not config.Parent then
            warn("CreateCheckboxOption: Parent is required")
            return nil
        end

        local self: CheckboxOption = {
            Checked = config.Initial or false,
        } :: any

        local Holder = Instance.new("TextButton")
        Holder.Name = "CheckboxOption"
        Holder.AutoButtonColor = false
        Holder.BackgroundTransparency = 1
        Holder.Text = ""
        Holder.Size = UDim2.new(0, 0, 0, CHECKBOX_SIZE)
        Holder.AutomaticSize = Enum.AutomaticSize.X
        Holder.LayoutOrder = config.LayoutOrder or 1
        Holder.Parent = config.Parent

        local HolderLayout = Instance.new("UIListLayout")
        HolderLayout.FillDirection = Enum.FillDirection.Horizontal
        HolderLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        HolderLayout.Padding = UDim.new(0, 8)
        HolderLayout.Parent = Holder

        local Box = Instance.new("Frame")
        Box.Name = "Box"
        Box.Size = UDim2.new(0, CHECKBOX_SIZE, 0, CHECKBOX_SIZE)
        Box.BackgroundColor3 = Palette.Card
        Box.BorderSizePixel = 0
        Box.LayoutOrder = 1
        Box.Parent = Holder

        Tools.Frame.Round(Box, UDim.new(0, 5))

        local BoxStroke = Instance.new("UIStroke")
        BoxStroke.Color = Palette.CardStroke
        BoxStroke.Thickness = 1.5
        BoxStroke.Transparency = 0.3
        BoxStroke.Parent = Box

        local Check = Instance.new("TextLabel")
        Check.Name = "Check"
        Check.Size = UDim2.new(1, 0, 1, 0)
        Check.BackgroundTransparency = 1
        Check.Font = Enum.Font.GothamBold
        Check.Text = "✓"
        Check.TextSize = 13
        Check.TextColor3 = Palette.TextPrimary
        Check.TextTransparency = self.Checked and 0 or 1
        Check.Parent = Box

        local Label = Instance.new("TextLabel")
        Label.Name = "Label"
        Label.Size = UDim2.new(0, 0, 1, 0)
        Label.AutomaticSize = Enum.AutomaticSize.X
        Label.BackgroundTransparency = 1
        Label.Font = Enum.Font.Gotham
        Label.Text = config.Text or ""
        Label.TextSize = 13
        Label.TextColor3 = self.Checked and Palette.TextPrimary or Palette.TextMuted
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.LayoutOrder = 2
        Label.Parent = Holder

        self.Instance = Holder

        local function render()
            if self.Checked then
                Tween(Box, ANIM.Fast, { BackgroundColor3 = Palette.Accent })
                Tween(BoxStroke, ANIM.Fast, { Color = Palette.AccentStroke, Transparency = 0.2 })
                Tween(Check, ANIM.Fast, { TextTransparency = 0 })
                Tween(Label, ANIM.Fast, { TextColor3 = Palette.TextPrimary })
            else
                Tween(Box, ANIM.Fast, { BackgroundColor3 = Palette.Card })
                Tween(BoxStroke, ANIM.Fast, { Color = Palette.CardStroke, Transparency = 0.3 })
                Tween(Check, ANIM.Fast, { TextTransparency = 1 })
                Tween(Label, ANIM.Fast, { TextColor3 = Palette.TextMuted })
            end
        end

        function self.SetChecked(value: boolean, silent: boolean?)
            if self.Checked == value then return end
            self.Checked = value
            render()
            if not silent and config.OnChanged then
                config.OnChanged(self.Checked)
            end
        end

        Tools.Events.ConnectEvent(Holder.MouseButton1Click, function()
            self.SetChecked(not self.Checked)
        end)

        return self
    end

    -- 텍스트 입력 + 실행 버튼 + 결과 표시 위젯.
    -- OnRun의 반환값이 결과 라벨에 그대로 표시된다.
    local function CreateTextRunner(config: TextRunnerConfig): TextRunner
        local Holder = Instance.new("Frame")
        Holder.Name = "TextRunner"
        Holder.BackgroundTransparency = 1
        Holder.Size = UDim2.new(1, 0, 0, 0)
        Holder.AutomaticSize = Enum.AutomaticSize.Y
        Holder.LayoutOrder = config.LayoutOrder or 1
        if config.Parent then
            Holder.Parent = config.Parent
        end

        local HolderLayout = Instance.new("UIListLayout")
        HolderLayout.FillDirection = Enum.FillDirection.Vertical
        HolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
        HolderLayout.Padding = UDim.new(0, 10)
        HolderLayout.Parent = Holder

        -- ── [입력칸] [실행버튼] ──────────────────────────────
        local Row = Instance.new("Frame")
        Row.Name = "Row"
        Row.BackgroundTransparency = 1
        Row.Size = UDim2.new(1, 0, 0, 36)
        Row.LayoutOrder = 1
        Row.Parent = Holder

        local labelWidth = 0
        if config.Label then
            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Size = UDim2.new(0, 60, 1, 0)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.GothamBold
            Label.TextSize = 13
            Label.TextColor3 = Palette.TextMuted
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Text = config.Label
            Label.Parent = Row
            labelWidth = 60
        end

        local runButtonWidth = 72

        local Box = Instance.new("TextBox")
        Box.Name = "Box"
        Box.Size = UDim2.new(1, -(labelWidth + runButtonWidth + 8), 1, 0)
        Box.Position = UDim2.new(0, labelWidth, 0, 0)
        Box.BackgroundColor3 = Palette.Card
        Box.TextColor3 = Palette.TextPrimary
        Box.PlaceholderText = config.Placeholder or ""
        Box.Text = ""
        Box.Font = Enum.Font.Gotham
        Box.TextSize = 13
        Box.ClearTextOnFocus = false
        Box.Parent = Row

        Tools.Frame.Round(Box, UDim.new(0, 8))

        local BoxStroke = Instance.new("UIStroke")
        BoxStroke.Color = Palette.CardStroke
        BoxStroke.Thickness = 1
        BoxStroke.Transparency = 0.5
        BoxStroke.Parent = Box

        local self: TextRunner = {
            Instance = Holder,
            Screen = Holder,
            Text = "",
            Result = "",
        } :: any

        -- ── 결과 박스: 내용이 없어도 항상 일정 크기로 보이는 박스 ──
        local ResultBox = Instance.new("Frame")
        ResultBox.Name = "ResultBox"
        ResultBox.BackgroundColor3 = Palette.Card
        ResultBox.BackgroundTransparency = 0
        ResultBox.BorderSizePixel = 0
        ResultBox.Size = UDim2.new(1, 0, 0, 80)
        ResultBox.AutomaticSize = Enum.AutomaticSize.Y
        ResultBox.LayoutOrder = 2
        ResultBox.Parent = Holder

        Tools.Frame.Round(ResultBox, UDim.new(0, 8))

        local ResultBoxStroke = Instance.new("UIStroke")
        ResultBoxStroke.Color = Palette.CardStroke
        ResultBoxStroke.Thickness = 1
        ResultBoxStroke.Transparency = 0.5
        ResultBoxStroke.Parent = ResultBox

        local ResultBoxSizeConstraint = Instance.new("UISizeConstraint")
        ResultBoxSizeConstraint.MinSize = Vector2.new(0, 80)
        ResultBoxSizeConstraint.Parent = ResultBox

        local ResultBoxPadding = Instance.new("UIPadding")
        ResultBoxPadding.PaddingTop = UDim.new(0, 10)
        ResultBoxPadding.PaddingBottom = UDim.new(0, 10)
        ResultBoxPadding.PaddingLeft = UDim.new(0, 10)
        ResultBoxPadding.PaddingRight = UDim.new(0, 10)
        ResultBoxPadding.Parent = ResultBox

        -- 결과 라벨 (실행 후 값 표시, 기본은 빈 텍스트 — 박스 자체는 항상 존재)
        local ResultLabel = Instance.new("TextLabel")
        ResultLabel.Name = "Result"
        ResultLabel.Size = UDim2.new(1, 0, 1, 0)
        ResultLabel.BackgroundTransparency = 1
        ResultLabel.Font = Enum.Font.Gotham
        ResultLabel.TextSize = 13
        ResultLabel.TextColor3 = Palette.TextPrimary
        ResultLabel.TextXAlignment = Enum.TextXAlignment.Left
        ResultLabel.TextYAlignment = Enum.TextYAlignment.Top
        ResultLabel.TextWrapped = true
        ResultLabel.Text = ""
        ResultLabel.Parent = ResultBox

        function self.SetResult(result: string)
            self.Result = result
            ResultLabel.Text = result
        end

        local function runNow()
            self.Text = Box.Text
            if config.OnRun then
                local result = config.OnRun(self.Text)
                self.SetResult(result)
            end
        end

        local RunButton = CreateSelectableButton({
            Parent = Row,
            Mode = "Action",
            -- 실행 버튼 텍스트: addScreen의 ButtonText(탭 이름)와 헷갈리지
            -- 않도록 RunButtonText 필드를 사용한다.
            Text = config.RunButtonText or "실행",
            Size = UDim2.new(0, runButtonWidth, 1, 0),
            CornerRadius = UDim.new(0, 8),
            Colors = mergeColors(DEFAULT_ACTION_COLORS, nil),
            OnClick = function()
                runNow()
            end,
        })
        if RunButton then
            RunButton.Instance.AnchorPoint = Vector2.new(1, 0.5)
            RunButton.Instance.Position = UDim2.new(1, 0, 0.5, 0)
        end

        Tools.Events.ConnectEvent(Box.FocusLost, function(enterPressed)
            if enterPressed then
                runNow()
            end
        end)

        return self
    end

    local function CreatePlayerCard(config: PlayerCardConfig): PlayerCard?
        if not config.Parent then
            warn("CreatePlayerCard: Parent is required")
            return nil
        end

        local card: PlayerCard = {} :: any
        local height = config.Height or 72

        -- Build the concrete instance without an `any` cast: both branches
        -- satisfy GuiObject, which is all the shared setup below needs.
        local Card: GuiObject
        if config.Selectable then
            local Btn = Instance.new("TextButton")
            Btn.AutoButtonColor = false
            Btn.Text = ""
            Card = Btn
        else
            Card = Instance.new("Frame")
        end

        Card.Name = "PlayerCard"
        Card.Size = UDim2.new(1, 0, 0, height)
        Card.BackgroundColor3 = Palette.Card
        Card.BorderSizePixel = 0
        Card.LayoutOrder = config.LayoutOrder or 1
        Card.Parent = config.Parent

        Tools.Frame.Round(Card, UDim.new(0, 12))

        local Stroke = Instance.new("UIStroke")
        Stroke.Color = Palette.CardStroke
        Stroke.Thickness = 1
        Stroke.Transparency = 0.5
        Stroke.Parent = Card

        card.Instance = Card

        local avatarSize = config.ThumbnailSize or 52
        local textLeft = (config.UserId or config.Icon) and (avatarSize + 20) or 10

        if config.UserId or config.Icon then
            local Avatar = Instance.new("ImageLabel")
            Avatar.Name = "Avatar"
            Avatar.Size = UDim2.new(0, avatarSize, 0, avatarSize)
            Avatar.Position = UDim2.new(0, 10, 0, 10)
            Avatar.BackgroundColor3 = Color3.fromRGB(40, 40, 46)
            Avatar.BorderSizePixel = 0
            Avatar.Image = config.UserId
                and Tools.Players.GetThumbnail(config.UserId, { Type = "AvatarHeadShot", Width = 180, Height = 180 })
                or config.Icon
            Avatar.Parent = Card

            Tools.Frame.Round(Avatar, config.UserId and UDim.new(1, 0) or UDim.new(0, 10))

            local AvatarStroke = Instance.new("UIStroke")
            AvatarStroke.Color = Color3.fromRGB(60, 60, 68)
            AvatarStroke.Thickness = 1
            AvatarStroke.Transparency = 0.2
            AvatarStroke.Parent = Avatar

            card.Avatar = Avatar
        end

        local buttonWidth = config.Button and (config.Button.Width or 90) or 0
        local rightGap = config.Button and (buttonWidth + 20) or 10

        local TitleLabel = Instance.new("TextLabel")
        TitleLabel.Name = "Title"
        TitleLabel.Size = UDim2.new(1, -(textLeft + rightGap), 0, 20)
        TitleLabel.Position = UDim2.new(0, textLeft, 0, 12)
        TitleLabel.BackgroundTransparency = 1
        TitleLabel.Font = Enum.Font.GothamBold
        TitleLabel.Text = config.Title or ""
        TitleLabel.TextSize = 15
        TitleLabel.TextColor3 = Palette.TextPrimary
        TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        TitleLabel.TextTruncate = Enum.TextTruncate.AtEnd
        TitleLabel.Parent = Card
        card.TitleLabel = TitleLabel

        local SubtitleLabel = Instance.new("TextLabel")
        SubtitleLabel.Name = "Subtitle"
        SubtitleLabel.Size = UDim2.new(1, -(textLeft + rightGap), 0, 16)
        SubtitleLabel.Position = UDim2.new(0, textLeft, 0, 34)
        SubtitleLabel.BackgroundTransparency = 1
        SubtitleLabel.Font = Enum.Font.Gotham
        SubtitleLabel.Text = config.Subtitle or ""
        SubtitleLabel.TextSize = 12
        SubtitleLabel.TextColor3 = Palette.TextMuted
        SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        SubtitleLabel.TextTruncate = Enum.TextTruncate.AtEnd
        SubtitleLabel.Parent = Card
        card.SubtitleLabel = SubtitleLabel

        if config.Button then
            local bc = config.Button
            card.Button = CreateSelectableButton({
                Parent = Card,
                Text = bc.Text,
                Mode = bc.Mode or "Action",
                Group = bc.Group,
                Initial = bc.Initial,
                Colors = bc.Colors,
                Size = UDim2.new(0, buttonWidth, 0, 32),
                CornerRadius = UDim.new(0, 8),
                OnClick = bc.OnClick and function(btn, isSelected)
                    bc.OnClick(btn, isSelected, card)
                end or nil,
                OnStateChanged = bc.OnStateChanged and function(btn, isSelected)
                    bc.OnStateChanged(btn, isSelected, card)
                end or nil,
            })
            if card.Button then
                card.Button.Instance.Position = UDim2.new(1, -(buttonWidth + 10), 0.5, -16)
            end
        end

        if config.Selectable then
            local sc = config.Selectable
            card.Selectable = CreateSelectableButton({
                TargetInstance = Card :: GuiButton,
                TargetStroke = Stroke,
                Mode = sc.Mode or "Toggle",
                Group = sc.Group,
                Initial = sc.Initial,
                Colors = mergeColors(DEFAULT_CARD_SELECT_COLORS, sc.Colors),
                OnClick = sc.OnClick and function(btn, isSelected)
                    sc.OnClick(btn, isSelected, card)
                end or nil,
                OnStateChanged = sc.OnStateChanged and function(btn, isSelected)
                    sc.OnStateChanged(btn, isSelected, card)
                end or nil,
            })
        end

        if config.Footer then
            config.Footer(card)
        end

        if config.AnimateIn ~= false then
            PlayEntranceAnimation(Card)
        end

        -- 이 카드에 딸린 Button/Selectable이 만든 Connection들을 한데
        -- 모아둔다. RemoveItem이 카드를 지우기 직전 이걸 전부 Disconnect한다.
        local connections: { { Disconnect: () -> () } } = {}
        if card.Button then
            for _, conn in ipairs(card.Button._connections) do
                table.insert(connections, conn)
            end
        end
        if card.Selectable then
            for _, conn in ipairs(card.Selectable._connections) do
                table.insert(connections, conn)
            end
        end
        card._connections = connections

        return card
    end

    local function CreateNumberInput(config: NumberInputConfig): NumberInput
        local Holder = Instance.new("Frame")
        Holder.Name = (config.Label or "Input") .. "Holder"
        Holder.BackgroundTransparency = 1
        Holder.Size = UDim2.new(1, 0, 0, 36)
        Holder.LayoutOrder = config.LayoutOrder or 1
        Holder.Parent = config.Parent

        local Label = Instance.new("TextLabel")
        Label.Name = "Label"
        Label.Size = UDim2.new(0, 70, 1, 0)
        Label.BackgroundTransparency = 1
        Label.Font = Enum.Font.GothamBold
        Label.TextSize = 13
        Label.TextColor3 = Palette.TextMuted
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Text = config.Label or ""
        Label.Parent = Holder

        local Box = Instance.new("TextBox")
        Box.Name = "Box"
        Box.Size = UDim2.new(1, -70, 1, 0)
        Box.Position = UDim2.new(0, 70, 0, 0)
        Box.BackgroundColor3 = Palette.Card
        Box.TextColor3 = Palette.TextPrimary
        Box.PlaceholderText = config.Placeholder or "0"
        Box.Text = tostring(config.Default or 0)
        Box.Font = Enum.Font.Gotham
        Box.TextSize = 13
        Box.ClearTextOnFocus = false
        Box.Parent = Holder

        Tools.Frame.Round(Box, UDim.new(0, 8))

        local Stroke = Instance.new("UIStroke")
        Stroke.Color = Palette.CardStroke
        Stroke.Thickness = 1
        Stroke.Transparency = 0.5
        Stroke.Parent = Box

        local self: NumberInput = {
            Instance = Holder,
            Value = config.Default or 0,
        } :: any

        local function commit()
            local n = tonumber(Box.Text)
            if n then
                self.Value = n
            end
            Box.Text = tostring(self.Value)
            if config.OnChanged then
                config.OnChanged(self.Value)
            end
        end

        Tools.Events.ConnectEvent(Box.FocusLost, commit)

        function self.SetValue(v: number)
            self.Value = v
            Box.Text = tostring(v)
        end

        return self
    end

    local function CreateSelectableList<T>(config: SelectableListConfig<T>): SelectableList<T>
        local Mode: SelectableListMode = config.Mode or "Instant"

        local cards: { [ItemKey]: GuiObject } = {}
        local cardObjects: { [ItemKey]: PlayerCard } = {}
        local itemDataByKey: { [ItemKey]: ItemData<T> } = {}
        local singleGroup: { Current: SelectableButton? } = { Current = nil }
        local selectedKeys: { [ItemKey]: boolean? } = {}
        local lockedKeys: { [ItemKey]: boolean? } = {}

        local listLocked = false
        local SelectAllButton: CheckboxOption? = nil

        local Content = Instance.new("Frame")
        Content.Name = "SelectableListContent"
        Content.BackgroundTransparency = 1
        Content.Size = UDim2.new(1, 0, 0, 0)
        Content.AutomaticSize = Enum.AutomaticSize.Y

        local Layout = Instance.new("UIListLayout")
        Layout.FillDirection = Enum.FillDirection.Vertical
        Layout.SortOrder = Enum.SortOrder.LayoutOrder
        Layout.Padding = UDim.new(0, 10)
        Layout.Parent = Content

        local ItemsHolder = Instance.new("Frame")
        ItemsHolder.Name = "Items"
        ItemsHolder.BackgroundTransparency = 1
        ItemsHolder.Size = UDim2.new(1, 0, 0, 0)
        ItemsHolder.AutomaticSize = Enum.AutomaticSize.Y
        ItemsHolder.LayoutOrder = 1
        ItemsHolder.Parent = Content

        local ItemsLayout = Instance.new("UIListLayout")
        ItemsLayout.FillDirection = Enum.FillDirection.Vertical
        ItemsLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ItemsLayout.Padding = UDim.new(0, 10)
        ItemsLayout.Parent = ItemsHolder

        local OptionsRow: Frame? = nil

        local function EnsureOptionsRow(): Frame
            if OptionsRow then return OptionsRow end

            local Row = Instance.new("Frame")
            Row.Name = "OptionsRow"
            Row.BackgroundTransparency = 1
            Row.Size = UDim2.new(1, 0, 0, CHECKBOX_SIZE)
            Row.LayoutOrder = -1
            Row.Parent = Content

            local RowLayout = Instance.new("UIListLayout")
            RowLayout.FillDirection = Enum.FillDirection.Horizontal
            RowLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            RowLayout.Padding = UDim.new(0, 24)
            RowLayout.Parent = Row

            OptionsRow = Row
            return Row
        end

        local function AddOption(text: string, initial: boolean?, onChanged: ((boolean) -> ())?): CheckboxOption
            -- CreateCheckboxOption is `?` because Parent is validated at
            -- runtime; here Parent is always supplied by EnsureOptionsRow,
            -- so the assert documents the invariant instead of casting past it.
            local option = CreateCheckboxOption({
                Parent = EnsureOptionsRow(),
                Text = text,
                Initial = initial,
                OnChanged = onChanged,
            })
            assert(option, "CreateCheckboxOption unexpectedly returned nil despite a valid Parent")
            return option
        end

        if config.Header then
            config.Header(Content, CreateNumberInput, AddOption)
        end

        local function currentSelection(): ItemData<T> | { ItemData<T> } | nil
            if Mode == "SingleSelect" then
                local current = singleGroup.Current
                if current and current._itemKey then
                    return itemDataByKey[current._itemKey]
                end
                return nil
            elseif Mode == "MultiSelect" then
                local selected: { ItemData<T> } = {}
                for key in pairs(selectedKeys) do
                    table.insert(selected, itemDataByKey[key])
                end
                return #selected > 0 and selected or nil
            end
            return nil
        end

        -- SingleSelect/MultiSelect 전용: 클릭/토글로 선택이 바뀔 때마다 그
        -- 순간의 선택 상태를 그대로 전달한다. 버튼은 여기서 만들지 않는다 —
        -- 필요하면 호출부가 Screen.Button으로 따로 만들고 이 OnChange로
        -- 받은 선택 상태를 참조하면 된다.
        local function fireChange()
            if not config.OnChange then return end

            if Mode == "SingleSelect" then
                local current = currentSelection() :: ItemData<T>?
                -- List는 일부러 비워둔다: unwrapPlayers 등에서 Current/List를
                -- 중복으로 세지 않도록 함.
                config.OnChange({ Current = current, Looping = false } :: any)
            elseif Mode == "MultiSelect" then
                local selected = (currentSelection() :: { ItemData<T> }?) or {}
                config.OnChange({ List = selected, Looping = false } :: any)
            end
        end

        local function ApplyLockToCard(card: PlayerCard)
            if card.Button then
                card.Button:SetLocked(listLocked)
            end
            if card.Selectable then
                card.Selectable:SetLocked(listLocked)
            end
        end

        local function SetListLocked(value: boolean)
            if listLocked == value then return end
            listLocked = value
            for _, card in pairs(cardObjects) do
                ApplyLockToCard(card)
            end
        end

        local function SetItemSelected(key: ItemKey, value: boolean, silent: boolean?)
            local card = cardObjects[key]
            if not card or not card.Selectable then return end
            if lockedKeys[key] then return end

            if Mode == "SingleSelect" then
                if value then
                    if singleGroup.Current ~= card.Selectable then
                        if singleGroup.Current then
                            singleGroup.Current:SetSelected(false, silent)
                        end
                        singleGroup.Current = card.Selectable
                        card.Selectable:SetSelected(true, silent)
                    end
                else
                    if singleGroup.Current == card.Selectable then
                        singleGroup.Current = nil
                    end
                    card.Selectable:SetSelected(false, silent)
                end
            else
                card.Selectable:SetSelected(value, silent)
            end
        end

        local function refreshSelectAllState()
            if not SelectAllButton then return end

            local total = 0
            local selectedCount = 0
            for key in pairs(cardObjects) do
                if not lockedKeys[key] then
                    total = total + 1
                    if selectedKeys[key] then
                        selectedCount = selectedCount + 1
                    end
                end
            end

            SelectAllButton.SetChecked(total > 0 and selectedCount == total, true)
        end

        if Mode == "MultiSelect" and config.ShowSelectAll ~= false then
            SelectAllButton = AddOption(config.SelectAllText or "Select All", false, function(isChecked)
                for key in pairs(cardObjects) do
                    if not lockedKeys[key] then
                        SetItemSelected(key, isChecked)
                    end
                end
            end)
        end

        local function ApplyItemLock(card: PlayerCard, value: boolean)
            if card.Selectable then card.Selectable:SetLocked(value) end
            if card.Button then card.Button:SetLocked(value) end
        end

        local function SetItemLocked(key: ItemKey, value: boolean)
            lockedKeys[key] = value or nil
            local card = cardObjects[key]
            if card then
                ApplyItemLock(card, value)
            end
            if Mode == "MultiSelect" then
                refreshSelectAllState()
            end
        end

        local function AddItem(itemData: ItemData<T>, animate: boolean?)
            if cards[itemData.Key] then return end

            local shouldAnimate = animate
            if shouldAnimate == nil then
                shouldAnimate = true
            end

            if itemData.UserId and itemData.Instance == nil then
                itemData.Instance = Players:GetPlayerByUserId(itemData.UserId)
            end

            local cardConfig: PlayerCardConfig = {
                Parent = ItemsHolder,
                -- Uses the caller-declared LayoutOrder (data), not
                -- insertion order, so items keep a stable position even
                -- when AddItem/Refresh calls arrive out of sequence (e.g.
                -- from several parallel/async sources).
                LayoutOrder = itemData.LayoutOrder or 1,
                Height = 72,
                UserId = itemData.UserId,
                Icon = itemData.Icon,
                Title = itemData.Title,
                Subtitle = itemData.Subtitle,
                AnimateIn = shouldAnimate,
            }

            if Mode == "Instant" then
                cardConfig.Button = {
                    Text = config.ActionText or "Run",
                    Mode = "Action",
                    Width = 90,
                    Colors = mergeColors(DEFAULT_ACTION_COLORS, config.ItemColors),
                    OnClick = function()
                        if not config.OnAction then return end

                        -- 클로저로 잡힌 itemData가 아니라, Refresh/UpdateItem으로
                        -- 최신화된 itemDataByKey를 조회한다. 이렇게 해야 좌표 등
                        -- 커스텀 필드가 실행 시점의 최신 값으로 전달된다.
                        local currentData = itemDataByKey[itemData.Key] or itemData

                        local ended = false
                        local control: ActionControl = {} :: any

                        function control.Start()
                            if listLocked then return end
                            SetListLocked(true)
                            if config.OnActionStart then
                                config.OnActionStart(currentData, cardObjects[itemData.Key])
                            end
                        end

                        function control.End()
                            if ended then return end
                            ended = true
                            SetListLocked(false)
                            if config.OnActionEnd then
                                config.OnActionEnd(currentData, cardObjects[itemData.Key])
                            end
                        end

                        config.OnAction(currentData, control)
                    end,
                }
            elseif Mode == "SingleSelect" then
                cardConfig.Selectable = {
                    Mode = "Single",
                    Group = singleGroup,
                    Colors = config.ItemColors,
                    OnStateChanged = function(_, isSelected)
                        if isSelected then
                            fireChange()
                        end
                    end,
                }
            elseif Mode == "MultiSelect" then
                cardConfig.Selectable = {
                    Mode = "Toggle",
                    Colors = config.ItemColors,
                    OnStateChanged = function(_, isSelected)
                        selectedKeys[itemData.Key] = isSelected or nil
                        fireChange()
                        refreshSelectAllState()
                    end,
                }
            end

            local card = CreatePlayerCard(cardConfig)
            if not card then return end
            card.Instance.Name = "Item_" .. tostring(itemData.Key)

            if card.Selectable then
                card.Selectable._itemKey = itemData.Key
            end

            cards[itemData.Key] = card.Instance
            cardObjects[itemData.Key] = card
            itemDataByKey[itemData.Key] = itemData

            if itemData.Selected and (Mode == "SingleSelect" or Mode == "MultiSelect") then
                SetItemSelected(itemData.Key, true)
            end

            if Mode == "MultiSelect" then
                refreshSelectAllState()
            end

            if listLocked then
                ApplyLockToCard(card)
            end

            if itemData.Locked then
                lockedKeys[itemData.Key] = true
            end
            if lockedKeys[itemData.Key] then
                ApplyItemLock(card, true)
            end
        end

        local function RemoveItem(key: ItemKey)
            local instance = cards[key]
            if not instance then return end

            local card = cardObjects[key]

            local wasSelected = false
            if Mode == "SingleSelect" then
                wasSelected = singleGroup.Current ~= nil and singleGroup.Current._itemKey == key
            elseif Mode == "MultiSelect" then
                wasSelected = selectedKeys[key] == true
            end

            cards[key] = nil
            cardObjects[key] = nil
            itemDataByKey[key] = nil
            selectedKeys[key] = nil
            lockedKeys[key] = nil
            if singleGroup.Current and singleGroup.Current._itemKey == key then
                singleGroup.Current = nil
            end

            PlayExitAnimation(instance, function()
                -- 카드가 만든 Hover/Click 등 Connection들을 인스턴스 Destroy
                -- 전에 명시적으로 끊는다. 안 그러면 Context.Connections에
                -- 죽은 참조가 계속 쌓여서 시간이 지날수록 CPU가 우상향한다.
                if card and card._connections then
                    for _, conn in ipairs(card._connections) do
                        conn.Disconnect()
                    end
                end
                instance:Destroy()
            end)

            if Mode == "MultiSelect" then
                refreshSelectAllState()
            end

            if wasSelected then
                fireChange()
            end
        end

        local function UpdateItem(itemData: ItemData<T>)
            local card = cardObjects[itemData.Key]
            if not card then return end

            -- 최신 데이터로 교체: 이걸 빼먹으면 Position 같은 커스텀 필드가
            -- 처음 AddItem 했을 때의 값으로 영원히 고정된다.
            itemDataByKey[itemData.Key] = itemData

            -- 순서: LayoutOrder가 갱신되면 즉시 반영해 재배치되도록 한다.
            if itemData.LayoutOrder then
                card.Instance.LayoutOrder = itemData.LayoutOrder
            end

            -- 텍스트
            if card.TitleLabel then
                card.TitleLabel.Text = itemData.Title or ""
            end

            if card.SubtitleLabel then
                card.SubtitleLabel.Text = itemData.Subtitle or ""
            end

            -- 아바타
            if card.Avatar then
                if itemData.Icon then
                    card.Avatar.Image = itemData.Icon
                elseif itemData.UserId then
                    card.Avatar.Image = Tools.Players.GetThumbnail(
                        itemData.UserId,
                        {
                            Type = "AvatarHeadShot",
                            Width = 180,
                            Height = 180
                        }
                    )
                end
            end

            -- 선택 상태
            if itemData.Selected and card.Selectable then
                SetItemSelected(itemData.Key, true)
            end

            -- 잠금 상태
            if itemData.Locked then
                ApplyItemLock(card, true)
            else
                ApplyItemLock(card, false)
            end
        end

        local function IsItemSelected(key: ItemKey): boolean
            if Mode == "SingleSelect" then
                return singleGroup.Current ~= nil and singleGroup.Current._itemKey == key
            elseif Mode == "MultiSelect" then
                return selectedKeys[key] == true
            end
            return false
        end

        -- Returns every currently-selected item as a plain array (empty if
        -- nothing is selected), regardless of Mode. Unlike currentSelection
        -- (internal, returns a single item OR an array OR nil depending on
        -- Mode), this always has one shape so external callers — e.g. an
        -- OnLoop on a *different* list that needs "who's currently checked
        -- over there" — don't have to branch on Mode or handle nil.
        local function GetSelected(): { ItemData<T> }
            local selected: { ItemData<T> } = {}
            if Mode == "SingleSelect" then
                local current = singleGroup.Current
                if current and current._itemKey and itemDataByKey[current._itemKey] then
                    table.insert(selected, itemDataByKey[current._itemKey])
                end
            elseif Mode == "MultiSelect" then
                for key in pairs(selectedKeys) do
                    if itemDataByKey[key] then
                        table.insert(selected, itemDataByKey[key])
                    end
                end
            end
            return selected
        end

        -- 새 targets 배열과 현재 목록을 비교(diff)해서
        -- 새 항목은 AddItem, 사라진 항목은 RemoveItem, 남은 항목은
        -- UpdateItem으로 처리한다. 반복 폴링 시 호출부에서는 이 함수
        -- 하나만 호출하면 된다. 여러 개를 한 번에 넘겨도(배열), 각 항목의
        -- LayoutOrder가 최종 배치를 결정하므로 배열 순서와 무관하게
        -- 안전하다.
        local function Refresh(newTargets: { ItemData<T> })
            local seen: { [ItemKey]: boolean } = {}

            for _, itemData in ipairs(newTargets) do
                seen[itemData.Key] = true
                if cardObjects[itemData.Key] then
                    UpdateItem(itemData)
                else
                    AddItem(itemData, true)
                end
            end

            -- pairs 순회 도중 테이블에서 키를 지우면 순회가 깨질 수 있으므로
            -- 제거 대상만 먼저 모아뒀다가 순회가 끝난 뒤에 지운다.
            local toRemove: { ItemKey } = {}
            for key in pairs(cardObjects) do
                if not seen[key] then
                    table.insert(toRemove, key)
                end
            end
            for _, key in ipairs(toRemove) do
                RemoveItem(key)
            end
        end

        if config.Targets then
            for _, itemData in ipairs(config.Targets) do
                AddItem(itemData, false)
            end
        end

        return {
            ButtonText = config.ButtonText or "List",
            Screen = Content,
            AddItem = function(itemData)
                AddItem(itemData, true)
            end,
            RemoveItem = RemoveItem,
            SetItemSelected = SetItemSelected,
            IsItemSelected = IsItemSelected,
            GetSelected = GetSelected,
            SetLocked = SetListLocked,
            IsLocked = function()
                return listLocked
            end,
            SetItemLocked = SetItemLocked,
            IsItemLocked = function(key)
                return lockedKeys[key] == true
            end,
            UpdateItem = UpdateItem,
            Refresh = Refresh,
        }
    end

    local function CreatePlayerSelectableList<T>(config: PlayerSelectableListConfig<T>): SelectableList<T>
        local Mode: SelectableListMode = config.Mode or "Instant"
        local ExcludeLocalPlayer = config.ExcludeLocalPlayer
        if ExcludeLocalPlayer == nil then ExcludeLocalPlayer = true end

        local rememberedUserIds: { [number]: boolean } = {}
        local autoSelectEnabled = false

        local function toItemData(player: Player): ItemData<T>
            local selected = false
            if config.IsPlayerSelected then
                selected = config.IsPlayerSelected(player) and true or false
            end

            local locked = false
            if config.IsPlayerLocked then
                locked = config.IsPlayerLocked(player) and true or false
            end

            return {
                Key = player.UserId,
                UserId = player.UserId,
                Instance = player,
                Title = player.DisplayName,
                Subtitle = "@" .. player.Name,
                Selected = selected,
                Locked = locked,
            }
        end

        local originalHeader = config.Header

        -- Explicit field copy instead of `pairs(config)` + `any` indexing,
        -- so this stays checked against SelectableListConfig<T>.
        local listConfig: SelectableListConfig<T> = {
            Mode = config.Mode,
            ButtonText = config.ButtonText,
            ActionText = config.ActionText,
            ItemColors = config.ItemColors,
            ShowSelectAll = config.ShowSelectAll,
            SelectAllText = config.SelectAllText,
            Targets = config.Targets,
            Header = config.Header,
            OnAction = config.OnAction,
            OnActionStart = config.OnActionStart,
            OnActionEnd = config.OnActionEnd,
            OnChange = config.OnChange,
        }

        if Mode == "MultiSelect" then
            listConfig.Header = function(content, createNumberInput, addOption)
                if originalHeader then
                    originalHeader(content, createNumberInput, addOption)
                end

                addOption(config.AutoSelectText or "Auto Select", false, function(isChecked)
                    autoSelectEnabled = isChecked
                end)
            end
        end

        local listScreen = CreateSelectableList(listConfig)

        local syncListener: PlayerSyncListener = {
            OnPlayerAdded = function(player)
                if ExcludeLocalPlayer and player == Players.LocalPlayer then return end

                listScreen.AddItem(toItemData(player))

                if Mode == "MultiSelect" then
                    if autoSelectEnabled or rememberedUserIds[player.UserId] then
                        listScreen.SetItemSelected(player.UserId, true)
                    end
                end
            end,

            OnPlayerRemoving = function(player)
                if Mode == "MultiSelect" and listScreen.IsItemSelected(player.UserId) then
                    rememberedUserIds[player.UserId] = true
                end
                listScreen.RemoveItem(player.UserId)
            end,
        }
        for _, player in ipairs(Players:GetPlayers()) do
            if not (ExcludeLocalPlayer and player == Players.LocalPlayer) then
                listScreen.AddItem(toItemData(player))
            end
        end

        PlayerSync.Register(syncListener)

        listScreen.Destroy = function()
            PlayerSync.Unregister(syncListener)
        end

        return listScreen
    end
    function UI.CreateScreen(config: ScreenConfig): Screen
        local Content = Instance.new("Frame")
        Content.Name = (config.TabName or "Screen") .. "Content"
        Content.BackgroundTransparency = 1
        Content.Size = UDim2.new(1, 0, 0, 0)
        Content.AutomaticSize = Enum.AutomaticSize.Y

        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.FillDirection = Enum.FillDirection.Vertical
        ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContentLayout.Padding = UDim.new(0, 10)
        ContentLayout.Parent = Content

        local orderCounter = 0
        local function nextOrder(): number
            orderCounter += 1
            return orderCounter
        end

        -- Description 버튼 계열의 "[ 텍스트 [ 버튼 ] ]" 행을 만든다.
        -- Description이 없으면(=Button 네임스페이스) 행을 만들지 않고
        -- nil을 돌려줘서, 버튼이 Content에 곧장 꽂혀 "[ 버튼 ]" 하나만
        -- 남도록 한다.
        local function makeDescriptionRow(description: string?, layoutOrder: number): Frame?
            if not description or description == "" then
                return nil
            end
            local Holder = Instance.new("Frame")
            Holder.Name = "Row"
            Holder.BackgroundTransparency = 1
            Holder.Size = UDim2.new(1, 0, 0, 36)
            Holder.LayoutOrder = layoutOrder
            Holder.Parent = Content

            local Label = Instance.new("TextLabel")
            Label.Name = "Description"
            Label.Size = UDim2.new(1, -130, 1, 0)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.Gotham
            Label.Text = description
            Label.TextSize = 13
            Label.TextColor3 = Palette.TextMuted
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = Holder

            return Holder
        end

        local function anchorRight(button: SelectableButton?)
            if not button then return end
            button.Instance.AnchorPoint = Vector2.new(1, 0.5)
            button.Instance.Position = UDim2.new(1, 0, 0.5, 0)
        end

        -- hasDescription=true -> DescriptionButton ("[ 텍스트 [ 버튼 ] ]")
        -- hasDescription=false -> Button ("[ 버튼 ]" 만)
        local function makeButtonNamespace(hasDescription: boolean): DSLButtonNamespace
            return {
                Instant = function(cfg: DSLInstantConfig)
                    local order = cfg.LayoutOrder or nextOrder()
                    local description = hasDescription and cfg.Description or nil
                    local row = makeDescriptionRow(description, order)
                    local btn = CreateSelectableButton({
                        Parent = row or Content,
                        Mode = "Action",
                        Text = cfg.ButtonText,
                        Size = row and UDim2.new(0, 120, 0, 32) or UDim2.new(1, 0, 0, 40),
                        CornerRadius = UDim.new(0, 8),
                        OnClick = function()
                            cfg.OnAction()
                        end,
                    })
                    if row then
                        anchorRight(btn)
                    elseif btn then
                        btn.Instance.LayoutOrder = order
                    end
                end,

                Toggle = function(cfg: DSLToggleConfig)
                    local order = nextOrder()
                    local description = hasDescription and cfg.Description or nil
                    local row = makeDescriptionRow(description, order)
                    local setupValue: unknown = nil
                    local btn = CreateSelectableButton({
                        Parent = row or Content,
                        Mode = "Toggle",
                        Text = cfg.ButtonText,
                        Size = row and UDim2.new(0, 120, 0, 32) or UDim2.new(1, 0, 0, 40),
                        CornerRadius = UDim.new(0, 8),
                        OnStateChanged = function(_, isSelected: boolean)
                            if isSelected then
                                if cfg.OnBeforeStart then setupValue = cfg.OnBeforeStart() end
                                if cfg.OnStart then cfg.OnStart() end
                            else
                                if cfg.OnEnd then cfg.OnEnd() end
                                if cfg.OnAfterEnd then cfg.OnAfterEnd(setupValue) end
                                setupValue = nil
                            end
                        end,
                    })
                    if row then
                        anchorRight(btn)
                    elseif btn then
                        btn.Instance.LayoutOrder = order
                    end
                end,

                -- Toggle과 같은 온/오프 버튼이지만, 켜져 있는 동안
                -- OnAction이 매 프레임 반복 호출된다는 점만 다르다.
                Loop = function(cfg: DSLLoopConfig)
                    local order = nextOrder()
                    local description = hasDescription and cfg.Description or nil
                    local row = makeDescriptionRow(description, order)
                    local Running = false
                    local setupValue: unknown = nil
                    local btn = CreateSelectableButton({
                        Parent = row or Content,
                        Mode = "Toggle",
                        Text = cfg.ButtonText,
                        Size = row and UDim2.new(0, 120, 0, 32) or UDim2.new(1, 0, 0, 40),
                        CornerRadius = UDim.new(0, 8),
                        OnStateChanged = function(_, isSelected: boolean)
                            if isSelected then
                                if cfg.OnBeforeStart then setupValue = cfg.OnBeforeStart() end
                                Running = true
                                if cfg.OnStart then cfg.OnStart() end
                                task.spawn(function()
                                    while Running do
                                        if cfg.OnAction then cfg.OnAction() end
                                        task.wait()
                                    end
                                end)
                            else
                                Running = false
                                if cfg.OnEnd then cfg.OnEnd() end
                                if cfg.OnAfterEnd then cfg.OnAfterEnd(setupValue) end
                                setupValue = nil
                            end
                        end,
                    })
                    if row then
                        anchorRight(btn)
                    elseif btn then
                        btn.Instance.LayoutOrder = order
                    end
                end,

                Checkbox = function(cfg: DSLCheckboxConfig): DSLCheckboxHandle
                    local order = nextOrder()
                    local option = CreateCheckboxOption({
                        Parent = Content,
                        Text = (hasDescription and cfg.Description) or cfg.ButtonText,
                        Initial = false,
                        LayoutOrder = order,
                        OnChanged = function(value: boolean)
                            cfg.OnAction(value)
                        end,
                    })
                    assert(option, "CreateCheckboxOption unexpectedly returned nil despite a valid Parent")
                    return {
                        SetChecked = option.SetChecked,
                        IsChecked = function()
                            return option.Checked
                        end,
                        Destroy = function()
                            option.Instance:Destroy()
                        end,
                    }
                end,
            }
        end

        local function toTargets<T>(items: { ListItem<T> }): { ItemData<T> }
            local targets = {}
            for index, item in ipairs(items) do
                targets[index] = {
                    -- Explicit Key wins; otherwise fall back to array
                    -- position, same as the old index-only behavior.
                    Key = item.Key or index,
                    Icon = item.Img,
                    Title = item.Title,
                    Subtitle = item.SubTitle,
                    Data = item.Data,
                }
            end
            return targets
        end

        -- Wraps a raw SelectableList<T> (from CreateSelectableList) into the
        -- DSL-facing handle: Refresh/AddItem/UpdateItem take ListItem<T> (the
        -- same shape callers already build for Items), converted via
        -- toTargets, so callers never touch ItemData<T> or Key bookkeeping
        -- directly. Everything else passes through unchanged.
        local function wrapSelectableListHandle<T>(list: SelectableList<T>): DSLSelectableListHandle<T>
            return {
                Refresh = function(items: { ListItem<T> })
                    list.Refresh(toTargets(items))
                end,
                AddItem = function(item: ListItem<T>)
                    list.AddItem(toTargets({ item })[1])
                end,
                UpdateItem = function(item: ListItem<T>)
                    list.UpdateItem(toTargets({ item })[1])
                end,
                RemoveItem = list.RemoveItem,
                SetItemSelected = list.SetItemSelected,
                IsItemSelected = list.IsItemSelected,
                GetSelected = list.GetSelected,
                SetLocked = list.SetLocked,
                IsLocked = list.IsLocked,
                SetItemLocked = list.SetItemLocked,
                IsItemLocked = list.IsItemLocked,
            }
        end

        local selectableListNamespace: DSLSelectableListNamespace = {
            -- 이전과 동일하게 RunTarget을 그대로 준다.
            Instant = function<T>(cfg: DSLSelectableListInstantConfig<T>)
                local order = nextOrder()
                local list = CreateSelectableList({
                    Mode = "Instant",
                    Targets = toTargets(cfg.Items),
                    OnAction = function(itemData, control)
                        control.Start()
                        cfg.OnClick(itemData)
                        control.End()
                    end,
                })
                list.Screen.LayoutOrder = order
                list.Screen.Parent = Content
                return wrapSelectableListHandle(list)
            end,

            SingleSelect = function<T>(cfg: DSLSelectableListChangeConfig<T>)
                local order = nextOrder()
                local list = CreateSelectableList({
                    Mode = "SingleSelect",
                    Targets = toTargets(cfg.Items),
                    -- 버튼 없음. 선택이 바뀔 때마다 OnChange만 호출된다.
                    OnChange = cfg.OnChange,
                })
                list.Screen.LayoutOrder = order
                list.Screen.Parent = Content
                return wrapSelectableListHandle(list)
            end,

            MultiSelect = function<T>(cfg: DSLSelectableListChangeConfig<T>)
                local order = nextOrder()
                local list = CreateSelectableList({
                    Mode = "MultiSelect",
                    Targets = toTargets(cfg.Items),
                    -- 버튼 없음. 선택이 바뀔 때마다 OnChange만 호출된다.
                    OnChange = cfg.OnChange,
                })
                list.Screen.LayoutOrder = order
                list.Screen.Parent = Content
                return wrapSelectableListHandle(list)
            end,
        }


        -- PlayerSelectableList는 RunTarget이 아니라 Player 배열을 그대로 준다.
        local function unwrapPlayers(target: RunTarget<nil>): { Player }
            local players = {}
            if target.Current then
                table.insert(players, target.Current.Instance :: Player)
            end
            if target.List then
                for _, itemData in ipairs(target.List) do
                    table.insert(players, itemData.Instance :: Player)
                end
            end
            return players
        end

        local playerSelectableListNamespace: DSLPlayerListNamespace = {
            Instant = function(cfg: DSLPlayerListInstantConfig)
                local order = nextOrder()
                local list = CreatePlayerSelectableList({
                    Mode = "Instant",
                    ExcludeLocalPlayer = cfg.ExcludeLocalPlayer,
                    OnAction = function(itemData, control)
                        control.Start()
                        cfg.OnClick(itemData.Instance :: Player)
                        control.End()
                    end,
                })
                list.Screen.LayoutOrder = order
                list.Screen.Parent = Content
            end,

            SingleSelect = function(cfg: DSLPlayerListSingleChangeConfig): DSLPlayerListHandle
                local order = nextOrder()
                local list = CreatePlayerSelectableList({
                    Mode = "SingleSelect",
                    ExcludeLocalPlayer = cfg.ExcludeLocalPlayer,
                    IsPlayerLocked = cfg.IsPlayerLocked,
                    OnChange = function(target)
                        cfg.OnChange(unwrapPlayers(target)[1])
                    end,
                })
                list.Screen.LayoutOrder = order
                list.Screen.Parent = Content
                return {
                    SetItemSelected = list.SetItemSelected,
                    IsItemSelected = list.IsItemSelected,
                    GetSelected = list.GetSelected,
                    SetLocked = list.SetLocked,
                    IsLocked = list.IsLocked,
                    SetItemLocked = list.SetItemLocked,
                    IsItemLocked = list.IsItemLocked,
                    Destroy = function()
                        if list.Destroy then list.Destroy() end
                        list.Screen:Destroy()
                    end,
                }
            end,

            MultiSelect = function(cfg: DSLPlayerListChangeConfig): DSLPlayerListHandle
                local order = nextOrder()
                local list = CreatePlayerSelectableList({
                    Mode = "MultiSelect",
                    ExcludeLocalPlayer = cfg.ExcludeLocalPlayer,
                    IsPlayerLocked = cfg.IsPlayerLocked,
                    -- 버튼 없음. 선택이 바뀔 때마다 그 순간 선택된 플레이어들을 전달.
                    OnChange = function(target)
                        cfg.OnChange(unwrapPlayers(target))
                    end,
                })
                list.Screen.LayoutOrder = order
                list.Screen.Parent = Content
                return {
                    SetItemSelected = list.SetItemSelected,
                    IsItemSelected = list.IsItemSelected,
                    GetSelected = list.GetSelected,
                    SetLocked = list.SetLocked,
                    IsLocked = list.IsLocked,
                    SetItemLocked = list.SetItemLocked,
                    IsItemLocked = list.IsItemLocked,
                    Destroy = function()
                        if list.Destroy then list.Destroy() end
                        list.Screen:Destroy()
                    end,
                }
            end,
        }

        local screen: Screen = {
            ButtonText = config.TabName,
            Screen = Content,
            LayoutOrder = config.LayoutOrder,
            Active = config.Active,
            DescriptionButton = makeButtonNamespace(true),
            Button = makeButtonNamespace(false),
            -- md로 치면 "# 텍스트" 느낌의 섹션 구분자.
            SectionText = function(cfg: { Text: string }): { Destroy: () -> () }
                local order = nextOrder()
                local Holder = Instance.new("Frame")
                Holder.Name = "SectionText"
                Holder.BackgroundTransparency = 1
                Holder.Size = UDim2.new(1, 0, 0, 26)
                Holder.LayoutOrder = order
                Holder.Parent = Content

                local Label = Instance.new("TextLabel")
                Label.Name = "Label"
                Label.BackgroundTransparency = 1
                Label.Size = UDim2.new(1, 0, 0, 20)
                Label.Font = Enum.Font.GothamBold
                Label.Text = cfg.Text
                Label.TextSize = 15
                Label.TextColor3 = Palette.TextPrimary
                Label.TextXAlignment = Enum.TextXAlignment.Left
                Label.Parent = Holder

                local Divider = Instance.new("Frame")
                Divider.Name = "Divider"
                Divider.BackgroundColor3 = Palette.CardStroke
                Divider.BackgroundTransparency = 0.4
                Divider.BorderSizePixel = 0
                Divider.Size = UDim2.new(1, 0, 0, 1)
                Divider.Position = UDim2.new(0, 0, 1, -2)
                Divider.Parent = Holder

                return {
                    Destroy = function()
                        Holder:Destroy()
                    end,
                }
            end,
            SelectableList = selectableListNamespace,
            PlayerSelectableList = playerSelectableListNamespace,
                        TextRunner = function(cfg: DSLTextRunnerConfig): TextRunner
                local order = nextOrder()
                local runner = CreateTextRunner({
                    Parent = Content,
                    Label = cfg.Description,
                    Placeholder = cfg.Placeholder,
                    RunButtonText = cfg.ButtonText,
                    LayoutOrder = order,
                    OnRun = cfg.OnRun,
                })
                runner.Instance.LayoutOrder = order
                return runner
            end,
            NumberInput = function(cfg: DSLNumberInputConfig): DSLNumberInputHandle
                local order = nextOrder()
                local input = CreateNumberInput({
                    Parent = Content,
                    Label = cfg.Label,
                    Placeholder = cfg.Placeholder,
                    Default = cfg.Default,
                    LayoutOrder = order,
                    OnChanged = cfg.OnChanged,
                })
                return {
                    GetValue = function()
                        return input.Value
                    end,
                    SetValue = input.SetValue,
                    Destroy = function()
                        input.Instance:Destroy()
                    end,
                }
            end,
        }

        return screen
    end

    function UI.CreateMainGui(config: MainGuiConfig?): MainGui
        local cfg = config or {}

        local CornerLarge = UDim.new(0, 14)
        local CornerPx = 14

        local ScreenGui = Manager.AddBaseGui()

        local MainHolder = Instance.new("Frame")
        MainHolder.Name = "MainHolder"
        MainHolder.AnchorPoint = Vector2.new(0.5, 0.5)
        MainHolder.Size = UDim2.new(0.6, 0, 0.6, 0)
        MainHolder.Position = UDim2.new(0.5, 0, 0.5, 0)
        MainHolder.BackgroundTransparency = 1
        MainHolder.Parent = ScreenGui
        MainHolder.ZIndex = 9999

        local HolderConstraint = Instance.new("UISizeConstraint")
        HolderConstraint.MinSize = Vector2.new(320, 240)
        HolderConstraint.MaxSize = Vector2.new(560, 420)
        HolderConstraint.Parent = MainHolder

        local WindowScale = Instance.new("UIScale")
        WindowScale.Scale = 0.55
        WindowScale.Parent = MainHolder

        local ShadowFrame = Instance.new("Frame")
        ShadowFrame.Size = UDim2.new(1, 16, 1, 16)
        ShadowFrame.Position = UDim2.new(0, -8, 0, -8)
        ShadowFrame.BackgroundColor3 = Color3.new(1, 1, 1)
        ShadowFrame.BackgroundTransparency = 0.97
        ShadowFrame.BorderSizePixel = 0
        ShadowFrame.ZIndex = 0
        ShadowFrame.Parent = MainHolder

        Tools.Frame.Round(ShadowFrame, CornerLarge)

        local Frame = Instance.new("CanvasGroup")
        Frame.Name = "MainFrame"
        Frame.Size = UDim2.fromScale(1, 1)
        Frame.BackgroundColor3 = Color3.fromRGB(28, 28, 33)
        Frame.BorderSizePixel = 0
        Frame.ClipsDescendants = true
        Frame.ZIndex = 1
        Frame.GroupTransparency = 1
        Frame.Parent = MainHolder

        local FrameSizeConstraint = Instance.new("UISizeConstraint")
        FrameSizeConstraint.MinSize = Vector2.new(320, 240)
        FrameSizeConstraint.MaxSize = Vector2.new(560, 420)
        FrameSizeConstraint.Parent = Frame

        Tools.Frame.Round(Frame, CornerLarge)

        local FrameStroke = Instance.new("UIStroke")
        FrameStroke.Color = Color3.fromRGB(50, 50, 58)
        FrameStroke.Thickness = 1
        FrameStroke.Transparency = 0.4
        FrameStroke.Parent = Frame

        local TopBar = Instance.new("Frame")
        TopBar.Name = "TopBar"
        TopBar.Size = UDim2.new(1, 0, 0, 40)
        TopBar.BackgroundColor3 = Palette.TopBar
        TopBar.BorderSizePixel = 0
        TopBar.Parent = Frame

        Tools.Frame.Round(TopBar, CornerLarge)

        local TopBarBottomMask = Instance.new("Frame")
        TopBarBottomMask.Name = "BottomMask"
        TopBarBottomMask.BackgroundColor3 = Palette.TopBar
        TopBarBottomMask.BorderSizePixel = 0
        TopBarBottomMask.Size = UDim2.new(1, 0, 0, CornerPx)
        TopBarBottomMask.Position = UDim2.new(0, 0, 1, -CornerPx)
        TopBarBottomMask.ZIndex = TopBar.ZIndex
        TopBarBottomMask.Parent = TopBar

        Tools.Frame.MakeDraggable(MainHolder, TopBar)

        local TitleLabel = Instance.new("TextLabel")
        TitleLabel.Name = "Title"
        TitleLabel.Size = UDim2.new(1, -88, 1, 0)
        TitleLabel.Position = UDim2.new(0, 14, 0, 0)
        TitleLabel.BackgroundTransparency = 1
        TitleLabel.Font = Enum.Font.GothamBold
        TitleLabel.Text = cfg.Title or "EclipseX"
        TitleLabel.TextSize = 14
        TitleLabel.TextColor3 = Palette.TextPrimary
        TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        TitleLabel.ZIndex = 2
        TitleLabel.Parent = TopBar

        local CloseBtn = Instance.new("TextButton")
        CloseBtn.Name = "CloseButton"
        CloseBtn.Size = UDim2.new(0, 32, 0, 32)
        CloseBtn.Position = UDim2.new(1, -36, 0.5, -16)
        CloseBtn.BackgroundTransparency = 1
        CloseBtn.AutoButtonColor = false
        CloseBtn.Font = Enum.Font.GothamBold
        CloseBtn.Text = "X"
        CloseBtn.TextSize = 14
        CloseBtn.TextColor3 = Palette.TextPrimary
        CloseBtn.ZIndex = 2
        CloseBtn.Parent = TopBar

        Tools.Frame.Round(CloseBtn, UDim.new(0, 8))

        local CloseBtnStroke = Instance.new("UIStroke")
        CloseBtnStroke.Color = Color3.fromRGB(50, 50, 58)
        CloseBtnStroke.Thickness = 1
        CloseBtnStroke.Transparency = 1
        CloseBtnStroke.Parent = CloseBtn

        Tools.Frame.Hover(CloseBtn,
            function()
                Tween(CloseBtn, ANIM.Fast, { BackgroundTransparency = 1 })
                Tween(CloseBtnStroke, ANIM.Fast, { Transparency = 1 })
            end,
            function()
                CloseBtn.BackgroundColor3 = Palette.Danger
                CloseBtnStroke.Color = Palette.DangerStroke
                Tween(CloseBtn, ANIM.Fast, { BackgroundTransparency = 0 })
                Tween(CloseBtnStroke, ANIM.Fast, { Transparency = 0.3 })
            end
        )

        Tools.Events.ConnectEvent(CloseBtn.MouseButton1Click, function()
            if cfg.OnClose then
                cfg.OnClose()
            end

            Tween(Frame, ANIM.Exit, { GroupTransparency = 1 }, function()
                ScreenGui:Destroy()
            end)
            Tween(WindowScale, ANIM.Exit, { Scale = 0.85 })
        end)

        local MinimizeBtn = Instance.new("TextButton")
        MinimizeBtn.Name = "MinimizeButton"
        MinimizeBtn.Size = UDim2.new(0, 32, 0, 32)
        MinimizeBtn.Position = UDim2.new(1, -72, 0.5, -16)
        MinimizeBtn.BackgroundTransparency = 1
        MinimizeBtn.AutoButtonColor = false
        MinimizeBtn.Font = Enum.Font.GothamBold
        MinimizeBtn.Text = "-"
        MinimizeBtn.TextSize = 18
        MinimizeBtn.TextColor3 = Palette.TextPrimary
        MinimizeBtn.ZIndex = 2
        MinimizeBtn.Parent = TopBar

        Tools.Frame.Round(MinimizeBtn, UDim.new(0, 8))

        local MinimizeBtnStroke = Instance.new("UIStroke")
        MinimizeBtnStroke.Color = Color3.fromRGB(50, 50, 58)
        MinimizeBtnStroke.Thickness = 1
        MinimizeBtnStroke.Transparency = 1
        MinimizeBtnStroke.Parent = MinimizeBtn

        Tools.Frame.Hover(MinimizeBtn,
            function()
                Tween(MinimizeBtn, ANIM.Fast, { BackgroundTransparency = 1 })
                Tween(MinimizeBtnStroke, ANIM.Fast, { Transparency = 1 })
            end,
            function()
                MinimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 46)
                MinimizeBtnStroke.Color = Color3.fromRGB(70, 70, 80)
                Tween(MinimizeBtn, ANIM.Fast, { BackgroundTransparency = 0.5 })
                Tween(MinimizeBtnStroke, ANIM.Fast, { Transparency = 0.2 })
            end
        )

        local LoadButton = Instance.new("TextButton")
        LoadButton.Name = "LoadButton"
        LoadButton.AnchorPoint = Vector2.new(0, 1)
        LoadButton.Position = UDim2.new(0, 16, 1, -16)
        LoadButton.Size = UDim2.new(0, 126, 0, 32)
        LoadButton.BackgroundColor3 = Palette.Accent
        LoadButton.BackgroundTransparency = 1
        LoadButton.AutoButtonColor = false
        LoadButton.Font = Enum.Font.GothamBold
        LoadButton.Text = "Load EclipseX"
        LoadButton.TextSize = 13
        LoadButton.TextTransparency = 1
        LoadButton.TextColor3 = Palette.TextPrimary
        LoadButton.Visible = false
        LoadButton.ZIndex = 9999
        LoadButton.Parent = ScreenGui

        Tools.Frame.Round(LoadButton, UDim.new(0, 8))

        local LoadButtonStroke = Instance.new("UIStroke")
        LoadButtonStroke.Color = Palette.AccentStroke
        LoadButtonStroke.Thickness = 1
        LoadButtonStroke.Transparency = 1
        LoadButtonStroke.Parent = LoadButton

        local LoadButtonScale = Instance.new("UIScale")
        LoadButtonScale.Scale = 0.4
        LoadButtonScale.Parent = LoadButton

        Tools.Frame.Hover(LoadButton,
            function()
                Tween(LoadButton, ANIM.Fast, { BackgroundColor3 = Palette.Accent })
            end,
            function()
                Tween(LoadButton, ANIM.Fast, { BackgroundColor3 = Color3.fromRGB(108, 152, 250) })
            end
        )

        local isMinimized = false

        local function MinimizeUI()
            if isMinimized then return end
            isMinimized = true

            Tween(Frame, ANIM.Exit, { GroupTransparency = 1 })
            Tween(WindowScale, ANIM.Exit, { Scale = 0.85 }, function()
                MainHolder.Visible = false

                LoadButton.Visible = true
                LoadButtonScale.Scale = 0.4
                LoadButton.BackgroundTransparency = 1
                LoadButtonStroke.Transparency = 1
                LoadButton.TextTransparency = 1

                Tween(LoadButtonScale, ANIM.Enter, { Scale = 1 })
                Tween(LoadButton, ANIM.Normal, { BackgroundTransparency = 0 })
                Tween(LoadButtonStroke, ANIM.Normal, { Transparency = 0.2 })
                Tween(LoadButton, ANIM.Normal, { TextTransparency = 0 })
            end)
        end

        local function RestoreUI()
            if not isMinimized then return end
            isMinimized = false

            Tween(LoadButtonScale, ANIM.Exit, { Scale = 0.4 })
            Tween(LoadButton, ANIM.Exit, { BackgroundTransparency = 1 })
            Tween(LoadButton, ANIM.Exit, { TextTransparency = 1 })
            Tween(LoadButtonStroke, ANIM.Exit, { Transparency = 1 }, function()
                LoadButton.Visible = false
            end)

            MainHolder.Visible = true
            Frame.GroupTransparency = 1
            WindowScale.Scale = 0.85

            Tween(WindowScale, ANIM.Enter, { Scale = 1 })
            Tween(Frame, ANIM.Normal, { GroupTransparency = 0 })
        end

        Tools.Events.ConnectEvent(MinimizeBtn.MouseButton1Click, MinimizeUI)
        Tools.Events.ConnectEvent(LoadButton.MouseButton1Click, RestoreUI)

        Tools.Events.ConnectEvent(UserInputService.InputBegan, function(input, gameProcessed)
            if isMinimized or not MainHolder.Visible then return end
            if input.UserInputType ~= Enum.UserInputType.MouseButton1
                and input.UserInputType ~= Enum.UserInputType.Touch then
                return
            end

            local framePos = Frame.AbsolutePosition
            local frameSize = Frame.AbsoluteSize
            local mouseX, mouseY = input.Position.X, input.Position.Y

            if mouseX >= framePos.X and mouseX <= framePos.X + frameSize.X
                and mouseY >= framePos.Y and mouseY <= framePos.Y + frameSize.Y then
                CreateClickRipple(Frame, mouseX - framePos.X, mouseY - framePos.Y)
            end
        end)

        local isResizing = false
        local resizeStartMouse: Vector2 = Vector2.new()
        local resizeStartSize: Vector2 = Vector2.new()
        local resizeStartPosition: UDim2 = UDim2.new()
        local resizeSx = 0
        local resizeSy = 0

        local EDGE_THICKNESS = 8
        local CORNER_SIZE = 18
        local INSET = 4

        local function BeginResize(input: InputObject, sx: number, sy: number)
            if input.UserInputType ~= Enum.UserInputType.MouseButton1
                and input.UserInputType ~= Enum.UserInputType.Touch then
                return
            end

            isResizing = true
            resizeSx = sx
            resizeSy = sy
            resizeStartMouse = Vector2.new(input.Position.X, input.Position.Y)
            resizeStartSize = MainHolder.AbsoluteSize
            resizeStartPosition = MainHolder.Position
        end

        local function CreateCornerGrip(ax: number, ay: number, sx: number, sy: number)
            local Grip = Instance.new("TextButton")
            Grip.Name = string.format("ResizeGripCorner_%d_%d", ax, ay)
            Grip.AnchorPoint = Vector2.new(ax, ay)
            Grip.Position = UDim2.new(ax, 0, ay, 0)
            Grip.Size = UDim2.new(0, CORNER_SIZE, 0, CORNER_SIZE)
            Grip.BackgroundTransparency = 1
            Grip.AutoButtonColor = false
            Grip.Text = ""
            Grip.ZIndex = 41
            Grip.Parent = MainHolder

            local Indicator = Instance.new("Frame")
            Indicator.Name = "Indicator"
            Indicator.AnchorPoint = Vector2.new(ax, ay)
            Indicator.Position = UDim2.new(ax, 0, ay, 0)
            Indicator.Size = UDim2.new(0, 10, 0, 10)
            Indicator.BackgroundColor3 = Palette.Accent
            Indicator.BackgroundTransparency = 1
            Indicator.BorderSizePixel = 0
            Indicator.ZIndex = 39
            Indicator.Parent = MainHolder

            Tools.Frame.Round(Indicator, UDim.new(0, 4))

            Tools.Frame.Hover(Grip,
                function()
                    Tween(Indicator, ANIM.Fast, { BackgroundTransparency = 1 })
                end,
                function()
                    Tween(Indicator, ANIM.Fast, { BackgroundTransparency = 0.55 })
                end
            )

            Tools.Events.ConnectEvent(Grip.InputBegan, function(input)
                BeginResize(input, sx, sy)
            end)

            return Grip
        end

        local function CreateEdgeGrip(edge: "Top" | "Bottom" | "Left" | "Right")
            local isHorizontalEdge = (edge == "Top" or edge == "Bottom")
            local sx = (edge == "Left" and -1) or (edge == "Right" and 1) or 0
            local sy = (edge == "Top" and -1) or (edge == "Bottom" and 1) or 0

            local Grip = Instance.new("TextButton")
            Grip.Name = "ResizeGripEdge" .. edge
            Grip.BackgroundTransparency = 1
            Grip.AutoButtonColor = false
            Grip.Text = ""
            Grip.ZIndex = 40
            Grip.Parent = MainHolder

            local Indicator = Instance.new("Frame")
            Indicator.Name = "Indicator"
            Indicator.BackgroundColor3 = Palette.Accent
            Indicator.BackgroundTransparency = 1
            Indicator.BorderSizePixel = 0
            Indicator.ZIndex = 39
            Indicator.Parent = MainHolder

            if isHorizontalEdge then
                local ay = edge == "Top" and 0 or 1
                Grip.AnchorPoint = Vector2.new(0.5, ay)
                Grip.Position = UDim2.new(0.5, 0, ay, 0)
                Grip.Size = UDim2.new(1, -(CORNER_SIZE * 2), 0, EDGE_THICKNESS)

                Indicator.AnchorPoint = Vector2.new(0.5, ay)
                Indicator.Position = UDim2.new(0.5, 0, ay, ay == 0 and INSET or -INSET)
                Indicator.Size = UDim2.new(1, -(CORNER_SIZE * 2 + 16), 0, 3)
            else
                local ax = edge == "Left" and 0 or 1
                Grip.AnchorPoint = Vector2.new(ax, 0.5)
                Grip.Position = UDim2.new(ax, 0, 0.5, 0)
                Grip.Size = UDim2.new(0, EDGE_THICKNESS, 1, -(CORNER_SIZE * 2))

                Indicator.AnchorPoint = Vector2.new(ax, 0.5)
                Indicator.Position = UDim2.new(ax, ax == 0 and INSET or -INSET, 0.5, 0)
                Indicator.Size = UDim2.new(0, 3, 1, -(CORNER_SIZE * 2 + 16))
            end

            Tools.Frame.Round(Indicator, UDim.new(0, 2))

            Tools.Frame.Hover(Grip,
                function()
                    Tween(Indicator, ANIM.Fast, { BackgroundTransparency = 1 })
                end,
                function()
                    Tween(Indicator, ANIM.Fast, { BackgroundTransparency = 0.55 })
                end
            )

            Tools.Events.ConnectEvent(Grip.InputBegan, function(input)
                BeginResize(input, sx, sy)
            end)

            return Grip
        end

        CreateCornerGrip(0, 0, -1, -1)
        CreateCornerGrip(1, 0, 1, -1)
        CreateCornerGrip(0, 1, -1, 1)
        CreateCornerGrip(1, 1, 1, 1)

        CreateEdgeGrip("Top")
        CreateEdgeGrip("Bottom")
        CreateEdgeGrip("Left")
        CreateEdgeGrip("Right")

        Tools.Events.ConnectEvent(UserInputService.InputChanged, function(input)
            if not isResizing then return end
            if input.UserInputType ~= Enum.UserInputType.MouseMovement
                and input.UserInputType ~= Enum.UserInputType.Touch then
                return
            end

            local delta = Vector2.new(input.Position.X, input.Position.Y) - resizeStartMouse
            local minSize = HolderConstraint.MinSize
            local maxSize = HolderConstraint.MaxSize

            local newWidth = math.clamp(resizeStartSize.X + delta.X * resizeSx, minSize.X, maxSize.X)
            local newHeight = math.clamp(resizeStartSize.Y + delta.Y * resizeSy, minSize.Y, maxSize.Y)

            local dw = newWidth - resizeStartSize.X
            local dh = newHeight - resizeStartSize.Y

            MainHolder.Size = UDim2.fromOffset(newWidth, newHeight)

            MainHolder.Position = resizeStartPosition + UDim2.fromOffset(
                (dw * resizeSx) / 2,
                (dh * resizeSy) / 2
            )
        end)

        Tools.Events.ConnectEvent(UserInputService.InputEnded, function(input)
            if input.UserInputType ~= Enum.UserInputType.MouseButton1
                and input.UserInputType ~= Enum.UserInputType.Touch then
                return
            end
            isResizing = false
        end)

        local Body = Instance.new("Frame")
        Body.Name = "Body"
        Body.Size = UDim2.new(1, 0, 1, -40)
        Body.Position = UDim2.new(0, 0, 0, 40)
        Body.BackgroundTransparency = 1
        Body.Parent = Frame

        local Left = Instance.new("ScrollingFrame")
        Left.Name = "Left"
        Left.Size = UDim2.new(0.3, 0, 1, 0)
        Left.BackgroundColor3 = Palette.Sidebar
        Left.BorderSizePixel = 0
        Left.ClipsDescendants = true
        Left.ScrollBarThickness = 4
        Left.ScrollBarImageColor3 = Color3.fromRGB(90, 90, 100)
        Left.ScrollBarImageTransparency = 0.3
        Left.CanvasSize = UDim2.new(0, 0, 0, 0)
        Left.AutomaticCanvasSize = Enum.AutomaticSize.Y
        Left.Parent = Body

        Tools.Frame.Round(Left, CornerLarge)

        local LeftPadding = Instance.new("UIPadding")
        LeftPadding.PaddingTop = UDim.new(0, 8)
        LeftPadding.PaddingBottom = UDim.new(0, 8)
        LeftPadding.PaddingLeft = UDim.new(0, 8)
        LeftPadding.PaddingRight = UDim.new(0, 8)
        LeftPadding.Parent = Left

        local LeftLayout = Instance.new("UIListLayout")
        LeftLayout.FillDirection = Enum.FillDirection.Vertical
        LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
        LeftLayout.Padding = UDim.new(0, 6)
        LeftLayout.Parent = Left

        local Right = Instance.new("CanvasGroup")
        Right.Name = "Right"
        Right.Size = UDim2.new(0.7, 0, 1, 0)
        Right.Position = UDim2.new(0.3, 0, 0, 0)
        Right.BackgroundTransparency = 1
        Right.ClipsDescendants = true
        Right.Parent = Body

        Tools.Frame.Round(Right, CornerLarge)

        local RightPadding = Instance.new("UIPadding")
        RightPadding.PaddingTop = UDim.new(0, 12)
        RightPadding.PaddingBottom = UDim.new(0, 12)
        RightPadding.PaddingLeft = UDim.new(0, 12)
        RightPadding.PaddingRight = UDim.new(0, 12)
        RightPadding.Parent = Right

        local sidebarGroup: { Current: SelectableButton? } = { Current = nil }
        -- Fallback counter for callers that don't pass an explicit
        -- LayoutOrder (fine as long as addScreen/addScreens are only
        -- ever called synchronously). Once any explicit LayoutOrder is
        -- used, ordering is driven entirely by that value instead, so the
        -- two schemes never fight each other.
        local screenCount = 0

        -- Tracks which currently-added tab has the smallest LayoutOrder
        -- seen so far, and keeps that one selected. This is what makes
        -- task.spawn(function() addScreen(a) end); task.spawn(function()
        -- addScreen(b) end) safe: whichever call actually finishes first
        -- (a or b — order not guaranteed once either does any yielding
        -- work, e.g. fetching a thumbnail) never gets to "win" the
        -- initially-selected tab just by arriving first. Only the screen
        -- declared with the lowest LayoutOrder does.
        local lowestOrder: number? = nil
        local lowestButton: SelectableButton? = nil
        local lowestPage: ScrollingFrame? = nil

        local function addScreen(screenData: MainGuiScreenData)
            local ButtonText = screenData.ButtonText
            local Content2: GuiObject

            -- Auto-unwrap: screenData.Screen may be the raw GuiObject, or
            -- the {ButtonText, Screen, ...} handle from
            -- CreateHomeScreen/CreateScreen/
            -- (내부) CreatePlayerSelectableList. Passing the
            -- handle directly (e.g. Screen = HomeScreen instead of
            -- Screen = HomeScreen.Screen) is a common call-site mistake
            -- that otherwise parents a plain Lua table nowhere, so the
            -- tab exists but its content never shows.
            local rawScreen: any = screenData.Screen
            if typeof(rawScreen) == "Instance" then
                Content2 = rawScreen :: GuiObject
            else
                local wrapped: any = rawScreen.Screen
                assert(
                    wrapped ~= nil and typeof(wrapped) == "Instance",
                    ("addScreen: Screen for %q is neither a GuiObject nor a {Screen: GuiObject} handle"):format(ButtonText)
                )
                Content2 = wrapped :: GuiObject
            end

            screenCount += 1
            local tabOrder = screenData.LayoutOrder or screenCount

            local PageScroll = Instance.new("ScrollingFrame")
            PageScroll.Name = ButtonText .. "Page"
            PageScroll.Size = UDim2.new(1, 0, 1, 0)
            PageScroll.BackgroundTransparency = 1
            PageScroll.BorderSizePixel = 0
            PageScroll.ScrollBarThickness = 4
            PageScroll.ScrollBarImageColor3 = Color3.fromRGB(90, 90, 100)
            PageScroll.ScrollBarImageTransparency = 0.3
            PageScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
            PageScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
            PageScroll.Visible = false
            PageScroll.LayoutOrder = tabOrder
            PageScroll.Parent = Right

            local PageLayout = Instance.new("UIListLayout")
            PageLayout.FillDirection = Enum.FillDirection.Vertical
            PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
            PageLayout.Padding = UDim.new(0, 8)
            PageLayout.Parent = PageScroll

            Content2.Size = UDim2.new(1, 0, 0, 0)
            Content2.AutomaticSize = Enum.AutomaticSize.Y
            Content2.Parent = PageScroll

            local tabButton = CreateSelectableButton({
                Parent = Left,
                Text = ButtonText,
                Mode = "Single",
                Group = sidebarGroup,
                Initial = false,
                Locked = screenData.Active == false,
                Size = UDim2.new(1, 0, 0, 36),
                CornerRadius = UDim.new(0, 8),
                TextAlign = Enum.TextXAlignment.Left,
                Colors = SIDEBAR_TAB_COLORS,
                OnStateChanged = function(_, isSelected)
                    PageScroll.Visible = isSelected
                end,
            })
            if not tabButton then return end

            -- Explicit LayoutOrder, not creation order, decides the
            -- sidebar position — Left's UIListLayout already sorts by
            -- LayoutOrder, so this alone fixes visual tab order under
            -- concurrent addScreen calls.
            tabButton.Instance.LayoutOrder = tabOrder

            -- Locked(Active=false) 탭은 자동 선택 후보에서 제외한다 — 안 그러면
            -- 이 탭이 하필 제일 낮은 LayoutOrder일 때 클릭 없이도 열려버린다.
            if not tabButton.Locked and (lowestOrder == nil or tabOrder < lowestOrder) then
                if lowestButton then
                    -- A screen with an even lower declared order has now
                    -- shown up (e.g. it was slower to finish an async
                    -- fetch) — hand selection over to it instead.
                    lowestButton:SetSelected(false, false)
                elseif lowestPage then
                    lowestPage.Visible = false
                end

                lowestOrder = tabOrder
                lowestButton = tabButton
                lowestPage = PageScroll

                sidebarGroup.Current = tabButton
                tabButton:SetSelected(true, false)
            else
                PageScroll.Visible = false
            end
        end

        local function addScreens(screens: { MainGuiScreenData })
            for _, screenData in ipairs(screens) do
                addScreen(screenData)
            end
        end

        PlayRippleEffect(ScreenGui, MainHolder.Size)
        Tween(WindowScale, ANIM.Enter, { Scale = 1 })
        Tween(Frame, ANIM.Normal, { GroupTransparency = 0 })

        return {
            ScreenGui = ScreenGui,
            MainHolder = MainHolder,
            Frame = Frame,
            Left = Left,
            Right = Right,
            addScreen = addScreen,
            addScreens = addScreens,
        }
    end

    function UI.CreateHomeScreen(config: HomeScreenConfig): HomeScreen
        local Content = Instance.new("Frame")
        Content.Name = "HomeContent"
        Content.BackgroundTransparency = 1
        Content.Size = UDim2.new(1, 0, 0, 0)
        Content.AutomaticSize = Enum.AutomaticSize.Y

        local Layout = Instance.new("UIListLayout")
        Layout.FillDirection = Enum.FillDirection.Vertical
        Layout.SortOrder = Enum.SortOrder.LayoutOrder
        Layout.Padding = UDim.new(0, 10)
        Layout.Parent = Content

        CreatePlayerCard({
            Parent = Content,
            LayoutOrder = 1,
            Height = 72,
            UserId = config.UserId,
            Title = config.DisplayName,
            Subtitle = "@" .. (config.Username or ""),
        })

        local gameCard = (CreatePlayerCard({
            Parent = Content,
            LayoutOrder = 2,
            Height = 234,
            Icon = config.GameIcon or "",
            Title = config.GameName or "Unknown Game",
            Subtitle = config.PlayerCountText or "",
            Footer = function(card)
                local Description = Instance.new("TextLabel")
                Description.Name = "Description"
                Description.Size = UDim2.new(1, -20, 0, 150)
                Description.Position = UDim2.new(0, 10, 0, 72)
                Description.BackgroundTransparency = 1
                Description.Font = Enum.Font.Gotham
                Description.Text = config.GameDescription or "No Description."
                Description.TextSize = 12
                Description.TextColor3 = Palette.TextMuted
                Description.TextXAlignment = Enum.TextXAlignment.Left
                Description.TextYAlignment = Enum.TextYAlignment.Top
                Description.TextWrapped = true
                Description.TextTruncate = Enum.TextTruncate.AtEnd
                Description.Parent = card.Instance
            end,
        }) :: PlayerCard?) :: PlayerCard

        return {
            ButtonText = "Home",
            Screen = Content,
            LayoutOrder = config.LayoutOrder,
            SetPlayerCount = function(text)
                gameCard.SubtitleLabel.Text = text
            end,
        }
    end

    return UI
end

            ]====], "5799bfb39ce31a94790c66ad18b65b74")
            if not Func then
                error(("[%s] Compile Error: %s"):format("5799bfb39ce31a94790c66ad18b65b74", tostring(LoadErr)))
            end
            local Ok, ErrOrResult = pcall(Func, Self)
            if not Ok then
                error(ErrOrResult)
            end
            return ErrOrResult
        end),
["0f3e8ef7067ed61518bd655cb9bf17b1"]=(function(Self)
            local Func, LoadErr = loadstring([====[
                local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
                local HttpService = game:GetService("HttpService")
local Module = {}

local RobloxTypes = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("7f26a1c24e9e445582a179e7f3a95988", "0f3e8ef7067ed61518bd655cb9bf17b1")

export type RelationType = "ally" | "neutral" | "hostile"
export type GroupRoleName = "LEADER" | "MEMBER"

export type Country = {
    code: string,
    name: string,
    img: string,
}

export type RobloxUsersSimpleWithImg = RobloxTypes.RobloxUsersSimple & {
    img: string,
}

export type ResolvedRelationUser = RobloxUsersSimpleWithImg & {
    relation: RelationType,
    nationality: Country,
}

export type GroupRelationRef = {
    id: string,
    relation: RelationType,
}

export type ResolvedRelatedGroup = {
    id: string,
    code: string,
    name: string,
    img: string,
    created_at: string,
    updated_at: string,
    group_relations: {GroupRelationRef},
    users_relations: {ResolvedRelationUser},
    relation: RelationType,
}

export type GroupMemberRole = RobloxUsersSimpleWithImg & {
    role: GroupRoleName,
    nationality: Country,
}

export type FullGroup = {
    id: string,
    code: string,
    name: string,
    img: string,
    created_at: string,
    updated_at: string,
    group_relations: {ResolvedRelatedGroup},
    users_relations: {ResolvedRelationUser},
    roles: {GroupMemberRole},
    topNationalities: {Country},
}

Module.Groups = HttpService:JSONDecode([===[[{"id":"4610fd9d-6719-480b-bade-9c1c9e20dd4d","code":"XI","name":"XI","img":"https://cdn.discordapp.com/avatars/1175229029633232987/39693648c5d0acb6448f527aeb42f67d.webp?size=100","created_at":"2026-08-20T12:17:23.195733+00:00","updated_at":"2026-08-23T01:48:49.498589+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","code":"VP","name":"Victory Path","img":"/resources/groups/vp.png","created_at":"2026-08-11T05:39:21.433718+00:00","updated_at":"2026-09-05T17:08:31.085075+00:00","group_relations":[{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"ally"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","relation":"ally"},{"id":"3e483375-28b7-48de-a3c1-47e0037cf9b7","relation":"neutral"},{"id":"4610fd9d-6719-480b-bade-9c1c9e20dd4d","relation":"hostile"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"},{"id":"f54eded9-ba4f-4503-b211-1a1a228d99ec","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[{"id":4016880457,"name":"Killercgara","displayName":"HATRED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-56474DC0F8CFD334722DC327C2D778C0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1331,"name":"nickrockcks","displayName":"nickrockcks","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1ECF3148D4C50987B206452CD368C02C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2566517950,"name":"Pyrite00","displayName":"Himmel","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7FC373E0E6C5D836117EE17716456D8F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4657562667,"name":"r_K2340","displayName":"rune1669","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D1BFFB4EA4D1112C254F427116510DB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3606286622,"name":"fghht120","displayName":"IShallNeverSurrender","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D3A8F7F5085EE3E48CA0B37F407156EE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5540496279,"name":"fghht124","displayName":"hello","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A1236B48272BE3FEB18A298CF0EC83B8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5495282792,"name":"fghhy120","displayName":"fghhtluckisfake","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A229A7843B225CB428B824B36D2DFDDA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1518448188,"name":"kbjychoi","displayName":"NKL_last","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DEEF9731AE73407B2895C3E24E32E2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9359231835,"name":"sanabi12345678","displayName":"burning_soul","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D6F4817CF764E14FC76977365BFA38E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5712574595,"name":"yhkjlpomn7","displayName":"Goseung","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-485ADA69F05F3CCFDF2B0E91F348E21D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2994355215,"name":"louissjune","displayName":"louissjune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4508183B58411E973DBAF429D2E8B49F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3366573442,"name":"hayaton1537","displayName":"hayaton1537","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-94C700B3DC33CB4AE4B04222F129B9A9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1522869310,"name":"7x7d7d8d","displayName":"Gilby","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B95F9BC0E7D61EA5D5EA1078997F0087-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3991320061,"name":"yj042217","displayName":"yj042217","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C22F3FDEF78402EFDE9B8654C4F4D3B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4273721629,"name":"rtysep","displayName":"command","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-936FD9F7B84951377B38762F517BFA2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4369128135,"name":"Inee0710","displayName":"MANGO_ElEl","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-83F74A29B8FCE514302C6BFF204CE77F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3146175328,"name":"KR_Usen","displayName":"Haruna","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AD5948C0E692C7C5B41B913FA1BA6EDE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4443685566,"name":"Lost_homiDream","displayName":"123","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4E2882EC80006C8AC452B3A16B23B8F9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3320488434,"name":"hayoon0425","displayName":"hayoon0425","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-59E2572FAB0EE3A73CB2533FCB217735-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4115400670,"name":"Mix77L","displayName":"Mix77L","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D968CE5D9C337157BE42957C6E95DBAD-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4604626269,"name":"eeeecBLI","displayName":"GOMAHA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E0913F0A070D0980BF1B4C5EDC38A4DA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2855998319,"name":"hajunlove14","displayName":"ENFP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B552F5BA6A50337A912042CAC8F2309-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5469376336,"name":"Zizon_mans","displayName":"Zizon_mans","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E1C339944CFF9833C48E2E90DFCB37A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7386139547,"name":"dedi_ing","displayName":"wait4urlove","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-322BECF2EF09C21A6BE7CEFF355379EA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1139396212,"name":"xxzxxadxeiwo","displayName":"IIII","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DFFB9D409A61AACFAF9ACECB34332E32-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460754430,"name":"002_brscg","displayName":"002_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-24F9EA5B046D27C587B7E847EA2B3BA6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9461453673,"name":"000_brscg","displayName":"000_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CCCF2C5C1065E6B032C49F1B709A36AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460951279,"name":"001_brscg","displayName":"001_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C0A86398512FECFF3CE2124D8DC43114-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10652978379,"name":"xj485c","displayName":"monet_c","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9BE0A2B74508701188288CF250D81546-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10570381160,"name":"chara500m","displayName":"Arahc","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F47925FFF12673F9A0E26DBBA03AD40-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1533809431,"name":"kimjione1023","displayName":"kimjione1023","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-19CDD4C7A115BE56303121CE07C582FF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4914904069,"name":"datat019","displayName":"datat019","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7DF45571BA33FE40BBA74CD753827675-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1148536830,"name":"JihoFamily","displayName":"Rtpalm","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EBA2E1A2DCC94D2D7AAE3B677FE61174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2586083131,"name":"yes_si4h","displayName":"yes_si4h","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F53B839C86EB13183E7857E48A6E5D46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":945971641,"name":"ray1378y","displayName":"Teto","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E6089AACA9CD5FD08F83AA3AC56072CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1985749424,"name":"yonggil27","displayName":"Hello1910","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1D7A631D69BB8465AA6D49015B1C223F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4098733337,"name":"euewryr","displayName":"eue","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-520300A5D14993E3DEBD699B66D5DAEB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3588487294,"name":"tarue_S23","displayName":"goodgame","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74333C72DF5481088F4B6C175D238820-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2589061719,"name":"NTQ_MEN","displayName":"NTQ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CBFF33453C94E32E269E0369CB6D7B72-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1209919599,"name":"gyqwpppl","displayName":"Shop_NPC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1B9011997740B5A988DF6BC169F1009D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10171344586,"name":"ererererer7140","displayName":"1234qqq","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0735448DF46689171696246975BEBE21-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2020055911,"name":"siyulmonmon","displayName":"NOOB","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-03B708E1602373035FF71166F0963AF9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5287236437,"name":"ectectectyou","displayName":"ectectectyou","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6AD17D262CE6D6EFF491A2D252745945-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10547914373,"name":"dkssud0427","displayName":"ABme","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-670FA5207870001D53E66D4D6F6DD0E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8345966518,"name":"wiwwwh4","displayName":"White","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B45BD91995798BBE31198A002A86F20B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3373053603,"name":"getveeh","displayName":"Getoutofhere","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C0505218A3221F7A64CE62C22D721E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2705705770,"name":"qwur02846","displayName":"raga_mini","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4E371DF1966280A041745AF31CAC5E0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10529505799,"name":"sans_serif4001","displayName":"roblox_AKUMA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0676D0339F7147ED7004B003696019E2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4352717446,"name":"SJKLH27","displayName":"Merzeno","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A899103E195C7AE474028BE6A426EC52-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2838225524,"name":"srururur4","displayName":"Miner_v","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A8294742E95182DB3BBF3945BED4DA44-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"RU","name":"Russia","img":"https://flagsapi.com/RU/flat/64.png"}},{"id":3518379412,"name":"momiji0911","displayName":"chocolatemint0911","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-983C4DFBD73C9A57B5BEB43C5CC942B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":2507071973,"name":"mink0302","displayName":"mink","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8F301044C62AFA7D037617D05CC95EED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5211697712,"name":"123gavebryan123oks","displayName":"Gave","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E20FC26F44371885DD446A558F30A9AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4235234920,"name":"Sk0iHatesHisFriends","displayName":"kharylsonly","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BAB26872B985DC908D888F38235A32B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":5514737971,"name":"mr_lonely20085","displayName":"LNX_frostie","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D000E798B6AE9B45F7A491714B7D12DE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10006443067,"name":"jtg2511n","displayName":"nameless","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FB3F6F7DD784F7E0E8D3D8938AA4782C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1744534728,"name":"jacob060709","displayName":"The_Memelord","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FA3BF92AB109FEA19742B41D133C7B97-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":8723484810,"name":"ElAlex_XDlol","displayName":"Hintelex","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-77CBE5F770B40A60BC8747C463ADEE0F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1882778514,"name":"henrybook0811","displayName":"Periastron","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-392B57C92DBB3A02CF8E509DA432EECF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1295475937,"name":"gggg167319","displayName":"gggg167319","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E95CE91F04EC35CAFC31CA588ADB2FA0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2863852238,"name":"chanhee2377","displayName":"Vendy","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-602ACB343C491C761BC8E5406C6EA8CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3694244340,"name":"B_yagyy","displayName":"kyky","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C343B333B6F5F15DB9A7187C3E2C7A0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2354231027,"name":"a307763","displayName":"a307763","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-178758FC89AAAB298F4E177A0F7C8EFE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1285247898,"name":"RowzG","displayName":"RowzG","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EE48BE2BF87B7633C43B78519C62FF62-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2645431890,"name":"fgdhtghtggr","displayName":"fgdhtghtggr","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6DF2BF825AF954259E2E98CD524B3DF8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4678848229,"name":"pswoo_jason13","displayName":"pswoo_jason13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-236F4DA64BC319830ABAC00ADAF58736-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5832790026,"name":"daniel_78961","displayName":"daniel_78961","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C9A086134F4F2B37288AB4D0C898297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1190975846,"name":"rtybill","displayName":"rtybill","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA714D47C40709F119E751855176A5D4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1158541596,"name":"junwooblabla","displayName":"ICECREAM","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6ADC05FE535273F7F1A383BFD477AD5C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1242250842,"name":"eduezht","displayName":"eduezht","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F315A1DAA6689289B29A546AA381CE1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1665149193,"name":"prettyssoom","displayName":"BLUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-734A782EDA28E5B6ADCAE8F6CFC3A1AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2313174982,"name":"airbag_31","displayName":"airbag_31","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-38E3B88560533354FEB0B3C067CDF1A2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10449374438,"name":"up8nv","displayName":"up8nv","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-761DE885C389E642BCC4E0669E5312F0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8126447450,"name":"everyallacc","displayName":"Yaong1213","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-995081E21BAB8A4D171956F53DAA73B7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3228410728,"name":"kr_0345","displayName":"Frisk","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F1C43BD784531C3EA85FC16707424B6E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":6024208055,"name":"xcquller","displayName":"xcquller","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-58E94244F5305BD4E93CE19934EE1DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2771854594,"name":"abcdefg45uu","displayName":"abcdefg45uu","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DA422FB54B75B1CAF53F25FAE80D0124-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8758596225,"name":"yesEZprism","displayName":"KD_99PentaBLITZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B0FB1844800D15D6B3BED3D76E54002-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3824302990,"name":"cyfrff","displayName":"cyfrff","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5A5920523BD52586A755986CE81A96D1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1263629161,"name":"goodys13","displayName":"goodys13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4DFCB55F2FFEFCB2F7C4DCC23F6AADE9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2217841355,"name":"Tomvbczz","displayName":"FRISK","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA650FF19963203F75C76647BFE7A880-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1824366114,"name":"BloodFlower12255","displayName":"Flora","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2FE53E17B462F18A60136C5873A00BE8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2222407382,"name":"megsaieon1972","displayName":"meg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-71678992A5CBAE7456739008C6921B2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1385517949,"name":"shmeueiwiw","displayName":"shmeueiwiw","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2BA5D9CDA750A8C73A20437DFD58D4BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4373021482,"name":"spyder_GUN","displayName":"GERerika","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3885EB22F7BCEE4CCFF70715043B0D41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3492289739,"name":"seojj1133","displayName":"Happy_0113","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D5D0EE558B658EF4691BDDD5E0D97865-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3278664128,"name":"qeqwerwerfar","displayName":"Chronos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-953740D790DE44A61049D179ED41E174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1749377682,"name":"swat13893","displayName":"swat13893","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9E401CA9770054B709FF5A6429E2201D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5848446007,"name":"kotaro34112","displayName":"Ramune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3010CD16E4BCB0123134729EBF1B34BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2804538768,"name":"liliang123456789","displayName":"juezi_awa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-78A2C2FDA2E041DDF35092164F3752DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4046560868,"name":"the_XHR","displayName":"Not_speakEnglis","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B763FF476DB7E049D98203A32E5D6904-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1905522183,"name":"1516gd","displayName":"Forsaken","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8D02FF5EEFE0797F2CB2D07DE7AADFF0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7074699037,"name":"hohyun0704howg","displayName":"hohyun0704howg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-651599EB6E8AC82E58BD598C199CED39-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8268752749,"name":"dhehdgus567","displayName":"donghy_1","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4A56F04B814BF8FC06D045FAB31BB9C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5125355211,"name":"dungdungdunghhh","displayName":"sad","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B032A3EB3A22A2F6D1C0BC63F1FF3AAB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5465702541,"name":"ASMRABBIT","displayName":"MRC_YourFace","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E5CDC2D59887C64FA0DE2C101F4BDC41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10420341860,"name":"joefaerg","displayName":"joefaerg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A0A42110F6707718AF6E94465F255333-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4594370728,"name":"Subspacer_0","displayName":"Solemn_Lament","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C41C3310E41E7FB82D41B32EC60724-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3187703552,"name":"didididhodho","displayName":"KR_noob","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-685B92B5B8C7CB3A683F1E8D7AF0CC1C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8224069454,"name":"lllillili7","displayName":"lllillili7","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4CCA634F2385FFF3EE48C69777BA3102-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7641127080,"name":"Shukshukbung","displayName":"feds","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E3F5E51F0B437055A357CC3ED1092664-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7408875000,"name":"SPIDER_208378","displayName":"MeTA9","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74BF9638E1F2BA28C066AA829EA4316D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5840476869,"name":"AACCBB_1322","displayName":"ABC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BD711409331D5A63BD93D6D0468D947D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2921315517,"name":"ghosthanzzing","displayName":"IDKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C136B5D4131C38AA742672D0FF5CEC6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":609696393,"name":"Fennik321","displayName":"Myu","hasVerifiedBadge":false,"img":null,"relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9111302785,"name":"akejdo28","displayName":"star","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5ACB6191007EE41945986628DE3A81A7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3312381246,"name":"error778123","displayName":"hypersonicgdKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-745822F0DF147E885B16316F7611827A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4974302427,"name":"GTGISAKOF","displayName":"GTGISAKOF","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C53171D0ECC8902F8A04AACD56D41BA7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7253007466,"name":"GTGISAKOF3","displayName":"GTGISAKOF3","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7F4ADF59CA2D88EA61E256D3C4264A9D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7227818767,"name":"ezwksksi43","displayName":"lamine_yamal","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D4475171A29437C510318DC1166E43D2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2284412220,"name":"dkwl0154","displayName":"XD_CDuootKYii","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3D9E5A2E0FA2C95A2FAED0D195B479A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4568375253,"name":"Lost_Seoyu","displayName":"Duntzki","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-36251A8C778E134F508CD4335F19A23B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1248273231,"name":"sok1476","displayName":"Dr_soak","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EC2F231E9D633A337DAB863E12D82B46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1193126726,"name":"yhlove04","displayName":"yuha","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CF2E5F64E033450BD6076B8276B4B1DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8498902589,"name":"RoyTheUltimateBoy","displayName":"CheerioDude","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-79CDB58E8B6799352698E5E6E68FBEB2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1218176765,"name":"ZackaryUchi","displayName":"DrDRAKE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6C095DE24BC9ED9FF1FEBF32FDC85C23-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10596667705,"name":"qponmoa","displayName":"qponmoa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FDF54DE0FDD3002C58F26A0541AF9A68-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1960223208,"name":"tgfethg3","displayName":"k0mxn","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AE5F135AB3D59F2D0E7D7504797AFB76-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3260768991,"name":"Austinchoo950003","displayName":"Kokushibo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29FAE409D4DF610D01630AB41431182C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"MY","name":"Malaysia","img":"https://flagsapi.com/MY/flat/64.png"}},{"id":1062351835,"name":"ridwan832010","displayName":"STATUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B5AC295029254F41526D64F96378904E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"ID","name":"Indonesia","img":"https://flagsapi.com/ID/flat/64.png"}},{"id":7217583301,"name":"eievdjwwe","displayName":"Deimos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA2D05C85132888C6C0596561DF7E3ED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4585957518,"name":"kjs_1104","displayName":"Abit","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-658B49D56675B011217C0AEB3436AF26-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4679400313,"name":"Wsjsmsms6","displayName":"tomato","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C357F7B6A7904AAC8FC1DB032D1BDF82-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5368880742,"name":"Gaster_053","displayName":"Ivy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3154EC8846846ECDF64B46B02CACEBB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4079845639,"name":"yhoo9939","displayName":"lvy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-477A13E15A16F600A5A2128A4C84FFEE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4514979397,"name":"sin_kun0308","displayName":"sin_kun0308","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E342BABEB364B515BA6C175175100DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":7726281095,"name":"gauajshua","displayName":"gau","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DAAE876655EDBD37EB42C6DFEA26525E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5175911121,"name":"konmame0316","displayName":"raitia1129","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F58F419C2F406FD68EA6FFFDA6774050-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":3974704043,"name":"SAZUNNd","displayName":"MOST_HATED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0F0678B090FD530C927D8470803555BC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5685575440,"name":"jhace_405","displayName":"hinakosan","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3000D5741CE28ACB763ABA4641649297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4740903245,"name":"jkzwinter123","displayName":"S4LM4","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-89DECBA1CFCEF5F9B9311510E0A3C767-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4453574252,"name":"cucurub1_22","displayName":"cucurub1_22","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A7F750C1D75AEB8A2CC100411B6AF185-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3608855215,"name":"namenametantan","displayName":"nametan_Slug","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA87C50EB83DF51955E29D23AA15DFAF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":9296673653,"name":"HARUAKI120912","displayName":"HARUAKI120912","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2F2BDBF8F1FE57849EF15E3736736FB5-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10974610615,"name":"r1117_606","displayName":"Flowey","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8358D910DDC37461920C0BB89877CD01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":4521062524,"name":"Epicbaconrugh","displayName":"Ronaldinho","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7CD049189B45D2D47091C310F8926814-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10960362047,"name":"ACADQP","displayName":"ACADQP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3E8821C21BD3E9A06F644E367AF94D01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1188607501,"name":"BYSONSUZ","displayName":"BYSONSUZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DF0986FDD8AB1709F00A0117D8F5B66-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"TR","name":"Turkey","img":"https://flagsapi.com/TR/flat/64.png"}}],"relation":"hostile"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","code":"LNX","name":"Ligma Nation X","img":"https://i.postimg.cc/htm6qCh8/LOGO-LNX1.png","created_at":"2026-08-11T20:04:49.556851+00:00","updated_at":"2026-08-23T01:49:29.101022+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"ally"},{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"neutral"},{"id":"4610fd9d-6719-480b-bade-9c1c9e20dd4d","relation":"hostile"}],"users_relations":[],"relation":"hostile"}],"users_relations":[],"roles":[{"id":4526440229,"name":"naydren3","displayName":"Naydren","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A7E3558D9EE9162779B8A0785F3FBEA3-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"IT","name":"Italy","img":"https://flagsapi.com/IT/flat/64.png"}},{"id":7468923086,"name":"Phsyso841","displayName":"Accumulator","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CE4DDD34197A870084CF7C951357D1CE-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":2426273447,"name":"29davif","displayName":"XI_2pires9","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-25D686985CC665CF0693B2208AD341DB-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":3825244647,"name":"arazul2022e","displayName":"XI_Arazul","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FEE450FC3D2256909AB0DDF7375BC87E-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"DE","name":"Germany","img":"https://flagsapi.com/DE/flat/64.png"}},{"id":5253266448,"name":"uniuniuni212","displayName":"XI_Arctix","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-66F94AF5799B02A962D1F80CD8C9C2B1-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":5270604534,"name":"Tigotsyz","displayName":"XI_CRYSTAL","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5F77BD3C116CB2BDC3ADC17C3DBACE70-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":5675950191,"name":"irllydk2110","displayName":"XI_Doki","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F47A0344CC142D5882C1515DEAC95683-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":912804198,"name":"TueducPhu","displayName":"XI_Jessie","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D613AAD4A17EC9860C73B40A7AA0C14A-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"VN","name":"Vietnam","img":"https://flagsapi.com/VN/flat/64.png"}},{"id":1250901263,"name":"dragoncurs908","displayName":"XI_Personnel","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C7B89B335D3BEFD735C9F35F90DD9071-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":3635917156,"name":"Simonkrause","displayName":"XI_Simonkrause","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-026CA88C9803E6C64882252ECEFD0C81-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":4344228057,"name":"alyssa_plays2468","displayName":"XI_XasteR1a","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2481E3A5D7EE8DB772043DA6DDAD0CA9-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"IN","name":"India","img":"https://flagsapi.com/IN/flat/64.png"}},{"id":5388749881,"name":"JoshieChan666","displayName":"XI_Zeroth","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F22EF4F470483A2E22FEFCFBF1C8D799-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"VN","name":"Vietnam","img":"https://flagsapi.com/VN/flat/64.png"}}],"topNationalities":[{"code":"VN","name":"Vietnam","img":"https://flagsapi.com/VN/flat/64.png"},{"code":"IT","name":"Italy","img":"https://flagsapi.com/IT/flat/64.png"}]},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","code":"LNX","name":"Ligma Nation X","img":"https://i.postimg.cc/htm6qCh8/LOGO-LNX1.png","created_at":"2026-08-11T20:04:49.556851+00:00","updated_at":"2026-08-23T01:49:29.101022+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","code":"VP","name":"Victory Path","img":"/resources/groups/vp.png","created_at":"2026-08-11T05:39:21.433718+00:00","updated_at":"2026-09-05T17:08:31.085075+00:00","group_relations":[{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"ally"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","relation":"ally"},{"id":"3e483375-28b7-48de-a3c1-47e0037cf9b7","relation":"neutral"},{"id":"4610fd9d-6719-480b-bade-9c1c9e20dd4d","relation":"hostile"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"},{"id":"f54eded9-ba4f-4503-b211-1a1a228d99ec","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[{"id":4016880457,"name":"Killercgara","displayName":"HATRED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-56474DC0F8CFD334722DC327C2D778C0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1331,"name":"nickrockcks","displayName":"nickrockcks","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1ECF3148D4C50987B206452CD368C02C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2566517950,"name":"Pyrite00","displayName":"Himmel","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7FC373E0E6C5D836117EE17716456D8F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4657562667,"name":"r_K2340","displayName":"rune1669","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D1BFFB4EA4D1112C254F427116510DB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3606286622,"name":"fghht120","displayName":"IShallNeverSurrender","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D3A8F7F5085EE3E48CA0B37F407156EE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5540496279,"name":"fghht124","displayName":"hello","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A1236B48272BE3FEB18A298CF0EC83B8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5495282792,"name":"fghhy120","displayName":"fghhtluckisfake","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A229A7843B225CB428B824B36D2DFDDA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1518448188,"name":"kbjychoi","displayName":"NKL_last","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DEEF9731AE73407B2895C3E24E32E2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9359231835,"name":"sanabi12345678","displayName":"burning_soul","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D6F4817CF764E14FC76977365BFA38E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5712574595,"name":"yhkjlpomn7","displayName":"Goseung","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-485ADA69F05F3CCFDF2B0E91F348E21D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2994355215,"name":"louissjune","displayName":"louissjune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4508183B58411E973DBAF429D2E8B49F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3366573442,"name":"hayaton1537","displayName":"hayaton1537","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-94C700B3DC33CB4AE4B04222F129B9A9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1522869310,"name":"7x7d7d8d","displayName":"Gilby","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B95F9BC0E7D61EA5D5EA1078997F0087-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3991320061,"name":"yj042217","displayName":"yj042217","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C22F3FDEF78402EFDE9B8654C4F4D3B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4273721629,"name":"rtysep","displayName":"command","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-936FD9F7B84951377B38762F517BFA2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4369128135,"name":"Inee0710","displayName":"MANGO_ElEl","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-83F74A29B8FCE514302C6BFF204CE77F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3146175328,"name":"KR_Usen","displayName":"Haruna","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AD5948C0E692C7C5B41B913FA1BA6EDE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4443685566,"name":"Lost_homiDream","displayName":"123","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4E2882EC80006C8AC452B3A16B23B8F9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3320488434,"name":"hayoon0425","displayName":"hayoon0425","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-59E2572FAB0EE3A73CB2533FCB217735-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4115400670,"name":"Mix77L","displayName":"Mix77L","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D968CE5D9C337157BE42957C6E95DBAD-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4604626269,"name":"eeeecBLI","displayName":"GOMAHA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E0913F0A070D0980BF1B4C5EDC38A4DA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2855998319,"name":"hajunlove14","displayName":"ENFP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B552F5BA6A50337A912042CAC8F2309-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5469376336,"name":"Zizon_mans","displayName":"Zizon_mans","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E1C339944CFF9833C48E2E90DFCB37A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7386139547,"name":"dedi_ing","displayName":"wait4urlove","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-322BECF2EF09C21A6BE7CEFF355379EA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1139396212,"name":"xxzxxadxeiwo","displayName":"IIII","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DFFB9D409A61AACFAF9ACECB34332E32-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460754430,"name":"002_brscg","displayName":"002_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-24F9EA5B046D27C587B7E847EA2B3BA6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9461453673,"name":"000_brscg","displayName":"000_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CCCF2C5C1065E6B032C49F1B709A36AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460951279,"name":"001_brscg","displayName":"001_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C0A86398512FECFF3CE2124D8DC43114-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10652978379,"name":"xj485c","displayName":"monet_c","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9BE0A2B74508701188288CF250D81546-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10570381160,"name":"chara500m","displayName":"Arahc","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F47925FFF12673F9A0E26DBBA03AD40-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1533809431,"name":"kimjione1023","displayName":"kimjione1023","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-19CDD4C7A115BE56303121CE07C582FF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4914904069,"name":"datat019","displayName":"datat019","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7DF45571BA33FE40BBA74CD753827675-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1148536830,"name":"JihoFamily","displayName":"Rtpalm","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EBA2E1A2DCC94D2D7AAE3B677FE61174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2586083131,"name":"yes_si4h","displayName":"yes_si4h","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F53B839C86EB13183E7857E48A6E5D46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":945971641,"name":"ray1378y","displayName":"Teto","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E6089AACA9CD5FD08F83AA3AC56072CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1985749424,"name":"yonggil27","displayName":"Hello1910","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1D7A631D69BB8465AA6D49015B1C223F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4098733337,"name":"euewryr","displayName":"eue","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-520300A5D14993E3DEBD699B66D5DAEB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3588487294,"name":"tarue_S23","displayName":"goodgame","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74333C72DF5481088F4B6C175D238820-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2589061719,"name":"NTQ_MEN","displayName":"NTQ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CBFF33453C94E32E269E0369CB6D7B72-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1209919599,"name":"gyqwpppl","displayName":"Shop_NPC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1B9011997740B5A988DF6BC169F1009D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10171344586,"name":"ererererer7140","displayName":"1234qqq","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0735448DF46689171696246975BEBE21-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2020055911,"name":"siyulmonmon","displayName":"NOOB","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-03B708E1602373035FF71166F0963AF9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5287236437,"name":"ectectectyou","displayName":"ectectectyou","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6AD17D262CE6D6EFF491A2D252745945-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10547914373,"name":"dkssud0427","displayName":"ABme","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-670FA5207870001D53E66D4D6F6DD0E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8345966518,"name":"wiwwwh4","displayName":"White","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B45BD91995798BBE31198A002A86F20B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3373053603,"name":"getveeh","displayName":"Getoutofhere","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C0505218A3221F7A64CE62C22D721E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2705705770,"name":"qwur02846","displayName":"raga_mini","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4E371DF1966280A041745AF31CAC5E0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10529505799,"name":"sans_serif4001","displayName":"roblox_AKUMA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0676D0339F7147ED7004B003696019E2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4352717446,"name":"SJKLH27","displayName":"Merzeno","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A899103E195C7AE474028BE6A426EC52-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2838225524,"name":"srururur4","displayName":"Miner_v","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A8294742E95182DB3BBF3945BED4DA44-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"RU","name":"Russia","img":"https://flagsapi.com/RU/flat/64.png"}},{"id":3518379412,"name":"momiji0911","displayName":"chocolatemint0911","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-983C4DFBD73C9A57B5BEB43C5CC942B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":2507071973,"name":"mink0302","displayName":"mink","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8F301044C62AFA7D037617D05CC95EED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5211697712,"name":"123gavebryan123oks","displayName":"Gave","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E20FC26F44371885DD446A558F30A9AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4235234920,"name":"Sk0iHatesHisFriends","displayName":"kharylsonly","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BAB26872B985DC908D888F38235A32B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":5514737971,"name":"mr_lonely20085","displayName":"LNX_frostie","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D000E798B6AE9B45F7A491714B7D12DE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10006443067,"name":"jtg2511n","displayName":"nameless","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FB3F6F7DD784F7E0E8D3D8938AA4782C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1744534728,"name":"jacob060709","displayName":"The_Memelord","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FA3BF92AB109FEA19742B41D133C7B97-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":8723484810,"name":"ElAlex_XDlol","displayName":"Hintelex","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-77CBE5F770B40A60BC8747C463ADEE0F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1882778514,"name":"henrybook0811","displayName":"Periastron","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-392B57C92DBB3A02CF8E509DA432EECF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1295475937,"name":"gggg167319","displayName":"gggg167319","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E95CE91F04EC35CAFC31CA588ADB2FA0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2863852238,"name":"chanhee2377","displayName":"Vendy","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-602ACB343C491C761BC8E5406C6EA8CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3694244340,"name":"B_yagyy","displayName":"kyky","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C343B333B6F5F15DB9A7187C3E2C7A0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2354231027,"name":"a307763","displayName":"a307763","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-178758FC89AAAB298F4E177A0F7C8EFE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1285247898,"name":"RowzG","displayName":"RowzG","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EE48BE2BF87B7633C43B78519C62FF62-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2645431890,"name":"fgdhtghtggr","displayName":"fgdhtghtggr","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6DF2BF825AF954259E2E98CD524B3DF8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4678848229,"name":"pswoo_jason13","displayName":"pswoo_jason13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-236F4DA64BC319830ABAC00ADAF58736-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5832790026,"name":"daniel_78961","displayName":"daniel_78961","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C9A086134F4F2B37288AB4D0C898297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1190975846,"name":"rtybill","displayName":"rtybill","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA714D47C40709F119E751855176A5D4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1158541596,"name":"junwooblabla","displayName":"ICECREAM","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6ADC05FE535273F7F1A383BFD477AD5C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1242250842,"name":"eduezht","displayName":"eduezht","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F315A1DAA6689289B29A546AA381CE1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1665149193,"name":"prettyssoom","displayName":"BLUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-734A782EDA28E5B6ADCAE8F6CFC3A1AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2313174982,"name":"airbag_31","displayName":"airbag_31","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-38E3B88560533354FEB0B3C067CDF1A2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10449374438,"name":"up8nv","displayName":"up8nv","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-761DE885C389E642BCC4E0669E5312F0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8126447450,"name":"everyallacc","displayName":"Yaong1213","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-995081E21BAB8A4D171956F53DAA73B7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3228410728,"name":"kr_0345","displayName":"Frisk","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F1C43BD784531C3EA85FC16707424B6E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":6024208055,"name":"xcquller","displayName":"xcquller","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-58E94244F5305BD4E93CE19934EE1DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2771854594,"name":"abcdefg45uu","displayName":"abcdefg45uu","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DA422FB54B75B1CAF53F25FAE80D0124-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8758596225,"name":"yesEZprism","displayName":"KD_99PentaBLITZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B0FB1844800D15D6B3BED3D76E54002-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3824302990,"name":"cyfrff","displayName":"cyfrff","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5A5920523BD52586A755986CE81A96D1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1263629161,"name":"goodys13","displayName":"goodys13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4DFCB55F2FFEFCB2F7C4DCC23F6AADE9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2217841355,"name":"Tomvbczz","displayName":"FRISK","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA650FF19963203F75C76647BFE7A880-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1824366114,"name":"BloodFlower12255","displayName":"Flora","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2FE53E17B462F18A60136C5873A00BE8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2222407382,"name":"megsaieon1972","displayName":"meg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-71678992A5CBAE7456739008C6921B2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1385517949,"name":"shmeueiwiw","displayName":"shmeueiwiw","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2BA5D9CDA750A8C73A20437DFD58D4BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4373021482,"name":"spyder_GUN","displayName":"GERerika","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3885EB22F7BCEE4CCFF70715043B0D41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3492289739,"name":"seojj1133","displayName":"Happy_0113","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D5D0EE558B658EF4691BDDD5E0D97865-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3278664128,"name":"qeqwerwerfar","displayName":"Chronos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-953740D790DE44A61049D179ED41E174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1749377682,"name":"swat13893","displayName":"swat13893","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9E401CA9770054B709FF5A6429E2201D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5848446007,"name":"kotaro34112","displayName":"Ramune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3010CD16E4BCB0123134729EBF1B34BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2804538768,"name":"liliang123456789","displayName":"juezi_awa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-78A2C2FDA2E041DDF35092164F3752DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4046560868,"name":"the_XHR","displayName":"Not_speakEnglis","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B763FF476DB7E049D98203A32E5D6904-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1905522183,"name":"1516gd","displayName":"Forsaken","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8D02FF5EEFE0797F2CB2D07DE7AADFF0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7074699037,"name":"hohyun0704howg","displayName":"hohyun0704howg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-651599EB6E8AC82E58BD598C199CED39-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8268752749,"name":"dhehdgus567","displayName":"donghy_1","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4A56F04B814BF8FC06D045FAB31BB9C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5125355211,"name":"dungdungdunghhh","displayName":"sad","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B032A3EB3A22A2F6D1C0BC63F1FF3AAB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5465702541,"name":"ASMRABBIT","displayName":"MRC_YourFace","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E5CDC2D59887C64FA0DE2C101F4BDC41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10420341860,"name":"joefaerg","displayName":"joefaerg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A0A42110F6707718AF6E94465F255333-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4594370728,"name":"Subspacer_0","displayName":"Solemn_Lament","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C41C3310E41E7FB82D41B32EC60724-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3187703552,"name":"didididhodho","displayName":"KR_noob","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-685B92B5B8C7CB3A683F1E8D7AF0CC1C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8224069454,"name":"lllillili7","displayName":"lllillili7","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4CCA634F2385FFF3EE48C69777BA3102-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7641127080,"name":"Shukshukbung","displayName":"feds","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E3F5E51F0B437055A357CC3ED1092664-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7408875000,"name":"SPIDER_208378","displayName":"MeTA9","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74BF9638E1F2BA28C066AA829EA4316D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5840476869,"name":"AACCBB_1322","displayName":"ABC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BD711409331D5A63BD93D6D0468D947D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2921315517,"name":"ghosthanzzing","displayName":"IDKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C136B5D4131C38AA742672D0FF5CEC6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":609696393,"name":"Fennik321","displayName":"Myu","hasVerifiedBadge":false,"img":null,"relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9111302785,"name":"akejdo28","displayName":"star","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5ACB6191007EE41945986628DE3A81A7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3312381246,"name":"error778123","displayName":"hypersonicgdKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-745822F0DF147E885B16316F7611827A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4974302427,"name":"GTGISAKOF","displayName":"GTGISAKOF","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C53171D0ECC8902F8A04AACD56D41BA7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7253007466,"name":"GTGISAKOF3","displayName":"GTGISAKOF3","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7F4ADF59CA2D88EA61E256D3C4264A9D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7227818767,"name":"ezwksksi43","displayName":"lamine_yamal","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D4475171A29437C510318DC1166E43D2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2284412220,"name":"dkwl0154","displayName":"XD_CDuootKYii","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3D9E5A2E0FA2C95A2FAED0D195B479A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4568375253,"name":"Lost_Seoyu","displayName":"Duntzki","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-36251A8C778E134F508CD4335F19A23B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1248273231,"name":"sok1476","displayName":"Dr_soak","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EC2F231E9D633A337DAB863E12D82B46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1193126726,"name":"yhlove04","displayName":"yuha","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CF2E5F64E033450BD6076B8276B4B1DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8498902589,"name":"RoyTheUltimateBoy","displayName":"CheerioDude","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-79CDB58E8B6799352698E5E6E68FBEB2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1218176765,"name":"ZackaryUchi","displayName":"DrDRAKE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6C095DE24BC9ED9FF1FEBF32FDC85C23-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10596667705,"name":"qponmoa","displayName":"qponmoa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FDF54DE0FDD3002C58F26A0541AF9A68-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1960223208,"name":"tgfethg3","displayName":"k0mxn","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AE5F135AB3D59F2D0E7D7504797AFB76-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3260768991,"name":"Austinchoo950003","displayName":"Kokushibo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29FAE409D4DF610D01630AB41431182C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"MY","name":"Malaysia","img":"https://flagsapi.com/MY/flat/64.png"}},{"id":1062351835,"name":"ridwan832010","displayName":"STATUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B5AC295029254F41526D64F96378904E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"ID","name":"Indonesia","img":"https://flagsapi.com/ID/flat/64.png"}},{"id":7217583301,"name":"eievdjwwe","displayName":"Deimos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA2D05C85132888C6C0596561DF7E3ED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4585957518,"name":"kjs_1104","displayName":"Abit","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-658B49D56675B011217C0AEB3436AF26-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4679400313,"name":"Wsjsmsms6","displayName":"tomato","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C357F7B6A7904AAC8FC1DB032D1BDF82-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5368880742,"name":"Gaster_053","displayName":"Ivy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3154EC8846846ECDF64B46B02CACEBB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4079845639,"name":"yhoo9939","displayName":"lvy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-477A13E15A16F600A5A2128A4C84FFEE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4514979397,"name":"sin_kun0308","displayName":"sin_kun0308","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E342BABEB364B515BA6C175175100DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":7726281095,"name":"gauajshua","displayName":"gau","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DAAE876655EDBD37EB42C6DFEA26525E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5175911121,"name":"konmame0316","displayName":"raitia1129","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F58F419C2F406FD68EA6FFFDA6774050-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":3974704043,"name":"SAZUNNd","displayName":"MOST_HATED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0F0678B090FD530C927D8470803555BC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5685575440,"name":"jhace_405","displayName":"hinakosan","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3000D5741CE28ACB763ABA4641649297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4740903245,"name":"jkzwinter123","displayName":"S4LM4","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-89DECBA1CFCEF5F9B9311510E0A3C767-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4453574252,"name":"cucurub1_22","displayName":"cucurub1_22","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A7F750C1D75AEB8A2CC100411B6AF185-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3608855215,"name":"namenametantan","displayName":"nametan_Slug","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA87C50EB83DF51955E29D23AA15DFAF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":9296673653,"name":"HARUAKI120912","displayName":"HARUAKI120912","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2F2BDBF8F1FE57849EF15E3736736FB5-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10974610615,"name":"r1117_606","displayName":"Flowey","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8358D910DDC37461920C0BB89877CD01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":4521062524,"name":"Epicbaconrugh","displayName":"Ronaldinho","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7CD049189B45D2D47091C310F8926814-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10960362047,"name":"ACADQP","displayName":"ACADQP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3E8821C21BD3E9A06F644E367AF94D01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1188607501,"name":"BYSONSUZ","displayName":"BYSONSUZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DF0986FDD8AB1709F00A0117D8F5B66-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"TR","name":"Turkey","img":"https://flagsapi.com/TR/flat/64.png"}}],"relation":"ally"},{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","code":"JA","name":"Japan Army","img":"/resources/groups/ja.png","created_at":"2026-08-11T07:14:19.141632+00:00","updated_at":"2026-09-01T13:53:08.181317+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"ally"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","relation":"neutral"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[{"id":10801833505,"name":"SonarDispatched","displayName":"Solar","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6D416B43E35918DF4669DA7F946A2F50-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"US","name":"United States","img":"https://flagsapi.com/US/flat/64.png"}},{"id":4144394027,"name":"P4rtyWithGhost","displayName":"Taxer","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C3CF9AA58CFAD0B17D17E1A76331FC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"ID","name":"Indonesia","img":"https://flagsapi.com/ID/flat/64.png"}}],"relation":"neutral"},{"id":"4610fd9d-6719-480b-bade-9c1c9e20dd4d","code":"XI","name":"XI","img":"https://cdn.discordapp.com/avatars/1175229029633232987/39693648c5d0acb6448f527aeb42f67d.webp?size=100","created_at":"2026-08-20T12:17:23.195733+00:00","updated_at":"2026-08-23T01:48:49.498589+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"hostile"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","relation":"hostile"}],"users_relations":[],"relation":"hostile"}],"users_relations":[],"roles":[{"id":3787824845,"name":"unname_be1","displayName":"Caretaker_LNX","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7A97BCD980B7528FF5694DB58909A5D3-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10394612232,"name":"StreamBlastGamer34","displayName":"GamerX_LNX","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7EA26B44FDB957B93D3A08FA3A21FC26-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4555096808,"name":"ROBLOXHYPERGUYa","displayName":"Jx1dx1_LNX","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AFB2D94D4A91A12268F9F754989E7E83-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":3849251645,"name":"zpomis_kind12345","displayName":"zpomis_kind12345","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-10442A3064D4C8D4FAA28CEA427A2F38-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":5074530327,"name":"npc888112","displayName":"DarkImpostor_LNX","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-46E2CAB0C0DFB7B18B09C781F2CBBBBD-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":7648189087,"name":"Coolguy_9690","displayName":"Gamerz_LNX","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9E9944B5CD178CE96D2B28D96C9E4312-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":5570252565,"name":"imsad_pecob2","displayName":"kian","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AB10037A486B5FADBB3F81F3966A746D-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10580625555,"name":"kinzrawrxd","displayName":"Kinzrawr_LNX","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-992498DF76DC234CFAA054D3F2A1043C-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":5514737971,"name":"mr_lonely20085","displayName":"LNX_frostie","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D000E798B6AE9B45F7A491714B7D12DE-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4908992274,"name":"PrankXD1999","displayName":"ParadoxEXE_LNX","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74C983A08948F0D19AA1910454FD44D0-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4144394027,"name":"P4rtyWithGhost","displayName":"Taxer","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C3CF9AA58CFAD0B17D17E1A76331FC-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":5763382313,"name":"FerociousGarrettt","displayName":"TheChosenOne_LNX","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4FA36D5E707970258E21901F02B61031-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":2538134675,"name":"JEHOY_1123","displayName":"TheUnBelovedByALL","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-556C45942AFC945115AAA355C9A039F0-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}}],"topNationalities":[{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}]},{"id":"f54eded9-ba4f-4503-b211-1a1a228d99ec","code":"CHEON","name":"CHEON","img":"https://cdn.discordapp.com/icons/986942524792901632/8dff36cda8093c846cdbcc2e8c07f19e.webp?size=100&quality=lossless","created_at":"2026-08-21T11:47:16.682748+00:00","updated_at":"2026-08-21T12:53:15.273122+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","code":"VP","name":"Victory Path","img":"/resources/groups/vp.png","created_at":"2026-08-11T05:39:21.433718+00:00","updated_at":"2026-09-05T17:08:31.085075+00:00","group_relations":[{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"ally"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","relation":"ally"},{"id":"3e483375-28b7-48de-a3c1-47e0037cf9b7","relation":"neutral"},{"id":"4610fd9d-6719-480b-bade-9c1c9e20dd4d","relation":"hostile"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"},{"id":"f54eded9-ba4f-4503-b211-1a1a228d99ec","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[{"id":4016880457,"name":"Killercgara","displayName":"HATRED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-56474DC0F8CFD334722DC327C2D778C0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1331,"name":"nickrockcks","displayName":"nickrockcks","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1ECF3148D4C50987B206452CD368C02C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2566517950,"name":"Pyrite00","displayName":"Himmel","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7FC373E0E6C5D836117EE17716456D8F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4657562667,"name":"r_K2340","displayName":"rune1669","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D1BFFB4EA4D1112C254F427116510DB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3606286622,"name":"fghht120","displayName":"IShallNeverSurrender","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D3A8F7F5085EE3E48CA0B37F407156EE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5540496279,"name":"fghht124","displayName":"hello","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A1236B48272BE3FEB18A298CF0EC83B8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5495282792,"name":"fghhy120","displayName":"fghhtluckisfake","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A229A7843B225CB428B824B36D2DFDDA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1518448188,"name":"kbjychoi","displayName":"NKL_last","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DEEF9731AE73407B2895C3E24E32E2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9359231835,"name":"sanabi12345678","displayName":"burning_soul","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D6F4817CF764E14FC76977365BFA38E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5712574595,"name":"yhkjlpomn7","displayName":"Goseung","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-485ADA69F05F3CCFDF2B0E91F348E21D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2994355215,"name":"louissjune","displayName":"louissjune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4508183B58411E973DBAF429D2E8B49F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3366573442,"name":"hayaton1537","displayName":"hayaton1537","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-94C700B3DC33CB4AE4B04222F129B9A9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1522869310,"name":"7x7d7d8d","displayName":"Gilby","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B95F9BC0E7D61EA5D5EA1078997F0087-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3991320061,"name":"yj042217","displayName":"yj042217","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C22F3FDEF78402EFDE9B8654C4F4D3B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4273721629,"name":"rtysep","displayName":"command","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-936FD9F7B84951377B38762F517BFA2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4369128135,"name":"Inee0710","displayName":"MANGO_ElEl","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-83F74A29B8FCE514302C6BFF204CE77F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3146175328,"name":"KR_Usen","displayName":"Haruna","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AD5948C0E692C7C5B41B913FA1BA6EDE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4443685566,"name":"Lost_homiDream","displayName":"123","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4E2882EC80006C8AC452B3A16B23B8F9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3320488434,"name":"hayoon0425","displayName":"hayoon0425","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-59E2572FAB0EE3A73CB2533FCB217735-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4115400670,"name":"Mix77L","displayName":"Mix77L","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D968CE5D9C337157BE42957C6E95DBAD-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4604626269,"name":"eeeecBLI","displayName":"GOMAHA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E0913F0A070D0980BF1B4C5EDC38A4DA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2855998319,"name":"hajunlove14","displayName":"ENFP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B552F5BA6A50337A912042CAC8F2309-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5469376336,"name":"Zizon_mans","displayName":"Zizon_mans","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E1C339944CFF9833C48E2E90DFCB37A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7386139547,"name":"dedi_ing","displayName":"wait4urlove","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-322BECF2EF09C21A6BE7CEFF355379EA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1139396212,"name":"xxzxxadxeiwo","displayName":"IIII","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DFFB9D409A61AACFAF9ACECB34332E32-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460754430,"name":"002_brscg","displayName":"002_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-24F9EA5B046D27C587B7E847EA2B3BA6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9461453673,"name":"000_brscg","displayName":"000_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CCCF2C5C1065E6B032C49F1B709A36AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460951279,"name":"001_brscg","displayName":"001_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C0A86398512FECFF3CE2124D8DC43114-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10652978379,"name":"xj485c","displayName":"monet_c","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9BE0A2B74508701188288CF250D81546-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10570381160,"name":"chara500m","displayName":"Arahc","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F47925FFF12673F9A0E26DBBA03AD40-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1533809431,"name":"kimjione1023","displayName":"kimjione1023","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-19CDD4C7A115BE56303121CE07C582FF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4914904069,"name":"datat019","displayName":"datat019","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7DF45571BA33FE40BBA74CD753827675-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1148536830,"name":"JihoFamily","displayName":"Rtpalm","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EBA2E1A2DCC94D2D7AAE3B677FE61174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2586083131,"name":"yes_si4h","displayName":"yes_si4h","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F53B839C86EB13183E7857E48A6E5D46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":945971641,"name":"ray1378y","displayName":"Teto","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E6089AACA9CD5FD08F83AA3AC56072CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1985749424,"name":"yonggil27","displayName":"Hello1910","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1D7A631D69BB8465AA6D49015B1C223F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4098733337,"name":"euewryr","displayName":"eue","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-520300A5D14993E3DEBD699B66D5DAEB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3588487294,"name":"tarue_S23","displayName":"goodgame","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74333C72DF5481088F4B6C175D238820-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2589061719,"name":"NTQ_MEN","displayName":"NTQ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CBFF33453C94E32E269E0369CB6D7B72-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1209919599,"name":"gyqwpppl","displayName":"Shop_NPC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1B9011997740B5A988DF6BC169F1009D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10171344586,"name":"ererererer7140","displayName":"1234qqq","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0735448DF46689171696246975BEBE21-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2020055911,"name":"siyulmonmon","displayName":"NOOB","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-03B708E1602373035FF71166F0963AF9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5287236437,"name":"ectectectyou","displayName":"ectectectyou","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6AD17D262CE6D6EFF491A2D252745945-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10547914373,"name":"dkssud0427","displayName":"ABme","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-670FA5207870001D53E66D4D6F6DD0E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8345966518,"name":"wiwwwh4","displayName":"White","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B45BD91995798BBE31198A002A86F20B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3373053603,"name":"getveeh","displayName":"Getoutofhere","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C0505218A3221F7A64CE62C22D721E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2705705770,"name":"qwur02846","displayName":"raga_mini","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4E371DF1966280A041745AF31CAC5E0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10529505799,"name":"sans_serif4001","displayName":"roblox_AKUMA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0676D0339F7147ED7004B003696019E2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4352717446,"name":"SJKLH27","displayName":"Merzeno","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A899103E195C7AE474028BE6A426EC52-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2838225524,"name":"srururur4","displayName":"Miner_v","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A8294742E95182DB3BBF3945BED4DA44-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"RU","name":"Russia","img":"https://flagsapi.com/RU/flat/64.png"}},{"id":3518379412,"name":"momiji0911","displayName":"chocolatemint0911","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-983C4DFBD73C9A57B5BEB43C5CC942B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":2507071973,"name":"mink0302","displayName":"mink","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8F301044C62AFA7D037617D05CC95EED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5211697712,"name":"123gavebryan123oks","displayName":"Gave","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E20FC26F44371885DD446A558F30A9AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4235234920,"name":"Sk0iHatesHisFriends","displayName":"kharylsonly","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BAB26872B985DC908D888F38235A32B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":5514737971,"name":"mr_lonely20085","displayName":"LNX_frostie","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D000E798B6AE9B45F7A491714B7D12DE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10006443067,"name":"jtg2511n","displayName":"nameless","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FB3F6F7DD784F7E0E8D3D8938AA4782C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1744534728,"name":"jacob060709","displayName":"The_Memelord","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FA3BF92AB109FEA19742B41D133C7B97-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":8723484810,"name":"ElAlex_XDlol","displayName":"Hintelex","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-77CBE5F770B40A60BC8747C463ADEE0F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1882778514,"name":"henrybook0811","displayName":"Periastron","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-392B57C92DBB3A02CF8E509DA432EECF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1295475937,"name":"gggg167319","displayName":"gggg167319","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E95CE91F04EC35CAFC31CA588ADB2FA0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2863852238,"name":"chanhee2377","displayName":"Vendy","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-602ACB343C491C761BC8E5406C6EA8CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3694244340,"name":"B_yagyy","displayName":"kyky","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C343B333B6F5F15DB9A7187C3E2C7A0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2354231027,"name":"a307763","displayName":"a307763","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-178758FC89AAAB298F4E177A0F7C8EFE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1285247898,"name":"RowzG","displayName":"RowzG","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EE48BE2BF87B7633C43B78519C62FF62-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2645431890,"name":"fgdhtghtggr","displayName":"fgdhtghtggr","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6DF2BF825AF954259E2E98CD524B3DF8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4678848229,"name":"pswoo_jason13","displayName":"pswoo_jason13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-236F4DA64BC319830ABAC00ADAF58736-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5832790026,"name":"daniel_78961","displayName":"daniel_78961","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C9A086134F4F2B37288AB4D0C898297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1190975846,"name":"rtybill","displayName":"rtybill","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA714D47C40709F119E751855176A5D4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1158541596,"name":"junwooblabla","displayName":"ICECREAM","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6ADC05FE535273F7F1A383BFD477AD5C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1242250842,"name":"eduezht","displayName":"eduezht","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F315A1DAA6689289B29A546AA381CE1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1665149193,"name":"prettyssoom","displayName":"BLUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-734A782EDA28E5B6ADCAE8F6CFC3A1AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2313174982,"name":"airbag_31","displayName":"airbag_31","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-38E3B88560533354FEB0B3C067CDF1A2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10449374438,"name":"up8nv","displayName":"up8nv","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-761DE885C389E642BCC4E0669E5312F0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8126447450,"name":"everyallacc","displayName":"Yaong1213","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-995081E21BAB8A4D171956F53DAA73B7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3228410728,"name":"kr_0345","displayName":"Frisk","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F1C43BD784531C3EA85FC16707424B6E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":6024208055,"name":"xcquller","displayName":"xcquller","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-58E94244F5305BD4E93CE19934EE1DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2771854594,"name":"abcdefg45uu","displayName":"abcdefg45uu","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DA422FB54B75B1CAF53F25FAE80D0124-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8758596225,"name":"yesEZprism","displayName":"KD_99PentaBLITZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B0FB1844800D15D6B3BED3D76E54002-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3824302990,"name":"cyfrff","displayName":"cyfrff","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5A5920523BD52586A755986CE81A96D1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1263629161,"name":"goodys13","displayName":"goodys13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4DFCB55F2FFEFCB2F7C4DCC23F6AADE9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2217841355,"name":"Tomvbczz","displayName":"FRISK","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA650FF19963203F75C76647BFE7A880-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1824366114,"name":"BloodFlower12255","displayName":"Flora","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2FE53E17B462F18A60136C5873A00BE8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2222407382,"name":"megsaieon1972","displayName":"meg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-71678992A5CBAE7456739008C6921B2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1385517949,"name":"shmeueiwiw","displayName":"shmeueiwiw","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2BA5D9CDA750A8C73A20437DFD58D4BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4373021482,"name":"spyder_GUN","displayName":"GERerika","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3885EB22F7BCEE4CCFF70715043B0D41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3492289739,"name":"seojj1133","displayName":"Happy_0113","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D5D0EE558B658EF4691BDDD5E0D97865-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3278664128,"name":"qeqwerwerfar","displayName":"Chronos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-953740D790DE44A61049D179ED41E174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1749377682,"name":"swat13893","displayName":"swat13893","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9E401CA9770054B709FF5A6429E2201D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5848446007,"name":"kotaro34112","displayName":"Ramune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3010CD16E4BCB0123134729EBF1B34BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2804538768,"name":"liliang123456789","displayName":"juezi_awa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-78A2C2FDA2E041DDF35092164F3752DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4046560868,"name":"the_XHR","displayName":"Not_speakEnglis","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B763FF476DB7E049D98203A32E5D6904-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1905522183,"name":"1516gd","displayName":"Forsaken","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8D02FF5EEFE0797F2CB2D07DE7AADFF0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7074699037,"name":"hohyun0704howg","displayName":"hohyun0704howg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-651599EB6E8AC82E58BD598C199CED39-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8268752749,"name":"dhehdgus567","displayName":"donghy_1","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4A56F04B814BF8FC06D045FAB31BB9C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5125355211,"name":"dungdungdunghhh","displayName":"sad","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B032A3EB3A22A2F6D1C0BC63F1FF3AAB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5465702541,"name":"ASMRABBIT","displayName":"MRC_YourFace","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E5CDC2D59887C64FA0DE2C101F4BDC41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10420341860,"name":"joefaerg","displayName":"joefaerg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A0A42110F6707718AF6E94465F255333-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4594370728,"name":"Subspacer_0","displayName":"Solemn_Lament","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C41C3310E41E7FB82D41B32EC60724-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3187703552,"name":"didididhodho","displayName":"KR_noob","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-685B92B5B8C7CB3A683F1E8D7AF0CC1C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8224069454,"name":"lllillili7","displayName":"lllillili7","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4CCA634F2385FFF3EE48C69777BA3102-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7641127080,"name":"Shukshukbung","displayName":"feds","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E3F5E51F0B437055A357CC3ED1092664-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7408875000,"name":"SPIDER_208378","displayName":"MeTA9","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74BF9638E1F2BA28C066AA829EA4316D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5840476869,"name":"AACCBB_1322","displayName":"ABC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BD711409331D5A63BD93D6D0468D947D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2921315517,"name":"ghosthanzzing","displayName":"IDKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C136B5D4131C38AA742672D0FF5CEC6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":609696393,"name":"Fennik321","displayName":"Myu","hasVerifiedBadge":false,"img":null,"relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9111302785,"name":"akejdo28","displayName":"star","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5ACB6191007EE41945986628DE3A81A7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3312381246,"name":"error778123","displayName":"hypersonicgdKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-745822F0DF147E885B16316F7611827A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4974302427,"name":"GTGISAKOF","displayName":"GTGISAKOF","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C53171D0ECC8902F8A04AACD56D41BA7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7253007466,"name":"GTGISAKOF3","displayName":"GTGISAKOF3","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7F4ADF59CA2D88EA61E256D3C4264A9D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7227818767,"name":"ezwksksi43","displayName":"lamine_yamal","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D4475171A29437C510318DC1166E43D2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2284412220,"name":"dkwl0154","displayName":"XD_CDuootKYii","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3D9E5A2E0FA2C95A2FAED0D195B479A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4568375253,"name":"Lost_Seoyu","displayName":"Duntzki","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-36251A8C778E134F508CD4335F19A23B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1248273231,"name":"sok1476","displayName":"Dr_soak","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EC2F231E9D633A337DAB863E12D82B46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1193126726,"name":"yhlove04","displayName":"yuha","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CF2E5F64E033450BD6076B8276B4B1DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8498902589,"name":"RoyTheUltimateBoy","displayName":"CheerioDude","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-79CDB58E8B6799352698E5E6E68FBEB2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1218176765,"name":"ZackaryUchi","displayName":"DrDRAKE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6C095DE24BC9ED9FF1FEBF32FDC85C23-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10596667705,"name":"qponmoa","displayName":"qponmoa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FDF54DE0FDD3002C58F26A0541AF9A68-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1960223208,"name":"tgfethg3","displayName":"k0mxn","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AE5F135AB3D59F2D0E7D7504797AFB76-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3260768991,"name":"Austinchoo950003","displayName":"Kokushibo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29FAE409D4DF610D01630AB41431182C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"MY","name":"Malaysia","img":"https://flagsapi.com/MY/flat/64.png"}},{"id":1062351835,"name":"ridwan832010","displayName":"STATUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B5AC295029254F41526D64F96378904E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"ID","name":"Indonesia","img":"https://flagsapi.com/ID/flat/64.png"}},{"id":7217583301,"name":"eievdjwwe","displayName":"Deimos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA2D05C85132888C6C0596561DF7E3ED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4585957518,"name":"kjs_1104","displayName":"Abit","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-658B49D56675B011217C0AEB3436AF26-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4679400313,"name":"Wsjsmsms6","displayName":"tomato","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C357F7B6A7904AAC8FC1DB032D1BDF82-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5368880742,"name":"Gaster_053","displayName":"Ivy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3154EC8846846ECDF64B46B02CACEBB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4079845639,"name":"yhoo9939","displayName":"lvy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-477A13E15A16F600A5A2128A4C84FFEE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4514979397,"name":"sin_kun0308","displayName":"sin_kun0308","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E342BABEB364B515BA6C175175100DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":7726281095,"name":"gauajshua","displayName":"gau","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DAAE876655EDBD37EB42C6DFEA26525E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5175911121,"name":"konmame0316","displayName":"raitia1129","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F58F419C2F406FD68EA6FFFDA6774050-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":3974704043,"name":"SAZUNNd","displayName":"MOST_HATED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0F0678B090FD530C927D8470803555BC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5685575440,"name":"jhace_405","displayName":"hinakosan","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3000D5741CE28ACB763ABA4641649297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4740903245,"name":"jkzwinter123","displayName":"S4LM4","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-89DECBA1CFCEF5F9B9311510E0A3C767-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4453574252,"name":"cucurub1_22","displayName":"cucurub1_22","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A7F750C1D75AEB8A2CC100411B6AF185-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3608855215,"name":"namenametantan","displayName":"nametan_Slug","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA87C50EB83DF51955E29D23AA15DFAF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":9296673653,"name":"HARUAKI120912","displayName":"HARUAKI120912","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2F2BDBF8F1FE57849EF15E3736736FB5-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10974610615,"name":"r1117_606","displayName":"Flowey","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8358D910DDC37461920C0BB89877CD01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":4521062524,"name":"Epicbaconrugh","displayName":"Ronaldinho","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7CD049189B45D2D47091C310F8926814-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10960362047,"name":"ACADQP","displayName":"ACADQP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3E8821C21BD3E9A06F644E367AF94D01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1188607501,"name":"BYSONSUZ","displayName":"BYSONSUZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DF0986FDD8AB1709F00A0117D8F5B66-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"TR","name":"Turkey","img":"https://flagsapi.com/TR/flat/64.png"}}],"relation":"hostile"}],"users_relations":[],"roles":[{"id":4477114424,"name":"Youhoo_8872","displayName":"Shaer","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-17A0FED0716585DA7B63ED6CBC29BDF4-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4009807145,"name":"gypuwbv","displayName":"AzureX_POPCAT","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BC314F58FE8DEE9EE2B4C06E6047779D-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2333920633,"name":"yuhasong130503","displayName":"CHEON_SUMMER","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-09346F3C46BF964068B8AC4B3919E66E-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":5043407235,"name":"wailano9999","displayName":"CHEON_wail","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1E8FFEC57F042949AEFAC69FECC72D38-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":9161495066,"name":"DduruDdaDduru","displayName":"Dduru","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3C6A48D3545ECA2572D9B4547357A66A-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":4009750168,"name":"dhpark2024","displayName":"DIO","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3E39FBC69745A44F60FE0B0AE55EEA1C-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7641127080,"name":"Shukshukbung","displayName":"feds","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E3F5E51F0B437055A357CC3ED1092664-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":5234239777,"name":"eoeowow2021","displayName":"kiwi","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-039BBE06A9EE5771DBCFDA11EEBCA47B-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":3021040335,"name":"ockdui","displayName":"kr_jin","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0F6107200478886E561539FAE9E14FD5-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":7408875000,"name":"SPIDER_208378","displayName":"MeTA9","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74BF9638E1F2BA28C066AA829EA4316D-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":8438998642,"name":"sgsajhw6","displayName":"sgsajhw6","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5A38AEE2F9D4B15D0EC0DDD574CD0E04-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":927948309,"name":"wailano214","displayName":"wailano214","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7CFEFE453790F35C71DCD89E8E1A2392-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2643542949,"name":"kujun_e3","displayName":"Watashi_SloppyNOOB","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-801D59ED20893F886E4684F55F169F1C-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":958097759,"name":"zeeeha","displayName":"White_Lemon","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-136AC725CBD8D74BF960B27B937CDEA7-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":3162443190,"name":"fjfjsjchdjdj","displayName":"wow","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0AC6E9F2119EFE861C7082A4584F3D56-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}}],"topNationalities":[{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}]},{"id":"3e483375-28b7-48de-a3c1-47e0037cf9b7","code":"ST","name":"Soul Tactics","img":"/resources/groups/st.png","created_at":"2026-08-12T10:52:28.09115+00:00","updated_at":"2026-08-27T08:08:41.819372+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","code":"VP","name":"Victory Path","img":"/resources/groups/vp.png","created_at":"2026-08-11T05:39:21.433718+00:00","updated_at":"2026-09-05T17:08:31.085075+00:00","group_relations":[{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"ally"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","relation":"ally"},{"id":"3e483375-28b7-48de-a3c1-47e0037cf9b7","relation":"neutral"},{"id":"4610fd9d-6719-480b-bade-9c1c9e20dd4d","relation":"hostile"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"},{"id":"f54eded9-ba4f-4503-b211-1a1a228d99ec","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[{"id":4016880457,"name":"Killercgara","displayName":"HATRED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-56474DC0F8CFD334722DC327C2D778C0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1331,"name":"nickrockcks","displayName":"nickrockcks","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1ECF3148D4C50987B206452CD368C02C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2566517950,"name":"Pyrite00","displayName":"Himmel","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7FC373E0E6C5D836117EE17716456D8F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4657562667,"name":"r_K2340","displayName":"rune1669","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D1BFFB4EA4D1112C254F427116510DB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3606286622,"name":"fghht120","displayName":"IShallNeverSurrender","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D3A8F7F5085EE3E48CA0B37F407156EE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5540496279,"name":"fghht124","displayName":"hello","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A1236B48272BE3FEB18A298CF0EC83B8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5495282792,"name":"fghhy120","displayName":"fghhtluckisfake","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A229A7843B225CB428B824B36D2DFDDA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1518448188,"name":"kbjychoi","displayName":"NKL_last","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DEEF9731AE73407B2895C3E24E32E2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9359231835,"name":"sanabi12345678","displayName":"burning_soul","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D6F4817CF764E14FC76977365BFA38E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5712574595,"name":"yhkjlpomn7","displayName":"Goseung","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-485ADA69F05F3CCFDF2B0E91F348E21D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2994355215,"name":"louissjune","displayName":"louissjune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4508183B58411E973DBAF429D2E8B49F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3366573442,"name":"hayaton1537","displayName":"hayaton1537","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-94C700B3DC33CB4AE4B04222F129B9A9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1522869310,"name":"7x7d7d8d","displayName":"Gilby","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B95F9BC0E7D61EA5D5EA1078997F0087-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3991320061,"name":"yj042217","displayName":"yj042217","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C22F3FDEF78402EFDE9B8654C4F4D3B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4273721629,"name":"rtysep","displayName":"command","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-936FD9F7B84951377B38762F517BFA2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4369128135,"name":"Inee0710","displayName":"MANGO_ElEl","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-83F74A29B8FCE514302C6BFF204CE77F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3146175328,"name":"KR_Usen","displayName":"Haruna","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AD5948C0E692C7C5B41B913FA1BA6EDE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4443685566,"name":"Lost_homiDream","displayName":"123","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4E2882EC80006C8AC452B3A16B23B8F9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3320488434,"name":"hayoon0425","displayName":"hayoon0425","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-59E2572FAB0EE3A73CB2533FCB217735-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4115400670,"name":"Mix77L","displayName":"Mix77L","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D968CE5D9C337157BE42957C6E95DBAD-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4604626269,"name":"eeeecBLI","displayName":"GOMAHA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E0913F0A070D0980BF1B4C5EDC38A4DA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2855998319,"name":"hajunlove14","displayName":"ENFP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B552F5BA6A50337A912042CAC8F2309-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5469376336,"name":"Zizon_mans","displayName":"Zizon_mans","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E1C339944CFF9833C48E2E90DFCB37A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7386139547,"name":"dedi_ing","displayName":"wait4urlove","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-322BECF2EF09C21A6BE7CEFF355379EA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1139396212,"name":"xxzxxadxeiwo","displayName":"IIII","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DFFB9D409A61AACFAF9ACECB34332E32-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460754430,"name":"002_brscg","displayName":"002_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-24F9EA5B046D27C587B7E847EA2B3BA6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9461453673,"name":"000_brscg","displayName":"000_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CCCF2C5C1065E6B032C49F1B709A36AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460951279,"name":"001_brscg","displayName":"001_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C0A86398512FECFF3CE2124D8DC43114-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10652978379,"name":"xj485c","displayName":"monet_c","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9BE0A2B74508701188288CF250D81546-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10570381160,"name":"chara500m","displayName":"Arahc","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F47925FFF12673F9A0E26DBBA03AD40-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1533809431,"name":"kimjione1023","displayName":"kimjione1023","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-19CDD4C7A115BE56303121CE07C582FF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4914904069,"name":"datat019","displayName":"datat019","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7DF45571BA33FE40BBA74CD753827675-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1148536830,"name":"JihoFamily","displayName":"Rtpalm","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EBA2E1A2DCC94D2D7AAE3B677FE61174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2586083131,"name":"yes_si4h","displayName":"yes_si4h","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F53B839C86EB13183E7857E48A6E5D46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":945971641,"name":"ray1378y","displayName":"Teto","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E6089AACA9CD5FD08F83AA3AC56072CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1985749424,"name":"yonggil27","displayName":"Hello1910","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1D7A631D69BB8465AA6D49015B1C223F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4098733337,"name":"euewryr","displayName":"eue","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-520300A5D14993E3DEBD699B66D5DAEB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3588487294,"name":"tarue_S23","displayName":"goodgame","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74333C72DF5481088F4B6C175D238820-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2589061719,"name":"NTQ_MEN","displayName":"NTQ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CBFF33453C94E32E269E0369CB6D7B72-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1209919599,"name":"gyqwpppl","displayName":"Shop_NPC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1B9011997740B5A988DF6BC169F1009D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10171344586,"name":"ererererer7140","displayName":"1234qqq","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0735448DF46689171696246975BEBE21-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2020055911,"name":"siyulmonmon","displayName":"NOOB","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-03B708E1602373035FF71166F0963AF9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5287236437,"name":"ectectectyou","displayName":"ectectectyou","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6AD17D262CE6D6EFF491A2D252745945-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10547914373,"name":"dkssud0427","displayName":"ABme","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-670FA5207870001D53E66D4D6F6DD0E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8345966518,"name":"wiwwwh4","displayName":"White","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B45BD91995798BBE31198A002A86F20B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3373053603,"name":"getveeh","displayName":"Getoutofhere","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C0505218A3221F7A64CE62C22D721E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2705705770,"name":"qwur02846","displayName":"raga_mini","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4E371DF1966280A041745AF31CAC5E0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10529505799,"name":"sans_serif4001","displayName":"roblox_AKUMA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0676D0339F7147ED7004B003696019E2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4352717446,"name":"SJKLH27","displayName":"Merzeno","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A899103E195C7AE474028BE6A426EC52-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2838225524,"name":"srururur4","displayName":"Miner_v","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A8294742E95182DB3BBF3945BED4DA44-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"RU","name":"Russia","img":"https://flagsapi.com/RU/flat/64.png"}},{"id":3518379412,"name":"momiji0911","displayName":"chocolatemint0911","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-983C4DFBD73C9A57B5BEB43C5CC942B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":2507071973,"name":"mink0302","displayName":"mink","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8F301044C62AFA7D037617D05CC95EED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5211697712,"name":"123gavebryan123oks","displayName":"Gave","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E20FC26F44371885DD446A558F30A9AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4235234920,"name":"Sk0iHatesHisFriends","displayName":"kharylsonly","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BAB26872B985DC908D888F38235A32B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":5514737971,"name":"mr_lonely20085","displayName":"LNX_frostie","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D000E798B6AE9B45F7A491714B7D12DE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10006443067,"name":"jtg2511n","displayName":"nameless","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FB3F6F7DD784F7E0E8D3D8938AA4782C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1744534728,"name":"jacob060709","displayName":"The_Memelord","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FA3BF92AB109FEA19742B41D133C7B97-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":8723484810,"name":"ElAlex_XDlol","displayName":"Hintelex","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-77CBE5F770B40A60BC8747C463ADEE0F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1882778514,"name":"henrybook0811","displayName":"Periastron","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-392B57C92DBB3A02CF8E509DA432EECF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1295475937,"name":"gggg167319","displayName":"gggg167319","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E95CE91F04EC35CAFC31CA588ADB2FA0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2863852238,"name":"chanhee2377","displayName":"Vendy","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-602ACB343C491C761BC8E5406C6EA8CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3694244340,"name":"B_yagyy","displayName":"kyky","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C343B333B6F5F15DB9A7187C3E2C7A0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2354231027,"name":"a307763","displayName":"a307763","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-178758FC89AAAB298F4E177A0F7C8EFE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1285247898,"name":"RowzG","displayName":"RowzG","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EE48BE2BF87B7633C43B78519C62FF62-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2645431890,"name":"fgdhtghtggr","displayName":"fgdhtghtggr","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6DF2BF825AF954259E2E98CD524B3DF8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4678848229,"name":"pswoo_jason13","displayName":"pswoo_jason13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-236F4DA64BC319830ABAC00ADAF58736-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5832790026,"name":"daniel_78961","displayName":"daniel_78961","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C9A086134F4F2B37288AB4D0C898297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1190975846,"name":"rtybill","displayName":"rtybill","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA714D47C40709F119E751855176A5D4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1158541596,"name":"junwooblabla","displayName":"ICECREAM","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6ADC05FE535273F7F1A383BFD477AD5C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1242250842,"name":"eduezht","displayName":"eduezht","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F315A1DAA6689289B29A546AA381CE1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1665149193,"name":"prettyssoom","displayName":"BLUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-734A782EDA28E5B6ADCAE8F6CFC3A1AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2313174982,"name":"airbag_31","displayName":"airbag_31","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-38E3B88560533354FEB0B3C067CDF1A2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10449374438,"name":"up8nv","displayName":"up8nv","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-761DE885C389E642BCC4E0669E5312F0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8126447450,"name":"everyallacc","displayName":"Yaong1213","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-995081E21BAB8A4D171956F53DAA73B7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3228410728,"name":"kr_0345","displayName":"Frisk","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F1C43BD784531C3EA85FC16707424B6E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":6024208055,"name":"xcquller","displayName":"xcquller","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-58E94244F5305BD4E93CE19934EE1DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2771854594,"name":"abcdefg45uu","displayName":"abcdefg45uu","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DA422FB54B75B1CAF53F25FAE80D0124-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8758596225,"name":"yesEZprism","displayName":"KD_99PentaBLITZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B0FB1844800D15D6B3BED3D76E54002-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3824302990,"name":"cyfrff","displayName":"cyfrff","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5A5920523BD52586A755986CE81A96D1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1263629161,"name":"goodys13","displayName":"goodys13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4DFCB55F2FFEFCB2F7C4DCC23F6AADE9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2217841355,"name":"Tomvbczz","displayName":"FRISK","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA650FF19963203F75C76647BFE7A880-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1824366114,"name":"BloodFlower12255","displayName":"Flora","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2FE53E17B462F18A60136C5873A00BE8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2222407382,"name":"megsaieon1972","displayName":"meg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-71678992A5CBAE7456739008C6921B2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1385517949,"name":"shmeueiwiw","displayName":"shmeueiwiw","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2BA5D9CDA750A8C73A20437DFD58D4BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4373021482,"name":"spyder_GUN","displayName":"GERerika","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3885EB22F7BCEE4CCFF70715043B0D41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3492289739,"name":"seojj1133","displayName":"Happy_0113","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D5D0EE558B658EF4691BDDD5E0D97865-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3278664128,"name":"qeqwerwerfar","displayName":"Chronos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-953740D790DE44A61049D179ED41E174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1749377682,"name":"swat13893","displayName":"swat13893","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9E401CA9770054B709FF5A6429E2201D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5848446007,"name":"kotaro34112","displayName":"Ramune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3010CD16E4BCB0123134729EBF1B34BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2804538768,"name":"liliang123456789","displayName":"juezi_awa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-78A2C2FDA2E041DDF35092164F3752DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4046560868,"name":"the_XHR","displayName":"Not_speakEnglis","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B763FF476DB7E049D98203A32E5D6904-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1905522183,"name":"1516gd","displayName":"Forsaken","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8D02FF5EEFE0797F2CB2D07DE7AADFF0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7074699037,"name":"hohyun0704howg","displayName":"hohyun0704howg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-651599EB6E8AC82E58BD598C199CED39-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8268752749,"name":"dhehdgus567","displayName":"donghy_1","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4A56F04B814BF8FC06D045FAB31BB9C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5125355211,"name":"dungdungdunghhh","displayName":"sad","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B032A3EB3A22A2F6D1C0BC63F1FF3AAB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5465702541,"name":"ASMRABBIT","displayName":"MRC_YourFace","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E5CDC2D59887C64FA0DE2C101F4BDC41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10420341860,"name":"joefaerg","displayName":"joefaerg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A0A42110F6707718AF6E94465F255333-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4594370728,"name":"Subspacer_0","displayName":"Solemn_Lament","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C41C3310E41E7FB82D41B32EC60724-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3187703552,"name":"didididhodho","displayName":"KR_noob","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-685B92B5B8C7CB3A683F1E8D7AF0CC1C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8224069454,"name":"lllillili7","displayName":"lllillili7","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4CCA634F2385FFF3EE48C69777BA3102-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7641127080,"name":"Shukshukbung","displayName":"feds","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E3F5E51F0B437055A357CC3ED1092664-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7408875000,"name":"SPIDER_208378","displayName":"MeTA9","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74BF9638E1F2BA28C066AA829EA4316D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5840476869,"name":"AACCBB_1322","displayName":"ABC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BD711409331D5A63BD93D6D0468D947D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2921315517,"name":"ghosthanzzing","displayName":"IDKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C136B5D4131C38AA742672D0FF5CEC6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":609696393,"name":"Fennik321","displayName":"Myu","hasVerifiedBadge":false,"img":null,"relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9111302785,"name":"akejdo28","displayName":"star","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5ACB6191007EE41945986628DE3A81A7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3312381246,"name":"error778123","displayName":"hypersonicgdKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-745822F0DF147E885B16316F7611827A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4974302427,"name":"GTGISAKOF","displayName":"GTGISAKOF","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C53171D0ECC8902F8A04AACD56D41BA7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7253007466,"name":"GTGISAKOF3","displayName":"GTGISAKOF3","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7F4ADF59CA2D88EA61E256D3C4264A9D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7227818767,"name":"ezwksksi43","displayName":"lamine_yamal","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D4475171A29437C510318DC1166E43D2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2284412220,"name":"dkwl0154","displayName":"XD_CDuootKYii","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3D9E5A2E0FA2C95A2FAED0D195B479A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4568375253,"name":"Lost_Seoyu","displayName":"Duntzki","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-36251A8C778E134F508CD4335F19A23B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1248273231,"name":"sok1476","displayName":"Dr_soak","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EC2F231E9D633A337DAB863E12D82B46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1193126726,"name":"yhlove04","displayName":"yuha","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CF2E5F64E033450BD6076B8276B4B1DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8498902589,"name":"RoyTheUltimateBoy","displayName":"CheerioDude","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-79CDB58E8B6799352698E5E6E68FBEB2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1218176765,"name":"ZackaryUchi","displayName":"DrDRAKE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6C095DE24BC9ED9FF1FEBF32FDC85C23-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10596667705,"name":"qponmoa","displayName":"qponmoa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FDF54DE0FDD3002C58F26A0541AF9A68-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1960223208,"name":"tgfethg3","displayName":"k0mxn","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AE5F135AB3D59F2D0E7D7504797AFB76-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3260768991,"name":"Austinchoo950003","displayName":"Kokushibo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29FAE409D4DF610D01630AB41431182C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"MY","name":"Malaysia","img":"https://flagsapi.com/MY/flat/64.png"}},{"id":1062351835,"name":"ridwan832010","displayName":"STATUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B5AC295029254F41526D64F96378904E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"ID","name":"Indonesia","img":"https://flagsapi.com/ID/flat/64.png"}},{"id":7217583301,"name":"eievdjwwe","displayName":"Deimos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA2D05C85132888C6C0596561DF7E3ED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4585957518,"name":"kjs_1104","displayName":"Abit","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-658B49D56675B011217C0AEB3436AF26-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4679400313,"name":"Wsjsmsms6","displayName":"tomato","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C357F7B6A7904AAC8FC1DB032D1BDF82-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5368880742,"name":"Gaster_053","displayName":"Ivy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3154EC8846846ECDF64B46B02CACEBB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4079845639,"name":"yhoo9939","displayName":"lvy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-477A13E15A16F600A5A2128A4C84FFEE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4514979397,"name":"sin_kun0308","displayName":"sin_kun0308","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E342BABEB364B515BA6C175175100DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":7726281095,"name":"gauajshua","displayName":"gau","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DAAE876655EDBD37EB42C6DFEA26525E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5175911121,"name":"konmame0316","displayName":"raitia1129","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F58F419C2F406FD68EA6FFFDA6774050-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":3974704043,"name":"SAZUNNd","displayName":"MOST_HATED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0F0678B090FD530C927D8470803555BC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5685575440,"name":"jhace_405","displayName":"hinakosan","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3000D5741CE28ACB763ABA4641649297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4740903245,"name":"jkzwinter123","displayName":"S4LM4","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-89DECBA1CFCEF5F9B9311510E0A3C767-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4453574252,"name":"cucurub1_22","displayName":"cucurub1_22","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A7F750C1D75AEB8A2CC100411B6AF185-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3608855215,"name":"namenametantan","displayName":"nametan_Slug","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA87C50EB83DF51955E29D23AA15DFAF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":9296673653,"name":"HARUAKI120912","displayName":"HARUAKI120912","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2F2BDBF8F1FE57849EF15E3736736FB5-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10974610615,"name":"r1117_606","displayName":"Flowey","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8358D910DDC37461920C0BB89877CD01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":4521062524,"name":"Epicbaconrugh","displayName":"Ronaldinho","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7CD049189B45D2D47091C310F8926814-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10960362047,"name":"ACADQP","displayName":"ACADQP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3E8821C21BD3E9A06F644E367AF94D01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1188607501,"name":"BYSONSUZ","displayName":"BYSONSUZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DF0986FDD8AB1709F00A0117D8F5B66-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"TR","name":"Turkey","img":"https://flagsapi.com/TR/flat/64.png"}}],"relation":"neutral"}],"users_relations":[],"roles":[{"id":3187890509,"name":"geuleonjis","displayName":"9eu1eon","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AC93968784C99D589C694EAF654CC96C-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1805099987,"name":"zmxjbj","displayName":"arfirefly","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6549961297FA84CDFEFBE8EC19C51215-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2486946986,"name":"BaekAH0923","displayName":"BaekAH","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AD76D68D455C2598AF80713789646060-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2351473874,"name":"chadonam2009","displayName":"chadonam","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-589C86B2DED5E4260E15CB3880E3E7DC-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":961201525,"name":"wtawra","displayName":"paradiselost_leon","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EBB43D048FE43AD35F8E608B2AC90FD7-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}}],"topNationalities":[{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}]},{"id":"b1991a60-87cd-4dec-97fe-29280c05495a","code":"UC","name":"Unbreakable chains","img":"/resources/groups/uc.png","created_at":"2026-08-11T20:23:02.270329+00:00","updated_at":"2026-08-27T08:08:48.609931+00:00","group_relations":[],"users_relations":[],"roles":[{"id":2351473874,"name":"chadonam2009","displayName":"chadonam","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-589C86B2DED5E4260E15CB3880E3E7DC-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4735642194,"name":"Dxrk_RAVE9","displayName":"jaketv_infp","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DC09E70072CCFF64F10D5EAB9D7E9B16-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":961201525,"name":"wtawra","displayName":"paradiselost_leon","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EBB43D048FE43AD35F8E608B2AC90FD7-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3187890509,"name":"geuleonjis","displayName":"9eu1eon","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AC93968784C99D589C694EAF654CC96C-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1314367095,"name":"aaa43f","displayName":"aaa43f","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-90DC2362D529B89292789BA6D77CC2E6-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2486946986,"name":"BaekAH0923","displayName":"BaekAH","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AD76D68D455C2598AF80713789646060-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2320503296,"name":"YEONRONG","displayName":"BBuriTen","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E799633B851B928CF0AC9E957DCCEE01-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":975001537,"name":"LUGA_aksj1923","displayName":"luga","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-54E3CEE0825F2C0FB49D2890D12AF3C4-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2467754573,"name":"stonma1","displayName":"Marinejolge","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BB5B626726F93D130CBF780B58C55731-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":838371529,"name":"lhj428","displayName":"MONTAGEM_HIKARI","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E6AD84BEAF323FF905C2C72ED7BE98B1-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"UN","name":"Unknown","img":"https://cdn-icons-png.flaticon.com/512/3875/3875148.png"}},{"id":7365741056,"name":"ytm06j","displayName":"ToMaTo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FAA54A702130990F038C1D4A683AD530-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}}],"topNationalities":[{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}]},{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","code":"JA","name":"Japan Army","img":"/resources/groups/ja.png","created_at":"2026-08-11T07:14:19.141632+00:00","updated_at":"2026-09-01T13:53:08.181317+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","code":"VP","name":"Victory Path","img":"/resources/groups/vp.png","created_at":"2026-08-11T05:39:21.433718+00:00","updated_at":"2026-09-05T17:08:31.085075+00:00","group_relations":[{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"ally"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","relation":"ally"},{"id":"3e483375-28b7-48de-a3c1-47e0037cf9b7","relation":"neutral"},{"id":"4610fd9d-6719-480b-bade-9c1c9e20dd4d","relation":"hostile"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"},{"id":"f54eded9-ba4f-4503-b211-1a1a228d99ec","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[{"id":4016880457,"name":"Killercgara","displayName":"HATRED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-56474DC0F8CFD334722DC327C2D778C0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1331,"name":"nickrockcks","displayName":"nickrockcks","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1ECF3148D4C50987B206452CD368C02C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2566517950,"name":"Pyrite00","displayName":"Himmel","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7FC373E0E6C5D836117EE17716456D8F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4657562667,"name":"r_K2340","displayName":"rune1669","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D1BFFB4EA4D1112C254F427116510DB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3606286622,"name":"fghht120","displayName":"IShallNeverSurrender","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D3A8F7F5085EE3E48CA0B37F407156EE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5540496279,"name":"fghht124","displayName":"hello","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A1236B48272BE3FEB18A298CF0EC83B8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5495282792,"name":"fghhy120","displayName":"fghhtluckisfake","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A229A7843B225CB428B824B36D2DFDDA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1518448188,"name":"kbjychoi","displayName":"NKL_last","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DEEF9731AE73407B2895C3E24E32E2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9359231835,"name":"sanabi12345678","displayName":"burning_soul","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D6F4817CF764E14FC76977365BFA38E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5712574595,"name":"yhkjlpomn7","displayName":"Goseung","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-485ADA69F05F3CCFDF2B0E91F348E21D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2994355215,"name":"louissjune","displayName":"louissjune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4508183B58411E973DBAF429D2E8B49F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3366573442,"name":"hayaton1537","displayName":"hayaton1537","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-94C700B3DC33CB4AE4B04222F129B9A9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1522869310,"name":"7x7d7d8d","displayName":"Gilby","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B95F9BC0E7D61EA5D5EA1078997F0087-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3991320061,"name":"yj042217","displayName":"yj042217","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C22F3FDEF78402EFDE9B8654C4F4D3B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4273721629,"name":"rtysep","displayName":"command","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-936FD9F7B84951377B38762F517BFA2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4369128135,"name":"Inee0710","displayName":"MANGO_ElEl","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-83F74A29B8FCE514302C6BFF204CE77F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3146175328,"name":"KR_Usen","displayName":"Haruna","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AD5948C0E692C7C5B41B913FA1BA6EDE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4443685566,"name":"Lost_homiDream","displayName":"123","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4E2882EC80006C8AC452B3A16B23B8F9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3320488434,"name":"hayoon0425","displayName":"hayoon0425","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-59E2572FAB0EE3A73CB2533FCB217735-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4115400670,"name":"Mix77L","displayName":"Mix77L","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D968CE5D9C337157BE42957C6E95DBAD-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4604626269,"name":"eeeecBLI","displayName":"GOMAHA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E0913F0A070D0980BF1B4C5EDC38A4DA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2855998319,"name":"hajunlove14","displayName":"ENFP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B552F5BA6A50337A912042CAC8F2309-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5469376336,"name":"Zizon_mans","displayName":"Zizon_mans","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E1C339944CFF9833C48E2E90DFCB37A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7386139547,"name":"dedi_ing","displayName":"wait4urlove","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-322BECF2EF09C21A6BE7CEFF355379EA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1139396212,"name":"xxzxxadxeiwo","displayName":"IIII","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DFFB9D409A61AACFAF9ACECB34332E32-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460754430,"name":"002_brscg","displayName":"002_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-24F9EA5B046D27C587B7E847EA2B3BA6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9461453673,"name":"000_brscg","displayName":"000_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CCCF2C5C1065E6B032C49F1B709A36AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460951279,"name":"001_brscg","displayName":"001_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C0A86398512FECFF3CE2124D8DC43114-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10652978379,"name":"xj485c","displayName":"monet_c","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9BE0A2B74508701188288CF250D81546-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10570381160,"name":"chara500m","displayName":"Arahc","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F47925FFF12673F9A0E26DBBA03AD40-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1533809431,"name":"kimjione1023","displayName":"kimjione1023","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-19CDD4C7A115BE56303121CE07C582FF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4914904069,"name":"datat019","displayName":"datat019","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7DF45571BA33FE40BBA74CD753827675-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1148536830,"name":"JihoFamily","displayName":"Rtpalm","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EBA2E1A2DCC94D2D7AAE3B677FE61174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2586083131,"name":"yes_si4h","displayName":"yes_si4h","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F53B839C86EB13183E7857E48A6E5D46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":945971641,"name":"ray1378y","displayName":"Teto","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E6089AACA9CD5FD08F83AA3AC56072CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1985749424,"name":"yonggil27","displayName":"Hello1910","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1D7A631D69BB8465AA6D49015B1C223F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4098733337,"name":"euewryr","displayName":"eue","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-520300A5D14993E3DEBD699B66D5DAEB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3588487294,"name":"tarue_S23","displayName":"goodgame","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74333C72DF5481088F4B6C175D238820-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2589061719,"name":"NTQ_MEN","displayName":"NTQ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CBFF33453C94E32E269E0369CB6D7B72-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1209919599,"name":"gyqwpppl","displayName":"Shop_NPC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1B9011997740B5A988DF6BC169F1009D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10171344586,"name":"ererererer7140","displayName":"1234qqq","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0735448DF46689171696246975BEBE21-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2020055911,"name":"siyulmonmon","displayName":"NOOB","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-03B708E1602373035FF71166F0963AF9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5287236437,"name":"ectectectyou","displayName":"ectectectyou","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6AD17D262CE6D6EFF491A2D252745945-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10547914373,"name":"dkssud0427","displayName":"ABme","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-670FA5207870001D53E66D4D6F6DD0E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8345966518,"name":"wiwwwh4","displayName":"White","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B45BD91995798BBE31198A002A86F20B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3373053603,"name":"getveeh","displayName":"Getoutofhere","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C0505218A3221F7A64CE62C22D721E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2705705770,"name":"qwur02846","displayName":"raga_mini","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4E371DF1966280A041745AF31CAC5E0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10529505799,"name":"sans_serif4001","displayName":"roblox_AKUMA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0676D0339F7147ED7004B003696019E2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4352717446,"name":"SJKLH27","displayName":"Merzeno","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A899103E195C7AE474028BE6A426EC52-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2838225524,"name":"srururur4","displayName":"Miner_v","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A8294742E95182DB3BBF3945BED4DA44-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"RU","name":"Russia","img":"https://flagsapi.com/RU/flat/64.png"}},{"id":3518379412,"name":"momiji0911","displayName":"chocolatemint0911","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-983C4DFBD73C9A57B5BEB43C5CC942B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":2507071973,"name":"mink0302","displayName":"mink","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8F301044C62AFA7D037617D05CC95EED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5211697712,"name":"123gavebryan123oks","displayName":"Gave","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E20FC26F44371885DD446A558F30A9AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4235234920,"name":"Sk0iHatesHisFriends","displayName":"kharylsonly","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BAB26872B985DC908D888F38235A32B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":5514737971,"name":"mr_lonely20085","displayName":"LNX_frostie","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D000E798B6AE9B45F7A491714B7D12DE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10006443067,"name":"jtg2511n","displayName":"nameless","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FB3F6F7DD784F7E0E8D3D8938AA4782C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1744534728,"name":"jacob060709","displayName":"The_Memelord","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FA3BF92AB109FEA19742B41D133C7B97-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":8723484810,"name":"ElAlex_XDlol","displayName":"Hintelex","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-77CBE5F770B40A60BC8747C463ADEE0F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1882778514,"name":"henrybook0811","displayName":"Periastron","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-392B57C92DBB3A02CF8E509DA432EECF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1295475937,"name":"gggg167319","displayName":"gggg167319","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E95CE91F04EC35CAFC31CA588ADB2FA0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2863852238,"name":"chanhee2377","displayName":"Vendy","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-602ACB343C491C761BC8E5406C6EA8CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3694244340,"name":"B_yagyy","displayName":"kyky","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C343B333B6F5F15DB9A7187C3E2C7A0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2354231027,"name":"a307763","displayName":"a307763","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-178758FC89AAAB298F4E177A0F7C8EFE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1285247898,"name":"RowzG","displayName":"RowzG","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EE48BE2BF87B7633C43B78519C62FF62-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2645431890,"name":"fgdhtghtggr","displayName":"fgdhtghtggr","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6DF2BF825AF954259E2E98CD524B3DF8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4678848229,"name":"pswoo_jason13","displayName":"pswoo_jason13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-236F4DA64BC319830ABAC00ADAF58736-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5832790026,"name":"daniel_78961","displayName":"daniel_78961","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C9A086134F4F2B37288AB4D0C898297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1190975846,"name":"rtybill","displayName":"rtybill","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA714D47C40709F119E751855176A5D4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1158541596,"name":"junwooblabla","displayName":"ICECREAM","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6ADC05FE535273F7F1A383BFD477AD5C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1242250842,"name":"eduezht","displayName":"eduezht","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F315A1DAA6689289B29A546AA381CE1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1665149193,"name":"prettyssoom","displayName":"BLUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-734A782EDA28E5B6ADCAE8F6CFC3A1AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2313174982,"name":"airbag_31","displayName":"airbag_31","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-38E3B88560533354FEB0B3C067CDF1A2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10449374438,"name":"up8nv","displayName":"up8nv","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-761DE885C389E642BCC4E0669E5312F0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8126447450,"name":"everyallacc","displayName":"Yaong1213","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-995081E21BAB8A4D171956F53DAA73B7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3228410728,"name":"kr_0345","displayName":"Frisk","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F1C43BD784531C3EA85FC16707424B6E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":6024208055,"name":"xcquller","displayName":"xcquller","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-58E94244F5305BD4E93CE19934EE1DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2771854594,"name":"abcdefg45uu","displayName":"abcdefg45uu","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DA422FB54B75B1CAF53F25FAE80D0124-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8758596225,"name":"yesEZprism","displayName":"KD_99PentaBLITZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B0FB1844800D15D6B3BED3D76E54002-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3824302990,"name":"cyfrff","displayName":"cyfrff","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5A5920523BD52586A755986CE81A96D1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1263629161,"name":"goodys13","displayName":"goodys13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4DFCB55F2FFEFCB2F7C4DCC23F6AADE9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2217841355,"name":"Tomvbczz","displayName":"FRISK","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA650FF19963203F75C76647BFE7A880-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1824366114,"name":"BloodFlower12255","displayName":"Flora","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2FE53E17B462F18A60136C5873A00BE8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2222407382,"name":"megsaieon1972","displayName":"meg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-71678992A5CBAE7456739008C6921B2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1385517949,"name":"shmeueiwiw","displayName":"shmeueiwiw","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2BA5D9CDA750A8C73A20437DFD58D4BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4373021482,"name":"spyder_GUN","displayName":"GERerika","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3885EB22F7BCEE4CCFF70715043B0D41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3492289739,"name":"seojj1133","displayName":"Happy_0113","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D5D0EE558B658EF4691BDDD5E0D97865-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3278664128,"name":"qeqwerwerfar","displayName":"Chronos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-953740D790DE44A61049D179ED41E174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1749377682,"name":"swat13893","displayName":"swat13893","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9E401CA9770054B709FF5A6429E2201D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5848446007,"name":"kotaro34112","displayName":"Ramune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3010CD16E4BCB0123134729EBF1B34BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2804538768,"name":"liliang123456789","displayName":"juezi_awa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-78A2C2FDA2E041DDF35092164F3752DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4046560868,"name":"the_XHR","displayName":"Not_speakEnglis","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B763FF476DB7E049D98203A32E5D6904-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1905522183,"name":"1516gd","displayName":"Forsaken","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8D02FF5EEFE0797F2CB2D07DE7AADFF0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7074699037,"name":"hohyun0704howg","displayName":"hohyun0704howg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-651599EB6E8AC82E58BD598C199CED39-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8268752749,"name":"dhehdgus567","displayName":"donghy_1","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4A56F04B814BF8FC06D045FAB31BB9C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5125355211,"name":"dungdungdunghhh","displayName":"sad","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B032A3EB3A22A2F6D1C0BC63F1FF3AAB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5465702541,"name":"ASMRABBIT","displayName":"MRC_YourFace","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E5CDC2D59887C64FA0DE2C101F4BDC41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10420341860,"name":"joefaerg","displayName":"joefaerg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A0A42110F6707718AF6E94465F255333-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4594370728,"name":"Subspacer_0","displayName":"Solemn_Lament","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C41C3310E41E7FB82D41B32EC60724-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3187703552,"name":"didididhodho","displayName":"KR_noob","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-685B92B5B8C7CB3A683F1E8D7AF0CC1C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8224069454,"name":"lllillili7","displayName":"lllillili7","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4CCA634F2385FFF3EE48C69777BA3102-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7641127080,"name":"Shukshukbung","displayName":"feds","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E3F5E51F0B437055A357CC3ED1092664-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7408875000,"name":"SPIDER_208378","displayName":"MeTA9","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74BF9638E1F2BA28C066AA829EA4316D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5840476869,"name":"AACCBB_1322","displayName":"ABC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BD711409331D5A63BD93D6D0468D947D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2921315517,"name":"ghosthanzzing","displayName":"IDKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C136B5D4131C38AA742672D0FF5CEC6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":609696393,"name":"Fennik321","displayName":"Myu","hasVerifiedBadge":false,"img":null,"relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9111302785,"name":"akejdo28","displayName":"star","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5ACB6191007EE41945986628DE3A81A7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3312381246,"name":"error778123","displayName":"hypersonicgdKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-745822F0DF147E885B16316F7611827A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4974302427,"name":"GTGISAKOF","displayName":"GTGISAKOF","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C53171D0ECC8902F8A04AACD56D41BA7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7253007466,"name":"GTGISAKOF3","displayName":"GTGISAKOF3","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7F4ADF59CA2D88EA61E256D3C4264A9D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7227818767,"name":"ezwksksi43","displayName":"lamine_yamal","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D4475171A29437C510318DC1166E43D2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2284412220,"name":"dkwl0154","displayName":"XD_CDuootKYii","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3D9E5A2E0FA2C95A2FAED0D195B479A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4568375253,"name":"Lost_Seoyu","displayName":"Duntzki","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-36251A8C778E134F508CD4335F19A23B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1248273231,"name":"sok1476","displayName":"Dr_soak","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EC2F231E9D633A337DAB863E12D82B46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1193126726,"name":"yhlove04","displayName":"yuha","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CF2E5F64E033450BD6076B8276B4B1DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8498902589,"name":"RoyTheUltimateBoy","displayName":"CheerioDude","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-79CDB58E8B6799352698E5E6E68FBEB2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1218176765,"name":"ZackaryUchi","displayName":"DrDRAKE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6C095DE24BC9ED9FF1FEBF32FDC85C23-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10596667705,"name":"qponmoa","displayName":"qponmoa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FDF54DE0FDD3002C58F26A0541AF9A68-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1960223208,"name":"tgfethg3","displayName":"k0mxn","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AE5F135AB3D59F2D0E7D7504797AFB76-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3260768991,"name":"Austinchoo950003","displayName":"Kokushibo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29FAE409D4DF610D01630AB41431182C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"MY","name":"Malaysia","img":"https://flagsapi.com/MY/flat/64.png"}},{"id":1062351835,"name":"ridwan832010","displayName":"STATUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B5AC295029254F41526D64F96378904E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"ID","name":"Indonesia","img":"https://flagsapi.com/ID/flat/64.png"}},{"id":7217583301,"name":"eievdjwwe","displayName":"Deimos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA2D05C85132888C6C0596561DF7E3ED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4585957518,"name":"kjs_1104","displayName":"Abit","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-658B49D56675B011217C0AEB3436AF26-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4679400313,"name":"Wsjsmsms6","displayName":"tomato","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C357F7B6A7904AAC8FC1DB032D1BDF82-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5368880742,"name":"Gaster_053","displayName":"Ivy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3154EC8846846ECDF64B46B02CACEBB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4079845639,"name":"yhoo9939","displayName":"lvy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-477A13E15A16F600A5A2128A4C84FFEE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4514979397,"name":"sin_kun0308","displayName":"sin_kun0308","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E342BABEB364B515BA6C175175100DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":7726281095,"name":"gauajshua","displayName":"gau","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DAAE876655EDBD37EB42C6DFEA26525E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5175911121,"name":"konmame0316","displayName":"raitia1129","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F58F419C2F406FD68EA6FFFDA6774050-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":3974704043,"name":"SAZUNNd","displayName":"MOST_HATED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0F0678B090FD530C927D8470803555BC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5685575440,"name":"jhace_405","displayName":"hinakosan","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3000D5741CE28ACB763ABA4641649297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4740903245,"name":"jkzwinter123","displayName":"S4LM4","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-89DECBA1CFCEF5F9B9311510E0A3C767-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4453574252,"name":"cucurub1_22","displayName":"cucurub1_22","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A7F750C1D75AEB8A2CC100411B6AF185-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3608855215,"name":"namenametantan","displayName":"nametan_Slug","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA87C50EB83DF51955E29D23AA15DFAF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":9296673653,"name":"HARUAKI120912","displayName":"HARUAKI120912","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2F2BDBF8F1FE57849EF15E3736736FB5-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10974610615,"name":"r1117_606","displayName":"Flowey","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8358D910DDC37461920C0BB89877CD01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":4521062524,"name":"Epicbaconrugh","displayName":"Ronaldinho","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7CD049189B45D2D47091C310F8926814-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10960362047,"name":"ACADQP","displayName":"ACADQP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3E8821C21BD3E9A06F644E367AF94D01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1188607501,"name":"BYSONSUZ","displayName":"BYSONSUZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DF0986FDD8AB1709F00A0117D8F5B66-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"TR","name":"Turkey","img":"https://flagsapi.com/TR/flat/64.png"}}],"relation":"ally"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","code":"LNX","name":"Ligma Nation X","img":"https://i.postimg.cc/htm6qCh8/LOGO-LNX1.png","created_at":"2026-08-11T20:04:49.556851+00:00","updated_at":"2026-08-23T01:49:29.101022+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"ally"},{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"neutral"},{"id":"4610fd9d-6719-480b-bade-9c1c9e20dd4d","relation":"hostile"}],"users_relations":[],"relation":"neutral"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","code":"CN","name":"China","img":"https://upload.wikimedia.org/wikipedia/commons/f/fa/Flag_of_the_People%27s_Republic_of_China.svg?utm_source=ko.wikipedia.org&utm_campaign=index&utm_content=original","created_at":"2026-08-20T11:00:19.09371+00:00","updated_at":"2026-09-05T17:49:02.08855+00:00","group_relations":[{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"hostile"},{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[],"relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","code":"TW","name":"Taiwan Group","img":"https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/Flag_of_the_Republic_of_China.svg/250px-Flag_of_the_Republic_of_China.svg.png?utm_source=simple.wikipedia.org&utm_campaign=parser&utm_content=thumbnail","created_at":"2026-09-01T13:49:36.880905+00:00","updated_at":"2026-09-05T17:48:23.220529+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"hostile"},{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"hostile"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"}],"users_relations":[],"relation":"hostile"}],"users_relations":[{"id":10801833505,"name":"SonarDispatched","displayName":"Solar","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6D416B43E35918DF4669DA7F946A2F50-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"US","name":"United States","img":"https://flagsapi.com/US/flat/64.png"}},{"id":4144394027,"name":"P4rtyWithGhost","displayName":"Taxer","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C3CF9AA58CFAD0B17D17E1A76331FC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"ID","name":"Indonesia","img":"https://flagsapi.com/ID/flat/64.png"}}],"roles":[{"id":3167641204,"name":"mao248004","displayName":"Kurogane","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-10C72A985EFA9886289A1D810D27DEFC-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5774567078,"name":"TheBestOfAll1997","displayName":"CHEON_known","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-ACCF91F734E311F4A0EF23C3EDA54284-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7726281095,"name":"gauajshua","displayName":"gau","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DAAE876655EDBD37EB42C6DFEA26525E-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":6221832139,"name":"dlwnsdud58","displayName":"ggyddo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-050C17F984E548C527D5B93D9F6741D0-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3905529334,"name":"Hinamire9","displayName":"Given_DREAM","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AD47DDF41F425F4596CFBF7BFD05C146-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":4752032976,"name":"renren66230","displayName":"Hakugin","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4826CED6FADF2840BAC887A570CCA67-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10419052084,"name":"Masonolink","displayName":"Masonolink","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A41D42DE8488964E8DA36B7AFB1A7BD6-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1786117931,"name":"uav1010","displayName":"uav1010","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-090A673736AFB3B1D252655E7B55C476-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10701730936,"name":"APgifter56","displayName":"v0ltForZxCRising_JA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-15474E858B96733C63EF125D60F9F4D6-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":4079378799,"name":"Wynhttt","displayName":"VioNern","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-15546CE954CE0EBD2AB3DC1278325A7C-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":2960331334,"name":"shintarou_0626","displayName":"\u3060\u307f\u30fc","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E25E7373BE9E83DF7F7E35D54386287E-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}}],"topNationalities":[{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"},{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}]},{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","code":"VP","name":"Victory Path","img":"/resources/groups/vp.png","created_at":"2026-08-11T05:39:21.433718+00:00","updated_at":"2026-09-05T17:08:31.085075+00:00","group_relations":[{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","code":"JA","name":"Japan Army","img":"/resources/groups/ja.png","created_at":"2026-08-11T07:14:19.141632+00:00","updated_at":"2026-09-01T13:53:08.181317+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"ally"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","relation":"neutral"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[{"id":10801833505,"name":"SonarDispatched","displayName":"Solar","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6D416B43E35918DF4669DA7F946A2F50-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"US","name":"United States","img":"https://flagsapi.com/US/flat/64.png"}},{"id":4144394027,"name":"P4rtyWithGhost","displayName":"Taxer","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C3CF9AA58CFAD0B17D17E1A76331FC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"ID","name":"Indonesia","img":"https://flagsapi.com/ID/flat/64.png"}}],"relation":"ally"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","code":"LNX","name":"Ligma Nation X","img":"https://i.postimg.cc/htm6qCh8/LOGO-LNX1.png","created_at":"2026-08-11T20:04:49.556851+00:00","updated_at":"2026-08-23T01:49:29.101022+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"ally"},{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"neutral"},{"id":"4610fd9d-6719-480b-bade-9c1c9e20dd4d","relation":"hostile"}],"users_relations":[],"relation":"ally"},{"id":"3e483375-28b7-48de-a3c1-47e0037cf9b7","code":"ST","name":"Soul Tactics","img":"/resources/groups/st.png","created_at":"2026-08-12T10:52:28.09115+00:00","updated_at":"2026-08-27T08:08:41.819372+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"neutral"}],"users_relations":[],"relation":"neutral"},{"id":"4610fd9d-6719-480b-bade-9c1c9e20dd4d","code":"XI","name":"XI","img":"https://cdn.discordapp.com/avatars/1175229029633232987/39693648c5d0acb6448f527aeb42f67d.webp?size=100","created_at":"2026-08-20T12:17:23.195733+00:00","updated_at":"2026-08-23T01:48:49.498589+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"hostile"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","relation":"hostile"}],"users_relations":[],"relation":"hostile"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","code":"CN","name":"China","img":"https://upload.wikimedia.org/wikipedia/commons/f/fa/Flag_of_the_People%27s_Republic_of_China.svg?utm_source=ko.wikipedia.org&utm_campaign=index&utm_content=original","created_at":"2026-08-20T11:00:19.09371+00:00","updated_at":"2026-09-05T17:49:02.08855+00:00","group_relations":[{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"hostile"},{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[],"relation":"hostile"},{"id":"f54eded9-ba4f-4503-b211-1a1a228d99ec","code":"CHEON","name":"CHEON","img":"https://cdn.discordapp.com/icons/986942524792901632/8dff36cda8093c846cdbcc2e8c07f19e.webp?size=100&quality=lossless","created_at":"2026-08-21T11:47:16.682748+00:00","updated_at":"2026-08-21T12:53:15.273122+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"hostile"}],"users_relations":[],"relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","code":"TW","name":"Taiwan Group","img":"https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/Flag_of_the_Republic_of_China.svg/250px-Flag_of_the_Republic_of_China.svg.png?utm_source=simple.wikipedia.org&utm_campaign=parser&utm_content=thumbnail","created_at":"2026-09-01T13:49:36.880905+00:00","updated_at":"2026-09-05T17:48:23.220529+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"hostile"},{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"hostile"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"}],"users_relations":[],"relation":"hostile"}],"users_relations":[{"id":4016880457,"name":"Killercgara","displayName":"HATRED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-56474DC0F8CFD334722DC327C2D778C0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1331,"name":"nickrockcks","displayName":"nickrockcks","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1ECF3148D4C50987B206452CD368C02C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2566517950,"name":"Pyrite00","displayName":"Himmel","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7FC373E0E6C5D836117EE17716456D8F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4657562667,"name":"r_K2340","displayName":"rune1669","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D1BFFB4EA4D1112C254F427116510DB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3606286622,"name":"fghht120","displayName":"IShallNeverSurrender","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D3A8F7F5085EE3E48CA0B37F407156EE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5540496279,"name":"fghht124","displayName":"hello","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A1236B48272BE3FEB18A298CF0EC83B8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5495282792,"name":"fghhy120","displayName":"fghhtluckisfake","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A229A7843B225CB428B824B36D2DFDDA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1518448188,"name":"kbjychoi","displayName":"NKL_last","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DEEF9731AE73407B2895C3E24E32E2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9359231835,"name":"sanabi12345678","displayName":"burning_soul","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D6F4817CF764E14FC76977365BFA38E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5712574595,"name":"yhkjlpomn7","displayName":"Goseung","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-485ADA69F05F3CCFDF2B0E91F348E21D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2994355215,"name":"louissjune","displayName":"louissjune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4508183B58411E973DBAF429D2E8B49F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3366573442,"name":"hayaton1537","displayName":"hayaton1537","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-94C700B3DC33CB4AE4B04222F129B9A9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1522869310,"name":"7x7d7d8d","displayName":"Gilby","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B95F9BC0E7D61EA5D5EA1078997F0087-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3991320061,"name":"yj042217","displayName":"yj042217","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C22F3FDEF78402EFDE9B8654C4F4D3B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4273721629,"name":"rtysep","displayName":"command","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-936FD9F7B84951377B38762F517BFA2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4369128135,"name":"Inee0710","displayName":"MANGO_ElEl","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-83F74A29B8FCE514302C6BFF204CE77F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3146175328,"name":"KR_Usen","displayName":"Haruna","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AD5948C0E692C7C5B41B913FA1BA6EDE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4443685566,"name":"Lost_homiDream","displayName":"123","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4E2882EC80006C8AC452B3A16B23B8F9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3320488434,"name":"hayoon0425","displayName":"hayoon0425","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-59E2572FAB0EE3A73CB2533FCB217735-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4115400670,"name":"Mix77L","displayName":"Mix77L","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D968CE5D9C337157BE42957C6E95DBAD-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4604626269,"name":"eeeecBLI","displayName":"GOMAHA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E0913F0A070D0980BF1B4C5EDC38A4DA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2855998319,"name":"hajunlove14","displayName":"ENFP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B552F5BA6A50337A912042CAC8F2309-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5469376336,"name":"Zizon_mans","displayName":"Zizon_mans","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E1C339944CFF9833C48E2E90DFCB37A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7386139547,"name":"dedi_ing","displayName":"wait4urlove","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-322BECF2EF09C21A6BE7CEFF355379EA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1139396212,"name":"xxzxxadxeiwo","displayName":"IIII","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DFFB9D409A61AACFAF9ACECB34332E32-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460754430,"name":"002_brscg","displayName":"002_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-24F9EA5B046D27C587B7E847EA2B3BA6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9461453673,"name":"000_brscg","displayName":"000_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CCCF2C5C1065E6B032C49F1B709A36AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460951279,"name":"001_brscg","displayName":"001_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C0A86398512FECFF3CE2124D8DC43114-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10652978379,"name":"xj485c","displayName":"monet_c","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9BE0A2B74508701188288CF250D81546-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10570381160,"name":"chara500m","displayName":"Arahc","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F47925FFF12673F9A0E26DBBA03AD40-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1533809431,"name":"kimjione1023","displayName":"kimjione1023","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-19CDD4C7A115BE56303121CE07C582FF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4914904069,"name":"datat019","displayName":"datat019","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7DF45571BA33FE40BBA74CD753827675-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1148536830,"name":"JihoFamily","displayName":"Rtpalm","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EBA2E1A2DCC94D2D7AAE3B677FE61174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2586083131,"name":"yes_si4h","displayName":"yes_si4h","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F53B839C86EB13183E7857E48A6E5D46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":945971641,"name":"ray1378y","displayName":"Teto","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E6089AACA9CD5FD08F83AA3AC56072CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1985749424,"name":"yonggil27","displayName":"Hello1910","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1D7A631D69BB8465AA6D49015B1C223F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4098733337,"name":"euewryr","displayName":"eue","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-520300A5D14993E3DEBD699B66D5DAEB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3588487294,"name":"tarue_S23","displayName":"goodgame","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74333C72DF5481088F4B6C175D238820-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2589061719,"name":"NTQ_MEN","displayName":"NTQ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CBFF33453C94E32E269E0369CB6D7B72-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1209919599,"name":"gyqwpppl","displayName":"Shop_NPC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1B9011997740B5A988DF6BC169F1009D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10171344586,"name":"ererererer7140","displayName":"1234qqq","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0735448DF46689171696246975BEBE21-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2020055911,"name":"siyulmonmon","displayName":"NOOB","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-03B708E1602373035FF71166F0963AF9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5287236437,"name":"ectectectyou","displayName":"ectectectyou","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6AD17D262CE6D6EFF491A2D252745945-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10547914373,"name":"dkssud0427","displayName":"ABme","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-670FA5207870001D53E66D4D6F6DD0E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8345966518,"name":"wiwwwh4","displayName":"White","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B45BD91995798BBE31198A002A86F20B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3373053603,"name":"getveeh","displayName":"Getoutofhere","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C0505218A3221F7A64CE62C22D721E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2705705770,"name":"qwur02846","displayName":"raga_mini","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4E371DF1966280A041745AF31CAC5E0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10529505799,"name":"sans_serif4001","displayName":"roblox_AKUMA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0676D0339F7147ED7004B003696019E2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4352717446,"name":"SJKLH27","displayName":"Merzeno","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A899103E195C7AE474028BE6A426EC52-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2838225524,"name":"srururur4","displayName":"Miner_v","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A8294742E95182DB3BBF3945BED4DA44-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"RU","name":"Russia","img":"https://flagsapi.com/RU/flat/64.png"}},{"id":3518379412,"name":"momiji0911","displayName":"chocolatemint0911","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-983C4DFBD73C9A57B5BEB43C5CC942B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":2507071973,"name":"mink0302","displayName":"mink","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8F301044C62AFA7D037617D05CC95EED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5211697712,"name":"123gavebryan123oks","displayName":"Gave","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E20FC26F44371885DD446A558F30A9AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4235234920,"name":"Sk0iHatesHisFriends","displayName":"kharylsonly","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BAB26872B985DC908D888F38235A32B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":5514737971,"name":"mr_lonely20085","displayName":"LNX_frostie","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D000E798B6AE9B45F7A491714B7D12DE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10006443067,"name":"jtg2511n","displayName":"nameless","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FB3F6F7DD784F7E0E8D3D8938AA4782C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1744534728,"name":"jacob060709","displayName":"The_Memelord","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FA3BF92AB109FEA19742B41D133C7B97-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":8723484810,"name":"ElAlex_XDlol","displayName":"Hintelex","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-77CBE5F770B40A60BC8747C463ADEE0F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1882778514,"name":"henrybook0811","displayName":"Periastron","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-392B57C92DBB3A02CF8E509DA432EECF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1295475937,"name":"gggg167319","displayName":"gggg167319","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E95CE91F04EC35CAFC31CA588ADB2FA0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2863852238,"name":"chanhee2377","displayName":"Vendy","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-602ACB343C491C761BC8E5406C6EA8CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3694244340,"name":"B_yagyy","displayName":"kyky","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C343B333B6F5F15DB9A7187C3E2C7A0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2354231027,"name":"a307763","displayName":"a307763","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-178758FC89AAAB298F4E177A0F7C8EFE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1285247898,"name":"RowzG","displayName":"RowzG","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EE48BE2BF87B7633C43B78519C62FF62-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2645431890,"name":"fgdhtghtggr","displayName":"fgdhtghtggr","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6DF2BF825AF954259E2E98CD524B3DF8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4678848229,"name":"pswoo_jason13","displayName":"pswoo_jason13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-236F4DA64BC319830ABAC00ADAF58736-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5832790026,"name":"daniel_78961","displayName":"daniel_78961","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C9A086134F4F2B37288AB4D0C898297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1190975846,"name":"rtybill","displayName":"rtybill","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA714D47C40709F119E751855176A5D4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1158541596,"name":"junwooblabla","displayName":"ICECREAM","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6ADC05FE535273F7F1A383BFD477AD5C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1242250842,"name":"eduezht","displayName":"eduezht","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F315A1DAA6689289B29A546AA381CE1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1665149193,"name":"prettyssoom","displayName":"BLUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-734A782EDA28E5B6ADCAE8F6CFC3A1AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2313174982,"name":"airbag_31","displayName":"airbag_31","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-38E3B88560533354FEB0B3C067CDF1A2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10449374438,"name":"up8nv","displayName":"up8nv","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-761DE885C389E642BCC4E0669E5312F0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8126447450,"name":"everyallacc","displayName":"Yaong1213","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-995081E21BAB8A4D171956F53DAA73B7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3228410728,"name":"kr_0345","displayName":"Frisk","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F1C43BD784531C3EA85FC16707424B6E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":6024208055,"name":"xcquller","displayName":"xcquller","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-58E94244F5305BD4E93CE19934EE1DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2771854594,"name":"abcdefg45uu","displayName":"abcdefg45uu","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DA422FB54B75B1CAF53F25FAE80D0124-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8758596225,"name":"yesEZprism","displayName":"KD_99PentaBLITZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B0FB1844800D15D6B3BED3D76E54002-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3824302990,"name":"cyfrff","displayName":"cyfrff","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5A5920523BD52586A755986CE81A96D1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1263629161,"name":"goodys13","displayName":"goodys13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4DFCB55F2FFEFCB2F7C4DCC23F6AADE9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2217841355,"name":"Tomvbczz","displayName":"FRISK","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA650FF19963203F75C76647BFE7A880-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1824366114,"name":"BloodFlower12255","displayName":"Flora","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2FE53E17B462F18A60136C5873A00BE8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2222407382,"name":"megsaieon1972","displayName":"meg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-71678992A5CBAE7456739008C6921B2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1385517949,"name":"shmeueiwiw","displayName":"shmeueiwiw","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2BA5D9CDA750A8C73A20437DFD58D4BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4373021482,"name":"spyder_GUN","displayName":"GERerika","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3885EB22F7BCEE4CCFF70715043B0D41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3492289739,"name":"seojj1133","displayName":"Happy_0113","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D5D0EE558B658EF4691BDDD5E0D97865-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3278664128,"name":"qeqwerwerfar","displayName":"Chronos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-953740D790DE44A61049D179ED41E174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1749377682,"name":"swat13893","displayName":"swat13893","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9E401CA9770054B709FF5A6429E2201D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5848446007,"name":"kotaro34112","displayName":"Ramune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3010CD16E4BCB0123134729EBF1B34BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2804538768,"name":"liliang123456789","displayName":"juezi_awa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-78A2C2FDA2E041DDF35092164F3752DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4046560868,"name":"the_XHR","displayName":"Not_speakEnglis","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B763FF476DB7E049D98203A32E5D6904-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1905522183,"name":"1516gd","displayName":"Forsaken","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8D02FF5EEFE0797F2CB2D07DE7AADFF0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7074699037,"name":"hohyun0704howg","displayName":"hohyun0704howg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-651599EB6E8AC82E58BD598C199CED39-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8268752749,"name":"dhehdgus567","displayName":"donghy_1","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4A56F04B814BF8FC06D045FAB31BB9C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5125355211,"name":"dungdungdunghhh","displayName":"sad","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B032A3EB3A22A2F6D1C0BC63F1FF3AAB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5465702541,"name":"ASMRABBIT","displayName":"MRC_YourFace","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E5CDC2D59887C64FA0DE2C101F4BDC41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10420341860,"name":"joefaerg","displayName":"joefaerg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A0A42110F6707718AF6E94465F255333-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4594370728,"name":"Subspacer_0","displayName":"Solemn_Lament","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C41C3310E41E7FB82D41B32EC60724-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3187703552,"name":"didididhodho","displayName":"KR_noob","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-685B92B5B8C7CB3A683F1E8D7AF0CC1C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8224069454,"name":"lllillili7","displayName":"lllillili7","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4CCA634F2385FFF3EE48C69777BA3102-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7641127080,"name":"Shukshukbung","displayName":"feds","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E3F5E51F0B437055A357CC3ED1092664-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7408875000,"name":"SPIDER_208378","displayName":"MeTA9","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74BF9638E1F2BA28C066AA829EA4316D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5840476869,"name":"AACCBB_1322","displayName":"ABC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BD711409331D5A63BD93D6D0468D947D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2921315517,"name":"ghosthanzzing","displayName":"IDKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C136B5D4131C38AA742672D0FF5CEC6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":609696393,"name":"Fennik321","displayName":"Myu","hasVerifiedBadge":false,"img":null,"relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9111302785,"name":"akejdo28","displayName":"star","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5ACB6191007EE41945986628DE3A81A7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3312381246,"name":"error778123","displayName":"hypersonicgdKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-745822F0DF147E885B16316F7611827A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4974302427,"name":"GTGISAKOF","displayName":"GTGISAKOF","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C53171D0ECC8902F8A04AACD56D41BA7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7253007466,"name":"GTGISAKOF3","displayName":"GTGISAKOF3","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7F4ADF59CA2D88EA61E256D3C4264A9D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7227818767,"name":"ezwksksi43","displayName":"lamine_yamal","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D4475171A29437C510318DC1166E43D2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2284412220,"name":"dkwl0154","displayName":"XD_CDuootKYii","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3D9E5A2E0FA2C95A2FAED0D195B479A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4568375253,"name":"Lost_Seoyu","displayName":"Duntzki","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-36251A8C778E134F508CD4335F19A23B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1248273231,"name":"sok1476","displayName":"Dr_soak","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EC2F231E9D633A337DAB863E12D82B46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1193126726,"name":"yhlove04","displayName":"yuha","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CF2E5F64E033450BD6076B8276B4B1DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8498902589,"name":"RoyTheUltimateBoy","displayName":"CheerioDude","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-79CDB58E8B6799352698E5E6E68FBEB2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1218176765,"name":"ZackaryUchi","displayName":"DrDRAKE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6C095DE24BC9ED9FF1FEBF32FDC85C23-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10596667705,"name":"qponmoa","displayName":"qponmoa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FDF54DE0FDD3002C58F26A0541AF9A68-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1960223208,"name":"tgfethg3","displayName":"k0mxn","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AE5F135AB3D59F2D0E7D7504797AFB76-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3260768991,"name":"Austinchoo950003","displayName":"Kokushibo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29FAE409D4DF610D01630AB41431182C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"MY","name":"Malaysia","img":"https://flagsapi.com/MY/flat/64.png"}},{"id":1062351835,"name":"ridwan832010","displayName":"STATUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B5AC295029254F41526D64F96378904E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"ID","name":"Indonesia","img":"https://flagsapi.com/ID/flat/64.png"}},{"id":7217583301,"name":"eievdjwwe","displayName":"Deimos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA2D05C85132888C6C0596561DF7E3ED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4585957518,"name":"kjs_1104","displayName":"Abit","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-658B49D56675B011217C0AEB3436AF26-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4679400313,"name":"Wsjsmsms6","displayName":"tomato","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C357F7B6A7904AAC8FC1DB032D1BDF82-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5368880742,"name":"Gaster_053","displayName":"Ivy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3154EC8846846ECDF64B46B02CACEBB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4079845639,"name":"yhoo9939","displayName":"lvy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-477A13E15A16F600A5A2128A4C84FFEE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4514979397,"name":"sin_kun0308","displayName":"sin_kun0308","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E342BABEB364B515BA6C175175100DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":7726281095,"name":"gauajshua","displayName":"gau","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DAAE876655EDBD37EB42C6DFEA26525E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5175911121,"name":"konmame0316","displayName":"raitia1129","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F58F419C2F406FD68EA6FFFDA6774050-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":3974704043,"name":"SAZUNNd","displayName":"MOST_HATED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0F0678B090FD530C927D8470803555BC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5685575440,"name":"jhace_405","displayName":"hinakosan","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3000D5741CE28ACB763ABA4641649297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4740903245,"name":"jkzwinter123","displayName":"S4LM4","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-89DECBA1CFCEF5F9B9311510E0A3C767-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4453574252,"name":"cucurub1_22","displayName":"cucurub1_22","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A7F750C1D75AEB8A2CC100411B6AF185-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3608855215,"name":"namenametantan","displayName":"nametan_Slug","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA87C50EB83DF51955E29D23AA15DFAF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":9296673653,"name":"HARUAKI120912","displayName":"HARUAKI120912","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2F2BDBF8F1FE57849EF15E3736736FB5-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10974610615,"name":"r1117_606","displayName":"Flowey","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8358D910DDC37461920C0BB89877CD01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":4521062524,"name":"Epicbaconrugh","displayName":"Ronaldinho","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7CD049189B45D2D47091C310F8926814-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10960362047,"name":"ACADQP","displayName":"ACADQP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3E8821C21BD3E9A06F644E367AF94D01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1188607501,"name":"BYSONSUZ","displayName":"BYSONSUZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DF0986FDD8AB1709F00A0117D8F5B66-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"TR","name":"Turkey","img":"https://flagsapi.com/TR/flat/64.png"}}],"roles":[{"id":5774567078,"name":"TheBestOfAll1997","displayName":"CHEON_known","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-ACCF91F734E311F4A0EF23C3EDA54284-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":6221832139,"name":"dlwnsdud58","displayName":"ggyddo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-050C17F984E548C527D5B93D9F6741D0-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1786117931,"name":"uav1010","displayName":"uav1010","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-090A673736AFB3B1D252655E7B55C476-Png/150/150/AvatarHeadshot/Png/noFilter","role":"LEADER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2775712020,"name":"gamea9275","displayName":"150DefenseDummy","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B480B97AF330812784D925E9D1ED33C3-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4009807145,"name":"gypuwbv","displayName":"AzureX_POPCAT","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BC314F58FE8DEE9EE2B4C06E6047779D-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2486946986,"name":"BaekAH0923","displayName":"BaekAH","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AD76D68D455C2598AF80713789646060-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2062753243,"name":"hhsi7i","displayName":"Caro","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-00F853D0BBE88D5BD881C3145AA4EE12-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2351473874,"name":"chadonam2009","displayName":"chadonam","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-589C86B2DED5E4260E15CB3880E3E7DC-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4683997955,"name":"chzhflt1293","displayName":"chocolate","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2D1789811C17DDF64EAE799D3EAD6705-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3880425139,"name":"gdyuls","displayName":"gdyuls","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-099AAC20FEC0EDE661DFE6C7B5A5D95C-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1779821794,"name":"STAGOCARATOPS","displayName":"GG_Mari","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-796E261155FB3BB7422FB7FE2C9129EA-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8267513468,"name":"JAJAJAJAnewb1234","displayName":"JAJAJAJAnewb1234","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4309BAFEC2182BA4B923AD1C6967294-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1312367290,"name":"Xgusdn2","displayName":"Jakiebug","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-88B0257842AE42E33C0A0455FC015A1D-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3704471673,"name":"linkjun7","displayName":"linkjun7","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-90E1A0976F60E0E58630AD376A7F84CE-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1442530010,"name":"gfggvhhhhghhvc","displayName":"LOVEMST","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-352355EA3BA568B877A90E21D8FDC6F1-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":846413953,"name":"lumyu613","displayName":"lumyu","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-01F965FDF13AE51A3094DA8108271DCE-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2467754573,"name":"stonma1","displayName":"Marinejolge","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BB5B626726F93D130CBF780B58C55731-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10419052084,"name":"Masonolink","displayName":"Masonolink","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A41D42DE8488964E8DA36B7AFB1A7BD6-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1208505641,"name":"wasd1946","displayName":"Mepiick","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DE3B1A267285FF1CB3AB88AA0BB8FDA8-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3846900326,"name":"kaito_ROBLOX001","displayName":"NOOB","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B319BB274F394AEB633913B4C0E20782-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":961201525,"name":"wtawra","displayName":"paradiselost_leon","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EBB43D048FE43AD35F8E608B2AC90FD7-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1425037578,"name":"lsaenl","displayName":"quad","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D6E6058BA70E391AB77D0F1A7FFE5EDA-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1246358418,"name":"724im","displayName":"Scarlet","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CCE996FE40EA077A046691E88B956592-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4168579346,"name":"bluebladewithbm","displayName":"ubl17","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7B568F5D6F23FF5EC5EE3479FA5ED36C-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1291575185,"name":"Daisk19826","displayName":"unknown","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D0A4DBD1E92FEC8CF666B52F08963BFD-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3327066067,"name":"Roblox_Schramm","displayName":"UwU","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DE4ED9D7588B17FD2E768E649210BA83-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3728551140,"name":"kanekane8090","displayName":"vVkaneVv","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-28B7962498F5BC6EAE195D082BD9DA42-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":4112490130,"name":"sigeru35","displayName":"yuu_five998","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0927FF58E8A5EB35EF83AE9802A06240-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}}],"topNationalities":[{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"},{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}]},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","code":"TW","name":"Taiwan Group","img":"https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/Flag_of_the_Republic_of_China.svg/250px-Flag_of_the_Republic_of_China.svg.png?utm_source=simple.wikipedia.org&utm_campaign=parser&utm_content=thumbnail","created_at":"2026-09-01T13:49:36.880905+00:00","updated_at":"2026-09-05T17:48:23.220529+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","code":"VP","name":"Victory Path","img":"/resources/groups/vp.png","created_at":"2026-08-11T05:39:21.433718+00:00","updated_at":"2026-09-05T17:08:31.085075+00:00","group_relations":[{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"ally"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","relation":"ally"},{"id":"3e483375-28b7-48de-a3c1-47e0037cf9b7","relation":"neutral"},{"id":"4610fd9d-6719-480b-bade-9c1c9e20dd4d","relation":"hostile"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"},{"id":"f54eded9-ba4f-4503-b211-1a1a228d99ec","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[{"id":4016880457,"name":"Killercgara","displayName":"HATRED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-56474DC0F8CFD334722DC327C2D778C0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1331,"name":"nickrockcks","displayName":"nickrockcks","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1ECF3148D4C50987B206452CD368C02C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2566517950,"name":"Pyrite00","displayName":"Himmel","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7FC373E0E6C5D836117EE17716456D8F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4657562667,"name":"r_K2340","displayName":"rune1669","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D1BFFB4EA4D1112C254F427116510DB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3606286622,"name":"fghht120","displayName":"IShallNeverSurrender","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D3A8F7F5085EE3E48CA0B37F407156EE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5540496279,"name":"fghht124","displayName":"hello","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A1236B48272BE3FEB18A298CF0EC83B8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5495282792,"name":"fghhy120","displayName":"fghhtluckisfake","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A229A7843B225CB428B824B36D2DFDDA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1518448188,"name":"kbjychoi","displayName":"NKL_last","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DEEF9731AE73407B2895C3E24E32E2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9359231835,"name":"sanabi12345678","displayName":"burning_soul","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D6F4817CF764E14FC76977365BFA38E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5712574595,"name":"yhkjlpomn7","displayName":"Goseung","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-485ADA69F05F3CCFDF2B0E91F348E21D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2994355215,"name":"louissjune","displayName":"louissjune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4508183B58411E973DBAF429D2E8B49F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3366573442,"name":"hayaton1537","displayName":"hayaton1537","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-94C700B3DC33CB4AE4B04222F129B9A9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1522869310,"name":"7x7d7d8d","displayName":"Gilby","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B95F9BC0E7D61EA5D5EA1078997F0087-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3991320061,"name":"yj042217","displayName":"yj042217","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C22F3FDEF78402EFDE9B8654C4F4D3B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4273721629,"name":"rtysep","displayName":"command","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-936FD9F7B84951377B38762F517BFA2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4369128135,"name":"Inee0710","displayName":"MANGO_ElEl","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-83F74A29B8FCE514302C6BFF204CE77F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3146175328,"name":"KR_Usen","displayName":"Haruna","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AD5948C0E692C7C5B41B913FA1BA6EDE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4443685566,"name":"Lost_homiDream","displayName":"123","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4E2882EC80006C8AC452B3A16B23B8F9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3320488434,"name":"hayoon0425","displayName":"hayoon0425","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-59E2572FAB0EE3A73CB2533FCB217735-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4115400670,"name":"Mix77L","displayName":"Mix77L","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D968CE5D9C337157BE42957C6E95DBAD-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4604626269,"name":"eeeecBLI","displayName":"GOMAHA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E0913F0A070D0980BF1B4C5EDC38A4DA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2855998319,"name":"hajunlove14","displayName":"ENFP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B552F5BA6A50337A912042CAC8F2309-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5469376336,"name":"Zizon_mans","displayName":"Zizon_mans","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E1C339944CFF9833C48E2E90DFCB37A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7386139547,"name":"dedi_ing","displayName":"wait4urlove","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-322BECF2EF09C21A6BE7CEFF355379EA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1139396212,"name":"xxzxxadxeiwo","displayName":"IIII","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DFFB9D409A61AACFAF9ACECB34332E32-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460754430,"name":"002_brscg","displayName":"002_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-24F9EA5B046D27C587B7E847EA2B3BA6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9461453673,"name":"000_brscg","displayName":"000_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CCCF2C5C1065E6B032C49F1B709A36AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460951279,"name":"001_brscg","displayName":"001_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C0A86398512FECFF3CE2124D8DC43114-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10652978379,"name":"xj485c","displayName":"monet_c","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9BE0A2B74508701188288CF250D81546-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10570381160,"name":"chara500m","displayName":"Arahc","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F47925FFF12673F9A0E26DBBA03AD40-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1533809431,"name":"kimjione1023","displayName":"kimjione1023","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-19CDD4C7A115BE56303121CE07C582FF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4914904069,"name":"datat019","displayName":"datat019","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7DF45571BA33FE40BBA74CD753827675-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1148536830,"name":"JihoFamily","displayName":"Rtpalm","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EBA2E1A2DCC94D2D7AAE3B677FE61174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2586083131,"name":"yes_si4h","displayName":"yes_si4h","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F53B839C86EB13183E7857E48A6E5D46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":945971641,"name":"ray1378y","displayName":"Teto","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E6089AACA9CD5FD08F83AA3AC56072CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1985749424,"name":"yonggil27","displayName":"Hello1910","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1D7A631D69BB8465AA6D49015B1C223F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4098733337,"name":"euewryr","displayName":"eue","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-520300A5D14993E3DEBD699B66D5DAEB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3588487294,"name":"tarue_S23","displayName":"goodgame","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74333C72DF5481088F4B6C175D238820-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2589061719,"name":"NTQ_MEN","displayName":"NTQ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CBFF33453C94E32E269E0369CB6D7B72-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1209919599,"name":"gyqwpppl","displayName":"Shop_NPC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1B9011997740B5A988DF6BC169F1009D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10171344586,"name":"ererererer7140","displayName":"1234qqq","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0735448DF46689171696246975BEBE21-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2020055911,"name":"siyulmonmon","displayName":"NOOB","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-03B708E1602373035FF71166F0963AF9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5287236437,"name":"ectectectyou","displayName":"ectectectyou","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6AD17D262CE6D6EFF491A2D252745945-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10547914373,"name":"dkssud0427","displayName":"ABme","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-670FA5207870001D53E66D4D6F6DD0E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8345966518,"name":"wiwwwh4","displayName":"White","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B45BD91995798BBE31198A002A86F20B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3373053603,"name":"getveeh","displayName":"Getoutofhere","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C0505218A3221F7A64CE62C22D721E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2705705770,"name":"qwur02846","displayName":"raga_mini","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4E371DF1966280A041745AF31CAC5E0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10529505799,"name":"sans_serif4001","displayName":"roblox_AKUMA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0676D0339F7147ED7004B003696019E2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4352717446,"name":"SJKLH27","displayName":"Merzeno","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A899103E195C7AE474028BE6A426EC52-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2838225524,"name":"srururur4","displayName":"Miner_v","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A8294742E95182DB3BBF3945BED4DA44-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"RU","name":"Russia","img":"https://flagsapi.com/RU/flat/64.png"}},{"id":3518379412,"name":"momiji0911","displayName":"chocolatemint0911","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-983C4DFBD73C9A57B5BEB43C5CC942B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":2507071973,"name":"mink0302","displayName":"mink","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8F301044C62AFA7D037617D05CC95EED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5211697712,"name":"123gavebryan123oks","displayName":"Gave","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E20FC26F44371885DD446A558F30A9AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4235234920,"name":"Sk0iHatesHisFriends","displayName":"kharylsonly","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BAB26872B985DC908D888F38235A32B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":5514737971,"name":"mr_lonely20085","displayName":"LNX_frostie","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D000E798B6AE9B45F7A491714B7D12DE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10006443067,"name":"jtg2511n","displayName":"nameless","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FB3F6F7DD784F7E0E8D3D8938AA4782C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1744534728,"name":"jacob060709","displayName":"The_Memelord","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FA3BF92AB109FEA19742B41D133C7B97-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":8723484810,"name":"ElAlex_XDlol","displayName":"Hintelex","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-77CBE5F770B40A60BC8747C463ADEE0F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1882778514,"name":"henrybook0811","displayName":"Periastron","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-392B57C92DBB3A02CF8E509DA432EECF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1295475937,"name":"gggg167319","displayName":"gggg167319","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E95CE91F04EC35CAFC31CA588ADB2FA0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2863852238,"name":"chanhee2377","displayName":"Vendy","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-602ACB343C491C761BC8E5406C6EA8CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3694244340,"name":"B_yagyy","displayName":"kyky","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C343B333B6F5F15DB9A7187C3E2C7A0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2354231027,"name":"a307763","displayName":"a307763","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-178758FC89AAAB298F4E177A0F7C8EFE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1285247898,"name":"RowzG","displayName":"RowzG","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EE48BE2BF87B7633C43B78519C62FF62-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2645431890,"name":"fgdhtghtggr","displayName":"fgdhtghtggr","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6DF2BF825AF954259E2E98CD524B3DF8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4678848229,"name":"pswoo_jason13","displayName":"pswoo_jason13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-236F4DA64BC319830ABAC00ADAF58736-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5832790026,"name":"daniel_78961","displayName":"daniel_78961","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C9A086134F4F2B37288AB4D0C898297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1190975846,"name":"rtybill","displayName":"rtybill","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA714D47C40709F119E751855176A5D4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1158541596,"name":"junwooblabla","displayName":"ICECREAM","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6ADC05FE535273F7F1A383BFD477AD5C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1242250842,"name":"eduezht","displayName":"eduezht","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F315A1DAA6689289B29A546AA381CE1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1665149193,"name":"prettyssoom","displayName":"BLUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-734A782EDA28E5B6ADCAE8F6CFC3A1AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2313174982,"name":"airbag_31","displayName":"airbag_31","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-38E3B88560533354FEB0B3C067CDF1A2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10449374438,"name":"up8nv","displayName":"up8nv","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-761DE885C389E642BCC4E0669E5312F0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8126447450,"name":"everyallacc","displayName":"Yaong1213","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-995081E21BAB8A4D171956F53DAA73B7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3228410728,"name":"kr_0345","displayName":"Frisk","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F1C43BD784531C3EA85FC16707424B6E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":6024208055,"name":"xcquller","displayName":"xcquller","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-58E94244F5305BD4E93CE19934EE1DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2771854594,"name":"abcdefg45uu","displayName":"abcdefg45uu","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DA422FB54B75B1CAF53F25FAE80D0124-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8758596225,"name":"yesEZprism","displayName":"KD_99PentaBLITZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B0FB1844800D15D6B3BED3D76E54002-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3824302990,"name":"cyfrff","displayName":"cyfrff","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5A5920523BD52586A755986CE81A96D1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1263629161,"name":"goodys13","displayName":"goodys13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4DFCB55F2FFEFCB2F7C4DCC23F6AADE9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2217841355,"name":"Tomvbczz","displayName":"FRISK","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA650FF19963203F75C76647BFE7A880-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1824366114,"name":"BloodFlower12255","displayName":"Flora","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2FE53E17B462F18A60136C5873A00BE8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2222407382,"name":"megsaieon1972","displayName":"meg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-71678992A5CBAE7456739008C6921B2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1385517949,"name":"shmeueiwiw","displayName":"shmeueiwiw","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2BA5D9CDA750A8C73A20437DFD58D4BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4373021482,"name":"spyder_GUN","displayName":"GERerika","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3885EB22F7BCEE4CCFF70715043B0D41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3492289739,"name":"seojj1133","displayName":"Happy_0113","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D5D0EE558B658EF4691BDDD5E0D97865-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3278664128,"name":"qeqwerwerfar","displayName":"Chronos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-953740D790DE44A61049D179ED41E174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1749377682,"name":"swat13893","displayName":"swat13893","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9E401CA9770054B709FF5A6429E2201D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5848446007,"name":"kotaro34112","displayName":"Ramune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3010CD16E4BCB0123134729EBF1B34BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2804538768,"name":"liliang123456789","displayName":"juezi_awa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-78A2C2FDA2E041DDF35092164F3752DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4046560868,"name":"the_XHR","displayName":"Not_speakEnglis","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B763FF476DB7E049D98203A32E5D6904-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1905522183,"name":"1516gd","displayName":"Forsaken","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8D02FF5EEFE0797F2CB2D07DE7AADFF0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7074699037,"name":"hohyun0704howg","displayName":"hohyun0704howg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-651599EB6E8AC82E58BD598C199CED39-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8268752749,"name":"dhehdgus567","displayName":"donghy_1","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4A56F04B814BF8FC06D045FAB31BB9C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5125355211,"name":"dungdungdunghhh","displayName":"sad","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B032A3EB3A22A2F6D1C0BC63F1FF3AAB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5465702541,"name":"ASMRABBIT","displayName":"MRC_YourFace","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E5CDC2D59887C64FA0DE2C101F4BDC41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10420341860,"name":"joefaerg","displayName":"joefaerg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A0A42110F6707718AF6E94465F255333-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4594370728,"name":"Subspacer_0","displayName":"Solemn_Lament","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C41C3310E41E7FB82D41B32EC60724-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3187703552,"name":"didididhodho","displayName":"KR_noob","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-685B92B5B8C7CB3A683F1E8D7AF0CC1C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8224069454,"name":"lllillili7","displayName":"lllillili7","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4CCA634F2385FFF3EE48C69777BA3102-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7641127080,"name":"Shukshukbung","displayName":"feds","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E3F5E51F0B437055A357CC3ED1092664-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7408875000,"name":"SPIDER_208378","displayName":"MeTA9","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74BF9638E1F2BA28C066AA829EA4316D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5840476869,"name":"AACCBB_1322","displayName":"ABC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BD711409331D5A63BD93D6D0468D947D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2921315517,"name":"ghosthanzzing","displayName":"IDKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C136B5D4131C38AA742672D0FF5CEC6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":609696393,"name":"Fennik321","displayName":"Myu","hasVerifiedBadge":false,"img":null,"relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9111302785,"name":"akejdo28","displayName":"star","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5ACB6191007EE41945986628DE3A81A7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3312381246,"name":"error778123","displayName":"hypersonicgdKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-745822F0DF147E885B16316F7611827A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4974302427,"name":"GTGISAKOF","displayName":"GTGISAKOF","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C53171D0ECC8902F8A04AACD56D41BA7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7253007466,"name":"GTGISAKOF3","displayName":"GTGISAKOF3","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7F4ADF59CA2D88EA61E256D3C4264A9D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7227818767,"name":"ezwksksi43","displayName":"lamine_yamal","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D4475171A29437C510318DC1166E43D2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2284412220,"name":"dkwl0154","displayName":"XD_CDuootKYii","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3D9E5A2E0FA2C95A2FAED0D195B479A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4568375253,"name":"Lost_Seoyu","displayName":"Duntzki","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-36251A8C778E134F508CD4335F19A23B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1248273231,"name":"sok1476","displayName":"Dr_soak","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EC2F231E9D633A337DAB863E12D82B46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1193126726,"name":"yhlove04","displayName":"yuha","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CF2E5F64E033450BD6076B8276B4B1DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8498902589,"name":"RoyTheUltimateBoy","displayName":"CheerioDude","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-79CDB58E8B6799352698E5E6E68FBEB2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1218176765,"name":"ZackaryUchi","displayName":"DrDRAKE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6C095DE24BC9ED9FF1FEBF32FDC85C23-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10596667705,"name":"qponmoa","displayName":"qponmoa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FDF54DE0FDD3002C58F26A0541AF9A68-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1960223208,"name":"tgfethg3","displayName":"k0mxn","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AE5F135AB3D59F2D0E7D7504797AFB76-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3260768991,"name":"Austinchoo950003","displayName":"Kokushibo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29FAE409D4DF610D01630AB41431182C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"MY","name":"Malaysia","img":"https://flagsapi.com/MY/flat/64.png"}},{"id":1062351835,"name":"ridwan832010","displayName":"STATUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B5AC295029254F41526D64F96378904E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"ID","name":"Indonesia","img":"https://flagsapi.com/ID/flat/64.png"}},{"id":7217583301,"name":"eievdjwwe","displayName":"Deimos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA2D05C85132888C6C0596561DF7E3ED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4585957518,"name":"kjs_1104","displayName":"Abit","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-658B49D56675B011217C0AEB3436AF26-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4679400313,"name":"Wsjsmsms6","displayName":"tomato","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C357F7B6A7904AAC8FC1DB032D1BDF82-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5368880742,"name":"Gaster_053","displayName":"Ivy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3154EC8846846ECDF64B46B02CACEBB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4079845639,"name":"yhoo9939","displayName":"lvy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-477A13E15A16F600A5A2128A4C84FFEE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4514979397,"name":"sin_kun0308","displayName":"sin_kun0308","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E342BABEB364B515BA6C175175100DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":7726281095,"name":"gauajshua","displayName":"gau","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DAAE876655EDBD37EB42C6DFEA26525E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5175911121,"name":"konmame0316","displayName":"raitia1129","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F58F419C2F406FD68EA6FFFDA6774050-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":3974704043,"name":"SAZUNNd","displayName":"MOST_HATED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0F0678B090FD530C927D8470803555BC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5685575440,"name":"jhace_405","displayName":"hinakosan","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3000D5741CE28ACB763ABA4641649297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4740903245,"name":"jkzwinter123","displayName":"S4LM4","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-89DECBA1CFCEF5F9B9311510E0A3C767-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4453574252,"name":"cucurub1_22","displayName":"cucurub1_22","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A7F750C1D75AEB8A2CC100411B6AF185-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3608855215,"name":"namenametantan","displayName":"nametan_Slug","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA87C50EB83DF51955E29D23AA15DFAF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":9296673653,"name":"HARUAKI120912","displayName":"HARUAKI120912","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2F2BDBF8F1FE57849EF15E3736736FB5-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10974610615,"name":"r1117_606","displayName":"Flowey","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8358D910DDC37461920C0BB89877CD01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":4521062524,"name":"Epicbaconrugh","displayName":"Ronaldinho","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7CD049189B45D2D47091C310F8926814-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10960362047,"name":"ACADQP","displayName":"ACADQP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3E8821C21BD3E9A06F644E367AF94D01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1188607501,"name":"BYSONSUZ","displayName":"BYSONSUZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DF0986FDD8AB1709F00A0117D8F5B66-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"TR","name":"Turkey","img":"https://flagsapi.com/TR/flat/64.png"}}],"relation":"hostile"},{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","code":"JA","name":"Japan Army","img":"/resources/groups/ja.png","created_at":"2026-08-11T07:14:19.141632+00:00","updated_at":"2026-09-01T13:53:08.181317+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"ally"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","relation":"neutral"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[{"id":10801833505,"name":"SonarDispatched","displayName":"Solar","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6D416B43E35918DF4669DA7F946A2F50-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"US","name":"United States","img":"https://flagsapi.com/US/flat/64.png"}},{"id":4144394027,"name":"P4rtyWithGhost","displayName":"Taxer","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C3CF9AA58CFAD0B17D17E1A76331FC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"ID","name":"Indonesia","img":"https://flagsapi.com/ID/flat/64.png"}}],"relation":"hostile"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","code":"CN","name":"China","img":"https://upload.wikimedia.org/wikipedia/commons/f/fa/Flag_of_the_People%27s_Republic_of_China.svg?utm_source=ko.wikipedia.org&utm_campaign=index&utm_content=original","created_at":"2026-08-20T11:00:19.09371+00:00","updated_at":"2026-09-05T17:49:02.08855+00:00","group_relations":[{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"hostile"},{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[],"relation":"hostile"}],"users_relations":[],"roles":[{"id":7457459789,"name":"bjgtew431","displayName":"A_Noobbacon","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C382BA2F1135B7797B39153C3F067A9D-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"TW","name":"Taiwan","img":"https://flagsapi.com/TW/flat/64.png"}},{"id":3576496384,"name":"Bjgtew43","displayName":"QwQ_mywifiisverynice","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9C1D1B8690E09FFC8080253687BEC34B-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"TW","name":"Taiwan","img":"https://flagsapi.com/TW/flat/64.png"}},{"id":4156642096,"name":"RIPLeo5438","displayName":"The_Plunge","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FEA87C6EBA756D8D55DAD9784FAB6BF5-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"TW","name":"Taiwan","img":"https://flagsapi.com/TW/flat/64.png"}}],"topNationalities":[{"code":"TW","name":"Taiwan","img":"https://flagsapi.com/TW/flat/64.png"}]},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","code":"CN","name":"China","img":"https://upload.wikimedia.org/wikipedia/commons/f/fa/Flag_of_the_People%27s_Republic_of_China.svg?utm_source=ko.wikipedia.org&utm_campaign=index&utm_content=original","created_at":"2026-08-20T11:00:19.09371+00:00","updated_at":"2026-09-05T17:49:02.08855+00:00","group_relations":[{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","code":"JA","name":"Japan Army","img":"/resources/groups/ja.png","created_at":"2026-08-11T07:14:19.141632+00:00","updated_at":"2026-09-01T13:53:08.181317+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"ally"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","relation":"neutral"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[{"id":10801833505,"name":"SonarDispatched","displayName":"Solar","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6D416B43E35918DF4669DA7F946A2F50-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"US","name":"United States","img":"https://flagsapi.com/US/flat/64.png"}},{"id":4144394027,"name":"P4rtyWithGhost","displayName":"Taxer","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C3CF9AA58CFAD0B17D17E1A76331FC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"ID","name":"Indonesia","img":"https://flagsapi.com/ID/flat/64.png"}}],"relation":"hostile"},{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","code":"VP","name":"Victory Path","img":"/resources/groups/vp.png","created_at":"2026-08-11T05:39:21.433718+00:00","updated_at":"2026-09-05T17:08:31.085075+00:00","group_relations":[{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"ally"},{"id":"6aa29600-3c88-4414-aede-ef5684f48c41","relation":"ally"},{"id":"3e483375-28b7-48de-a3c1-47e0037cf9b7","relation":"neutral"},{"id":"4610fd9d-6719-480b-bade-9c1c9e20dd4d","relation":"hostile"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"},{"id":"f54eded9-ba4f-4503-b211-1a1a228d99ec","relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","relation":"hostile"}],"users_relations":[{"id":4016880457,"name":"Killercgara","displayName":"HATRED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-56474DC0F8CFD334722DC327C2D778C0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1331,"name":"nickrockcks","displayName":"nickrockcks","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1ECF3148D4C50987B206452CD368C02C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2566517950,"name":"Pyrite00","displayName":"Himmel","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7FC373E0E6C5D836117EE17716456D8F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4657562667,"name":"r_K2340","displayName":"rune1669","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D1BFFB4EA4D1112C254F427116510DB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3606286622,"name":"fghht120","displayName":"IShallNeverSurrender","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D3A8F7F5085EE3E48CA0B37F407156EE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5540496279,"name":"fghht124","displayName":"hello","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A1236B48272BE3FEB18A298CF0EC83B8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5495282792,"name":"fghhy120","displayName":"fghhtluckisfake","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A229A7843B225CB428B824B36D2DFDDA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1518448188,"name":"kbjychoi","displayName":"NKL_last","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DEEF9731AE73407B2895C3E24E32E2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9359231835,"name":"sanabi12345678","displayName":"burning_soul","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D6F4817CF764E14FC76977365BFA38E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5712574595,"name":"yhkjlpomn7","displayName":"Goseung","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-485ADA69F05F3CCFDF2B0E91F348E21D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2994355215,"name":"louissjune","displayName":"louissjune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4508183B58411E973DBAF429D2E8B49F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3366573442,"name":"hayaton1537","displayName":"hayaton1537","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-94C700B3DC33CB4AE4B04222F129B9A9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1522869310,"name":"7x7d7d8d","displayName":"Gilby","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B95F9BC0E7D61EA5D5EA1078997F0087-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3991320061,"name":"yj042217","displayName":"yj042217","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C22F3FDEF78402EFDE9B8654C4F4D3B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4273721629,"name":"rtysep","displayName":"command","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-936FD9F7B84951377B38762F517BFA2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4369128135,"name":"Inee0710","displayName":"MANGO_ElEl","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-83F74A29B8FCE514302C6BFF204CE77F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3146175328,"name":"KR_Usen","displayName":"Haruna","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AD5948C0E692C7C5B41B913FA1BA6EDE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4443685566,"name":"Lost_homiDream","displayName":"123","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4E2882EC80006C8AC452B3A16B23B8F9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3320488434,"name":"hayoon0425","displayName":"hayoon0425","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-59E2572FAB0EE3A73CB2533FCB217735-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4115400670,"name":"Mix77L","displayName":"Mix77L","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D968CE5D9C337157BE42957C6E95DBAD-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4604626269,"name":"eeeecBLI","displayName":"GOMAHA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E0913F0A070D0980BF1B4C5EDC38A4DA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2855998319,"name":"hajunlove14","displayName":"ENFP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B552F5BA6A50337A912042CAC8F2309-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5469376336,"name":"Zizon_mans","displayName":"Zizon_mans","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E1C339944CFF9833C48E2E90DFCB37A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7386139547,"name":"dedi_ing","displayName":"wait4urlove","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-322BECF2EF09C21A6BE7CEFF355379EA-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1139396212,"name":"xxzxxadxeiwo","displayName":"IIII","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DFFB9D409A61AACFAF9ACECB34332E32-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460754430,"name":"002_brscg","displayName":"002_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-24F9EA5B046D27C587B7E847EA2B3BA6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9461453673,"name":"000_brscg","displayName":"000_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CCCF2C5C1065E6B032C49F1B709A36AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9460951279,"name":"001_brscg","displayName":"001_brscg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C0A86398512FECFF3CE2124D8DC43114-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10652978379,"name":"xj485c","displayName":"monet_c","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9BE0A2B74508701188288CF250D81546-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10570381160,"name":"chara500m","displayName":"Arahc","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F47925FFF12673F9A0E26DBBA03AD40-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1533809431,"name":"kimjione1023","displayName":"kimjione1023","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-19CDD4C7A115BE56303121CE07C582FF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4914904069,"name":"datat019","displayName":"datat019","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7DF45571BA33FE40BBA74CD753827675-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1148536830,"name":"JihoFamily","displayName":"Rtpalm","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EBA2E1A2DCC94D2D7AAE3B677FE61174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2586083131,"name":"yes_si4h","displayName":"yes_si4h","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F53B839C86EB13183E7857E48A6E5D46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":945971641,"name":"ray1378y","displayName":"Teto","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E6089AACA9CD5FD08F83AA3AC56072CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1985749424,"name":"yonggil27","displayName":"Hello1910","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1D7A631D69BB8465AA6D49015B1C223F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4098733337,"name":"euewryr","displayName":"eue","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-520300A5D14993E3DEBD699B66D5DAEB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3588487294,"name":"tarue_S23","displayName":"goodgame","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74333C72DF5481088F4B6C175D238820-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2589061719,"name":"NTQ_MEN","displayName":"NTQ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CBFF33453C94E32E269E0369CB6D7B72-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1209919599,"name":"gyqwpppl","displayName":"Shop_NPC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1B9011997740B5A988DF6BC169F1009D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10171344586,"name":"ererererer7140","displayName":"1234qqq","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0735448DF46689171696246975BEBE21-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2020055911,"name":"siyulmonmon","displayName":"NOOB","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-03B708E1602373035FF71166F0963AF9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5287236437,"name":"ectectectyou","displayName":"ectectectyou","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6AD17D262CE6D6EFF491A2D252745945-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10547914373,"name":"dkssud0427","displayName":"ABme","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-670FA5207870001D53E66D4D6F6DD0E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8345966518,"name":"wiwwwh4","displayName":"White","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B45BD91995798BBE31198A002A86F20B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3373053603,"name":"getveeh","displayName":"Getoutofhere","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C0505218A3221F7A64CE62C22D721E8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2705705770,"name":"qwur02846","displayName":"raga_mini","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4E371DF1966280A041745AF31CAC5E0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10529505799,"name":"sans_serif4001","displayName":"roblox_AKUMA","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0676D0339F7147ED7004B003696019E2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4352717446,"name":"SJKLH27","displayName":"Merzeno","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A899103E195C7AE474028BE6A426EC52-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2838225524,"name":"srururur4","displayName":"Miner_v","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A8294742E95182DB3BBF3945BED4DA44-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"RU","name":"Russia","img":"https://flagsapi.com/RU/flat/64.png"}},{"id":3518379412,"name":"momiji0911","displayName":"chocolatemint0911","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-983C4DFBD73C9A57B5BEB43C5CC942B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":2507071973,"name":"mink0302","displayName":"mink","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8F301044C62AFA7D037617D05CC95EED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5211697712,"name":"123gavebryan123oks","displayName":"Gave","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E20FC26F44371885DD446A558F30A9AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4235234920,"name":"Sk0iHatesHisFriends","displayName":"kharylsonly","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BAB26872B985DC908D888F38235A32B1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":5514737971,"name":"mr_lonely20085","displayName":"LNX_frostie","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D000E798B6AE9B45F7A491714B7D12DE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10006443067,"name":"jtg2511n","displayName":"nameless","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FB3F6F7DD784F7E0E8D3D8938AA4782C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1744534728,"name":"jacob060709","displayName":"The_Memelord","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FA3BF92AB109FEA19742B41D133C7B97-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":8723484810,"name":"ElAlex_XDlol","displayName":"Hintelex","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-77CBE5F770B40A60BC8747C463ADEE0F-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1882778514,"name":"henrybook0811","displayName":"Periastron","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-392B57C92DBB3A02CF8E509DA432EECF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1295475937,"name":"gggg167319","displayName":"gggg167319","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E95CE91F04EC35CAFC31CA588ADB2FA0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2863852238,"name":"chanhee2377","displayName":"Vendy","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-602ACB343C491C761BC8E5406C6EA8CB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3694244340,"name":"B_yagyy","displayName":"kyky","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C343B333B6F5F15DB9A7187C3E2C7A0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2354231027,"name":"a307763","displayName":"a307763","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-178758FC89AAAB298F4E177A0F7C8EFE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1285247898,"name":"RowzG","displayName":"RowzG","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EE48BE2BF87B7633C43B78519C62FF62-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2645431890,"name":"fgdhtghtggr","displayName":"fgdhtghtggr","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6DF2BF825AF954259E2E98CD524B3DF8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4678848229,"name":"pswoo_jason13","displayName":"pswoo_jason13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-236F4DA64BC319830ABAC00ADAF58736-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5832790026,"name":"daniel_78961","displayName":"daniel_78961","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5C9A086134F4F2B37288AB4D0C898297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1190975846,"name":"rtybill","displayName":"rtybill","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA714D47C40709F119E751855176A5D4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1158541596,"name":"junwooblabla","displayName":"ICECREAM","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6ADC05FE535273F7F1A383BFD477AD5C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1242250842,"name":"eduezht","displayName":"eduezht","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3F315A1DAA6689289B29A546AA381CE1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1665149193,"name":"prettyssoom","displayName":"BLUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-734A782EDA28E5B6ADCAE8F6CFC3A1AE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2313174982,"name":"airbag_31","displayName":"airbag_31","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-38E3B88560533354FEB0B3C067CDF1A2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10449374438,"name":"up8nv","displayName":"up8nv","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-761DE885C389E642BCC4E0669E5312F0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8126447450,"name":"everyallacc","displayName":"Yaong1213","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-995081E21BAB8A4D171956F53DAA73B7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3228410728,"name":"kr_0345","displayName":"Frisk","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F1C43BD784531C3EA85FC16707424B6E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":6024208055,"name":"xcquller","displayName":"xcquller","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-58E94244F5305BD4E93CE19934EE1DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2771854594,"name":"abcdefg45uu","displayName":"abcdefg45uu","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DA422FB54B75B1CAF53F25FAE80D0124-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8758596225,"name":"yesEZprism","displayName":"KD_99PentaBLITZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0B0FB1844800D15D6B3BED3D76E54002-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3824302990,"name":"cyfrff","displayName":"cyfrff","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5A5920523BD52586A755986CE81A96D1-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1263629161,"name":"goodys13","displayName":"goodys13","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4DFCB55F2FFEFCB2F7C4DCC23F6AADE9-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2217841355,"name":"Tomvbczz","displayName":"FRISK","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AA650FF19963203F75C76647BFE7A880-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1824366114,"name":"BloodFlower12255","displayName":"Flora","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2FE53E17B462F18A60136C5873A00BE8-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2222407382,"name":"megsaieon1972","displayName":"meg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-71678992A5CBAE7456739008C6921B2A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1385517949,"name":"shmeueiwiw","displayName":"shmeueiwiw","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2BA5D9CDA750A8C73A20437DFD58D4BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4373021482,"name":"spyder_GUN","displayName":"GERerika","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3885EB22F7BCEE4CCFF70715043B0D41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3492289739,"name":"seojj1133","displayName":"Happy_0113","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D5D0EE558B658EF4691BDDD5E0D97865-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3278664128,"name":"qeqwerwerfar","displayName":"Chronos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-953740D790DE44A61049D179ED41E174-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1749377682,"name":"swat13893","displayName":"swat13893","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-9E401CA9770054B709FF5A6429E2201D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5848446007,"name":"kotaro34112","displayName":"Ramune","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3010CD16E4BCB0123134729EBF1B34BF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2804538768,"name":"liliang123456789","displayName":"juezi_awa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-78A2C2FDA2E041DDF35092164F3752DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4046560868,"name":"the_XHR","displayName":"Not_speakEnglis","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B763FF476DB7E049D98203A32E5D6904-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1905522183,"name":"1516gd","displayName":"Forsaken","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8D02FF5EEFE0797F2CB2D07DE7AADFF0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7074699037,"name":"hohyun0704howg","displayName":"hohyun0704howg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-651599EB6E8AC82E58BD598C199CED39-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8268752749,"name":"dhehdgus567","displayName":"donghy_1","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C4A56F04B814BF8FC06D045FAB31BB9C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5125355211,"name":"dungdungdunghhh","displayName":"sad","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B032A3EB3A22A2F6D1C0BC63F1FF3AAB-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5465702541,"name":"ASMRABBIT","displayName":"MRC_YourFace","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E5CDC2D59887C64FA0DE2C101F4BDC41-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":10420341860,"name":"joefaerg","displayName":"joefaerg","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A0A42110F6707718AF6E94465F255333-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4594370728,"name":"Subspacer_0","displayName":"Solemn_Lament","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29C41C3310E41E7FB82D41B32EC60724-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3187703552,"name":"didididhodho","displayName":"KR_noob","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-685B92B5B8C7CB3A683F1E8D7AF0CC1C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8224069454,"name":"lllillili7","displayName":"lllillili7","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-4CCA634F2385FFF3EE48C69777BA3102-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7641127080,"name":"Shukshukbung","displayName":"feds","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E3F5E51F0B437055A357CC3ED1092664-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7408875000,"name":"SPIDER_208378","displayName":"MeTA9","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-74BF9638E1F2BA28C066AA829EA4316D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":5840476869,"name":"AACCBB_1322","displayName":"ABC","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BD711409331D5A63BD93D6D0468D947D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2921315517,"name":"ghosthanzzing","displayName":"IDKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8C136B5D4131C38AA742672D0FF5CEC6-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":609696393,"name":"Fennik321","displayName":"Myu","hasVerifiedBadge":false,"img":null,"relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":9111302785,"name":"akejdo28","displayName":"star","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5ACB6191007EE41945986628DE3A81A7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3312381246,"name":"error778123","displayName":"hypersonicgdKR","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-745822F0DF147E885B16316F7611827A-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4974302427,"name":"GTGISAKOF","displayName":"GTGISAKOF","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C53171D0ECC8902F8A04AACD56D41BA7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7253007466,"name":"GTGISAKOF3","displayName":"GTGISAKOF3","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7F4ADF59CA2D88EA61E256D3C4264A9D-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":7227818767,"name":"ezwksksi43","displayName":"lamine_yamal","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-D4475171A29437C510318DC1166E43D2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":2284412220,"name":"dkwl0154","displayName":"XD_CDuootKYii","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3D9E5A2E0FA2C95A2FAED0D195B479A4-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4568375253,"name":"Lost_Seoyu","displayName":"Duntzki","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-36251A8C778E134F508CD4335F19A23B-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1248273231,"name":"sok1476","displayName":"Dr_soak","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EC2F231E9D633A337DAB863E12D82B46-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1193126726,"name":"yhlove04","displayName":"yuha","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-CF2E5F64E033450BD6076B8276B4B1DC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":8498902589,"name":"RoyTheUltimateBoy","displayName":"CheerioDude","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-79CDB58E8B6799352698E5E6E68FBEB2-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":1218176765,"name":"ZackaryUchi","displayName":"DrDRAKE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-6C095DE24BC9ED9FF1FEBF32FDC85C23-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":10596667705,"name":"qponmoa","displayName":"qponmoa","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-FDF54DE0FDD3002C58F26A0541AF9A68-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":1960223208,"name":"tgfethg3","displayName":"k0mxn","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-AE5F135AB3D59F2D0E7D7504797AFB76-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3260768991,"name":"Austinchoo950003","displayName":"Kokushibo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-29FAE409D4DF610D01630AB41431182C-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"MY","name":"Malaysia","img":"https://flagsapi.com/MY/flat/64.png"}},{"id":1062351835,"name":"ridwan832010","displayName":"STATUE","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-B5AC295029254F41526D64F96378904E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"ID","name":"Indonesia","img":"https://flagsapi.com/ID/flat/64.png"}},{"id":7217583301,"name":"eievdjwwe","displayName":"Deimos","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA2D05C85132888C6C0596561DF7E3ED-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4585957518,"name":"kjs_1104","displayName":"Abit","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-658B49D56675B011217C0AEB3436AF26-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4679400313,"name":"Wsjsmsms6","displayName":"tomato","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C357F7B6A7904AAC8FC1DB032D1BDF82-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5368880742,"name":"Gaster_053","displayName":"Ivy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3154EC8846846ECDF64B46B02CACEBB7-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4079845639,"name":"yhoo9939","displayName":"lvy_yhoo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-477A13E15A16F600A5A2128A4C84FFEE-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":4514979397,"name":"sin_kun0308","displayName":"sin_kun0308","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-E342BABEB364B515BA6C175175100DE0-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":7726281095,"name":"gauajshua","displayName":"gau","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-DAAE876655EDBD37EB42C6DFEA26525E-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5175911121,"name":"konmame0316","displayName":"raitia1129","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F58F419C2F406FD68EA6FFFDA6774050-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":3974704043,"name":"SAZUNNd","displayName":"MOST_HATED","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0F0678B090FD530C927D8470803555BC-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":5685575440,"name":"jhace_405","displayName":"hinakosan","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3000D5741CE28ACB763ABA4641649297-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4740903245,"name":"jkzwinter123","displayName":"S4LM4","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-89DECBA1CFCEF5F9B9311510E0A3C767-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"PH","name":"Philippines","img":"https://flagsapi.com/PH/flat/64.png"}},{"id":4453574252,"name":"cucurub1_22","displayName":"cucurub1_22","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-A7F750C1D75AEB8A2CC100411B6AF185-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"KR","name":"Korea","img":"https://flagsapi.com/KR/flat/64.png"}},{"id":3608855215,"name":"namenametantan","displayName":"nametan_Slug","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EA87C50EB83DF51955E29D23AA15DFAF-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":9296673653,"name":"HARUAKI120912","displayName":"HARUAKI120912","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-2F2BDBF8F1FE57849EF15E3736736FB5-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10974610615,"name":"r1117_606","displayName":"Flowey","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8358D910DDC37461920C0BB89877CD01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":4521062524,"name":"Epicbaconrugh","displayName":"Ronaldinho","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-7CD049189B45D2D47091C310F8926814-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":10960362047,"name":"ACADQP","displayName":"ACADQP","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-3E8821C21BD3E9A06F644E367AF94D01-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"JP","name":"Japan","img":"https://flagsapi.com/JP/flat/64.png"}},{"id":1188607501,"name":"BYSONSUZ","displayName":"BYSONSUZ","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-0DF0986FDD8AB1709F00A0117D8F5B66-Png/150/150/AvatarHeadshot/Png/noFilter","relation":"hostile","nationality":{"code":"TR","name":"Turkey","img":"https://flagsapi.com/TR/flat/64.png"}}],"relation":"hostile"},{"id":"a82fd1e7-0773-43aa-a7ed-2d09d1258eb2","code":"TW","name":"Taiwan Group","img":"https://thumb.wikimedia.org/wikipedia/commons/thumb/7/72/Flag_of_the_Republic_of_China.svg/250px-Flag_of_the_Republic_of_China.svg.png?utm_source=simple.wikipedia.org&utm_campaign=parser&utm_content=thumbnail","created_at":"2026-09-01T13:49:36.880905+00:00","updated_at":"2026-09-05T17:48:23.220529+00:00","group_relations":[{"id":"b49627a4-8e6d-46a7-8862-b16b42839fed","relation":"hostile"},{"id":"619c67cf-02e4-4d0a-a8ed-038d2db6b03c","relation":"hostile"},{"id":"abb72b50-1a5f-4c5b-aebe-40db0d50a5b2","relation":"hostile"}],"users_relations":[],"relation":"hostile"}],"users_relations":[],"roles":[{"id":4639366934,"name":"fkdndndnddf","displayName":"\u79c1\u306f\u30b2\u30a4\u3067\u3059","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-5DC50EB82418FEB804722534A7C7A9A3-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"CN","name":"China","img":"https://flagsapi.com/CN/flat/64.png"}},{"id":4934085936,"name":"CN_virtual","displayName":"\u5931\u6557\u4f5c\u3068\u547c\u3070\u308c\u308b\u5c11\u5973","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-885E308A9B5335C615D616F161FEFA43-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"CN","name":"China","img":"https://flagsapi.com/CN/flat/64.png"}},{"id":6151405645,"name":"yuanxueqing","displayName":"CN_kk","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-24D2741A3B70A8B88BC9507E12DCBDF0-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"CN","name":"China","img":"https://flagsapi.com/CN/flat/64.png"}},{"id":5036270296,"name":"qwe114514o","displayName":"CN_qweo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-78A600D40AB073BA617568D8428643C0-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"CN","name":"China","img":"https://flagsapi.com/CN/flat/64.png"}},{"id":4700550524,"name":"2193721784ydhv","displayName":"hhhhhhh","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-8EE683F7B52C4A336D042C168E8A722F-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"CN","name":"China","img":"https://flagsapi.com/CN/flat/64.png"}},{"id":7960708512,"name":"xiaoheizi176","displayName":"icantsay","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-431E40BADAF956C3A81BED53743AF3C5-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"CN","name":"China","img":"https://flagsapi.com/CN/flat/64.png"}},{"id":4107157198,"name":"xiaoheizi1234567890","displayName":"ileako","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-F71AC581636A09C287E2FD8AAF01F87F-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"CN","name":"China","img":"https://flagsapi.com/CN/flat/64.png"}},{"id":9811455206,"name":"letodeo","displayName":"letodeo","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-C5BAB6F7720971B07F86AAED9EA16E59-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"CN","name":"China","img":"https://flagsapi.com/CN/flat/64.png"}},{"id":7126985735,"name":"xiaohaonie","displayName":"lollolololololol","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-EBB7343D5CC9345AF02E714665E8E14C-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"CN","name":"China","img":"https://flagsapi.com/CN/flat/64.png"}},{"id":4197184461,"name":"derhang96","displayName":"R_u13y","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-1BC8F069F04E1CFC5D3A553A00FC405C-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"CN","name":"China","img":"https://flagsapi.com/CN/flat/64.png"}},{"id":3155213221,"name":"woshixiaoee33","displayName":"woshixiaoee33","hasVerifiedBadge":false,"img":"https://tr.rbxcdn.com/30DAY-AvatarHeadshot-BF74F6332336476A3AE4E6D036F1D5F6-Png/150/150/AvatarHeadshot/Png/noFilter","role":"MEMBER","nationality":{"code":"CN","name":"China","img":"https://flagsapi.com/CN/flat/64.png"}}],"topNationalities":[{"code":"CN","name":"China","img":"https://flagsapi.com/CN/flat/64.png"}]}]]===]) :: {FullGroup}

return Module
            ]====], "0f3e8ef7067ed61518bd655cb9bf17b1")
            if not Func then
                error(("[%s] Compile Error: %s"):format("0f3e8ef7067ed61518bd655cb9bf17b1", tostring(LoadErr)))
            end
            local Ok, ErrOrResult = pcall(Func, Self)
            if not Ok then
                error(ErrOrResult)
            end
            return ErrOrResult
        end),
["c643b162539ee0eb5272d78183f602e9"]=(function(Self)
            local Func, LoadErr = loadstring([====[
                local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
                --!strict

local GuiModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("5fc274f1b48de9284581ec642e9549af", "c643b162539ee0eb5272d78183f602e9")

local TweenService = game:GetService("TweenService")

export type ToastType = "Success" | "Warning" | "Error"

export type ToastConfig = {
	Type: ToastType,
	Message: string,
	Duration: number?,
}

local BACKGROUND_COLOR = Color3.fromRGB(32, 32, 36)
local TEXT_COLOR = Color3.fromRGB(235, 235, 235)

local ACCENT_COLORS: { [ToastType]: Color3 } = {
	Success = Color3.fromRGB(70, 200, 100),
	Warning = Color3.fromRGB(235, 190, 40),
	Error = Color3.fromRGB(225, 70, 70),
}

local DEFAULT_DURATION = 3
local TOAST_WIDTH = 300
local TOAST_HEIGHT = 56
local TOAST_PADDING = 10
local SCREEN_MARGIN_TOP = 20
local SCREEN_MARGIN_RIGHT = 20

local screenGui: ScreenGui? = nil
local container: Frame? = nil
local activeToasts: { Frame } = {}

local function getContainer(): Frame
	local playerGui = GuiModule.GetContainer() :: PlayerGui

	if screenGui and screenGui.Parent and container and container.Parent then
		return container
	end

	local existingGui = playerGui:FindFirstChild("ToastScreenGui")
	if existingGui and existingGui:IsA("ScreenGui") then
		screenGui = existingGui
	else
		local newGui = Instance.new("ScreenGui")
		newGui.Name = "ToastScreenGui"
		newGui.ResetOnSpawn = false
		newGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		newGui.Parent = playerGui
		screenGui = newGui
	end

	local sg = screenGui :: ScreenGui
	local existingContainer = sg:FindFirstChild("ToastContainer")
	if existingContainer and existingContainer:IsA("Frame") then
		container = existingContainer
	else
		local newContainer = Instance.new("Frame")
		newContainer.Name = "ToastContainer"
		newContainer.BackgroundTransparency = 1
		newContainer.AnchorPoint = Vector2.new(1, 0)
		newContainer.Position = UDim2.new(1, -SCREEN_MARGIN_RIGHT, 0, SCREEN_MARGIN_TOP)
		newContainer.Size = UDim2.new(0, TOAST_WIDTH, 1, -SCREEN_MARGIN_TOP)
		newContainer.Parent = sg

		local layout = Instance.new("UIListLayout")
		layout.FillDirection = Enum.FillDirection.Vertical
		layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		layout.VerticalAlignment = Enum.VerticalAlignment.Top
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Padding = UDim.new(0, TOAST_PADDING)
		layout.Parent = newContainer

		container = newContainer
	end

	return container :: Frame
end

local function removeToast(toast: Frame)
	local index = table.find(activeToasts, toast)
	if index then
		table.remove(activeToasts, index)
	end

	local fadeTween = TweenService:Create(
		toast,
		TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
		{ BackgroundTransparency = 1, Position = toast.Position + UDim2.new(0, 30, 0, 0) }
	)

	for _, child in ipairs(toast:GetChildren()) do
		if child:IsA("TextLabel") then
			TweenService:Create(child, TweenInfo.new(0.25), { TextTransparency = 1 }):Play()
		elseif child:IsA("Frame") then
			TweenService:Create(child, TweenInfo.new(0.25), { BackgroundTransparency = 1 }):Play()
		end
	end

	fadeTween:Play()
	fadeTween.Completed:Once(function()
		toast:Destroy()
	end)
end

local function createToastInstance(config: ToastConfig): Frame
	local accentColor = ACCENT_COLORS[config.Type]

	local toast = Instance.new("Frame")
	toast.Name = "Toast"
	toast.Size = UDim2.new(1, 0, 0, TOAST_HEIGHT)
	toast.BackgroundColor3 = BACKGROUND_COLOR
	toast.BorderSizePixel = 0
	toast.ClipsDescendants = true

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = toast

	local dot = Instance.new("Frame")
	dot.Name = "AccentDot"
	dot.AnchorPoint = Vector2.new(0, 0.5)
	dot.Position = UDim2.new(0, 18, 0.5, 0)
	dot.Size = UDim2.new(0, 10, 0, 10)
	dot.BackgroundColor3 = accentColor
	dot.BorderSizePixel = 0
	dot.Parent = toast

	local dotCorner = Instance.new("UICorner")
	dotCorner.CornerRadius = UDim.new(1, 0)
	dotCorner.Parent = dot

	local messageLabel = Instance.new("TextLabel")
	messageLabel.Name = "Message"
	messageLabel.BackgroundTransparency = 1
	messageLabel.Position = UDim2.new(0, 42, 0, 0)
	messageLabel.Size = UDim2.new(1, -54, 1, 0)
	messageLabel.Font = Enum.Font.Gotham
	messageLabel.Text = config.Message
	messageLabel.TextColor3 = TEXT_COLOR
	messageLabel.TextSize = 14
	messageLabel.TextWrapped = true
	messageLabel.TextXAlignment = Enum.TextXAlignment.Left
	messageLabel.TextYAlignment = Enum.TextYAlignment.Center
	messageLabel.Parent = toast

	return toast
end

local function CreateToast(config: ToastConfig): Frame
	local containerRef = getContainer()

	local toast = createToastInstance(config)
	toast.Parent = containerRef
	table.insert(activeToasts, toast)

	toast.BackgroundTransparency = 1
	toast.Position = UDim2.new(0, 30, 0, 0)
	for _, child in ipairs(toast:GetChildren()) do
		if child:IsA("TextLabel") then
			child.TextTransparency = 1
		elseif child:IsA("Frame") then
			child.BackgroundTransparency = 1
		end
	end

	TweenService:Create(
		toast,
		TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{ BackgroundTransparency = 0, Position = UDim2.new(0, 0, 0, 0) }
	):Play()

	for _, child in ipairs(toast:GetChildren()) do
		if child:IsA("TextLabel") then
			TweenService:Create(child, TweenInfo.new(0.25), { TextTransparency = 0 }):Play()
		elseif child:IsA("Frame") then
			TweenService:Create(child, TweenInfo.new(0.25), { BackgroundTransparency = 0 }):Play()
		end
	end

	local duration = config.Duration or DEFAULT_DURATION
	task.delay(duration, function()
		if toast.Parent then
			removeToast(toast)
		end
	end)

	return toast
end

return CreateToast
            ]====], "c643b162539ee0eb5272d78183f602e9")
            if not Func then
                error(("[%s] Compile Error: %s"):format("c643b162539ee0eb5272d78183f602e9", tostring(LoadErr)))
            end
            local Ok, ErrOrResult = pcall(Func, Self)
            if not Ok then
                error(ErrOrResult)
            end
            return ErrOrResult
        end),
["db21792d17c11489aab14f29f966cd06"]=(function(Self)
            local Func, LoadErr = loadstring([====[
                local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
                --!nolint
--!strict
local HttpService = game:GetService("HttpService")

local ABLModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("532a982c55798c9f10f990c18c748348", "db21792d17c11489aab14f29f966cd06")
local Toast = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("c643b162539ee0eb5272d78183f602e9", "db21792d17c11489aab14f29f966cd06")
if not ABLModule then return nil :: ModuleType? end

local Module = {}
type ModuleType = typeof(Module)?

local Max = 1000000000

export type StatSuccess = {
    Attack: number?,
    Defense: number?,
    Mana: number?,
    Stamina: number?,
    HP: number?,
    Dodge: boolean?,
    Status: true,
    Hook: (Player: Player, Character: Model) -> ()?,
}

export type StatError = {
    Status: false,
    Message: string,
}

export type Stat = StatSuccess | StatError

local function GetBossStat(Boss: Player?, TeamCount: number): Stat
    if not ABLModule then error("ABLModule is not loaded") end
    local BossStatMap: {[ABLModule.ClassType]: (Player: Player, Character: Model) -> Stat} = {
        Sans=function(Player: Player): Stat
            return {
                Status=true,
                Attack=1,
                Defense=1,
                HP=700 * TeamCount,
                Mana=Max,
                Stamina=Max,
                Dodge=false
            }
        end,
        Asgore=function(Player: Player): Stat
            return {
                Status=true,
                Attack=100,
                Defense=150,
                HP=1200 * TeamCount,
                Mana=Max,
                Stamina=Max
            }
        end,
        GTFrisk=function(Player: Player, Character: Model): Stat
            local Phase = ABLModule.Stat(Player, "Phase")
            if Phase and Phase.Value == 1 then
                return {
                    Status=false,
                    Message="GTFrisk is in Phase 1 and cannot be fought.",
                }
            else
                return {
                    Status=true,
                    Attack=200,
                    Defense=140,
                    HP=1100 * TeamCount,
                    Mana=Max,
                    Stamina=Max
                }
            end
        end,
        GTGaster=function(Player: Player): Stat
            return {
                Status=true,
                Attack=120,
                Defense=140,
                HP=1100 * TeamCount,
                Mana=Max,
                Stamina=Max
            }
        end,
        XTFrisk=function(Player: Player): Stat
            return {
                Status=true,
                Attack=160,
                Defense=130,
                HP=1300 * TeamCount,
                Mana=Max,
                Stamina=Max
            }
        end,
        XTCross=function(Player: Player): Stat
            local Phase = ABLModule.Stat(Player, "Phase")
            if Phase and Phase.Value == 1 then
                return {
                    Status=false,
                    Message="XTCross is in Phase 1 and cannot be fought."
                }
            else
                return {
                    Status=true,
                    Attack=150,
                    Defense=140,
                    HP=1200 * TeamCount,
                    Mana=Max,
                    Stamina=Max
                }
            end
        end,
        SSChara=function(Player: Player): Stat
            local Phase = ABLModule.Stat(Player, "Phase")
            if Phase and Phase.Value == 1 then
                return {
                    Status=false,
                    Message="SSChara is in Phase 1 and cannot be fought."
                }
            else
                return {
                    Status=true,
                    Attack=100,
                    Defense=160,
                    HP=1200 * TeamCount,
                    Mana=Max,
                    Stamina=Max
                }
            end
        end,
        FunGang=function(Player: Player): Stat
            return {
                Status=true
            }
        end,
    }
    if not Boss then return {
        Status=false,
        Message="player not found."
    } end
    local Character = Boss.Character
    if not Character then return {
        Status=false,
        Message="character not found."
    } end
    return BossStatMap[ABLModule.GetClass(Boss)](Boss, Character)
end

local function GetNormalStat(Player: Player?): Stat
    if not ABLModule then error("ABLModule is not loaded") end
    local ABLModule = ABLModule :: typeof(ABLModule)
    local NormalStatMap: {[ABLModule.ClassType]: (Player: Player, Character: Model) -> Stat} = {
        Sans=function(Player: Player): Stat
            return {
                Status=true,
                Attack=1,
                Defense=3,
                HP=1,
                Dodge=true
            }
        end,
        Asgore=function(Player: Player): Stat
            return {
                Status=true,
                Attack=70,
                Defense=250,
                HP=300
            }
        end,
        GTFrisk=function(Player: Player, Character: Model): Stat
            local Phase = ABLModule.Stat(Player, "Phase")
            if Phase and Phase.Value == 1 then
                return {
                    Status=true,
                    Attack=120,
                    Defense=200,
                    HP=99
                }
            else
                return {
                    Status=true,
                    Attack=600,
                    Defense=10,
                    HP=10
                }
            end
        end,
        GTGaster=function(Player: Player): Stat
            return {
                Status=true,
                Attack=80,
                Defense=200,
                HP=250
            }
        end,
        XTFrisk=function(Player: Player): Stat
            return {
                Status=true,
                Attack=130,
                Defense=150,
                HP=250
            }
        end,
        XTCross=function(Player: Player): Stat
            local Phase = ABLModule.Stat(Player, "Phase")
            if Phase and Phase.Value == 1 then
                return {
                    Status=true,
                    Attack=60,
                    Defense=150,
                    HP=100,
                }
            else
                return {
                    Status=true,
                    Attack=80,
                    Defense=250,
                    HP=220
                }
            end
        end,
        SSChara=function(Player: Player): Stat
            local Phase = ABLModule.Stat(Player, "Phase")
            if Phase and Phase.Value == 1 then
                return {
                    Status=true,
                    Attack=90,
                    Defense=150,
                    HP=140
                }
            else
                return {
                    Status=true,
                    Attack=100,
                    Defense=250,
                    HP=220,
                    Mana=250
                }
            end
        end,
        FunGang=function(Player: Player): Stat
            return {
                Status=true,
                Mana=250
            }
        end,
    }
    if not Player then return {
        Status=false,
        Message="player not found."
    } end
    local Character = Player.Character
    if not Character then return {
        Status=false,
        Message="character not found."
    } end
    return NormalStatMap[ABLModule.GetClass(Player)](Player, Character)
end

local function GetLmsStat(Player: Player?): Stat
    if not ABLModule then error("ABLModule is not loaded") end
    local LmsStatMap: {[ABLModule.ClassType]: (Player: Player, Character: Model) -> Stat} = {
        Sans=function(Player: Player): Stat
            return {
                Status=true,
                Attack=1,
                Defense=100,
                HP=300,
                Mana=Max,
                Stamina=Max,
                Dodge=false
            }
        end,
        Asgore=function(Player: Player): Stat
            return {
                Status=true,
                Attack=90,
                Defense=250,
                HP=300,
                Mana=Max,
                Stamina=Max
            }
        end,
        GTFrisk=function(Player: Player, Character: Model): Stat
            local Phase = ABLModule.Stat(Player, "Phase")
            if Phase and Phase.Value == 1 then
                return {
                    Status=true,
                    Attack=100,
                    Defense=250,
                    HP=120,
                    Mana=Max,
                    Stamina=Max
                }
            else
                return {
                    Status=true,
                    Attack=200,
                    Defense=250,
                    HP=300,
                    Mana=Max,
                    Stamina=Max
                }
            end
        end,
        GTGaster=function(Player: Player): Stat
            return {
                Status=true,
                Attack=120,
                Defense=250,
                HP=250,
                Mana=Max,
                Stamina=Max
            }
        end,
        XTFrisk=function(Player: Player): Stat
            return {
                Status=true,
                Attack=150,
                Defense=170,
                HP=300,
                Mana=Max,
                Stamina=Max
            }
        end,
        XTCross=function(Player: Player): Stat
            local Phase = ABLModule.Stat(Player, "Phase")
            if Phase and Phase.Value == 1 then
                return {
                    Status=true,
                    Attack=80,
                    Defense=150,
                    HP=200,
                    Mana=Max,
                    Stamina=Max
                }
            else
                return {
                    Status=true,
                    Attack=100,
                    Defense=100,
                    HP=320,
                    Mana=Max,
                    Stamina=Max
                }
            end
        end,
        SSChara=function(Player: Player): Stat
            local Phase = ABLModule.Stat(Player, "Phase")
            if Phase and Phase.Value == 1 then
                return {
                    Status=true,
                    Attack=90,
                    Defense=150,
                    HP=200,
                    Mana=Max,
                    Stamina=Max
                }
            else
                return {
                    Status=true,
                    Attack=100,
                    Defense=250,
                    HP=320,
                    Mana=Max,
                    Stamina=Max
                }
            end
        end,
        FunGang=function(Player: Player): Stat
            return {
                Status=true,
                Defense=280,
                Mana=Max,
                Stamina=Max
            }
        end,
    }
    if not Player then return {
        Status=false,
        Message="player not found."
    } end
    local Character = Player.Character
    if not Character then return {
        Status=false,
        Message="character not found."
    } end
    return LmsStatMap[ABLModule.GetClass(Player)](Player, Character)
end

local function ApplyStat(Player: Player, Stat: StatSuccess): ()
    if not ABLModule then error("ABLModule is not loaded") end
    if typeof(Stat.Attack) == "number" then
        ABLModule.CmdrCommand(("att %s %i"):format(Player.Name, Stat.Attack))
    end
    if typeof(Stat.Defense) == "number" then
        ABLModule.CmdrCommand(("def %s %i"):format(Player.Name, Stat.Defense))
    end
    if typeof(Stat.Mana) == "number" then
        ABLModule.CmdrCommand(("mana %s %i 1"):format(Player.Name, Stat.Mana))
        ABLModule.CmdrCommand(("mana %s %i"):format(Player.Name, Stat.Mana))
    end
    if typeof(Stat.Stamina) == "number" then
        ABLModule.CmdrCommand(("stamina %s %i 1"):format(Player.Name, Stat.Stamina))
        ABLModule.CmdrCommand(("stamina %s %i"):format(Player.Name, Stat.Stamina))
    end
    if typeof(Stat.HP) == "number" then
        ABLModule.CmdrCommand(("h %s %i 1"):format(Player.Name, Stat.HP))
        ABLModule.CmdrCommand(("h %s %i"):format(Player.Name, Stat.HP))
    end
    if typeof(Stat.Dodge) == "boolean" then
        local Dodge = ABLModule.Stat(Player, "Dodge")
        if Dodge and Dodge.Value ~= Stat.Dodge then
            ABLModule.CmdrCommand(("dodge %s"):format(Player.Name))
        end
    end
    if Stat.Hook then
        local Character = Player.Character :: Model
        Stat.Hook(Player, Character)
    end
end

local function CalculateAdditionalBossHP(Boss: Player, Participants: { [string]: { Player } }): number
    local TeamAddition = 0
    for _, TeamPlayers in pairs(Participants) do
        local EachTeamCount = #TeamPlayers
        if EachTeamCount == 0 then continue end
        TeamAddition += (EachTeamCount) ^ 2.5 * 25
    end
    return TeamAddition
end

function Module.Stat(Boss: Player?, Participants: { [string]: { Player } })
    local TeamCount = 0
    for _, TeamPlayers in pairs(Participants) do
        if #TeamPlayers == 0 then continue end
        
        TeamCount += 1
    end

    for TeamName, TeamPlayers in pairs(Participants) do
        if #TeamPlayers == 0 then continue end
        local EachTeamCount = #TeamPlayers
        local IsLms = EachTeamCount == 1
        for _, Player in ipairs(TeamPlayers) do
            local Stat = if IsLms then GetLmsStat(Player) else GetNormalStat(Player)
            if Stat.Status then
                ApplyStat(Player, Stat)
                Toast({
                    Type="Success",
                    Message=("Applied Stat: %s (Player: %s, Role: %s)"):format(Player.Name, HttpService:JSONEncode(Stat), IsLms and "LMS" or "Normal")
                })
            else Toast({
                Type="Error",
                Message=("%s (Player: %s, Role: %s)"):format(Stat.Message, Player.Name, IsLms and "LMS" or "Normal")
            }) end
        end
    end

    local BossStat = GetBossStat(Boss, TeamCount)
    if BossStat.Status then
        local BossHP = BossStat.HP
        if BossHP then
            BossHP+=CalculateAdditionalBossHP(Boss :: Player, Participants)
        end
        BossStat.HP = BossHP
        ApplyStat(Boss :: Player, BossStat)
        Toast({
            Type="Success",
            Message=("Applied Stat: %s (Player: %s, Role: Boss)"):format((Boss :: Player).Name, HttpService:JSONEncode(BossStat))
        })
    else Toast({
        Type="Error",
        Message=("%s (Player: %s, Role: Boss)"):format(BossStat.Message, Boss and Boss.Name or "Unknown")
    }) end
end

return Module
            ]====], "db21792d17c11489aab14f29f966cd06")
            if not Func then
                error(("[%s] Compile Error: %s"):format("db21792d17c11489aab14f29f966cd06", tostring(LoadErr)))
            end
            local Ok, ErrOrResult = pcall(Func, Self)
            if not Ok then
                error(ErrOrResult)
            end
            return ErrOrResult
        end),
["5fc274f1b48de9284581ec642e9549af"]=(function(Self)
            local Func, LoadErr = loadstring([====[
                local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
                --!strict
local CoreGui = (function()
    local s, d = pcall(function() return game:GetService("CoreGui") end)
    return s
        and (d.Name == "CoreGui") and d
        or nil
end)()

local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui") :: PlayerGui

local Module = {}

function Module.GetContainer()
    return CoreGui or PlayerGui
end

function Module.GetPlayerGui()
    return PlayerGui
end

return Module
            ]====], "5fc274f1b48de9284581ec642e9549af")
            if not Func then
                error(("[%s] Compile Error: %s"):format("5fc274f1b48de9284581ec642e9549af", tostring(LoadErr)))
            end
            local Ok, ErrOrResult = pcall(Func, Self)
            if not Ok then
                error(ErrOrResult)
            end
            return ErrOrResult
        end),
["f0682ea99a292fc9094538d2bc669f5f"]=(function(Self)
            local Func, LoadErr = loadstring([====[
                local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
                --!strict
local band = bit32.band
local bxor = bit32.bxor
local bnot = bit32.bnot
local rshift = bit32.rshift
local rrotate = bit32.rrotate
local byteswap = bit32.byteswap

-- 64 round constants (first 32 bits of the fractional parts of the cube roots of the first 64 primes)
local K: {number} = {
	0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
	0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
	0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
	0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
	0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
	0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
	0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
	0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
}

-- Initial hash values (first 32 bits of the fractional parts of the square roots of the first 8 primes)
local H0: {number} = {
	0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
	0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19,
}

-- Builds the padded message directly into a buffer (avoids per-byte table.insert).
-- buffer.create() zero-fills, so we only need to write the original bytes,
-- the 0x80 marker, and the 64-bit big-endian length; the zero gap is already there.
local function padToBuffer(input: string): (buffer, number)
	local msgLen = #input
	local bitLen = msgLen * 8

	local totalLen = msgLen + 1 + 8
	totalLen += (64 - totalLen % 64) % 64

	local buf = buffer.create(totalLen)
	buffer.writestring(buf, 0, input)
	buffer.writeu8(buf, msgLen, 0x80)

	-- buffer.writeu32 is little-endian; byteswap flips the byte order so the
	-- bytes land in the buffer as big-endian, per the SHA-256 spec.
	local lenHigh = math.floor(bitLen / 0x100000000)
	local lenLow = bitLen % 0x100000000
	buffer.writeu32(buf, totalLen - 8, byteswap(lenHigh))
	buffer.writeu32(buf, totalLen - 4, byteswap(lenLow))

	return buf, totalLen
end

local function processChunk(H: {number}, buf: buffer, offset: number): ()
	-- message schedule array, 64 words
	local w: {number} = table.create(64, 0)
	for i = 0, 15 do
		w[i + 1] = byteswap(buffer.readu32(buf, offset + i * 4))
	end

	for i = 17, 64 do
		local w15 = w[i - 15]
		local w2 = w[i - 2]
		local s0 = bxor(rrotate(w15, 7), rrotate(w15, 18), rshift(w15, 3))
		local s1 = bxor(rrotate(w2, 17), rrotate(w2, 19), rshift(w2, 10))
		w[i] = (w[i - 16] + s0 + w[i - 7] + s1) % 0x100000000
	end

	local a, b, c, d, e, f, g, h =
		H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8]

	for i = 1, 64 do
		local S1 = bxor(rrotate(e, 6), rrotate(e, 11), rrotate(e, 25))
		local ch = bxor(band(e, f), band(bnot(e), g))
		local temp1 = (h + S1 + ch + K[i] + w[i]) % 0x100000000
		local S0 = bxor(rrotate(a, 2), rrotate(a, 13), rrotate(a, 22))
		local maj = bxor(band(a, b), band(a, c), band(b, c))
		local temp2 = (S0 + maj) % 0x100000000

		h = g
		g = f
		f = e
		e = (d + temp1) % 0x100000000
		d = c
		c = b
		b = a
		a = (temp1 + temp2) % 0x100000000
	end

	H[1] = (H[1] + a) % 0x100000000
	H[2] = (H[2] + b) % 0x100000000
	H[3] = (H[3] + c) % 0x100000000
	H[4] = (H[4] + d) % 0x100000000
	H[5] = (H[5] + e) % 0x100000000
	H[6] = (H[6] + f) % 0x100000000
	H[7] = (H[7] + g) % 0x100000000
	H[8] = (H[8] + h) % 0x100000000
end

local SHA256 = {}

-- Returns the digest as a 32-byte buffer (fastest form, other outputs derive from this)
function SHA256.hashToBuffer(input: string): buffer
	local buf, totalLen = padToBuffer(input)

	local H: {number} = table.clone(H0)
	for offset = 0, totalLen - 1, 64 do
		processChunk(H, buf, offset)
	end

	local out = buffer.create(32)
	for i = 1, 8 do
		buffer.writeu32(out, (i - 1) * 4, byteswap(H[i]))
	end

	return out
end

-- Returns the digest as a table of 32 bytes (numbers 0-255)
function SHA256.hashToBytes(input: string): {number}
	local out = SHA256.hashToBuffer(input)
	local bytes: {number} = table.create(32)
	for i = 0, 31 do
		bytes[i + 1] = buffer.readu8(out, i)
	end
	return bytes
end

-- Returns the digest as a 64-character lowercase hex string
function SHA256.hash(input: string): string
	local out = SHA256.hashToBuffer(input)
	local hex: {string} = table.create(32)
	for i = 0, 31 do
		hex[i + 1] = string.format("%02x", buffer.readu8(out, i))
	end
	return table.concat(hex)
end

return SHA256
            ]====], "f0682ea99a292fc9094538d2bc669f5f")
            if not Func then
                error(("[%s] Compile Error: %s"):format("f0682ea99a292fc9094538d2bc669f5f", tostring(LoadErr)))
            end
            local Ok, ErrOrResult = pcall(Func, Self)
            if not Ok then
                error(ErrOrResult)
            end
            return ErrOrResult
        end),
["1aca2df133555861b6da8ce8681dca83"]=(function(Self)
            local Func, LoadErr = loadstring([====[
                local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
                --!strict
--!nolint
local BUILD_SALT = "52e83c255bea4268df19e854d5408107cc1dee357903245e"

local Global = shared or _G

local function hashStr(str: string): number
	local hash = 5381
	for i = 1, #str do
		hash = (hash * 33 + string.byte(str, i)) % 2147483647
	end
	return hash
end

local function xorshift32New(seedNum: number)
	local state = seedNum % 4294967296
	if state == 0 then state = 0x9E3779B9 end
	return function(): number
		state = bit32.bxor(state, bit32.lshift(state, 13))
		state = bit32.bxor(state, bit32.rshift(state, 17))
		state = bit32.bxor(state, bit32.lshift(state, 5))
		state = state % 4294967296
		return state
	end
end

local sessionSeed = hashStr(BUILD_SALT .. ":" .. tostring(math.random(1, 2000000000)) .. ":" .. tostring(os.clock()))

local EXPOSED_KEY = "__k" .. tostring(hashStr(BUILD_SALT .. ":expose"))

local TREE_DEPTH = 4
local BRANCH_COUNT = 6
local REBUILD_INTERVAL_MIN = 60
local REBUILD_INTERVAL_MAX = 180
local DECOY_REFRESH_MIN = 45
local DECOY_REFRESH_MAX = 90
local DECOY_BUDGET_PER_KEY = 8
local DECOY_BUDGET_MIN = 16

type Path = { number }
type PackedRef = string
type TreeNode = { [number]: TreeNode | PackedRef }

local usedPaths: { [string]: boolean } = {}
local usedKeys: { [any]: boolean } = {}
local refs: { [string]: any } = {}
local nodes: { [string]: { [PackedRef]: PackedRef } } = {}
local tree: TreeNode = {}

local function xorString(str: string, streamSeed: number): string
	local rng = xorshift32New(streamSeed)
	local out: { string } = table.create(#str)
	for i = 1, #str do
		local r = rng()
		out[i] = string.char(bit32.bxor(string.byte(str, i), r % 256))
	end
	return table.concat(out)
end

local function checksum(str: string, streamSeed: number): number
	return hashStr(str .. tostring(streamSeed) .. "|chk") % 100000
end

local function pathToStr(path: Path): string
	return table.concat(path, "-")
end

local function derivePath(key: string): Path
	local path: Path = {}
	local h = hashStr(key .. tostring(sessionSeed))
	for level = 1, TREE_DEPTH do
		h = hashStr(tostring(h) .. tostring(level))
		path[level] = (h % BRANCH_COUNT) + 1
	end
	return path
end

local function randomSuffix(n: number?): string
	local chars: { string } = {}
	for i = 1, (n or 8) do
		chars[i] = string.char(math.random(97, 122))
	end
	return table.concat(chars)
end

local function genId(store: { [string]: any }): string
	local id: string
	repeat
		id = tostring(math.random(100000, 999999999)) .. randomSuffix(4)
	until not store[id]
	return id
end

local function packValue(value: any, seen: { [any]: string }?): PackedRef | any
	local seenTable: { [any]: string } = seen or {}
	local t = typeof(value)
	local raw: string

	if t == "function" or t == "Instance" or t == "thread"
		or t == "userdata" or t == "RBXScriptConnection" then
		local id = genId(refs)
		refs[id] = value
		raw = "R:" .. id

	elseif t == "table" then
		if seenTable[value] then
			raw = "D:" .. seenTable[value]
		else
			local nodeId = genId(nodes :: any)
			local node: { [PackedRef]: PackedRef } = {}
			nodes[nodeId] = node
			seenTable[value] = nodeId

			for k, v in pairs(value) do
				local packedKey = packValue(k, seenTable) :: PackedRef
				local packedVal = packValue(v, seenTable) :: PackedRef
				node[packedKey] = packedVal
			end
			raw = "D:" .. nodeId
		end

	elseif t == "number" then
		raw = "N:" .. tostring(value)
	elseif t == "string" then
		raw = "S:" .. value
	elseif t == "boolean" then
		raw = "B:" .. (value and "1" or "0")
	elseif t == "nil" then
		raw = "Z:"
	else
		return value
	end

	-- 값마다 독립 시드를 둬서, 같은 원시값이라도 매번 다른 암호문이 나오게 한다
	-- (패턴 매칭으로 "이 바이트열 = 이 값" 식 스캔을 어렵게 함).
	local streamSeed = hashStr(raw .. tostring(sessionSeed) .. tostring(math.random(1, 999999999)))
	local enc = xorString(raw, streamSeed)
	return "ENC:" .. tostring(streamSeed) .. ":" .. enc .. ":" .. tostring(checksum(raw, streamSeed))
end

local function unpackValue(packed: any): any
	if typeof(packed) ~= "string" or string.sub(packed, 1, 4) ~= "ENC:" then
		return packed
	end

	local body = string.sub(packed, 5)
	local seedPart, encPart, chkPart = string.match(body, "^(%-?%d+):(.*):(%d+)$")
	if not seedPart or not encPart or not chkPart then
		return nil
	end
	local streamSeed = tonumber(seedPart) :: number

	local decoded = xorString(encPart, streamSeed)
	if tostring(checksum(decoded, streamSeed)) ~= chkPart then
		return nil
	end

	local prefix = string.sub(decoded, 1, 2)
	local content = string.sub(decoded, 3)

	if prefix == "N:" then
		return tonumber(content)
	elseif prefix == "S:" then
		return content
	elseif prefix == "B:" then
		return content == "1"
	elseif prefix == "Z:" then
		return nil
	elseif prefix == "R:" then
		return refs[content]
	elseif prefix == "D:" then
		local node = nodes[content]
		if not node then return nil end
		local result: { [any]: any } = {}
		for k, v in pairs(node) do
			result[unpackValue(k)] = unpackValue(v)
		end
		return result
	end

	return nil
end

local function generateDecoy(): PackedRef | any
	local roll = math.random(1, 3)
	if roll == 1 then
		return packValue(math.random(1, 999999))
	elseif roll == 2 then
		return packValue(tostring(math.random(1, 1000000000)) .. randomSuffix())
	else
		return packValue(math.random(0, 1) == 1)
	end
end

local function ensurePathAndScatter(path: Path): ()
	local node: any = tree
	for level = 1, TREE_DEPTH do
		local realIdx = path[level]
		for b = 1, BRANCH_COUNT do
			if node[b] == nil then
				if level == TREE_DEPTH then
					node[b] = generateDecoy()
				else
					node[b] = {}
				end
			end
		end
		if typeof(node[realIdx]) ~= "table" and level < TREE_DEPTH then
			node[realIdx] = {}
		end
		node = node[realIdx]
	end
end

local function doSet(key: string, value: any): ()
	local path = derivePath(key)
	ensurePathAndScatter(path)

	local node: any = tree
	for level = 1, TREE_DEPTH - 1 do
		node = node[path[level]]
	end
	node[path[TREE_DEPTH]] = packValue(value)
	usedPaths[pathToStr(path)] = true
	usedKeys[key] = true
end

local function doGet(key: string): any
	local path = derivePath(key)
	local node: any = tree
	for level = 1, TREE_DEPTH do
		if not node then
			return nil
		end
		node = node[path[level]]
	end
	return unpackValue(node)
end

-- ============================================================
-- 기존: 트리 전체(최대 6^4 리프)를 재귀 순회하며 미사용 경로를 전부
-- 새 decoy로 교체 -> 사용 키 개수와 무관하게 항상 최대 비용.
-- 변경: 예산(budget)만큼만 무작위로 미사용 경로를 골라 교체.
-- 사용 키가 적으면 비용도 작아짐.
-- ============================================================
local function collectUnusedLeafPaths(node: any, depth: number, pathSoFar: Path, out: { Path }): ()
	if depth > TREE_DEPTH then return end
	for idx, v in pairs(node) do
		local currentPath = table.clone(pathSoFar)
		table.insert(currentPath, idx)

		if depth == TREE_DEPTH then
			if not usedPaths[pathToStr(currentPath)] then
				table.insert(out, currentPath)
			end
		elseif typeof(v) == "table" then
			collectUnusedLeafPaths(v, depth + 1, currentPath, out)
		end
	end
end

local function refreshDecoys(): ()
	local budget = math.max(DECOY_BUDGET_MIN, DECOY_BUDGET_PER_KEY * math.max(1, next(usedKeys) and 1 or 0))
	-- usedKeys 개수 세기 (테이블 크기 직접 카운트)
	local keyCount = 0
	for _ in pairs(usedKeys) do keyCount += 1 end
	budget = math.max(DECOY_BUDGET_MIN, DECOY_BUDGET_PER_KEY * math.max(1, keyCount))

	local unused: { Path } = {}
	collectUnusedLeafPaths(tree, 1, {}, unused)

	-- 예산 초과분은 섞어서 일부만 선택 (전체를 다 훑는 비용은 위 collect에서
	-- 어차피 발생하지만, packValue/generateDecoy 같은 무거운 연산은
	-- budget만큼만 실행되도록 제한)
	for i = #unused, 2, -1 do
		local j = math.random(1, i)
		unused[i], unused[j] = unused[j], unused[i]
	end

	local limit = math.min(budget, #unused)
	for i = 1, limit do
		local path = unused[i]
		local node: any = tree
		for level = 1, TREE_DEPTH - 1 do
			node = node[path[level]]
		end
		node[path[TREE_DEPTH]] = generateDecoy()
	end
end

-- ============================================================
-- 기존: 매번 트리 전체를 비우고(tree={}) 처음부터 다시 채움
-- -> 사용 키 개수와 무관하게 항상 트리 전체 규모 비용.
-- 변경: 실사용 값만 재배치(경로 재계산)하고, decoy는 refreshDecoys에
-- 위임해서 여기서 별도로 채우지 않음 -> 비용이 사용 키 개수에 비례.
-- ============================================================
local function rebuildState(): ()
	local liveValues: { [any]: any } = {}
	for key in pairs(usedKeys) do
		liveValues[key] = doGet(key)
	end

	sessionSeed = hashStr(BUILD_SALT .. ":" .. tostring(math.random(1, 2000000000)) .. ":" .. tostring(os.clock()))

	tree, nodes, refs, usedPaths = {}, {}, {}, {}

	for key, value in pairs(liveValues) do
		doSet(key, value)
	end
end

type Action = "set" | "get"

local function dispatch(action: Action, key: string, value: any?): any
	if action == "set" then
		doSet(key, value)
		return true
	elseif action == "get" then
		return doGet(key)
	end
	return nil
end

export type UITransitionStateModule = {
	Set: (key: string, value: any) -> (),
	Get: (key: string) -> any,
	Global: () -> any,
}

local function buildModule(d: (Action, string, any?) -> any): UITransitionStateModule
	local Module = {}
	function Module.Set(key: string, value: any)
		d("set", key, value)
	end
	function Module.Get(key: string): any
		return d("get", key)
	end
	function Module.Global(): any
		return Global
	end
	return Module :: UITransitionStateModule
end

if typeof(Global[EXPOSED_KEY]) == "function" then
	return buildModule(Global[EXPOSED_KEY])
end

Global[EXPOSED_KEY] = dispatch

return buildModule(dispatch)
            ]====], "1aca2df133555861b6da8ce8681dca83")
            if not Func then
                error(("[%s] Compile Error: %s"):format("1aca2df133555861b6da8ce8681dca83", tostring(LoadErr)))
            end
            local Ok, ErrOrResult = pcall(Func, Self)
            if not Ok then
                error(ErrOrResult)
            end
            return ErrOrResult
        end),
["7f26a1c24e9e445582a179e7f3a95988"]=(function(Self)
            local Func, LoadErr = loadstring([====[
                local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
                export type RobloxUserId = number
export type RobloxUserName = string
export type RobloxUserDisplayname = string
export type RobloxPlaceId = number
export type RobloxUniverseId = number
export type RobloxJobId = string

export type RobloxUsersSimple = {
    id: RobloxUserId;
    name: RobloxUserName;
    displayName: RobloxUserDisplayname;
    hasVerifiedBadge: boolean;
    requestedUsername: string?;
}

export type RobloxUsers = RobloxUsersSimple & {
    description: string;
    externalAppDisplayName: string?;
    isBanned: boolean;
    created: string;
}

export type RobloxPlaceInfo = {
    placeId: RobloxPlaceId;
    universeId: RobloxUniverseId?;
    name: string;
    description: string;
    creator: {
        id: number;
        name: string;
        type: string;
    };
    price: number?;
    playing: number;
    visits: number;
    maxPlayers: number;
    created: string;
    updated: string;
    logos: {string};
}

local Module = {}

return Module
            ]====], "7f26a1c24e9e445582a179e7f3a95988")
            if not Func then
                error(("[%s] Compile Error: %s"):format("7f26a1c24e9e445582a179e7f3a95988", tostring(LoadErr)))
            end
            local Ok, ErrOrResult = pcall(Func, Self)
            if not Ok then
                error(ErrOrResult)
            end
            return ErrOrResult
        end)
                },
                ScriptNames={
                    ["2a7bb31d62e706c8eb498d59f4f9a667"]="2a7bb31d62e706c8eb498d59f4f9a667",
["11e8106c399d65a976e76ad6e7a1d5bb"]="11e8106c399d65a976e76ad6e7a1d5bb",
["532a982c55798c9f10f990c18c748348"]="532a982c55798c9f10f990c18c748348",
["8f8cd2148959a6855c0043dd204d6592"]="8f8cd2148959a6855c0043dd204d6592",
["738d560ed168b91824099e89eff88cd6"]="738d560ed168b91824099e89eff88cd6",
["5799bfb39ce31a94790c66ad18b65b74"]="5799bfb39ce31a94790c66ad18b65b74",
["0f3e8ef7067ed61518bd655cb9bf17b1"]="0f3e8ef7067ed61518bd655cb9bf17b1",
["c643b162539ee0eb5272d78183f602e9"]="c643b162539ee0eb5272d78183f602e9",
["db21792d17c11489aab14f29f966cd06"]="db21792d17c11489aab14f29f966cd06",
["5fc274f1b48de9284581ec642e9549af"]="5fc274f1b48de9284581ec642e9549af",
["f0682ea99a292fc9094538d2bc669f5f"]="f0682ea99a292fc9094538d2bc669f5f",
["1aca2df133555861b6da8ce8681dca83"]="1aca2df133555861b6da8ce8681dca83",
["7f26a1c24e9e445582a179e7f3a95988"]="7f26a1c24e9e445582a179e7f3a95988"
                },
                ScriptCache={},
                ScriptLoading={},
                ScriptGet=function(Self, name, caller)
                    local DisplayName = Self.ScriptNames[name] or name
                    local Cache = Self.ScriptCache[name]
                    if Cache then
                        print(([=[ [Cached] require("%s") <- %s]=]):format(DisplayName, caller or "?"))
                        return table.unpack(Cache, 1, Cache.n)
                    end
                    if Self.ScriptLoading[name] then
                        error(("Circular Dependency Detected: %s"):format(DisplayName))
                    end
                    print(([=[ [Loaded] require("%s") <- %s]=]):format(DisplayName, caller or "?"))
                    local Func = Self.ScriptFunctions[name]
                    if not Func then error(("Wrong Dependency: %s"):format(DisplayName)) end
                    Self.ScriptLoading[name] = true
                    local Result = table.pack(Func(Self))
                    Self.ScriptLoading[name] = nil
                    Self.ScriptCache[name] = Result
                    return table.unpack(Result, 1, Result.n)
                end
            }
            

            local FinalOk, FinalErr = pcall(function()
                
        local RootFunc, RootLoadErr = loadstring([====[
            local G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = ...
            --!nolint

local EncodingService = game:GetService("EncodingService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local VirtualUser = (function()
    local s, d = pcall(function() return game:GetService("VirtualUser") end)
    return s
        and d
        or nil
end)()

local Title = "EclipseX"
local MetaModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("2a7bb31d62e706c8eb498d59f4f9a667", "08ced6cdfbf50a84183be1af4b4c8dc5")
local BaseModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("11e8106c399d65a976e76ad6e7a1d5bb", "08ced6cdfbf50a84183be1af4b4c8dc5")
local ABLModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("532a982c55798c9f10f990c18c748348", "08ced6cdfbf50a84183be1af4b4c8dc5")
local ABAModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("8f8cd2148959a6855c0043dd204d6592", "08ced6cdfbf50a84183be1af4b4c8dc5")
local Nova = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("738d560ed168b91824099e89eff88cd6", "08ced6cdfbf50a84183be1af4b4c8dc5")
local Tools, Manager = Nova.Create(Title)
local UIModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("5799bfb39ce31a94790c66ad18b65b74", "08ced6cdfbf50a84183be1af4b4c8dc5")
local UI = UIModule(Tools, Manager)
local Lists = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("0f3e8ef7067ed61518bd655cb9bf17b1", "08ced6cdfbf50a84183be1af4b4c8dc5")
local Toast = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("c643b162539ee0eb5272d78183f602e9", "08ced6cdfbf50a84183be1af4b4c8dc5")


local Closed = false
local MainScreen = UI.CreateMainGui({
    Title=Title,
    OnClose=function()
        print(("%s Closed!"):format(Title))
        Closed = true
    end
})

type WaitWithLoopManager = {
    Disconnect: () -> (),
    Disconnected: boolean
}

local function WaitWithLoop(
    Time: number,
    Callback: (WaitWithLoopManager) -> any
)
    local timeout = os.clock() + Time
    local EventManager 
    EventManager = {
        Disconnected=false,
        Disconnect=function() EventManager.Disconnected = true end
    } :: WaitWithLoopManager
    local Args
    while os.clock() < timeout do
        Args = Callback(EventManager)
        if EventManager.Disconnected then
            break
        end

        RunService.Heartbeat:Wait()
    end

    return Args
end

task.spawn(function()
    -- =======================================================
    -- ========================= Main
    -- =======================================================

    task.spawn(function()
        -- =======================================================
        -- ========================= Home
        -- =======================================================
        local GameInfo = Tools.Games.GetProductInfo()
        local GameImage = Tools.Games.GetGameIcon()
        local function playerCountText()
            return ("Players: %d / %d"):format(#Players:GetPlayers(), Players.MaxPlayers)
        end

        local LocalPlayer = Players.LocalPlayer

        local HomeScreen = UI.CreateHomeScreen({
            LayoutOrder = 1,
            UserId = LocalPlayer.UserId,
            DisplayName = LocalPlayer.DisplayName,
            Username = LocalPlayer.Name,
            GameIcon = GameImage,
            GameName = GameInfo.Name,
            PlayerCountText = playerCountText(),
            GameDescription = (GameInfo.Description and GameInfo.Description ~= "")
                and GameInfo.Description or "No Description.",
        })

        Tools.Events.ConnectEvent(Players.PlayerAdded, function()
            HomeScreen.SetPlayerCount(playerCountText())
        end)
        
        Tools.Events.ConnectEvent(Players.PlayerRemoving, function()
            task.defer(function()
                HomeScreen.SetPlayerCount(playerCountText())
            end)
        end)

        MainScreen.addScreen(HomeScreen)
    end)

    task.spawn(function()
        -- =======================================================
        -- ========================= Teleport
        -- =======================================================
        local function Teleport(TargetPlayer: Player)
            local TargetRoot = Tools.Players.GetRoot(TargetPlayer)
            if not TargetRoot then return end
            Tools.Players.Teleport(TargetRoot.CFrame)
        end

        local TeleportScreen = UI.CreateScreen({
            TabName = "Teleport",
            LayoutOrder = 2,
        })

        TeleportScreen.PlayerSelectableList.Instant({
            OnClick = function(Player)
                local TargetPlayer = Player
                if TargetPlayer then
                    Teleport(TargetPlayer)
                end
            end,
        })

        MainScreen.addScreen(TeleportScreen)
    end)
    
end)

task.spawn(function()
    -- =======================================================
    -- ========================= ABL 
    -- =======================================================
    if ABLModule then
        local Permission: "HOST" | "PRIVATE" | "NONE" = (function()
            local TestResponse = ABLModule.CmdrCommand(("teleport %s %s"):format(Players.LocalPlayer.Name, Players.LocalPlayer.Name))
            if TestResponse == "Teleported 1 players." or TestResponse == "Target player has no character." then return "HOST" end
            if TestResponse == "You can only run private server commands in your own private server!" then return "PRIVATE" end
            return "NONE" 
        end)()
        
        local function GetSnapshot()
            local LocalClass = ABLModule.GetClass()
            local LocalRoot = Tools.Players.GetRoot(Players.LocalPlayer)
            return {
                Class=LocalClass,
                CFrame=LocalRoot and LocalRoot.CFrame,
            }
        end

        local function SetSnapshot(Snapshot: any)
            local LocalCharacter = ABLModule.PickClass(Snapshot.Class)
            if not LocalCharacter then return end
            local LocalRoot = Tools.Players.GetRoot(LocalCharacter)
            if not LocalRoot then return end
            LocalRoot.CFrame = Snapshot.CFrame
        end

        task.spawn(function()
            -- =======================================================
            -- ========================= Infinite Stamina
            -- =======================================================
            local LocalPlayer = Players.LocalPlayer
            local function InfiniteStamina()
                local RunStamina = ABLModule.Stat(LocalPlayer, "RunStamina")
                local RunStaminaMax = ABLModule.Stat(LocalPlayer, "RunStaminaMax")
                if not RunStamina then return end
                Tools.Events.ConnectEvent(RunStamina.Changed, function(RunStaminaValue)
                    RunStamina.Value = RunStaminaMax.Value
                end)
            end

            Tools.Events.ConnectEvent(LocalPlayer.CharacterAdded, InfiniteStamina)
            InfiniteStamina()
        end)

        task.spawn(function()
            -- =======================================================
            -- ========================= Positions
            -- =======================================================
            local PositionScreen = UI.CreateScreen({
                TabName = "Positions",
                LayoutOrder = 3,
            })

            local Items = {}
            for _, PositionData in ipairs(ABLModule.Positions) do
                local Coordinates = PositionData.Position
                table.insert(Items, {
                    Key = PositionData.Name,
                    Title = PositionData.Name,
                    SubTitle = ("%d, %d, %d"):format(Coordinates.X, Coordinates.Y, Coordinates.Z),
                    Data = Coordinates,
                })
            end

            PositionScreen.SelectableList.Instant({
                Items = Items,
                OnClick = function(item)
                    Tools.Players.Teleport(CFrame.new(item.Data))
                end,
            })

            MainScreen.addScreen(PositionScreen)
        end)

        task.spawn(function()
            -- =======================================================
            -- ========================= Dummy
            -- =======================================================
            local DummyScreen = UI.CreateScreen({
                TabName = "Dummies",
                LayoutOrder = 4,
            })

            local function BuildItems()
                local Items = {}
                local Dummys = Workspace:FindFirstChild("Dummys") :: Folder?
                if Dummys then
                    for _, DummyModel in ipairs(Dummys:GetChildren()) do
                        if not (DummyModel and DummyModel:IsA("Model")) then continue end
                        local DummyRoot = DummyModel:FindFirstChild("HumanoidRootPart", 0.5) :: Part?
                        if not DummyRoot then continue end
                        table.insert(Items, {
                            Key = DummyModel.Name,
                            Title = DummyModel.Name,
                            SubTitle = ("%d, %d, %d"):format(DummyRoot.Position.X, DummyRoot.Position.Y, DummyRoot.Position.Z),
                            Data = DummyRoot.Position,
                        })
                    end
                end
                return Items
            end

            local DummyList = DummyScreen.SelectableList.Instant({
                Items = BuildItems(),
                OnClick = function(item)
                    Tools.Players.Teleport(CFrame.new(item.Data))
                end,
            })

            MainScreen.addScreen(DummyScreen)

            task.spawn(function()
                while DummyScreen.Screen.Parent do
                    DummyList.Refresh(BuildItems())
                    task.wait(1)
                end
            end)
        end)

        task.spawn(function()
            -- =======================================================
            -- ========================= Fakeout
            -- =======================================================
            local EventManager

            local FakeoutScreen = UI.CreateScreen({
                TabName = "Fakeout",
                LayoutOrder = 5,
            })

            local SelectedPlayers: { Player } = {}

            FakeoutScreen.PlayerSelectableList.MultiSelect({
                OnChange = function(players)
                    SelectedPlayers = players
                end,
            })

            FakeoutScreen.Button.Toggle({
                ButtonText = "Teleport",
                OnStart = function()
                    local TargetCharacters = {} :: { Model }
                    for _, TargetPlayer in ipairs(SelectedPlayers) do
                        if TargetPlayer.Character then
                            table.insert(TargetCharacters, TargetPlayer.Character)
                        end
                    end

                    EventManager = BaseModule.HookAnimation({ Players.LocalPlayer.Character }, {
                        "rbxassetid://15408719218", -- Kris 2 Hit
                        "rbxassetid://17534278501", -- Kris 3 Hit
                        "rbxassetid://15660827065", -- Susie 2 Hit
                    }, function(Player, AnimationId)
                        local CFrameSnapshot
                        do
                            local LocalPlayer = Players.LocalPlayer
                            local LocalRoot = Tools.Players.GetRoot(LocalPlayer)
                            if not LocalRoot then return end

                            local Stunned = ABLModule.Stat(nil, "Stunned")
                            if not Stunned then return end
                            if not Stunned.Value then return end
                            CFrameSnapshot = LocalRoot.CFrame
                        end

                        local Finish = BaseModule.CreateHolder()
                        local VoidPosition = Vector3.new(0, workspace.FallenPartsDestroyHeight + 20, 0)
                        local TeleportManager
                        TeleportManager = Tools.Events.ConnectEvent(RunService.Heartbeat, function()
                            local LocalPlayer = Players.LocalPlayer
                            local LocalRoot = Tools.Players.GetRoot(LocalPlayer)
                            if not LocalRoot then return end

                            local Stunned = ABLModule.Stat(nil, "Stunned")
                            if not Stunned then
                                return Finish.Fire()
                            end
                            if not Stunned.Value then
                                return Finish.Fire()
                            end

                            LocalRoot.CFrame = CFrame.new(VoidPosition)
                        end)
                        Finish.Wait()
                        TeleportManager.Disconnect()
                        do
                            local LocalPlayer = Players.LocalPlayer
                            local LocalRoot = Tools.Players.GetRoot(LocalPlayer)
                            if not LocalRoot then return end
                            LocalRoot.CFrame = CFrameSnapshot
                        end
                    end)

                    Manager.AddCleanup(function()
                        EventManager.Disconnect()
                    end)
                end,
                OnEnd = function()
                    if EventManager then
                        EventManager.Disconnect()
                    end
                end,
            })

            MainScreen.addScreen(FakeoutScreen)
        end)


        task.spawn(function()
            -- =======================================================
            -- ========================= Character
            -- =======================================================
            local function Character(ItemData: UIModule.ItemData)
                local LocalPlayer = Players.LocalPlayer
                local LocalRoot = Tools.Players.GetRoot(LocalPlayer)
                local CFrame
                if LocalRoot then
                    CFrame = LocalRoot.CFrame
                end
                local LocalCharacter = ABLModule.PickClass((ItemData :: any).Key)
                local LocalRoot2 = Tools.Players.GetRoot(LocalCharacter)
                if CFrame then
                    LocalRoot2.CFrame = CFrame
                end
            end

            local Items = {}
            for _, Character in ipairs(ABLModule.Classes) do
                table.insert(Items, {
                    Key = Character.Name,
                    Title = Character.Name,
                    Img = Character.Thumbnail,
                })
            end

            if Permission == "HOST" or Permission == "PRIVATE" then
                for _, Character in ipairs(ABLModule.PrivateClasses) do
                    table.insert(Items, {
                        Key = Character.Name,
                        Title = Character.Name,
                        Img = Character.Thumbnail,
                    })
                end
            end

            local CharacterScreen = UI.CreateScreen({
                TabName = "Characters",
                LayoutOrder = 6,
            })

            CharacterScreen.DescriptionButton.Instant({
                ButtonText = "Reset",
                Description = "Pick a Character",
                OnAction = function()
                    ABLModule.ResetForce()
                end,
            })

            CharacterScreen.SelectableList.Instant({
                Items = Items,
                OnClick = Character,
            })

            MainScreen.addScreen(CharacterScreen)
        end)
        
        task.spawn(function()
            -- =======================================================
            -- ========================= LMB
            -- =======================================================
            local LmbScreen = UI.CreateScreen({
                TabName = "Infinite Lmb",
                LayoutOrder = 7,
            })

            local CurrentTarget: Player? = nil
            local Running = false

            LmbScreen.PlayerSelectableList.SingleSelect({
                OnChange = function(player)
                    CurrentTarget = player
                end,
            })

            local function Lmb()
                local TargetPlayer = CurrentTarget :: Player
                if not TargetPlayer then return end

                ABLModule.ResetForce()
                while not TargetPlayer.Character and not Closed do
                    if not Running then
                        return
                    end
                    task.wait()
                end

                local LocalCharacter = ABLModule.PickClass("GTGaster")
                local LocalRoot = Tools.Players.GetRoot(LocalCharacter)

                local EventManager
                EventManager = Tools.Events.ConnectEvent(RunService.Heartbeat, function()
                    local TargetPlayer = CurrentTarget :: Player
                    if not TargetPlayer then return end
                    local TargetCharacter = TargetPlayer.Character
                    local TargetRoot = Tools.Players.GetRoot(TargetCharacter)
                    if not TargetRoot then return end

                    LocalRoot.CFrame = BaseModule.PredictCFrame(TargetRoot, 3.5, 20) * CFrame.new(0, -11, 0)
                end)
                Manager.AddCleanup(function()
                    EventManager.Disconnect()
                end)
                if not WaitWithLoop(BaseModule.GetPingAwait(), function(Manager)
                    if not Running or Closed then
                        Manager.Disconnect()
                    end
                    return Running
                end) then return ABLModule.ResetForce() end

                local TargetPlayer = CurrentTarget :: Player
                if not TargetPlayer then return ABLModule.ResetForce() end
                local TargetCharacter = TargetPlayer.Character :: Model
                local Blocking = ABLModule.Stat(TargetPlayer, "Blocking")
                if Blocking.Value then
                    ABLModule.Melee(TargetCharacter, 6)
                else
                    for i = 1, 4 do
                        local TargetPlayer = CurrentTarget :: Player
                        if not TargetPlayer then break end
                        local TargetCharacter = TargetPlayer.Character
                        if not TargetCharacter then continue end
                        ABLModule.Melee(TargetCharacter, i)
                        if i ~= 4 then
                            if not WaitWithLoop(BaseModule.GetPingAwait(), function(Manager)
                                if not Running or not TargetPlayer.Character or Closed then
                                    Manager.Disconnect()
                                end
                                return Running
                            end) then return ABLModule.ResetForce() end
                        end
                    end
                end
                ABLModule.ResetForce()
            end

            LmbScreen.Button.Loop({
                ButtonText = "Start",
                OnBeforeStart = GetSnapshot,
                OnStart = function()
                    Running = true
                end,
                OnAction = Lmb,
                OnEnd = function()
                    Running = false
                end,
                OnAfterEnd = SetSnapshot,
            })

            MainScreen.addScreen(LmbScreen)
        end)

        task.spawn(function()
            -- =======================================================
            -- ========================= AutoBlock
            -- =======================================================
            local AutoBlockScreen = UI.CreateScreen({
                TabName = "AutoBlock",
                LayoutOrder = 8,
                Active=(Players.LocalPlayer:GetNetworkPing() < 0.1)
            })

            local LmbAnims = {}
            for _, Animation in ipairs(ReplicatedStorage:WaitForChild("Animations"):GetDescendants()) do 
                if not Animation:IsA("Animation") then continue end
                if
                Animation.Name:match("^Combo(%d+)$") then table.insert(LmbAnims, Animation.AnimationId) elseif
                Animation.Name:match("^Slash(%d+)$") then table.insert(LmbAnims, Animation.AnimationId) elseif
                Animation.Name:match("^LMB(%d+)$") then table.insert(LmbAnims, Animation.AnimationId) elseif
                Animation.Name:match("^Melee(%d+)$") then table.insert(LmbAnims, Animation.AnimationId) elseif
                Animation.Name:match("^Lmb(%d+)$") then table.insert(LmbAnims, Animation.AnimationId) end
            end

            local SelectedTargets: { Player } = {}
            local Running = false

            local Hooks: { [Player]: any } = {}

            local function AutoBlock(TargetPlayer: Player, AnimationId: string)
                print("애니메이션 감지됨")
                local LocalPlayer = Players.LocalPlayer

                local LocalRoot = Tools.Players.GetRoot(LocalPlayer)
                local TargetRoot = Tools.Players.GetRoot(TargetPlayer)
                if not LocalRoot or not TargetRoot then return end
                local ToTarget = LocalRoot.Position - TargetRoot.Position
                local IsHit = false

                if math.abs(ToTarget.Y) <= 15 / 2 then
                    local FlatOffset = Vector3.new(ToTarget.X, 0, ToTarget.Z)
                    local FlatDistance = FlatOffset.Magnitude

                    if FlatDistance <= 16 then
                        if FlatDistance == 0 then
                            IsHit = true
                        else
                            local TargetLook = TargetRoot.CFrame.LookVector
                            local FlatLook = Vector3.new(TargetLook.X, 0, TargetLook.Z).Unit
                            local Dot = FlatLook:Dot(FlatOffset.Unit)
                            local AngleBetween = math.deg(math.acos(math.clamp(Dot, -1, 1)))
                            IsHit = AngleBetween <= 120 / 2
                        end
                    end
                    
                end
                
                if IsHit then
                    ABLModule.Block(0.2)
                end
            end

            local function ConnectPlayer(Player: Player)
                if Hooks[Player] then return end
                local Character = Player.Character
                if not Character then return end

                local EventManager = BaseModule.HookAnimation({ Character }, LmbAnims, function(_, AnimationId)
                    AutoBlock(Player, AnimationId)
                end)
                Manager.AddCleanup(function()
                    EventManager.Disconnect()
                end)
                Hooks[Player] = EventManager
            end

            local function DisconnectPlayer(Player: Player)
                local Hook = Hooks[Player]
                if not Hook then return end
                Hook.Disconnect()
                Hooks[Player] = nil
            end

            local function DisconnectAll()
                for Player in pairs(Hooks) do
                    DisconnectPlayer(Player)
                end
            end

            AutoBlockScreen.PlayerSelectableList.MultiSelect({
                OnChange = function(players)
                    local NewSet = {}
                    for _, Player in ipairs(players) do
                        NewSet[Player] = true
                    end

                    for _, Player in ipairs(SelectedTargets) do
                        if not NewSet[Player] then
                            DisconnectPlayer(Player)
                        end
                    end

                    for _, Player in ipairs(players) do
                        if not Hooks[Player] then
                            ConnectPlayer(Player)
                        end
                    end

                    SelectedTargets = players
                end,
            })

            AutoBlockScreen.Button.Toggle({
                ButtonText = "Start",
                OnStart = function()
                    Running = true
                end,
                OnEnd = function()
                    Running = false
                    DisconnectAll()
                end,
            })

            MainScreen.addScreen(AutoBlockScreen)
        end)

        task.spawn(function()
            -- =======================================================
            -- ========================= HTBR
            -- =======================================================
            local HTBRScreen = UI.CreateScreen({
                TabName = "HTBR",
                LayoutOrder = 9,
            })

            local SelectedTargets: { Player } = {}
            local Running = false

            HTBRScreen.PlayerSelectableList.MultiSelect({
                OnChange = function(players)
                    SelectedTargets = players
                end,
            })

            local function HTBR()
                local LocalCharacter = ABLModule.PickClass("GTFrisk")
                local LocalPlayer = Players.LocalPlayer
                local LocalRoot = Tools.Players.GetRoot(LocalCharacter)

                local Range = 10000
                local DestroyY = workspace.FallenPartsDestroyHeight + 20
                local X = math.random(-Range, Range)
                local Y = math.random(DestroyY, DestroyY + Range * 2)
                local Z = math.random(-Range, Range)

                local Finish = BaseModule.CreateHolder()

                local EventManager
                EventManager = Tools.Events.ConnectEvent(RunService.Heartbeat, function()
                    if not Running then
                        return Finish.Fire()
                    end
                    LocalRoot.CFrame = CFrame.new(X, Y, Z)
                    for i, TargetPlayer in ipairs(SelectedTargets) do
                        local TargetRoot = Tools.Players.GetRoot(TargetPlayer)
                        if TargetRoot then
                            TargetRoot.CFrame = LocalRoot.CFrame * CFrame.new(0, 0, -5)
                        end
                    end

                    local SlashBigOnCD = ABLModule.Cooldown(LocalPlayer, "Determination", "SlashBig")
                    local SlashSpamOnCD = ABLModule.Cooldown(LocalPlayer, "Determination", "SlashSpam")

                    if not SlashBigOnCD then
                        ABLModule.Skill("Determination", "SlashBig")
                    elseif not SlashSpamOnCD then
                        ABLModule.Skill("Determination", "SlashSpam")
                    end

                    local Stunned = ABLModule.Stat(LocalPlayer, "Stunned")
                    if SlashBigOnCD and SlashSpamOnCD and Stunned and not Stunned.Value then
                        return Finish.Fire()
                    end
                end)
                Manager.AddCleanup(function()
                    EventManager.Disconnect()
                end)
                Finish.Wait()
                EventManager.Disconnect()
                ABLModule.ResetForce()
            end

            HTBRScreen.Button.Loop({
                ButtonText = "Start",
                OnBeforeStart = GetSnapshot,
                OnStart = function()
                    Running = true
                end,
                OnAction = HTBR,
                OnEnd = function()
                    Running = false
                end,
                OnAfterEnd = SetSnapshot,
            })

            MainScreen.addScreen(HTBRScreen)
        end)

        task.spawn(function()
            -- =======================================================
            -- ========================= KillFarm
            -- =======================================================
            local KillFarmScreen = UI.CreateScreen({
                TabName = "KillFarm",
                LayoutOrder = 10,
            })

            local CurrentTarget: Player? = nil
            local Running = false

            KillFarmScreen.PlayerSelectableList.SingleSelect({
                OnChange = function(player)
                    CurrentTarget = player
                end,
            })

            local function KillFarm()
                local TargetPlayer = CurrentTarget
                if not TargetPlayer then return end

                local LocalCharacter = ABLModule.PickClass("Sans")
                local LocalPlayer = Players.LocalPlayer
                local Finish = BaseModule.CreateHolder()
                local EventManager
                EventManager = Tools.Events.ConnectEvent(RunService.Heartbeat, function()
                    local TargetPlayer = CurrentTarget
                    if not TargetPlayer then return end
                    local LocalRoot = Tools.Players.GetRoot(LocalCharacter)
                    local TargetRoot = Tools.Players.GetRoot(TargetPlayer)
                    LocalRoot.CFrame = TargetRoot.CFrame * CFrame.new(0, 0, -5)
                    local Tags = ABLModule.Tags(Players.LocalPlayer)
                    if not Tags then return end

                    local Max = {
                        Players = {},
                        Tag = -math.huge,
                    }

                    for Player, Tag in pairs(Tags) do
                        if Tag > Max.Tag then
                            Max.Tag = Tag
                            Max.Players = { Player }
                        elseif Tag == Max.Tag then
                            table.insert(Max.Players, Player)
                        end
                    end

                    if Max.Tag >= 5 then
                        if #Max.Players == 1 and Max.Players[1] == TargetPlayer then
                            return Finish.Fire(true)
                        else
                            return Finish.Fire(false)
                        end
                    end
                    if not Running then return Finish.Fire(false) end
                end)
                Manager.AddCleanup(function()
                    EventManager.Disconnect()
                end)
                local DeathType = Finish.Wait()
                EventManager.Disconnect()
                if DeathType then
                    ABLModule.ResetDeath()
                else
                    ABLModule.ResetForce()
                end
            end

            KillFarmScreen.Button.Loop({
                ButtonText = "Start",
                OnBeforeStart = GetSnapshot,
                OnStart = function()
                    Running = true
                end,
                OnAction = KillFarm,
                OnEnd = function()
                    Running = false
                end,
                OnAfterEnd = SetSnapshot,
            })

            MainScreen.addScreen(KillFarmScreen)
        end)

        task.spawn(function()
            -- =======================================================
            -- ========================= FarmSwitch
            -- =======================================================
            local FarmSwitchScreen = UI.CreateScreen({
                TabName = "FarmSwitch",
                LayoutOrder = 11,
            })

            local SelectedTargets: { Player } = {}
            local Running = false

            FarmSwitchScreen.PlayerSelectableList.MultiSelect({
                OnChange = function(players)
                    SelectedTargets = players
                end,
            })

            local function FarmSwitch()
                local LocalPlayer = Players.LocalPlayer
                local Kills = LocalPlayer:FindFirstChild("Kills") :: Folder

                local ClassKillList: {{Class: ABLModule.ClassType, Kill: number}} = {
                    {Class="Sans", Kill=1500},
                    {Class="Asgore", Kill=1000},
                    {Class="GTFrisk", Kill=1000},
                    {Class="GTGaster", Kill=1000},
                    {Class="XTFrisk", Kill=200},
                    {Class="XTCross", Kill=1000},
                    {Class="SSChara", Kill=200},
                }

                local SelectedClass: ABLModule.ClassType
                local SelectedClassKill: IntValue
                local SelectedClassTargetKill: number

                for _, Data in ipairs(ClassKillList) do
                    local ClassKillValue = Kills:FindFirstChild(Data.Class) :: IntValue
                    if Data.Kill > ClassKillValue.Value then
                        SelectedClass, SelectedClassKill, SelectedClassTargetKill = Data.Class, ClassKillValue, Data.Kill
                        break
                    end
                end

                if not SelectedClass then
                    return task.wait(1)
                end
                local ClassSkillMap = {
                    Sans=function(Position: Vector3)
                        ABLModule.Skill("Blasters", "Blast2", Position)
                    end,
                    Asgore=function(Position: Vector3)
                        ABLModule.Skill("Fire", "FireGroup", Position)
                        ABLModule.Skill("Tridents", "SpearHits")
                    end,
                    GTFrisk=function(Position: Vector3)
                        local Phase = ABLModule.Stat(Players.LocalPlayer, "Phase")
                        if not Phase then return end
                        if Phase.Value == 1 then
                            return ABLModule.ResetDeath()
                        end
                        ABLModule.Skill("Determination", "SlashSpam")
                    end,
                    GTGaster=function(Position: Vector3)
                        ABLModule.Skill("Determination", "BigBlast")
                    end,
                    XTFrisk=function(Position: Vector3)
                        ABLModule.Skill("Normal", "KnifeRun")
                    end,
                    XTCross=function(Position: Vector3)
                        local Phase = ABLModule.Stat(Players.LocalPlayer, "Phase")
                        if not Phase then return end
                        if Phase.Value == 1 then
                            return ABLModule.ResetDeath()
                        end
                        ABLModule.Skill("Overwrite", "Corruption", Position)
                        ABLModule.Skill("Normal", "RapidHits")
                    end,
                    SSChara=function(Position: Vector3)
                        ABLModule.Skill("Knives", "Mirror", Position)
                    end,
                }
                ABLModule.PickClass(SelectedClass)
                local LocalRoot = LocalPlayer.Character:WaitForChild("HumanoidRootPart", 0.5)
                local ClassSkill = ClassSkillMap[SelectedClass]

                local function FindPosition(Name: string): Vector3?
                    for _, Data in ipairs(ABLModule.Positions) do
                        if Data.Name == Name then
                            return Data.Position
                        end
                    end
                    return nil
                end

                local ArenaPosition = FindPosition("Arena8")
                LocalRoot.CFrame = CFrame.new(ArenaPosition)

                local Finish = BaseModule.CreateHolder()
                local StoppedCount = 0
                local TotalLoops = 2

                local function CheckFinish()
                    StoppedCount += 1
                    if StoppedCount >= TotalLoops then
                        Finish.Fire()
                    end
                end

                local function ShouldStop(): boolean
                    return SelectedClassKill.Value >= SelectedClassTargetKill or not Running or Closed
                end

                local TeleportEventManager
                TeleportEventManager = Tools.Events.ConnectEvent(RunService.Heartbeat, function()
                    if ShouldStop() then
                        TeleportEventManager.Disconnect()
                        CheckFinish()
                        return
                    end
                end)
                Manager.AddCleanup(function()
                    TeleportEventManager.Disconnect()
                end)

                task.spawn(function()
                    while true do
                        if ShouldStop() then
                            CheckFinish()
                            break
                        end

                        local LocalRoot = Tools.Players.GetRoot(LocalPlayer)
                        if LocalRoot then
                            local ClosestPlayer: Player? = nil
                            local ClosestRoot: BasePart? = nil
                            local ClosestDistance = 10

                            for _, TargetPlayer in ipairs(SelectedTargets) do
                                local TargetRoot = Tools.Players.GetRoot(TargetPlayer)
                                if TargetRoot then
                                    local Distance = (TargetRoot.Position - LocalRoot.Position).Magnitude
                                    if Distance <= ClosestDistance then
                                        ClosestDistance = Distance
                                        ClosestPlayer = TargetPlayer
                                        ClosestRoot = TargetRoot
                                    end
                                end
                            end

                            if ClosestPlayer and ClosestRoot then
                                ClassSkill(ClosestRoot.Position)
                            end
                        end

                        task.wait(0.5)
                    end
                end)

                Finish:Wait()
            end

            FarmSwitchScreen.Button.Loop({
                ButtonText = "Start",
                OnBeforeStart = GetSnapshot,
                OnStart = function()
                    Running = true
                end,
                OnAction = FarmSwitch,
                OnEnd = function()
                    Running = false
                end,
                OnAfterEnd = SetSnapshot,
            })

            MainScreen.addScreen(FarmSwitchScreen)
        end)

        task.spawn(function()
            -- =======================================================
            -- ========================= Telek
            -- =======================================================
            local TelekScreen = UI.CreateScreen({
                TabName = "Telek",
                LayoutOrder = 12,
            })

            local CurrentTarget: Player? = nil
            local Running = false

            TelekScreen.PlayerSelectableList.SingleSelect({
                OnChange = function(player)
                    CurrentTarget = player
                end,
            })

            local function Telek()
                local TargetPlayer = CurrentTarget
                if not TargetPlayer then return end

                local LocalCharacter = ABLModule.PickClass("Sans")
                local LocalPlayer = Players.LocalPlayer
                local Finish = BaseModule.CreateHolder()
                local EventManager
                EventManager = Tools.Events.ConnectEvent(RunService.Heartbeat, function()
                    local TargetPlayer = CurrentTarget
                    if not TargetPlayer then return end
                    local LocalRoot = Tools.Players.GetRoot(LocalCharacter)
                    local TargetCharacter = TargetPlayer.Character
                    local TargetRoot = Tools.Players.GetRoot(TargetPlayer)
                    LocalRoot.CFrame = TargetRoot.CFrame * CFrame.new(0, -5, 0)

                    local TelekCD = ABLModule.Cooldown(LocalPlayer, "Telekinesis", "One")

                    if not TelekCD then
                        ABLModule.Skill("Telekinesis", "One", TargetCharacter, "Space", 1.1)
                    end

                    local Stunned = ABLModule.Stat(LocalPlayer, "Stunned")
                    if TelekCD and Stunned and not Stunned.Value then
                        return Finish.Fire()
                    end

                    if not Running then return Finish.Fire() end
                end)
                Manager.AddCleanup(function()
                    EventManager.Disconnect()
                end)
                Finish.Wait()
                EventManager.Disconnect()
                ABLModule.ResetForce()
            end

            TelekScreen.Button.Loop({
                ButtonText = "Start",
                OnBeforeStart = GetSnapshot,
                OnStart = function()
                    Running = true
                end,
                OnAction = Telek,
                OnEnd = function()
                    Running = false
                end,
                OnAfterEnd = SetSnapshot,
            })

            MainScreen.addScreen(TelekScreen)
        end)

        task.spawn(function()
            -- =======================================================
            -- ========================= GasterShoot
            -- =======================================================
            local GasterShootScreen = UI.CreateScreen({
                TabName = "GasterShoot",
                LayoutOrder = 12,
            })

            local CurrentTarget: Player? = nil
            local Running = false

            GasterShootScreen.PlayerSelectableList.SingleSelect({
                OnChange = function(player)
                    CurrentTarget = player
                end,
            })

            local function GasterShoot()
                local TargetPlayer = CurrentTarget
                if not TargetPlayer then return end

                local LocalCharacter = ABLModule.PickClass("GTGaster")
                local LocalPlayer = Players.LocalPlayer
                local Finish = BaseModule.CreateHolder()
                local EventManager
                EventManager = Tools.Events.ConnectEvent(RunService.Heartbeat, function()
                    local TargetPlayer = CurrentTarget
                    if not TargetPlayer then return end
                    local LocalRoot = Tools.Players.GetRoot(LocalCharacter)
                    local TargetRoot = Tools.Players.GetRoot(TargetPlayer)
                    LocalRoot.CFrame = TargetRoot.CFrame * CFrame.new(0, 0, 15)
                    
                    local BigBlastCD = ABLModule.Cooldown(LocalPlayer, "Determination", "BigBlast")

                    if not BigBlastCD then
                        ABLModule.Skill("Determination", "BigBlast")
                    end

                    local Stunned = ABLModule.Stat(LocalPlayer, "Stunned")
                    if BigBlastCD and Stunned and not Stunned.Value then
                        return Finish.Fire()
                    end

                    if not Running then return Finish.Fire() end
                end)
                Manager.AddCleanup(function()
                    EventManager.Disconnect()
                end)
                Finish.Wait()
                EventManager.Disconnect()
                ABLModule.ResetForce()
            end

            GasterShootScreen.Button.Loop({
                ButtonText = "Start",
                OnBeforeStart = GetSnapshot,
                OnStart = function()
                    Running = true
                end,
                OnAction = GasterShoot,
                OnEnd = function()
                    Running = false
                end,
                OnAfterEnd = SetSnapshot,
            })

            MainScreen.addScreen(GasterShootScreen)
        end)

        task.spawn(function()
            -- =======================================================
            -- ========================= Cmdr
            -- =======================================================

            local CmdrScreen = UI.CreateScreen({
                TabName = "Cmdr",
                LayoutOrder = 20,
                Active = (Permission == "HOST"),
            })

            local BOTTOM_ORDER_BASE = 1_000_000

            type CmdrArgType = "players" | "player" | "number" | "boolean" | "vector3" | "player @ vector3"

            type CmdrArgDef = {
                Type: CmdrArgType,
                Name: string,
                Description: string?,
                Optional: boolean?,
                Default: any,
                -- If true, this boolean arg is never shown as a widget and
                -- never taken from user input. Instead, RunCommand fires the
                -- whole command twice for this command: once with the flag
                -- on, once with it omitted entirely. This matches how
                -- mana/stamina/Health actually need to be set (limit/max
                -- first, then current) — a single call isn't enough on its
                -- own.
                DualCall: boolean?,
            }

            type CmdrCommandDef = {
                Name: string,
                Description: string?,
                Aliases: { string }?,
                Args: { CmdrArgDef },
            }

            local Commands: { CmdrCommandDef } = {
                {
                    Name = "attack",
                    Description = "Change a players attack",
                    Aliases = { "att" },
                    Args = {
                        { Type = "players", Name = "Players", Description = "The players to change" },
                        { Type = "number", Name = "Attack", Description = "Attack to set to" },
                    },
                },
                {
                    Name = "defense",
                    Description = "Change a players defense",
                    Aliases = { "def" },
                    Args = {
                        { Type = "players", Name = "Players", Description = "The players to change" },
                        { Type = "number", Name = "Defense", Description = "Defense to set to" },
                    },
                },
                {
                    Name = "dodge",
                    Description = "Toggle a player's ability to dodge",
                    Aliases = { "dodge" },
                    Args = {
                        { Type = "players", Name = "Players", Description = "The players to change" },
                    },
                },
                {
                    Name = "Health",
                    Description = "Change a players health",
                    Aliases = { "h" },
                    Args = {
                        { Type = "players", Name = "Players", Description = "The players to change" },
                        { Type = "number", Name = "Health", Description = "Health to set to" },
                        { Type = "boolean", Name = "Set Max", Description = "Make this the max health", Optional = true, Default = false, DualCall = true },
                    },
                },
                {
                    Name = "knockback",
                    Description = "Knockback a player",
                    Aliases = { "kb" },
                    Args = {
                        { Type = "players", Name = "Players", Description = "The players to change" },
                        { Type = "vector3", Name = "Direction", Description = "Direction to fly" },
                        { Type = "number", Name = "Time", Description = "Time in the sky", Optional = true, Default = 0.5 },
                    },
                },
                {
                    Name = "mana",
                    Description = "Change a players mana",
                    Aliases = { "m" },
                    Args = {
                        { Type = "players", Name = "Players", Description = "The players to change" },
                        { Type = "number", Name = "Mana", Description = "Mana to set to" },
                        { Type = "boolean", Name = "Set Limit", Description = "Mana to set to", Optional = true, Default = false, DualCall = true },
                    },
                },
                {
                    Name = "resetcooldown",
                    Description = "Deletes cooldowns for each player",
                    Aliases = { "resetcd", "rcd" },
                    Args = {
                        { Type = "players", Name = "Players", Description = "The players to change" },
                    },
                },
                {
                    Name = "stamina",
                    Description = "Change a players stamina",
                    Aliases = { "st" },
                    Args = {
                        { Type = "players", Name = "Players", Description = "The players to change" },
                        { Type = "number", Name = "Stamina", Description = "Stamina to set to" },
                        { Type = "boolean", Name = "Set Limit", Description = "Mana to set to", Optional = true, Default = false, DualCall = true },
                    },
                },
                {
                    Name = "stand",
                    Description = "stand there lol",
                    Aliases = { "stand" },
                    Args = {
                        { Type = "player", Name = "raiden", Description = "The players to target" },
                        { Type = "player", Name = "armstrong", Description = "The players to target", Optional = true },
                    },
                },
                {
                    Name = "teleport",
                    Description = "Teleports a player or set of players to one target.",
                    Aliases = { "tp" },
                    Args = {
                        { Type = "players", Name = "From", Description = "The players to teleport" },
                        { Type = "player @ vector3", Name = "Destination", Description = "The player or location to teleport to" },
                    },
                },
                {
                    Name = "timemulti",
                    Description = "Change a players timemulti vlaue",
                    Aliases = { "time" },
                    Args = {
                        { Type = "players", Name = "Players", Description = "The players to change" },
                        { Type = "number", Name = "timemulti", Description = "timemulti to set to" },
                    },
                },
                {
                    Name = "NoCooldown",
                    Description = "To remove cooldowns for each player",
                    Aliases = { "NoCD" },
                    Args = {
                        { Type = "players", Name = "Players", Description = "The players to change" },
                        { Type = "boolean", Name = "Give / Take", Description = "Whether to give or take cooldowns" },
                    },
                },
                {
                    Name = "ult",
                    Description = "To",
                    Aliases = { "ut" },
                    Args = {
                        { Type = "players", Name = "Players", Description = "The players to change" },
                    },
                },
            }

            -- =======================================================
            -- State
            -- =======================================================

            local SelectedCommand: CmdrCommandDef? = nil
            local ArgSection: { Destroy: () -> () }? = nil
            local ArgCleanup: { () -> () } = {}
            -- Keyed by positional index, since the Cmdr command string is
            -- order-dependent — an array (not a map) mirrors that.
            local ArgValues: { any } = {}

            -- Cross-lock so the same player can't be picked in two
            -- players/player args of the same command at once (e.g.
            -- teleport's "From" list vs a hypothetical second player arg).
            -- Same pattern as SyncLockAcrossSlots in BossFight.
            local PlayerAssignment: { [Player]: number } = {}
            local PlayerListHandles: { [number]: UIModule.DSLPlayerListHandle } = {}

            local function SyncPlayerLockAcrossArgs(TargetPlayer: Player, ExceptIndex: number?, Locked: boolean)
                for Index, Handle in pairs(PlayerListHandles) do
                    if Index ~= ExceptIndex then
                        Handle.SetItemLocked(TargetPlayer.UserId, Locked)
                    end
                end
            end

            local function ClearArgWidgets()
                for _, Cleanup in ipairs(ArgCleanup) do
                    Cleanup()
                end
                table.clear(ArgCleanup)
                table.clear(ArgValues)
                table.clear(PlayerAssignment)
                table.clear(PlayerListHandles)
                if ArgSection then
                    ArgSection.Destroy()
                    ArgSection = nil
                end
            end

            -- =======================================================
            -- Arg widget: # <ArgName> (<Type>) [Optional]
            -- <ArgDescription>
            -- [widget]
            -- =======================================================

            -- Builds the widget for one Arg and wires it up so it keeps
            -- ArgValues[Index] up to date as the user interacts with it.
            -- DualCall args never get a widget — RunCommand handles them.
            local function BuildArgWidget(Index: number, Arg: CmdrArgDef)
                if Arg.DualCall then return end

                local Suffix = if Arg.Optional then " (Optional)" else ""
                local ArgHeader = CmdrScreen.SectionText({ Text = ("%s%s"):format(Arg.Name, Suffix) })
                table.insert(ArgCleanup, ArgHeader.Destroy)

                if Arg.Type == "players" then
                    local List = CmdrScreen.PlayerSelectableList.MultiSelect({
                        ExcludeLocalPlayer = false,
                        IsPlayerLocked = function(player: Player)
                            return PlayerAssignment[player] ~= nil and PlayerAssignment[player] ~= Index
                        end,
                        OnChange = function(players: { Player })
                            local NewSet: { [Player]: boolean } = {}
                            for _, Player in ipairs(players) do NewSet[Player] = true end
                            for Player, AssignedIndex in pairs(PlayerAssignment) do
                                if AssignedIndex == Index and not NewSet[Player] then
                                    PlayerAssignment[Player] = nil
                                    SyncPlayerLockAcrossArgs(Player, Index, false)
                                end
                            end
                            for _, Player in ipairs(players) do
                                if PlayerAssignment[Player] ~= Index then
                                    PlayerAssignment[Player] = Index
                                    SyncPlayerLockAcrossArgs(Player, Index, true)
                                end
                            end

                            local Names = {}
                            for _, Player in ipairs(players) do
                                table.insert(Names, Player.Name)
                            end
                            ArgValues[Index] = #Names > 0 and table.concat(Names, ",") or nil
                        end,
                    })
                    PlayerListHandles[Index] = List
                    table.insert(ArgCleanup, List.Destroy)

                elseif Arg.Type == "player" then
                    local List = CmdrScreen.PlayerSelectableList.SingleSelect({
                        ExcludeLocalPlayer = false,
                        IsPlayerLocked = function(player: Player)
                            return PlayerAssignment[player] ~= nil and PlayerAssignment[player] ~= Index
                        end,
                        OnChange = function(player: Player?)
                            for Player, AssignedIndex in pairs(PlayerAssignment) do
                                if AssignedIndex == Index and Player ~= player then
                                    PlayerAssignment[Player] = nil
                                    SyncPlayerLockAcrossArgs(Player, Index, false)
                                end
                            end
                            if player and PlayerAssignment[player] ~= Index then
                                PlayerAssignment[player] = Index
                                SyncPlayerLockAcrossArgs(player, Index, true)
                            end
                            ArgValues[Index] = player and player.Name or nil
                        end,
                    })
                    PlayerListHandles[Index] = List
                    table.insert(ArgCleanup, List.Destroy)

                elseif Arg.Type == "number" then
                    if Arg.Default ~= nil then
                        ArgValues[Index] = tostring(Arg.Default)
                    end
                    local Input = CmdrScreen.NumberInput({
                        Label = Arg.Description,
                        Placeholder = "0",
                        Default = Arg.Default,
                        OnChanged = function(value: number)
                            ArgValues[Index] = tostring(value)
                        end,
                    })
                    table.insert(ArgCleanup, Input.Destroy)

                elseif Arg.Type == "boolean" then
                    local Default = Arg.Default == true
                    ArgValues[Index] = tostring(Default)
                    local Checkbox = CmdrScreen.Button.Checkbox({
                        ButtonText = Arg.Description or Arg.Name,
                        OnAction = function(value: boolean)
                            ArgValues[Index] = tostring(value)
                        end,
                    })
                    table.insert(ArgCleanup, Checkbox.Destroy)

                elseif Arg.Type == "vector3" then
                    local Vec = { X = 0, Y = 0, Z = 0 }
                    local function UpdateVec()
                        ArgValues[Index] = ("%s,%s,%s"):format(Vec.X, Vec.Y, Vec.Z)
                    end
                    UpdateVec()

                    local InputX = CmdrScreen.NumberInput({
                        Label = "X", Default = 0,
                        OnChanged = function(v: number) Vec.X = v; UpdateVec() end,
                    })
                    local InputY = CmdrScreen.NumberInput({
                        Label = "Y", Default = 0,
                        OnChanged = function(v: number) Vec.Y = v; UpdateVec() end,
                    })
                    local InputZ = CmdrScreen.NumberInput({
                        Label = "Z", Default = 0,
                        OnChanged = function(v: number) Vec.Z = v; UpdateVec() end,
                    })
                    table.insert(ArgCleanup, InputX.Destroy)
                    table.insert(ArgCleanup, InputY.Destroy)
                    table.insert(ArgCleanup, InputZ.Destroy)

                elseif Arg.Type == "player @ vector3" then
                    local Vec = { X = 0, Y = 0, Z = 0 }
                    local SelectedPlayerName: string? = nil
                    local function UpdateValue()
                        ArgValues[Index] = SelectedPlayerName or ("%s,%s,%s"):format(Vec.X, Vec.Y, Vec.Z)
                    end
                    UpdateValue()

                    -- Player pick takes priority over the X/Y/Z fields when set.
                    local List = CmdrScreen.PlayerSelectableList.SingleSelect({
                        ExcludeLocalPlayer = false,
                        IsPlayerLocked = function(player: Player)
                            return PlayerAssignment[player] ~= nil and PlayerAssignment[player] ~= Index
                        end,
                        OnChange = function(player: Player?)
                            for Player, AssignedIndex in pairs(PlayerAssignment) do
                                if AssignedIndex == Index and Player ~= player then
                                    PlayerAssignment[Player] = nil
                                    SyncPlayerLockAcrossArgs(Player, Index, false)
                                end
                            end
                            if player and PlayerAssignment[player] ~= Index then
                                PlayerAssignment[player] = Index
                                SyncPlayerLockAcrossArgs(player, Index, true)
                            end
                            SelectedPlayerName = player and player.Name or nil
                            UpdateValue()
                        end,
                    })
                    PlayerListHandles[Index] = List

                    local InputX = CmdrScreen.NumberInput({
                        Label = "X (used if no player selected)", Default = 0,
                        OnChanged = function(v: number) Vec.X = v; UpdateValue() end,
                    })
                    local InputY = CmdrScreen.NumberInput({
                        Label = "Y", Default = 0,
                        OnChanged = function(v: number) Vec.Y = v; UpdateValue() end,
                    })
                    local InputZ = CmdrScreen.NumberInput({
                        Label = "Z", Default = 0,
                        OnChanged = function(v: number) Vec.Z = v; UpdateValue() end,
                    })
                    table.insert(ArgCleanup, List.Destroy)
                    table.insert(ArgCleanup, InputX.Destroy)
                    table.insert(ArgCleanup, InputY.Destroy)
                    table.insert(ArgCleanup, InputZ.Destroy)
                end
            end

            local function SelectCommand(Command: CmdrCommandDef?)
                ClearArgWidgets()
                SelectedCommand = Command
                if not Command then return end

                ArgSection = CmdrScreen.SectionText({ Text = Command.Name })

                for Index, Arg in ipairs(Command.Args) do
                    BuildArgWidget(Index, Arg)
                end
            end

            CmdrScreen.SectionText({ Text = "Command" })
            CmdrScreen.SelectableList.SingleSelect({
                Items = (function()
                    local Items = {}
                    for _, Command in ipairs(Commands) do
                        table.insert(Items, {
                            Key = Command.Name,
                            Title = Command.Name .. (Command.Aliases and (" (" .. table.concat(Command.Aliases, ", ") .. ")") or ""),
                            SubTitle = Command.Description,
                            Data = Command,
                        })
                    end
                    return Items
                end)(),
                OnChange = function(target)
                    local ItemData = target.Current
                    SelectCommand(ItemData and (ItemData.Data :: CmdrCommandDef) or nil)
                end,
            })

            -- Builds the argument string list, skipping any DualCall arg
            -- (RunCommand handles that one separately). Returns nil and
            -- shows an error Toast if a required arg is missing.
            local function BuildParts(Command: CmdrCommandDef): { string }?
                local Parts = {}
                for Index, Arg in ipairs(Command.Args) do
                    if Arg.DualCall then continue end

                    local Value = ArgValues[Index]
                    if Value == nil then
                        if Arg.Optional then
                            Value = Arg.Default ~= nil and tostring(Arg.Default) or nil
                        else
                            Toast({
                                Type = "Error",
                                Message = ("Fill in '%s'."):format(Arg.Name),
                            })
                            return nil
                        end
                    end
                    if Value ~= nil then
                        table.insert(Parts, Value)
                    end
                end
                return Parts
            end

            local function RunCommand()
                if not SelectedCommand then
                    return Toast({
                        Type = "Error",
                        Message = "Select a command first.",
                    })
                end

                local Parts = BuildParts(SelectedCommand)
                if not Parts then return end

                local Base = SelectedCommand.Name
                if #Parts > 0 then
                    Base = ("%s %s"):format(SelectedCommand.Name, table.concat(Parts, " "))
                end

                local DualCall = false
                for _, Arg in ipairs(SelectedCommand.Args) do
                    if Arg.DualCall then
                        DualCall = true
                        break
                    end
                end

                if DualCall then
                    -- First set the limit/max, then the current value.
                    -- e.g. "mana Player1 30 true" then "mana Player1 30"
                    ABLModule.CmdrCommand(Base .. " true")
                    local Result = ABLModule.CmdrCommand(Base)
                    Toast({
                        Type = "Success",
                        Message = Result or ("Executed: " .. Base .. " (true, then false)"),
                    })
                else
                    local Result = ABLModule.CmdrCommand(Base)
                    Toast({
                        Type = "Success",
                        Message = Result or ("Executed: " .. Base),
                    })
                end
            end

            CmdrScreen.Button.Instant({
                ButtonText = "Run Command",
                LayoutOrder = BOTTOM_ORDER_BASE + 1,
                OnAction = RunCommand,
            })

            MainScreen.addScreen(CmdrScreen)

        end)

        task.spawn(function()
            -- =======================================================
            -- ========================= PrivateDeath
            -- =======================================================

            local PrivateDeathScreen = UI.CreateScreen({
                TabName = "PrivateDeath",
                LayoutOrder = 21,
                Active=(Permission == "HOST")
            })

            local SelectedTargets: { Player } = {}

            PrivateDeathScreen.PlayerSelectableList.MultiSelect({
                OnChange = function(players)
                    SelectedTargets = players
                end,
            })

            local PrivateClasses = {}
            for _, Class in ipairs(ABLModule.PrivateClasses) do
                table.insert(PrivateClasses, Class.Name)
            end

            local function PrivateDeath()
                for _, TargetPlayer in ipairs(SelectedTargets) do
                    local TargetClass = ABLModule.GetClass(TargetPlayer)
                    if table.find(PrivateClasses, TargetClass) then
                        ABLModule.CmdrCommand(("kill %s"):format(TargetPlayer.Name))
                    end
                end
            end

            PrivateDeathScreen.Button.Loop({
                ButtonText = "Start",
                OnAction = PrivateDeath,
            })

            MainScreen.addScreen(PrivateDeathScreen)
        end)

        task.spawn(function()
            -- =======================================================
            -- ========================= ChallengeDeath
            -- =======================================================

            local ChallengeDeathScreen = UI.CreateScreen({
                TabName = "ChallengeDeath",
                LayoutOrder = 22,
                Active=(Permission == "HOST")
            })

            local SelectedTargets: { Player } = {}

            ChallengeDeathScreen.PlayerSelectableList.MultiSelect({
                OnChange = function(players)
                    SelectedTargets = players
                end,
            })

            local function PrivateDeath()
                for _, TargetPlayer in ipairs(SelectedTargets) do
                    local Stat = ABLModule.Stat(TargetPlayer, "Partner")
                    if not Stat then continue end
                    if Stat.Value then
                        ABLModule.CmdrCommand(("kill %s"):format(TargetPlayer.Name))
                    end
                end
            end

            ChallengeDeathScreen.Button.Loop({
                ButtonText = "Start",
                OnAction = PrivateDeath,
            })

            MainScreen.addScreen(ChallengeDeathScreen)
        end)

        task.spawn(function()
            -- =======================================================
            -- ========================= BossFight
            -- =======================================================
            local BossFightModule = G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df:ScriptGet("db21792d17c11489aab14f29f966cd06", "08ced6cdfbf50a84183be1af4b4c8dc5")
            if not BossFightModule then return end
            local BossFightScreen = UI.CreateScreen({
                TabName = "BossFight",
                LayoutOrder = 23,
                Active = (Permission == "HOST"),
            })

            local BOTTOM_ORDER_BASE = 1_000_000
            
            local Boss: Player? = nil
            local PlayerAssignment: { [Player]: string } = {}
            local SlotHandles: { [string]: UIModule.DSLPlayerListHandle } = {}
            local Participants: { [string]: { Player } } = {}
            local ActiveSlotName: string? = nil
            local ActiveCheckboxes: { [string]: UIModule.DSLCheckboxHandle } = {}
            type TeamSlot = {
                SlotName: string,
                Section: { Destroy: () -> () },
                List: UIModule.DSLPlayerListHandle,
                ActiveCheckbox: UIModule.DSLCheckboxHandle,
                DeleteButtonRow: Frame?,
            }
            local TeamSlots: { [string]: TeamSlot } = {}
            local TeamOrder: { string } = {}
            local function SyncLockAcrossSlots(Player: Player, ExceptSlot: string?, Locked: boolean)
                for SlotName, Handle in pairs(SlotHandles) do
                    if SlotName ~= ExceptSlot then
                        Handle.SetItemLocked(Player.UserId, Locked)
                    end
                end
            end
            local function HandleSlotChange(SlotName: string, NewSelected: { Player })
                local NewSet: { [Player]: boolean } = {}
                for _, p in ipairs(NewSelected) do NewSet[p] = true end
                for Player, Slot in pairs(PlayerAssignment) do
                    if Slot == SlotName and not NewSet[Player] then
                        PlayerAssignment[Player] = nil
                        SyncLockAcrossSlots(Player, SlotName, false)
                    end
                end
                for _, Player in ipairs(NewSelected) do
                    if PlayerAssignment[Player] ~= SlotName then
                        PlayerAssignment[Player] = SlotName
                        SyncLockAcrossSlots(Player, SlotName, true)
                    end
                end
                if SlotName == "Boss" then
                    Boss = NewSelected[1]
                else
                    Participants[SlotName] = NewSelected
                end
            end
            BossFightScreen.SectionText({ Text = "Boss" })
            SlotHandles["Boss"] = BossFightScreen.PlayerSelectableList.SingleSelect({
                ExcludeLocalPlayer = false,
                IsPlayerLocked = function(player)
                    return PlayerAssignment[player] ~= nil and PlayerAssignment[player] ~= "Boss"
                end,
                OnChange = function(player: Player?)
                    HandleSlotChange("Boss", player and { player } or {})
                end,
            })
            local TeamCounter = 0
            local function RemoveTeamSlot(SlotName: string)
                local Slot = TeamSlots[SlotName]
                if not Slot then return end
                for Player, AssignedSlot in pairs(PlayerAssignment) do
                    if AssignedSlot == SlotName then
                        PlayerAssignment[Player] = nil
                        SyncLockAcrossSlots(Player, nil, false)
                    end
                end
                Slot.List.Destroy()
                Slot.Section.Destroy()
                Slot.ActiveCheckbox.Destroy()
                SlotHandles[SlotName] = nil
                Participants[SlotName] = nil
                if ActiveSlotName == SlotName then
                    ActiveSlotName = nil
                end
                ActiveCheckboxes[SlotName] = nil
                TeamSlots[SlotName] = nil
            end
            local function RemoveLastTeamSlot()
                TeamCounter -= 1
                local LastSlotName = TeamOrder[#TeamOrder]
                if not LastSlotName then return end
                RemoveTeamSlot(LastSlotName)
                table.remove(TeamOrder, #TeamOrder)
            end
            local function AddTeamSlot()
                TeamCounter += 1
                local SlotName = "Team" .. TeamCounter
                local Section = BossFightScreen.SectionText({ Text = SlotName })
                local List = BossFightScreen.PlayerSelectableList.MultiSelect({
                    ExcludeLocalPlayer = false,
                    IsPlayerLocked = function(player)
                        return PlayerAssignment[player] ~= nil and PlayerAssignment[player] ~= SlotName
                    end,
                    OnChange = function(players: { Player })
                        HandleSlotChange(SlotName, players)
                    end,
                })
                SlotHandles[SlotName] = List
                Participants[SlotName] = {}
                local ActiveCheckbox = BossFightScreen.Button.Checkbox({
                    ButtonText = SlotName .. " Active",
                    OnAction = function(value: boolean)
                        if value then
                            if ActiveSlotName and ActiveSlotName ~= SlotName then
                                local PrevHandle = ActiveCheckboxes[ActiveSlotName]
                                if PrevHandle then
                                    PrevHandle.SetChecked(false, true)
                                end
                            end
                            ActiveSlotName = SlotName
                        elseif ActiveSlotName == SlotName then
                            ActiveSlotName = nil
                        end
                    end,
                })
                ActiveCheckboxes[SlotName] = ActiveCheckbox
                TeamSlots[SlotName] = {
                    SlotName = SlotName,
                    Section = Section,
                    List = List,
                    ActiveCheckbox = ActiveCheckbox,
                }
                table.insert(TeamOrder, SlotName)
            end
            AddTeamSlot()
            BossFightScreen.Button.Instant({
                ButtonText = "+ Add Team",
                LayoutOrder = BOTTOM_ORDER_BASE + 1,
                OnAction = AddTeamSlot,
            })
            BossFightScreen.Button.Instant({
                ButtonText = "- Delete Team",
                LayoutOrder = BOTTOM_ORDER_BASE + 2,
                OnAction = RemoveLastTeamSlot,
            })

            local function StatPlayer()
                BossFightModule.Stat(Boss, Participants)
            end
            local function TeleportPlayers()
                if not ActiveSlotName then return Toast({
                    Type = "Error",
                    Message = "No team is active."
                }) end
                if not Boss then return Toast({
                    Type = "Error",
                    Message = "No boss is selected."
                }) end
                local ActiveTeam = Participants[ActiveSlotName]

                local Spawn = ABLModule.GetPosition("Spawn")
                local Arena = ABLModule.GetPosition("Arena8")

                local LocalPlayer = Players.LocalPlayer
                local LocalRoot = Tools.Players.GetRoot(LocalPlayer)
                if not LocalRoot then return end

                local LocalPosition = LocalRoot.CFrame

                local function TeleportBoss()
                    local TargetPosition = CFrame.new(Arena)
                    Tools.Players.Teleport(TargetPosition)
                    if Boss == Players.LocalPlayer then
                        LocalPosition = TargetPosition
                    else
                        ABLModule.CmdrCommand(("tp %s %s"):format(Boss.Name, Players.LocalPlayer.Name))
                    end
                end

                local function TeleportActive()
                    local TargetPosition = CFrame.new(Arena)
                    Tools.Players.Teleport(TargetPosition)
                    if Boss == Players.LocalPlayer then
                        LocalPosition = TargetPosition
                    end
                    local MovePlayers = {}
                    for _, Player in ipairs(ActiveTeam) do
                        if Player == Players.LocalPlayer then LocalPosition = CFrame.new(Arena) continue end
                        table.insert(MovePlayers, Player.Name)
                    end
                    ABLModule.CmdrCommand(("tp %s %s"):format(table.concat(MovePlayers, ','), Players.LocalPlayer.Name))
                end

                local function TeleportOthers()
                    local TargetPosition = CFrame.new(Spawn)
                    Tools.Players.Teleport(TargetPosition)
                    if Boss == Players.LocalPlayer then
                        LocalPosition = TargetPosition
                    end
                    local MovePlayers = {}
                    for TeamName, TeamPlayers in pairs(Participants) do
                        if TeamName == ActiveSlotName then LocalPosition = CFrame.new(Spawn) continue end
                        for _, Player in ipairs(TeamPlayers) do
                            if Player == Players.LocalPlayer then continue end
                            table.insert(MovePlayers, Player.Name)
                            
                        end
                    end
                    ABLModule.CmdrCommand(("tp %s %s"):format(table.concat(MovePlayers, ','), Players.LocalPlayer.Name))
                end

                
                task.wait(BaseModule.GetPingAwait() * 2)
                WaitWithLoop(BaseModule.GetPingAwait() * 5, TeleportBoss)
                task.wait(BaseModule.GetPingAwait() * 2)
                WaitWithLoop(BaseModule.GetPingAwait() * 5, TeleportActive)
                task.wait(BaseModule.GetPingAwait() * 2)
                WaitWithLoop(BaseModule.GetPingAwait() * 5, TeleportOthers)
                task.wait(BaseModule.GetPingAwait() * 2)
                LocalRoot.CFrame = LocalPosition
            end

            local FightEvent

            local function Fight()
                if not ActiveSlotName then return Toast({
                    Type = "Error",
                    Message = "No team is active."
                }) end
                if not Boss then return Toast({
                    Type = "Error",
                    Message = "No boss is selected."
                }) end
                local ActiveTeam = Participants[ActiveSlotName]

                local BossFightStud = 500
                local BossFightOverflows = {}

                FightEvent = Tools.Events.ConnectEvent(RunService.Heartbeat, function()
                    local BossRoot = Tools.Players.GetRoot(Boss)
                    if not BossRoot then return end
                    for _, Player in ipairs(ActiveTeam) do
                        local Stunned = ABLModule.Stat(Player, "Stunned")
                        if not Stunned then continue end
                        if not Stunned.Value then
                            local Root = Tools.Players.GetRoot(Player)
                            if not Root then continue end
                            local Distance = (BossRoot.Position - Root.Position).Magnitude
                            if Distance > BossFightStud and not BossFightOverflows[Player] then
                                ABLModule.CmdrCommand(("tp %s %s"):format(Player.Name, Boss.Name))
                                BossFightOverflows[Player] = true
                                task.delay(BaseModule.GetPingAwait() * 2, function()
                                    ABLModule.CmdrCommand(("knockback %s 0,0.1,0"):format(Player.Name))
                                end)
                                task.delay(BaseModule.GetPingAwait() * 2 + 1, function()
                                    BossFightOverflows[Player] = false
                                end)
                            end
                        end
                    end
                end)
                Manager.AddCleanup(function()
                    FightEvent.Disconnect()
                end)
            end

            BossFightScreen.Button.Instant({
                ButtonText = "Stat Players",
                LayoutOrder = BOTTOM_ORDER_BASE + 3,
                OnAction = StatPlayer,
            })
            BossFightScreen.Button.Instant({
                ButtonText = "Teleport Players",
                LayoutOrder = BOTTOM_ORDER_BASE + 4,
                OnAction = TeleportPlayers,
            })
            BossFightScreen.Button.Toggle({
                ButtonText = "Fight",
                LayoutOrder = BOTTOM_ORDER_BASE + 5,
                OnStart = function()
                    if FightEvent then 
                        FightEvent.Disconnect()
                        FightEvent = nil
                    end
                    Fight()
                end,
                OnEnd = function()
                    if FightEvent then 
                        FightEvent.Disconnect()
                        FightEvent = nil
                    end
                end,
            })
            MainScreen.addScreen(BossFightScreen)
        end)
    end

    task.spawn(function()
        -- =======================================================
        -- ========================= Cart
        -- =======================================================

        task.spawn(function()
            -- =======================================================
            -- ========================= Explosion
            -- =======================================================

            if game.PlaceId ~= 10660791703 then return end

            local ExplosionScreen = UI.CreateScreen({
                TabName = "Explosion",
                LayoutOrder = 100,
            })

            local SelectedTargets: { Player } = {}

            ExplosionScreen.PlayerSelectableList.MultiSelect({
                OnChange = function(players)
                    SelectedTargets = players
                end,
            })

            local function SpawnCart()
                local Spawners = Workspace.Spawners:GetChildren()
                local AvailableSpawners = {}

                for _, Spawner in ipairs(Spawners) do
                    if not Spawner:FindFirstChild("ForcedCartType") then
                        table.insert(AvailableSpawners, Spawner)
                    end
                end

                if #AvailableSpawners > 0 then
                    local SelectedSpawner = AvailableSpawners[math.random(1, #AvailableSpawners)]
                    local Prompt = SelectedSpawner:FindFirstChild("ProximityPrompt")

                    if Prompt then
                        local Character = Players.LocalPlayer.Character
                        local Root = Character and Character:FindFirstChild("HumanoidRootPart")

                        if Root then
                            Root.CFrame = SelectedSpawner:GetPivot() + Vector3.new(0, 3, 0)

                            local StartTime = os.clock()

                            while os.clock() - StartTime < 1 do
                                pcall(function()
                                    MetaModule.UNC.FireProximityPrompt(Prompt)
                                end)

                                task.wait(0.3)
                            end
                        end
                    end
                end
            end

            local function Explosion()
                local LocalPlayer = Players.LocalPlayer
                local LocalCharacter = LocalPlayer.Character

                local function GetCartBySeat(Seat)
                    local Current = Seat

                    while Current do
                        if Current.ClassName == "Model" then
                            return Current
                        end

                        Current = Current.Parent
                    end

                    return nil
                end

                local function CartPartCallback(Cart, callback)
                    for _, Object in ipairs(Cart:GetDescendants()) do
                        if Object:IsA("BasePart") then
                            callback(Object)
                        end
                    end
                end

                local LocalRoot = Tools.Players.GetRoot(LocalPlayer)
                local LocalHumanoid = LocalCharacter:FindFirstChildOfClass('Humanoid')

                local Position = LocalRoot.CFrame

                local t = 0
                local Finish = BaseModule.CreateHolder()
                local EventManager
                EventManager = Tools.Events.ConnectEvent(RunService.Heartbeat, function(dt)
                    t+=dt
                    if t > 1 then
                        return Finish.Fire()
                    end
                    local LocalSeat = LocalHumanoid.SeatPart
                    local LocalCart = GetCartBySeat(LocalSeat)

                    CartPartCallback(LocalCart, function(Object) Object.CFrame = Position end)

                    for _, TargetPlayer in ipairs(SelectedTargets) do
                        pcall(function()
                            local TargetCharacter = TargetPlayer.Character
                            local TargetHumanoid = TargetCharacter:FindFirstChildOfClass('Humanoid')

                            local TargetSeat = TargetHumanoid.SeatPart
                            local TargetCart = GetCartBySeat(TargetSeat)

                            CartPartCallback(TargetCart, function(Object) Object.CFrame = Position end)

                        end)
                    end
                end)

                Finish.Wait()
                EventManager.Disconnect()
                BaseModule.ResetForce()
            end

            local function SitInEmptyCart(TargetPlayer)
                local Carts = Workspace.Carts
                local Character = TargetPlayer.Character
                local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                local Root = Character:FindFirstChild("HumanoidRootPart")

                if not Humanoid or not Root then
                    return
                end

                local CartList = {}

                for _, Cart in ipairs(Carts:GetChildren()) do
                    if Cart:IsA("Model") and Cart.Name == "Cart" then
                        table.insert(CartList, Cart)
                    end
                end

                table.sort(CartList, function(A, B)
                    local DistanceA = (A:GetPivot().Position - Root.Position).Magnitude
                    local DistanceB = (B:GetPivot().Position - Root.Position).Magnitude

                    return DistanceA < DistanceB
                end)

                for _, Cart in ipairs(CartList) do
                    local Sat = false

                    pcall(function()
                        local VehicleSeat = Cart:FindFirstChild("VehicleSeat")

                        if VehicleSeat and VehicleSeat:IsA("VehicleSeat") then
                            if VehicleSeat.Occupant == nil then
                                VehicleSeat:Sit(Humanoid)
                                Sat = true
                            end
                        end
                    end)

                    if Sat then
                        break
                    end
                end
            end

            ExplosionScreen.Button.Instant({
                ButtonText = "Explode",
                OnAction=function()
                    SpawnCart()
                    task.wait(1)
                    SitInEmptyCart(Players.LocalPlayer)
                    task.wait(0.5)
                    Explosion()
                end
            })

            ExplosionScreen.Button.Loop({
                ButtonText= "Loop Explode",
                OnAction=function()
                    SpawnCart()
                    task.wait(1)
                    SitInEmptyCart(Players.LocalPlayer)
                    task.wait(0.5)
                    Explosion()
                    task.wait(1)
                end
            })

            MainScreen.addScreen(ExplosionScreen)
        end)
    end)
        
end)

-- =======================================================
-- ========================= Anti Afk
-- =======================================================
task.spawn(function()
    if VirtualUser or MetaModule.UNC.Mouse2Click then
        local LocalPlayer = Players.LocalPlayer
        local IdleManager
        IdleManager = Tools.Events.ConnectEvent(LocalPlayer.Idled, function()
            local sv = pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)

            local sm = pcall(function()
                MetaModule.UNC.Mouse2Click()
            end)
            
            if not (sv and sm) then return IdleManager.Disconnect() end
        end)
    end
end)


        ]====], "08ced6cdfbf50a84183be1af4b4c8dc5")
        if not RootFunc then
            error(("[%s] Compile Error: %s"):format("08ced6cdfbf50a84183be1af4b4c8dc5", tostring(RootLoadErr)))
        end
        local RootOk, RootErrOrResult = pcall(RootFunc, G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df)
        if not RootOk then
            G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = nil
            error(RootErrOrResult)
        end
    
            end)

            G15db00bc5ff5042a3176f36793e7f61431b369d8105d9688b1d20e8a2b76df = nil

            if not FinalOk then
                error(FinalErr, 0)
            end
        end, ...)
        print("---------------------------------------- Loaded ----------------------------------------")
        if not GS then error(GD) end
    
end