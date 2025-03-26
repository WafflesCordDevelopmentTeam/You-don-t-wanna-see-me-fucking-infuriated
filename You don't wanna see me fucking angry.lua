local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

if humanoidRootPart then
    for i, stage in pairs(workspace.ObbyStages:GetChildren()) do
        if stage:IsA("Part") then
            local safePosition = stage.Position + Vector3.new(0, humanoidRootPart.Size.Y / 2 + 1, 0) -- Ensure above ground
            humanoidRootPart.CFrame = CFrame.new(safePosition)
            task.wait(0.5) -- Small delay to ensure teleport registers
        end
    end
    
    local finalStage = workspace.StageParts["13"].Portal.Portal
    if finalStage then
        local safeFinalPosition = finalStage.Position + Vector3.new(0, humanoidRootPart.Size.Y / 2 + 1, 0) -- Ensure above ground
        humanoidRootPart.CFrame = CFrame.new(safeFinalPosition)
    end
end

-- made by Pekoara
-- Discord: pekoara
-- its alot better and the teleporting aswell!