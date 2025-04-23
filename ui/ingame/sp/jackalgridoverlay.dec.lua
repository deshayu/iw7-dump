local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0 )
	assert( f1_arg0.PulseArray )
	f1_arg0.PulseArray:StartOutwardsPulse()
	f1_arg0:addEventHandler( "hud_anim_shutdown_off", function ( f2_arg0, f2_arg1 )
		f2_arg0.PulseArray:StartInwardsPulse()
	end )
end

function JackalGridOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "JackalGridOverlay"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local PulseArray = nil
	
	PulseArray = MenuBuilder.BuildRegisteredType( "PulseArray", {
		controllerIndex = f3_local1
	} )
	PulseArray.id = "PulseArray"
	self:addElement( PulseArray )
	self.PulseArray = PulseArray
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalGridOverlay", JackalGridOverlay )
LockTable( _M )
