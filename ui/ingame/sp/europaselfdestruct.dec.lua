local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EuropaSelfDestruct( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1440 * _1080p, 0, 810 * _1080p )
	self.id = "EuropaSelfDestruct"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BinkArea = nil
	
	BinkArea = LUI.UIImage.new()
	BinkArea.id = "BinkArea"
	BinkArea:setImage( RegisterMaterial( "cinematic" ), 0 )
	BinkArea:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1440, 0, _1080p * 810 )
	self:addElement( BinkArea )
	self.BinkArea = BinkArea
	
	return self
end

MenuBuilder.registerType( "EuropaSelfDestruct", EuropaSelfDestruct )
LockTable( _M )
