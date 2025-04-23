local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OffscreenIncomingMissileIndicator( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "OffscreenIncomingMissileIndicator"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Indicator = nil
	
	Indicator = LUI.UIImage.new()
	Indicator.id = "Indicator"
	Indicator:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_sm" ), 0 )
	Indicator:SetBlendMode( BLEND_MODE.addWithAlpha )
	Indicator:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 24, _1080p * -5, _1080p * 35 )
	self:addElement( Indicator )
	self.Indicator = Indicator
	
	return self
end

MenuBuilder.registerType( "OffscreenIncomingMissileIndicator", OffscreenIncomingMissileIndicator )
LockTable( _M )
