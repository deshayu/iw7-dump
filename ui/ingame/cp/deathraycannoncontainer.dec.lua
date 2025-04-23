local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DeathRayCannonContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "DeathRayCannonContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local DeathRayCannonProgressBar = nil
	
	DeathRayCannonProgressBar = MenuBuilder.BuildRegisteredType( "DeathRayCannonProgressBar", {
		controllerIndex = f1_local1
	} )
	DeathRayCannonProgressBar.id = "DeathRayCannonProgressBar"
	DeathRayCannonProgressBar:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -150, _1080p * 150, _1080p * -285, _1080p * -235 )
	self:addElement( DeathRayCannonProgressBar )
	self.DeathRayCannonProgressBar = DeathRayCannonProgressBar
	
	return self
end

MenuBuilder.registerType( "DeathRayCannonContainer", DeathRayCannonContainer )
LockTable( _M )
