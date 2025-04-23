local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SPARCalloutFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 150 * _1080p, 0, 50 * _1080p )
	self.id = "SPARCalloutFrame"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.callout.calloutBackground, 0 )
	Background:SetAlpha( 0.3, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local VertLine = nil
	
	VertLine = LUI.UIImage.new()
	VertLine.id = "VertLine"
	VertLine:SetRGBFromTable( SWATCHES.callout.calloutFrame, 0 )
	VertLine:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 1, _1080p * -5, _1080p * 5 )
	self:addElement( VertLine )
	self.VertLine = VertLine
	
	local Crosses = nil
	
	Crosses = MenuBuilder.BuildRegisteredType( "GenericFrameCrosses", {
		controllerIndex = f1_local1
	} )
	Crosses.id = "Crosses"
	Crosses:SetRGBFromTable( SWATCHES.callout.calloutFrame, 0 )
	Crosses:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Crosses )
	self.Crosses = Crosses
	
	local BottomTics = nil
	
	BottomTics = LUI.UIImage.new()
	BottomTics.id = "BottomTics"
	BottomTics:SetRGBFromTable( SWATCHES.callout.calloutFrame, 0 )
	BottomTics:setImage( RegisterMaterial( "hud_message_tics" ), 0 )
	BottomTics:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 4, _1080p * -4, _1080p * -2, _1080p * 2 )
	self:addElement( BottomTics )
	self.BottomTics = BottomTics
	
	local TopTics = nil
	
	TopTics = LUI.UIImage.new()
	TopTics.id = "TopTics"
	TopTics:SetRGBFromTable( SWATCHES.callout.calloutFrame, 0 )
	TopTics:setImage( RegisterMaterial( "hud_message_tics" ), 0 )
	TopTics:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 4, _1080p * -4, _1080p * -2, _1080p * 2 )
	self:addElement( TopTics )
	self.TopTics = TopTics
	
	return self
end

MenuBuilder.registerType( "SPARCalloutFrame", SPARCalloutFrame )
LockTable( _M )
