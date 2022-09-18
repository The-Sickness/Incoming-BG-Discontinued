LocationMessageControllerFactory = {}

function LocationMessageControllerFactory:new()
  obj = {}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function LocationMessageControllerFactory:createObject()
  local valid_locations = 
  {
    "Stables", "Blacksmith", "Lumber Mill", "Gold Mine", "Mine", "Trollbane Hall", "Defiler's Den", "Farm",
    "Mage Tower", "Draenei Ruins", "Blood Elf Tower", "Fel Reaver Ruins", 
    "The Broken Temple", "Cauldron of Flames", "Central Bridge", "The Chilled Quagemire",
    "Eastern Bridge", "Flamewatch Tower", "The Forest of Shadows", "Glacial Falls", "The Steppe of Life",
    "The Sunken Ring", "Western Bridge", "Winter's Edge Tower", "Wintergrasp Fortress",
		"Lighthouse", "Waterworks", "Mines", "Docks", "Workshop", "Horde Keep", "Alliance Keep",
		"Hangar", "Refinery", "Quarry", "Wildhammer Stronghold", "Dragonmaw Stronghold",
		"Silverwing Hold", "Warsong Flag Room", "Baradin Base Camp", "Rustberg Village",
		"The Restless Front", "Wellson Shipyard", "Largo's Overlook", "Farson Hold",
		"Forgotten Hill", "Hellscream's Grasp","Stormpike Graveyard", "Irondeep Mine", "Dun Baldar",
	"Hall of the Stormpike", "Icewing Pass", "Stonehearth Outpost", "Iceblood Graveyard", 
	"Iceblood Garrison", "Tower Point", "Coldtooth Mine", "Dun Baldar Pass", "Icewing Bunker",
	"Field of Strife", "Stonehearth Graveyard", "Stonehearth Bunker", "Frost Dagger Pass", 
	"Snowfall Graveyard", "Winterax Hold", "Frostwolf Graveyard", "Frostwolf Village", 
	"Frostwolf Keep", "Hall of the Frostwolf","Temple of Kotmogu", "Deepwind Gorge", "Silvershard Mines", "Southshore vs. Tauren Mill", "Alterac Valley", "Ashran"
  };

  location_manager = LocationManager:new(valid_locations)
  output = Output:new()
  location_message = LocationMessage:new(output)
  location_message_controller = LocationMessageController:new(location_message, location_manager)
  
  return location_message_controller
end
