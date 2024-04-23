playerPosition = nil
animationEvent = nil

function onExtendedOpcode(player, opcode, buffer)
  local buf = tonumber(buffer)
  --checking values that we sent from client for animation start
  if opcode == 15 and buf == 1 then
	--first getting player's position for effects positions
	playerPosition = player:getPosition()
	
	--Changing player Position for find the effects positions
	--You can find all effects position in here
	--[[
	* 	* 	(7) 	* 		(3)	  *	   * 
	*	*	 *		*		 *	  *    * 
   (8) 	* 	(5)   Player 	(1)	  *   (4)
	* 	*	 *		*		 *	  *	   * 
	* 	*	(6)		*		(2)   *	   * 
]]
	
	
	--(1)
	playerPosition.x = playerPosition.x + 1
	doSendMagicEffect(playerPosition, CONST_ME_HOLYAREA)
	
	--(2)
	playerPosition.y = playerPosition.y + 2
	doSendMagicEffect(playerPosition, CONST_ME_HOLYAREA)
	
	--(3)
	playerPosition.y = playerPosition.y - 4
	doSendMagicEffect(playerPosition, CONST_ME_HOLYAREA)
	
	--(4)
	playerPosition.x = playerPosition.x + 2
	playerPosition.y = playerPosition.y + 2
	doSendMagicEffect(playerPosition, CONST_ME_HOLYAREA)
	
	--(5)
	playerPosition.x = playerPosition.x - 4
	doSendMagicEffect(playerPosition, CONST_ME_HOLYAREA)
	
	--(6)
	playerPosition.y = playerPosition.y + 2
	doSendMagicEffect(playerPosition, CONST_ME_HOLYAREA)
	
	--(7)
	playerPosition.y = playerPosition.y -4
	doSendMagicEffect(playerPosition, CONST_ME_HOLYAREA)
	
	--(8)
	playerPosition.y = playerPosition.y + 2
	playerPosition.x = playerPosition.x - 2
	doSendMagicEffect(playerPosition, CONST_ME_HOLYAREA)

end
end