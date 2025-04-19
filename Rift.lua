-- Swift-Specific Rift Scanner
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
    "8ec9fbdc-f596-4d85-92c5-c0a013d9787c",
    "e60f70e4-5936-49b6-b363-2d4e18257b8d",
    "3bd84f7e-fbc8-4b16-aede-962fa9b4d3d9",
    "43b2ec26-5670-4380-894a-6040c9830780",
    "ff8dbf96-f688-497e-ae7a-aae39c6e8309",
    "3e78d2b2-15ae-48a6-862b-fa642e7df38a",
    "60eb80d4-9aae-4d14-bcd9-7f904f1dd3f0",
    "f84672d9-a819-4784-a312-1094dfca1361",
    "b329e6cc-f955-4b74-8ae8-fddff9cf176b",
    "a4c55cf4-a82e-43db-94eb-dd2ec4d45631",
    "fc0caf6d-25e8-472a-94bc-f9753652578f",
    "5b416f86-5b87-4adc-bab7-ef5f30da099b",
    "fa995d63-1271-47f0-97f7-89a7f63c4185",
    "a8bec50e-73c6-4022-965e-095057f4e5b2",
    "4256eb41-a264-43b5-9d94-8abf1f4fd790",
    "89c5eb5d-b8f6-4846-b89d-71235c53eae9",
    "db9b7332-e902-4e26-b5e9-780a3927e955",
    "423f7592-8467-433f-9c11-8fde8bb145bf",
    "dce3dfc6-591f-4630-866b-69eeff1c8c67",
    "a0048d0e-55b5-4e1a-8b3c-3bd4b8e842ee",
    "a1de76be-a9c4-412a-9a86-d7876ec15d08",
    "0e26010a-f60d-4e6d-a435-7f60307ba017",
    "31d28ca1-9edb-4a7b-82aa-05ed521ffde6",
    "d4d7814a-40e0-4f9b-9e22-421d78f05512",
    "9d93a539-2cff-4869-b245-218cc357c227",
    "84830fd7-0eef-46b8-afa1-e9e038ab0fc7",
    "ff422ebc-a841-4994-bfc0-51886c74bf2d",
    "f65c6ec0-58fc-4c00-9af9-424ed64dfa03",
    "25ab5db1-c0d5-4ab7-8fd8-ce399820d12b",
    "7daeacac-fea6-498e-8ab8-0f206b263cbe",
    "99a52a8b-17c0-422d-909d-82dc4d480097",
    "51828d41-e443-4c68-bf78-8b6df90183c5",
    "775ef942-b903-4282-b3d8-19048ca7cd81",
    "ad46e161-9d08-4c9b-90d0-326de9db429c",
    "c6c815fa-1171-4a3b-b9b7-c0ca1e1da165",
    "28278222-fa6a-42e5-9edb-b0c16b302fb6",
    "b298acb6-9ed0-4803-b10c-53cb7942a6b7",
    "5400e104-b3b8-425c-aafd-8a593dfe7c2e",
    "06caec28-f132-44a0-a10d-41aabe201269",
    "c7dfbd79-4e91-4a29-b38b-4555f4339eae",
    "cacbfb60-a210-4704-a6e1-f777b4b0944a",
    "3c807710-4cff-4726-81d9-b30a0a56fbc1",
    "b34cb727-2b5d-477d-a6fc-4b913d037df7",
    "43ee6b09-d741-45dc-8394-2a17d2fef39d",
    "6c299152-ea8f-4b6f-b4a8-2500f3ebb600",
    "eb2b9438-ff97-4d30-b50c-7a9c12ab718a",
    "db893926-3b7b-49e5-ab3b-c6a7abfcc810",
    "05678f4f-52cc-4afe-a569-8984b1f0d491",
    "661b0288-95fa-4bb0-b762-7596de26468f",
    "1793d6eb-6a25-4090-9f07-c4905fc42414",
    "8e6de271-3948-4348-95f6-d23705ae98e3",
    "cd71f33f-924e-409f-a9bd-f60db9d99c69",
    "96aee332-141f-49fb-86d0-224857b32434",
    "69a9d3fd-7c79-4727-8383-e9f969ed6473",
    "0baa3078-595f-4808-a718-df1503f48c46",
    "ec51c3a8-ebaa-46cb-8464-b39183f96be4",
    "8fa7f43e-0eee-4ba2-9705-4e4c7055c99b",
    "0ac1048c-f09a-4eec-9258-f27d84a50e5c",
    "058a5924-6fc8-4de8-90cf-8f3162d80402",
    "d276b757-f620-4873-9019-a4547174b7ae",
    "834ca6ad-4d15-454e-8c3c-0e49bcc1d5fe",
    "5ab77a29-eabd-4981-ad80-8aca2d9c5ffa",
    "166b33e5-91d9-4d0e-81f0-fb60210cd9ee",
    "84b52939-e6f9-4ac5-b467-d9dd1fdd3acf",
    "aa1ded54-e8e2-422a-b93c-271f2c07dd83",
    "080adaa7-19b5-4d69-9bd0-d5d739eaa50d",
    "0f29c397-a873-4447-b541-f4bc7cbe4249",
    "a4cf3fe2-b9e6-4846-b460-bb98e18cb809",
    "8b0bda4b-8053-45d1-ad5b-f7682ec41b16",
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
