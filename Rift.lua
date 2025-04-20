-- Fully Automatic AWP.GG Rift Scanner
-- Configuration (EDIT THESE)
local WEBHOOK_URL = "https://discord.com/api/webhooks/1363251024210432164/B26f2Tvrl_QuigIZ5AJswcd1hYKPGxIHlYzUUu-cicdhF6kj2i5hrQi16-YK2-R7rk0Y" -- Replace with your actual webhook
-- Add the 25x webhook URL (you can use the same URL if you want)
local WEBHOOK_URL_25X = "https://discord.com/api/webhooks/1363451259016712192/OIMNA2MKvtfFW2IZOj5zDyoqhDYFlV-uU1GARyJwWSPSVHQzDAvSThojSOf1n9f5E6de" -- Replace with your special webhook for 25x rifts
local PLACE_ID = 85896571713843
local PLACE_ID = 85896571713843
local jobIds = {
    "861e9d61-0770-4151-b09f-2123127c2194",
    "d3fbf716-02fc-4f01-a6d1-68870c048026",
    "bfc3deaa-6766-440f-92d8-480aec102ce1",
    "089501e5-5e94-49c1-bf46-072672def98c",
    "037943a6-16eb-40a6-89bf-cbd479a06645",
    "a8aae301-387a-4e47-be79-97c636a8c36a",
    "99cc87ae-0125-4654-8aa5-285cf81a6026",
    "f8d552ae-79b2-4edf-bdd4-c18c77ffe244",
    "1491bddd-173a-4a47-a621-1e82831d0c87",
    "c04110f1-6502-4630-b018-4438a2857da7",
    "124c7149-ba43-46a0-b45a-333cf4534fe6",
    "e0cd0bcc-d80a-4d7b-b551-5037e2bc12b5",
    "f8820179-44e4-4c65-a21e-8d142858cab1",
    "3b675b78-712e-41c5-9e34-cf804a6f68ad",
    "bb802102-7d67-4103-8c3f-b767f66ff113",
    "464a477b-6bdc-4951-a142-a477ea2f6ffa",
    "607f8eaf-6d1b-462f-bc5d-ce57efd09543",
    "c55d75df-e6fc-4c75-8376-36dd8b5d8d1c",
    "45130a5a-3e51-4eba-bac5-dd1ad95c335d",
    "ad29156c-2618-413e-ab61-c52a10592b44",
    "13b702ed-24a8-4f71-a007-c4f24c02ba9a",
    "41f056e4-0068-4951-998b-e41c790881cd",
    "375c7982-6cf0-47b7-80a3-ed3e34fa4cf5",
    "cc8b0ccf-35a5-426c-adb0-1a403d2d9254",
    "a98aabb8-cf07-4b0b-92b4-bd065391f580",
    "ab7e9117-bcb6-4ae4-b3df-ffa4a19e031b",
    "24fb829c-b348-483f-8be1-f3dfe8587573",
    "8a40ad7d-5714-441d-a962-fc71613a0a0d",
    "f3be4a2a-a8ee-4a72-bc8d-59a237320c97",
    "5ca2f7dc-41c3-4459-bddf-0161649c0dec",
    "c8e702a6-654c-4de5-b3e8-17382cb3b600",
    "f814f8d1-a642-4522-ad05-92e746c87a8f",
    "b02adbdf-c5c9-4b90-9ba8-96da01844e2e",
    "9478ae96-486e-4c0c-845b-14ae7ac0727c",
    "066c3e07-386e-4b5f-860a-f5c2efa38491",
    "f8ea368a-d528-4bed-8258-c7d5bee91e3c",
    "90b5056b-0a77-419a-bcc9-42262a826d74",
    "0584c27b-050e-4fe1-87e3-bc6c4d6702fd",
    "c1b862ad-8255-4143-ad71-909c6b16270e",
    "95d15fe4-4804-406d-8a4b-d89d826e133a",
    "6ff156da-815b-420f-b16f-f6a304e21f29",
    "bb1a9d81-b359-4368-85de-0f0852af2462",
    "c0d6b9bb-24b6-4a0e-bc28-0411e35c4a14",
    "756af650-67fc-40cd-8ecb-035488fe048d",
    "61034f62-d594-41fe-a0e9-2bf6b1f8406c",
    "7096ec99-cd71-4135-81be-9daeb48279de",
    "ab3c5139-c44b-4576-9bd8-4e84fc45fc75",
    "22ef1f1a-2f34-4e22-96b9-018f79957c9d",
    "78c3e124-8c68-4230-b085-e38376d87140",
    "360e5405-bd0a-4e97-9685-e74dcd33bbaa",
    "07172ae9-ea58-421e-bb61-24e22dbe191b",
    "d5195c2a-efbb-4468-9401-c8c57b02a1b5",
    "b940fd35-6272-4295-b7b2-892c6fa8dddf",
    "12406ebb-b6c8-4710-b72a-67cb8c0a8c5d",
    "c3fcb2f4-2324-4c10-add6-6bddfa13d773",
    "842a8471-a286-415b-8edf-cde3a211c44a",
    "6f467c68-be44-41ce-bd54-f7fab3d54b01",
    "ebf5c7e4-3ecb-4279-8d74-1cbac3cb454e",
    "5842ad48-c8dd-4d68-932f-d06db76743dd",
    "f0bbe519-6952-49e5-b8c7-62aef6ecce2e",
    "a489995a-ac51-4c1c-ab91-2624b3ab803a",
    "c5e9e439-902f-4c1e-9bfd-19aae6f8f223",
    "4cf6a2cc-4ade-48c2-b319-b6ad78daaae9",
    "c568e984-965f-4134-a30e-232de2465073",
    "a5838919-e6b0-4e82-93ab-6e16a64c0f4c",
    "afeed9fb-5262-4e8d-940d-fce6783e7431",
    "4f7acc2b-a09e-453a-ba95-6f5d7c5fc21b",
    "661b0288-95fa-4bb0-b762-7596de26468f",
    "c272aeb7-db25-45b0-9a99-ffd97130dbc1",
    "14220ace-e9e8-496b-b603-718b22861813",
    "e4da8208-becf-42b3-bc67-06e661ee1735",
    "dd5c6bfd-6c5e-4177-b818-71c3cd9778e8",
    "69a0e840-831b-49c6-af8c-242a4ac2a245",
    "73f8d8a5-cd8e-458e-8974-4ecf21a9ade3",
    "6c299152-ea8f-4b6f-b4a8-2500f3ebb600",
    "b09548c3-41bb-4145-a472-54c8fa2e512c",
    "7702e434-2e44-4323-b564-39a1310ca9a7",
    "782c1332-0aee-4fa7-9d5c-8a3894bd9e97",
    "8fa7f43e-0eee-4ba2-9705-4e4c7055c99b",
    "7daeacac-fea6-498e-8ab8-0f206b263cbe",
    "de7f4522-e40a-4dd6-ad8f-a53c003d1c3d",
    "ba46c298-e548-4333-be14-4d20e7f7d79d",
    "65fc06de-e63c-491d-9f4c-fc4c670d5159",
    "c1ecdde1-f683-49fd-b063-fa6a3ad06d01",
    "9da1aea4-42e9-419c-afc4-35ec3951b6ed",
    "71daa5d4-3629-4a49-866c-acee9f313256",
    "60b6cda7-967c-470d-b17c-c4482be490a8",
    "79967492-a848-4dd3-91e0-13805bc8ecc0",
    "662d9ec2-4538-4150-b315-336db5c3620a",
    "c80ceefd-9302-467b-a3b1-1f4b44df9a2a",
    "f242f650-be55-4780-8ee2-905860063565",
    "e7e7ccb1-3469-49e8-a8b4-abba1410e450",
    "03a954ee-98c9-4455-b670-841f1bd76245",
    "7e6baaa0-9cfe-4d47-b21b-0db7589da448",
    "b827b1b8-7938-471e-a119-174b298a925f",
    "c1595b25-48ca-4c96-afa0-195bfba13879",
    "96443c04-f88e-4187-bf7c-d616b46c6974",
    "9490743f-7786-44b2-a64d-ecc281313135",
    "5f565c15-08c8-46da-9db9-6ae699f065ce",
    "4633ad5c-7f63-445f-b25d-d2f65aa22cbd"
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

-- Send webhook function (unchanged)
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

-- Special webhook function for 25x multipliers
local function send25xWebhook(title, fields)
    print("Sending 25x webhook: " .. title)
    
    local embed = {
        title = title,
        fields = fields,
        color = 16711680, -- Bright red color for emphasis
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }

    local payload = HttpService:JSONEncode({ embeds = { embed } })

    local success, response = pcall(function()
        return request({
            Url = WEBHOOK_URL_25X,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = payload
        })
    end)
    
    if success then
        print("25x webhook sent successfully!")
    else
        print("Failed to send 25x webhook: " .. tostring(response))
    end
end

-- Optional: Uncomment to test the 25x webhook
--send25xWebhook("TEST 25x WEBHOOK", {
--    { name = "Test", value = "This is a test", inline = true },
--    { name = "Join Server", value = "[Click to Join](https://slayervalue.com/roblox/join_game.php?placeId=" .. PLACE_ID .. "&jobId=test)", inline = false }
--})
--print("Test webhook sent")

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

                -- Debug print the multiplier
                print("Checking multiplier:", multiplier)

                -- More robust pattern matching for 25x
                if multiplier and (string.find(tostring(multiplier):lower(), "25%s*x") or string.find(tostring(multiplier), "25")) then
                    -- 25x multiplier found - use special webhook
                    print("25x multiplier detected! Attempting to send to webhook...")
                    send25xWebhook("🌈 25x MULTIPLIER RIFT FOUND!", {
                        { name = "Egg", value = name, inline = true },
                        { name = "Multiplier", value = multiplier, inline = true },
                        { name = "Time Left", value = timer, inline = true },
                        { name = "Height (Y)", value = tostring(math.floor(y)), inline = true },
                        { name = "Join Server", value = "[Click to Join](https://slayervalue.com/roblox/join_game.php?placeId=" .. PLACE_ID .. "&jobId=" .. game.JobId .. ")", inline = false }
                    })
                elseif multiplier then
                    -- Regular multiplier rift (unchanged)
                    print("Found regular rift: " .. name .. " with " .. multiplier .. " luck")
                    sendWebhook("🌈 Rift Detected!", {
                        { name = "Egg", value = name, inline = true },
                        { name = "Multiplier", value = multiplier, inline = true },
                        { name = "Time Left", value = timer, inline = true },
                        { name = "Height (Y)", value = tostring(math.floor(y)), inline = true },
                        { name = "Server ID", value = game.JobId, inline = false }
                    })
                else
                    -- Chest rift (unchanged)
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
