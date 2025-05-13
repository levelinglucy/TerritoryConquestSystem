-- Animated_TroopModels_Guide.lua
-- How to animate Infantry (walk), Tank (turret), Artillery (recoil)

-- INFANTRY:
-- Use Rig Builder (Plugins) to create a Block Rig
-- Add Animator, create walk animation
-- Save and upload animation to use in scripts

-- TANK:
-- Separate Parts: Base, Turret, Barrel
-- Attach using Motor6D (Base → Turret → Barrel)
-- Rotate Turret using CFrame.Angles or TweenService

-- ARTILLERY:
-- Motor6D between Base and Barrel
-- Play recoil animation on fire trigger

-- All models must have a valid PrimaryPart
-- Store in ReplicatedStorage > TroopModels
