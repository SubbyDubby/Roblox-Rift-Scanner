-- Fully Automatic AWP.GG Rift Scanner
-- Configuration (EDIT THESE)
local WEBHOOK_URL = "https://discord.com/api/webhooks/1363251024210432164/B26f2Tvrl_QuigIZ5AJswcd1hYKPGxIHlYzUUu-cicdhF6kj2i5hrQi16-YK2-R7rk0Y" -- Replace with your actual webhook
local PLACE_ID = 85896571713843
local jobIds = {
    "ea791028-4b66-4d97-899d-f9b418eab530",
    "63fd4af8-3f1b-4c0d-8fb4-b65e4adccc5f",
    "42bb6582-d991-41a8-8deb-5850d4ee1738",
    "45113556-9ea5-4f4c-b88d-35b3c739f514",
    "c090838d-4aa7-4681-b583-15048818566c",
    "15f6d3c9-c695-4184-aea1-bbc539653712",
    "10af8b09-a308-4eca-80da-dec560cd4009",
    "6e69dab2-a934-478f-ab81-e9462ffefaef",
    "b79296c8-c057-4e97-abef-ddd9dfd60a06",
    "a890ab1a-9048-471e-8320-1fd3dfae5100",
    "4c0658a1-b5d7-4e7e-8dc5-b7a00be58566",
    "b4ce6735-92c3-48c9-b122-e11eceac1d93",
    "abf80c76-8467-41a8-af71-c6f50e9fafc5",
    "71242dfb-da5f-465d-8ceb-a672b605eeed",
    "fb70cc3c-465d-470a-8828-ee4ced350580",
    "1f4aeebb-9598-4b62-811e-ec2f0232df30",
    "233095d0-c671-4c96-b8ea-481158b34060",
    "4648c505-cb10-4834-9a2d-1d4d0a9796f7",
    "d50c05ff-bffd-4e51-8bb7-ecd2d1aaa9d7",
    "0dc6bb72-3718-4a64-b43e-642885049410",
    "7c264599-3350-4dd4-8ef5-372fd1156240",
    "ddeb314e-77e6-4def-828b-6773e11984da",
    "53759214-ec7c-4aa9-aa53-404d65384e51",
    "0297aac1-220a-4dd8-811e-efd7aa329e45",
    "cb95ac0f-0e56-4d1c-947c-f22ed9ab107d",
    "572b86c5-c214-49c7-a7bf-8b6a6e7fdbf3",
    "4880b9eb-cbd3-4578-8970-f9dca3663dd7",
    "7a4491df-d81b-447b-97c5-fb87e32a8067",
    "538c7622-950b-402e-8d1e-c37968aa5739",
    "9c661350-9417-458f-9a60-464f4c4eeb0c",
    "ffa7038a-482e-4f97-aea5-b18da8630da6",
    "15042873-5c2f-41fb-93c7-e536fed4c64a",
    "5da4efe2-b221-4572-aba0-a686545ddfd1",
    "a6762bb9-1010-484b-93b6-2cf97a5cdc9e",
    "e3765b86-882d-4c47-a53a-bf87599aee65",
    "368c86ea-f399-4f86-add6-f8787f1e308f",
    "bcdaa6cf-36da-48d3-9a94-3995dd811642",
    "642680c2-87e9-4cef-b01e-0f5c96ff75d2",
    "83fea58f-222b-4f39-9add-f1a0d5294d83",
    "fce055e7-466c-4617-98b7-e8b1051c1a47",
    "2352f179-1ec1-43a7-97a8-8d06ee30e58f",
    "bec05e6b-79c1-4018-acd9-d413416a3968",
    "dba16857-1987-48bb-8ec0-30185f2e4b82",
    "eb04347f-1551-4d92-93d2-b8bbff39348a",
    "2661f64f-21bf-4aa5-a328-6026f7536c26",
    "2216d398-3d19-420b-b1ba-a27fa45d36e6",
    "b1f5f8e5-1662-456c-bd50-f10f9606f27b",
    "4052f111-ccd1-4274-bcb1-6dd63de6cb1a",
    "78f4af0a-1d6e-49b3-95ad-09ff963fe400",
    "cf8ee517-5429-4da1-8fb2-6b83308dccaa",
    "ae50c03b-4192-477c-81b9-6228f8bf3f07",
    "ae6ba09e-4058-4267-8a2a-0c12cf739298",
    "9760a9b5-2ddd-41e8-a94b-dce24b5ee400",
    "e3a886da-06d3-4058-a8bb-8c1fa23efb6d",
    "e80a0935-6dc9-4cc2-8963-dc9516c96c40",
    "364a76da-686b-49c2-a874-b19cf25095d1",
    "0273ff62-24f7-4ac1-9d4f-d311b25cc96d",
    "ad131902-2608-4f3e-8f0c-fec7a5b65026",
    "70076655-21fd-480e-8937-c0d370de0c85",
    "e3c241b8-616d-4cc1-86a0-17c46ccf36ba",
    "7ade1442-50ab-49ee-b99f-6f0b20b8d213",
    "23ece706-63d2-43f5-b07a-f800d3669395",
    "44079225-70e7-4b07-9a8c-19a8ef83b906",
    "79beebc5-d623-4554-beb0-a23330197b4e",
    "af543e47-d547-4240-87a5-2fb1dc5b3d2a",
    "f0d0faae-67f6-4391-85eb-216dd4c985a0",
    "ff95ddfd-0098-4e3d-8e04-223e83cfe7b0",
    "8e41b4d8-e04c-43c4-9840-ffba1e85bec0",
    "49e548f1-0ad9-4171-94dd-d082edd0f524",
    "95c822bb-8715-4334-ab93-f3f936320c59",
    "5ef78e46-1f7d-49fe-aac4-d49bcb3218f6",
    "9841e549-a50c-42cb-9582-2ce0f1306a46",
    "66539eeb-a150-4cec-ba9a-3f9576c88600",
    "ddf32fec-86c1-45b5-9bed-cf95be47172a",
    "2f68c833-3f4b-4a26-abd1-1d24ce571787",
    "e9fc5eed-c932-4075-bd97-365b79ff70ae",
    "8a8d799f-bd97-4bec-b820-041da64b6e55",
    "440667cc-6aab-452a-8be3-f7eb25b6e428",
    "57d3aaf7-a319-4864-b7c9-7034dd3f556e",
    "cf3bb7d8-bb1f-45ee-9a2c-ac0ee5235ae1",
    "1085d73a-b574-4681-aeb8-b9a65a7dc80f",
    "549192b8-ee40-409e-bf3f-dfacf4d62f27",
    "099bbf44-521f-4def-ad60-2b01c25164f1",
    "8e645eb9-0e7e-4d5a-882a-04ec8ba24592",
    "1d1aeac0-13f1-49d7-a460-74bdbd2aeeeb",
    "cb7e9561-aab0-47e1-bd77-d486ec5c7b4c",
    "2ede30d3-0bc0-4bca-93c0-9f91621be1e0",
    "0edd075c-33be-42e8-af6c-00d15433bfee",
    "0ca2700d-3161-46fe-a515-7070a3639c67",
    "7138c4d5-ac1a-4e41-83ac-200d77dc6a44",
    "6c2b6598-9546-47a3-8041-1407af1751a4",
    "8ce15db8-584a-4ed8-b19e-4b62233f01a4",
    "7ae80795-0edb-4b82-85d0-c8906a8c1bb6",
    "8cecb1be-fb59-458d-b8f4-10657c3630ef",
    "f7f2e12e-f23c-4695-8776-eecd6141de94",
    "696cab68-a217-431f-af3f-2c71bb7c3894",
    "ead59733-29ee-4bce-a1ba-98251da347e2",
    "e43ad66e-da14-4729-8854-d4c21c5fe298",
    "28154926-e277-442f-8162-96dfddf6e215",
    "7825a119-9e2c-4e0e-b870-ad2cdf950fe3"
}

-- Initialize or restore global state
_G.RiftScanner = _G.RiftScanner or {
    CurrentIndex = 1,
    SentNotifications = {}
}

-- Services
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Get the appropriate request function
local request = http_request or request or (syn and syn.request) or (fluxus and fluxus.request) or getgenv().request
if not request then
    print("ERROR: No HTTP request function found!")
    return
end

-- Send webhook function
local function sendWebhook(title, fields)
    print("Sending webhook: " .. title)
    
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
        print("Webhook sent successfully!")
    else
        print("Failed to send webhook: " .. tostring(response))
    end
end

-- Scan for rifts
local function scanRifts()
    print("Scanning for rifts...")
    local foundRift = false
    local currentSeen = {}

    -- Look for the rifts folder
    local riftFolder = Workspace:FindFirstChild("Rendered") and Workspace.Rendered:FindFirstChild("Rifts")
    if not riftFolder then 
        print("Rifts folder not found")
    else
        print("Rifts folder found, checking for rifts...")
        
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

            if not _G.RiftScanner.SentNotifications[key] then
                _G.RiftScanner.SentNotifications[key] = true

                if multiplier then
                    print("Found rift: " .. name .. " with " .. multiplier .. " luck")
                    sendWebhook("🌈 Rift Detected!", {
                        { name = "Egg", value = name, inline = true },
                        { name = "Multiplier", value = multiplier, inline = true },
                        { name = "Time Left", value = timer, inline = true },
                        { name = "Height (Y)", value = tostring(math.floor(y)), inline = true },
                        { name = "Server ID", value = game.JobId, inline = false }
                    })
                else
                    print("Found chest: " .. name)
                    sendWebhook("🎁 Chest Detected!", {
                        { name = "Chest", value = name, inline = true },
                        { name = "Time Left", value = timer, inline = true },
                        { name = "Height (Y)", value = tostring(math.floor(y)), inline = true },
                        { name = "Server ID", value = game.JobId, inline = false }
                    })
                end
            end
        end

        -- Clear despawned entries
        for key in pairs(_G.RiftScanner.SentNotifications) do
            if not currentSeen[key] then
                _G.RiftScanner.SentNotifications[key] = nil
            end
        end
    end

    if not foundRift then
        print("No rifts found in this server")
    end
    
    -- After scanning, wait 15 seconds before hopping
    print("Waiting 15 seconds before moving to next server...")
    wait(15)
    hopToNextServer()
end

-- Auto-continuation script for the next server
local CONTINUATION_SCRIPT = [[
-- Initialize global variables
_G.RiftScanner = _G.RiftScanner or {}
_G.RiftScanner.CurrentIndex = %d
_G.RiftScanner.SentNotifications = {}

-- Wait for game to load
if not game:IsLoaded() then game.Loaded:Wait() end
wait(5) -- Additional wait to ensure everything loads properly

-- Load and execute main script
loadstring(game:HttpGet('https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua'))()
]]

-- Hop to next server with advanced auto-continuation and error handling
-- Hop to next server with improved error handling
function hopToNextServer()
    local nextIndex = _G.RiftScanner.CurrentIndex + 1
    
    if nextIndex <= #jobIds then
        local nextJobId = jobIds[nextIndex]
        print("Hopping to server " .. nextIndex .. " with JobID: " .. nextJobId)
        
        -- Update the current index immediately
        _G.RiftScanner.CurrentIndex = nextIndex
        
        -- Create continuation script
        local scriptToQueue = string.format(CONTINUATION_SCRIPT, nextIndex)
        
        -- Queue script to run after teleport
        if getgenv().queue_on_teleport then
            getgenv().queue_on_teleport(scriptToQueue)
            print("Using AWP.GG queue_on_teleport")
        elseif queue_on_teleport then
            queue_on_teleport(scriptToQueue)
            print("Using standard queue_on_teleport")
        elseif syn and syn.queue_on_teleport then
            syn.queue_on_teleport(scriptToQueue)
            print("Using Synapse queue_on_teleport")
        end
        
        -- Wait for queue_on_teleport to register
        wait(1)
        
        -- Set up a failsafe timer to move to the next server
        spawn(function()
            wait(15) -- Wait 15 seconds
            
            -- Check if we're still in the same server
            local currentServer = game.JobId
            if game.JobId == currentServer then
                print("Teleport likely failed or showing error. Moving to next server...")
                loadstring(game:HttpGet('https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua'))()
            end
        end)
        
        -- Attempt teleport
        print("Executing teleport...")
        pcall(function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(PLACE_ID, nextJobId, LocalPlayer)
        end)
        
        -- If teleport call returns (didn't throw error), wait a moment and try next method
        wait(3)
        
        -- Try alternative method if we're still here
        pcall(function()
            TeleportService:TeleportToPlaceInstance(PLACE_ID, nextJobId)
        end)
        
        -- Still here? Try one last method
        wait(3)
        if getgenv().teleport then
            pcall(function()
                getgenv().teleport(PLACE_ID, nextJobId)
            end)
        end
        
        -- If we get here, all teleport methods returned without error
        -- but we might still be showing an error dialog
        print("All teleport methods attempted. Waiting for failsafe timer...")
        
    else
        print("Finished scanning all servers in the list. Restarting from the beginning...")
        _G.RiftScanner.CurrentIndex = 0
        hopToNextServer()
    end
end
-- Main execution starts here
print("Rift Scanner started")
print("Current server index: " .. _G.RiftScanner.CurrentIndex)

-- Wait for game to load completely
if not game:IsLoaded() then
    print("Waiting for game to load...")
    game.Loaded:Wait()
end

-- Wait for player character to load
if not LocalPlayer.Character then
    print("Waiting for character to load...")
    LocalPlayer.CharacterAdded:Wait()
end

-- Wait a bit for everything to initialize
print("Waiting 10 seconds before starting scan...")
wait(10)

-- Start scanning
scanRifts()
