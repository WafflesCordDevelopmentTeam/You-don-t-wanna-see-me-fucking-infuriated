-- Wait for 2 seconds before executing the rest of the script
task.wait(2)

-- Initialize services
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Function to send the welcome message when a player joins
local function sendWelcomeMessage(player)
    local welcomeMessage = "Welcome " .. player.Name .. " to a random Admin Script Made By Pekoara for all 3 games this developer made (You Don't Wanna See Us Group). Thanks for using it! To see commands, do !cmds."
    -- Using ReplicatedStorage to broadcast the message to all players
    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(welcomeMessage, "All")
end

-- Function to delete KillBricks
local function deleteKillBricks()
    local killBricks = workspace.StageParts["3"]:FindFirstChild("KillBricks")
    if killBricks then
        killBricks:Destroy()  -- Delete the KillBricks part
    end
end

-- Function to show available commands
local function showCommands(player)
    local message = "Commands:\n!lol - Deletes KillBricks in StageParts[3].\n!cmds - Shows available commands.\n!credits - Displays the credits."
    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end

-- Function to display credits
local function showCredits(player)
    local creditsMessage = "This script was made by ngk/Pekoara, U Newgens, /oyk OYK ON TOP, /katanas KATANAS ON TOP, /land LAND ON TOP!!!"
    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(creditsMessage, "All")
end

-- Improved command handler
local function handleCommand(player, message)
    local lowerMessage = message:lower()
    if lowerMessage == "!lol" then
        deleteKillBricks()  -- Delete KillBricks in StageParts[3]
    elseif lowerMessage == "!cmds" then
        showCommands(player)  -- Show available commands
    elseif lowerMessage == "!credits" then
        showCredits(player)  -- Show credits
    else
        -- Optionally, send a message when an unknown command is entered
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Unknown command. Type !cmds for a list of commands.", "All")
    end
end

-- Listen for player joining
Players.PlayerAdded:Connect(function(player)
    -- Send the welcome message when the player joins
    sendWelcomeMessage(player)

    -- Listen for player chat commands
    player.Chatted:Connect(function(message)
        -- Handle commands typed by the player
        handleCommand(player, message)
    end)
end)
-- fixed i think
