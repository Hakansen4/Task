function printSmallGuildNames(memberCount)
-- this method is supposed to print names of all guilds that have less than memberCount max members

	local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
	local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
	
	if resultId ~= nil then
		local guildNames = {} -- Store guild names in a table
		
		--Fetch all guild names from the result set
		repeat
			local guildName = resultId.getString("name")
			table.insert(guildNames,guildName)
		until not resultId.next()
		
		--Print all guild names
		for _,name in ipairs(guildNames)do
			print(name)
		end
	
	else
		print("No guild found with less than " .. memberCount .. " members.")
	end

end