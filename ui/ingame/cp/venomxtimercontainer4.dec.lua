local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.5 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "zm_ui_venomx_timer_ent_3" ) )
		f2_arg0:SetEntityTag( "tag_origin" )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( 16, -5, 0 )
		f2_arg0:SetTagSpaceYaw( 0 )
		f2_arg0:SetTagSpaceRoll( 270 )
	end
	
	f1_arg0:registerOmnvarHandler( "zm_ui_venomx_timer_ent_3", f1_local0 )
	f1_local0( f1_arg0, {} )
end

function venomxTimerContainer4( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 491 * _1080p, 0, 189 * _1080p )
	self.id = "venomxTimerContainer4"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local venomxTimer0 = nil
	
	venomxTimer0 = MenuBuilder.BuildRegisteredType( "venomxTimer", {
		controllerIndex = f3_local1
	} )
	venomxTimer0.id = "venomxTimer0"
	venomxTimer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -16.55, _1080p * 474.45, 0, _1080p * 189 )
	self:addElement( venomxTimer0 )
	self.venomxTimer0 = venomxTimer0
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "venomxTimerContainer4", venomxTimerContainer4 )
LockTable( _M )
