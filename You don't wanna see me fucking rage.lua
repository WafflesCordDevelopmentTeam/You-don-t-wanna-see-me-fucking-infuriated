-- You don't wanna see me fucking rage
_G.TeleportEnabled = true -- Set to false to disable the teleport script

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:FindFirstChild("HumanoidRootPart")

if not hrp then return end

for i = 1, #workspace.ObbyStages:GetChildren() do
    if _G.TeleportEnabled then
        local stage = workspace.ObbyStages[i]
        if stage and stage:IsA("Part") then
            hrp.CFrame = stage.CFrame + Vector3.new(0, 3, 0) -- Teleports slightly above the part to avoid clipping
            task.wait(0.5) -- Small delay to prevent instant teleport
        end
    else
        break
    end
end

-- Final teleport to the portal
if _G.TeleportEnabled and workspace:FindFirstChild("StageParts") then
    local portal = workspace.StageParts["9"].Portal:FindFirstChild("Portal")
    if portal then
        hrp.CFrame = portal.CFrame
    end
end

-- Made By Pekoara
-- discord - pekoara