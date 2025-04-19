-- Swift-Specific Rift Scanner (Fixed List Navigation)
-- Uses Swift's own teleport functions if available

-- Configuration
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

-- Initialize or use existing counter
if _G.CurrentIndex == nil then
    _G.CurrentIndex = 1
end

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

-- Try to teleport using multiple methods
function hopToNextServer()
    -- Increment the index for the next server
    local nextIndex = _G.CurrentIndex + 1
    
    -- Check if we've reached the end of the server list
    if nextIndex <= #jobIds then
        local nextJobId = jobIds[nextIndex]
        print("[RiftScanner] Attempting to join server " .. nextIndex .. " with JobID: " .. nextJobId)
        
        -- Queue script to run after teleport with the NEXT index
        local scriptToQueue = [[
            _G.CurrentIndex = ]] .. nextIndex .. [[
            print("[RiftScanner] Continuing in new server at index: " .. _G.CurrentIndex)
            wait(5)
            loadstring(game:HttpGet('https://raw.githubusercontent.com/SubbyDubby/Roblox-Rift-Scanner/main/Rift.lua'))()
        ]]
        
        -- Set up script to run after teleport
        if syn and syn.queue_on_teleport then
            syn.queue_on_teleport(scriptToQueue)
        elseif queue_on_teleport then
            queue_on_teleport(scriptToQueue)
        else
            print("[RiftScanner] WARNING: No queue_on_teleport function found!")
        end
        
        wait(1) -- Give queue_on_teleport time to register
        
        -- Try direct TeleportService (simplified call)
        print("[RiftScanner] Attempting teleport now...")
        local success = pcall(function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(PLACE_ID, nextJobId)
        end)
        
        if not success then
            print("[RiftScanner] TeleportService failed, trying alternative methods...")
            
            -- Try Swift's teleport methods if available
            if getgenv().Swift and getgenv().Swift.Server and getgenv().Swift.Server.Join then
                print("[RiftScanner] Trying Swift.Server.Join...")
                getgenv().Swift.Server.Join(PLACE_ID, nextJobId)
            elseif getgenv().joinServer then
                print("[RiftScanner] Trying joinServer...")
                getgenv().joinServer(PLACE_ID, nextJobId)
            else
                print("[RiftScanner] All teleport methods failed! Check Discord for help.")
            end
        end
    else
        print("[RiftScanner] Finished scanning all servers in the list - truly at the end")
    end
end

-- Wait for game to load
if not game:IsLoaded() then game.Loaded:Wait() end
wait(5) -- Give time for player to load

-- Start the scan
scanServer()
