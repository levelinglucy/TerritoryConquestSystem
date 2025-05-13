-- UnitDeathSystem.lua
-- Monitors troops for health or death triggers and removes them cleanly

local function monitorTroop(model)
    local humanoid = model:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
        humanoid.Died:Connect(function()
            -- Optional: add explosion or death sound here
            model:Destroy()
        end)
        return
    end

    local healthVal = model:FindFirstChild("Health")
    if healthVal then
        healthVal:GetPropertyChangedSignal("Value"):Connect(function()
            if healthVal.Value <= 0 then
                -- Optional: add effect or cleanup here
                model:Destroy()
            end
        end)
    end
end

return monitorTroop
