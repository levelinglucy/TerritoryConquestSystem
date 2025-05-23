-- TroopGUI_Layout.lua
-- Creates a basic GUI layout with 3 troop buttons: Infantry, Tank, Artillery

local gui = Instance.new("ScreenGui")
gui.Name = "TroopGUI"
gui.ResetOnSpawn = false

local troopNames = {"Infantry", "Tank", "Artillery"}

for i, name in ipairs(troopNames) do
    local button = Instance.new("TextButton")
    button.Name = name
    button.Text = name
    button.Size = UDim2.new(0, 120, 0, 40)
    button.Position = UDim2.new(0, 10, 0, 60 + ((i - 1) * 50))
    button.BackgroundColor3 = Color3.new(0.2, 0.4, 0.2)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.Parent = gui
end

return gui
