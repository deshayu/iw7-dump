local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function bfphelperContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "bfphelperContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local bfpHelper = nil
	
	bfpHelper = MenuBuilder.BuildRegisteredType( "bfpHelper", {
		controllerIndex = f1_local1
	} )
	bfpHelper.id = "bfpHelper"
	bfpHelper:SetYRotation( -16, 0 )
	bfpHelper:SetZRotation( -3, 0 )
	bfpHelper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 1980, _1080p * -17, _1080p * 1063 )
	self:addElement( bfpHelper )
	self.bfpHelper = bfpHelper
	
	return self
end

MenuBuilder.registerType( "bfphelperContainer", bfphelperContainer )
LockTable( _M )
