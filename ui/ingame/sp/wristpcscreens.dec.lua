local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AddScreens( f1_arg0, f1_arg1 )
	RemoveScreens( f1_arg0 )
	local f1_local0 = nil
	if f1_arg1 == HudUtility.WristPCScreens.Shield then
		f1_local0 = MenuBuilder.BuildRegisteredType( "WristPCShieldMeterScreen" )
	elseif f1_arg1 == HudUtility.WristPCScreens.Jackal then
		f1_local0 = MenuBuilder.BuildRegisteredType( "WristPcJackalScreen" )
	elseif f1_arg1 == HudUtility.WristPCScreens.Hacking then
		f1_local0 = MenuBuilder.BuildRegisteredType( "WristPCHackingScreen" )
	elseif f1_arg1 == HudUtility.WristPCScreens.Standby then
		f1_local0 = MenuBuilder.BuildRegisteredType( "WristPcDefaultScreen" )
	elseif f1_arg1 == HudUtility.WristPCScreens.TerminalHack then
		f1_local0 = MenuBuilder.BuildRegisteredType( "WristPCTerminalHack" )
	end
	if f1_local0 then
		f1_arg0:addElement( f1_local0 )
	end
end

function RemoveScreens( f2_arg0 )
	f2_arg0:closeChildren()
end

function WristPCScreens( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "WristPCScreens"
	assert( controller.controllerIndex )
	self:SubscribeToModel( DataSources.inGame.player.wristPC:GetModel( controller.controllerIndex ), function ( f4_arg0 )
		local f4_local0 = DataModel.GetModelValue( f4_arg0 )
		if f4_local0 > 0 then
			AddScreens( self, f4_local0 )
		else
			RemoveScreens( self )
		end
	end )
	return self
end

MenuBuilder.registerType( "WristPCScreens", WristPCScreens )
LockTable( _M )
