local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CapOpsPersonnelDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 900 * _1080p, 0, 700 * _1080p )
	self.id = "CapOpsPersonnelDetails"
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
	MediaBox:SetVMin( 0.05, 0 )
	MediaBox:SetVMax( 0.9, 0 )
	MediaBox:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 900, 0, _1080p * 700 )
	self:addElement( MediaBox )
	self.MediaBox = MediaBox
	
	local MissionImageCopy0 = nil
	
	MissionImageCopy0 = LUI.UIImage.new()
	MissionImageCopy0.id = "MissionImageCopy0"
	MissionImageCopy0:SetRGBFromTable( SWATCHES.CAC.button, 0 )
	MissionImageCopy0:SetAlpha( 0.3, 0 )
	MissionImageCopy0:setImage( RegisterMaterial( "hud_captain_computer_unsa_bg" ), 0 )
	MissionImageCopy0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 114, _1080p * -118, _1080p * 3.59, _1080p * -3.59 )
	self:addElement( MissionImageCopy0 )
	self.MissionImageCopy0 = MissionImageCopy0
	
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
	
	local IDImage = nil
	
	IDImage = LUI.UIImage.new()
	IDImage.id = "IDImage"
	IDImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 78.75, _1080p * 814.25, _1080p * 69.02, _1080p * 322.98 )
	IDImage:SubscribeToModelThroughElement( self, "idImage", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.idImage:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			IDImage:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( IDImage )
	self.IDImage = IDImage
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( Engine.Localize( "CAPCOMP_PERSONNEL_DETAILS" ), 0 )
	Title:SetFontSize( 36 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Center )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 34, _1080p * -34, _1080p * 30, _1080p * 66 )
	self:addElement( Title )
	self.Title = Title
	
	local PersonnelImage = nil
	
	PersonnelImage = LUI.UIImage.new()
	PersonnelImage.id = "PersonnelImage"
	PersonnelImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 647.75, _1080p * 808.75, _1080p * 134.5, _1080p * 290.5 )
	PersonnelImage:SubscribeToModelThroughElement( self, "headImage", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.headImage:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			PersonnelImage:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( PersonnelImage )
	self.PersonnelImage = PersonnelImage
	
	local Success = nil
	
	Success = LUI.UIText.new()
	Success.id = "Success"
	Success:SetFontSize( 26 * _1080p )
	Success:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Success:SetAlignment( LUI.Alignment.Left )
	Success:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 303.63, _1080p * 630.63, _1080p * 220, _1080p * 246 )
	Success:SubscribeToModelThroughElement( self, "charName", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.charName:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			Success:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Success )
	self.Success = Success
	
	local SuccessLabel = nil
	
	SuccessLabel = LUI.UIText.new()
	SuccessLabel.id = "SuccessLabel"
	SuccessLabel:setText( Engine.Localize( "MENU_NAME1" ), 0 )
	SuccessLabel:SetFontSize( 26 * _1080p )
	SuccessLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SuccessLabel:SetAlignment( LUI.Alignment.Left )
	SuccessLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 303.63, _1080p * 630.63, _1080p * 194, _1080p * 220 )
	self:addElement( SuccessLabel )
	self.SuccessLabel = SuccessLabel
	
	local DetailsLabel = nil
	
	DetailsLabel = LUI.UIText.new()
	DetailsLabel.id = "DetailsLabel"
	DetailsLabel:setText( Engine.Localize( "CAPCOMP_REPORT_DETAILS" ), 0 )
	DetailsLabel:SetFontSize( 30 * _1080p )
	DetailsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DetailsLabel:SetAlignment( LUI.Alignment.Left )
	DetailsLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 34, _1080p * 855.5, _1080p * 350, _1080p * 380 )
	self:addElement( DetailsLabel )
	self.DetailsLabel = DetailsLabel
	
	local Details = nil
	
	Details = LUI.UIText.new()
	Details.id = "Details"
	Details:SetFontSize( 24 * _1080p )
	Details:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Details:SetAlignment( LUI.Alignment.Left )
	Details:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 78.75, _1080p * 855.5, _1080p * 396, _1080p * 420 )
	Details:SubscribeToModelThroughElement( self, "bioText", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.bioText:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			Details:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Details )
	self.Details = Details
	
	local Details1 = nil
	
	Details1 = LUI.UIText.new()
	Details1.id = "Details1"
	Details1:SetFontSize( 26 * _1080p )
	Details1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Details1:SetAlignment( LUI.Alignment.Left )
	Details1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 303.63, _1080p * 630.63, _1080p * 246, _1080p * 272 )
	Details1:SubscribeToModelThroughElement( self, "data1", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.data1:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			Details1:setText( f6_local0, 0 )
		end
	end )
	self:addElement( Details1 )
	self.Details1 = Details1
	
	local Details2 = nil
	
	Details2 = LUI.UIText.new()
	Details2.id = "Details2"
	Details2:SetFontSize( 26 * _1080p )
	Details2:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Details2:SetAlignment( LUI.Alignment.Left )
	Details2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 303.63, _1080p * 630.63, _1080p * 272, _1080p * 298 )
	Details2:SubscribeToModelThroughElement( self, "data2", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.data2:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			Details2:setText( f7_local0, 0 )
		end
	end )
	self:addElement( Details2 )
	self.Details2 = Details2
	
	local Break = nil
	
	Break = LUI.UIImage.new()
	Break.id = "Break"
	Break:SetRGBFromInt( 3947581, 0 )
	Break:SetUseAA( true )
	Break:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 30, _1080p * -30.5, _1080p * 337, _1080p * 342 )
	self:addElement( Break )
	self.Break = Break
	
	return self
end

MenuBuilder.registerType( "CapOpsPersonnelDetails", CapOpsPersonnelDetails )
LockTable( _M )
