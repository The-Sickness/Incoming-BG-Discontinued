SLASH_INC1 = '/inc'

function SlashCmdList.INC(msg, editbox)
Incoming_UILoadedSW = 0;
Incoming_EnCount = "0";
Incoming_Advertise =0;

local Inc_Ver = "Incoming Version: " .. GetAddOnMetadata("Incoming","Version");
local zmessage = "";
    
	if msg == 't' then
		Incoming_Advertise = 1;
		zmessage = "I am using the MOD " .. Inc_Ver .. " for announcing incoming attacks in battlegrounds";
	end
	
	if msg == 'b' then
		 Inc_MsgMode = 1;
		 zmessage = "[Incoming] Now using brief messages";
	end
	
	if msg == 'f' then
		 Inc_MsgMode = 0;
		 zmessage = "[Incoming] Now using full messages";
	end
	
	if msg == 'u' then
		 Incoming_UILoadedSW=1;
	else
		 Incoming_UILoadedSW=0;
	end
	if msg == 'r' then
		 LocationMessageView:SetMovable(true);
		 LocationMessageView:EnableMouse(true);
		 LocationMessageView:RegisterForDrag("LeftButton");
		 LocationMessageView:ClearAllPoints();
		 LocationMessageView:SetPoint("CENTER", UIParent, "CENTER", 0, 0);
		 LocationMessageView:SetScale(1);
		 zmessage = "[Incoming] Interface has been reset"
	end
	if msg == 'l' then
		 LocationMessageView:SetMovable(false);
		 LocationMessageView:EnableMouse(false);
		 LocationMessageView:RegisterForDrag("LeftButton");
		 Inc_LocPoint , Inc_LocRelTo, Inc_LocRelPoint, Inc_LocXOfs, Inc_LocYOfs = LocationMessageView:GetPoint();
		 zmessage = "[Incoming] Interface is now locked and saved";
	end
	if msg == '?' then
		 ChatFrame1:AddMessage("---==== Incoming Commands ====--- ");
		 ChatFrame1:AddMessage("/inc    Load the Incoming interface");
		 ChatFrame1:AddMessage("/inc u  Unload the Incoming interface");		 
		 ChatFrame1:AddMessage("/inc r  Reset, unlock, and center the Incoming interface");
		 ChatFrame1:AddMessage("/inc ?  Help display will list all the slash commands");
		 ChatFrame1:AddMessage("/inc v  Version of Incoming");
		 ChatFrame1:AddMessage("/inc s# Scale the Incoming interface by # percent [ s50 would scale 50% ]");
		 ChatFrame1:AddMessage("/inc b  Brief messages [ short words in messages/announcements ] ");		 
		 ChatFrame1:AddMessage("/inc f  Full messages [ full words in messages/announcements ]");
		 ChatFrame1:AddMessage("/inc t  Tell those around you that you are using the Incoming BG mod");
		 
		 
		 
		 zmessage="";
	end
	if msg == 'v' then
		 zmessage=Inc_Ver;
	end

	if msg == 's' then
		 zmessage="A percentage number must follow the scale command (ex: s75 would scale to 75%)";
	end 
	
	if strlen(msg) > 1 then
	 	if strsub(msg,1,1) == 's' then
		   Inc_ScaleText = msg;
		   Inc_Scale = tonumber(strtrim(strsub(msg,2)));
		 
		   if Inc_Scale > 0 then
		 	   Inc_Scale = Inc_Scale / 100;
		  	 LocationMessageView:SetScale(Inc_Scale);
		   	 zmessage="Interface scaled to " .. Inc_Scale * 100 .. "%";
		 	 end 
		end
	end

	if Incoming_LoadedOnce == nil then
		Incoming_LoadedOnce = 1;
                

		if Inc_ScaleText ~= nil then

			if strsub(Inc_ScaleText,1,1) == 's' then
				--Inc_ScaleText = msg;
				Inc_Scale = tonumber(strtrim(strsub(Inc_ScaleText,2)));
		 
				if Inc_Scale > 0 then
					Inc_Scale = Inc_Scale / 100;
					LocationMessageView:SetScale(Inc_Scale);
					
				end 
			end
	    
			LocationMessageView:SetMovable(false);
			LocationMessageView:EnableMouse(false);
			LocationMessageView:RegisterForDrag("LeftButton");
			zmessage = "[Incoming] Previous settings have been loaded"
		 end
	end

	
	if Incoming_Advertise == 0 then
		ChatFrame1:AddMessage(zmessage);
	else
		SendChatMessage(zmessage,"SAY");
		Incoming_Advertise = 0;
	end
	
	local location_message_controller = LocationMessageControllerFactory:new():createObject();
    location_message_controller:on_zone_changed();
  
  end
  