-- ResourceIncomeSystem.lua
-- Provides passive resource income to each player over time

local Players = game:GetService("Players")
local INTERVAL = 5 -- seconds
local AMOUNT = 5   -- resources per interval

while true do
	wait(INTERVAL)
	for _, player in ipairs(Players:GetPlayers()) do
		local stats = player:FindFirstChild("leaderstats")
		local resources = stats and stats:FindFirstChild("Resources")
		if resources then
			resources.Value += AMOUNT
		end
	end
end
