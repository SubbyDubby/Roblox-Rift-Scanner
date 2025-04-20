-- AWP.GG Compatible Rift Scanner with Advanced Detection
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
    "8ec9fbdc-f596-4d85-92c5-c0a013d9787c"
    -- Add more as needed
}

-- Initialize global variables
_G.CurrentIndex = _G.CurrentIndex or 1
_G.sent = _G.sent or {}

-- Services
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- HTTP request function based on executor
local request = http_request or request or syn and syn.request or fluxus and fluxus.request or getgenv().request

-- Logger function
local function log(message)
    print("[RiftScanner] " .. message)
end

-- Send information to webhook
local function postToWebhook(title, fields)
    log("Sending webhook: " .. title)
    
    local embed = {
        title = title,
        fields = fields,
        color = 10597128,
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }

    local payload = HttpService:JSONEncode({ embeds = { embed } })

    local success, response = pcall(function()
        return request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = payload
        })
    end)
    
    if success then
        log("Webhook sent successfully!")
    else
        log("Failed to send webhook: " .. tostring(response))
    end
end

-- Scan for rifts using the improved detection method
local function scanRifts()
    log("Scanning for rifts...")
    local foundRift = false
    local currentSeen = {}

    -- Find the rifts folder
    local riftFolder = Workspace:FindFirstChild("Rendered") and Workspace.Rendered:FindFirstChild("Rifts")
    if not riftFolder then 
        log("Rifts folder not found")
    else
        log("Rifts folder found, checking for rifts...")
        
        -- Loop through all rifts
        for _, rift in pairs(riftFolder:GetChildren()) do
            if not rift:IsA("Model") then continue end

            local name = rift.Name:lower()
            local gui = rift:FindFirstChild("Display") and rift.Display:FindFirstChild("SurfaceGui")
            if not gui then continue end

            local timerLabel = gui:FindFirstChild("Timer")
            local luckLabel = gui:FindFirstChild("Icon") and gui.Icon:FindFirstChild("Luck")

            local timer = timerLabel and timerLabel.Text or nil
            local multiplier = luckLabel and luckLabel.Text or nil

            if not timer or timer == "" then continue end

            -- Y Position for height
            local y = rift:GetPivot().Position.Y
            local key = name .. "|" .. timer .. "|" .. (multiplier or "n/a") .. "|" .. y
            currentSeen[key] = true
            foundRift = true

            if not _G.sent[key] then
                _G.sent[key] = true

                if multiplier then
                    log("Found rift: " .. name .. " with " .. multiplier .. " luck")
                    postToWebhook("🌈 Rift Detected!", {
                        { name = "Egg", value = name, inline = true },
                        { name = "Multiplier", value = multiplier, inline = true },
                        { name = "Time Left", value = timer, inline = true },
                        { name = "Height (Y)", value = tostring(math.floor(y)), inline = true },
                        { name = "Server ID", value = game.JobId, inline = false }
                    })
                else
                    log("Found chest: " .. name)
                    postToWebhook("🎁 Chest Detected!", {
                        { name = "Chest", value = name, inline = true },
                        { name = "Time Left", value = timer, inline = true },
                        { name = "Height (Y)", value = tostring(math.floor(y)), inline = true },
                        { name = "Server ID", value = game.JobId, inline = false }
                    })
                end
            end
        end

        -- Clear despawned entries
        for key in pairs(_G.sent) do
            if not currentSeen[key] then
                _G.sent[key] = nil
            end
        end
    }

    if not foundRift then
        log("No rifts found in this server")
    end
    
    -- After scanning, wait 15 seconds before hopping
    log("Waiting 15 seconds before moving to next server...")
    task.wait(15)
    hopToNextServer()
end

-- Hop to next server
function hopToNextServer()
    _G.CurrentIndex = _G.CurrentIndex + 1
    
    if _G.CurrentIndex <= #jobIds then
        local nextJobId = jobIds[_G.CurrentIndex]
        log("Hopping to server " .. _G.CurrentIndex .. " with JobID: " .. nextJobId)
        
        -- Queue script to run after teleport
        local scriptToQueue = [[
            _G.CurrentIndex = ]] .. _G.CurrentIndex .. [[
            _G.sent = {}
            loadstring(game:HttpGet('https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua'))()
        ]]
        
        -- AWP.GG should support queue_on_teleport
        if queue_on_teleport then
            queue_on_teleport(scriptToQueue)
        elseif syn and syn.queue_on_teleport then
            syn.queue_on_teleport(scriptToQueue)
        end
        
        -- Wait for queue_on_teleport to register
        task.wait(1)
        
        -- Try to teleport
        log("Executing teleport...")
        local success, error = pcall(function()
            TeleportService:TeleportToPlaceInstance(PLACE_ID, nextJobId, LocalPlayer)
        end)
        
        if not success then
            log("Teleport failed: " .. tostring(error))
            log("Trying next server...")
            task.wait(5)
            hopToNextServer() -- Skip to next server
        end
    else
        log("Finished scanning all servers in the list")
    end
end

-- Main execution starts here
log("Rift Scanner started")
log("Current server index: " .. _G.CurrentIndex)

-- Wait for game to load
if not game:IsLoaded() then
    log("Waiting for game to load...")
    game.Loaded:Wait()
end

-- Wait for player character to load
if not LocalPlayer.Character then
    log("Waiting for character to load...")
    LocalPlayer.CharacterAdded:Wait()
end

-- Wait a bit for everything to initialize
log("Waiting 10 seconds before starting scan...")
task.wait(10)

-- Start scanning
scanRifts()
