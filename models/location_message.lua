LocationMessage = {}

function LocationMessage:new(output)
  obj = {output = output}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function LocationMessage:create_incoming_message(current_location)

local PlayerName = UnitName("player");
local eFaction, lFaction = UnitFactionGroup(PlayerName);
local tFact = "";

	if eFaction == "Horde" then
		tFact = "Alliance Scum"
	else
		tFact = "Hordies"
	end

	if Incoming_EnCount == "0" then
		if Inc_MsgMode == 0 then
			self.output:write( tFact .. " incoming at " .. current_location )
		else
			self.output:write( "INC " .. tFact .. " " .. current_location )
		end
  else
		if Inc_MsgMode == 0 then
			self.output:write( Incoming_EnCount .. " " .. tFact .. " incoming at " .. current_location )
		else
			self.output:write( Incoming_EnCount .. " " .. tFact .. " INC " .. current_location )
		end
  end
end

function LocationMessage:create_all_clear_message(current_location)
	if Inc_MsgMode == 0 then
		self.output:write( current_location .. " is all clear")
	else
		self.output:write( current_location .. " CLR")
	end
end

function LocationMessage:create_sendmore_message(current_location)
	if Inc_MsgMode == 0 then
		self.output:write( "Need more help at " .. current_location )
	else
		self.output:write( "HELP " .. current_location )
	end
	
end