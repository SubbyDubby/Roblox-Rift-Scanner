-- Swift Executor Compatible Rift Scanner
-- Configuration
local WEBHOOK = "https://discord.com/api/webhooks/1363251024210432164/B26f2Tvrl_QuigIZ5AJswcd1hYKPGxIHlYzUUu-cicdhF6kj2i5hrQi16-YK2-R7rk0Y" -- Replace with your Discord webhook
local PLACE_ID = 85896571713843
local jobIds = {
    "177af98f-00cb-44b9-8cb4-811e4e1a3ebd",
    "7e88ed13-1669-4a31-a072-6700db251d6f",
    -- ... other job IDs remain the same
}

-- Variables
local currentIndex = 1
local hasScanned = false
local scanDelay = 15 -- Increased delay for better loading
local maxRetries = 3 -- Maximum number of retry attempts

-- Services with proper exploit compatibility
local HttpService = {
    JSONEncode = function(data)
        -- First try native JSONEncode
        local success, result = pcall(function()
            return game:GetService("HttpService"):JSONEncode(data)
        end)
        
        if success then return result end
        
        -- Fallback JSON encoder if needed
        local json = ""
        if type(data) == "table" then
            json = json .. "{"
            for k, v in pairs(data) do
                if type(k) == "string" then
                    json = json .. '"' .. k .. '":' 
                end
                
                if type(v) == "table" then
                    json = json .. HttpService.JSONEncode(v)
                elseif type(v) == "string" then
                    json = json .. '"' .. v .. '"'
                elseif type(v) == "number" then
                    json = json .. v
                elseif type(v) == "boolean" then
                    json = json .. tostring(v)
                end
                
                json = json .. ","
            end
            if json:sub(-1) == "," then
                json = json:sub(1, #json - 1)
            end
            json = json .. "}"
        end
        return json
    end,
    
    PostAsync = function(url, data)
        -- Attempt to use Swift's HTTP request function
        if syn and syn.request then
            return syn.request({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = data
            })
        elseif http_request then
            return http_request({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = data
            })
        elseif request then
            return request({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = data
            })
        elseif http and http.request then
            return http.request({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = data
            })
        else
            warn("No HTTP request function found!")
            return nil
        end
    end
}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- Print function with timestamp for debugging
local function log(message, type)
    local timeStamp = os.date("%H:%M:%S", os.time())
    if type == "warn" then
        warn("[" .. timeStamp .. "] " .. message)
    elseif type == "error" then
        error("[" .. timeStamp .. "] " .. message)
    else
        print("[" .. timeStamp .. "] " .. message)
    end
end

-- Parse rift descriptions from text
function parseRiftDescription(desc)
    local eggName = string.match(desc, "%*%*(.-)%*%* has appeared")
    local luck = string.match(desc, "with (.-) luck")
    local pos = string.match(desc, "%*%*Position%*%*%s*(.-)%s*\n")
    local height = string.match(desc, "%*%*Height %(Y%)%*%*%s*(.-)%s*\n")
    local timer = string.match(desc, "%*%*Timer%*%*%s*(.-)%s*\n")
    local jobId = string.match(desc, "TeleportToPlaceInstance%([^,]+, ['\"](.-)['\"]")
    
    -- Categorize rift based on name or other properties
    local riftType = "Unknown"
    if eggName then
        -- Add your specific rift classification logic here
        if string.find(string.lower(eggName or ""), "ancient") then
            riftType = "Rift 1"
        elseif string.find(string.lower(eggName or ""), "mystic") then
            riftType = "Rift 2"
        end
    end
    
    return {
        name = eggName or "Unknown",
        luck = luck or "n/a",
        position = pos or "n/a",
        height = height or "n/a",
        timer = timer or "n/a",
        jobId = jobId or "n/a",
        riftType = riftType
    }
end

-- Send webhook with retry mechanism
function sendWebhook(data)
    local embed = {
        ["title"] = string.format("Rift Detected: %s", data.riftType),
        ["description"] = string.format("**%s** has appeared with **%s** luck!\n\n**Position**\n%s\n\n**Height (Y)**\n%s\n\n**Timer**\n%s\n\n**Teleport Link**\n[Join Game](https://slayervalue.com/roblox/join_game.php?placeId=%s&jobId=%s)",
            data.name, data.luck, data.position, data.height, data.timer, PLACE_ID, data.jobId),
        ["color"] = 123456
    }
    
    local payload = HttpService.JSONEncode({embeds = {embed}})
    
    -- Try sending webhook with retries
    local retryCount = 0
    local success = false
    
    while not success and retryCount < maxRetries do
        local response
        success, response = pcall(function()
            return HttpService.PostAsync(WEBHOOK, payload)
        end)
        
        if success then
            log("Webhook sent successfully!")
            break
        else
            retryCount = retryCount + 1
            log("Failed to send webhook (attempt " .. retryCount .. "/" .. maxRetries .. "): " .. tostring(response), "warn")
            task.wait(1)
        end
    end
    
    return success
end

-- Scan for rifts
function scanRifts()
    if hasScanned then return end -- Prevent multiple scans
    
    log("Scanning for rifts...")
    local foundRift = false
    
    -- Collect all text labels first to avoid issues during iteration
    local textLabels = {}
    for _, descendant in pairs(Workspace:GetDescendants()) do
        if descendant:IsA("TextLabel") then
            table.insert(textLabels, descendant)
        end
    end
    
    log("Found " .. #textLabels .. " text labels to scan")
    
    -- Now scan the collected text labels
    for _, textLabel in ipairs(textLabels) do
        if textLabel and textLabel:IsA("TextLabel") and textLabel.Text and string.find(textLabel.Text, "has appeared") then
            local rift = parseRiftDescription(textLabel.Text)
            local webhookSent = sendWebhook(rift)
            foundRift = true
            log("Found rift: " .. rift.name .. " (Webhook sent: " .. tostring(webhookSent) .. ")")
        end
    end
    
    if not foundRift then
        log("No rifts found in this server.")
    end
    
    hasScanned = true
    
    -- Wait before hopping to next server
    log("Will hop to next server in 5 seconds...")
    task.delay(5, hop)
end

-- Hop to next server using Swift's specific methods
function hop()
    log("Preparing to hop to next server...")
    currentIndex = currentIndex + 1
    
    if currentIndex <= #jobIds then
        local nextJobId = jobIds[currentIndex]
        log("Teleporting to server " .. currentIndex .. " with JobID: " .. nextJobId)
        
        -- Save current progress to continue after teleport
        -- You should host this script on a URL you control
        local scriptUrl = "https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua"
        local saveData = "currentIndex = " .. currentIndex
        
        -- Queue script to run after teleport using Swift-specific method
        pcall(function()
            if syn and syn.queue_on_teleport then
                syn.queue_on_teleport(string.format([[
                    loadstring(game:HttpGet("%s"))()
                    %s
                ]], scriptUrl, saveData))
            elseif queue_on_teleport then
                queue_on_teleport(string.format([[
                    loadstring(game:HttpGet("%s"))()
                    %s
                ]], scriptUrl, saveData))
            end
        end)
        
        -- Use Swift's specific teleport methods
        local teleported = false
        
        pcall(function()
            if getgenv().Swift and getgenv().Swift.Server.Join then
                getgenv().Swift.Server.Join(PLACE_ID, nextJobId)
                teleported = true
            end
        end)
        
        if not teleported then
            pcall(function()
                if syn and syn.join_game then
                    syn.join_game(PLACE_ID, nextJobId)
                    teleported = true
                end
            end)
        end
        
        if not teleported then
            pcall(function()
                if game and type(game.JoinGameInstance) == "function" then
                    game:JoinGameInstance(PLACE_ID, nextJobId)
                    teleported = true
                end
            end)
        end
        
        if not teleported and getgenv().joinServer then
            pcall(function()
                getgenv().joinServer(PLACE_ID, nextJobId)
                teleported = true
            end)
        end
        
        if not teleported then
            log("All teleport methods failed! Trying next server...", "warn")
            task.delay(1, hop)
        end
    else
        log("Finished scanning all servers in the list.")
    end
end

-- Main execution starts here
log("Rift Scanner starting...")

-- Check if game is loaded
local gameLoaded = pcall(function() return game:IsLoaded() end) and game:IsLoaded()
if gameLoaded then
    log("Game is already loaded")
else
    log("Waiting for game to load...")
    
    -- Use pcall to safely wait for game to load
    pcall(function()
        if not game:IsLoaded() then game.Loaded:Wait() end
    end)
    
    log("Game loaded!")
end

-- Wait for character to load
local characterLoaded = pcall(function() return LocalPlayer.Character ~= nil end) and LocalPlayer.Character ~= nil
if characterLoaded then
    log("Character is already loaded")
else
    log("Waiting for character to load...")
    
    -- Use pcall to safely wait for character
    pcall(function()
        if not LocalPlayer.Character then
            local connection
            connection = LocalPlayer.CharacterAdded:Connect(function()
                characterLoaded = true
                if connection then connection:Disconnect() end
            end)
            
            -- Wait up to 10 seconds for character
            local startTime = tick()
            while not characterLoaded and tick() - startTime < 10 do
                task.wait(0.1)
            end
        end
    end)
    
    log("Character loaded or timed out")
end

-- Reset scan flag for new server
hasScanned = false

-- Wait a bit after joining before scanning to let rifts load
log("Waiting " .. scanDelay .. " seconds for rifts to load...")
task.delay(scanDelay, function()
    scanRifts()
end)

-- Set up character added event for when we teleport
pcall(function()
    LocalPlayer.CharacterAdded:Connect(function()
        log("Character added in new server!")
        -- Reset scan flag for new server
        hasScanned = false
        
        -- Wait a bit after joining before scanning to let rifts load
        log("Waiting " .. scanDelay .. " seconds for rifts to load...")
        task.delay(scanDelay, function()
            scanRifts()
        end)
    end)
end)

log("Rift Scanner initialized successfully!")
