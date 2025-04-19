-- Ultra-Simple Rift Scanner for Swift
-- This script focuses on server hopping with minimal complexity

-- Configuration
local WEBHOOK = "https://discord.com/api/webhooks/1363251024210432164/B26f2Tvrl_QuigIZ5AJswcd1hYKPGxIHlYzUUu-cicdhF6kj2i5hrQi16-YK2-R7rk0Y" -- Replace with your Discord webhooklocal PLACE_ID = 85896571713843
local jobIds = {
    "177af98f-00cb-44b9-8cb4-811e4e1a3ebd",
    "7e88ed13-1669-4a31-a072-6700db251d6f",
    "6377fc9a-5bd9-42e0-a980-fe3e2d6fb38a"
    -- Add more as needed, but start with just a few for testing
}

-- Store our position in a file to ensure persistence between servers
if not _G.ScriptStarted then
    _G.CurrentIndex = 1
    _G.ScriptStarted = true
    print("[RiftScanner] First run, starting with server 1")
else
    print("[RiftScanner] Continuing from previous server")
end

local function scanServer()
    print("[RiftScanner] Scanning server...")
    -- Simple scan implementation
    local foundRift = false
    
    -- Check PlayerGui for rift messages
    local player = game:GetService("Players").LocalPlayer
    if player and player:FindFirstChild("PlayerGui") then
        for _, gui in pairs(player.PlayerGui:GetDescendants()) do
            if gui:IsA("TextLabel") and gui.Text and gui.Text:find("has appeared") then
                print("[RiftScanner] Found potential rift: " .. gui.Text:sub(1, 50))
                foundRift = true
                -- Would send webhook here in full implementation
            end
        end
    end
    
    -- Check workspace for rift messages
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("TextLabel") and obj.Text and obj.Text:find("has appeared") then
            print("[RiftScanner] Found potential rift in workspace: " .. obj.Text:sub(1, 50))
            foundRift = true
            -- Would send webhook here in full implementation
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

function hopToNextServer()
    _G.CurrentIndex = _G.CurrentIndex + 1
    
    if _G.CurrentIndex <= #jobIds then
        local nextJobId = jobIds[_G.CurrentIndex]
        print("[RiftScanner] Hopping to server " .. _G.CurrentIndex .. " with JobID: " .. nextJobId)
        
        -- IMPORTANT: Save our script state before teleporting
        if syn and syn.queue_on_teleport then
            syn.queue_on_teleport([[
                _G.ScriptStarted = true
                _G.CurrentIndex = ]] .. _G.CurrentIndex .. [[
                print("[RiftScanner] Continuing execution in new server at index: " .. _G.CurrentIndex)
                task.spawn(function()
                    task.wait(5)
                    loadstring(game:HttpGet('https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua'))()
                end)
            ]])
        elseif queue_on_teleport then
            queue_on_teleport([[
                _G.ScriptStarted = true
                _G.CurrentIndex = ]] .. _G.CurrentIndex .. [[
                print("[RiftScanner] Continuing execution in new server at index: " .. _G.CurrentIndex)
                task.spawn(function()
                    task.wait(5)
                    loadstring(game:HttpGet('https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua'))()
                end)
            ]])
        else
            print("[RiftScanner] WARNING: No queue_on_teleport function found!")
        end
        
        -- Give time for queue_on_teleport to register
        wait(1)
        
        -- Teleport to next server
        print("[RiftScanner] Executing teleport now...")
        game:GetService('TeleportService'):TeleportToPlaceInstance(PLACE_ID, nextJobId, game:GetService("Players").LocalPlayer)
    else
        print("[RiftScanner] Finished scanning all servers in the list")
    end
end

-- Main execution starts here
print("[RiftScanner] Script started")
print("[RiftScanner] Current server index: " .. _G.CurrentIndex)

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
