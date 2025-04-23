local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalStatusContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 60 * _1080p )
	self.id = "JackalStatusContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local JackalStatus = nil
	
	JackalStatus = MenuBuilder.BuildRegisteredType( "JackalStatus", {
		controllerIndex = f1_local1
	} )
	JackalStatus.id = "JackalStatus"
	JackalStatus:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 144, 0, _1080p * 60 )
	self:addElement( JackalStatus )
	self.JackalStatus = JackalStatus
	
	return self
end

MenuBuilder.registerType( "JackalStatusContainer", JackalStatusContainer )
LockTable( _M )
