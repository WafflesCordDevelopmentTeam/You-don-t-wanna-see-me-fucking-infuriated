-- Wait for 2 seconds before executing the rest of the script
task.wait(2)

-- Initialize services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get the local player (you)
local localPlayer = Players.LocalPlayer

-- Function to send the welcome message to all players
local function sendWelcomeMessage()
    local welcomeMessage = "Welcome " .. localPlayer.Name .. " to a random Admin Script Made By Pekoara now wtv do !cmds to look at the list"
    
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
local function showCommands()
    local message = [[
        Commands:
        !lol - Deletes KillBricks in StageParts[3].
        !cmds - Shows available commands.
        !credits - Displays the credits.
    ]]
    
    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end

-- Function to display credits
local function showCredits()
    local creditsMessage = "This script was made by ngk/Pekoara, U Newgens, /oyk OYK ON TOP, /katanas KATANAS ON TOP, /land LAND ON TOP!!!"
    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(creditsMessage, "All")
end

-- Improved command handler
local function handleCommand(message)
    local lowerMessage = message:lower()

    if lowerMessage == "!lol" then
        deleteKillBricks()  -- Delete KillBricks in StageParts[3]
    elseif lowerMessage == "!cmds" then
        showCommands()  -- Show available commands
    elseif lowerMessage == "!credits" then
        showCredits()  -- Show credits
    else
        -- Optionally, send a message when an unknown command is entered
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Unknown command. Type !cmds for a list of commands.", "All")
    end
end

-- Listen for the local player's chat input
localPlayer.Chatted:Connect(function(message)
    -- Handle commands typed by the local player
    handleCommand(message)
end)

-- Send the welcome message when the script is executed
sendWelcomeMessage()
-- fixed it again since we dont that version lol
