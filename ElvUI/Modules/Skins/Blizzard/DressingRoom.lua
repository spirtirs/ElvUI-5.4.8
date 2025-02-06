local E, L, V, P, G = unpack(select(2, ...))
local S = E:GetModule("Skins")

local SetDressUpBackground = SetDressUpBackground

local function LoadSkin()
	if not E.private.skins.blizzard.enable or not E.private.skins.blizzard.dressingroom then return end

	local DressUpFrame = _G["DressUpFrame"]
	DressUpFrame:StripTextures()
	DressUpFrame:CreateBackdrop("Transparent")

	DressUpFramePortrait:Hide()
	DressUpFramePortraitFrame:Hide()
	DressUpFrameInset:Hide()

	S:HandleButton(DressUpFrameResetButton)
	S:HandleButton(DressUpFrameCancelButton)
	S:HandleButton(DressUpFrameOutfitDropDown.SaveButton)
	DressUpFrameOutfitDropDown.SaveButton:ClearAllPoints()
	DressUpFrameOutfitDropDown.SaveButton:SetPoint("RIGHT", DressUpFrameOutfitDropDown, 86, 4)
	S:HandleDropDownBox(DressUpFrameOutfitDropDown)
	DressUpFrameOutfitDropDown:SetSize(195, 34)

	S:HandleMaxMinFrame(MaximizeMinimizeFrame)
	S:HandleCloseButton(DressUpFrameCloseButton)
	DressUpFrameResetButton:Point("RIGHT", DressUpFrameCancelButton, "LEFT", -2, 0)

	-- Wardrobe edit frame
	local WardrobeOutfitFrame = _G["WardrobeOutfitFrame"]
	WardrobeOutfitFrame:StripTextures(true)
	WardrobeOutfitFrame:SetTemplate("Transparent")

	local WardrobeOutfitEditFrame = _G["WardrobeOutfitEditFrame"]
	WardrobeOutfitEditFrame:StripTextures(true)
	WardrobeOutfitEditFrame:SetTemplate("Transparent")
	WardrobeOutfitEditFrame.EditBox:StripTextures()
	S:HandleEditBox(WardrobeOutfitEditFrame.EditBox)
	WardrobeOutfitEditFrame.EditBox.backdrop:Point("TOPLEFT", WardrobeOutfitEditFrame.EditBox, "TOPLEFT", -5, -5)
	WardrobeOutfitEditFrame.EditBox.backdrop:Point("BOTTOMRIGHT", WardrobeOutfitEditFrame.EditBox, "BOTTOMRIGHT", 0, 5)
	S:HandleButton(WardrobeOutfitEditFrame.AcceptButton)
	S:HandleButton(WardrobeOutfitEditFrame.CancelButton)
	S:HandleButton(WardrobeOutfitEditFrame.DeleteButton)
end

S:AddCallback("DressingRoom", LoadSkin)