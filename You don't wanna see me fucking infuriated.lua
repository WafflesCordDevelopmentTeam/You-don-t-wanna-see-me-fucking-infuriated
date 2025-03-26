-- You don't wanna see me fucking infuriated
-- made by pekoara | Discord: pekoara
local function teleportToStages()
    for i = 1, 17 do
        local stage = workspace.ObbyStages[tostring(i)] -- Get the ObbyStage part by index
        if stage then
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(stage.CFrame) -- Teleport the character
            wait(1) -- Wait for 1 second before moving to the next stage (adjust if needed)
        else
            warn("ObbyStage " .. i .. " not found!") -- If the stage doesn't exist, warn in the output
        end
    end
end

-- Execute the function
teleportToStages()
