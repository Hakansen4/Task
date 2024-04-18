function removeMemberFromPlayerParty(playerId, membername)
    
	local player = Player(playerId)
	if not player then
		error("Player not found with this Id:" .. tostring(playerId))
	end
	
    local party = player:getParty()
    if not party then
		error("Party not found for player with this Id:" .. tostring(playerId))
	end
	
    local members = party:getMembers()
    for _, member in ipairs(members) do
        if member:getName() == membername then
            party:removeMember(member)
            return true -- Assuming each member has a unique name; return after removal
        end
    end
	return false -- Member was not found or removed
end
