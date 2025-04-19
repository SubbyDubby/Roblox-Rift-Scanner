-- Simplified Rift Scanner for Swift
local WEBHOOK = "https://discord.com/api/webhooks/1363251024210432164/B26f2Tvrl_QuigIZ5AJswcd1hYKPGxIHlYzUUu-cicdhF6kj2i5hrQi16-YK2-R7rk0Y" -- Replace with your Discord webhook
local PLACE_ID = 85896571713843
local jobIds = {
    "177af98f-00cb-44b9-8cb4-811e4e1a3ebd",
    "7e88ed13-1669-4a31-a072-6700db251d6f",
    "6377fc9a-5bd9-42e0-a980-fe3e2d6fb38a"
    -- Add more IDs as needed, but keep the list short for testing
}

-- Keep track of our position in the jobIds list
_G.CurrentIndex = _G.CurrentIndex or 1

-- Get services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- Simple logging function
local function log(message)
    print("[Rift Scanner] " .. message)
end

-- Send a webhook
local function sendWebhook(data)
    log("Sending webhook for: " .. data.name)
    
    local requestFunc
    if syn and syn.request then
        requestFunc = syn.request
    elseif http_request then
        requestFunc = http_request
    elseif request then
        requestFunc = request
    elseif http and http.request then
        requestFunc = http.request
    end
    
    if not requestFunc then
        log("No HTTP request function found!")
        return false
    end
    
    -- Create a simple embed
    local embed = {
        title = "Rift Detected!",
        description = "**" .. data.name .. "** has appeared with **" .. data.luck .. "** luck!\n\n**Position**\n" .. data.position .. "\n\n**Height (Y)**\n" .. data.height .. "\n\n**Timer**\n" .. data.timer,
        color = 16711680 -- Red
    }
    
    -- Convert to JSON manually (simple version)
    local jsonBody = '{"embeds":[{"title":"' .. embed.title 
        .. '","description":"' .. embed.description:gsub('"', '\\"')
        .. '","color":' .. embed.color .. '}]}'
    
    -- Send the webhook
    local success, response = pcall(function()
        return requestFunc({
            Url = WEBHOOK,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = jsonBody
        })
    end)
    
    if success then
        log("Webhook sent successfully!")
        return true
    else
        log("Failed to send webhook: " .. tostring(response))
        return false
    end
end

-- Parse rift descriptions from text
local function parseRiftDescription(text)
    local eggName = string.match(text, "%*%*(.-)%*%* has appeared") or "Unknown"
    local luck = string.match(text, "with (.-) luck") or "n/a"
    local pos = string.match(text, "%*%*Position%*%*%s*(.-)%s*\n") or "n/a"
    local height = string.match(text, "%*%*Height %(Y%)%*%*%s*(.-)%s*\n") or "n/a"
    local timer = string.match(text, "%*%*Timer%*%*%s*(.-)%s*\n") or "n/a"
    
    return {
        name = eggName,
        luck = luck,
        position = pos,
        height = height,
        timer = timer
    }
end

-- Scan for rifts
local function scanRifts()
    log("Scanning for rifts...")
    local foundRift = false
    
    -- Check text labels in PlayerGui
    if LocalPlayer:FindFirstChild("PlayerGui") then
        for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
            if gui:IsA("TextLabel") and gui.Text and gui.Text:find("has appeared") then
                log("Found rift message in PlayerGui")
                local rift = parseRiftDescription(gui.Text)
                sendWebhook(rift)
                foundRift = true
            end
        end
    end
    
    -- Check text labels in workspace
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("TextLabel") and obj.Text and obj.Text:find("has appeared") then
            log("Found rift message in Workspace")
            local rift = parseRiftDescription(obj.Text)
            sendWebhook(rift)
            foundRift = true
        end
    end
    
    if not foundRift then
        log("No rifts found in this server.")
    end
    
    -- Prepare to hop to next server
    log("Will hop to next server in 5 seconds...")
    task.wait(5)
    hopToNextServer()
end

-- Hop to the next server
function hopToNextServer()
    _G.CurrentIndex = _G.CurrentIndex + 1
    
    if _G.CurrentIndex <= #jobIds then
        local nextJobId = jobIds[_G.CurrentIndex]
        log("Teleporting to server " .. _G.CurrentIndex .. " with JobID: " .. nextJobId)
        
        -- Set up script to run again after teleport
        local script = [[
            _G.CurrentIndex = ]] .. _G.CurrentIndex .. [[;
            loadstring(game:HttpGet('https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua'))()
        ]]
        
        -- Queue the script to run after teleport
        if syn and syn.queue_on_teleport then
            syn.queue_on_teleport(script)
        elseif queue_on_teleport then
            queue_on_teleport(script)
        end
        
        -- Teleport to the next server
        task.wait(1) -- Small delay before teleport
        game:GetService('TeleportService'):TeleportToPlaceInstance(PLACE_ID, nextJobId, LocalPlayer)
    else
        log("Finished scanning all servers in the list.")
    end
end

-- Main execution starts here
log("Rift Scanner starting...")

-- Wait for the game and character to load
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Wait for player character to load
task.wait(3)

-- Wait a bit for rifts to load, then scan
log("Waiting 15 seconds for rifts to load...")
task.wait(15)
scanRifts()

-- Set up character added event for teleport detection
LocalPlayer.CharacterAdded:Connect(function()
    log("Character added in new server!")
    task.wait(15) -- Wait for rifts to load
    scanRifts()
end)

log("Rift Scanner initialized successfully!")
