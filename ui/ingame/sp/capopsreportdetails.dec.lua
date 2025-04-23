local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CapOpsReportDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 900 * _1080p, 0, 700 * _1080p )
	self.id = "CapOpsReportDetails"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local MediaBox = nil
	
	MediaBox = LUI.UIImage.new()
	MediaBox.id = "MediaBox"
	MediaBox:SetAlpha( 0.85, 0 )
	MediaBox:setImage( RegisterMaterial( "hud_captain_computer_media_box" ), 0 )
	MediaBox:SetUMin( 0.01, 0 )
	MediaBox:SetUMax( 0.99, 0 )
	MediaBox:SetVMin( 0.05, 0 )
	MediaBox:SetVMax( 0.98, 0 )
	MediaBox:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 900, 0, _1080p * 554.34 )
	self:addElement( MediaBox )
	self.MediaBox = MediaBox
	
	local BottomCell = nil
	
	BottomCell = LUI.UIImage.new()
	BottomCell.id = "BottomCell"
	BottomCell:SetRGBFromInt( 2171170, 0 )
	BottomCell:SetAlpha( 0.85, 0 )
	BottomCell:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 900, _1080p * 554.34, _1080p * 700 )
	self:addElement( BottomCell )
	self.BottomCell = BottomCell
	
	local MissionImage = nil
	
	MissionImage = LUI.UIImage.new()
	MissionImage.id = "MissionImage"
	MissionImage:SetRGBFromInt( 12566463, 0 )
	MissionImage:SetAlpha( 0.7, 0 )
	MissionImage:SetUMin( 0.04, 0 )
	MissionImage:SetUMax( 0.86, 0 )
	MissionImage:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 32, _1080p * -34, _1080p * 62.68, _1080p * -235 )
	MissionImage:SubscribeToModelThroughElement( self, "repImage", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.repImage:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			MissionImage:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( MissionImage )
	self.MissionImage = MissionImage
	
	local MissionImageCopy0 = nil
	
	MissionImageCopy0 = LUI.UIImage.new()
	MissionImageCopy0.id = "MissionImageCopy0"
	MissionImageCopy0:SetRGBFromTable( SWATCHES.CAC.button, 0 )
	MissionImageCopy0:SetAlpha( 0, 0 )
	MissionImageCopy0:setImage( RegisterMaterial( "hud_captain_computer_unsa_bg" ), 0 )
	MissionImageCopy0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 114, _1080p * -118, _1080p * 3.59, _1080p * -3.59 )
	self:addElement( MissionImageCopy0 )
	self.MissionImageCopy0 = MissionImageCopy0
	
	local MissionNameLabel = nil
	
	MissionNameLabel = LUI.UIText.new()
	MissionNameLabel.id = "MissionNameLabel"
	MissionNameLabel:setText( ToUpperCase( Engine.Localize( "MENU_SP_MISSION_PRE" ) ), 0 )
	MissionNameLabel:SetFontSize( 32 * _1080p )
	MissionNameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionNameLabel:SetAlignment( LUI.Alignment.Left )
	MissionNameLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 41, _1080p * 861, _1080p * 486.34, _1080p * 518.34 )
	self:addElement( MissionNameLabel )
	self.MissionNameLabel = MissionNameLabel
	
	local MissionName = nil
	
	MissionName = LUI.UIText.new()
	MissionName.id = "MissionName"
	MissionName:SetFontSize( 32 * _1080p )
	MissionName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionName:SetAlignment( LUI.Alignment.Left )
	MissionName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 41, _1080p * 860, _1080p * 520.34, _1080p * 552.34 )
	MissionName:SubscribeToModelThroughElement( self, "title", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.title:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			MissionName:setText( ToUpperCase( f3_local0 ), 0 )
		end
	end )
	self:addElement( MissionName )
	self.MissionName = MissionName
	
	local DetailsLabel = nil
	
	DetailsLabel = LUI.UIText.new()
	DetailsLabel.id = "DetailsLabel"
	DetailsLabel:SetAlpha( 0, 0 )
	DetailsLabel:setText( Engine.Localize( "CAPCOMP_REPORT_DETAILS" ), 0 )
	DetailsLabel:SetFontSize( 30 * _1080p )
	DetailsLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DetailsLabel:SetAlignment( LUI.Alignment.Left )
	DetailsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 39, _1080p * 265, _1080p * 164.68, _1080p * 194.68 )
	self:addElement( DetailsLabel )
	self.DetailsLabel = DetailsLabel
	
	local Details = nil
	
	Details = LUI.UIText.new()
	Details.id = "Details"
	Details:SetFontSize( 22 * _1080p )
	Details:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Details:SetAlignment( LUI.Alignment.Left )
	Details:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 41, _1080p * 859, _1080p * 557.34, _1080p * 579.34 )
	Details:SubscribeToModelThroughElement( self, "details", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.details:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			Details:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Details )
	self.Details = Details
	
	local ButtonHolderCopy2 = nil
	
	ButtonHolderCopy2 = LUI.UIImage.new()
	ButtonHolderCopy2.id = "ButtonHolderCopy2"
	ButtonHolderCopy2:SetRGBFromInt( 3947581, 0 )
	ButtonHolderCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 900, 0, _1080p * 30 )
	self:addElement( ButtonHolderCopy2 )
	self.ButtonHolderCopy2 = ButtonHolderCopy2
	
	local ButtonHolderCopy3 = nil
	
	ButtonHolderCopy3 = LUI.UIImage.new()
	ButtonHolderCopy3.id = "ButtonHolderCopy3"
	ButtonHolderCopy3:SetRGBFromInt( 5526870, 0 )
	ButtonHolderCopy3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 17, 0, _1080p * 30 )
	self:addElement( ButtonHolderCopy3 )
	self.ButtonHolderCopy3 = ButtonHolderCopy3
	
	return self
end

MenuBuilder.registerType( "CapOpsReportDetails", CapOpsReportDetails )
LockTable( _M )
