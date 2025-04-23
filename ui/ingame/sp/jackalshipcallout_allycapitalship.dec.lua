local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalShipCallout_allyCapitalShip( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "JackalShipCallout_allyCapitalShip"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HorizontalLine1 = nil
	
	HorizontalLine1 = LUI.UIImage.new()
	HorizontalLine1.id = "HorizontalLine1"
	HorizontalLine1:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	HorizontalLine1:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	HorizontalLine1:SetUseAA( true )
	HorizontalLine1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 63, _1080p * 254, _1080p * -64, _1080p * -62 )
	self:addElement( HorizontalLine1 )
	self.HorizontalLine1 = HorizontalLine1
	
	local PilotName = nil
	
	PilotName = LUI.UIText.new()
	PilotName.id = "PilotName"
	PilotName:SetRGBFromTable( SWATCHES.jackal.notification, 0 )
	PilotName:SetAlpha( 0.8, 0 )
	PilotName:SetFontSize( 22 * _1080p )
	PilotName:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	PilotName:SetAlignment( LUI.Alignment.Left )
	PilotName:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 68, _1080p * 568, _1080p * -87, _1080p * -65 )
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
	Distance:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 63, _1080p * 378, _1080p * -62, _1080p * -44 )
	Distance:SubscribeToModelThroughElement( self, "distance", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.distance:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Distance:setText( f3_local0, 0 )
		end
	end )
	self:addElement( Distance )
	self.Distance = Distance
	
	local DiagnolLineCopy0 = nil
	
	DiagnolLineCopy0 = LUI.UIImage.new()
	DiagnolLineCopy0.id = "DiagnolLineCopy0"
	DiagnolLineCopy0:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	DiagnolLineCopy0:setImage( RegisterMaterial( "hud_diagnol_line" ), 0 )
	DiagnolLineCopy0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 32, _1080p * -32, 0 )
	self:addElement( DiagnolLineCopy0 )
	self.DiagnolLineCopy0 = DiagnolLineCopy0
	
	local DiagnolLineCopy1 = nil
	
	DiagnolLineCopy1 = LUI.UIImage.new()
	DiagnolLineCopy1.id = "DiagnolLineCopy1"
	DiagnolLineCopy1:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	DiagnolLineCopy1:setImage( RegisterMaterial( "hud_diagnol_line" ), 0 )
	DiagnolLineCopy1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 31, _1080p * 63, _1080p * -63, _1080p * -31 )
	self:addElement( DiagnolLineCopy1 )
	self.DiagnolLineCopy1 = DiagnolLineCopy1
	
	local node = nil
	
	node = LUI.UIImage.new()
	node.id = "node"
	node:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	node:SetAlpha( 0.5, 0 )
	node:SetScale( -0.25, 0 )
	node:setImage( RegisterMaterial( "hud_jackal_callout_node" ), 0 )
	node:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -3, _1080p * 13, _1080p * -3, _1080p * 13 )
	self:addElement( node )
	self.node = node
	
	return self
end

MenuBuilder.registerType( "JackalShipCallout_allyCapitalShip", JackalShipCallout_allyCapitalShip )
LockTable( _M )
