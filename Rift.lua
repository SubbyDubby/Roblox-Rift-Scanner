-- Ultra-Simple Rift Scanner for Swift (Fixed Teleport Version)
-- This script focuses on server hopping with minimal complexity

-- Configuration
local WEBHOOK = "https://discord.com/api/webhooks/1363251024210432164/B26f2Tvrl_QuigIZ5AJswcd1hYKPGxIHlYzUUu-cicdhF6kj2i5hrQi16-YK2-R7rk0Y" -- Replace with your Discord webhooklocal PLACE_ID = 85896571713843
local jobIds = {
    "177af98f-00cb-44b9-8cb4-811e4e1a3ebd",
    "7e88ed13-1669-4a31-a072-6700db251d6f",
    "6377fc9a-5bd9-42e0-a980-fe3e2d6fb38a"
    -- Add more as needed, but start with just a few for testing
}

-- Store our position in a global variable
_G.CurrentIndex = _G.CurrentIndex or 1
_G.ScriptStarted = true

print("[RiftScanner] Script started, server index: " .. _G.CurrentIndex)

-- Simple scan function
local function scanServer()
    print("[RiftScanner] Scanning server...")
    local foundRift = false
    
    -- Check PlayerGui for rift messages
    local player = game:GetService("Players").LocalPlayer
    if player and player:FindFirstChild("PlayerGui") then
        for _, gui in pairs(player.PlayerGui:GetDescendants()) do
            if gui:IsA("TextLabel") and gui.Text and gui.Text:find("has appeared") then
                print("[RiftScanner] Found potential rift: " .. gui.Text:sub(1, 50))
                foundRift = true
            end
        end
    end
    
    -- Check workspace for rift messages
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("TextLabel") and obj.Text and obj.Text:find("has appeared") then
            print("[RiftScanner] Found potential rift in workspace: " .. obj.Text:sub(1, 50))
            foundRift = true
        end
    end
    
    if not foundRift then
        print("[RiftScanner] No rifts found in this server")
    end
    
    -- Move to next server after scan
    print("[RiftScanner] Will hop to next server in 5 seconds...")
    wait(5)
    hopToNextServer()
end

-- Improved teleport function
function hopToNextServer()
    _G.CurrentIndex = _G.CurrentIndex + 1
    
    if _G.CurrentIndex <= #jobIds then
        local nextJobId = jobIds[_G.CurrentIndex]
        print("[RiftScanner] Hopping to server " .. _G.CurrentIndex .. " with JobID: " .. nextJobId)
        
        -- IMPORTANT: Save our script state before teleporting
        local scriptToQueue = [[
            _G.CurrentIndex = ]] .. _G.CurrentIndex .. [[
            print("[RiftScanner] Continuing execution in new server at index: " .. _G.CurrentIndex)
            
            -- Wait a few seconds before executing the script
            spawn(function()
                wait(5)
                loadstring(game:HttpGet('https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua'))()
            end)
        ]]
        
        -- Queue the script to run after teleport
        if syn and syn.queue_on_teleport then
            syn.queue_on_teleport(scriptToQueue)
        elseif queue_on_teleport then
            queue_on_teleport(scriptToQueue)
        else
            print("[RiftScanner] WARNING: No queue_on_teleport function found!")
        end
        
        -- Give time for queue_on_teleport to register
        wait(1)
        
        -- Try to teleport with error handling for various exploit limitations
        print("[RiftScanner] Executing teleport now...")
        
        -- Method 1: Direct TeleportService call with fixed arguments
        local success = pcall(function()
            local TeleportService = game:GetService("TeleportService")
            local Players = game:GetService("Players")
            TeleportService:TeleportToPlaceInstance(tonumber(PLACE_ID), nextJobId, Players.LocalPlayer)
        end)
        
        if not success then
            print("[RiftScanner] First teleport method failed, trying alternative...")
            
            -- Method 2: Alternative syntax that might work better with Swift
            success = pcall(function()
                local args = {
                    [1] = tonumber(PLACE_ID),
                    [2] = nextJobId,
                    [3] = game:GetService("Players").LocalPlayer
                }
                game:GetService("TeleportService"):TeleportToPlaceInstance(unpack(args))
            end)
            
            if not success then
                print("[RiftScanner] Second teleport method failed, trying another alternative...")
                
                -- Method 3: Very simple form that might work with Swift
                success = pcall(function()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PLACE_ID, nextJobId)
                end)
                
                if not success then
                    print("[RiftScanner] All teleport methods failed! Moving to next server in list...")
                    -- Skip to next server if teleport fails
                    hopToNextServer()
                end
            end
        end
    else
        print("[RiftScanner] Finished scanning all servers in the list")
    end
end

-- Wait for game to load if needed
if not game:IsLoaded() then 
    print("[RiftScanner] Waiting for game to load...")
    game.Loaded:Wait() 
    print("[RiftScanner] Game loaded")
end

-- Wait a bit for everything to initialize
print("[RiftScanner] Waiting 10 seconds before scanning...")
wait(10)

-- Start the scan process
scanServer()
