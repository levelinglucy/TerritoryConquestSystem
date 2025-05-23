-- TroopGUI_LocalScript.lua
-- Connects GUI troop buttons to troop selection function

local player = game.Players.LocalPlayer
local gui = script.Parent

-- Link troop buttons to selection
for _, button in pairs(gui:GetChildren()) do
    if button:IsA("TextButton") then
        button.MouseButton1Click:Connect(function()
            if _G.selectModel then
                _G.selectModel(button.Name)
            elseif typeof(selectModel) == "function" then
                selectModel(button.Name)
            end
        end)
    end
end

-- Optional: show resource value on GUI if 'leaderstats' is active
local stats = player:WaitForChild("leaderstats")
local res = stats and stats:FindFirstChild("Resources")

if res then
    local display = Instance.new("TextLabel")
    display.Size = UDim2.new(0, 200, 0, 40)
    display.Position = UDim2.new(0, 10, 0, 10)
    display.BackgroundTransparency = 0.5
    display.BackgroundColor3 = Color3.new(0, 0, 0)
    display.TextColor3 = Color3.new(1, 1, 1)
    display.Font = Enum.Font.SourceSansBold
    display.TextSize = 20
    display.Text = "Resources: " .. res.Value
    display.Parent = gui

    res:GetPropertyChangedSignal("Value"):Connect(function()
        display.Text = "Resources: " .. res.Value
    end)
end
