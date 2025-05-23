-- TeamBasedTroopPlacement_Client.lua
-- Handles player input for selecting a troop and placing it via mouse click

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()
local PlaceTroopRemote = ReplicatedStorage:WaitForChild("PlaceTroopRemote")

local selectedModel = nil

-- Function to select a troop type
function selectModel(name)
    selectedModel = name
    print("Selected troop:", name)
end

-- Mouse click to place troop
mouse.Button1Down:Connect(function()
    if selectedModel then
        local rayOrigin = mouse.UnitRay.Origin
        local rayDirection = mouse.UnitRay.Direction * 1000
        local position = rayOrigin + rayDirection
        PlaceTroopRemote:FireServer(selectedModel, position)
    end
end)
