local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DropshipCenterReticleTriangle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 630 * _1080p, 0, 630 * _1080p )
	self.id = "DropshipCenterReticleTriangle"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Triangle = nil
	
	Triangle = LUI.UIImage.new()
	Triangle.id = "Triangle"
	Triangle:setImage( RegisterMaterial( "dropship_hud_triangle_parts_1" ), 0 )
	Triangle:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, 0, _1080p * 64 )
	self:addElement( Triangle )
	self.Triangle = Triangle
	
	return self
end

MenuBuilder.registerType( "DropshipCenterReticleTriangle", DropshipCenterReticleTriangle )
LockTable( _M )
