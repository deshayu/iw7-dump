local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AddScreens( f1_arg0 )
	RemoveScreens( f1_arg0 )
	f1_arg0:addElement( MenuBuilder.BuildRegisteredType( "OlympusMonsRadarTargeting" ) )
end

function RemoveScreens( f2_arg0 )
	f2_arg0:closeChildren()
end

function OlympusMonsCaptainScreen( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "OlympusMonsCaptainScreen"
	assert( controller.controllerIndex )
	self:SubscribeToModel( DataSources.inGame.SP.heistSpace.olympusMonsCaptainScreen:GetModel( controller.controllerIndex ), function ( f4_arg0 )
		local f4_local0 = DataModel.GetModelValue( f4_arg0 )
		local f4_local1
		if f4_local0 <= 0 or f4_local0 == Engine.GetEntityNumNoneValue() then
			f4_local1 = false
		else
			f4_local1 = true
		end
		if f4_local1 then
			AddScreens( self )
		else
			RemoveScreens( self )
		end
	end )
	return self
end

MenuBuilder.registerType( "OlympusMonsCaptainScreen", OlympusMonsCaptainScreen )
LockTable( _M )
