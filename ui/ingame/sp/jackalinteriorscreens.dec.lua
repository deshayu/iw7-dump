local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AddScreens( f1_arg0, f1_arg1 )
	RemoveScreens( f1_arg0 )
	if f1_arg0.jackalSubscriptions then
		for f1_local3, f1_local4 in ipairs( f1_arg0.jackalSubscriptions ) do
			f1_arg0:UnsubscribeFromModel( f1_local4 )
		end
	end
	f1_arg0.jackalSubscriptions = nil
	local f1_local0 = MenuBuilder.BuildRegisteredType( "JackalInteriorScreenShipInfo" )
	local f1_local1 = MenuBuilder.BuildRegisteredType( "JackalInteriorScreenMain" )
	local f1_local2 = MenuBuilder.BuildRegisteredType( "JackalInteriorScreenLaptop" )
	local f1_local3 = MenuBuilder.BuildRegisteredType( "JackalInteriorHandScanner" )
	local f1_local4 = MenuBuilder.BuildRegisteredType( "JackalInteriorGpsUi" )
	local f1_local5 = MenuBuilder.BuildRegisteredType( "JackalInteriorWarningUi" )
	f1_arg0.lastAnimationPlayed = ""
	local f1_local6 = function ()
		local f2_local0 = DataSources.inGame.jackal.displayCockpitIncomingMissile:GetValue( f1_arg1 )
		local f2_local1 = DataSources.inGame.jackal.displayCockpitWarnings:GetValue( f1_arg1 )
		if f2_local0 ~= nil and f2_local0 == false and f2_local1 ~= nil and f2_local1 == false and f1_arg0.lastAnimationPlayed ~= "Default" then
			ACTIONS.AnimateSequence( f1_local2.DisplayOverlayLaptop, "Default" )
			ACTIONS.AnimateSequence( f1_local1.DisplayOverlay, "Default" )
			ACTIONS.AnimateSequence( f1_local0.DisplayOverlay, "Default" )
			ACTIONS.AnimateSequence( f1_local4.DisplayOverlay, "Default" )
			ACTIONS.AnimateSequence( f1_local5.DisplayOverlay, "Default" )
			f1_arg0.lastAnimationPlayed = "Default"
		end
		if f2_local0 ~= nil and f2_local0 == true then
			if f1_arg0.lastAnimationPlayed ~= "Incoming" then
				ACTIONS.AnimateSequence( f1_local2.DisplayOverlayLaptop, "Incoming" )
				ACTIONS.AnimateSequence( f1_local1.DisplayOverlay, "Incoming" )
				ACTIONS.AnimateSequence( f1_local0.DisplayOverlay, "Incoming" )
				ACTIONS.AnimateSequence( f1_local4.DisplayOverlay, "Incoming" )
				ACTIONS.AnimateSequence( f1_local5.DisplayOverlay, "Incoming" )
				f1_arg0.lastAnimationPlayed = "Incoming"
			end
		elseif f2_local1 ~= nil and f2_local1 == true and f1_arg0.lastAnimationPlayed ~= "Warning" then
			ACTIONS.AnimateSequence( f1_local2.DisplayOverlayLaptop, "Warning" )
			ACTIONS.AnimateSequence( f1_local1.DisplayOverlay, "Warning" )
			ACTIONS.AnimateSequence( f1_local0.DisplayOverlay, "Warning" )
			ACTIONS.AnimateSequence( f1_local4.DisplayOverlay, "Warning" )
			ACTIONS.AnimateSequence( f1_local5.DisplayOverlay, "Warning" )
			f1_arg0.lastAnimationPlayed = "Warning"
		end
	end
	
	f1_arg0:addElement( f1_local0 )
	f1_arg0:addElement( f1_local1 )
	f1_arg0:addElement( f1_local2 )
	f1_arg0:addElement( f1_local3 )
	f1_arg0:addElement( f1_local4 )
	f1_arg0:addElement( f1_local5 )
	local f1_local7 = {}
	local f1_local8 = f1_arg0:SubscribeToModel( DataSources.inGame.jackal.displayCockpitIncomingMissile:GetModel( f1_arg1 ), f1_local6 )
	local f1_local9 = f1_arg0:SubscribeToModel( DataSources.inGame.jackal.displayCockpitWarnings:GetModel( f1_arg1 ), f1_local6 )
	f1_arg0.jackalSubscriptions = f1_local8
end

function RemoveScreens( f3_arg0 )
	f3_arg0:closeChildren()
end

function JackalInteriorScreens( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "JackalInteriorScreens"
	assert( controller.controllerIndex )
	self:SubscribeToModel( DataSources.inGame.jackal.entity:GetModel( controller.controllerIndex ), function ( f5_arg0 )
		local f5_local0 = DataModel.GetModelValue( f5_arg0 )
		local f5_local1
		if f5_local0 <= 0 or f5_local0 == Engine.GetEntityNumNoneValue() then
			f5_local1 = false
		else
			f5_local1 = true
		end
		if f5_local1 then
			AddScreens( self, controller.controllerIndex )
		else
			RemoveScreens( self )
		end
	end )
	return self
end

MenuBuilder.registerType( "JackalInteriorScreens", JackalInteriorScreens )
LockTable( _M )
