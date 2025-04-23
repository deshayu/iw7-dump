local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LocalPlayerZombieSplashDLC2Container( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "LocalPlayerZombieSplashDLC2Container"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LocalPlayerZombieSplashDLC2 = nil
	
	LocalPlayerZombieSplashDLC2 = MenuBuilder.BuildRegisteredType( "LocalPlayerZombieSplashDLC2", {
		controllerIndex = f1_local1
	} )
	LocalPlayerZombieSplashDLC2.id = "LocalPlayerZombieSplashDLC2"
	LocalPlayerZombieSplashDLC2:SetScale( 0.25, 0 )
	LocalPlayerZombieSplashDLC2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 704, _1080p * 1216, _1080p * -15, _1080p * 497 )
	self:addElement( LocalPlayerZombieSplashDLC2 )
	self.LocalPlayerZombieSplashDLC2 = LocalPlayerZombieSplashDLC2
	
	return self
end

MenuBuilder.registerType( "LocalPlayerZombieSplashDLC2Container", LocalPlayerZombieSplashDLC2Container )
LockTable( _M )
