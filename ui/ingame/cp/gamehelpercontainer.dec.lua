local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function gamehelperContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "gamehelperContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local gameHelper = nil
	
	gameHelper = MenuBuilder.BuildRegisteredType( "gameHelper", {
		controllerIndex = f1_local1
	} )
	gameHelper.id = "gameHelper"
	gameHelper:SetYRotation( -16, 0 )
	gameHelper:SetZRotation( -3, 0 )
	gameHelper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 1980, _1080p * -17, _1080p * 1063 )
	self:addElement( gameHelper )
	self.gameHelper = gameHelper
	
	return self
end

MenuBuilder.registerType( "gamehelperContainer", gamehelperContainer )
LockTable( _M )
