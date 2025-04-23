local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LocalPlayerZombieSplashContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "LocalPlayerZombieSplashContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LocalPlayerZombieSplash = nil
	
	LocalPlayerZombieSplash = MenuBuilder.BuildRegisteredType( "LocalPlayerZombieSplash", {
		controllerIndex = f1_local1
	} )
	LocalPlayerZombieSplash.id = "LocalPlayerZombieSplash"
	LocalPlayerZombieSplash:SetScale( -0.1, 0 )
	LocalPlayerZombieSplash:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 695, _1080p * -713, _1080p * -75, _1080p * -643 )
	self:addElement( LocalPlayerZombieSplash )
	self.LocalPlayerZombieSplash = LocalPlayerZombieSplash
	
	return self
end

MenuBuilder.registerType( "LocalPlayerZombieSplashContainer", LocalPlayerZombieSplashContainer )
LockTable( _M )
