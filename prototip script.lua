local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3")

local Tab = Window:NewTab("main")

local Section = Tab:NewSection("Section Name")

Section:NewButton("esp", "ButtonInfo", function()
while wait(0.5) do
    for i, childrik in ipairs(workspace:GetDescendants()) do
        if childrik:FindFirstChild("Humanoid") then
            if not childrik:FindFirstChild("EspBox") then
                if childrik ~= game.Players.LocalPlayer.Character then
                    local esp = Instance.new("BoxHandleAdornment",childrik)
                    esp.Adornee = childrik
                    esp.ZIndex = 0
                    esp.Size = Vector3.new(4, 5, 1)
                    esp.Transparency = 0.65
                    esp.Color3 = Color3.fromRGB(255,48,48)
                    esp.AlwaysOnTop = true
                    esp.Name = "EspBox"
                end
            end
        end
    end
end

end)

Section:NewSlider("speed", "SliderInfo", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewKeybind("esp быстрая активация", "KeybindInfo", Enum.KeyCode.F, function()
while wait(0.5) do
    for i, childrik in ipairs(workspace:GetDescendants()) do
        if childrik:FindFirstChild("Humanoid") then
            if not childrik:FindFirstChild("EspBox") then
                if childrik ~= game.Players.LocalPlayer.Character then
                    local esp = Instance.new("BoxHandleAdornment",childrik)
                    esp.Adornee = childrik
                    esp.ZIndex = 0
                    esp.Size = Vector3.new(4, 5, 1)
                    esp.Transparency = 0.65
                    esp.Color3 = Color3.fromRGB(255,48,48)
                    esp.AlwaysOnTop = true
                    esp.Name = "EspBox"
                end
            end
        end
    end
end
end)

Section:NewToggle("супер прыжок", "ToggleInfo", function(state)
    if state then
       game.player.localplayer.character.humanoid.jumppower = 500 
    else
       game.player.localplayer.character.humanoid.jumppower = 50
    end
end)

Section:NewButton("ButtonText", "ButtonInfo", function()
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")

local myPlayer = game.Players.LocalPlayer
local myChar = myPlayer.Character
local myHRP = myChar:WaitForChild("HumanoidRootPart")
local camera = game.Workspace.CurrentCamera

local flying = false
local speed = 0.5


local bp = Instance.new("BodyPosition", myHRP)
bp.MaxForce = Vector3.new()
bp.D = 10
bp.P = 10000

local bg = Instance.new("BodyGyro", myHRP)
bg.MaxTorque = Vector3.new()
bg.D = 10

function fly()
  flying = true
  bp.MaxForce = Vector3.new(400000,400000,400000)
  bg.MaxTorque = Vector3.new(400000,400000,400000)
  while flying do
    rs.RenderStepped:wait()
    bp.Position = myHRP.Position +((myHRP.Position - camera.CFrame.p).unit * speed)
    bg.CFrame = CFrame.new(camera.CFrame.p, myHRP.Position)
  end
end

function endFlying()
  bp.MaxForce = Vector3.new()
  bg.MaxTorque = Vector3.new()
  flying = false
end

uis.InputBegan:connect(function(input)
  if input.KeyCode == Enum.KeyCode.space then
    if not flying then
      fly()
    else
      endFlying()
    end
  end
end)
end)
