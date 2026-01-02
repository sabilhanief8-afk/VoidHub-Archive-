--[[ 
    🌌 VOIDHUB v4.0 | FISH IT! (SPECIAL EDITION) 🦊
    LOGIC: PREMIUM BLATANT BYPASS
    TARGET: FISH IT! 
]]

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🌌 VoidHub | FISH IT! 🦊", HidePremium = false, SaveConfig = true, ConfigFolder = "VoidFish"})

-- [[ THE ULTIMATE BLATANT FISHING LOGIC ]]
local Main = Window:MakeTab({ Name = "Auto Farm", Icon = "rbxassetid://4483345998" })

_G.BlatantMode = false
_G.MultiNotif = 6

Main:AddToggle({
    Name = "Blatant Auto Catch (6-9x Notif)",
    Default = false,
    Callback = function(Value)
        _G.BlatantMode = Value
        spawn(function()
            while _G.BlatantMode do
                task.wait(0.1) -- Fast speed
                local player = game.Players.LocalPlayer
                local tool = player.Character:FindFirstChildOfClass("Tool")
                
                if tool and tool:FindFirstChild("Events") then
                    -- 1. Auto Cast Power 100%
                    tool.Events.Cast:FireServer(100)
                    
                    -- 2. Wait for Bite (Bypass 200ms-300ms Latency)
                    local bite = false
                    local connection
                    connection = tool.Events.Bite.OnClientEvent:Connect(function()
                        bite = true
                    end)
                    
                    -- Force Wait until bite or timeout
                    local t = 0
                    repeat task.wait() t = t + 1 until bite or t > 50
                    connection:Disconnect()

                    -- 3. THE EXPLOIT: Spam Reeling (6x Notification)
                    -- Ini yang bikin lu dapet 6 notif biarpun internet lemot
                    if bite then
                        for i = 1, _G.MultiNotif do
                            tool.Events.Reel:FireServer(true) -- Spamming reel packets
                        end
                        print("VoidHub: 6x Multi-Catch Executed!")
                    end
                end
            end
        end)
    end
})

-- [[ AUTO QUEST & TOTEM ]]
local Automatics = Window:MakeTab({ Name = "Auto Tasks", Icon = "rbxassetid://4483345998" })

Automatics:AddToggle({
    Name = "Auto Complete All Quests",
    Default = false,
    Callback = function(Value)
        _G.AutoQuest = Value
        while _G.AutoQuest do
            task.wait(2)
            game:GetService("ReplicatedStorage").Events.QuestEvents.ClaimReward:FireServer()
        end
    end
})

-- [[ TELEPORTS ]]
local Tele = Window:MakeTab({ Name = "Teleports", Icon = "rbxassetid://4483345998" })

Tele:AddButton({
    Name = "TP to Best Fishing Spot",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(250, 10, -500) -- Ganti koordinat sesuai map Fish It!
    end
})

-- [[ VISUALS & MISC ]]
local Misc = Window:MakeTab({ Name = "Misc / Anti-Staff", Icon = "rbxassetid://4483345998" })

Misc:AddToggle({
    Name = "Anti-Staff (Instant Leave)",
    Default = true,
    Callback = function(Value)
        _G.AntiStaff = Value
        spawn(function()
            while _G.AntiStaff do
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p:GetAttribute("Admin") or p:GetRankInGroup(0) > 200 then -- Ganti Group ID game Fish It
                        game.Players.LocalPlayer:Kick("VoidHub: Admin Detected!")
                    end
                end
                task.wait(1)
            end
        end)
    end
})

Misc:AddButton({
    Name = "Unlock All Rod Skins (Visual Only)",
    Callback = function()
        -- Loop visual skin logic
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                v.Handle.Material = Enum.Material.Neon
                v.Handle.Color = Color3.fromRGB(0, 255, 255)
            end
        end
    end
})

-- Anti AFK
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

OrionLib:Init()
