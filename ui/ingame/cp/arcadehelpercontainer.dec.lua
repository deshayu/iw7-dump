local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function arcadeHelperContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "arcadeHelperContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local arcadeHelper0 = nil
	
	arcadeHelper0 = MenuBuilder.BuildRegisteredType( "arcadeHelper", {
		controllerIndex = f1_local1
	} )
	arcadeHelper0.id = "arcadeHelper0"
	arcadeHelper0:SetYRotation( -16, 0 )
	arcadeHelper0:SetZRotation( -3, 0 )
	arcadeHelper0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 85.81, _1080p * 2005.81, _1080p * 14, _1080p * 1094 )
	self:addElement( arcadeHelper0 )
	self.arcadeHelper0 = arcadeHelper0
	
	return self
end

MenuBuilder.registerType( "arcadeHelperContainer", arcadeHelperContainer )
LockTable( _M )
