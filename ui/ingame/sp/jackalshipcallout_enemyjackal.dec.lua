local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalShipCallout_enemyJackal( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "JackalShipCallout_enemyJackal"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HorizontalLine = nil
	
	HorizontalLine = LUI.UIImage.new()
	HorizontalLine.id = "HorizontalLine"
	HorizontalLine:SetRGBFromTable( SWATCHES.jackal.calloutLineEnemy, 0 )
	HorizontalLine:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	HorizontalLine:SetUseAA( true )
	HorizontalLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 50, _1080p * 189, _1080p * -49, _1080p * -47 )
	self:addElement( HorizontalLine )
	self.HorizontalLine = HorizontalLine
	
	local DiagnolLine = nil
	
	DiagnolLine = LUI.UIImage.new()
	DiagnolLine.id = "DiagnolLine"
	DiagnolLine:SetRGBFromTable( SWATCHES.jackal.calloutLineEnemy, 0 )
	DiagnolLine:setImage( RegisterMaterial( "hud_diagnol_line" ), 0 )
	DiagnolLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 19, _1080p * 51, _1080p * -49, _1080p * -17 )
	self:addElement( DiagnolLine )
	self.DiagnolLine = DiagnolLine
	
	local PilotName = nil
	
	PilotName = LUI.UIText.new()
	PilotName.id = "PilotName"
	PilotName:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	PilotName:SetFontSize( 22 * _1080p )
	PilotName:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	PilotName:SetAlignment( LUI.Alignment.Left )
	PilotName:SetOptOutRightToLeftAlignmentFlip( true )
	PilotName:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 54, _1080p * 554, _1080p * -71, _1080p * -49 )
	PilotName:SubscribeToModelThroughElement( self, "name", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.name:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			PilotName:setText( LocalizeString( f2_local0 ), 0 )
		end
	end )
	self:addElement( PilotName )
	self.PilotName = PilotName
	
	local Distance = nil
	
	Distance = LUI.UIText.new()
	Distance.id = "Distance"
	Distance:SetRGBFromTable( SWATCHES.jackal.normal, 0 )
	Distance:SetAlpha( 0.8, 0 )
	Distance:SetFontSize( 18 * _1080p )
	Distance:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Distance:SetAlignment( LUI.Alignment.Left )
	Distance:SetOptOutRightToLeftAlignmentFlip( true )
	Distance:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 54, _1080p * 189, _1080p * -47, _1080p * -29 )
	Distance:SubscribeToModelThroughElement( self, "distance", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.distance:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Distance:setText( f3_local0, 0 )
		end
	end )
	self:addElement( Distance )
	self.Distance = Distance
	
	return self
end

MenuBuilder.registerType( "JackalShipCallout_enemyJackal", JackalShipCallout_enemyJackal )
LockTable( _M )
