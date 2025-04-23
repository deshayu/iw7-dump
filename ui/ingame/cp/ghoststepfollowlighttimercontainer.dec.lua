local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ghostStepFollowLightTimerContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ghostStepFollowLightTimerContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ghostStepFollowLightTimer = nil
	
	ghostStepFollowLightTimer = MenuBuilder.BuildRegisteredType( "ghostStepFollowLightTimer", {
		controllerIndex = f1_local1
	} )
	ghostStepFollowLightTimer.id = "ghostStepFollowLightTimer"
	ghostStepFollowLightTimer:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -150, _1080p * 150, _1080p * -225, _1080p * -175 )
	self:addElement( ghostStepFollowLightTimer )
	self.ghostStepFollowLightTimer = ghostStepFollowLightTimer
	
	return self
end

MenuBuilder.registerType( "ghostStepFollowLightTimerContainer", ghostStepFollowLightTimerContainer )
LockTable( _M )
