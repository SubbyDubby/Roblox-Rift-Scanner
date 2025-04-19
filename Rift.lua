-- Swift-Compatible Rift Scanner
-- Configuration
local WEBHOOK = "https://discord.com/api/webhooks/1363251024210432164/B26f2Tvrl_QuigIZ5AJswcd1hYKPGxIHlYzUUu-cicdhF6kj2i5hrQi16-YK2-R7rk0Y" -- Replace with your Discord webhook
local PLACE_ID = 85896571713843
local jobIds = {
    "177af98f-00cb-44b9-8cb4-811e4e1a3ebd",
    "7e88ed13-1669-4a31-a072-6700db251d6f",
    "6377fc9a-5bd9-42e0-a980-fe3e2d6fb38a",
    "4383e4cc-c155-4c7b-850a-de7d2fed5478",
    "8fd95693-052b-4be6-a2b5-213f7da3edcb",
    "66f0d910-ed20-4dda-b2af-7406976c5a65",
    "c795f860-4a54-43f3-93f3-2016482e949d",
    "01e126ee-1c4e-40ff-a924-e100269b9071",
    "8e6b8096-8e23-4928-a75c-e09560c93d9e",
    "8ec9fbdc-f596-4d85-92c5-c0a013d9787c",
    "e60f70e4-5936-49b6-b363-2d4e18257b8d",
    "3bd84f7e-fbc8-4b16-aede-962fa9b4d3d9",
    "43b2ec26-5670-4380-894a-6040c9830780",
    -- Add the rest of your job IDs here
}

-- Variables
local currentIndex = 1
local hasScanned = false
local scanDelay = 15 -- Seconds to wait after joining before scanning
local maxRetries = 3 -- Maximum webhook retry attempts

-- Services
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

-- HTTP Request function that works with exploits
local function httpRequest(url, data)
    -- Try different HTTP request methods available in exploits
    local success, result
    
    if syn and syn.request then
        success, result = pcall(function()
            return syn.request({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = data
            })
        end)
    elseif http_request then
        success, result = pcall(function()
            return http_request({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = data
            })
        end)
    elseif request then
        success, result = pcall(function()
            return request({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = data
            })
        end)
    elseif http and http.request then
        success, result = pcall(function()
            return http.request({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = data
            })
        end)
    else
        return false, "No HTTP request function found"
    end
    
    return success, result
end

-- JSON Encode function that works with exploits
local function jsonEncode(data)
    local success, result = pcall(function()
        return game:GetService("HttpService"):JSONEncode(data)
    end)
    
    if success then return result end
    
    -- Fallback JSON encoder
    local function encode(val)
        if type(val) == "table" then
            local result = "{"
            for k, v in pairs(val) do
                local key = type(k) == "string" and '"'..k..'"' or "["..encode(k).."]"
                result = result .. key .. ":" .. encode(v) .. ","
            end
            if result:sub(-1) == "," then result = result:sub(1, -2) end
            return result .. "}"
        elseif type(val) == "string" then
            return '"' .. val:gsub('"', '\\"'):gsub("\n", "\\n") .. '"'
        else
            return tostring(val)
        end
    end
    
    return encode(data)
end

-- Parse rift descriptions from text
function parseRiftDescription(desc)
    log("Parsing description: " .. desc:sub(1, 50) .. "...")
    
    local eggName = string.match(desc, "%*%*(.-)%*%* has appeared")
    local luck = string.match(desc, "with (.-) luck")
    local pos = string.match(desc, "%*%*Position%*%*%s*(.-)%s*\n")
    local height = string.match(desc, "%*%*Height %(Y%)%*%*%s*(.-)%s*\n")
    local timer = string.match(desc, "%*%*Timer%*%*%s*(.-)%s*\n")
    local jobId = string.match(desc, "TeleportToPlaceInstance%([^,]+, ['\"](.-)['\"]")
    
    -- Debug the matches
    log("Egg Name: " .. (eggName or "nil"))
    log("Luck: " .. (luck or "nil"))
    log("Position: " .. (pos or "nil"))
    
    -- Categorize rift based on name or other properties
    local riftType = "Unknown"
    if eggName then
        if string.find(string.lower(eggName), "ancient") then
            riftType = "Rift 1"
        elseif string.find(string.lower(eggName), "mystic") then
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
    log("Preparing webhook for rift: " .. data.name)
    
    local embed = {
        ["title"] = string.format("Rift Detected: %s", data.riftType),
        ["description"] = string.format("**%s** has appeared with **%s** luck!\n\n**Position**\n%s\n\n**Height (Y)**\n%s\n\n**Timer**\n%s\n\n**Teleport Link**\n[Join Game](https://slayervalue.com/roblox/join_game.php?placeId=%s&jobId=%s)",
            data.name, data.luck, data.position, data.height, data.timer, PLACE_ID, data.jobId),
        ["color"] = 16711680 -- Red color
    }
    
    local payload = jsonEncode({embeds = {embed}})
    
    -- Try sending webhook with retries
    local retryCount = 0
    local success = false
    
    while not success and retryCount < maxRetries do
        local httpSuccess, response = httpRequest(WEBHOOK, payload)
        
        if httpSuccess then
            log("Webhook sent successfully!")
            success = true
            break
        else
            retryCount = retryCount + 1
            log("Failed to send webhook (attempt " .. retryCount .. "/" .. maxRetries .. "): " .. tostring(response), "warn")
            task.wait(1)
        end
    end
    
    return success
end

-- Scan for rifts with improved detection
function scanRifts()
    if hasScanned then return end -- Prevent multiple scans
    
    log("Scanning for rifts...")
    local foundRift = false
    
    -- IMPORTANT: Collect all GUI elements, not just in workspace
    local guiElements = {}
    
    -- Search in PlayerGui
    if LocalPlayer:FindFirstChild("PlayerGui") then
        for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
            if gui:IsA("TextLabel") or gui:IsA("TextButton") then
                table.insert(guiElements, gui)
            end
        end
    end
    
    -- Search in CoreGui
    pcall(function()
        for _, gui in pairs(game:GetService("CoreGui"):GetDescendants()) do
            if gui:IsA("TextLabel") or gui:IsA("TextButton") then
                table.insert(guiElements, gui)
            end
        end
    end)
    
    -- Search in workspace
    for _, descendant in pairs(Workspace:GetDescendants()) do
        if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
            table.insert(guiElements, descendant)
        end
    end
    
    log("Found " .. #guiElements .. " GUI elements to scan")
    
    -- Now scan the collected GUI elements
    for _, gui in ipairs(guiElements) do
        if gui and gui.Text and string.find(gui.Text, "has appeared") then
            log("Found potential rift message: " .. gui.Text:sub(1, 50) .. "...")
            local rift = parseRiftDescription(gui.Text)
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

-- Hop to next server - using the method you confirmed works
function hop()
    log("Preparing to hop to next server...")
    currentIndex = currentIndex + 1
    
    if currentIndex <= #jobIds then
        local nextJobId = jobIds[currentIndex]
        log("Teleporting to server " .. currentIndex .. " with JobID: " .. nextJobId)
        
        -- Queue script to run after teleport (important for continuity)
        local scriptUrl = "https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua"
        pcall(function()
            if syn and syn.queue_on_teleport then
                syn.queue_on_teleport('loadstring(game:HttpGet("' .. scriptUrl .. '"))()')
            elseif queue_on_teleport then
                queue_on_teleport('loadstring(game:HttpGet("' .. scriptUrl .. '"))()')
            end
        end)
        
        -- Use the teleport method you confirmed works
        local success, teleportError = pcall(function()
            return game:GetService('TeleportService'):TeleportToPlaceInstance(PLACE_ID, nextJobId, game.Players.LocalPlayer)
        end)
        
        if not success then
            log("Failed to teleport: " .. tostring(teleportError), "warn")
            -- Try again with the next server
            task.delay(1, hop)
        end
    else
        log("Finished scanning all servers in the list.")
    end
end

-- Main execution starts here
log("Rift Scanner starting...")

-- Make sure we have required services
if not game:GetService("TeleportService") then
    log("TeleportService not available!", "error")
    return
end

-- Check if game is loaded
if game:IsLoaded() then
    log("Game is already loaded")
else
    log("Waiting for game to load...")
    game.Loaded:Wait()
end

-- Wait for character to load
if LocalPlayer.Character then
    log("Character is already loaded")
else
    log("Waiting for character to load...")
    LocalPlayer.CharacterAdded:Wait()
end

-- Reset scan flag for new server
hasScanned = false

-- Wait for rifts to load
log("Waiting " .. scanDelay .. " seconds for rifts to load...")
task.delay(scanDelay, function()
    scanRifts()
end)

-- Set up character added event for when we teleport
LocalPlayer.CharacterAdded:Connect(function()
    log("Character added in new server!")
    hasScanned = false
    
    -- Wait for rifts to load in new server
    log("Waiting " .. scanDelay .. " seconds for rifts to load...")
    task.delay(scanDelay, function()
        scanRifts()
    end)
end)

log("Rift Scanner initialized successfully!")
