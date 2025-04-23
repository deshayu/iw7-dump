local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.04 )
	f1_arg0:SetAlpha( 0 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "ui_inworld_terminal_ent_2" ) )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( 0, 0, 0 )
		f2_arg0:SetTagSpaceRoll( -17.5 )
		f2_arg0:SetTagSpaceYaw( 90 )
		f2_arg0:SetAlpha( 1 )
	end
	
	f1_arg0:registerOmnvarHandler( "ui_inworld_terminal_ent_2", f1_local0 )
	f1_local0( f1_arg0, {} )
	f1_arg0.HackTerminal2:SetDataSource( {
		animIndex1 = LUI.DataSourceFromOmnvar.new( "ui_inworld_terminal_hack2" )
	}, f1_arg1 )
end

function HackTerminalWrapper2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 960 * _1080p, 0, 540 * _1080p )
	self.id = "HackTerminalWrapper2"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local HackTerminal2 = nil
	
	HackTerminal2 = MenuBuilder.BuildRegisteredType( "HackTerminal", {
		controllerIndex = f3_local1
	} )
	HackTerminal2.id = "HackTerminal2"
	HackTerminal2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 960, 0, _1080p * 540 )
	self:addElement( HackTerminal2 )
	self.HackTerminal2 = HackTerminal2
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "HackTerminalWrapper2", HackTerminalWrapper2 )
LockTable( _M )
