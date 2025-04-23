local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DeathDetailsHitIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 16 * _1080p )
	self.id = "DeathDetailsHitIcon"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:setImage( RegisterMaterial( "hud_killcam_diamond" ), 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	return self
end

MenuBuilder.registerType( "DeathDetailsHitIcon", DeathDetailsHitIcon )
LockTable( _M )
