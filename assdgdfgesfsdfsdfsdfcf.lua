--[[

        INFINITY - V5 - 08/12/2022 - cookiesservices.xyz - .gg/cookiesservices


    If this is spammer reading this, from the bottom of my heart go fuck yourself :)
]]--



--* Optimzation functions *--
if not LPH_OBFUSCATED then
    LPH_JIT_MAX = function(f) return f end
    LPH_NO_VIRTUALIZE = function(f) return f end
end

--* Script Info *--
local script_version_number = "v5"
local last_updated = "07/12/2022"

--* Setup Script *--
repeat task.wait() until game:IsLoaded() -- Wait for game to load


-- Main veriables
local plrs          = game["Players"]
local ws            = game["Workspace"]
local Workspace     = game["Workspace"]
local uis           = game["UserInputService"]
local rs            = game["RunService"]
local hs            = game["HttpService"]
local cgui          = game:GetService("CoreGui")
local lighting      = game["Lighting"]
local GuiService    = game["GuiService"]
local repStorage    = game["ReplicatedStorage"]
local tweenService  = game["TweenService"]

local Terrain       = ws:FindFirstChildOfClass("Terrain")
local plr           = plrs.LocalPlayer
local mouse         = plr:GetMouse()
local Camera        = ws.CurrentCamera
local VFXModule     = require(repStorage.Modules.VFX)
local ReplicatedPlayers = repStorage:FindFirstChild("Players")
local worldToViewportPoint = Camera.worldToViewportPoint

-- Aimbot
local Environment = {}
local updateTick = 0
local UniversalTables = require(repStorage.Modules:WaitForChild("UniversalTables"))

repeat task.wait() until ReplicatedPlayers
local NotificationsLib = loadstring(game:HttpGet("https://cdn.sourceb.in/bins/O24XwMbJyW/0"))()
local library       = loadstring(game:HttpGet("https://raw.githubusercontent.com/CookiesServices/Roblox-Scripts/main/678943q5435"))()
local watermark     = library:Watermark("1NF1N17Y | 60 fps | 60ms | " .. script_version_number .. " | Private")
local ESP, ESP_RenderStepped, Framework = loadstring(game:HttpGet("https://cdn.sourceb.in/bins/WG3ZdBejTn/0"))()

-- Player scanner
local InGameCheaters = {}
local InGameStaff    = {}

-- Removals
local serverLabel

local headSound = Framework:Instance("Sound", {Volume = 10, Parent = cgui})
local bodySound = Framework:Instance("Sound", {Volume = 10, Parent = cgui})
local killSound = Framework:Instance("Sound", {Volume = 10, Parent = cgui})

local mt = getrawmetatable(game)
setreadonly(mt, false)

-- Break solters anti cheat
local badremote = repStorage.Remotes:WaitForChild("\208\149rrrorLog")
badremote:Destroy()


function IsPartVisible(part, partancestor)
    local character = plr.Character or plr.CharacterAdded:Wait()
    local campos = Camera.CFrame.Position

    local vector, onscreen = Camera:WorldToViewportPoint(part.Position)

    if onscreen then
        local rayparams = RaycastParams.new()
        rayparams.FilterType = Enum.RaycastFilterType.Blacklist
        rayparams.FilterDescendantsInstances = {Camera, character}

        local result = workspace:Raycast(campos, part.Position - campos, rayparams)

        if result then
            local hit = result.Instance
            return not hit or hit:IsDescendantOf(partancestor) -- 
        end
    end

    return false
end

local AllGunsTable = {
    Melee = {
        GoldenDV2 = "GoldenDV2",
        DV2 = "DV2",
        AnarchyTomahawk = "AnarchyTomahawk",
        PlasmaNinjato = "PlasmaNinjato",
    },

    Snipers = {
        Mosin = "Mosin",
        SVD = "SVD",
    },
    
    Rilfes = {
        AsVal = "AsVal",
        AKMN = "AKMN",
        M4 = "M4",
        AKM = "AKM",
    },
    
    SMGs = {
        PPSH41 = "PPSH41",
        MP5SD = "MP5SD",
        VZ61 = "VZ61",
    },
    
    Pistols = {
        Makarov = "Makarov",
        TFZ0 = "TFZ0",
        MP443 = "MP443",
        TT33 = "TT33",
    },
    
    Shotguns = {
        IZh81 = "IZh81",
    },
    
    -- Others

    Specials = {
        FlareGun = "FlareGun",
        Lighter = "Lighter",
    },

    Keys = {
        FuelingStationKey = "FuelingStationKey",
        LighthouseKey = "LighthouseKey",
        VillageKey = "VillageKey",
        CraneKey = "CraneKey",
        FactoryGarageKey = "FactoryGarageKey",
    },

    Meds = {
        AA2 = "AA2",
        Rags = "Rags",
        AI2 = "AI2",
        Bandage = "Bandage",
    },

    Grenades = {
        F1 = "F1",
        RGO = "RGO",
        RGD5 = "RGD5",
        M84 = "M84",
    },

    Consuables = {
        ResKola = "ResKola",
        CatfrogSoda = "CatfrogSoda",
        BloxyCola = "BloxyCola",
        Beans = "Beans",
        MaxEnergy = "MaxEnergy",
    },
}

local Sky = lighting:FindFirstChildOfClass("Sky")
if not Sky then
    Sky = Framework:Instance("Sky", {Parent = lighting})
end
local SkyBoxes = {
    ["Standard"] = {
        ["SkyboxBk"] = Sky.SkyboxBk,
        ["SkyboxDn"] = Sky.SkyboxDn,
        ["SkyboxFt"] = Sky.SkyboxFt,
        ["SkyboxLf"] = Sky.SkyboxLf,
        ["SkyboxRt"] = Sky.SkyboxRt,
        ["SkyboxUp"] = Sky.SkyboxUp,
    },
    ["Among Us"] = {
        ["SkyboxBk"] = "rbxassetid://5752463190",
        ["SkyboxDn"] = "rbxassetid://5752463190",
        ["SkyboxFt"] = "rbxassetid://5752463190",
        ["SkyboxLf"] = "rbxassetid://5752463190",
        ["SkyboxRt"] = "rbxassetid://5752463190",
        ["SkyboxUp"] = "rbxassetid://5752463190"
    },
    ["Neptune"] = {
        ["SkyboxBk"] = "rbxassetid://218955819",
        ["SkyboxDn"] = "rbxassetid://218953419",
        ["SkyboxFt"] = "rbxassetid://218954524",
        ["SkyboxLf"] = "rbxassetid://218958493",
        ["SkyboxRt"] = "rbxassetid://218957134",
        ["SkyboxUp"] = "rbxassetid://218950090"
    },
    ["Aesthetic Night"] = {
        ["SkyboxBk"] = "rbxassetid://1045964490",
        ["SkyboxDn"] = "rbxassetid://1045964368",
        ["SkyboxFt"] = "rbxassetid://1045964655",
        ["SkyboxLf"] = "rbxassetid://1045964655",
        ["SkyboxRt"] = "rbxassetid://1045964655",
        ["SkyboxUp"] = "rbxassetid://1045962969"
    },
    ["Redshift"] = {
        ["SkyboxBk"] = "rbxassetid://401664839",
        ["SkyboxDn"] = "rbxassetid://401664862",
        ["SkyboxFt"] = "rbxassetid://401664960",
        ["SkyboxLf"] = "rbxassetid://401664881",
        ["SkyboxRt"] = "rbxassetid://401664901",
        ["SkyboxUp"] = "rbxassetid://401664936"
    },
}

--[Main Variables]

--* Aimbot *--
-- Variables
local RequiredDistance = math.huge
local Typing = false
local Loaded = false
local Running = true
local Animation = nil
local ServiceConnections = {
    ESPPlayerAddedConnection = nil,
    CameraConnection = nil,
    ServerInfo2Connection = nil, 
    LightingConnection = nil, 
    VehiclesUAZAddedConnection = nil, 
    VehiclesUAZRemovedConnection = nil, 
    LockedDoorsAddedConnection = nil, 
    LockedDoorsRemovedConnection = nil, 
    ExitLocationsAddedConnection = nil, 
    ExitLocationsRemovedConnection = nil, 
    DroppedItemsAddedConnection = nil, 
    DroppedItemsRemovedConnection = nil, 
    AiZonesRemovedConnection = nil, 
    AiZonesAddedConnection = nil, 
    VisorConnection = nil, 
    RenderSteppedConnection = nil, 
    InputBeganConnection = nil, 
    InputEndedConnection = nil, 
    TypingStartedConnection = nil, 
    TypingEndedConnection = nil, 
    MouseMoveConnection = nil , 
    ServerLabelConnection = nil
}
local mousemoverel = mousemoverel or (Input and Input.MouseMove)

local MuzzleVelocityValue = 0

local Hit_Found = false
local Hit_Target = nil

-- Script Settings
Environment.Settings = {
    HighlightTarget = nil,
    SaveSettings = false, -- Re-execute upon changing
    ReloadOnTeleport = true,
    Enabled = false,
    TargetLock = false, -- Script will relock to the closet person if locked if false
    SilentAimEnabled = false,
    TimeToTarget = 0,
    SilentAimMisschance = 0,
    AliveCheck = true,
    WallCheck = false, -- Laggy
    Sensitivity = 0, -- Animation length (in seconds) before fully locking onto target
    ThirdPerson = false, -- Uses mousemoverel instead of CFrame to support locking in third person (could be choppy)
    ThirdPersonSensitivity = 3, -- Boundary: 0.1 - 5
    TriggerKey = "MouseButton2",
    SnapLines = false,
    SnapLineColor = "255, 0, 0",
    Prediction = false,
    PredictionMultiplier = 20,
    MaxDistance = 1000,
    AiAimbotEnabled = false,
    WallBang = false,
    WallType = "Wood",
    WallTypes = {"Wood", "WoodPlanks", "Fabric", "CorrodedMetal", "Plastic"},
    Toggle = false,
    LockPart = "Head", -- Body part to lock on
    AILocked = false
}
Environment.FOVSettings = {
    Enabled = false,
    Visible = true,
    Amount = 90,
    Color = "255, 255, 255",
    LockedColor = "255, 0, 0",
    Transparency = 0.5,
    Sides = 60,
    Thickness = 1,
    Filled = false
}
Environment.FOVCircle = Drawing.new("Circle")
Environment.SnapLine  = Drawing.new("Line")
Environment.Locked    = nil

-- Core Functions
local function GetColor(Color)
    local R = tonumber(string.match(Color, "([%d]+)[%s]*,[%s]*[%d]+[%s]*,[%s]*[%d]+"))
    local G = tonumber(string.match(Color, "[%d]+[%s]*,[%s]*([%d]+)[%s]*,[%s]*[%d]+"))
    local B = tonumber(string.match(Color, "[%d]+[%s]*,[%s]*[%d]+[%s]*,[%s]*([%d]+)"))

    return Color3.fromRGB(R, G, B)
end

local function IsDown(EnumItem)
    -- Check if a key being held down is down
    return (EnumItem.EnumType == Enum.KeyCode and uis:IsKeyDown(EnumItem)) or (EnumItem.EnumType == Enum.UserInputType and uis:IsMouseButtonPressed(EnumItem))
end

ServiceConnections.MouseMoveConnection = mouse.Move:Connect(LPH_NO_VIRTUALIZE(function()
    if Environment.Settings.WallBang then
        out = (tostring(mouse.Target.Material)):gsub("Enum.Material.", "")
        Environment.Settings.WallType = out
    end
end))
GetClosestPlayer = LPH_NO_VIRTUALIZE(function()
    Environment.Settings.HighlightTarget = nil
    local ClosestPlayer = nil
    local RequiredDistanceFOV = nil
    local RequiredDistancePlayer = Environment.Settings.MaxDistance
    local WallBangPossible = false
    Environment.Settings.AILocked = false

    if Environment.FOVSettings.Enabled then
        RequiredDistanceFOV = Environment.FOVSettings.Amount
    else
        RequiredDistanceFOV = Camera.ViewportSize.X / 2
    end

    if Environment.Settings.AiAimbotEnabled then
        local AiZones = Workspace:FindFirstChild("AiZones")
        for _, Zone in pairs(AiZones:GetChildren()) do
            for _, Item in pairs(Zone:GetChildren()) do
                if Item:FindFirstChild("HumanoidRootPart") then
                    if Environment.Settings.AliveCheck and Item.Humanoid.Health <= 0 then continue end
                    if Environment.Settings.WallCheck and not IsPartVisible(Item[Environment.Settings.LockPart], Item) then continue end

                    local Vector, OnScreen   = Camera:WorldToViewportPoint(Item.HumanoidRootPart.Position)
                    local DistanceFromMouse  = (Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y) - Vector2.new(Vector.X, Vector.Y)).Magnitude
                    local DistanceFromPlayer = math.floor((plr.Character.HumanoidRootPart.Position - Item.HumanoidRootPart.Position).Magnitude + 0.5)
                    if OnScreen then
                        if DistanceFromMouse <= RequiredDistanceFOV then
                            if DistanceFromPlayer <= RequiredDistancePlayer then
                                RequiredDistancePlayer = DistanceFromPlayer
                                ClosestPlayer = Item
                                Environment.Settings.AILocked = true
                            end
                        end
                    end
                end
            end
        end
    end

    if not Environment.Settings.AILocked then
        for _, v in next, plrs:GetPlayers() do
            if v ~= plr then
                local HumanoidRootPart = v.Character and v.Character:FindFirstChild("HumanoidRootPart")
                if v.Character and HumanoidRootPart then
                    local dwHumanoid = v.Character:FindFirstChild("Humanoid")
                    if Environment.Settings.AliveCheck and dwHumanoid and v.Character.Humanoid.Health <= 0 then continue end
                    if Environment.Settings.WallCheck and not IsPartVisible(v.Character[Environment.Settings.LockPart], v.Character) then continue end

                    local Vector, OnScreen   = Camera:WorldToViewportPoint(v.Character[Environment.Settings.LockPart].Position)
                    local DistanceFromMouse  = (Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y) - Vector2.new(Vector.X, Vector.Y)).Magnitude
                    local DistanceFromPlayer = math.floor((plr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude + 0.5)
                    if OnScreen then
                        if DistanceFromMouse <= RequiredDistanceFOV then
                            if DistanceFromPlayer <= RequiredDistancePlayer then
                                RequiredDistancePlayer = DistanceFromPlayer
                                ClosestPlayer = v
                                Environment.Settings.AILocked = false
                            end
                        end
                    end
                end
            end
        end
    end

    Environment.Settings.HighlightTarget = ClosestPlayer
    Environment.Locked = ClosestPlayer
end)

local ThirdPersonToggled
local BanRemote
local Character = plr.Character
if Character then
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    if Humanoid then
        for _, connection in pairs(getconnections(Humanoid.StateChanged)) do
            local Function = connection.Function
            local Constants = getconstants(Function)
            if table.find(Constants, "FireServer") then
                connection:Disable()
                local Upvalues = getupvalues(Function)
                for i, v in pairs(Upvalues) do
                    if typeof(v) == "Instance" and v:IsA("RemoteEvent") then
                        BanRemote = v
                    end
                end
            end
        end
    end
end
local LocalPlayerName = plr.Name
LPH_NO_VIRTUALIZE(function()
    local emptyFunction = function() end
    __newindex = hookmetamethod(game, "__newindex", function(i, v, n_v)
        --if not Running or checkcaller() or not Loaded then return __newindex(i, v, n_v) end

        if i == Camera and v == "CFrame" then
            LastCameraCFrame = n_v
            if library.flags["thirdpersonEnabled"] and ThirdPersonToggled then
                return __newindex(i, v, n_v + Camera.CFrame.LookVector * - library.flags["thirdpersonValue"])
            end
            if library.flags["nocamerabobEnabled"] then
                local Script = getcallingscript()
                if tostring(Script) == "CharacterController" then
                    return __newindex(i, v, Camera.CFrame)
                end
            end
        end
        return __newindex(i, v, n_v)
    end)
    __namecall = hookmetamethod(game, "__namecall", function(self, ...)
        local args = {...}

        -- if tostring(self) == "Humanoid" and getnamecallmethod():lower() == "getstate" then
        --     local Call = __namecall(self, ...)
        --     if Call == Enum.HumanoidStateType.Swimming then
        --         return Call
        --     end
        --     return Enum.HumanoidStateType.Running
        -- end

        -- Bullet Tracers
        -- if getnamecallmethod() == "FireServer" and tostring(self) == "FireProjectile" then
        --     if library.flags["bulletlineEnabled"] and not Environment.Settings.SilentAimEnabled then

        --         local BulletLine = Instance.new("Part")
        --         BulletLine.Material = Enum.Material[library.flags["bulletlineMaterial"]]
        --         BulletLine.Size = Vector3.new(0.1, 0.1, 0.1)
        --         BulletLine.Transparency = 0
        --         BulletLine.Color = library.flags["bulletlineColor"]
        --         BulletLine.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + Camera.CFrame.LookVector) * CFrame.new(-0.5, 0, 0)
        --         BulletLine.Parent = ws
        --         BulletLine.Anchored = true
        --         BulletLine.CanCollide = false
        --         BulletLine.CanTouch = false
                
        --         task.spawn(function()
        --             local BulletLineTween1 = tweenService:Create(BulletLine, TweenInfo.new(0.1), {Size = Vector3.new(0.1, 0.1, 1000)})
        --             local BulletLineTween2 = tweenService:Create(BulletLine, TweenInfo.new(0.1), {CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + Camera.CFrame.LookVector * 1000) * CFrame.new(-0.5, 0, 0)})
        --             BulletLineTween1:Play()
        --             BulletLineTween2:Play()
                    
        --             while BulletLine.Transparency ~= 1 do
        --                 BulletLine.Transparency = BulletLine.Transparency + 0.05
        --                 wait(0.1)
        --             end
        --             BulletLine:Destroy()
        --         end)
        --     end
        -- end
        
        -- Anti Drown
        if getnamecallmethod() == "FireServer" and tostring(self) == "Drowning" then
            if library.flags["antidrownEnabled"] then
                return
            end
        end

        -- Hit Notification
        if getnamecallmethod() == "FireServer" and tostring(self) == "ProjectileInflict" then

            if library.flags["nobulletdropEnabled"] then
                args[9]["a1"] = 0
            end

            if library.flags["hitsoundsEnabled"] then
                Hit_Found = true
                Hit_Target = args[2]
            end

            return __namecall(self, unpack(args))
        end
    
        return __namecall(self, unpack(args))
    end)
end)()

function Bypass_Client()
    for i, v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "A1Sent") ~= nil then 
            rawset(v, "A1Sent", true)
        end
    end
end

local FPS = nil
for i, v in next, getgc(true) do
    if type(v) == "table" and rawget(v, "updateClient") then
        FPS = v
    end
end

local VFX = nil
for i, v in next, getgc(true) do
    if type(v) == 'table' and rawget(v, "RecoilCamera") then
        VFX = v
        break
    end
end


local ChatScript
for i, v in pairs(getgc(true)) do
    if type(v) == 'table' and rawget(v, "CreateMessageLabel") then
        ChatScript = v
    end
end

local ChatScript_CreateMessageLabel = ChatScript.CreateMessageLabel
ChatScript.CreateMessageLabel = LPH_NO_VIRTUALIZE(function(...)
    local Args = {...}
    local Message = Args[2].Message
    if Message then
        if Message:lower():find("[system]") and Message:lower():find(plr.Name:lower()) then
            if Message:find("by ".. plr.Name) then
                if library.flags["removeKilledBy"] then
                    Args[2].Message = "[System] Bozo just got absolutely destroyed by INFINITY user"
                end
                killSound:Play()
            else
                if library.flags["removeKilledBy"] then
                    Args[2].Message = "[System] INFINITY user died to a config issue"
                end
            end
        end
    end
    return ChatScript_CreateMessageLabel(unpack(Args))
end)

local Visor
local Utility
Bypass_Client()
-- local FPS_new = FPS.new
-- FPS.new = LPH_NO_VIRTUALIZE(function(...)
--     local Call = FPS_new(...)
--     Bypass_Client()

--     return Call
-- end)

task.spawn(function()
    local MainGui = plr.PlayerGui:WaitForChild("MainGui")
    if MainGui then 
        local MainFrame = MainGui:WaitForChild("MainFrame")
        if MainFrame then 
            local ScreenEffects = MainFrame:WaitForChild("ScreenEffects")
            Visor = ScreenEffects:WaitForChild("Visor")
            if Visor then
                ServiceConnections.VisorConnection = Visor:GetPropertyChangedSignal("Visible"):Connect(LPH_NO_VIRTUALIZE(function()
                    if library.flags["novisorEnabled"] then
                        Visor.Visible = false
                    else
                        Visor.Visible = true
                    end
                end))
            end
        end
    end
end)

local VFX_RecoilCamera = VFX.RecoilCamera
VFX.RecoilCamera = LPH_NO_VIRTUALIZE(function(...)
    if library.flags["norecoilEnabled"] then
        return
    end
    return VFX_RecoilCamera(...)
end)

-- Silent Aim hook function
SilentAimMissMath = function(Pos)
    local Where = math.random(1, 4)
    if Where == 1 then
        Pos = Pos + Vector3.new(0, 10, 0)
    elseif Where == 2 then
        Pos = Pos + Vector3.new(0, -10, 0)
    elseif Where == 3 then
        Pos = Pos + Vector3.new(10, 0, 0)
    elseif Where == 4 then
        Pos = Pos + Vector3.new(-10, 0, 0)
    end

    return Pos
end

-- Silent Aim
LPH_NO_VIRTUALIZE(function()
    local oldHook = nil	
    oldHook = hookfunction(require(repStorage.Modules.FPS.Bullet).CreateBullet, function(...)
        local args = {...}

        if Environment.Settings.SilentAimEnabled and Environment.Locked ~= nil then
            local shouldMiss = false
            if Environment.Settings.SilentAimMisschance >= math.random(1, 100) then
                shouldMiss = true
            end
            
            local head = nil
            local Prediction = Vector3.new(0, 0, 0)

            local function PredictionMath(Player, head, Prediction)
                if Environment.Settings.Prediction then
                    local PlayerRoot = Player:FindFirstChild("HumanoidRootPart")
            
                    if PlayerRoot.Velocity.Magnitude > 0 then
                        local TargetStuds = (head - Camera.CFrame.p).Magnitude
                        local TimeToTarget = TargetStuds / MuzzleVelocityValue
            
                        Prediction = PlayerRoot.Velocity * TimeToTarget
                    end
                end

                return Prediction
            end

            if Environment.Settings.AILocked then
                head = Environment.Locked:FindFirstChild(Environment.Settings.LockPart).Position
                Prediction = PredictionMath(Environment.Locked, head, Prediction)
            else
                head = Environment.Locked.Character:FindFirstChild(Environment.Settings.LockPart).Position
                Prediction = PredictionMath(Environment.Locked.Character, head, Prediction)
            end

            if head ~= nil then
                if shouldMiss then
                    head = SilentAimMissMath(head)
                end

                args[9] = {CFrame = CFrame.lookAt(
                    plr.Character.HumanoidRootPart.Position + Vector3.new(
                        0, UniversalTables.UniversalTable.GameSettings.RootScanHeight, 0
                    ),
                    head + Prediction
                )}

                -- if library.flags["bulletlineEnabled"] then
                --     local HitPos = head + Prediction

                --     local BulletLine = Instance.new("Part")
                --     BulletLine.Material = Enum.Material[library.flags["bulletlineMaterial"]]
                --     BulletLine.Size = Vector3.new(0.1, 0.1, 0.1)
                --     BulletLine.Transparency = 0
                --     BulletLine.Color = library.flags["bulletlineColor"]
                --     BulletLine.CFrame = CFrame.new(Camera.CFrame.Position, HitPos) * CFrame.new(-0.5, 0, 0)
                --     BulletLine.Parent = ws
                --     BulletLine.Anchored = true
                --     BulletLine.CanCollide = false
                --     BulletLine.CanTouch = false
                    
                --     task.spawn(function()
                --         local BulletLineTween1 = tweenService:Create(BulletLine, TweenInfo.new(0.1), {Size = Vector3.new(0.1, 0.1, 1000)})
                --         local BulletLineTween2 = tweenService:Create(BulletLine, TweenInfo.new(0.1), {CFrame = CFrame.new(Camera.CFrame.Position, HitPos) * CFrame.new(-0.5, 0, 0)})
                --         BulletLineTween1:Play()
                --         BulletLineTween2:Play()
                        
                --         while BulletLine.Transparency ~= 1 do
                --             BulletLine.Transparency = BulletLine.Transparency + 0.05
                --             wait(0.1)
                --         end
                --         BulletLine:Destroy()
                --     end)
                -- end
            end
        end

        return oldHook(table.unpack(args))
    end)
end)()

local Keybinds = {
    Aimbot = "MouseButton2",
    Walkspeed = "Z",
    CameraZoom =  "X",
    FakeLag = "C",
}
local HitBoxParts = {'Head', 'LeftUpperArm', 'LeftLowerArm', 'LeftHand', 'RightUpperArm', 'RightLowerArm', 'RightHand', 'LeftUpperLeg', 'LeftLowerLeg', 'LeftFoot', 'RightUpperLeg', 'RightLowerLeg', 'RightFoot', 'UpperTorso', 'LowerTorso'}

--* Keybind Viewer Init *--
KeybindViewer = {
    Size = Vector2.new(300, 14), 
    
    Main = Framework:Draw("Square", {Thickness = 0, Size = Vector2.new(155, 165), Filled = true, Position = Vector2.new(0, Camera.ViewportSize.Y / 2), Color = library.flags["Tab Background"], Visible = false}),
    Border = Framework:Draw("Square", {Thickness = 2, Size = Vector2.new(155, 165), Filled = false, Position = Vector2.new(0, Camera.ViewportSize.Y / 2), Color = library.flags["Window Background"], Visible = false}),
    TopBorder = Framework:Draw("Square", {Thickness = 1, Size = Vector2.new(149, 3), Filled = true, Position = Vector2.new(2, Camera.ViewportSize.Y / 2 + 2), Color = library.flags["Accent"], Visible = false}),
    
    Texts = {}
}
local Title = Framework:Draw("Text", {
    Text = "Keybinds", 
    Font = 3, 
    Size = 18, 
    Position = Vector2.new(KeybindViewer.Main.Position.X + 7, KeybindViewer.Main.Position.Y + 5), 
    Color = Color3.fromRGB(255,255,255),
    Visible = false, 
    Outline = true
})
table.insert(KeybindViewer.Texts, Title)
local WalkspeedKeybindOld = Framework:Draw("Text", {
    Text = "Walk Speed   [C]", 
    Font = 3, 
    Size = 16, 
    Position = Vector2.new(KeybindViewer.Main.Position.X + 30, KeybindViewer.Main.Position.Y + 40), 
    Color = Color3.fromRGB(255,255,255), 
    Visible = false, 
    Outline = true
})
table.insert(KeybindViewer.Texts, WalkspeedKeybindOld)
local InventoryViewerKeybind = Framework:Draw("Text", {
    Text = "Inventorys   [Y]", 
    Font = 3, 
    Size = 16, 
    Position = Vector2.new(KeybindViewer.Main.Position.X + 30, KeybindViewer.Main.Position.Y + 60), 
    Color = Color3.fromRGB(255,255,255), 
    Visible = false, 
    Outline = true
})
table.insert(KeybindViewer.Texts, InventoryViewerKeybind)
local CameraZoomKeybind = Framework:Draw("Text", {
    Text = "Camera Zoom  [X]", 
    Font = 3, 
    Size = 16, 
    Position = Vector2.new(KeybindViewer.Main.Position.X + 30, KeybindViewer.Main.Position.Y + 80), 
    Color = Color3.fromRGB(255,255,255), 
    Visible = false, 
    Outline = true
})
table.insert(KeybindViewer.Texts, CameraZoomKeybind)
local ThirdPersonKeybind = Framework:Draw("Text", {
    Text = "Third Person [N]", 
    Font = 3, 
    Size = 16, 
    Position = Vector2.new(KeybindViewer.Main.Position.X + 30, KeybindViewer.Main.Position.Y + 100), 
    Color = Color3.fromRGB(255,255,255), 
    Visible = false, 
    Outline = true
})
table.insert(KeybindViewer.Texts, ThirdPersonKeybind)
local HipHeightKeybind = Framework:Draw("Text", {
    Text = "Hip Height   [L]", 
    Font = 3, 
    Size = 16, 
    Position = Vector2.new(KeybindViewer.Main.Position.X + 30, KeybindViewer.Main.Position.Y + 120), 
    Color = Color3.fromRGB(255,255,255), 
    Visible = false, 
    Outline = true
})
table.insert(KeybindViewer.Texts, HipHeightKeybind)
local UnlockDoorKeybind = Framework:Draw("Text", {
    Text = "Unlock Door  [O]", 
    Font = 3, 
    Size = 16, 
    Position = Vector2.new(KeybindViewer.Main.Position.X + 30, KeybindViewer.Main.Position.Y + 140), 
    Color = Color3.fromRGB(255,255,255), 
    Visible = false, 
    Outline = true
})
table.insert(KeybindViewer.Texts, UnlockDoorKeybind)


-- Setup Table
local Old_Gravity = workspace.Gravity
local Old_Decoration = gethiddenproperty(Terrain, "Decoration")
local Default_Walkspeed = plr.Character.Humanoid.WalkSpeed
local Default_JumpHeight = plr.Character.Humanoid.JumpHeight
local Old_FOV = Camera.FieldOfView
local Old_Lighting = {
    Ambient = lighting.Ambient,
    Brightness = lighting.Brightness,
    ColorShift_Bottom = lighting.ColorShift_Bottom,
    ColorShift_Top = lighting.ColorShift_Top,
    EnvironmentDiffuseScale = lighting.EnvironmentDiffuseScale,
    EnvironmentSpecularScale = lighting.EnvironmentSpecularScale,
    GlobalShadows = lighting.GlobalShadows,
    OutdoorAmbient = lighting.OutdoorAmbient,
    ClockTime = lighting.ClockTime,
    TimeOfDay = lighting.TimeOfDay,
    ExposureCompensation = lighting.ExposureCompensation
}
local Old_Ammo = {
    ["762x54AP"] = {
        ["Drop"]  = repStorage.AmmoTypes["762x54AP"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["762x54AP"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["762x54AP"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["762x54AP"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["762x54AP"]:GetAttribute("ArmorPen")
    },
    ["9x18AP"] = {
        ["Drop"]  = repStorage.AmmoTypes["9x18AP"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["9x18AP"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["9x18AP"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["9x18AP"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["9x18AP"]:GetAttribute("ArmorPen")
    },
    ["762x39AP"] = {
        ["Drop"]  = repStorage.AmmoTypes["762x39AP"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["762x39AP"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["762x39AP"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["762x39AP"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["762x39AP"]:GetAttribute("ArmorPen")
    },
    ["9x18Z"] = {
        ["Drop"]  = repStorage.AmmoTypes["9x18Z"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["9x18Z"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["9x18Z"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["9x18Z"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["9x18Z"]:GetAttribute("ArmorPen")
    },
    ["762x25Tracer"] = {
        ["Drop"]  = repStorage.AmmoTypes["762x25Tracer"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["762x25Tracer"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["762x25Tracer"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["762x25Tracer"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["762x25Tracer"]:GetAttribute("ArmorPen")
    },
    ["556x45Tracer"] = {
        ["Drop"]  = repStorage.AmmoTypes["556x45Tracer"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["556x45Tracer"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["556x45Tracer"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["556x45Tracer"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["556x45Tracer"]:GetAttribute("ArmorPen")
    },
    ["762x25AP"] = {
        ["Drop"]  = repStorage.AmmoTypes["762x25AP"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["762x25AP"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["762x25AP"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["762x25AP"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["762x25AP"]:GetAttribute("ArmorPen")
    },
    ["762x39Tracer"] = {
        ["Drop"]  = repStorage.AmmoTypes["762x39Tracer"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["762x39Tracer"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["762x39Tracer"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["762x39Tracer"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["762x39Tracer"]:GetAttribute("ArmorPen")
    },
    ["762x54Tracer"] = {
        ["Drop"]  = repStorage.AmmoTypes["762x54Tracer"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["762x54Tracer"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["762x54Tracer"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["762x54Tracer"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["762x54Tracer"]:GetAttribute("ArmorPen")
    },
    ["9x19Tracer"] = {
        ["Drop"]  = repStorage.AmmoTypes["9x19Tracer"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["9x19Tracer"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["9x19Tracer"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["9x19Tracer"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["9x19Tracer"]:GetAttribute("ArmorPen")
    },
    ["9x18Tracer"] = {
        ["Drop"]  = repStorage.AmmoTypes["9x18Tracer"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["9x18Tracer"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["9x18Tracer"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["9x18Tracer"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["9x18Tracer"]:GetAttribute("ArmorPen")
    },
    ["9x19AP"] = {
        ["Drop"]  = repStorage.AmmoTypes["9x19AP"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["9x19AP"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["9x19AP"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["9x19AP"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["9x19AP"]:GetAttribute("ArmorPen")
    },
    ["556x45AP"] = {
        ["Drop"]  = repStorage.AmmoTypes["556x45AP"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["556x45AP"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["556x45AP"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["556x45AP"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["556x45AP"]:GetAttribute("ArmorPen")
    },
    ["9x39Z"] = {
        ["Drop"]  = repStorage.AmmoTypes["9x39Z"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["9x39Z"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["9x39Z"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["9x39Z"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["9x39Z"]:GetAttribute("ArmorPen")
    },
    ["9x39AP"] = {
        ["Drop"]  = repStorage.AmmoTypes["9x39AP"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["9x39AP"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["9x39AP"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["9x39AP"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["9x39AP"]:GetAttribute("ArmorPen")
    },
    ["12gaSlug"] = {
        ["Drop"]  = repStorage.AmmoTypes["12gaSlug"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["12gaSlug"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["12gaSlug"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["12gaSlug"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["12gaSlug"]:GetAttribute("ArmorPen"),
        ["Spread"] = repStorage.AmmoTypes["12gaSlug"]:GetAttribute("AccuracyDeviation")
    },
    ["12gaBuckshot"] = {
        ["Drop"] = repStorage.AmmoTypes["12gaBuckshot"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["12gaBuckshot"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["12gaBuckshot"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["12gaBuckshot"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["12gaBuckshot"]:GetAttribute("ArmorPen"),
        ["Spread"] = repStorage.AmmoTypes["12gaBuckshot"]:GetAttribute("AccuracyDeviation")
    },
    ["12gaFlechette"] = {
        ["Drop"] = repStorage.AmmoTypes["12gaFlechette"]:GetAttribute("ProjectileDrop"),
        ["Speed"] = repStorage.AmmoTypes["12gaFlechette"]:GetAttribute("MuzzleVelocity"),
        ["Damage"] = repStorage.AmmoTypes["12gaFlechette"]:GetAttribute("Damage"),
        ["Pellets"] = repStorage.AmmoTypes["12gaFlechette"]:GetAttribute("Pellets"),
        ["ArmorPen"] = repStorage.AmmoTypes["12gaFlechette"]:GetAttribute("ArmorPen"),
        ["Spread"] = repStorage.AmmoTypes["12gaFlechette"]:GetAttribute("AccuracyDeviation")
    }
}
local esp = {
    players = {},
    objects = {},
    otherObjects = {},
    enabled = false,
    teamcheck = false,
    fontsize = 13,
    rainbowmode = false,
    rainbowcolor = Color3.fromHSV(0, 1, 1),
    font = 3,
    settings = {
        name = {enabled = false, outline = false, displaynames = false, color = Color3.fromRGB(255, 255, 255)},
        box = {enabled = false, outline = false, color = Color3.fromRGB(255, 255, 255)},
        tool = {enabled = false, outline = false, color = Color3.fromRGB(255, 255, 255)},
        healthbar = {enabled = false, outline = false},
        healthtext = {enabled = false, outline = false, color = Color3.fromRGB(255, 255, 255)},
        distance = {enabled = false, outline = false, color = Color3.fromRGB(255, 255, 255)},
        viewangle = {enabled = false, color = Color3.fromRGB(255, 255, 255)},
        tracers = {enabled = false, color = Color3.fromRGB(255, 255, 255)},
        skeleton = {enabled = false, color = Color3.fromRGB(255, 255, 255)},
        chams = {enabled = false, color = Color3.fromRGB(255, 255, 255)},
        chamsOutline = {enabled = false, color = Color3.fromRGB(255, 255, 255)},
    }
}

local main = library:Load{
    Name = "1NF1N17Y - " .. script_version_number .. " - Last Updated: " .. last_updated .. " - Private",
    SizeX = 600,
    SizeY = 650,
    Theme = "Midnight",
    Extension = "json", 
    Folder = "1NF1N17Y-Configs" 
}

--* Tabs *--
local Tabs = {
    Combat = main:Tab("Combat"),
    Visuals = main:Tab("Visuals"),
    Misc = main:Tab("Misc"),
}

--* Sections *--
local Sections = {
    Combat = {
        Aimbot = Tabs.Combat:Section{Name = "Aimbot", Side = "Left"},
        FOVCircle = Tabs.Combat:Section{Name = "FOVCircle", Side = "Right"},
        WeaponMods = Tabs.Combat:Section{Name = "Weapon Mods", Side = "Left"},
        HitSounds = Tabs.Combat:Section{Name = "Custom Hit Sounds", Side = "Right"},
    },
    Visuals = {
        ESP = Tabs.Visuals:Section{Name = "ESP", Side = "Left"},
        Objects = Tabs.Visuals:Section{Name = "Objects", Side = "Left"},
        InventoryScanner = Tabs.Visuals:Section{Name = "Inventory Viewer", Side = "Right"},
        FreeCamera = Tabs.Visuals:Section{Name = "Free Camera", Side = "Right"},
        RainbowSettings = Tabs.Visuals:Section{Name = "Rainbow ESP", Side = "Right"},
    },
    Misc = {
        Lighting = Tabs.Misc:Section{Name = "Lighting", Side = "Left"},
        Removals = Tabs.Misc:Section{Name = "Removals", Side = "Right"},
        LocalPlayer = Tabs.Misc:Section{Name = "Local Player", Side = "Left"},
        Misc = Tabs.Misc:Section{Name = "Misc", Side = "Right"},
        ChatSpammer = Tabs.Misc:Section{Name = "Misc", Side = "Right"},
    },
}

--* Aimbot *--
local AimbotToggle = Sections.Combat.Aimbot:Toggle{
    Name = "Enabled",
    Flag = "aimbotEnabled",
    Default = false,
    Callback  = function(bool)
        Environment.Settings.Enabled = bool
    end
}

AimbotToggle:Keybind{
    Default = Enum.UserInputType.MouseButton2,
    Blacklist = {Enum.UserInputType.MouseButton1},
    Flag = "aimbotKeybind",
    Mode = "nil", -- mode to nil if u dont want it to toggle the toggle
    Callback = function(key, fromsetting)
        local key = tostring(key):gsub("Enum.UserInputType.", "")
        Environment.Settings.TriggerKey = key
    end
}

local SilentAim = Sections.Combat.Aimbot:Toggle{
    Name = "Silent Aim",
    Flag = "silentaimEnabled",
    -- Default = false,
    Callback  = function(bool)
        Environment.Settings.SilentAimEnabled = bool
    end
}
SilentAim:Slider{
    Text = "Misschance: [value]%",
    Default = 1,
    Min = 1,
    Max = 100,
    Float = 1,
    Flag = "silentaimMisschance",
    Callback = function(value)
        Environment.Settings.SilentAimMisschance = value
    end
}


Sections.Combat.Aimbot:Toggle{
    Name = "AI",
    Flag = "aiaimbotEnabled",
    -- Default = false,
    Callback  = function(bool)
        Environment.Settings.AiAimbotEnabled = bool
    end
}

Sections.Combat.Aimbot:Toggle{
    Name = "Visible Check",
    Flag = "visiblecheckEnabled",
    -- Default = false,
    Callback = function(bool)
        Environment.Settings.WallCheck = bool
    end
}
local aimbotSnaplines = Sections.Combat.Aimbot:Toggle{
    Name = "Snap Lines",
    Flag = "snaplinesEnabled",
    -- Default = false,
    Callback = function(bool)
        Environment.Settings.SnapLines = bool
    end
}
aimbotSnaplines:ColorPicker{
    Default = Color3.fromRGB(255, 0, 0), 
    Flag = "snaplinesColor",
    Callback = function(color)
        Environment.Settings.SnapLineColor = string.format("%s, %s, %s", math.round(color.R * 255), math.round(color.G * 255), math.round(color.B * 255))
    end
}

Sections.Combat.Aimbot:Toggle{
    Name = "Prediction",
    Flag = "predictionEnabled",
    -- Default = false,
    Callback = function(bool)
        Environment.Settings.Prediction = bool
    end
}

local highlighttargetEnabled = Sections.Combat.Aimbot:Toggle{
    Name = "Highlight Target",
    Flag = "highlighttargetEnabled"
}
highlighttargetEnabled:ColorPicker{
    Default = Color3.fromRGB(255, 0, 0), 
    Flag = "highlighttargetColor"
}

Sections.Combat.Aimbot:Separator("Aimbot Settings")


Sections.Combat.Aimbot:Dropdown{
    Name = "Aim Part",
    Default = "Head",
    Content = HitBoxParts,
    Flag = "aimbotSnapPart",
    Callback = function(option)
        Environment.Settings.LockPart = tostring(option)
    end
}

Sections.Combat.Aimbot:Slider{
    Name = "Sensitivity",
    Text = "[value] ms",
    Default = 0,
    Min = 0,
    Max = 1,
    Float = 0.01,
    Flag = "aimbotSensitivity",
    Callback = function(value)
        Environment.Settings.Sensitivity = value
    end
}

Sections.Combat.Aimbot:Slider{
    Name = "Max Aim Distance",
    Text = "[value] m",
    Default = 1000,
    Min = 0,
    Max = 5000,
    Float = 1,
    Flag = "aimbotMaxDistance",
    Callback = function(value)
        Environment.Settings.MaxDistance = value
    end
}

-- local BulletTracerToggle = Sections.Combat.Aimbot:Toggle{
--     Name = "Bullet Tracers",
--     Flag = "bulletlineEnabled"
-- }
-- BulletTracerToggle:ColorPicker{
--     Default = Color3.fromRGB(255, 0, 0), 
--     Flag = "bulletlineColor"
-- }
-- Sections.Combat.Aimbot:Dropdown{
--     Name = "Bullet Tracer Material",
--     Default = "Neon",
--     Content = {"Neon", "ForceField", "SmoothPlastic", "Glass", "Metal"},
--     Flag = "bulletlineMaterial"
-- }

--* FOV Circle *--
local fovCircle = Sections.Combat.FOVCircle:Toggle{
    Name = "Enabled",
    Flag = "fovcircleEnabled",
    -- Default = false,
    Callback = function(bool)
        Environment.FOVSettings.Enabled = bool
    end
}
fovCircle:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "fovcircleColor",
    Callback = function(color)
        Environment.FOVSettings.Color = string.format("%s, %s, %s", math.round(color.R * 255), math.round(color.G * 255), math.round(color.B * 255))
    end
}
Sections.Combat.FOVCircle:Slider{
    Name = "Size",
    Text = "[value]",
    Default = 90,
    Min = 1,
    Max = Camera.ViewportSize.X / 2 + 200,
    Float = 1,
    Flag = "fovcircleSize",
    Callback = function(value)
        Environment.FOVSettings.Amount = value
    end
}
Sections.Combat.FOVCircle:Slider{
    Name = "Sides",
    Text = "[value]",
    Default = 50,
    Min = 1,
    Max = 65,
    Float = 1,
    Flag = "fovcircleSides",
    Callback = function(value)
        Environment.FOVSettings.Sides = value
    end
}
Sections.Combat.FOVCircle:Slider{
    Name = "Thickness",
    Text = "[value]",
    Default = 1,
    Min = 1,
    Max = 10,
    Float = 1,
    Flag = "fovcircleThickness",
    Callback = function(value)
        Environment.FOVSettings.Thickness = value
    end
}

--* Weapon Mods *--
local OldWeaponMods_QuickAim    = {}
Sections.Combat.WeaponMods:Toggle{
    Name = "Quick Aim",
    Flag = "quickaimEnabled",
    -- Default = false,
    Callback = function(bool)
        if bool then
            OldWeaponMods_QuickAim = {}
            for i,v in next, repStorage.Players[plr.Name].Inventory:GetChildren() do
                local module = require(v.SettingsModule)

                table.insert(OldWeaponMods_QuickAim, module.AimInSpeed)
                table.insert(OldWeaponMods_QuickAim, module.AimOutSpeed)

                module.AimInSpeed = 0
                module.AimOutSpeed = 0
            end
        else
            for i,v in next, repStorage.Players[plr.Name].Inventory:GetChildren() do
                local module = require(v.SettingsModule)

                for i2,v2 in next, OldWeaponMods_QuickAim do
                    module.AimInSpeed = v2
                    module.AimOutSpeed = v2
                end
            end
        end
    end
}
Sections.Combat.WeaponMods:Toggle{
    Name = "No Recoil",
    Flag = "norecoilEnabled",
    Callback = function(bool)
        
    end
}
Sections.Combat.WeaponMods:Toggle{
    Name = "No Bullet Drop",
    Flag = "nobulletdropEnabled",
    -- Default = false,
    Callback = function(bool)
        for _, Item in pairs(repStorage.AmmoTypes:GetChildren()) do
            if bool then
                Item:SetAttribute("ProjectileDrop", 0)
            else
                Item:SetAttribute("ProjectileDrop", Old_Ammo[Item.Name]["Drop"])
            end
        end
    end
}
Sections.Combat.WeaponMods:Toggle{
    Name = "No Shotgun Spread",
    Flag = "noshotgunspreadEnabled",
    -- Default = false,
    Callback = function(bool)
        for _, Item in pairs(repStorage.AmmoTypes:GetChildren()) do
            if bool and Item:GetAttribute("AccuracyDeviation") ~= nil then
                Item:SetAttribute("AccuracyDeviation", 0)
            elseif Item:GetAttribute("AccuracyDeviation") ~= nil and not bool then
                Item:SetAttribute("AccuracyDeviation", Old_Ammo[Item.Name]["Spread"])
            end
        end
    end
}
Sections.Combat.WeaponMods:Toggle{
    Name = "No Muzzle Flash",
    Flag = "nomuzzleflashEnabled",
    -- Default = false,
    Callback = function(bool)
        for i,v in pairs(repStorage.RangedWeapons:GetChildren()) do
            v:SetAttribute("MuzzleEffect", not bool)
        end
    end
}
Sections.Combat.WeaponMods:Toggle{
    Name = "Hard Damage Bullets",
    Flag = "hardbulletsEnabled",
    -- Default = false,
    Callback = function(bool)
        for _, Item in pairs(repStorage.AmmoTypes:GetChildren()) do
            if bool then
                Item:SetAttribute("ArmorPen", Old_Ammo[Item.Name]["ArmorPen"] * 3)
                Item:SetAttribute("Damage", Old_Ammo[Item.Name]["Damage"] * 3)
            else
                Item:SetAttribute("ArmorPen", Old_Ammo[Item.Name]["ArmorPen"])
                Item:SetAttribute("Damage", Old_Ammo[Item.Name]["Damage"])
            end
        end
    end
}
Sections.Combat.WeaponMods:Toggle{
    Name = "Double Bullet",
    Flag = "doublebulletEnabled",
    -- Default = false,
    Callback = function(bool)
        for _, Item in pairs(repStorage.AmmoTypes:GetChildren()) do
            if bool and Item:GetAttribute("Pellets") ~= nil then
                Item:SetAttribute("Pellets", Old_Ammo[Item.Name]["Pellets"] * 2)
            elseif not bool and Item:GetAttribute("Pellets") ~= nil then
                Item:SetAttribute("Pellets", Old_Ammo[Item.Name]["Pellets"])
            end
        end
    end
}
local rapidfireEnabledd = false
local FireRate = Sections.Combat.WeaponMods:Toggle{
    Name = "Fire Rate",
    Flag = "rapidfireEnabled",
    -- Default = false,
    Callback = function(bool)
        if bool and not rapidfireEnabledd then
            rapidfireEnabledd = true
            for i,v in next, repStorage.Players[plr.Name].Inventory:GetChildren() do
                local module = require(v.SettingsModule)

                module.FireRate = library.flags["firerateValue"]
                module.FireModes = { "Semi", "Auto" }
                module.FireMode = 'Auto'
            end
        end
    end
}
FireRate:Slider{
    Text = "[value] ms",
    Default = 0,
    Min = 0,
    Max = 1,
    Float = 0.0001,
    Flag = "firerateValue",
    Callback = function(value)
        
    end
}


--* Hit Sounds *--
Sections.Combat.HitSounds:Toggle{
    Name = "Enabled",
    Flag = "hitsoundsEnabled",
    Callback = function(bool)
        
    end
}
-- Miscellaneous - Hit Sound
local hitSounds = {
    Neverlose = "rbxassetid://8726881116",
    Gamesense = "rbxassetid://4817809188",
    Rust = "rbxassetid://1255040462",
    ["Among Us"] = "rbxassetid://5700183626",
    ["CS:GO"] = "rbxassetid://6937353691",
    ["Call of Duty"] = "rbxassetid://5952120301",
    Click = "rbxassetid://8053704437",
    Steve = "rbxassetid://4965083997",
}
-- if isfile("allSounds.txt") then
--     local sounds = readfile("allSounds.txt")
--     if sounds then
--         hitSounds = game:GetService("HttpService"):JSONDecode(sounds)
--     end
-- end


local allSounds = {}
allSounds[1] = "Standard"
for i, v in pairs(hitSounds) do
    allSounds[#allSounds + 1] = i
end
-- if not isfile("allSounds.txt") then
--     writefile("allSounds.txt", game:GetService("HttpService"):JSONEncode(hitSounds))
-- end


local HeadSoundList = Sections.Combat.HitSounds:Dropdown{
    Name = "Head",
    Default = "Standard",
    Content = allSounds,
    Flag = "headSound",
    Callback = function(option)
        local standardHitsound = option == "Standard"
        if standardHitsound then
            headSound.SoundId = ""
        else
            headSound.SoundId = hitSounds[option]
        end
        if not headSound.IsPlaying then
            headSound:Play()
        end
    end
}
Sections.Combat.HitSounds:Slider{
    Name = "Head Sound Volume",
    Text = "[value]",
    Default = 5,
    Min = 0,
    Max = 10,
    Float = 0.1,
    Flag = "headSoundVolume",
    Callback = function(value)
        headSound.Volume = value
        if not headSound.IsPlaying then
            headSound:Play()
        end
    end
}

local BodySoundList = Sections.Combat.HitSounds:Dropdown{
    Name = "Body",
    Default = "Standard",
    Content = allSounds,
    Flag = "bodySound",
    Callback = function(option)
        local standardHitsound = option == "Standard"
        if standardHitsound then
            bodySound.SoundId = ""
        else
            bodySound.SoundId = hitSounds[option]
        end
        if not bodySound.IsPlaying then
            bodySound:Play()
        end
    end
}
Sections.Combat.HitSounds:Slider{
    Name = "Body Sound Volume",
    Text = "[value]",
    Default = 5,
    Min = 0,
    Max = 10,
    Float = 0.1,
    Flag = "bodySoundVolume",
    Callback = function(value)
        bodySound.Volume = value
        if not bodySound.IsPlaying then
            bodySound:Play()
        end
    end
}

local KillSoundList = Sections.Combat.HitSounds:Dropdown{
    Name = "Kill",
    Default = "Standard",
    Content = allSounds,
    Flag = "killSound",
    Callback = function(option)
        local standardHitsound = option == "Standard"
        if standardHitsound then
            killSound.SoundId = ""
        else
            killSound.SoundId = hitSounds[option]
        end
        if not killSound.IsPlaying then
            killSound:Play()
        end
    end
}
Sections.Combat.HitSounds:Slider{
    Name = "Kill Sound Volume",
    Text = "[value]",
    Default = 5,
    Min = 0,
    Max = 10,
    Float = 0.1,
    Flag = "killSoundVolume",
    Callback = function(value)
        killSound.Volume = value
        if not killSound.IsPlaying then
            killSound:Play()
        end
    end
}

-- Sections.Combat.HitSounds:Separator("Add Sounds")
-- local _SoundName = Sections.Combat.HitSounds:Box{
--     Name = "Sound Name",
--     Placeholder = "Enter Sound Name Here",
--     Flag = "Sound Name"
-- }
-- local _SoundID = Sections.Combat.HitSounds:Box{
--     Name = "Sound ID",
--     Placeholder = "Enter Sound ID Here",
--     Flag = "Sound ID"
-- }
-- local _SoundSave = Sections.Combat.HitSounds:Button{
--     Name = "Add Sound",
--     Callback = function()
--         if library.flags["Sound Name"] ~= nil and library.flags["Sound ID"] ~= nil then
--             local SoundID = "rbxassetid://" .. tostring(library.flags["Sound ID"])
            
--             hitSounds[library.flags["Sound Name"]] = SoundID
--             allSounds[#allSounds + 1] = library.flags["Sound Name"]
            
--             print("Added Sound: " .. library.flags["Sound Name"] .. " | " .. SoundID)
--             HeadSoundList:Refresh(allSounds)
--             BodySoundList:Refresh(allSounds)
--             KillSoundList:Refresh(allSounds)
    
--             if isfile("allSounds.txt") then
--                 delfile("allSounds.txt")
--             end
    
--             writefile("allSounds.txt", game:GetService("HttpService"):JSONEncode(hitSounds))
--         end
--     end
-- }

-- * ESP * --
local ESPEnabledToggle = Sections.Visuals.ESP:Toggle{
    Name = "Enabled",
    Flag = "espEnabled",
    -- Default = false,
    Callback = function(bool)
        esp.enabled = bool
    end
}
local espFriendCheck = Sections.Visuals.ESP:Toggle{
    Name = "Friend Check",
    Flag = "friendcheckEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
espFriendCheck:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "friendcheckColor",
    Callback = function(color)
        
    end
}
local espName = Sections.Visuals.ESP:Toggle{
    Name = "Name",
    Flag = "espnameEnabled",
    -- Default = false,
    Callback = function(bool)
        esp.settings.name.enabled = bool
    end
}
espName:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "espnameColor",
    Callback = function(color)
        esp.settings.name.color = color
    end
}
local espBox = Sections.Visuals.ESP:Toggle{
    Name = "Box",
    Flag = "espboxEnabled",
    -- Default = false,
    Callback = function(bool)
        esp.settings.box.enabled = bool
    end
}
espBox:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "espboxColor",
    Callback = function(color)
        esp.settings.box.color = color
    end
}
local espTool = Sections.Visuals.ESP:Toggle{
    Name = "Tool",
    Flag = "esptoolEnabled",
    -- Default = false,
    Callback = function(bool)
        esp.settings.tool.enabled = bool
    end
}
espTool:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "esptoolColor",
    Callback = function(color)
        esp.settings.tool.color = color
    end
}
Sections.Visuals.ESP:Toggle{
    Name = "Health Bar",
    Flag = "esphealthbarEnabled",
    -- Default = false,
    Callback = function(bool)
        esp.settings.healthbar.enabled = bool
    end
}
local espHealthText = Sections.Visuals.ESP:Toggle{
    Name = "Health Text",
    Flag = "esphealthtextEnabled",
    -- Default = false,
    Callback = function(bool)
        esp.settings.healthtext.enabled = bool
    end
}
espHealthText:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "esphealthtextColor",
    Callback = function(color)
        esp.settings.healthtext.color = color
    end
}
local espDistance = Sections.Visuals.ESP:Toggle{
    Name = "Distance",
    Flag = "espdistanceEnabled",
    -- Default = false,
    Callback = function(bool)
        esp.settings.distance.enabled = bool
    end
}
espDistance:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "espdistanceColor",
    Callback = function(color)
        esp.settings.distance.color = color
    end
}
local espViewAngle = Sections.Visuals.ESP:Toggle{
    Name = "View Angle",
    Flag = "espviewangleEnabled",
    -- Default = false,
    Callback = function(bool)
        esp.settings.viewangle.enabled = bool
    end
}
espViewAngle:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "espviewangleColor",
    Callback = function(color)
        esp.settings.viewangle.color = color
    end
}
local espTracers = Sections.Visuals.ESP:Toggle{
    Name = "Tracers",
    Flag = "esptracersEnabled",
    -- Default = false,
    Callback = function(bool)
        esp.settings.tracers.enabled = bool
    end
}
espTracers:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "esptracersColor",
    Callback = function(color)
        esp.settings.tracers.color = color
    end
}
local espSkeleton = Sections.Visuals.ESP:Toggle{
    Name = "Skeleton",
    Flag = "espskeletonEnabled",
    -- Default = false,
    Callback = function(bool)
        esp.settings.skeleton.enabled = bool
    end
}
espSkeleton:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "espskeletonColor",
    Callback = function(color)
        esp.settings.skeleton.color = color
    end
}
Sections.Visuals.ESP:Toggle{
    Name = "Visible Chams",
    Flag = "espvisiblechamsEnabled",
    -- Default = false,
    Callback = function(bool)   
    end
}
local espChams = Sections.Visuals.ESP:Toggle{
    Name = "Chams",
    Flag = "espchamsEnabled",
    -- Default = false,
    Callback = function(bool)   
        esp.settings.chams.enabled = bool
    end
}
espChams:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "espchamsColor",
    Callback = function(color)
        esp.settings.chams.color = color
    end
}
local espChamsOutline = Sections.Visuals.ESP:Toggle{
    Name = "Chams Outline",
    Flag = "espchamsoutlineEnabled",
    -- Default = false,
    Callback = function(bool)   
        esp.settings.chamsOutline.enabled = bool
    end
}
espChamsOutline:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "espchamsoutlineColor",
    Callback = function(color)
        esp.settings.chamsOutline.color = color
    end
}
Sections.Visuals.ESP:Separator("ESP Settings")
Sections.Visuals.ESP:Dropdown{
    Name = "Tracer Location",
    Default = "Bottom",
    Content = {
        "Bottom",
        "Middle",
    },
    Flag = "tracerFromLocation",
    Callback = function(option)
        
    end
}
Sections.Visuals.ESP:Slider{
    Name = "Max Distance",
    Text = "[value] m",
    Default = 1000,
    Min = 1,
    Max = 5000,
    Float = 1,
    Flag = "espMaxDistance",
    Callback = function(value)
    end
}
Sections.Visuals.ESP:Slider{
    Name = "Font Size",
    Text = "[value]/13",
    Default = 13,
    Min = 5,
    Max = 30,
    Float = 0.01,
    Flag = "espFontSize",
    Callback = function(value)
        esp.fontsize = value
    end
}

---------------------------------
    --* OBJECT ESP *--
---------------------------------
LPH_NO_VIRTUALIZE(function()
    local objectConnections = {}
    Sections.Visuals.Objects:Toggle{
        Name = "Enabled",
        Flag = "espobjectsEnabled",
        -- Default = false,
        Callback = function(bool)
            ESP:Toggle(bool)
            ESP.Settings.Objects_Enabled = bool
        end
    }
    local AiZones = Workspace:FindFirstChild("AiZones")
    if AiZones then
        for _, Zone in pairs(AiZones:GetChildren()) do
            ServiceConnections.AiZonesAddedConnection = Zone.ChildAdded:Connect(LPH_NO_VIRTUALIZE(function(Child)
                if Child:IsA("Model") then
                    if Child.PrimaryPart and library.flags["espobjectsEnabled"] and library.flags["espobjectsaientitiesEnabled"] then
                        ESP:Object(Child, {
                            Type = "Bandit",
                            Color = library.flags["espobjectsaientitiesColor"]
                        })
                    end
                    if objectConnections[Child] == nil then
                        objectConnections[Child] = Child:GetPropertyChangedSignal("PrimaryPart"):Connect(LPH_NO_VIRTUALIZE(function()
                            if Child.PrimaryPart == nil then
                                local Object = ESP:GetObject(Child)
                                if Object then
                                    Object:Destroy()
                                end
                            elseif library.flags["espobjectsEnabled"] and library.flags["espobjectsaientitiesEnabled"] then
                                ESP:Object(Child, {
                                    Type = "Bandit",
                                    Color = library.flags["espobjectsaientitiesColor"]
                                })
                            end
                        end))
                    end
                end
            end))
            ServiceConnections.AiZonesRemovedConnection = Zone.ChildRemoved:Connect(LPH_NO_VIRTUALIZE(function(Child)
                if Child:IsA("Model") then
                    local Object = ESP:GetObject(Child)
                    if Object then
                        Object:Destroy()
                    end
                end
            end))
        end
        local espobjectsAiEntities = Sections.Visuals.Objects:Toggle{
            Name = "AI Entities",
            Flag = "espobjectsaientitiesEnabled",
            -- Default = false,
            Callback = function(bool)
                if bool then
                    for _, Zone in pairs(AiZones:GetChildren()) do
                        for _, Item in pairs(Zone:GetChildren()) do
                            if Item.Name ~= "PMN2" then
                                ESP:Object(Item, {
                                    Type = "Bandit",
                                    Color = library.flags["espobjectsaientitiesColor"]
                                })
                            end
                            if objectConnections[Item] == nil then
                                objectConnections[Item] = Item:GetPropertyChangedSignal("PrimaryPart"):Connect(function()
                                    if Item.PrimaryPart == nil then
                                        local Object = ESP:GetObject(Item)
                                        if Object then
                                            Object:Destroy()
                                        end
                                    elseif library.flags["espobjectsEnabled"] and library.flags["espobjectsaientitiesEnabled"] then
                                        if Item.Name ~= "PMN2" then
                                            ESP:Object(Item, {
                                                Type = "Bandit",
                                                Color = library.flags["espobjectsaientitiesColor"]
                                            })
                                        end
                                    end
                                end)
                            end
                        end
                    end
                else
                    for _, Object in pairs(ESP.Objects) do
                        if Object.Type == "Bandit" then
                            Object:Destroy()
                        end
                    end
                end
            end
        }
        espobjectsAiEntities:ColorPicker{
            Default = Color3.fromRGB(255, 255, 255), 
            Flag = "espobjectsaientitiesColor",
            Callback = function(color)
                for _, Object in pairs(ESP.Objects) do
                    if Object.Type == "Bandit" then
                        for _, Drawing in pairs(Object.Components) do
                            Drawing.Color = color
                        end
                    end
                end
            end
        }
    end
    local DroppedItems = Workspace:FindFirstChild("DroppedItems")
    if DroppedItems then
        ServiceConnections.DroppedItemsAddedConnection = DroppedItems.ChildAdded:Connect(function(Child)
            if Child:IsA("Model") then
                if Child.PrimaryPart and library.flags["espobjectsEnabled"] and library.flags["espobjectsdroppeditemsEnabled"] then
                    ESP:Object(Child, {
                        Type = "Dropped",
                        Color = library.flags["espobjectsdroppeditemsColor"]
                    })
                end
                if objectConnections[Child] == nil then
                    objectConnections[Child] = Child:GetPropertyChangedSignal("PrimaryPart"):Connect(function()
                        if Child.PrimaryPart == nil then
                            local Object = ESP:GetObject(Child)
                            if Object then
                                Object:Destroy()
                            end
                        elseif library.flags["espobjectsEnabled"] and library.flags["espobjectsdroppeditemsEnabled"] then
                            ESP:Object(Child, {
                                Type = "Dropped",
                                Color = library.flags["espobjectsdroppeditemsColor"]
                            })
                        end
                    end)
                end
            end
        end)
        ServiceConnections.DroppedItemsRemovedConnection = DroppedItems.ChildRemoved:Connect(function(Child)
            if Child:IsA("Model") then
                local Object = ESP:GetObject(Child)
                if Object then
                    Object:Destroy()
                end
            end
        end)
        local espobjectsDroppedItems = Sections.Visuals.Objects:Toggle{
            Name = "Dropped Items",
            Flag = "espobjectsdroppeditemsEnabled",
            -- Default = false,
            Callback = function(bool)
                if bool then
                    for _, Item in pairs(DroppedItems:GetChildren()) do
                        ESP:Object(Item, {
                            Type = "Dropped",
                            Color = library.flags["espobjectsdroppeditemsColor"]
                        })
                        if objectConnections[Item] == nil then
                            objectConnections[Item] = Item:GetPropertyChangedSignal("PrimaryPart"):Connect(function()
                                if Item.PrimaryPart == nil then
                                    local Object = ESP:GetObject(Item)
                                    if Object then
                                        Object:Destroy()
                                    end
                                elseif library.flags["espobjectsEnabled"] and library.flags["espobjectsdroppeditemsEnabled"] then
                                    ESP:Object(Item, {
                                        Type = "Dropped",
                                        Color = library.flags["espobjectsdroppeditemsColor"]
                                    })
                                end
                            end)
                        end
                    end
                else
                    for _, Object in pairs(ESP.Objects) do
                        if Object.Type == "Dropped" then
                            Object:Destroy()
                        end
                    end
                end
            end
        }
        espobjectsDroppedItems:ColorPicker{
            Default = Color3.fromRGB(255, 255, 255), 
            Flag = "espobjectsdroppeditemsColor",
            Callback = function(color)
                for _, Object in pairs(ESP.Objects) do
                    if Object.Type == "Dropped" then
                        for _, Drawing in pairs(Object.Components) do
                            Drawing.Color = color
                        end
                    end
                end
            end
        }
    end
    local NoCollision = Workspace:FindFirstChild("NoCollision")
    if NoCollision then
        local ExitLocations = NoCollision:FindFirstChild("ExitLocations")
        if ExitLocations then
            ServiceConnections.ExitLocationsAddedConnection = ExitLocations.ChildAdded:Connect(function(Child)
                if Child:IsA("BasePart") then
                    if library.flags["espobjectsEnabled"] and library.flags["espobjectsextractsEnabled"] then
                        ESP:Object(Child, {
                            Type = "Exit",
                            Color = library.flags["espobjectsextractsColor"]
                        })
                    end
                end
            end)
            ServiceConnections.ExitLocationsRemovedConnection = ExitLocations.ChildRemoved:Connect(function(Child)
                if Child:IsA("BasePart") then
                    local Object = ESP:GetObject(Child)
                    if Object then
                        Object:Destroy()
                    end
                end
            end)
            local espobjectsExtracts = Sections.Visuals.Objects:Toggle{
                Name = "Extracts",
                Flag = "espobjectsextractsEnabled",
                -- Default = false,
                Callback = function(bool)
                    if bool then
                        for _, Item in pairs(ExitLocations:GetChildren()) do
                            if Item:IsA("BasePart") then
                                ESP:Object(Item, {
                                    Type = "Exit",
                                    Color = library.flags["espobjectsextractsColor"]
                                })
                            end
                        end
                    else
                        for _, Object in pairs(ESP.Objects) do
                            if Object.Type == "Exit" then
                                Object:Destroy()
                            end
                        end
                    end
                end
            }
            espobjectsExtracts:ColorPicker{
                Default = Color3.fromRGB(255, 255, 255), 
                Flag = "espobjectsextractsColor",
                Callback = function(color)
                    for _, Object in pairs(ESP.Objects) do
                        if Object.Type == "Exit" then
                            for _, Drawing in pairs(Object.Components) do
                                Drawing.Color = color
                            end
                        end
                    end
                end
            }
        end
    end
    local LockedDoors = Workspace:FindFirstChild("Door")
    if LockedDoors then
        ServiceConnections.LockedDoorsAddedConnection = LockedDoors.ChildAdded:Connect(LPH_NO_VIRTUALIZE(function(Child)
            if Child.Name == "Hinge" then
                if v:FindFirstChild("Unlock") then
                    if library.flags["espobjectsEnabled"] and library.flags["espobjectslockeddoorsEnabled"] then
                        ESP:Object(Child, {
                            Name = "Locked Door",
                            Type = "Locked Door",
                            Color = library.flags["espobjectslockeddoorsColor"]
                        })
                    end
                end
            end
        end))
        ServiceConnections.LockedDoorsRemovedConnection = LockedDoors.ChildRemoved:Connect(LPH_NO_VIRTUALIZE(function(Child)
            if Child:IsA("BasePart") then
                local Object = ESP:GetObject(Child)
                if Object then
                    Object:Destroy()
                end
            end
        end))
        local espobjectsLockedDoors = Sections.Visuals.Objects:Toggle{
            Name = "Locked Doors",
            Flag = "espobjectslockeddoorsEnabled",
            -- Default = false,
            Callback = function(bool)
                if bool then
                    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v.Name == "Hinge" then
                            if v:FindFirstChild("Unlock") then
                                ESP:Object(v, {
                                    Name = "Locked Door",
                                    Type = "Locked Door",
                                    Color = library.flags["espobjectslockeddoorsColor"]
                                })
                            end
                        end
                    end
                else
                    for _, Object in pairs(ESP.Objects) do
                        if Object.Type == "Locked Door" then
                            Object:Destroy()
                        end
                    end
                end
            end
        }
        espobjectsLockedDoors:ColorPicker{
            Default = Color3.fromRGB(255, 255, 255), 
            Flag = "espobjectslockeddoorsColor",
            Callback = function(color)
                for _, Object in pairs(ESP.Objects) do
                    if Object.Type == "Locked Door" then
                        for _, Drawing in pairs(Object.Components) do
                            Drawing.Color = color
                        end
                    end
                end
            end
        }
    end
    local VehiclesUAZ = Workspace:FindFirstChild("Vehicles")
    if VehiclesUAZ then
        ServiceConnections.VehiclesUAZAddedConnection = VehiclesUAZ.ChildAdded:Connect(LPH_NO_VIRTUALIZE(function(Child)
            if Child.Name == "UAZ" then
                if v:FindFirstChild("Body") then
                    if library.flags["espobjectsEnabled"] and library.flags["espobjectsvehiclesEnabled"] then
                        ESP:Object(Child.Body, {
                            Name = "Vehicle",
                            Type = "Vehicle",
                            Color = library.flags["espobjectsvehiclesColor"]
                        })
                    end
                end
            end
        end))
        ServiceConnections.VehiclesUAZRemovedConnection = VehiclesUAZ.ChildRemoved:Connect(LPH_NO_VIRTUALIZE(function(Child)
            if Child:IsA("BasePart") then
                local Object = ESP:GetObject(Child)
                if Object then
                    Object:Destroy()
                end
            end
        end))
        local espobjectsVehicles = Sections.Visuals.Objects:Toggle{
            Name = "Vehicles",
            Flag = "espobjectsvehiclesEnabled",
            -- Default = false,
            Callback = function(bool)
                if bool then
                    for _, v in pairs(game:GetService("Workspace").Vehicles:GetDescendants()) do
                        if v.Name == "UAZ" then
                            if v:FindFirstChild("Body") then
                                ESP:Object(v.Body, {
                                    Name = "Vehicle",
                                    Type = "Vehicle",
                                    Color = library.flags["espobjectsvehiclesColor"]
                                })
                            end
                        end
                    end
                else
                    for _, Object in pairs(ESP.Objects) do
                        if Object.Type == "Vehicle" then
                            Object:Destroy()
                        end
                    end
                end
            end
        }
        espobjectsVehicles:ColorPicker{
            Default = Color3.fromRGB(255, 255, 255), 
            Flag = "espobjectsvehiclesColor",
            Callback = function(color)
                for _, Object in pairs(ESP.Objects) do
                    if Object.Type == "Vehicle" then
                        for _, Drawing in pairs(Object.Components) do
                            Drawing.Color = color
                        end
                    end
                end
            end
        }
    end

    Sections.Visuals.Objects:Slider{
        Name = "Max Distance",
        Text = "[value] m",
        Default = 1000,
        Min = 1,
        Max = 8000,
        Float = 1,
        Flag = "espobjectMaxDistance",
        Callback = function(value)
            ESP.Settings.Object_Maximal_Distance = value
        end
    }
end)()

---------------------------------
    --* INVENTORY VIEWER *--
---------------------------------
InventoryViewer = {
    Size = Vector2.new(300, 14), 
    
    Main = Framework:Draw("Square", {Thickness = 0, Size = Vector2.new(300, 14), Filled = true, Position = Vector2.new(100, 100), Color = library.flags["Tab Background"], Visible = false}),
    Border = Framework:Draw("Square", {Thickness = 2, Size = Vector2.new(301, 15), Filled = false, Position = Vector2.new(100, 100), Color = library.flags["Window Background"], Visible = false}),

    Texts = {}
}

LPH_NO_VIRTUALIZE(function()
    function InventoryViewer:Clear()
        for i, v in pairs(self.Texts) do
            v:Remove()
            self.Texts[i] = nil
            self.Main.Size = self.Size
        end
    end

    function InventoryViewer:AddText(Text, Tabulated, Main_Text)
        local Main = self.Main
        local Border = self.Border
        local Drawing = Framework:Draw("Text", {Text = Text, Color = Color3.new(1, 1, 1), Transparency = 1, Size = 13, Font = 2, Outline = true, Visible = true})
        table.insert(self.Texts, Drawing)
        
        local Drawings = #self.Texts
        Main.Size = Vector2.new(self.Size.X, 14 * Drawings)
        Border.Size = Main.Size + Vector2.new(1, 1)
        Drawing.Position = Main.Position + Vector2.new(5, (Drawings - 1) * 14)
        if Main_Text then
            Drawing.Color = Color3.fromRGB(0,235,0)
            Drawing.Center = true
            Drawing.Position = Main.Position + Vector2.new(Main.Size.X / 2, 3)
        end
        if Tabulated then
            Drawing.Position = Main.Position + Vector2.new(20, (Drawings - 1) * 14)
        end
        return Drawing
    end

    function InventoryViewer:Update()
        self.Size = Vector2.new(300, 14)
        local DroppedItems = Workspace:FindFirstChild("DroppedItems")
        local Scan, Containers, _Players, _DeadBodys = {}, table.find(library.flags["inventoryscannerInventoryToScan"], "Containers") , table.find(library.flags["inventoryscannerInventoryToScan"], "Players"), table.find(library.flags["inventoryscannerInventoryToScan"], "Dead Bodys")
        if Containers then
            for i, v in pairs(Workspace.Containers:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Inventory") then
                    table.insert(Scan, v)
                end
            end
        end
        if _Players then
            for i, v in pairs(plrs:GetPlayers()) do
                if v ~= plr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChildOfClass("Humanoid") then
                    table.insert(Scan, v.Character)
                end
            end
        end
        if _DeadBodys then
            for i, v in pairs(Workspace.DroppedItems:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChild("Inventory") then
                    table.insert(Scan, v)
                end
            end
        end
        local DroppedItemsEnabled2 = false
        local Target, lowMagnitude = nil, Camera.ViewportSize.X / 2
        for i, v in pairs(Scan) do
            local PrimaryPart = v.PrimaryPart
            if PrimaryPart then
                local Vector, onScreen = Camera:WorldToViewportPoint(PrimaryPart.Position)
                if onScreen then
                    local Magnitude = (Camera.ViewportSize / 2 - Framework:V3_To_V2(Vector)).Magnitude
                    if Magnitude <= lowMagnitude then
                        lowMagnitude = Magnitude
                        Target = v
                    end
                end
            end
        end
        if not Target then
            self:Clear()
            self:AddText("Inventory Viewer", false, true)
            task.wait(library.flags["inventoryscannerUpdateRate"])
            return
        end
        local MainText = nil
        local Humanoid = Target:FindFirstChildOfClass("Humanoid")
        self:Clear()
        local TotalRubleValue = 0
        if DroppedItemsEnabled2 then
            if Humanoid then
                for i, v in pairs(repStorage.Players[Target.Name]:GetDescendants()) do
                    if v:IsA("StringValue") then
                        e = repStorage.ItemsListLocal:FindFirstChild(v.Name)
                        if e ~= nil then
                            price = e:GetAttribute("Price")
                            if price ~= nil then
                                TotalRubleValue = TotalRubleValue + tonumber(price)
                            end
                        end
                    end
                end
                MainText = self:AddText(Target.Name .. " | Dead Body | Ruble Value: [" .. TotalRubleValue .. "]", false, true)
            else
                MainText = self:AddText(Target.Name .. "Dead Body", false, true)
            end
        else
            if Humanoid then
                for i, v in pairs(repStorage.Players[Target.Name]:GetDescendants()) do
                    if v:IsA("StringValue") then
                        e = repStorage.ItemsListLocal:FindFirstChild(v.Name)
                        if e ~= nil then
                            price = e:GetAttribute("Price")
                            if price ~= nil then
                                TotalRubleValue = TotalRubleValue + tonumber(price)
                            end
                        end
                    end
                end
                MainText = self:AddText(Target.Name .. " | Ruble Value: [" .. TotalRubleValue .. "]", false, true)
            else 
                MainText = self:AddText(Target.Name, false, true)
            end
        end
        self:AddText("", false, false)
        Scan = {}
        local Maximal_X = 0
        if Humanoid then
            local Folder = repStorage:FindFirstChild("Players")[Target.Name]
            if Folder then
                table.insert(Scan, Folder.Inventory)
                table.insert(Scan, Folder.Clothing)
                DroppedItemsEnabled2 = false
            else
                local Folder = Workspace:FindFirstChild("DroppedItems")[Target.Name]
                if Folder then
                    table.insert(Scan, Folder.Inventory)
                    table.insert(Scan, Folder.Clothing)
                    DroppedItemsEnabled2 = true
                end
            end
            for i, v in pairs(Scan) do
                local Name = v.Name
                if Name == "Inventory" then
                    for _, Item in pairs(v:GetChildren()) do
                        local ItemProperties = Item:FindFirstChild("ItemProperties")
                        if ItemProperties then
                            local ammoString = ""
                            local isGun = false
                            local ItemType = ItemProperties:GetAttribute("ItemType")
                            if ItemType and ItemType == "RangedWeapon" then
                                isGun = true
                                local Attachments = Item:FindFirstChild("Attachments")
                                if Attachments then
                                    local Magazine = Attachments:FindFirstChild("Magazine")
                                    if Magazine then
                                        Magazine = Magazine:FindFirstChildOfClass("StringValue")
                                        if Magazine then
                                            local MagazineProperties = Magazine:FindFirstChild("ItemProperties")
                                            if MagazineProperties then
                                                local LoadedAmmo = MagazineProperties:FindFirstChild("LoadedAmmo")
                                                if LoadedAmmo then
                                                    for _, Slot in pairs(LoadedAmmo:GetChildren()) do
                                                        local Amount = Slot:GetAttribute("Amount")
                                                        if tonumber(Amount) > 0 then
                                                            ammoString = ammoString .. Amount
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            if ammoString == "" and isGun == false then
                                self:AddText(Item.Name)
                            elseif ammoString == "" then
                                local HotbarDrawing = self:AddText(Item.Name .. " [OUT OF AMMO]")
                                local textBoundsX = HotbarDrawing.TextBounds.X
                                if textBoundsX > Maximal_X then
                                    Maximal_X = textBoundsX
                                end
                                if Maximal_X > self.Size.X then
                                    self.Size = Vector2.new(Maximal_X + 10, self.Main.Size.Y)
                                    self.Main.Size = self.Size
                                    MainText.Position = self.Main.Position + Vector2.new(self.Main.Size.X / 2, 0)
                                end
                            else
                                ammoString = ammoString:sub(0, ammoString:len() - 2)
                                local HotbarDrawing = self:AddText(Item.Name .. " ["..ammoString.."]")
                                local textBoundsX = HotbarDrawing.TextBounds.X
                                if textBoundsX > Maximal_X then
                                    Maximal_X = textBoundsX
                                end
                                if Maximal_X > self.Size.X then
                                    self.Size = Vector2.new(Maximal_X + 10, self.Main.Size.Y)
                                    self.Main.Size = self.Size
                                    MainText.Position = self.Main.Position + Vector2.new(self.Main.Size.X / 2, 0)
                                end
                            end
                        else
                            self:AddText(Item.Name)
                        end
                    end
                    self:AddText("", false, false)

                elseif Name == "Clothing" then
                    for _, Clothing in pairs(v:GetChildren()) do
                        -- Clothing
                        local Attachments = Clothing:FindFirstChild("Attachments")
                        local attachmentString = ""
                        if Attachments then
                            for _, Slot in pairs(Attachments:GetChildren()) do
                                local Attachment = Slot:FindFirstChildOfClass("StringValue")
                                if Attachment then
                                    attachmentString = attachmentString .. Attachment.Name .. "; "
                                end
                            end
                        end
                        attachmentString = attachmentString:sub(0, attachmentString:len() - 2)
                        if attachmentString == "" then
                            local ClothingDrawing = self:AddText(Clothing.Name)
                            ClothingDrawing.Color = Color3.fromRGB(255, 153, 51)
                        else
                            local ClothingDrawing = self:AddText(Clothing.Name .. " [".. attachmentString .."]")
                            ClothingDrawing.Color = Color3.fromRGB(255, 153, 51)
                            local textBoundsX = ClothingDrawing.TextBounds.X
                            if textBoundsX > Maximal_X then
                                Maximal_X = textBoundsX
                            end
                            if Maximal_X > self.Size.X then
                                self.Size = Vector2.new(Maximal_X + 10, self.Main.Size.Y)
                                self.Main.Size = self.Size
                                MainText.Position = self.Main.Position + Vector2.new(self.Main.Size.X / 2, 0)
                            end
                        end

                        -- Clothing Inventory
                        local Inventory = Clothing:FindFirstChild("Inventory")
                        if Inventory then
                            for _, Item in pairs(Inventory:GetChildren()) do
                                local ItemProperties = Item:FindFirstChild("ItemProperties")
                                
                                if ItemProperties then
                                    local Amount = ItemProperties:GetAttribute("Amount")
                                    if Amount then
                                        if Amount > 1 then
                                            if Item.Name == "Rubles" then
                                                local RublesDrawing = self:AddText(Item.Name .. " [" .. tostring(Amount) .. "]", true)
                                                RublesDrawing.Color = Color3.fromRGB(0, 255, 0)
                                            else
                                                self:AddText(Item.Name .. " [" .. tostring(Amount) .. "]", true)
                                            end
                                        else
                                            self:AddText(Item.Name, true)
                                        end
                                    else
                                        self:AddText(Item.Name, true)
                                    end
                                else
                                    self:AddText(Item.Name, true)
                                end
                            end
                        end
                    end
                end
            end
        else
            local Inventory = Target:FindFirstChild("Inventory")
            if Inventory then
                for _, Item in pairs(Inventory:GetChildren()) do
                    local ItemProperties = Item:FindFirstChild("ItemProperties")
                    if ItemProperties then
                        local Amount = ItemProperties:GetAttribute("Amount")
                        if Amount then
                            if Amount > 1 then
                                self:AddText(Item.Name .. " [" .. tostring(Amount) .. "]")
                            else
                                self:AddText(Item.Name)
                            end
                        else
                            self:AddText(Item.Name)
                        end
                    else
                        self:AddText(Item.Name)
                    end
                end
            end
        end
    end

    InventoryViewer.__index = InventoryViewer
    local InventoryViewerToggle = false
    local invViewer, canUpdate = nil, true

    local InventoryViewerToggleBtn = Sections.Visuals.InventoryScanner:Toggle{
        Name = "Enabled",
        Flag = "inventoryscannerEnabled",
        -- Default = false,
        Callback = function(bool)

        end
    }
    InventoryViewerToggleBtn:Keybind{
        Default = Enum.KeyCode.Y,
        Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
        Flag = "inventoryscannerKeybind",
        Mode = "nill", -- mode to nil if u dont want it to toggle the toggle
        Callback = function(key, fromsetting)
            if library.flags["inventoryscannerEnabled"] then
                local key = tostring(key):gsub("Enum.KeyCode.", "")
                InventoryViewerKeybind.Text = "Inventorys   [" .. key .. "]"
            end

            if not fromsetting then
                InventoryViewerToggle = not InventoryViewerToggle
                if InventoryViewerToggle and library.flags["inventoryscannerEnabled"] then
                    InventoryViewerKeybind.Color = Color3.fromRGB(0, 255, 0)
                    if invViewer ~= nil then
                        invViewer:Disconnect()
                    end
                    invViewer = rs.Heartbeat:Connect(function()
                        if not canUpdate then return end
                        canUpdate = false
                        InventoryViewer:Update()
                        task.wait(library.flags["inventoryscannerUpdateRate"])
                        canUpdate = true
                    end)
                    InventoryViewer.Main.Visible = true
                    InventoryViewer.Border.Visible = true
                else
                    InventoryViewerKeybind.Color = Color3.fromRGB(255, 255, 255)
                    if invViewer ~= nil then
                        invViewer:Disconnect()
                    end
                    for i, v in pairs(InventoryViewer.Texts) do
                        v:Remove()
                        InventoryViewer.Texts[i] = nil
                        InventoryViewer.Main.Size = InventoryViewer.Size
                    end

                    InventoryViewer.Main.Visible = false
                    InventoryViewer.Border.Visible = false
                end
            end
        end
    }
    Sections.Visuals.InventoryScanner:Slider{
        Name = "Update Rate",
        Text = "[value] s",
        Default = 1,
        Min = 0,
        Max = 3,
        Float = 0.01,
        Flag = "inventoryscannerUpdateRate",
        Callback = function(value)
            
        end
    }
    Sections.Visuals.InventoryScanner:Slider{
        Name = "Frame X Pos",
        Text = "X Position: [value]",
        Default = 100,
        Min = 0,
        Max = Camera.ViewportSize.X - 300,
        Float = 1,
        Flag = "inventoryscannerFrameXPos",
        Callback = function(value)
            InventoryViewer.Main.Position = Vector2.new(value, InventoryViewer.Main.Position.Y)
            InventoryViewer.Border.Position = Vector2.new(value, InventoryViewer.Border.Position.Y)
        end
    }
    Sections.Visuals.InventoryScanner:Slider{
        Name = "Frame Y Pos",
        Text = "Y Position: [value]",
        Default = 100,
        Min = 0,
        Max = Camera.ViewportSize.Y,
        Float = 1,
        Flag = "inventoryscannerFrameYPos",
        Callback = function(value)
            InventoryViewer.Main.Position = Vector2.new(InventoryViewer.Main.Position.X, value)
            InventoryViewer.Border.Position = Vector2.new(InventoryViewer.Border.Position.X, value)
        end
    }
    Sections.Visuals.InventoryScanner:Dropdown{
        Name = "Inventory To Scan",
        Default = {"Players", "Dead Bodys"},
        Max = 3, -- makes it multi
        Content = {
            "Players",
            "Containers",
            "Dead Bodys",
        },
        Flag = "inventoryscannerInventoryToScan",
        Callback = function(option)
            
        end
    }
end)()

--* Free Camera *--
Sections.Visuals.FreeCamera:Button{
    Name = "Enabled - Shift + P",
    Callback  = function()
        loadstring(game:HttpGet("https://cdn.sourceb.in/bins/6EO5uNsj0k/0"))()
    end
}

-- * Lighting * --
Sections.Misc.Lighting:Dropdown{
    Name = "Sky",
    Default = "Standard",
    Content = {"Standard", "Among Us", "Neptune", "Aesthetic Night", "Redshift"},
    Flag = "skyboxEnabled",
    Callback = function(option)
        for Index, Asset in pairs(SkyBoxes[option]) do
            Sky[Index] = Asset
        end
    end
}
Sections.Misc.Lighting:Toggle{
    Name = "Full Bright",
    Flag = "fullbrightEnabled",
    -- Default = false,
    Callback = function(bool)
        if bool then
            lighting.Ambient = Color3.fromRGB(255, 255, 255)
            lighting.Brightness = 1
            lighting.FogEnd = 1e10
            lighting.ClockTime = 12
            for i, v in pairs(lighting:GetDescendants()) do
                if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
                    v.Enabled = false
                end
            end
        else
            lighting.Ambient = Old_Lighting.Ambient
            lighting.Brightness = Old_Lighting.Brightness
            lighting.FogEnd = Old_Lighting.FogEnd
            lighting.ClockTime = Old_Lighting.ClockTime
        end
    end
}
ServiceConnections.LightingConnection = lighting.Changed:Connect(function()
    if library.flags["fullbrightEnabled"] then
        lighting.Ambient = Color3.fromRGB(255, 255, 255)
        lighting.Brightness = 1
        lighting.FogEnd = 1e10
    end
end)
task.spawn(function()
    while library.flags["fullbrightEnabled"] do
        local character = plr.Character
        repeat wait() until character ~= nil
        if not character.HumanoidRootPart:FindFirstChildWhichIsA("PointLight") and library.flags["fullbrightEnabled"] then
            local headlight = Instance.new("PointLight", character.HumanoidRootPart)
            headlight.Brightness = 1
            headlight.Range = 60
        else
            if character.HumanoidRootPart:FindFirstChildWhichIsA("PointLight") and not library.flags["fullbrightEnabled"] then
                character.HumanoidRootPart:FindFirstChildWhichIsA("PointLight"):Destroy()
            end
        end
    end
end)
local AmbientLighting = Sections.Misc.Lighting:Toggle{
    Name = "Ambient",
    Flag = "ambientlightingEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
AmbientLighting:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "ambientlightingColor",
    Callback = function(color)
        if library.flags["ambientlightingEnabled"] then
            lighting.Ambient = color
        else
            lighting.Ambient = Old_Lighting.Ambient
        end
    end
}
Sections.Misc.Lighting:Slider{
    Name = "Brightness",
    Text = "[value]/10",
    Default = 3,
    Min = 1,
    Max = 10,
    Float = 0.1,
    Flag = "brightnessValue",
    Callback = function(value)
        lighting.Brightness = value
    end
}

-- * Removals * --
Sections.Misc.Removals:Button{
    Name = "Land Mines",
    Callback  = function()
        for i, v in pairs(Workspace.AiZones.OutpostLandmines:GetChildren()) do
            v:Destroy()
        end
    end
}
Sections.Misc.Removals:Toggle{
    Name = "Strip Name From Chat",
    Flag = "removeKilledBy"
}
Sections.Misc.Removals:Toggle{
    Name = "Ambient Sounds",
    Flag = "noambientsoundsEnabled",
    Callback  = function(bool)
        for i, v in pairs(game:GetService("Workspace").AmbientSounds:GetDescendants()) do
            if v:IsA("Sound") then
                if bool then
                    v.Volume = 0
                else
                    v.Volume = 2
                end
            end
        end
    end
}
Sections.Misc.Removals:Toggle{
    Name = "Anti Drown",
    Flag = "antidrownEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
Sections.Misc.Removals:Toggle{
    Name = "Camera Bob",
    Flag = "nocamerabobEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
local MainGui = plr.PlayerGui:FindFirstChild("MainGui")
if MainGui then 
    local MainFrame = MainGui:FindFirstChild("MainFrame")
    if MainFrame then 
        ScreenEffects = MainFrame:FindFirstChild("ScreenEffects")
        Visor = ScreenEffects:FindFirstChild("Visor")
        if Visor then
            Sections.Misc.Removals:Toggle{
                Name = "Visor",
                Flag = "novisorEnabled",
                -- Default = false,
                Callback = function(bool)
                    if Visor.Visible and bool then
                        Visor.Visible = false
                    else
                        Visor.Visible = true
                    end
                end
            }
        end
    end
end
local MainGui = plr.PlayerGui:FindFirstChild("MainGui")
if MainGui then 
    local MainFrame = MainGui:FindFirstChild("MainFrame")
    if MainFrame then 
        ScreenEffects = MainFrame:FindFirstChild("ScreenEffects")
        FlashBang = ScreenEffects:FindFirstChild("Flashbang")
        if FlashBang then
            Sections.Misc.Removals:Toggle{
                Name = "Anti Flashbang",
                Flag = "antiflashbangEnabled",
                -- Default = false,
                Callback = function(bool)
                    if bool then
                        repStorage.SFX.Explosions.Flashbang.Volume = 0
                        ScreenEffects.Flashbang.Size = UDim2.new(0, 0, 0, 0)
                    else
                        repStorage.SFX.Explosions.Flashbang.Volume = 10
                        ScreenEffects.Flashbang.Size = UDim2.new(1, 0, 1, 0)
                    end
                end
            }
        end
    end
end
Sections.Misc.Removals:Toggle{
    Name = "Server Information",
    Flag = "noserverinfoEnabled",
    -- Default = false,
    Callback = function(bool)
        for i,v in pairs(plr.PlayerGui.PerformanceMonitor2:GetChildren()) do
            if v:IsA("TextLabel") then
                v.Visible = not bool
            end
        end
    end
}
Sections.Misc.Removals:Separator("World")
local waterBlur = lighting:WaitForChild("WaterBlur")
Sections.Misc.Removals:Toggle{
    Name = "Water Blur",
    Flag = "nowaterblurEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
local Atmosphere = lighting:FindFirstChildOfClass("Atmosphere")
if Atmosphere then
    Sections.Misc.Removals:Toggle{
        Name = "Atmosphere",
        Flag = "noatmosphereEnabled",
        -- Default = false,
        Callback = function(bool)
            if library.flags["fullbrightEnabled"] then
                Atmosphere.Parent = bool and cgui or lighting
            end
        end
    }
end
Sections.Misc.Removals:Toggle{
    Name = "Grass",
    Flag = "nograssEnabled",
    -- Default = false,
    Callback = function(bool)
        sethiddenproperty(Terrain, "Decoration", not bool)
    end
}
local Clouds = Terrain:FindFirstChildOfClass("Clouds")
if Clouds then
    Sections.Misc.Removals:Toggle{
        Name = "Clouds",
        Flag = "nocloudsEnabled",
        -- Default = false,
        Callback = function(bool)
            Clouds.Parent = bool and cgui or Terrain
        end
    }
end
local leafTable = {}
Sections.Misc.Removals:Toggle{
    Name = "Foliage",
    Flag = "nofoliageEnabled",
    -- Default = false,
    Callback = function(bool)
        if bool then
            for i, v in next, ws.SpawnerZones.Foliage:GetDescendants() do
                if v:IsA("MeshPart") and v.TextureID == "" then
                    leafTable[i] = {
                        Part = v,
                        Old = v.Parent
                    }
                    v.Parent = cgui
                end
            end
        else
            pcall(function()
                for i, v in pairs(leafTable) do
                    v.Part.Parent = v.Old
                end
                leafTable = {}
            end)
        end
    end
}

--* Misc *--
local UnlockDoorToggled = false
local dwUnlockDoor = Sections.Misc.Misc:Toggle{
    Name = "Unlock Closest Door Keybind",
    Flag = "unlockdoorEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
dwUnlockDoor:Keybind{
    Default = Enum.KeyCode.O,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Flag = "unlockdoorKeybind",
    Mode = "nill", -- mode to nil if u dont want it to toggle the toggle
    Callback = function(key, fromsetting)
        if library.flags["unlockdoorEnabled"] then
            local key = tostring(key):gsub("Enum.KeyCode.", "")
            UnlockDoorKeybind.Text = "Unlock Door  [" .. key .. "]"
        end
        if not fromsetting then
            UnlockDoorToggled = not UnlockDoorToggled
            if UnlockDoorToggled and library.flags["unlockdoorEnabled"] then
                UnlockDoorKeybind.Color = Color3.fromRGB(0, 255, 0)
                local last = 5
                local closest = nil
                for _, door in pairs(ws:GetChildren()) do
                    if door:IsA("Model") then
                        if door:GetAttribute("KeyDoor") and door:FindFirstChild("Main") then
                            if (door:GetPivot().Position - plr.Character:GetPivot().Position).Magnitude <= last then
                                last = (door:GetPivot().Position - plr.Character:GetPivot().Position).Magnitude
                                closest = door
                            end
                        end
                    end
                end
                if closest then
                    local unit = (closest.Main.Position - plr.Character.HumanoidRootPart.Position).Unit

                    for i = 1,20 do
                        plr.Character.HumanoidRootPart.CFrame = CFrame.new(closest.Main.Position + unit * 3)
                        repStorage.Remotes.Door:FireServer(closest, 1, closest:GetPivot().Position);
                        task.wait(0.05)
                    end

                    UnlockDoorKeybind.Color = Color3.fromRGB(255, 255, 255)
                    UnlockDoorToggled = false
                else
                    UnlockDoorKeybind.Color = Color3.fromRGB(255, 255, 255)
                    UnlockDoorToggled = false
                end
            else
                UnlockDoorKeybind.Color = Color3.fromRGB(255, 255, 255)
            end
        end
    end
}

--* Chat Spammer *--
Sections.Misc.ChatSpammer:Toggle{
    Name = "Chat Spammer Enabled",
    Flag = "chatmessageEnabled",
    Callback = function(bool) 
        
    end
}
local Chatmessage = Sections.Misc.ChatSpammer:Box{
    Name = "Message",
    Placeholder = "Enter Message Here",
    Flag = "chatMessage",
}
Sections.Misc.ChatSpammer:Slider{
    Name = "Delay",
    Text = "[value] s",
    Default = 2,
    Min = 2,
    Max = 10,
    Float = 0.1,
    Flag = "chatmessageDelay",
    Callback = function(value)
        
    end
}
task.spawn(function()
    LPH_NO_VIRTUALIZE(function()
        while task.wait(library.flags["chatmessageDelay"]) do
            if library.flags["chatmessageEnabled"] then
                local args = {
                    [1] = tostring(library.flags["chatMessage"]),
                    [2] = "Global"
                }
                repStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            end
        end
    end)()
end)
Sections.Misc.ChatSpammer:Button{
    Name = "Chat Bypass",
    Callback = function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/daddysyn/synergy/additional/betterbypasser", true))()
    end
}



-- * Local Player Mods * --
local WalkSpeedKeybindToggledOld = false
local HipHeightToggled = false
LPH_NO_VIRTUALIZE(function()
    local gmt = getrawmetatable(game)
    setreadonly(gmt, false)
    local oldindex = gmt.__index
    gmt.__index = newcclosure(function(self,b)
        if b == "WalkSpeed" and library.flags["walkspeedEnabledOld"] and WalkSpeedKeybindToggledOld then 
            plr.Character.Humanoid.WalkSpeed = library.flags["walkspeedValueOld"]
            return 10
        end 
        if b == "HipHeight" and library.flags["hipheightEnabled"] and HipHeightToggled then
            plr.Character.Humanoid.HipHeight = library.flags["hipheightValue"]
            return 2
        end
        return oldindex(self, b)
    end)
end)()

Sections.Misc.LocalPlayer:Toggle{
    Name = "Remove Player Tilt",
    Flag = "noplayertiltEnabled"
}
local dwJumpPower = Sections.Misc.LocalPlayer:Toggle{
    Name = "Jump Height",
    Flag = "jumppowerEnabled",
    Risky = true,
    Callback = function(bool)
        if not bool then
            plr.Character.Humanoid.JumpHeight = 2
        end
    end
}
dwJumpPower:Slider{
    Text = "Height: [value]/8",
    Default = 0,
    Min = 0,
    Max = 8,
    Float = 0.01,
    Flag = "jumppowerValue",
    Callback = function(value)
    end
}
local dwHipHeight = Sections.Misc.LocalPlayer:Toggle{
    Name = "Hip Height",
    Flag = "hipheightEnabled",
    -- Default = false,
    Callback = function(bool)
        if not bool then
            plr.Character.Humanoid.HipHeight = 2
        end
    end
}
dwHipHeight:Keybind{
    Default = Enum.KeyCode.L,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Flag = "hipheightKeybinded",
    Mode = "nill", -- mode to nil if u dont want it to toggle the toggle
    Callback = function(key, fromsetting)
        if library.flags["hipheightEnabled"] then
            local key = tostring(key):gsub("Enum.KeyCode.", "")
            HipHeightKeybind.Text = "Hip Height   [" .. key .. "]"
        end
        if not fromsetting then
            HipHeightToggled = not HipHeightToggled
            if HipHeightToggled and library.flags["hipheightEnabled"] then
                HipHeightKeybind.Color = Color3.fromRGB(0, 255, 0)
                plr.Character.Humanoid.HipHeight = library.flags["hipheightValue"]
            else
                HipHeightKeybind.Color = Color3.fromRGB(255, 255, 255)
                plr.Character.Humanoid.HipHeight = 2
            end
        end
    end
}
dwHipHeight:Slider{
    Text = "Height: [value]/7.5",
    Default = 2,
    Min = 2,
    Max = 7.5,
    Float = 0.001,
    Flag = "hipheightValue",
    Callback = function(value)
    end
}
local dwWalkSpeed = Sections.Misc.LocalPlayer:Toggle{
    Name = "Player Speed",
    Flag = "walkspeedEnabledOld"
}
dwWalkSpeed:Keybind{
    Default = Enum.KeyCode.C,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Flag = "walkspeedKeybindOld",
    Mode = "nill", -- mode to nil if u dont want it to toggle the toggle
    Callback = function(key, fromsetting)
        if library.flags["walkspeedEnabledOld"] then
            local key = tostring(key):gsub("Enum.KeyCode.", "")
            WalkspeedKeybindOld.Text = "Walk Speed   [" .. key .. "]"
        end
        if not fromsetting then
            WalkSpeedKeybindToggledOld = not WalkSpeedKeybindToggledOld
            if WalkSpeedKeybindToggledOld and library.flags["walkspeedEnabledOld"] then
                WalkspeedKeybindOld.Color = Color3.fromRGB(0, 255, 0)
            else
                WalkspeedKeybindOld.Color = Color3.fromRGB(255, 255, 255)
            end
        end
    end
}
dwWalkSpeed:Slider{
    Text = "Speed: [value]/50",
    Default = 10,
    Min = 10,
    Max = 50,
    Float = 0.5,
    Flag = "walkspeedValueOld",
    Callback = function(value)
    end
}
local ThirdPersonToggled = false
local dwThirdPerson = Sections.Misc.LocalPlayer:Toggle{
    Name = "Third Person",
    Flag = "thirdpersonEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
dwThirdPerson:Keybind{
    Default = Enum.KeyCode.N,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Flag = "thirdpersonKeybinded",
    Mode = "nill", -- mode to nil if u dont want it to toggle the toggle
    Callback = function(key, fromsetting)
        if library.flags["thirdpersonEnabled"] then
            local key = tostring(key):gsub("Enum.KeyCode.", "")
            ThirdPersonKeybind.Text = "Third Person [" .. key .. "]"
        end
        if not fromsetting then
            ThirdPersonToggled = not ThirdPersonToggled
            if ThirdPersonToggled and library.flags["thirdpersonEnabled"] then
                ThirdPersonKeybind.Color = Color3.fromRGB(0, 255, 0)
                local Checkkkk = game:GetService("Workspace").Camera:FindFirstChild("ViewModel")
                if Checkkkk then
                    for i,v in pairs(game:GetService("Workspace").Camera.ViewModel:GetChildren()) do
                        if v.ClassName == "MeshPart" then
                            if v.Parent.Name == "WastelandShirt" or v.Parent.Name == "GhillieTorso" or v.Parent.Name == "CivilianPants" or v.Parent.Name == "CamoShirt" or v.Parent.Name == "HandWraps" or v.Parent.Name == "CombatGloves" then
                                v.Transparency = 1
                            end
                        end
                        if v.ClassName == "MeshPart" then
                            if v.Name == "LeftHand" or v.Name == "LeftLowerArm" or v.Name == "LeftUpperArm" or v.Name == "RightHand" or v.Name == "RightLowerArm" or v.Name == "RightUpperArm" then
                                v.Transparency = 1
                            end
                        end
                        if v.ClassName == "Part" then
                            if v.Name == "AimPartCanted" or v.Name == "AimPart" then
                                v.Transparency = 1
                            end
                        end
                    end
                    for i,v in pairs(game:GetService("Workspace").Camera.ViewModel.Item:GetDescendants()) do
                        if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                            v.Transparency = 1
                        end
                    end
                end
            else
                local Checkkkk = game:GetService("Workspace").Camera:FindFirstChild("ViewModel")
                if Checkkkk then
                    for i,v in pairs(game:GetService("Workspace").Camera.ViewModel:GetChildren()) do
                        if v.ClassName == "MeshPart" then
                            if v.Parent.Name == "WastelandShirt" or v.Parent.Name == "GhillieTorso" or v.Parent.Name == "CivilianPants" or v.Parent.Name == "CamoShirt" or v.Parent.Name == "HandWraps" or v.Parent.Name == "CombatGloves" then
                                v.Transparency = 0
                            end
                        end
                        if v.ClassName == "MeshPart" then
                            if v.Name == "LeftHand" or v.Name == "LeftLowerArm" or v.Name == "LeftUpperArm" or v.Name == "RightHand" or v.Name == "RightLowerArm" or v.Name == "RightUpperArm" then
                                v.Transparency = 0
                            end
                        end
                        if v.ClassName == "Part" then
                            if v.Name == "AimPartCanted" or v.Name == "AimPart" then
                                v.Transparency = 0
                            end
                        end
                    end
                    for i,v in pairs(game:GetService("Workspace").Camera.ViewModel.Item:GetDescendants()) do
                        if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                            v.Transparency = 0
                        end
                    end
                end
                ThirdPersonKeybind.Color = Color3.fromRGB(255, 255, 255)
            end
        end
    end
}
dwThirdPerson:Slider{
    Text = "Distance: [value]/20",
    Default = 5,
    Min = 0,
    Max = 20,
    Float = 0.001,
    Flag = "thirdpersonValue",
    Callback = function(value)
        
    end
}
Sections.Misc.LocalPlayer:Separator("Camera Settings")
local FovZoomEnabled = false
local dwFOVZoom = Sections.Misc.LocalPlayer:Toggle{
    Name = "Camera FOV Zoom",
    Flag = "cameraFOVZoomEnabled",
    -- Default = false,
    Callback = function(bool)
        if not bool then
            if Camera.FieldOfView ~= Old_FOV then
                Camera.FieldOfView = Old_FOV
                FovZoomEnabled = false
            end
        end
    end
}
dwFOVZoom:Keybind{
    Default = Enum.KeyCode.X,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Flag = "cameraFOVZoomKeybind",
    Mode = "nill", -- mode to nil if u dont want it to toggle the toggle
    Callback = function(key, fromsetting)
        if library.flags["cameraFOVZoomEnabled"] then
            local key = tostring(key):gsub("Enum.KeyCode.", "")
            CameraZoomKeybind.Text = "Camera Zoom  [" .. key .. "]"
        end
        if not fromsetting then
            FovZoomEnabled = not FovZoomEnabled
            if library.flags["cameraFOVZoomEnabled"] and FovZoomEnabled then
                CameraZoomKeybind.Color = Color3.fromRGB(0, 255, 0)
                Camera.FieldOfView = library.flags["cameraFOVZoomValue"]
            else
                CameraZoomKeybind.Color = Color3.fromRGB(255, 255, 255)
                Camera.FieldOfView = Old_FOV
            end
        end
    end
}
dwFOVZoom:Slider{
    Text = "Distance: [value]/120",
    Default = 15,
    Min = 1,
    Max = 120,
    Float = 1,
    Flag = "cameraFOVZoomValue",
    Callback = function(value)
    end
}
local dwFOV = Sections.Misc.LocalPlayer:Toggle{
    Name = "Camera FOV",
    Flag = "cameraFOVEnabled",
    -- Default = false,
    Callback = function(bool)
        if not bool then
            Camera.FieldOfView = Old_FOV
        end
    end
}
dwFOV:Slider{
    Text = "Distance: [value]/120",
    Default = 90,
    Min = 1,
    Max = 120,
    Float = 1,
    Flag = "cameraFOVValue",
    Callback = function(value)
        if library.flags["cameraFOVEnabled"] then
            Camera.FieldOfView = value
        end
    end
}
local FakeLagEnabled = false
local NetworkClient = game:GetService("NetworkClient")
local VisualizeLagFolder
Sections.Misc.LocalPlayer:Separator("Fake Lag")
local dwVisualizeFakeLag = Sections.Misc.LocalPlayer:Toggle{
    Name = "Visualize Fake Lag",
    Flag = "visualizefakelagEnabled",
    -- Default = false,
    Callback = function(bool)
        if not bool then
            task.spawn(function()
                LPH_NO_VIRTUALIZE(function()
                    task.wait()
                    VisualizeLagFolder:ClearAllChildren()
                end)()
            end)
        end
    end
}
dwVisualizeFakeLag:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "visualizefakelagColor",
    Callback = function(color)
        
    end
}
VisualizeLagFolder = Framework:Instance("Folder", {Parent = Camera})
local dwFakeLag = Sections.Misc.LocalPlayer:Toggle{
    Name = "Fake Lag",
    Flag = "fakelagEnabled",
    -- Default = false,
    Callback = function(bool)
        if not bool then
            task.spawn(function()
                LPH_NO_VIRTUALIZE(function()
                    task.wait()
                    NetworkClient:SetOutgoingKBPSLimit(999999999999999999999999999)
                    VisualizeLagFolder:ClearAllChildren()
                end)()
            end)
        end
    end
}
dwFakeLag:Keybind{
    Default = Enum.KeyCode.C,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Flag = "fakelagKeybind",
    Mode = "nill", -- mode to nil if u dont want it to toggle the toggle
    Callback = function(key, fromsetting)
        if not fromsetting then
            FakeLagEnabled = not FakeLagEnabled
        end
    end
}
dwFakeLag:Slider{
    Text = "Ticks: [value]/100",
    Default = 0,
    Min = 0,
    Max = 100,
    Float = 1,
    Flag = "fakelagLimit",
    Callback = function(value)
    end
}
local Tick = 0
local sec = nil
local FPS = {}
sec = tick()
ServiceConnections.CameraConnection = Camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
    if library.flags["cameraFOVZoomEnabled"] and FovZoomEnabled then
        Camera.FieldOfView = library.flags["cameraFOVZoomValue"]
        return
    end
    if library.flags["cameraFOVEnabled"] then
        Camera.FieldOfView = library.flags["cameraFOVValue"]
    end
end)

Sections.Misc.Misc:Separator("LocalPlayer Chams")

--* LocalPlayer Chams *--
local LocalPlayerChamsToggle = Sections.Misc.Misc:Toggle{
    Name = "Enabled",
    Flag = "localchamsEnabled",
    --Default = false,
    Callback = function(bool)
        
    end
}
LocalPlayerChamsToggle:ColorPicker{
    Default = Color3.fromRGB(255, 255, 255), 
    Flag = "localplayerchamsColor",
    Callback = function(color)
        
    end
}
Sections.Misc.Misc:Dropdown{
    Name = "Player Material",
    Default = "ForceField",
    Content = {"ForceField", "Neon", "SmoothPlastic", "Glass"},
    Flag = "localplayerchamsMaterial",
    Callback = function(option)
    end
}
Sections.Misc.Misc:Dropdown{
    Name = "Gun Material",
    Default = "ForceField",
    Content = {"ForceField", "Neon", "SmoothPlastic", "Glass", "Metal"},
    Flag = "localgunchamsMaterial",
    Callback = function(option)
    end
}

--* ESP Functions *--
esp.NewDrawing = function(type, properties)
    local newD = Drawing.new(type)
    for i,v in next, properties or {} do
        local s,e = pcall(function()
            newD[i] = v
        end)

        if not s then
            warn(e)
        end
    end
    return newD
end
esp.HasCharacter = function(v)
    local pass = false
    if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") then
        pass = true
    end

    if s then return pass; end; return pass;
end
esp.TeamCheck = function(v)
    local pass = true
    if plr.TeamColor == v.TeamColor then
        pass = false
    end

    if s then return pass; end; return pass;
end --[true = Same Team | false = Same Team]
esp.NewPlayer = function(v)
    esp.players[v] = {
        name = esp.NewDrawing("Text", {Color = Color3.fromRGB(255, 255, 255), Outline = true, Center = true, Size = 13, Font = 2}),
        boxOutline = esp.NewDrawing("Square", {Color = Color3.fromRGB(0, 255, 0), Thickness = 3}),
        box = esp.NewDrawing("Square", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1, Filled = false}),
        tool = esp.NewDrawing("Text", {Color = Color3.fromRGB(255, 255, 255), Outline = true, Center = true, Size = 13, Font = 2}),
        healthBarOutline = esp.NewDrawing("Line", {Color = Color3.fromRGB(0, 0, 0), Thickness = 3}),
        healthBar = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
        healthText = esp.NewDrawing("Text", {Color = Color3.fromRGB(255, 255, 255), Outline = true, Center = true, Size = 13, Font = 2}),
        distance = esp.NewDrawing("Text", {Color = Color3.fromRGB(255, 255, 255), Outline = true, Center = true, Size = 13, Font = 2}),
        viewAngle = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
        tracers = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
        chams = Instance.new("Highlight"),
        skeleton = {
            Head = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            LeftHand = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            RightHand = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            LeftLowerArm = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            RightLowerArm = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            LeftUpperArm = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            RightUpperArm = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            LeftFoot = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            LeftLowerLeg = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            UpperTorso = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            LeftUpperLeg = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            RightFoot = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            RightLowerLeg = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            LowerTorso = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1}),
            RightUpperLeg = esp.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1})
        }
    }
end
for _,v in ipairs(plrs:GetPlayers()) do
    if v ~= plr then
        esp.NewPlayer(v)
    end
end
ServiceConnections.ESPPlayerAddedConnection = plrs.PlayerAdded:Connect(esp.NewPlayer)
local Plr_Target
local Plr_Target_Predicted

--* Rainbow Function *--
local rcurrent = 255
local gcurrent = 0
local bcurrent = 0

local redtime = true
local bluetime2 = false
local greentime = false

local function ResetRainbow()
    redtime = true
    bluetime2 = false
    greentime = false
end

local function getRandomColor()
    local rnum = 0
    local bnum = 0
    local gnum = 0

    if rcurrent == 255 and gcurrent == 0 and bcurrent == 0 then
        ResetRainbow()
        rcurrent = 255
        gcurrent = 0
        bcurrent = 0
    end

    if gcurrent < 255 and not greentime then
        gnum = gcurrent + 15
        gcurrent = gnum

    elseif gcurrent == 255 and rcurrent > 0 and redtime and rcurrent ~= 0 then
        rnum = rcurrent - 15
        rcurrent = rnum

    elseif bcurrent < 255 and gcurrent == 255 and rcurrent == 0 and not bluetime2 then
        bnum = bcurrent + 15
        bcurrent = bnum

    elseif gcurrent > 0 and gcurrent ~= 0 and bcurrent == 255 and rcurrent == 0 and not bluetime2 then
        greentime = true
        gnum = gcurrent - 15
        gcurrent = gnum

    elseif bcurrent == 255 and gcurrent == 0 and rcurrent < 255 then
        redtime = false
        rnum = rcurrent + 15
        rcurrent = rnum

    elseif bcurrent > 0 and bcurrent ~= 0 and gcurrent == 0 and rcurrent == 255 then
        bluetime2 = true
        bnum = bcurrent - 15
        bcurrent = bnum
    end
    return Color3.fromRGB(rcurrent, gcurrent, bcurrent)
end

local rainbowespmode = Sections.Visuals.RainbowSettings:Toggle{
    Name = "Rainbow Mode",
    Flag = "rainbowmodeEnabled",
    -- Default = false,
    Callback = function(bool)
        esp.rainbowmode = bool
    end
}
rainbowespmode:Slider{
    Text = "[value] ms",
    Default = 0,
    Min = 0,
    Max = 0.25,
    Float = 0.0001,
    Flag = "rainbowmodeSpeed",
    Callback = function(value)
    end
}
local RainbowESPNames = Sections.Visuals.RainbowSettings:Toggle{
    Name = "Names Rainbow",
    Flag = "rainbownamesEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
local RainbowESPBoxes = Sections.Visuals.RainbowSettings:Toggle{
    Name = "Boxes Rainbow",
    Flag = "rainbowboxesEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
local RainbowESPTool = Sections.Visuals.RainbowSettings:Toggle{
    Name = "Tool Rainbow",
    Flag = "rainbowtoolEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
local RainbowESPHealthText = Sections.Visuals.RainbowSettings:Toggle{
    Name = "Health Text Rainbow",
    Flag = "rainbowhealthtextEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
local RainbowESPDistance = Sections.Visuals.RainbowSettings:Toggle{
    Name = "Distance Rainbow",
    Flag = "rainbowdistanceEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
local RainbowESPViewAngle = Sections.Visuals.RainbowSettings:Toggle{
    Name = "View Angle Rainbow",
    Flag = "rainbowviewangleEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
local RainbowESPTracers = Sections.Visuals.RainbowSettings:Toggle{
    Name = "Tracers Rainbow",
    Flag = "rainbowtracersEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
local RainbowESPSkeleton = Sections.Visuals.RainbowSettings:Toggle{
    Name = "Skeleton Rainbow",
    Flag = "rainbowskeletonEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
local RainbowESPChams = Sections.Visuals.RainbowSettings:Toggle{
    Name = "Chams Rainbow",
    Flag = "rainbowchamsEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
local RainbowESPLocalPlayerChams = Sections.Visuals.RainbowSettings:Toggle{
    Name = "Local Chams Rainbow",
    Flag = "rainbowlocalchamsEnabled",
    -- Default = false,
    Callback = function(bool)
        
    end
}
Sections.Visuals.RainbowSettings:Toggle{
    Name = "Enable All",
    Flag = "rainbowmodeEnableAll",
    -- Default = false,
    Callback = function(bool)
        RainbowESPNames:Toggle(bool)
        RainbowESPBoxes:Toggle(bool)
        RainbowESPTool:Toggle(bool)
        RainbowESPHealthText:Toggle(bool)
        RainbowESPDistance:Toggle(bool)
        RainbowESPViewAngle:Toggle(bool)
        RainbowESPTracers:Toggle(bool)
        RainbowESPSkeleton:Toggle(bool)
        RainbowESPChams:Toggle(bool)
        --RainbowESPChamsOutline:Toggle(bool)
        RainbowESPLocalPlayerChams:Toggle(bool)
    end
}
task.spawn(function()
    LPH_NO_VIRTUALIZE(function()
        while task.wait(library.flags["rainbowmodeSpeed"]) do
            --* Rainbow Mode *--
            if esp.rainbowmode then
                local rand = getRandomColor()
                esp.rainbowcolor = rand
                for i,v in pairs(esp.players) do
                    
                    if library.flags["rainbownamesEnabled"] then
                        library.flags["espnameColor"] = esp.rainbowcolor
                    end
                    if library.flags["rainbowboxesEnabled"] then
                        library.flags["espboxColor"] = esp.rainbowcolor
                    end
                    if library.flags["rainbowtoolEnabled"] then
                        library.flags["esptoolColor"] = esp.rainbowcolor
                    end
                    if library.flags["rainbowhealthtextEnabled"] then
                        library.flags["esphealthtextColor"] = esp.rainbowcolor
                    end
                    if library.flags["rainbowdistanceEnabled"] then
                        library.flags["espdistanceColor"] = esp.rainbowcolor
                    end
                    if library.flags["rainbowviewangleEnabled"] then
                        library.flags["espviewangleColor"] = esp.rainbowcolor
                    end
                    if library.flags["rainbowtracersEnabled"] then
                        library.flags["esptracersColor"] = esp.rainbowcolor
                    end
                    if library.flags["rainbowskeletonEnabled"] then
                        library.flags["espskeletonColor"] = esp.rainbowcolor
                    end
                    if library.flags["rainbowlocalchamsEnabled"] then
                        library.flags["localplayerchamsColor"] = esp.rainbowcolor
                    end
                    if library.flags["rainbowchamsEnabled"] then
                        library.flags["espchamsColor"] = esp.rainbowcolor
                    end
                    -- if library.flags["rainbowchamsoutlineEnabled"] then
                    --     v.chams.OutlineColor = esp.rainbowcolor
                    -- end
                end
            end
        end
    end)()
end)

ServiceConnections.RenderSteppedConnection = rs.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
    if Running then
        updateTick = updateTick + 1

        --* Custom Hit Sounds *--
        if library.flags["hitsoundsEnabled"] and Hit_Found then
            local Hit = Hit_Target
            if Hit.Name:lower():find("head") then
                headSound:Play()
            else
                bodySound:Play()
            end
            Hit_Found = false
        end

        if updateTick >= 2 then
            updateTick = 0

            if Environment.Settings.Enabled then
                GetClosestPlayer()

                --* FOV Circle *--
                if Environment.FOVSettings.Enabled then
                    Environment.FOVCircle.Radius = Environment.FOVSettings.Amount
                    Environment.FOVCircle.Thickness = Environment.FOVSettings.Thickness
                    Environment.FOVCircle.Filled = Environment.FOVSettings.Filled
                    Environment.FOVCircle.NumSides = Environment.FOVSettings.Sides
                    Environment.FOVCircle.Color = GetColor(Environment.FOVSettings.Color)
                    Environment.FOVCircle.Transparency = Environment.FOVSettings.Transparency
                    Environment.FOVCircle.Visible = Environment.FOVSettings.Visible
                    Environment.FOVCircle.Position = Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y)
                else
                    Environment.FOVCircle.Visible = false
                end

                --* Snaplines *--
                if Environment.Settings.SnapLines then
                    if Environment.Locked ~= nil then
                        local player = Environment.Locked
        
                        if not Environment.Settings.AILocked then
                            player = Environment.Locked.Character
                        end
        
                        local Vector, OnScreen = Camera:WorldToViewportPoint(player.Head.Position)
                        if OnScreen then
                            Environment.SnapLine.Visible = true
                            Environment.SnapLine.From = Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y)
                            Environment.SnapLine.To = Vector2.new(Vector.X, Vector.Y)
                            Environment.SnapLine.Color = GetColor(Environment.Settings.SnapLineColor)
                            Environment.SnapLine.Thickness = 1
                        else
                            Environment.SnapLine.Visible = false
                        end
                    else
                        Environment.SnapLine.Visible = false
                    end
                else
                    Environment.SnapLine.Visible = false
                end

                --* Normal Aimbot *--
                if not Environment.Settings.SilentAimEnabled and IsDown(Enum.UserInputType[Environment.Settings.TriggerKey]) then
                    if Environment.Locked ~= nil then
                        local Prediction = Vector3.new(0, 0, 0)
                        local player = Environment.Locked
        
                        if not Environment.Settings.AILocked then
                            player = Environment.Locked.Character
                        end
        
                        if Environment.Settings.Prediction then
                            local PlayerRoot = player:FindFirstChild("HumanoidRootPart") or player:FindFirstChild("Torso")
                            local TargetStuds = (player[Environment.Settings.LockPart].Position - Camera.CFrame.p).Magnitude
                            local TimeToTarget = TargetStuds / MuzzleVelocityValue
                            
                            Prediction = PlayerRoot.Velocity * TimeToTarget
                        end
                        
                        if Environment.Settings.Sensitivity > 0 then
                            Animation = tweenService:Create(Camera, TweenInfo.new(Environment.Settings.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, player[Environment.Settings.LockPart].Position + Prediction)})
                            Animation:Play()
                        else
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, player[Environment.Settings.LockPart].Position + Prediction)
                        end
                        Environment.FOVCircle.Color = GetColor(Environment.FOVSettings.LockedColor)
                    end
                else
                    if Animation ~= nil then
                        Animation:Cancel()
                    end
                    Environment.FOVCircle.Color = GetColor(Environment.FOVSettings.Color)
                end
            else
                Environment.FOVCircle.Visible = false
                Environment.SnapLine.Visible = false
                Environment.Locked = nil
                if Animation ~= nil then
                    Animation:Cancel()
                end
                Environment.FOVCircle.Color = GetColor(Environment.FOVSettings.Color)
            end

            --* Third Person *--
            if library.flags["thirdpersonEnabled"] and ThirdPersonToggled then
                if library.flags["cameraFOVEnabled"] then
                    workspace.CurrentCamera.FieldOfView = Old_FOV
                end
                local Checkkkk = game:GetService("Workspace").Camera:FindFirstChild("ViewModel")
                if Checkkkk then
                    for i,v in pairs(game:GetService("Workspace").Camera.ViewModel:GetDescendants()) do
                        if v.ClassName == "MeshPart" then
                            if v.Parent.Name == "WastelandShirt" or v.Parent.Name == "GhillieTorso" or v.Parent.Name == "CivilianPants" or v.Parent.Name == "CamoShirt" or v.Parent.Name == "HandWraps" or v.Parent.Name == "CombatGloves" then
                                v.Transparency = 1
                            end
                        end
                        if v.ClassName == "MeshPart" then
                            if v.Name == "LeftHand" or v.Name == "LeftLowerArm" or v.Name == "LeftUpperArm" or v.Name == "RightHand" or v.Name == "RightLowerArm" or v.Name == "RightUpperArm" then
                                v.Transparency = 1
                            end
                        end
                        if v.ClassName == "Part" then
                            if v.Name == "AimPartCanted" or v.Name == "AimPart" then
                                v.Transparency = 1
                            end
                        end
                    end
                    for i,v in pairs(game:GetService("Workspace").Camera.ViewModel.Item:GetDescendants()) do
                        if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                            v.Transparency = 1
                        end
                    end
                end
            end

            --* LocalPlayer Chams *--
            local Checkkkk = game:GetService("Workspace").Camera:FindFirstChild("ViewModel")
            if library.flags["localchamsEnabled"] and Checkkkk ~= nil then
                for i,v in pairs(game:GetService("Workspace").Camera.ViewModel:GetDescendants()) do
                    if v.ClassName == "MeshPart" then
                        if v.Parent.Name == "WastelandShirt" or v.Parent.Name == "GhillieTorso" or v.Parent.Name == "CivilianPants" or v.Parent.Name == "CamoShirt" or v.Parent.Name == "HandWraps" or v.Parent.Name == "CombatGloves" then
                            v.Transparency = 1
                        end
                    end
                    if v.ClassName == "MeshPart" then
                        if v.Name == "LeftHand" or v.Name == "LeftLowerArm" or v.Name == "LeftUpperArm" or v.Name == "RightHand" or v.Name == "RightLowerArm" or v.Name == "RightUpperArm" then
                            v.Material = (library.flags["localplayerchamsMaterial"])
                            v.Color = (library.flags["localplayerchamsColor"])
                        end
                    end
                    if v.ClassName == "Part" then
                        if v.Name == "AimPartCanted" or v.Name == "AimPart" then
                            v.Size = Vector3.new(0, 0, 0)
                            v.Transparency = 1
                        end
                    end
                end
                for i,v in pairs(game:GetService("Workspace")[LocalPlayerName]:GetChildren()) do
                    if v.ClassName == "MeshPart" then
                        v.Material = (library.flags["localplayerchamsMaterial"])
                        v.Color = (library.flags["localplayerchamsColor"])
                    end
                end
                --game:GetService("Workspace").Camera.ViewModel.Item.ItemRoot.Material = (library.flags["localplayerchamsMaterial"])
                --game:GetService("Workspace").Camera.ViewModel.Item game:GetService("Workspace").Camera.ViewModel.Item.SlideModel.SurfaceAppearance
                for i,v in pairs(game:GetService("Workspace").Camera.ViewModel.Item:GetDescendants()) do
                    if v.ClassName == "MeshPart" or v.ClassName == "Part" then
                        v.Material = (library.flags["localgunchamsMaterial"])
                        v.Color = (library.flags["localplayerchamsColor"])
                    end
                    if v:FindFirstChild("SurfaceAppearance") then
                        v.SurfaceAppearance:Destroy()
                    end
                end
            end

            --* No Water Blur *--
            if library.flags["nowaterblurEnabled"] then
                waterBlur.Enabled = false
            end

            --* Rapid Fire *--
            if library.flags["rapidfireEnabled"] then
                for i,v in next, repStorage.Players[plr.Name].Inventory:GetChildren() do
                    local module = require(v.SettingsModule)
                    module.FireRate = library.flags["firerateValue"]
                end
            end

        elseif updateTick == 1 then

            --* Local Player Mods *--
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                for _, connectTable in pairs({
                    getconnections(humanoid.StateChanged);
                    getconnections(humanoid:GetPropertyChangedSignal("WalkSpeed"));
                    getconnections(humanoid:GetPropertyChangedSignal("JumpHeight"))
                }) do
                    for _, event in pairs(connectTable) do
                        event:Disable()
                    end
                end

                -- if library.flags["bhopEnabled"] then
                --     humanoid.JumpHeight = 0
                -- end

                if library.flags["walkspeedEnabledOld"] and WalkSpeedKeybindToggledOld then
                    humanoid.WalkSpeed = library.flags["walkspeedValueOld"]
                else
                    humanoid.WalkSpeed = 16
                end

                if library.flags["jumppowerEnabled"] then
                    humanoid.JumpHeight = library.flags["jumppowerValue"]
                else
                    humanoid.JumpHeight = Default_JumpHeight
                end
            end

            --* Get Muzzle Velocity *--
            if Environment.Settings.Prediction and Environment.Settings.Enabled then
                local AbleToPass = nil
                for _,v in pairs(AllGunsTable.Melee) do
                    if game.Workspace[tostring(game.Players.LocalPlayer.Name)]:FindFirstChild(v) then
                        AbleToPass = false
                    end
                end
                for _,v in pairs(AllGunsTable.Keys) do
                    if game.Workspace[tostring(game.Players.LocalPlayer.Name)]:FindFirstChild(v) then
                        AbleToPass = false
                    end
                end
                for _,v in pairs(AllGunsTable.Meds) do
                    if game.Workspace[tostring(game.Players.LocalPlayer.Name)]:FindFirstChild(v) then
                        AbleToPass = false
                    end
                end
                for _,v in pairs(AllGunsTable.Grenades) do
                    if game.Workspace[tostring(game.Players.LocalPlayer.Name)]:FindFirstChild(v) then
                        AbleToPass = false
                    end
                end
                for _,v in pairs(AllGunsTable.Consuables) do
                    if game.Workspace[tostring(game.Players.LocalPlayer.Name)]:FindFirstChild(v) then
                        AbleToPass = false
                    end
                end
                for _,v in pairs(AllGunsTable.Specials) do
                    if game.Workspace[tostring(game.Players.LocalPlayer.Name)]:FindFirstChild(v) then
                        AbleToPass = false
                    end
                end

                for _,v in pairs(AllGunsTable.Rilfes) do
                    if game.Workspace[tostring(game.Players.LocalPlayer.Name)]:FindFirstChild(v) then
                        AbleToPass = true
                    end
                end
                for _,v in pairs(AllGunsTable.SMGs) do
                    if game.Workspace[tostring(game.Players.LocalPlayer.Name)]:FindFirstChild(v) then
                        AbleToPass = true
                    end
                end
                for _,v in pairs(AllGunsTable.Pistols) do
                    if game.Workspace[tostring(game.Players.LocalPlayer.Name)]:FindFirstChild(v) then
                        AbleToPass = true
                    end
                end
                for _,v in pairs(AllGunsTable.Shotguns) do
                    if game.Workspace[tostring(game.Players.LocalPlayer.Name)]:FindFirstChild(v) then
                        AbleToPass = true
                    end
                end


                if AbleToPass then
                    if game.Workspace[tostring(game.Players.LocalPlayer.Name)]:FindFirstChild("IZh81") or game.Workspace[tostring(game.Players.LocalPlayer.Name)]:FindFirstChild("Mosin") then
                        local Magazine = game.ReplicatedStorage.Players[tostring(game.Players.LocalPlayer)].Inventory[tostring(game.ReplicatedStorage.Players[tostring(game.Players.LocalPlayer.Name)].Status.GameplayVariables.EquippedTool.Value)].ItemProperties:FindFirstChildOfClass("StringValue")
                        if Magazine ~= nil then
                            Magazine = Magazine.ItemProperties.LoadedAmmo:FindFirstChildOfClass("Folder")
                            if Magazine ~= nil then
                                Magazine = Magazine:GetAttribute("AmmoType")
                                if Magazine ~= nil then
                                    MuzzleVelocityValue = game.ReplicatedStorage.AmmoTypes[tostring(Magazine)]:GetAttribute("MuzzleVelocity")
                                end
                            end
                        end
                    else
                        local Magazine = game.ReplicatedStorage.Players[tostring(game.Players.LocalPlayer)].Inventory[tostring(game.ReplicatedStorage.Players[tostring(game.Players.LocalPlayer.Name)].Status.GameplayVariables.EquippedTool.Value)].Attachments.Magazine:FindFirstChildOfClass("StringValue")
                        if Magazine ~= nil then
                            Magazine = Magazine.ItemProperties.LoadedAmmo:FindFirstChildOfClass("Folder")
                            if Magazine ~= nil then
                                Magazine = Magazine:GetAttribute("AmmoType")
                                if Magazine ~= nil then
                                    MuzzleVelocityValue = game.ReplicatedStorage.AmmoTypes[tostring(Magazine)]:GetAttribute("MuzzleVelocity")
                                end
                            end
                        end
                    end
                end
            end

            --* Watermark *--
            -- FPS maths
            local fr = tick()
            for index = #FPS,1,-1 do
                FPS[index + 1] = (FPS[index] >= fr - 1) and FPS[index] or nil
            end
            FPS[1] = fr
            local fps = (tick() - sec >= 1 and #FPS) or (#FPS / (tick() - sec))
            fps = math.floor(fps) * 2

            -- Ping maths
            local ping = tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue())
            ping = math.floor(ping)

            watermark:Set("1NF1N17Y | " .. fps .. " fps | " .. ping .. "ms | " .. script_version_number .. " | Private")

            --* Fake Lag *--
            if library.flags["fakelagEnabled"] and FakeLagEnabled then
                Tick = Tick + 1
                local Character = plr.Character
                if Character then
                    local Head, HumanoidRootPart, Humanoid = Character:FindFirstChild("Head"), Character:FindFirstChild("HumanoidRootPart"), Character:FindFirstChild("Humanoid")
                    if Head and HumanoidRootPart and Humanoid and Humanoid.Health > 0 then
                        if Tick >= library.flags["fakelagLimit"] then
                            Tick = 0
                            NetworkClient:SetOutgoingKBPSLimit(math.huge)
                            if library.flags["visualizefakelagEnabled"] and FakeLagEnabled then
                                VisualizeLagFolder:ClearAllChildren()
                                Character.Archivable = true
                                local Clone = Character:Clone()
                                Character.Archivable = false
                                for _, Child in pairs(Clone:GetDescendants()) do
                                    if Child:IsA("SurfaceAppearance") or Child:IsA("Humanoid") or Child:IsA("BillboardGui") or Child:IsA("Decal") or Child.Name == "HumanoidRootPart" then
                                        Child:Destroy()
                                        continue
                                    end
                                    if Child:IsA("BasePart") then
                                        Child.CanCollide = false
                                        Child.Anchored = true
                                        Child.Material = Enum.Material.ForceField
                                        Child.Color = library.flags["visualizefakelagColor"] 
                                        Child.Size = Child.Size + Vector3.new(0.025, 0.025, 0.025)
                                    end
                                end
                                Clone.Parent = VisualizeLagFolder
                            else
                                VisualizeLagFolder:ClearAllChildren()
                            end
                        else
                            NetworkClient:SetOutgoingKBPSLimit(1)
                        end
                    end
                end
            else
                VisualizeLagFolder:ClearAllChildren()
            end

            -- Loop through all the players in the esp table
            for i,v in pairs(esp.players) do
                if esp.HasCharacter(i) then
                    local hum = i.Character.Humanoid
                    local hrp = i.Character.HumanoidRootPart
                    local head = i.Character.Head

                    local Vector, onScreen = Camera:WorldToViewportPoint(i.Character.HumanoidRootPart.Position)

                    local Size = (Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(hrp.Position + Vector3.new(0, 2.6, 0)).Y) / 2
                    local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
                    local BoxPos = Vector2.new(math.floor(Vector.X - Size * 1.5 / 2), math.floor(Vector.Y - Size * 1.6 / 2))

                    local BottomOffset = BoxSize.Y + BoxPos.Y + 1
                    local DistanceFromPlayer = math.floor((plr.Character.HumanoidRootPart.Position - hrp.Position).Magnitude + 0.5)

                    if onScreen and esp.enabled and DistanceFromPlayer < library.flags["espMaxDistance"] then
                        if esp.settings.name.enabled then
                            v.name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
                            v.name.Outline = esp.settings.name.outline

                            if plr:GetFriendStatus(i) == Enum.FriendStatus.Friend and library.flags["friendcheckEnabled"] then 
                                v.name.Color = library.flags["friendcheckColor"]
                            elseif Environment.Settings.HighlightTarget == i and library.flags["highlighttargetEnabled"] then
                                v.name.Color = library.flags["highlighttargetColor"]
                            else
                                v.name.Color = library.flags["espnameColor"]
                            end

                            v.name.Font = esp.font
                            v.name.Size = esp.fontsize

                            if esp.settings.name.displaynames then
                                v.name.Text = tostring(i.DisplayName)
                            else
                                v.name.Text = tostring(i.Name)
                            end

                            v.name.Visible = true
                        else
                            v.name.Visible = false
                        end

                        if esp.settings.distance.enabled then
                            v.distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                            v.distance.Outline = esp.settings.distance.outline
                            v.distance.Text = "[" .. math.floor((hrp.Position - plr.Character.HumanoidRootPart.Position).Magnitude) .. "m]"
                            
                            if plr:GetFriendStatus(i) == Enum.FriendStatus.Friend and library.flags["friendcheckEnabled"] then 
                                v.distance.Color = library.flags["friendcheckColor"]
                            elseif Environment.Settings.HighlightTarget == i and library.flags["highlighttargetEnabled"] then
                                v.distance.Color = library.flags["highlighttargetColor"]
                            else
                                v.distance.Color = library.flags["espdistanceColor"]
                            end


                            BottomOffset = BottomOffset + 15

                            v.distance.Font = esp.font
                            v.distance.Size = esp.fontsize

                            v.distance.Visible = true
                        else
                            v.distance.Visible = false
                        end

                        if esp.settings.tool.enabled then
                            v.tool.Position = Vector2.new((BoxPos.X + BoxSize.X + 20), (BoxPos.Y + BoxSize.Y - 1 * BoxSize.Y) -1)
                            v.tool.Outline = esp.settings.tool.outline

                            local Tool = ReplicatedPlayers[i.Name].Status.GameplayVariables.EquippedTool
                            local toolObject = Tool.Value
                            local FoundTool = toolObject ~= nil and toolObject.Name or "None"
                            v.tool.Text = tostring(FoundTool)
                            
                            if plr:GetFriendStatus(i) == Enum.FriendStatus.Friend and library.flags["friendcheckEnabled"] then 
                                v.tool.Color = library.flags["friendcheckColor"]
                            elseif Environment.Settings.HighlightTarget == i and library.flags["highlighttargetEnabled"] then
                                v.tool.Color = library.flags["highlighttargetColor"]
                            else
                                v.tool.Color = library.flags["esptoolColor"]
                            end

                            v.tool.Font = esp.font
                            v.tool.Size = esp.fontsize

                            v.tool.Visible = true
                        else
                            v.tool.Visible = false
                        end

                        if esp.settings.box.enabled then
                            v.boxOutline.Size = BoxSize
                            v.boxOutline.Position = BoxPos
                            v.boxOutline.Visible = esp.settings.box.outline

                            v.box.Size = BoxSize
                            v.box.Position = BoxPos

                            if plr:GetFriendStatus(i) == Enum.FriendStatus.Friend and library.flags["friendcheckEnabled"] then 
                                v.box.Color = library.flags["friendcheckColor"]
                            elseif Environment.Settings.HighlightTarget == i and library.flags["highlighttargetEnabled"] then
                                v.box.Color = library.flags["highlighttargetColor"]
                            else
                                v.box.Color = library.flags["espboxColor"]
                            end

                            v.box.Filled = false
                            v.box.Visible = true
                        else
                            v.boxOutline.Visible = false
                            v.box.Visible = false
                        end

                        if esp.settings.healthbar.enabled then
                            v.healthBar.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                            v.healthBar.To = Vector2.new(v.healthBar.From.X, v.healthBar.From.Y - (hum.Health / hum.MaxHealth) * BoxSize.Y)
                            v.healthBar.Color = Color3.fromRGB(255 - 255 / (hum["MaxHealth"] / hum["Health"]), 255 / (hum["MaxHealth"] / hum["Health"]), 0)
                            v.healthBar.Visible = true

                            v.healthBarOutline.From = Vector2.new(v.healthBar.From.X, BoxPos.Y + BoxSize.Y + 1)
                            v.healthBarOutline.To = Vector2.new(v.healthBar.From.X, (v.healthBar.From.Y - 1 * BoxSize.Y) -1)
                            v.healthBarOutline.Visible = esp.settings.healthbar.outline
                        else
                            v.healthBarOutline.Visible = false
                            v.healthBar.Visible = false
                        end

                        if esp.settings.healthtext.enabled then
                            v.healthText.Text = tostring(math.floor((hum.Health / hum.MaxHealth) * 100 + 0.5))
                            v.healthText.Position = Vector2.new((BoxPos.X - 20), (BoxPos.Y + BoxSize.Y - 1 * BoxSize.Y) -1)

                            if plr:GetFriendStatus(i) == Enum.FriendStatus.Friend and library.flags["friendcheckEnabled"] then 
                                v.healthText.Color = library.flags["friendcheckColor"] 

                            elseif Environment.Settings.HighlightTarget == i and library.flags["highlighttargetEnabled"] then
                                v.healthText.Color = library.flags["highlighttargetColor"]
                            else 
                                v.healthText.Color = library.flags["esphealthtextColor"]
                            end

                            v.healthText.Outline = esp.settings.healthtext.outline

                            v.healthText.Font = esp.font
                            v.healthText.Size = esp.fontsize

                            v.healthText.Visible = true
                        else
                            v.healthText.Visible = false
                        end

                        if esp.settings.viewangle.enabled then
                            local fromHead = Camera:worldToViewportPoint(head.CFrame.p)
                            local toPoint = Camera:worldToViewportPoint((head.CFrame + (head.CFrame.lookVector * 10)).p)
                            
                            v.viewAngle.From = Vector2.new(fromHead.X, fromHead.Y)
                            v.viewAngle.To = Vector2.new(toPoint.X, toPoint.Y)

                            if plr:GetFriendStatus(i) == Enum.FriendStatus.Friend and library.flags["friendcheckEnabled"] then 
                                v.viewAngle.Color = library.flags["friendcheckColor"] 
                            elseif Environment.Settings.HighlightTarget == i and library.flags["highlighttargetEnabled"] then
                                v.viewAngle.Color = library.flags["highlighttargetColor"]
                            else
                                v.viewAngle.Color = library.flags["espviewangleColor"]
                            end

                            v.viewAngle.Visible = true
                        else
                            v.viewAngle.Visible = false
                        end

                        if esp.settings.skeleton.enabled then
                            local Head = i.Character.Head
                            local LeftHand = i.Character.LeftHand
                            local RightHand = i.Character.RightHand
                            local LeftLowerArm = i.Character.LeftLowerArm
                            local RightLowerArm = i.Character.RightLowerArm
                            local LeftUpperArm = i.Character.LeftUpperArm
                            local RightUpperArm = i.Character.RightUpperArm
                            local LeftFoot = i.Character.LeftFoot
                            local LeftLowerLeg = i.Character.LeftLowerLeg
                            local UpperTorso = i.Character.UpperTorso
                            local LeftUpperLeg = i.Character.LeftUpperLeg
                            local RightFoot = i.Character.RightFoot
                            local RightLowerLeg = i.Character.RightLowerLeg
                            local LowerTorso = i.Character.LowerTorso
                            local RightUpperLeg = i.Character.RightUpperLeg

                            local HeadPos = Camera:WorldToViewportPoint(Head.Position)
                            local LeftHandPos = Camera:WorldToViewportPoint(LeftHand.Position)
                            local RightHandPos = Camera:WorldToViewportPoint(RightHand.Position)
                            local LeftLowerArmPos = Camera:WorldToViewportPoint(LeftLowerArm.Position)
                            local RightLowerArmPos = Camera:WorldToViewportPoint(RightLowerArm.Position)
                            local LeftUpperArmPos = Camera:WorldToViewportPoint(LeftUpperArm.Position)
                            local RightUpperArmPos = Camera:WorldToViewportPoint(RightUpperArm.Position)
                            local LeftFootPos = Camera:WorldToViewportPoint(LeftFoot.Position)
                            local LeftLowerLegPos = Camera:WorldToViewportPoint(LeftLowerLeg.Position)
                            local UpperTorsoPos = Camera:WorldToViewportPoint(UpperTorso.Position)
                            local LeftUpperLegPos = Camera:WorldToViewportPoint(LeftUpperLeg.Position)
                            local RightFootPos = Camera:WorldToViewportPoint(RightFoot.Position)
                            local RightLowerLegPos = Camera:WorldToViewportPoint(RightLowerLeg.Position)
                            local LowerTorsoPos = Camera:WorldToViewportPoint(LowerTorso.Position)
                            local RightUpperLegPos = Camera:WorldToViewportPoint(RightUpperLeg.Position)

                            local function CheckFriend()
                                if Environment.Settings.HighlightTarget == i and library.flags["highlighttargetEnabled"] then
                                    return library.flags["highlighttargetColor"]
                                end
                                if plr:GetFriendStatus(i) == Enum.FriendStatus.Friend and library.flags["friendcheckEnabled"] then 
                                    return library.flags["friendcheckColor"] 
                                end
                                if not library.flags["rainbowskeletonEnabled"] then
                                    return esp.settings.skeleton.color 
                                end
                                if not esp.rainbowmode then 
                                    return esp.settings.skeleton.color 
                                end

                                return esp.rainbowcolor
                            end

                            if HeadPos and UpperTorsoPos then
                                v.skeleton.Head.From = Vector2.new(HeadPos.X, HeadPos.Y)
                                v.skeleton.Head.To = Vector2.new(UpperTorsoPos.X, UpperTorsoPos.Y)
                                v.skeleton.Head.Color = CheckFriend()
                                v.skeleton.Head.Visible = true

                                v.skeleton.LeftHand.From = Vector2.new(LeftHandPos.X, LeftHandPos.Y)
                                v.skeleton.LeftHand.To = Vector2.new(LeftLowerArmPos.X, LeftLowerArmPos.Y)
                                v.skeleton.LeftHand.Color = CheckFriend()
                                v.skeleton.LeftHand.Visible = true

                                v.skeleton.RightHand.From = Vector2.new(RightHandPos.X, RightHandPos.Y)
                                v.skeleton.RightHand.To = Vector2.new(RightLowerArmPos.X, RightLowerArmPos.Y)
                                v.skeleton.RightHand.Color = CheckFriend()
                                v.skeleton.RightHand.Visible = true

                                v.skeleton.LeftLowerArm.From = Vector2.new(LeftLowerArmPos.X, LeftLowerArmPos.Y)
                                v.skeleton.LeftLowerArm.To = Vector2.new(LeftUpperArmPos.X, LeftUpperArmPos.Y)
                                v.skeleton.LeftLowerArm.Color = CheckFriend()
                                v.skeleton.LeftLowerArm.Visible = true

                                v.skeleton.RightLowerArm.From = Vector2.new(RightLowerArmPos.X, RightLowerArmPos.Y)
                                v.skeleton.RightLowerArm.To = Vector2.new(RightUpperArmPos.X, RightUpperArmPos.Y)
                                v.skeleton.RightLowerArm.Color = CheckFriend()
                                v.skeleton.RightLowerArm.Visible = true

                                v.skeleton.LeftUpperArm.From = Vector2.new(LeftUpperArmPos.X, LeftUpperArmPos.Y)
                                v.skeleton.LeftUpperArm.To = Vector2.new(UpperTorsoPos.X, UpperTorsoPos.Y)
                                v.skeleton.LeftUpperArm.Color = CheckFriend()
                                v.skeleton.LeftUpperArm.Visible = true

                                v.skeleton.RightUpperArm.From = Vector2.new(RightUpperArmPos.X, RightUpperArmPos.Y)
                                v.skeleton.RightUpperArm.To = Vector2.new(UpperTorsoPos.X, UpperTorsoPos.Y)
                                v.skeleton.RightUpperArm.Color = CheckFriend()
                                v.skeleton.RightUpperArm.Visible = true

                                v.skeleton.LeftFoot.From = Vector2.new(LeftFootPos.X, LeftFootPos.Y)
                                v.skeleton.LeftFoot.To = Vector2.new(LeftLowerLegPos.X, LeftLowerLegPos.Y)
                                v.skeleton.LeftFoot.Color = CheckFriend()
                                v.skeleton.LeftFoot.Visible = true

                                v.skeleton.LeftLowerLeg.From = Vector2.new(LeftLowerLegPos.X, LeftLowerLegPos.Y)
                                v.skeleton.LeftLowerLeg.To = Vector2.new(LeftUpperLegPos.X, LeftUpperLegPos.Y)
                                v.skeleton.LeftLowerLeg.Color = CheckFriend()
                                v.skeleton.LeftLowerLeg.Visible = true

                                v.skeleton.UpperTorso.From = Vector2.new(UpperTorsoPos.X, UpperTorsoPos.Y)
                                v.skeleton.UpperTorso.To = Vector2.new(LowerTorsoPos.X, LowerTorsoPos.Y)
                                v.skeleton.UpperTorso.Color = CheckFriend()
                                v.skeleton.UpperTorso.Visible = true

                                v.skeleton.LeftUpperLeg.From = Vector2.new(LeftUpperLegPos.X, LeftUpperLegPos.Y)
                                v.skeleton.LeftUpperLeg.To = Vector2.new(LowerTorsoPos.X, LowerTorsoPos.Y)
                                v.skeleton.LeftUpperLeg.Color = CheckFriend()
                                v.skeleton.LeftUpperLeg.Visible = true

                                v.skeleton.RightFoot.From = Vector2.new(RightFootPos.X, RightFootPos.Y)
                                v.skeleton.RightFoot.To = Vector2.new(RightLowerLegPos.X, RightLowerLegPos.Y)
                                v.skeleton.RightFoot.Color = CheckFriend()
                                v.skeleton.RightFoot.Visible = true

                                v.skeleton.RightLowerLeg.From = Vector2.new(RightLowerLegPos.X, RightLowerLegPos.Y)
                                v.skeleton.RightLowerLeg.To = Vector2.new(RightUpperLegPos.X, RightUpperLegPos.Y)
                                v.skeleton.RightLowerLeg.Color = CheckFriend()
                                v.skeleton.RightLowerLeg.Visible = true

                                v.skeleton.LowerTorso.From = Vector2.new(LowerTorsoPos.X, LowerTorsoPos.Y)
                                v.skeleton.LowerTorso.To = Vector2.new(RightUpperLegPos.X, RightUpperLegPos.Y)
                                v.skeleton.LowerTorso.Color = CheckFriend()
                                v.skeleton.LowerTorso.Visible = true

                                v.skeleton.RightUpperLeg.From = Vector2.new(RightUpperLegPos.X, RightUpperLegPos.Y)
                                v.skeleton.RightUpperLeg.To = Vector2.new(LowerTorsoPos.X, LowerTorsoPos.Y)
                                v.skeleton.RightUpperLeg.Color = CheckFriend()
                                v.skeleton.RightUpperLeg.Visible = true
                            end
                        else
                            v.skeleton.Head.Visible = false
                            v.skeleton.LeftHand.Visible = false
                            v.skeleton.RightHand.Visible = false
                            v.skeleton.LeftLowerArm.Visible = false
                            v.skeleton.RightLowerArm.Visible = false
                            v.skeleton.LeftUpperArm.Visible = false
                            v.skeleton.RightUpperArm.Visible = false
                            v.skeleton.LeftFoot.Visible = false
                            v.skeleton.LeftLowerLeg.Visible = false
                            v.skeleton.UpperTorso.Visible = false
                            v.skeleton.LeftUpperLeg.Visible = false
                            v.skeleton.RightFoot.Visible = false
                            v.skeleton.RightLowerLeg.Visible = false
                            v.skeleton.LowerTorso.Visible = false
                            v.skeleton.RightUpperLeg.Visible = false
                        end

                        if esp.settings.tracers.enabled then
                            local headPos = Camera:WorldToViewportPoint(head.CFrame.p)

                            if library.flags["tracerFromLocation"] == "Bottom" then
                                v.tracers.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                            elseif library.flags["tracerFromLocation"] == "Middle" then
                                v.tracers.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                            end
                            v.tracers.To = Vector2.new(headPos.X, headPos.Y)
                            
                            if plr:GetFriendStatus(i) == Enum.FriendStatus.Friend and library.flags["friendcheckEnabled"] then 
                                v.tracers.Color = library.flags["friendcheckColor"]
                            elseif Environment.Settings.HighlightTarget == i and library.flags["highlighttargetEnabled"] then
                                v.tracers.Color = library.flags["highlighttargetColor"]
                            else
                                v.tracers.Color = library.flags["esptracersColor"]
                            end

                            v.tracers.Visible = true
                        else
                            v.tracers.Visible = false
                        end

                        if esp.settings.chams.enabled then
                            -- Check if chams highlight is found
                            if not i.Character:FindFirstChild("Highlight") then
                                v.chams = Instance.new("Highlight") -- Create a new highlight instance if it doesn't exist
                            end

                            if library.flags["espvisiblechamsEnabled"] then
                                v.chams.DepthMode = 1
                            else
                                v.chams.DepthMode = 0
                            end

                            if v.chams.FillTransparency ~= 0 then
                                v.chams.FillTransparency = 0
                            end
                            if esp.settings.chamsOutline.enabled then
                                v.chams.OutlineTransparency = 0
                            else
                                v.chams.OutlineTransparency = 1
                            end
                            if v.chams.Parent ~= i.Character then
                                v.chams.Parent = i.Character
                            end

                            -- check if instance is locked
                            if Environment.Settings.HighlightTarget == i and library.flags["highlighttargetEnabled"] then
                                v.chams.FillColor = library.flags["highlighttargetColor"]
                            elseif plr:GetFriendStatus(i) == Enum.FriendStatus.Friend and library.flags["friendcheckEnabled"] then 
                                v.chams.FillColor = library.flags["friendcheckColor"]
                                v.chams.OutlineColor = library.flags["friendcheckColor"]
                            else
                                v.chams.FillColor = library.flags["espchamsColor"]
                                v.chams.OutlineColor = esp.settings.chamsOutline.color
                            end
                        else
                            v.chams.FillTransparency = 1
                            v.chams.OutlineTransparency = 1
                        end

                    else
                        -- Disable ESP if player is off screen or out of Max render distance
                        v.name.Visible = false
                        v.boxOutline.Visible = false
                        v.box.Visible = false
                        v.tool.Visible = false
                        v.healthBarOutline.Visible = false
                        v.healthBar.Visible = false
                        v.healthText.Visible = false
                        v.distance.Visible = false
                        v.viewAngle.Visible = false
                        v.tracers.Visible = false

                        v.chams.FillTransparency = 1
                        v.chams.OutlineTransparency = 1

                        v.skeleton.Head.Visible = false
                        v.skeleton.LeftHand.Visible = false
                        v.skeleton.RightHand.Visible = false
                        v.skeleton.LeftLowerArm.Visible = false
                        v.skeleton.RightLowerArm.Visible = false
                        v.skeleton.LeftUpperArm.Visible = false
                        v.skeleton.RightUpperArm.Visible = false
                        v.skeleton.LeftFoot.Visible = false
                        v.skeleton.LeftLowerLeg.Visible = false
                        v.skeleton.UpperTorso.Visible = false
                        v.skeleton.LeftUpperLeg.Visible = false
                        v.skeleton.RightFoot.Visible = false
                        v.skeleton.RightLowerLeg.Visible = false
                        v.skeleton.LowerTorso.Visible = false
                        v.skeleton.RightUpperLeg.Visible = false
                    end
                else
                    -- Disable ESP if player has no character
                    v.name.Visible = false
                    v.boxOutline.Visible = false
                    v.box.Visible = false
                    v.tool.Visible = false
                    v.healthBarOutline.Visible = false
                    v.healthBar.Visible = false
                    v.healthText.Visible = false
                    v.distance.Visible = false
                    v.viewAngle.Visible = false
                    v.tracers.Visible = false

                    v.chams.FillTransparency = 1
                    v.chams.OutlineTransparency = 1
                    
                    v.skeleton.Head.Visible = false
                    v.skeleton.LeftHand.Visible = false
                    v.skeleton.RightHand.Visible = false
                    v.skeleton.LeftLowerArm.Visible = false
                    v.skeleton.RightLowerArm.Visible = false
                    v.skeleton.LeftUpperArm.Visible = false
                    v.skeleton.RightUpperArm.Visible = false
                    v.skeleton.LeftFoot.Visible = false
                    v.skeleton.LeftLowerLeg.Visible = false
                    v.skeleton.UpperTorso.Visible = false
                    v.skeleton.LeftUpperLeg.Visible = false
                    v.skeleton.RightFoot.Visible = false
                    v.skeleton.RightLowerLeg.Visible = false
                    v.skeleton.LowerTorso.Visible = false
                    v.skeleton.RightUpperLeg.Visible = false
                end
            end
        end
    end
end))

---------------------------------
    --* CONFIGS TAB *--
---------------------------------
local configs = main:Tab("Configuration")
local themes = configs:Section{Name = "Settings", Side = "Left"}
themes:Button{
    Name = "Unhook",
    Callback  = function()
        Running = false

        for _, v in next, ServiceConnections do
            v:Disconnect()
        end

        Environment.FOVCircle:Remove()
        Environment.SnapLine:Remove()

        ESP:Toggle(false)
        ESP.Settings.Objects_Enabled = false

        gethiddenproperty(Terrain, "Decoration", Old_Decoration)

        KeybindViewer.Main:Remove()
        KeybindViewer.Border:Remove()
        KeybindViewer.TopBorder:Remove()
        for i, v in pairs(KeybindViewer.Texts) do
            v:Remove()
        end

        for i,v in pairs(Old_Lighting) do
            lighting[i] = v
        end

        library:Unload()
    end
}
themes:Button{
    Name = "Rejoin Server",
    Callback  = function()
        local Rejoin = coroutine.create(function()
            local Success, ErrorMessage = pcall(function()
                game:GetService("TeleportService"):Teleport(game.PlaceId, plr)
            end)

            if ErrorMessage and not Success then
                warn(ErrorMessage)
            end
        end)

        coroutine.resume(Rejoin)
    end
}
themes:Keybind{
    Name = "UI Toggle",
    Flag = "UI Toggle",
    Default = Enum.KeyCode.RightShift,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Callback = function(_, fromsetting)
        if not fromsetting then
            library:Close()
        end
    end
}
themes:Button{
    Name = "Copy Game Invite Code",
    Callback = function()
        local ServerID = plr.PlayerGui.PerformanceMonitor2.TextLabel3.Text:split("|")
        local ServerID = ServerID[4]
        local ServerID = ServerID:sub(2)
        setclipboard("game:GetService('TeleportService'):TeleportToPlaceInstance(" .. game.PlaceId .. ", '" .. ServerID .. "')")
    end
}

local scriptver = 'v1.3.2'

if ( _G.RadarKill ) then
    _G.RadarKill()
end

if ( not game:IsLoaded() ) then
    game.Loaded:Wait()
end

--- Settings ---
local settings = {
    --- Radar settings
    -- lines
    RADAR_LINES = true; -- Displays distance rings + cardinal lines 
    RADAR_LINE_DISTANCE = 50; -- The distance between each distance ring
    -- scale
    RADAR_SCALE = 1; -- Controls how "zoomed in" the radar display is 
    RADAR_RADIUS = 125; -- The size of the radar itself
    -- rotation
    RADAR_ROTATION = true; -- Toggles radar rotation. Looks kinda trippy when disabled
    SMOOTH_ROT = true; -- Toggles smooth radar rotation
    SMOOTH_ROT_AMNT = 30; -- Lower number is smoother, higher number is snappier 
    -- misc
    CARDINAL_DISPLAY = true; -- Displays the four cardinal directions (north east south west) around the radar
    
    --- Marker settings
    -- display 
    DISPLAY_OFFSCREEN = true; -- Displays offscreen / off-radar markers
    DISPLAY_TEAMMATES = true; -- Displays markers that belong to your teammates
    DISPLAY_TEAM_COLORS = true; -- Displays your teammates markers with either a custom color (change Team_Marker) or with that teams TeamColor (enable USE_TEAM_COLORS) 
    DISPLAY_FRIEND_COLORS = true; -- Displays your friends markers with a custom color (Friend_Marker). This takes priority over DISPLAY_TEAM_COLORS and DISPLAY_RGB
    DISPLAY_RGB_COLORS = false; -- Displays each marker with an RGB cycle. Takes priority over DISPLAY_TEAM_COLORS, but not DISPLAY_FRIEND_COLORS
    -- scale 
    MARKER_SCALE_BASE = 1.25; -- Base scale that gets applied to markers
    MARKER_SCALE_MAX = 1.25; -- The biggest size that a marker can be
    MARKER_SCALE_MIN = 0.75; -- The smallest size that a marker can be
    -- falloff 
    MARKER_FALLOFF = true; -- Affects the markers' scale depending on how far away the player is - bypasses SCALE_MIN and SCALE_MAX
    MARKER_FALLOFF_AMNT = 125; -- How close someone has to be for falloff to start affecting them 
    -- misc 
    OFFSCREEN_TRANSPARENCY = 0.3; -- Transparency of offscreen markers
    USE_FALLBACK = false; -- Enables an emergency "fallback mode" for StreamingEnabled games
    USE_QUADS = true; -- Displays radar markers as arrows instead of dots 
    USE_TEAM_COLORS = false; -- Uses a team's TeamColor for marker colors
    VISIBLITY_CHECK = false; -- Makes markers that are not visible slightly transparent 
    
    --- Theme
    RADAR_THEME = {
        -- radar
        Outline = Color3.fromRGB(35, 35, 45); -- Radar outline
        Background = Color3.fromRGB(25, 25, 35); -- Radar background
        DragHandle = Color3.fromRGB(50, 50, 255); -- Drag handle 
        
        -- lines
        Cardinal_Lines = Color3.fromRGB(110, 110, 120); -- Color of the horizontal and vertical lines
        Distance_Lines = Color3.fromRGB(65, 65, 75); -- Color of the distance rings
        
        -- markers
        Generic_Marker = Color3.fromRGB(255, 25, 115); -- Color of a player marker without a team
        Local_Marker = Color3.fromRGB(115, 25, 255); -- Color of your marker, regardless of team
        Team_Marker = Color3.fromRGB(25, 115, 255); -- Color of your teammates markers. Used when USE_TEAM_COLORS is disabled
        Friend_Marker = Color3.fromRGB(25, 255, 115); -- Color of your friends markers. Used when DISPLAY_FRIEND_COLORS is enabled 
    };
}

do 
    --- Radar settings 
    -- lines 
    local RADAR_LINES = settings.RADAR_LINES
    local RADAR_LINE_DISTANCE = settings.RADAR_LINE_DISTANCE
    -- scale
    local RADAR_SCALE = settings.RADAR_SCALE
    local RADAR_RADIUS = settings.RADAR_RADIUS
    -- rotation
    local RADAR_ROTATION = settings.RADAR_ROTATION
    local SMOOTH_ROT = settings.SMOOTH_ROT
    local SMOOTH_ROT_AMNT = settings.SMOOTH_ROT_AMNT
    -- misc
    local CARDINAL_DISPLAY = settings.CARDINAL_DISPLAY

    --- Marker settings
    -- display
    local DISPLAY_OFFSCREEN = settings.DISPLAY_OFFSCREEN
    local DISPLAY_TEAMMATES = settings.DISPLAY_TEAMMATES
    local DISPLAY_TEAM_COLORS = settings.DISPLAY_TEAM_COLORS
    local DISPLAY_FRIEND_COLORS = settings.DISPLAY_FRIEND_COLORS
    local DISPLAY_RGB_COLORS = settings.DISPLAY_RGB_COLORS
    -- scale 
    local MARKER_SCALE_BASE = settings.MARKER_SCALE_BASE
    local MARKER_SCALE_MAX = settings.MARKER_SCALE_MAX
    local MARKER_SCALE_MIN = settings.MARKER_SCALE_MIN
    -- falloff 
    local MARKER_FALLOFF = settings.MARKER_FALLOFF
    local MARKER_FALLOFF_AMNT = settings.MARKER_FALLOFF_AMNT
    -- misc 
    local OFFSCREEN_TRANSPARENCY = settings.OFFSCREEN_TRANSPARENCY
    local USE_FALLBACK = settings.USE_FALLBACK
    local USE_QUADS = settings.USE_QUADS
    local USE_TEAM_COLORS = settings.USE_TEAM_COLORS
    local VISIBLITY_CHECK = settings.VISIBLITY_CHECK

    if ( DISPLAY_RGB_COLORS and DISPLAY_TEAM_COLORS ) then
        DISPLAY_TEAM_COLORS = false 
    end

    --- Theme 
    local RADAR_THEME = settings.RADAR_THEME 

    --- Services ---
    local inputService = game:GetService('UserInputService')
    local playerService = game:GetService('Players')
    local runService = game:GetService('RunService')
    local starterGui = game:GetService('StarterGui')

    --- Localization ---
    local newV2 = Vector2.new
    local newV3 = Vector3.new

    local mathSin = math.sin
    local mathCos = math.cos
    local mathExp = math.exp

    --- Important tables ---
    local scriptCns = {}
    local radarObjects = {}

    --- Other variables
    local markerScale = math.clamp(RADAR_SCALE, MARKER_SCALE_MIN, MARKER_SCALE_MAX) * MARKER_SCALE_BASE
    local scaleVec = newV2(markerScale, markerScale)

    local quadPointA = newV2(0, 5)   * scaleVec
    local quadPointB = newV2(4, -5)  * scaleVec
    local quadPointC = newV2(0, -3)  * scaleVec
    local quadPointD = newV2(-4, -5) * scaleVec

    --- Drawing setup ---
    local drawObjects = {}
    local function newDrawObj(objectClass, objectProperties) -- this method is cringe but it's easy to work with 
        local obj = Drawing.new(objectClass)
        table.insert(drawObjects, obj)
        
        for i, v in pairs(objectProperties) do
            obj[i] = v
        end

        objectProperties = nil
        return obj
    end

    -- Drawing tween function 
    local tweenExp, tweenQuad do -- obj property dest time 
        local function numLerp(a, b, c) -- skidded from wikipedia (😱😱)
            return (1 - c) * a + c * b
        end
        
        local tweenTypes = {}
        tweenTypes.Vector2 = Vector2.zero.Lerp
        tweenTypes.number = numLerp
        tweenTypes.Color3 = Color3.new().Lerp
        
        -- https://easings.net is useful for easing funcs
        
        function tweenExp(obj, property, dest, duration) 
            task.spawn(function()
                local initialVal = obj[property]
                local tweenTime = 0
                local lerpFunc = tweenTypes[typeof(dest)]
                
                while ( tweenTime < duration ) do 
                    
                    obj[property] = lerpFunc(initialVal, dest, 1 - math.pow(2, -10 * tweenTime / duration))
                    
                    local deltaTime = task.wait()
                    tweenTime += deltaTime
                end

                obj[property] = dest
            end)
        end
        
        function tweenQuad(obj, property, dest, duration, func) 
            task.spawn(function()
                local initialVal = obj[property]
                local tweenTime = 0
                local lerpFunc = tweenTypes[typeof(dest)]
                
                while ( tweenTime < duration ) do 
                    obj[property] = lerpFunc(initialVal, dest, 1 - (1 - tweenTime / duration) * (1 - tweenTime / duration))
                    if ( func ) then
                        func(obj[property]) 
                    end
                    
                    local deltaTime = task.wait()
                    tweenTime += deltaTime
                end

                obj[property] = dest
            end)
        end
    end

    --- Local object manager --- 
    local errMessage = 'Failed to get the %s instance. Your game may be unsupported, or simply has not finished loading.'

    local clientPlayer = playerService.LocalPlayer

    if ( not clientPlayer ) then
        for _, con in pairs(scriptCns) do 
            con:Disconnect() 
        end
        
        return messagebox(string.format(errMessage, 'LocalPlayer'), 'Player Radar', 0)
    end

    local clientRoot do 
        scriptCns.charRespawn = clientPlayer.CharacterAdded:Connect(function(newChar) 
            clientRoot = newChar:WaitForChild('HumanoidRootPart')
            
            if ( clientRoot ) then
                radarObjects.loadText.Visible = false 
                radarObjects.loadOverlay.Visible = false  
            else
                radarObjects.loadText.Visible = true 
                radarObjects.loadOverlay.Visible = true  
            end
        end)
        
        if ( clientPlayer.Character ) then 
            clientRoot = clientPlayer.Character:FindFirstChild('HumanoidRootPart')
        end
    end

    local clientCamera do 
        scriptCns.cameraUpdate = workspace:GetPropertyChangedSignal('CurrentCamera'):Connect(function() 
            clientCamera = workspace.CurrentCamera or workspace:FindFirstChildOfClass('Camera')
        end)

        clientCamera = workspace.CurrentCamera or workspace:FindFirstChildOfClass('Camera')
    end

    if ( not clientCamera ) then -- tested this out, deleting the camera instantly makes a new one but who cares
        for _, con in pairs(scriptCns) do 
            con:Disconnect() 
        end
        
        return messagebox(string.format(errMessage, 'Camera'), 'Player Radar', 0)
    end

    local clientTeam do 
        scriptCns.teamUpdate = clientPlayer:GetPropertyChangedSignal('Team'):Connect(function() 
            clientTeam = clientPlayer.Team
        end)

        clientTeam = clientPlayer.Team
    end

    --- PlaceID Check --- 
    do
        local thisId = game.PlaceId
        local retardedGames = {
            292439477;   -- Phantom forces - support might be added
            3233893879;  -- Bad business
            8130299583;  -- Trident survival (server browser?) - support might be added
            9570110925;  -- Trident survival (server) - support might be added
        }
        local gameNotes = {
            [379614936] = 'This game is known to fuck up the radar - waiting a round should fix'; -- Assassins
            [2474168535] = 'Players that are lassoed don\'t appear on the radar properly'; -- Westbound 
        }
        
        local halfWidth = clientCamera.ViewportSize.X / 2
        
        local notif = Drawing.new('Text')
        notif.Center = true
        notif.Color = Color3.fromRGB(255, 255, 255)
        notif.Font = Drawing.Fonts.UI
        notif.Outline = true
        notif.Position = newV2(halfWidth, 200)
        notif.Size = 22
        notif.Transparency = 0 
        notif.Visible = true 
        notif.ZIndex = 500 
        
        if ( table.find(retardedGames, thisId) ) then
            notif.Text = 'Games with custom character systems\naren\'t supported. Sorry!'
            
            tweenExp(notif, 'Transparency', 1, 0.25)
            tweenExp(notif, 'Position', newV2(halfWidth, 150), 0.25)
            task.wait(5)
            
            tweenExp(notif, 'Position', newV2(halfWidth, 200), 0.25)
            tweenExp(notif, 'Transparency', 0, 0.25)
            task.wait(0.5)
            
            for _, con in pairs(scriptCns) do 
                con:Disconnect()
            end
            
            notif:Remove()
            return
        else
            -- might as well place loaded notification here 
            notif.Text = ('Loaded Drawing Radar %s\n\nControls:\n[-]: zoom out     [+]: zoom in     [End]: exit script'):format(scriptver) -- [Home]: toggle radar 
            
            local gameWarning = gameNotes[thisId]
            
            if ( gameWarning ) then 
                notif.Text = notif.Text .. string.format('\n\nGame warning: %s', gameWarning) -- fuck fluxus for not having ..= support 
            end
            
            task.spawn(function()
                tweenExp(notif, 'Transparency', 1, 0.25)
                tweenExp(notif, 'Position', newV2(halfWidth, 150), 0.25)
                task.wait(gameWarning and 10 or 5)
                
                tweenExp(notif, 'Position', newV2(halfWidth, 200), 0.25)
                tweenExp(notif, 'Transparency', 0, 0.25)
                task.wait(0.5)
                
                if ( workspace.StreamingEnabled ) then
                    notif.Text = 'It looks like this game uses StreamingEnabled - Fallback mode is now enabled.'
                    tweenExp(notif, 'Transparency', 1, 0.25)
                    tweenExp(notif, 'Position', newV2(halfWidth, 150), 0.25)
                    task.wait(5)
                    
                    tweenExp(notif, 'Position', newV2(halfWidth, 200), 0.25)
                    tweenExp(notif, 'Transparency', 0, 0.25)
                    task.wait(1)
                end
                
                notif:Remove()
            end)
        end
    end

    --- Player managers --- 
    if ( workspace.StreamingEnabled ) then
        USE_FALLBACK = true
    end

    local playerManagers = {}
    if ( game.PlaceId == 292439477 ) then -- Phantom forces support (being developed soon 🤑)
        local function removePlayer(player) 
        end
        
        local function readyPlayer(thisPlayer) 
        
        end
        
        -- Setup managers for every existing player 
        for _, player in ipairs(playerService:GetPlayers()) do
            if ( player ~= clientPlayer ) then
                readyPlayer(player)
            end
        end

        -- Setup managers for joining players, and clean managers for leaving players
        scriptCns.pm_playerAdd = playerService.PlayerAdded:Connect(readyPlayer)
        scriptCns.pm_playerRemove = playerService.PlayerRemoving:Connect(removePlayer)
    else
        
        local function removePlayer(player) 
            local thisName = player.Name
            local thisManager = playerManagers[thisName]

            -- had an error randomly happen where there was no manager made for someone before they were removed
            -- definitely not getting a 0.000001% chance of some retard joining then leaving a microsecond later
            -- so now there's this check for some random race condition that happens every 8 billion years 
            if ( not thisManager ) then
                return
            end
            local thisPlayerCns = thisManager.Cns
                    
            if ( thisManager.onLeave ) then 
                thisManager.onLeave()
            end
            
            for _, con in pairs(thisPlayerCns) do
                con:Disconnect()
            end
            
            thisManager.onDeath = nil
            thisManager.onLeave = nil
            thisManager.onRemoval = nil
            thisManager.onRespawn = nil
            thisManager.onTeamChange = nil 
            
            thisManager.Player = nil
            
            playerManagers[thisName] = nil 
        end
        
        local function readyPlayer(thisPlayer) 
            local thisName = thisPlayer.Name

            local thisManager = {}
            local thisPlayerCns = {}
            
            local function deathFunc() -- Reusable on-death function - done so the same function doesnt get made 9138589135 times 
                if ( thisManager.onDeath ) then
                    thisManager.onDeath()
                end
            end

            -- Setup connections
            thisPlayerCns['chr-add'] = thisPlayer.CharacterAdded:Connect(function(newChar) -- This handles when a player respawns
                if ( USE_FALLBACK ) then
                    thisManager.Character = newChar 
                    return  
                end
                
                -- Get the new instances 
                local RootPart = newChar:WaitForChild('HumanoidRootPart')
                local Humanoid = newChar:WaitForChild('Humanoid')
                
                -- Call onRespawn
                if ( thisManager.onRespawn ) then
                    thisManager.onRespawn()
                end
                -- Update manager values 
                thisManager.Character = newChar
                thisManager.RootPart = RootPart
                thisManager.Humanoid = Humanoid
                
                -- Re-connect the death connection 
                if ( thisPlayerCns['chr-die'] ) then
                    thisPlayerCns['chr-die']:Disconnect()
                end
                thisPlayerCns['chr-die'] = Humanoid.Died:Connect(deathFunc)
            end)

            thisPlayerCns['chr-remove'] = thisPlayer.CharacterRemoving:Connect(function() -- This handles when a player's character gets removed 
                if ( USE_FALLBACK ) then
                    thisManager.Character = nil 
                    return  
                end
                
                -- Call onRemoval
                if ( thisManager.onRemoval ) then
                    thisManager.onRemoval()
                end
                
                -- Update manager values 
                thisManager.Character = nil
                thisManager.RootPart = nil
                thisManager.Humanoid = nil 
            end)
            
            thisPlayerCns['team'] = thisPlayer:GetPropertyChangedSignal('Team'):Connect(function()  -- This handles team changing, self explanatory
                thisManager.Team = thisPlayer.Team
                
                if ( thisManager.onTeamChange ) then
                    thisManager.onTeamChange(thisManager.Team)
                end
            end)
            
            -- Check for an existing character
            if ( thisPlayer.Character ) then
                -- Fetch some stuff
                local Character = thisPlayer.Character
                local Humanoid = Character:FindFirstChild('Humanoid')
                local RootPart = Character:FindFirstChild('HumanoidRootPart')

                -- Set manager values 
                thisManager.Character = Character
                thisManager.RootPart = RootPart
                thisManager.Humanoid = Humanoid 

                if ( Humanoid ) then
                    -- Setup death connection *only if the humanoid exists*
                    -- This previously wasn't checked for which probably constantly errored, oops 🗿
                    thisPlayerCns['chr-die'] = Humanoid.Died:Connect(deathFunc)
                end
            end
            
            -- Set existing values 
            thisManager.Team = thisPlayer.Team
            thisManager.Player = thisPlayer
            thisManager.Name = thisName 
            thisManager.DisplayName = thisPlayer.DisplayName  
            thisManager.Friended = clientPlayer:IsFriendsWith(thisPlayer.UserId)
            thisManager.GetCFrame = function() 
                local thisRoot = thisManager.RootPart
                local cframe  
                
                if ( thisRoot ) then
                    cframe = thisRoot.CFrame
                elseif ( USE_FALLBACK and thisManager.Character ) then 
                    cframe = thisManager.Character:GetPivot()
                end
                
                return cframe 
            end
            
            -- Finalize
            thisManager.Cns = thisPlayerCns 
            playerManagers[thisName] = thisManager
        end
        
        -- Setup managers for every existing player 
        for _, player in ipairs(playerService:GetPlayers()) do
            if ( player ~= clientPlayer ) then
                readyPlayer(player)
            end
        end

        -- Setup managers for joining players, and clean managers for leaving players
        scriptCns.pm_playerAdd = playerService.PlayerAdded:Connect(readyPlayer)
        scriptCns.pm_playerRemove = playerService.PlayerRemoving:Connect(removePlayer)
    end

    --- Radar UI --- 
    local radarLines = {}
    local radarPosition = newV2(300, 250)

    -- main radar
    radarObjects.main = newDrawObj('Circle', {
        Color = RADAR_THEME.Background;
        Position = radarPosition; 
        
        Filled = true;
        Visible = true;
        
        NumSides = 40;
        Radius = RADAR_RADIUS;
        ZIndex = 300;
    })

    radarObjects.outline = newDrawObj('Circle', {
        Color = RADAR_THEME.Outline;
        Position = radarPosition; 
        
        Filled = false;
        Visible = true;
        
        NumSides = 40;
        Thickness = 10;
        Radius = RADAR_RADIUS;
        ZIndex = 299;
    })

    radarObjects.dragHandle = newDrawObj('Circle', {
        Color = RADAR_THEME.DragHandle;
        Position = radarPosition; 
        
        Filled = false;
        Visible = false;
        
        NumSides = 40;
        Radius = RADAR_RADIUS;
        Thickness = 3;
        ZIndex = 325;
    })

    -- spawn overlay
    radarObjects.loadOverlay = newDrawObj('Circle', {
        Color = Color3.new(0, 0, 0);
        Filled = true;
        NumSides = 40;
        Position = radarPosition; 
        Radius = RADAR_RADIUS;
        Transparency = 0.5;
        Visible = clientRoot == nil;
        ZIndex = 319;
    })

    radarObjects.loadText = newDrawObj('Text', {
        Center = true;
        Color = Color3.fromRGB(255, 255, 255);
        Font = Drawing.Fonts.UI;
        Outline = true;
        Position = radarPosition - newV2(0, 15);
        Size = 20;
        Text = 'Waiting for you to spawn in...';
        Transparency = 1;
        Visible = clientRoot == nil;
        ZIndex = 320;
    })

    -- text
    radarObjects.zoomText = newDrawObj('Text', {
        Center = true;
        Color = Color3.fromRGB(255, 255, 255);
        Font = Drawing.Fonts.UI;
        Outline = true;
        Size = 20;
        Transparency = 0;
        Visible = true;
        ZIndex = 306;
    })

    radarObjects.hoverText = newDrawObj('Text', {
        Center = true;
        Color = Color3.fromRGB(255, 255, 255);
        Font = Drawing.Fonts.UI;
        Outline = true;
        Position = radarPosition;
        Size = 16;
        Transparency = 1;
        Visible = false;
        ZIndex = 306;
    })

    -- center marker
    if ( USE_QUADS ) then 
        radarObjects.localMark = newDrawObj('Quad', {
            Color = RADAR_THEME.Local_Marker;
            Filled = true;
            Thickness = 2;
            Visible = true;
            ZIndex = 305;
        })
        
        radarObjects.localMarkStroke = newDrawObj('Quad', {
            Color = RADAR_THEME.Local_Marker;
            Filled = false;
            Thickness = 2;
            Visible = true;
            ZIndex = 304;
        })
    else
        radarObjects.localMark = newDrawObj('Circle', {
            Color = RADAR_THEME.Local_Marker;
            Filled = true;
            NumSides = 20;
            Thickness = 2;
            Visible = true;
            ZIndex = 305;
        })
        
        radarObjects.localMarkStroke = newDrawObj('Circle', {
            Color = RADAR_THEME.Local_Marker;
            Filled = false;
            NumSides = 20;
            Thickness = 1;
            Visible = true;
            ZIndex = 304;
        })
    end

    -- lines
    if ( RADAR_LINES ) then 
        for i = 0, RADAR_RADIUS, RADAR_SCALE * RADAR_LINE_DISTANCE do 
            local thisLine = newDrawObj('Circle', {
                Color = RADAR_THEME.Distance_Lines;
                Position = radarPosition; 
                Radius = i;
                
                Filled = false;
                Visible = true;
                
                Transparency = ((i / RADAR_LINE_DISTANCE) % 4 == 0) and 0.8 or 0.2;
                NumSides = 40;
                Thickness = 1;
                ZIndex = 300;
            })
            
            table.insert(radarLines, thisLine)
        end
        
        radarObjects.horizontalLine = newDrawObj('Line', {
            Color = RADAR_THEME.Cardinal_Lines;
            From = radarPosition - newV2(RADAR_RADIUS, 0);
            To = radarPosition + newV2(RADAR_RADIUS, 0);
                    
            Visible = true; 
            
            Thickness = 1;
            Transparency = 0.2;
            ZIndex = 300;
        })
        
        radarObjects.verticalLine = newDrawObj('Line', {
            Color = RADAR_THEME.Cardinal_Lines;
            From = radarPosition - newV2(0, RADAR_RADIUS);
            To = radarPosition + newV2(0, RADAR_RADIUS);
            
            Visible = true; 
            
            Thickness = 1;
            Transparency = 0.2;
            ZIndex = 300;
        })
    else
        radarLines = nil 
    end

    -- NSWE display 
    if ( CARDINAL_DISPLAY ) then
        radarObjects.directionN = newDrawObj('Text', {
            Center = true;
            Color = Color3.fromRGB(255, 255, 255);
            Font = Drawing.Fonts.UI;
            Outline = true;
            Size = 16;
            Text = 'N';
            Transparency = 1;
            Visible = true;
            ZIndex = 303;
        })

        radarObjects.directionS = newDrawObj('Text', {
            Center = true;
            Color = Color3.fromRGB(255, 255, 255);
            Font = Drawing.Fonts.UI;
            Outline = true;
            Size = 16;
            Text = 'S';
            Transparency = 1;
            Visible = true;
            ZIndex = 303;
        })

        radarObjects.directionW = newDrawObj('Text', {
            Center = true;
            Color = Color3.fromRGB(255, 255, 255);
            Font = Drawing.Fonts.UI;
            Outline = true;
            Size = 16;
            Text = 'W';
            Transparency = 1;
            Visible = true;
            ZIndex = 303;
        })

        radarObjects.directionE = newDrawObj('Text', {
            Center = true;
            Color = Color3.fromRGB(255, 255, 255);
            Font = Drawing.Fonts.UI;
            Outline = true;
            Size = 16;
            Text = 'E';
            Transparency = 1;
            Visible = true;
            ZIndex = 303;
        })
    end

    --- Other functions ---
    local destroying = false 
    local function killScript() -- destroys the script; self explanatory
        if ( destroying ) then
            return
        end 
        
        destroying = true
        
        for _, con in pairs(scriptCns) do 
            con:Disconnect()
        end
        
        task.wait()
        for name, manager in pairs(playerManagers) do 
            for _, con in pairs(manager.Cns) do
                con:Disconnect()
            end
            
            -- just in case 
            manager.onDeath = nil 
            manager.onLeave = nil 
            manager.onRespawn = nil 
            manager.onRemoval = nil 
            manager.onTeamChange = nil 

            playerManagers[name] = nil 
        end
        
        for _, obj in ipairs(drawObjects) do 
            tweenExp(obj, 'Transparency', 0, 0.5)
        end
        
        task.wait(1)
        
        if ( not drawObjects ) then
            return
        end
        
        for _, obj in ipairs(drawObjects) do 
            obj:Remove()
        end
        _G.RadarKill = nil 
        drawObjects = nil
    end

    local function setRadarScale() -- updates the radar's scale using RADAR_SCALE 
        markerScale = math.clamp(RADAR_SCALE, MARKER_SCALE_MIN, MARKER_SCALE_MAX) * MARKER_SCALE_BASE
        
        if ( RADAR_LINES ) then
            -- Calculate how many radar lines can fit at this scale 
            local lineCount = math.floor(RADAR_RADIUS / (RADAR_SCALE * RADAR_LINE_DISTANCE))
            
            -- If more lines can fit than there are made, make more 
            if ( lineCount > #radarLines ) then
                for i = 1, lineCount - #radarLines do 
                    
                    local thisLine = newDrawObj('Circle', {
                        Color = RADAR_THEME.Distance_Lines;
                        
                        Position = radarPosition;
                        
                        Filled = false;
                        Visible = true;
                        
                        NumSides = 40;
                        Thickness = 1;
                        ZIndex = 300;
                    })
                    
                    table.insert(radarLines, thisLine)
                end
            end
            
            -- Position every single line 
            for idx, line in ipairs(radarLines) do 
                if ( idx > lineCount ) then
                    -- This line wont fit, hide it 
                    line.Visible = false 
                else
                    -- This line fits, set its radius and display it 
                    line.Radius = idx * (RADAR_SCALE * RADAR_LINE_DISTANCE)
                    line.Transparency = (idx % 4 == 0) and 0.8 or 0.2
                    line.Visible = true
                end
            end
        end
        
        
        if ( USE_QUADS ) then 
            scaleVec = newV2(markerScale, markerScale)
            
            quadPointA = newV2(0, 5)   * scaleVec
            quadPointB = newV2(4, -5)  * scaleVec
            quadPointC = newV2(0, -3)  * scaleVec
            quadPointD = newV2(-4, -5) * scaleVec
        else
            radarObjects.localMark.Radius = markerScale * 3
            radarObjects.localMarkStroke.Radius = markerScale * 3 
        end
    end

    local function setRadarPosition(newPosition) -- sets the radar's position to newPosition
        radarPosition = newPosition
            
        radarObjects.main.Position = newPosition
        radarObjects.outline.Position = newPosition
        
        
        radarObjects.loadOverlay.Position = newPosition
        radarObjects.loadText.Position = newPosition - newV2(0, 15)
        
        if ( RADAR_LINES ) then
            for _, line in ipairs(radarLines) do 
                line.Position = newPosition
            end 
            
            radarObjects.horizontalLine.From = newPosition - newV2(RADAR_RADIUS, 0);
            radarObjects.horizontalLine.To = newPosition + newV2(RADAR_RADIUS, 0);
            
            radarObjects.verticalLine.From = newPosition - newV2(0, RADAR_RADIUS);
            radarObjects.verticalLine.To = newPosition + newV2(0, RADAR_RADIUS);
        end
        
        radarObjects.hoverText.Position = newPosition
    end

    --- Input and drag handling ---
    do
        local radarDragging = false
        local radarHovering = false
        
        local zoomingIn = false
        local zoomingOut = false
            
        -- The keycode is only checked if its found in this dictionary,
        -- just so a giant elif chain isnt done on every keypress
        local keysToCheck = {
            End = true;
            Equals = true;
            Minus = true;
        }
        
        scriptCns.inputBegan = inputService.InputBegan:Connect(function(io) 
            local inputType = io.UserInputType.Name

            if ( inputType == 'Keyboard' ) then
                local keyCode = io.KeyCode.Name
                
                if ( not keysToCheck[keyCode] ) then
                    return
                end
                
                if ( keyCode == 'End' ) then
                    killScript() 
                elseif ( keyCode == 'Equals' ) then
                    zoomingIn = true 
                    
                    local zoomText = radarObjects.zoomText
                    zoomText.Position = radarPosition + newV2(0, RADAR_RADIUS + 25)
                    tweenExp(zoomText, 'Transparency', 1, 0.3)
                    
                    local accel = 0.75
                    
                    scriptCns.zoomInCn = runService.Heartbeat:Connect(function(deltaTime) 
                        RADAR_SCALE = math.clamp(RADAR_SCALE + (deltaTime * accel), 0.02, 3)
                        
                        --[[if ( zoomingIn ) then
                            accel += deltaTime
                        else
                            accel /= 1.5
                        end]]
                        
                        accel += deltaTime
                        
                        zoomText.Text = ('Scale: %.2f'):format(RADAR_SCALE)
                        setRadarScale()
                    end)
                elseif ( keyCode == 'Minus' ) then
                    zoomingOut = true
                    
                    local zoomText = radarObjects.zoomText
                    zoomText.Position = radarPosition + newV2(0, RADAR_RADIUS + 25)
                    tweenExp(zoomText, 'Transparency', 1, 0.3)
                    
                    local accel = 0.75
                    
                    scriptCns.zoomOutCn = runService.Heartbeat:Connect(function(deltaTime) 
                        RADAR_SCALE = math.clamp(RADAR_SCALE - (deltaTime * accel), 0.02, 3)
                        
                        accel += deltaTime
                        
                        zoomText.Text = ('Scale: %.2f'):format(RADAR_SCALE)
                        setRadarScale()
                    end)    
                end
            elseif ( inputType == 'MouseButton1' ) then
                local mousePos = inputService:GetMouseLocation()
                
                if ( (mousePos - radarPosition).Magnitude < RADAR_RADIUS ) then
                    radarDragging = true
                    radarObjects.dragHandle.Visible = true
                    
                    scriptCns.dragCn = inputService.InputChanged:Connect(function(io) 
                        if ( io.UserInputType.Name == 'MouseMovement' ) then
                            local mousePos = inputService:GetMouseLocation()
                            radarObjects.dragHandle.Position = mousePos
                        end
                    end)
                end
            end
        end)

        scriptCns.inputEnded = inputService.InputEnded:Connect(function(io) 
            local inputType = io.UserInputType.Name
            if ( inputType == 'Keyboard' ) then
                local keyCode = io.KeyCode.Name
                
                if ( not keysToCheck[keyCode] ) then
                    return
                end
                
                if ( keyCode == 'Equals' ) then
                    zoomingIn = false 
                    
                    if ( zoomingOut == false ) then 
                        tweenExp(radarObjects.zoomText, 'Transparency', 0, 0.3)
                    end      
                            
                    local zoomCn = scriptCns.zoomInCn
                    if ( zoomCn and zoomCn.Connected ) then 
                        -- task.wait(0.3)
                        zoomCn:Disconnect()
                    end
                elseif ( keyCode == 'Minus' ) then
                    zoomingOut = false
                    
                    if ( zoomingIn == false ) then 
                        tweenExp(radarObjects.zoomText, 'Transparency', 0, 0.3)
                    end
                    
                    local zoomCn = scriptCns.zoomOutCn
                    if ( zoomCn and zoomCn.Connected ) then 
                        -- task.wait(0.3)
                        zoomCn:Disconnect()
                    end
                end
                
            elseif ( inputType == 'MouseButton1' ) then
                if ( radarDragging ) then
                    scriptCns.dragCn:Disconnect()
                    radarDragging = false 
                    
                    setRadarPosition(radarObjects.dragHandle.Position)
                    radarObjects.dragHandle.Visible = false 
                end
            end
        end)
    end

    --- Player marker setup ---
    local playerMarks = {} do 
        local function initMark(thisPlayer)
            local thisName = thisPlayer.Name 
            local thisManager = playerManagers[thisName]
            
            
            if ( not thisManager ) then -- no char manager for this player yet 
                for i = 1, 10 do -- wait and check 10 times 
                    thisManager = playerManagers[thisName]
                    if ( thisManager ) then -- if its found then cancel the wait 
                        break
                    end
                    task.wait(0.5)
                end 
                
                if ( not thisManager ) then -- if there is no manager when the loop ends, return out
                    return
                end
            end
            
            local markers = {} 
            
            local markMain
            local markStroke
            
            --- Create markers 
            if ( USE_QUADS ) then 
                markMain = Drawing.new('Quad')
                markMain.Filled = true
                markMain.Thickness = 2
                markMain.Visible = true
                markMain.ZIndex = 303
                
                markStroke = Drawing.new('Quad')
                markStroke.Filled = false
                markStroke.Thickness = 2
                markStroke.Transparency = 0
                markStroke.ZIndex = 302
            else
                markMain = Drawing.new('Circle')
                markMain.Filled = true
                markMain.NumSides = 20
                markMain.Radius = markerScale * 3
                markMain.Thickness = 2
                markMain.Visible = true
                markMain.ZIndex = 303
                
                markStroke = Drawing.new('Circle')
                markStroke.Filled = false
                markStroke.NumSides = 20
                markStroke.Radius = markerScale * 3
                markStroke.Thickness = 1
                markStroke.Visible = true
                markStroke.ZIndex = 302
            end
            
            --- Register drawing objects
            table.insert(drawObjects, markMain)
            table.insert(drawObjects, markStroke)
            
            --- Setup callbacks
            thisManager.onDeath = function()
                markMain.Filled = false
            end
            thisManager.onRespawn = function()
                markMain.Filled = true
                
                markMain.Visible = true
                markStroke.Visible = true 
            end
            thisManager.onRemoval = function()
                markMain.Visible = false 
                markStroke.Visible = false
            end
            thisManager.onLeave = function()
                table.remove(drawObjects, table.find(drawObjects, markMain))
                table.remove(drawObjects, table.find(drawObjects, markStroke))

                task.spawn(function() 
                    tweenExp(markMain, 'Transparency', 0, 1)
                    tweenExp(markStroke, 'Transparency', 0, 1)
                    task.wait(1.5)
                    markMain:Remove()
                    markStroke:Remove()
                end)
                
                playerMarks[thisName] = nil
            end
            
            if ( DISPLAY_TEAM_COLORS ) then 
                thisManager.onTeamChange = function(team) 
                    if ( DISPLAY_FRIEND_COLORS and thisManager.Friended ) then 
                        return
                    end
                    
                    local color 
                    if ( USE_TEAM_COLORS ) then
                        color = thisPlayer.TeamColor.Color
                    elseif ( team == clientTeam ) then
                        color = RADAR_THEME.Team_Marker
                    else
                        color = RADAR_THEME.Generic_Marker
                    end
                    
                    markMain.Color = color
                    markStroke.Color = color
                end
            end 
            
            local color 
            
            -- friend check 
            if ( DISPLAY_FRIEND_COLORS and thisManager.Friended ) then -- friend colors take first priority
                color = RADAR_THEME.Friend_Marker
            elseif ( DISPLAY_TEAM_COLORS ) then  
                if ( USE_TEAM_COLORS ) then
                    color = thisPlayer.TeamColor.Color
                elseif ( thisPlayer.Team == clientTeam ) then
                    color = RADAR_THEME.Team_Marker
                else
                    color = RADAR_THEME.Generic_Marker
                end
            else
                color = RADAR_THEME.Generic_Marker
            end
            
            markMain.Color = color 
            markStroke.Color = color 
            
            markers.main = markMain 
            markers.stroke = markStroke
            
            if ( thisManager.Humanoid and thisManager.Humanoid.Health == 0 ) then
                thisManager.onDeath()
            end
            
            playerMarks[thisName] = markers
            return markers
        end
        
        for _, manager in pairs(playerManagers) do
            initMark(manager.Player)
        end
        
        scriptCns.addMarks = playerService.PlayerAdded:Connect(function(player) 
            task.wait(0.3) -- This will hopefully prevent loading issues
            initMark(player)
        end)
    end

    local hoverPlayer
    -- Hover display
    do 

        local lastCheckTime = 0
        
        scriptCns.inputChanged = inputService.InputChanged:Connect(function(input) 
            local nowTime = tick() -- Funky optimization 

            if ( nowTime - lastCheckTime > 0.05 and input.UserInputType.Name == 'MouseMovement' ) then
                lastCheckTime = nowTime
                local mousePos = inputService:GetMouseLocation()
                
                -- Check if the mouse is inside of the radar 
                if ( (mousePos - radarPosition).Magnitude < RADAR_RADIUS ) then
                    -- Get the closest player and set the hover text to their name 

                    local distanceThresh = 50 -- math.huge 🤓🤓🤓🤓🤓🤓🤓
                    hoverPlayer = nil
                    
                    for thisName in pairs(playerManagers) do 
                        local thisMark = playerMarks[thisName]
                        -- safety marker check, in case the player hasnt finished loading in 
                        if ( not thisMark ) then
                            continue
                        end
                        
                        local markPos = thisMark.main[USE_QUADS and 'PointD' or 'Position']
                        local distance = (mousePos - markPos).Magnitude

                        if ( distance < distanceThresh ) then
                            distanceThresh = distance
                            hoverPlayer = thisName
                        end
                    end
                    
                    if ( hoverPlayer == nil ) then
                        radarObjects.hoverText.Visible = false  
                    end
                else
                    hoverPlayer = nil
                    radarObjects.hoverText.Visible = false 
                end
            end
        end)
    end

    --- Main radar loop ---

    -- Coordinate conversion functions
    local function cartToPolar(x, y) 
        return math.sqrt(x^2 + y^2), math.atan2(y, x)
    end
    local function polarToCart(r, t) 
        return r * mathCos(t), r * mathSin(t)
    end

    do
        local finalLookVec = Vector3.zero
        
        local hOffset = newV2(RADAR_RADIUS, 0) -- Horizontal offset
        local vOffset = newV2(0, RADAR_RADIUS) -- Vertical offset
        
        local textOffset = newV2(0, 5)
        
        local rad90 = math.rad(90)
        local rad180 = math.rad(180)
        
        local rayParams
        if ( VISIBLITY_CHECK ) then
            rayParams = RaycastParams.new()
            rayParams.FilterType = Enum.RaycastFilterType.Blacklist
            rayParams.FilterDescendantsInstances = { clientPlayer.Character }
            
            scriptCns.rayUpdate = clientPlayer.CharacterAdded:Connect(function(newChar) 
                rayParams.FilterDescendantsInstances = { newChar }
            end)
        end
        
        scriptCns.radarLoop = runService.Heartbeat:Connect(function(deltaTime) 
            -- Safety rootpart check
            if ( not clientRoot ) then 
                return 
            end

            local selfPos = clientRoot.Position
            local cameraPos
            local camAngle = 0 

            -- Camera angle
            do 
                if ( RADAR_ROTATION ) then 
                    local cameraLookVec = clientCamera.CFrame.LookVector
                    local fixedLookVec = newV3(cameraLookVec.X, 0, cameraLookVec.Z).Unit
                    
                    if ( SMOOTH_ROT ) then
                        finalLookVec = finalLookVec:Lerp(fixedLookVec, 1 - mathExp(-SMOOTH_ROT_AMNT * deltaTime))
                    else
                        finalLookVec = fixedLookVec
                    end
                    
                    camAngle = math.atan2(finalLookVec.X, finalLookVec.Z)
                else
                    camAngle = rad180
                end
                
                cameraPos = clientCamera.CFrame.Position 
            end
            
            -- Vertical and horizontal lines
            do 
                if ( RADAR_LINES ) then
                    local top = -vOffset
                    local bottom = vOffset
                    local left = -hOffset
                    local right = hOffset
                                    
                    local angleCos = mathCos(-camAngle)
                    local angleSin = mathSin(-camAngle)
                    
                    local fixedTop    = radarPosition + newV2((top.X * angleSin)    - (top.Y * angleCos),    (top.X * angleCos)    + (top.Y * angleSin))
                    local fixedBottom = radarPosition + newV2((bottom.X * angleSin) - (bottom.Y * angleCos), (bottom.X * angleCos) + (bottom.Y * angleSin))     
                    local fixedLeft   = radarPosition + newV2((left.X * angleSin)   - (left.Y * angleCos),   (left.X * angleCos)   + (left.Y * angleSin))  
                    local fixedRight  = radarPosition + newV2((right.X * angleSin)  - (right.Y * angleCos),  (right.X * angleCos)  + (right.Y * angleSin))  
                    
                    local hLine, vLine = radarObjects.horizontalLine, radarObjects.verticalLine
                    
                    hLine.From = fixedLeft
                    hLine.To = fixedRight
                    
                    vLine.From = fixedTop
                    vLine.To = fixedBottom

                    if ( CARDINAL_DISPLAY ) then
                        radarObjects.directionN.Position = fixedRight - textOffset
                        radarObjects.directionS.Position = fixedLeft - textOffset
                        radarObjects.directionW.Position = fixedTop - textOffset
                        radarObjects.directionE.Position = fixedBottom - textOffset
                    end
                end
            end
            
            -- Centermark
            do
                local localMark = radarObjects.localMark
                local localMarkStroke = radarObjects.localMarkStroke
                if ( USE_QUADS ) then
                    -- For those of you who didn't pay attention in geometry (like me) this was pretty useful
                    -- https://danceswithcode.net/engineeringnotes/rotations_in_2d/rotations_in_2d.html
                    
                    -- Get player LookVector
                    local playerLookVec = clientRoot.CFrame.LookVector
                    -- Convert it to an "angle" using atan2 and subtract the camera "angle" 
                    local angle = (math.atan2(playerLookVec.X, playerLookVec.Z) - camAngle) - rad90

                    local angleCos = mathCos(angle)
                    local angleSin = mathSin(angle)
                    
                    -- Rotate quad points by angle using the sine and cosine calculated above
                    local fixedA = radarPosition + newV2((quadPointA.X * angleSin) - (quadPointA.Y * angleCos), (quadPointA.X * angleCos) + (quadPointA.Y * angleSin))
                    local fixedB = radarPosition + newV2((quadPointB.X * angleSin) - (quadPointB.Y * angleCos), (quadPointB.X * angleCos) + (quadPointB.Y * angleSin))
                    local fixedC = radarPosition + newV2((quadPointC.X * angleSin) - (quadPointC.Y * angleCos), (quadPointC.X * angleCos) + (quadPointC.Y * angleSin))
                    local fixedD = radarPosition + newV2((quadPointD.X * angleSin) - (quadPointD.Y * angleCos), (quadPointD.X * angleCos) + (quadPointD.Y * angleSin))
                    
                    -- Set points
                    localMark.PointA = fixedA
                    localMark.PointB = fixedB
                    localMark.PointC = fixedC
                    localMark.PointD = fixedD
                    
                    localMarkStroke.PointA = fixedA
                    localMarkStroke.PointB = fixedB 
                    localMarkStroke.PointC = fixedC 
                    localMarkStroke.PointD = fixedD
                else
                    localMark.Position = radarPosition
                    localMark.Radius = markerScale * 3
                    
                    localMarkStroke.Position = radarPosition
                    localMarkStroke.Radius = markerScale * 3
                end
            end
            
            -- Player marks
            do
                for thisName, thisManager in pairs(playerManagers) do 
                    local thisMark = playerMarks[thisName]
                    -- Safety marker check, in case the player hasnt finished loading in 
                    if ( not thisMark ) then
                        continue
                    end
                    local main, stroke = thisMark.main, thisMark.stroke 
                    
                    -- Team check 
                    if ( DISPLAY_TEAMMATES == false and thisManager.Team == clientTeam ) then 
                        if ( DISPLAY_TEAMMATES == false ) then
                            thisMark.main.Visible = false
                            thisMark.stroke.Visible = false 
                            continue
                        end
                    end
                    
                    -- Character check
                    local cframe = thisManager:GetCFrame()
                    if ( not cframe ) then
                        continue
                    end 
                    local position = cframe.Position 
                    
                    -- Get this player's position relative to the localplayer position 
                    local posDelta = position - selfPos
                    
                    local radius, angle = cartToPolar(posDelta.X, posDelta.Z)
                    local fixedRadius = radius * RADAR_SCALE -- This makes the current zoom affect the marker position 
                    
                    -- Radius clamping 
                    if ( fixedRadius > RADAR_RADIUS ) then
                        if ( DISPLAY_OFFSCREEN ) then 
                            main.Transparency = OFFSCREEN_TRANSPARENCY
                            stroke.Transparency = OFFSCREEN_TRANSPARENCY
                        else
                            main.Visible = false
                            stroke.Visible = false 
                            continue
                        end
                    else
                        main.Visible = true
                        stroke.Visible = true 
                        
                        main.Transparency = 1
                        stroke.Transparency = 1 
                    end
                    
                    radius = math.clamp(fixedRadius, 0, RADAR_RADIUS)
                    angle += (camAngle + rad180) -- 180 degrees needs to be added to align things properly (there's probably a good reason but idk why)
                    
                    local x, y = polarToCart(radius, angle)
                    local finalPos = radarPosition + newV2(x, y)
                    
                    -- Marker positioning 
                    if ( USE_QUADS ) then
                        -- Get player LookVector
                        local playerLookVec = cframe.LookVector
                        -- Convert it to an angle using atan2 and subtract the camera angle
                        local angle = (math.atan2(playerLookVec.X, playerLookVec.Z)) - rad90 - camAngle
                        
                        local angleCos = mathCos(angle)
                        local angleSin = mathSin(angle)
                        
                        -- Rotate quad points by angle using the sin and cosine calculated above
                        local fixedA = newV2((quadPointA.X * angleSin) - (quadPointA.Y * angleCos), (quadPointA.X * angleCos) + (quadPointA.Y * angleSin))
                        local fixedB = newV2((quadPointB.X * angleSin) - (quadPointB.Y * angleCos), (quadPointB.X * angleCos) + (quadPointB.Y * angleSin))                
                        local fixedC = newV2((quadPointC.X * angleSin) - (quadPointC.Y * angleCos), (quadPointC.X * angleCos) + (quadPointC.Y * angleSin))  
                        local fixedD = newV2((quadPointD.X * angleSin) - (quadPointD.Y * angleCos), (quadPointD.X * angleCos) + (quadPointD.Y * angleSin))  
                        if ( MARKER_FALLOFF ) then
                            local distance = posDelta.Magnitude
                            local scaleFalloff = math.clamp(MARKER_FALLOFF_AMNT / distance, 0.75, 1)
                            
                            fixedA *= scaleFalloff
                            fixedB *= scaleFalloff
                            fixedC *= scaleFalloff
                            fixedD *= scaleFalloff
                        end
                        fixedA += finalPos
                        fixedB += finalPos
                        fixedC += finalPos
                        fixedD += finalPos
                        -- Set points
                        
                        main.PointA = fixedA
                        main.PointB = fixedB
                        main.PointC = fixedC
                        main.PointD = fixedD
                        
                        stroke.PointA = fixedA
                        stroke.PointB = fixedB
                        stroke.PointC = fixedC
                        stroke.PointD = fixedD
                    else                    
                        local dotRadius = markerScale * 3
                        
                        if ( MARKER_FALLOFF ) then
                            local distance = posDelta.Magnitude
                            local scaleFalloff = math.clamp(MARKER_FALLOFF_AMNT / distance, 0.75, 1)
                            dotRadius *= scaleFalloff
                        end
                        
                        main.Radius = dotRadius
                        main.Position = finalPos
                        
                        stroke.Radius = dotRadius
                        stroke.Position = finalPos
                    end
                    
                    -- Hovertext display 
                    if ( hoverPlayer == thisName ) then
                        local text = radarObjects.hoverText 
                        text.Text = string.format('%s\n(%d studs away)', thisManager.DisplayName, posDelta.Magnitude)
                        text.Size = math.clamp(16 * RADAR_SCALE, 16, 24)
                        text.Visible = true
                        
                        local textPosition = finalPos + textOffset
                        text.Position = text.Position:Lerp(textPosition, 1 - mathExp(-30 * deltaTime))
                    end
                    
                    
                    -- Test for visibility
                    if ( VISIBLITY_CHECK ) then
                        local direction = ( position - cameraPos ).Unit * 12345
                        local raycast = workspace:Raycast(cameraPos, direction, rayParams)
                        
                        if ( raycast ) then
                            
                            if ( ( raycast.Position - position ).Magnitude > 4 ) then
                                main.Transparency /= 5
                                stroke.Transparency /= 5
                            end
                            
                        else
                            main.Transparency /= 5
                            stroke.Transparency /= 5
                        end 
                    end
                end
            end
        end)
        
        if ( DISPLAY_RGB_COLORS ) then
            local hue = 0
            
            scriptCns.rgbLoop = runService.Heartbeat:Connect(function(deltaTime) 
                hue += deltaTime / 20
                if ( hue > 1 ) then
                    hue -= 1 
                end
                
                local color = Color3.fromHSV(hue, 0.9, 0.9)
                
                for thisName, thisManager in pairs(playerManagers) do 
                    local thisMark = playerMarks[thisName]
                    
                    if ( not thisMark ) then
                        continue
                    end
                    
                    if ( DISPLAY_FRIEND_COLORS and thisManager.Friended ) then 
                        continue
                    end
                
                    thisMark.main.Color = color
                    thisMark.stroke.Color = color 
                end
            end)
        end
        
        task.delay(10, function() 
            local lText = radarObjects.loadText
            if ( lText.Visible ) then 
                local origText = lText.Text
                local message = '\n\nIf this menu doesn\'t go away\neven after you spawn, \nyour game is likely \nunsupported '
                
                tweenQuad({ Delta = 0 }, 'Delta', #message, 1.5, function(delta) 
                    lText.Text = origText .. message:sub(1, delta)
                end) -- this is kinda scuffedf but who cares
            end
        end)
    end

    --- Setup friend handling ---
    do
        scriptCns.pm_friendAdd = starterGui:GetCore('PlayerFriendedEvent').Event:Connect(function(player)
            local name = player.Name
            local mark = playerMarks[name]
            local manager = playerManagers[name]
            
            if ( manager ) then -- funky safety check since this event is finnicky 
                manager.Friended = true 
                
                if ( mark and DISPLAY_FRIEND_COLORS ) then
                    local mark = mark
                    mark.main.Color = RADAR_THEME.Friend_Marker
                    mark.stroke.Color = RADAR_THEME.Friend_Marker 
                end
            end
        end)
        
        scriptCns.pm_friendRemove = starterGui:GetCore('PlayerUnfriendedEvent').Event:Connect(function(player)
            local name = player.Name
            local mark = playerMarks[name]
            local manager = playerManagers[name]
            
            if ( manager ) then -- funky safety check since this event is finicky 
                manager.Friended = false 
                
                if ( mark ) then 
                    local color
                    
                    if ( DISPLAY_TEAM_COLORS ) then  
                        if ( USE_TEAM_COLORS ) then
                            color = player.TeamColor.Color
                        elseif ( player.Team == clientTeam ) then
                            color = RADAR_THEME.Team_Marker
                        else
                            color = RADAR_THEME.Generic_Marker
                        end
                    else
                        color = RADAR_THEME.Generic_Marker
                    end
                    
                    mark.main.Color = color
                    mark.stroke.Color = color
                end
            end
        end)
    end

    -- set _G.RadarKill, so this radar can be killed on re-execution 
    _G.RadarKill = killScript
end

local PlayerRadar = configs:Section{Name = "Player Radar", Side = "Right"}
local KeybindviewerToggle = PlayerRadar:Toggle{
    Name = "Enabled",
    Flag = "playerradarEnabled",
    Callback = function(bool)
        settings.RADAR_RADIUS = library.flags["playerradarSize"]
    end
}
PlayerRadar:Toggle{
    Name = "RGB Mode",
    Flag = "playerradarRGBModeEnabled",
    Callback = function(bool)
        settings.DISPLAY_RGB_COLORS = bool
    end
}
PlayerRadar:Toggle{
    Name = "Visible Check",
    Flag = "playerradarVisibleCheckEnabled",
    Callback = function(bool)
        settings.VISIBLITY_CHECK = bool
    end
}
PlayerRadar:Toggle{
    Name = "Friend Check",
    Flag = "playerradarFriendCheckEnabled",
    Callback = function(bool)
        settings.DISPLAY_FRIEND_COLORS = bool
    end
}
PlayerRadar:Toggle{
    Name = "Use Dots",
    Default = true,
    Flag = "playerradarDotsEnabled",
    Callback = function(bool)
        settings.USE_QUADS = not bool
    end
}
PlayerRadar:Toggle{
    Name = "Show Rings",
    Flag = "playerradarshowringsEnabled",
    Callback = function(bool)
        settings.RADAR_LINES = bool
    end
}
PlayerRadar:Toggle{
    Name = "Show Compass",
    Flag = "playerradarshowcompassEnabled",
    Callback = function(bool)
        settings.CARDINAL_DISPLAY = bool
    end
}
PlayerRadar:Slider{
    Name = "Size",
    Text = "[value]",
    Default = 125,
    Min = 25,
    Max = 225,
    Float = 1,
    Flag = "playerradarSize",
    Callback = function(value)
        settings.RADAR_RADIUS = value
    end
}
PlayerRadar:Slider{
    Name = "Zoom",
    Text = "[value]",
    Default = 1,
    Min = 0,
    Max = 5,
    Float = 1,
    Flag = "playerradarZoom",
    Callback = function(value)
        settings.RADAR_SCALE = value
    end
}
PlayerRadar:ColorPicker{
    Name = "Enemy Color",
    Default = Color3.fromRGB(255, 25, 115),
    Flag = "playerradarenemyColor",
    Callback = function(color)
        settings.RADAR_THEME.Generic_Marker = color
    end
}
PlayerRadar:ColorPicker{
    Name = "Friend Color",
    Default = Color3.fromRGB(255, 25, 115),
    Flag = "playerradarfriendColor",
    Callback = function(color)
        settings.RADAR_THEME.Friend_Marker = color
    end
}

local keybind_viewer = configs:Section{Name = "Keybind Viewer", Side = "Left"}
local KeybindviewerToggle = keybind_viewer:Toggle{
    Name = "Show Keybind Viewer",
    Flag = "showkeybindsEnabled",
    -- Default = false,
    Callback = function(bool)
        KeybindViewer.Main.Visible = bool
        KeybindViewer.Border.Visible = bool
        KeybindViewer.TopBorder.Visible = bool

        for _, Text in pairs(KeybindViewer.Texts) do
            Text.Visible = bool
        end
    end
}
keybind_viewer:Slider{
    Name = "Frame X Pos",
    Text = "X Position: [value]",
    Default = 0,
    Min = 0,
    Max = Camera.ViewportSize.X - 175,
    Float = 1,
    Flag = "keybindFrameXPos",
    Callback = function(value)
        KeybindViewer.Main.Position = Vector2.new(value, KeybindViewer.Main.Position.Y)
        KeybindViewer.Border.Position = Vector2.new(value, KeybindViewer.Border.Position.Y)
        KeybindViewer.TopBorder.Position = Vector2.new(value + 2, KeybindViewer.TopBorder.Position.Y)

        local TabCount = 7
        local First = true
        for _, Text in pairs(KeybindViewer.Texts) do
            Text.Position = Vector2.new(value + TabCount, Text.Position.Y)
            if First then
                TabCount = TabCount + 3
                First = false
            end
        end
    end
}
keybind_viewer:Slider{
    Name = "Frame Y Pos",
    Text = "Y Position: [value]",
    Default = Camera.ViewportSize.Y / 2,
    Min = 0,
    Max = Camera.ViewportSize.Y - 145,
    Float = 1,
    Flag = "keybindFrameYPos",
    Callback = function(value)
        KeybindViewer.Main.Position = Vector2.new(KeybindViewer.Main.Position.X, value)
        KeybindViewer.Border.Position = Vector2.new(KeybindViewer.Border.Position.X, value)
        KeybindViewer.TopBorder.Position = Vector2.new(KeybindViewer.TopBorder.Position.X, value + 2)

        local TabCount = 5
        local First = true
        for _, Text in pairs(KeybindViewer.Texts) do
            Text.Position = Vector2.new(Text.Position.X, value + TabCount)
            if First then
                TabCount = 40
                First = false
            else
                TabCount = TabCount + 20
            end
        end
    end
}

local themepickers = {}
local customtheme = configs:Section{Name = "Custom Themes", Side = "Right"}
themepickers["Accent"] = customtheme:ColorPicker{
    Name = "Accent",
    Default = library.theme["Accent"],
    Flag = "Accent",
    Callback = function(color)
        library:ChangeThemeOption("Accent", color)
        KeybindViewer.TopBorder.Color = color
    end
}
library:ConfigIgnore("Accent")
themepickers["Window Background"] = customtheme:ColorPicker{
    Name = "Window Background",
    Default = library.theme["Window Background"],
    Flag = "Window Background",
    Callback = function(color)
        library:ChangeThemeOption("Window Background", color)
        KeybindViewer.Border.Color = color
        InventoryViewer.Border.Color = color
    end
}
library:ConfigIgnore("Window Background")
themepickers["Tab Background"] = customtheme:ColorPicker{
    Name = "Tab Background",
    Default = library.theme["Tab Background"],
    Flag = "Tab Background",
    Callback = function(color)
        library:ChangeThemeOption("Tab Background", color)
        KeybindViewer.Main.Color = color
        InventoryViewer.Main.Color = color
    end
}
library:ConfigIgnore("Tab Background")
local configsection = configs:Section{Name = "Configs", Side = "Right"}
local configlist = configsection:Dropdown{
    Name = "",
    Content = library:GetConfigs(), -- GetConfigs(true) if you want universal configs
    Flag = "Config Dropdown"
}
library:ConfigIgnore("Config Dropdown")
local loadconfig = configsection:Button{
    Name = "Load Config",
    Callback = function()
        library:LoadConfig(library.flags["Config Dropdown"])
        configlist:Refresh(library:GetConfigs())
    end
}
local delconfig = configsection:Button{
    Name = "Delete Config",
    Callback = function()
        library:DeleteConfig(library.flags["Config Dropdown"])
        configlist:Refresh(library:GetConfigs())
    end
}
local configbox = configsection:Box{
    Name = "Config Name",
    Placeholder = "Enter Config Name Here",
    Flag = "Config Name"
}
library:ConfigIgnore("Config Name")
local save = configsection:Button{
    Name = "Save Config",
    Callback = function()
        library:SaveConfig(library.flags["Config Dropdown"] or library.flags["Config Name"])
        configlist:Refresh(library:GetConfigs())
    end
}





