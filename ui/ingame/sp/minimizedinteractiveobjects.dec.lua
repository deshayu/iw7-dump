local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MinimizedInteractiveObjects( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "MinimizedInteractiveObjects"
	self:SetupMinimizedInteractiveObjects( 12 )
	self:setImage( RegisterMaterial( "hud_outlined_dot" ) )
	return self
end

MenuBuilder.registerType( "MinimizedInteractiveObjects", MinimizedInteractiveObjects )
LockTable( _M )
