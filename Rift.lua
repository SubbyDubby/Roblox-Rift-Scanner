-- Swift-Specific Rift Scanner
-- Uses Swift's own teleport functions if available

-- Configuration
local PLACE_ID = 85896571713843
local jobIds = {
    "1793d6eb-6a25-4090-9f07-c4905fc42414",
    "aa1ded54-e8e2-422a-b93c-271f2c07dd83",
    "535083ed-9972-42f5-b6fe-d747747cf926"
}

-- Store our position
_G.CurrentIndex = _G.CurrentIndex or 1

print("[RiftScanner] Script started, server index: " .. _G.CurrentIndex)

-- Simple scan function
local function scanServer()
    print("[RiftScanner] Scanning server...")
    local foundRift = false
    
    -- Check for rifts (simplified)
    local player = game:GetService("Players").LocalPlayer
    if player and player:FindFirstChild("PlayerGui") then
        for _, gui in pairs(player.PlayerGui:GetDescendants()) do
            if gui:IsA("TextLabel") and gui.Text and gui.Text:find("has appeared") then
                print("[RiftScanner] Found rift: " .. gui.Text:sub(1, 50))
                foundRift = true
            end
        end
    end
    
    if not foundRift then
        print("[RiftScanner] No rifts found in this server")
    end
    
    -- Move to next server
    print("[RiftScanner] Will hop to next server in 5 seconds...")
    wait(5)
    hopToNextServer()
end

-- Try to teleport using Swift-specific methods
function hopToNextServer()
    _G.CurrentIndex = _G.CurrentIndex + 1
    
    if _G.CurrentIndex <= #jobIds then
        local nextJobId = jobIds[_G.CurrentIndex]
        print("[RiftScanner] Attempting to join server " .. _G.CurrentIndex)
        
        -- Queue script to run after teleport
        local scriptToQueue = [[
            _G.CurrentIndex = ]] .. _G.CurrentIndex .. [[
            print("[RiftScanner] Continuing in new server at index: " .. _G.CurrentIndex)
            wait(5)
            loadstring(game:HttpGet('https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua'))()
        ]]
        
        if syn and syn.queue_on_teleport then
            syn.queue_on_teleport(scriptToQueue)
        elseif queue_on_teleport then
            queue_on_teleport(scriptToQueue)
        end
        
        wait(1) -- Give queue_on_teleport time to register
        
        -- Try Swift-specific teleport methods
        local success = false
        
        -- Method 1: Check if Swift has a Server namespace
        if getgenv().Swift and getgenv().Swift.Server then
            print("[RiftScanner] Trying Swift.Server.Join...")
            pcall(function()
                getgenv().Swift.Server.Join(PLACE_ID, nextJobId)
                success = true
            end)
        end
        
        -- Method 2: Try Swift teleport if available
        if not success and getgenv().Swift and getgenv().Swift.teleport then
            print("[RiftScanner] Trying Swift.teleport...")
            pcall(function()
                getgenv().Swift.teleport(PLACE_ID, nextJobId)
                success = true
            end)
        end
        
        -- Method 3: Try Swift joinServer if available
        if not success and getgenv().joinServer then
            print("[RiftScanner] Trying joinServer...")
            pcall(function()
                getgenv().joinServer(PLACE_ID, nextJobId)
                success = true
            end)
        end
        
        -- Method 4: Try a direct join_game call (common in many exploits)
        if not success and getgenv().join_game then
            print("[RiftScanner] Trying join_game...")
            pcall(function()
                getgenv().join_game(PLACE_ID, nextJobId)
                success = true
            end)
        end
        
        -- Last resort: Try standard TeleportService but with simplified parameters
        if not success then
            print("[RiftScanner] Trying TeleportService as last resort...")
            pcall(function()
                game:GetService("TeleportService"):TeleportToPlaceInstance(PLACE_ID, nextJobId)
            end)
        end
        
        -- If we failed all teleport attempts, move to next server
        wait(3)
        print("[RiftScanner] Teleport attempts may have failed, trying next server...")
        hopToNextServer()
    else
        print("[RiftScanner] Finished scanning all servers in the list")
    end
end

-- Wait for game to load
if not game:IsLoaded() then game.Loaded:Wait() end
wait(5) -- Give time for player to load

-- Start the scan
scanServer()
