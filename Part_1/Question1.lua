local function releaseStorage(player)
    --Checking If player is not nill
	if player then
        player:setStorageValue(1000, -1)
        print("Storage value released for player: " .. player:getName())
    else
        error("Error: Player is nil in releaseStorage function")
    end
end

function onLogout(player)
    -- Check if the player object is not nil
    if player then
        if player:getStorageValue(1000) == 1 then
            addEvent(releaseStorage, 1000, player)
        end
    else
        error("Error: Player is nil in onLogout function")
    end
    -- Always return true to allow player logout
    return true
end
