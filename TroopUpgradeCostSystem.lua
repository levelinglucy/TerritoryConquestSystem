-- TroopUpgradeCostSystem.lua
-- Returns cost of each troop type for placement system

local TROOP_COSTS = {
    Infantry = 10,
    Tank = 25,
    Artillery = 40
}

function GetTroopCost(modelName)
    return TROOP_COSTS[modelName] or 10 -- fallback default
end

return GetTroopCost
