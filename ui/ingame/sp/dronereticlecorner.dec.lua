local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DroneReticleCorner( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 22 * _1080p, 0, 22 * _1080p )
	self.id = "DroneReticleCorner"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image0Copy2 = nil
	
	Image0Copy2 = LUI.UIImage.new()
	Image0Copy2.id = "Image0Copy2"
	Image0Copy2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6, _1080p * 3, _1080p * -3, _1080p * -5 )
	self:addElement( Image0Copy2 )
	self.Image0Copy2 = Image0Copy2
	
	local Image0Copy12 = nil
	
	Image0Copy12 = LUI.UIImage.new()
	Image0Copy12.id = "Image0Copy12"
	Image0Copy12:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 3, _1080p * 5, _1080p * 6, _1080p * -5 )
	self:addElement( Image0Copy12 )
	self.Image0Copy12 = Image0Copy12
	
	return self
end

MenuBuilder.registerType( "DroneReticleCorner", DroneReticleCorner )
LockTable( _M )
