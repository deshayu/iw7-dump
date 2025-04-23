local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LocalPlayerZombieSplashDLC3Container( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "LocalPlayerZombieSplashDLC3Container"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LocalPlayerZombieSplashDLC3 = nil
	
	LocalPlayerZombieSplashDLC3 = MenuBuilder.BuildRegisteredType( "LocalPlayerZombieSplashDLC3", {
		controllerIndex = f1_local1
	} )
	LocalPlayerZombieSplashDLC3.id = "LocalPlayerZombieSplashDLC3"
	LocalPlayerZombieSplashDLC3:SetScale( 0.25, 0 )
	LocalPlayerZombieSplashDLC3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 704, _1080p * 1216, _1080p * -15, _1080p * 497 )
	self:addElement( LocalPlayerZombieSplashDLC3 )
	self.LocalPlayerZombieSplashDLC3 = LocalPlayerZombieSplashDLC3
	
	return self
end

MenuBuilder.registerType( "LocalPlayerZombieSplashDLC3Container", LocalPlayerZombieSplashDLC3Container )
LockTable( _M )
