local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalShipCallout( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 50 * _1080p )
	self.id = "JackalShipCallout"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PilotName = nil
	
	PilotName = LUI.UIText.new()
	PilotName.id = "PilotName"
	PilotName:SetFontSize( 22 * _1080p )
	PilotName:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	PilotName:SetAlignment( LUI.Alignment.Left )
	PilotName:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 35, 0, _1080p * -54, _1080p * -32 )
	PilotName:SubscribeToModelThroughElement( self, "color", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.color:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			PilotName:SetRGBFromInt( f2_local0, 0 )
		end
	end )
	PilotName:SubscribeToModelThroughElement( self, "name", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.name:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			PilotName:setText( LocalizeString( f3_local0 ), 0 )
		end
	end )
	self:addElement( PilotName )
	self.PilotName = PilotName
	
	local Distance = nil
	
	Distance = LUI.UIText.new()
	Distance.id = "Distance"
	Distance:SetFontSize( 18 * _1080p )
	Distance:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Distance:SetAlignment( LUI.Alignment.Left )
	Distance:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 35, 0, _1080p * -31.5, _1080p * -13.5 )
	Distance:SubscribeToModelThroughElement( self, "color", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.color:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			Distance:SetRGBFromInt( f4_local0, 0 )
		end
	end )
	Distance:SubscribeToModelThroughElement( self, "distance", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.distance:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			Distance:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Distance )
	self.Distance = Distance
	
	local HorizontalLine = nil
	
	HorizontalLine = LUI.UIImage.new()
	HorizontalLine.id = "HorizontalLine"
	HorizontalLine:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	HorizontalLine:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 32, 0, _1080p * -32, _1080p * -31 )
	self:addElement( HorizontalLine )
	self.HorizontalLine = HorizontalLine
	
	local DiagnolLine = nil
	
	DiagnolLine = LUI.UIImage.new()
	DiagnolLine.id = "DiagnolLine"
	DiagnolLine:setImage( RegisterMaterial( "hud_diagnol_line" ), 0 )
	DiagnolLine:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 32, _1080p * -32, 0 )
	self:addElement( DiagnolLine )
	self.DiagnolLine = DiagnolLine
	
	return self
end

MenuBuilder.registerType( "JackalShipCallout", JackalShipCallout )
LockTable( _M )
