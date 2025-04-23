local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LocalPlayerZombieSplashDLC1Container( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "LocalPlayerZombieSplashDLC1Container"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LocalPlayerZombieSplashDLC1 = nil
	
	LocalPlayerZombieSplashDLC1 = MenuBuilder.BuildRegisteredType( "LocalPlayerZombieSplashDLC1", {
		controllerIndex = f1_local1
	} )
	LocalPlayerZombieSplashDLC1.id = "LocalPlayerZombieSplashDLC1"
	LocalPlayerZombieSplashDLC1:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 705, _1080p * -678, _1080p * -23, _1080p * 489 )
	self:addElement( LocalPlayerZombieSplashDLC1 )
	self.LocalPlayerZombieSplashDLC1 = LocalPlayerZombieSplashDLC1
	
	return self
end

MenuBuilder.registerType( "LocalPlayerZombieSplashDLC1Container", LocalPlayerZombieSplashDLC1Container )
LockTable( _M )
