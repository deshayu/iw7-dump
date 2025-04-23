local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HackControlTargetMarker( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 52 * _1080p, 0, 68 * _1080p )
	self.id = "HackControlTargetMarker"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TargetMarker = nil
	
	TargetMarker = LUI.UIImage.new()
	TargetMarker.id = "TargetMarker"
	TargetMarker:SetAlpha( 0.5, 0 )
	TargetMarker:setImage( RegisterMaterial( "hud_robot_hack_target_marker" ), 0 )
	TargetMarker:SetBlendMode( BLEND_MODE.addWithAlpha )
	TargetMarker:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -26, _1080p * 26, _1080p * -34, _1080p * 34 )
	self:addElement( TargetMarker )
	self.TargetMarker = TargetMarker
	
	return self
end

MenuBuilder.registerType( "HackControlTargetMarker", HackControlTargetMarker )
LockTable( _M )
