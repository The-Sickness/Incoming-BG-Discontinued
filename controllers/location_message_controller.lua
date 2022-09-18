LocationMessageController = {}

function LocationMessageController:new(location_message, location_manager)
  obj = {location_message = location_message, location_manager = location_manager}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function LocationMessageController:on_incoming_button_pressed()
  if (self.location_manager:player_in_valid_zone()) then
		 Incoming_EnCount="0";
    self.location_message:create_incoming_message(self.location_manager:current_location())
  end
end

function LocationMessageController:on_incoming_button1_pressed()
  if (self.location_manager:player_in_valid_zone()) then
		 Incoming_EnCount="1";
    self.location_message:create_incoming_message(self.location_manager:current_location())
  end
end

function LocationMessageController:on_incoming_button2_pressed()
  if (self.location_manager:player_in_valid_zone()) then
		 Incoming_EnCount="2";
    self.location_message:create_incoming_message(self.location_manager:current_location())
  end
end

function LocationMessageController:on_incoming_button3_pressed()
  if (self.location_manager:player_in_valid_zone()) then
		 Incoming_EnCount="3";
    self.location_message:create_incoming_message(self.location_manager:current_location())
  end
end

function LocationMessageController:on_incoming_button4_pressed()
  if (self.location_manager:player_in_valid_zone()) then
		 Incoming_EnCount="4";
    self.location_message:create_incoming_message(self.location_manager:current_location())
  end
end

function LocationMessageController:on_incoming_button5_pressed()
  if (self.location_manager:player_in_valid_zone()) then
		 Incoming_EnCount="ZERGing!!";
    self.location_message:create_incoming_message(self.location_manager:current_location())
  end
end


function LocationMessageController:on_all_clear_button_pressed()
  if (self.location_manager:player_in_valid_zone()) then
    self.location_message:create_all_clear_message(self.location_manager:current_location())
  end
end

function LocationMessageController:on_sendmore_button_pressed()
  if (self.location_manager:player_in_valid_zone()) then
    self.location_message:create_sendmore_message(self.location_manager:current_location())
  end
end

function LocationMessageController:on_zone_changed(event)
	
	local BGMatch = false
	
	if event == "ZONE_CHANGED_NEW_AREA" then
		local Valid_Battlegrounds = {
			"Arathi Basin",
			"Eye of the Storm",
			"Isle of Conquest",
			"The Battle for Gilneas",
			"Tol Barad",
			"Twin Peaks",
			"Warsong Gulch",
			"Wintergrasp",
			"Alterac Valley",
                "Deepwind Gorge",
                "Silvershard Mines",
                "Temple of Kotmogu",
                "Southshore vs. Tauren Mill"

		}

		for k,v in pairs(Valid_Battlegrounds) do
			if Valid_Battlegrounds[k] == GetZoneText() then
				BGMatch = true
			end
		end
	end
end

