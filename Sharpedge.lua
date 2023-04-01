-- Incoming
-- Made by Sharpedge_Gaming
-- v1.2	 - 10.0.2

local myName, AddOn = ...
local version = GetAddOnMetadata(myName, "Version")

local Incoming = CreateFrame("Frame", "SharpedgeIncommingFrame", UIParent, BackdropTemplateMixin and "BackdropTemplate");
Incoming:SetBackdrop({
      bgFile="Interface\\DialogFrame\\UI-DialogBox-Background", 
      edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border", 
      tile=1, tileSize=32, edgeSize=32, 
      insets={left=11, right=12, top=12, bottom=11}
})

Incoming:Hide() 
Incoming:SetWidth(139)
Incoming:SetHeight(200)
Incoming:SetPoint("CENTER",UIParent)
Incoming:EnableMouse(true)
Incoming:RegisterForDrag("LeftButton")
Incoming:SetMovable(true)
Incoming:SetClampedToScreen(true)
Incoming:SetUserPlaced(true)
Incoming:RegisterForDrag("LeftButton")
Incoming:SetScript("OnDragStart", function(self) self:StartMoving() end)
Incoming:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
Incoming:SetFrameStrata("FULLSCREEN_DIALOG")

 if BackdropTemplateMixin then
    Mixin(LocationMessageView, BackdropTemplateMixin)
end
LocationMessageView:SetBackdrop({
      bgFile="Interface\\DialogFrame\\UI-DialogBox-Background", 
      edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border", 
      tile=1, tileSize=32, edgeSize=32, 
      insets={left=11, right=12, top=12, bottom=11}
})

if BackdropTemplateMixin then
    Mixin(LocationMessageView, BackdropTemplateMixin)
end


local button = CreateFrame("button","IncomingButton", Incoming, "UIPanelButtonTemplate")
button:SetHeight(24)
button:SetWidth(60)
button:SetPoint("BOTTOM", Incoming, "BOTTOM", 0, 10)
button:SetText("Close")
button:SetScript("OnClick", function(self)  self:GetParent():Hide() end)
LocationMessageView:SetParent(Incoming)
LocationMessageView:Show()
LocationMessageView:ClearAllPoints()
LocationMessageView:SetPoint("TOP")
LocationMessageView:SetMovable(false)
LocationMessageView:EnableMouse(false)
LocationMessageView:SetScript("OnDragStart", nil)
LocationMessageView:SetScript("OnDragStop", nil)
LocationMessageView.SetPoint = function() end
 
SLASH_SHARPEDGEINC1 = "/inc"
SlashCmdList.SHARPEDGEINC = function(msg, editbox)
    local m = strupper(strtrim(msg))
    if m == "" then
        Incoming:SetShown(not Incoming:IsShown())
        LocationMessageView:SetShown(Incoming:IsShown())
        SlashCmdList.INC(msg, editbox)
    
        print("If you find a bug or any issues please report them.")
    else
        SlashCmdList.INC(msg, editbox)
    end
    LocationMessageView:EnableMouse(false)
    LocationMessageView:SetMovable(false)
end

	if (BGMatch and event == "ZONE_CHANGED_NEW_AREA" and Incoming_UILoadedSW == 0)			--entered BG, so show
		or (not BGMatch and event == "ZONE_CHANGED_NEW_AREA" and Incoming_UILoadedSW == 1)	--non BG zone, so hide
		or event == nil then																--user command

		if event == "ZONE_CHANGED_NEW_AREA" then
			if BGMatch then
				Incoming_UILoadedSW = 0		--load
			else
				Incoming_UILoadedSW = 1		--unload
			end
		end
	 end	
		
		
	