local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.OM130ControlOverlay = LUI.Class( LUI.HUD )
LUI.OM130ControlOverlay.init = function ( f1_arg0, f1_arg1 )
	LUI.OM130ControlOverlay.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "OM130ControlOverlay"
	local f1_local0 = 0
	local f1_local1 = 0
	f1_arg0.om130Overlay = f1_arg0:AddWidget( "OM130Overlay", {
		scalable = false,
		shakeable = true,
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		verticalOffset = 0,
		horizontalOffset = 0,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.om130ShipCallouts = f1_arg0:AddWidget( "JackalShipCallouts", {
		shakeable = true,
		useFullscreenHUDMask = true,
		noCallbackOnSubscribeForBuildWhen = false,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
end

LUI.OM130ControlOverlay.GetToggleWidgets = function ( f2_arg0 )
	return {}, false
end

LockTable( _M )
