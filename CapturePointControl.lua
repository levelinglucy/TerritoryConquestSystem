-- CapturePointControl.lua
-- Script for controlling ownership of capture points and reassigning territories

local CollectionService = game:GetService("CollectionService")
local Teams = game:GetService("Teams")
local Players = game:GetService("Players")

local captureDuration = 10 -- seconds to hold before flip

for _, part in pairs(CollectionService:GetTagged("CapturePoint")) do
    local territoryNameValue = part:FindFirstChild("TerritoryModelName")
    local territoryModel = territoryNameValue and workspace:FindFirstChild(territoryNameValue.Value)

    if not territoryModel then
        warn("Missing territory model for capture point:", part.Name)
        continue
    end

    local captureState = {
        lastTeam = nil,
        timeHeld = 0
    }

    game:GetService("RunService").Heartbeat:Connect(function(dt)
        local touching = part:GetTouchingParts()
        local teamCounts = {}

        for _, p in ipairs(touching) do
            local character = p:FindFirstAncestorOfClass("Model")
            if character and Players:GetPlayerFromCharacter(character) then
                local plr = Players:GetPlayerFromCharacter(character)
                local team = plr.Team
                if team then
                    teamCounts[team.Name] = (teamCounts[team.Name] or 0) + 1
                end
            end
        end

        local leadingTeam = nil
        local max = 0
        for teamName, count in pairs(teamCounts) do
            if count > max then
                leadingTeam = teamName
                max = count
            end
        end

        if leadingTeam then
            if captureState.lastTeam == leadingTeam then
                captureState.timeHeld += dt
                if captureState.timeHeld >= captureDuration then
                    if _G.AssignTerritoryToTeam then
                        _G.AssignTerritoryToTeam(territoryModel, leadingTeam)
                    end
                    captureState.timeHeld = 0
                end
            else
                captureState.lastTeam = leadingTeam
                captureState.timeHeld = 0
            end
        else
            captureState.timeHeld = 0
        end
    end)
end
