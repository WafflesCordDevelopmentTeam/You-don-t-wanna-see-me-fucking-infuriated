-- Check and delete KillBricks in StageParts["3"]
local killBricks = workspace.StageParts["3"]:FindFirstChild("KillBricks")
if killBricks then
    killBricks:Destroy()
end

-- Get Players service
local Players = game:GetService("Players")

-- Function to delete KillBricks
local function deleteKillBricks()
    local killBricks = workspace.StageParts["3"]:FindFirstChild("KillBricks")
    if killBricks then
        killBricks:Destroy()  -- Delete the KillBricks
    end
end

-- Function to show available commands
local function showCommands(player)
    local message = "Commands:\n!lol - Deletes KillBricks in StageParts[3].\n!cmds - Shows available commands.\n!credits - Displays the credits."
    game:GetService("TextChatService"):SendMessage(message, player)
end

-- Function to display credits
local function showCredits(player)
    local creditsMessage = "This script was made by ngk/Pekoara, U Newgens, /oyk OYK ON TOP, /katanas KATANAS ON TOP, /land LAND ON TOP!!!"
    game:GetService("TextChatService"):SendMessage(creditsMessage, player)
end

-- Listen for player chat commands
game:GetService("Players").PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        if message == "!lol" then
            deleteKillBricks()  -- Execute the deleteKillBricks function
        elseif message == "!cmds" then
            showCommands(player)  -- Show commands
        elseif message == "!credits" then
            showCredits(player)  -- Show credits
        end
    end)
end)

-- cmd rael?
-- made by ngk