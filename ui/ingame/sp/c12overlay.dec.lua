local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.C12Overlay = LUI.Class( LUI.HUD )
LUI.C12Overlay.init = function ( f1_arg0, f1_arg1 )
	LUI.C12Overlay.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "C12Overlay"
	local f1_local0 = 0
	local f1_local1 = 0
	f1_arg0.c12Missiles = f1_arg0:AddWidget( "C12Missiles", {
		shakeable = true,
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		horizontalOffset = 84,
		verticalOffset = 225,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.logo = f1_arg0:AddWidget( "C12Logo", {
		shakeable = true,
		rightAnchor = true,
		leftAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		horizontalOffset = -66,
		verticalOffset = 0,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.targetWindow = f1_arg0:AddWidget( "C12TargetWindow", {
		shakeable = true,
		rightAnchor = true,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		horizontalOffset = 0,
		verticalOffset = 0,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.connection = f1_arg0:AddWidget( "C12ConnectionStatus", {
		shakeable = true,
		rightAnchor = false,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		horizontalOffset = 38,
		verticalOffset = 40,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.mode = f1_arg0:AddWidget( "C12Mode", {
		shakeable = true,
		rightAnchor = true,
		leftAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		horizontalOffset = 30,
		verticalOffset = 40,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.printout = f1_arg0:AddWidget( "C12PrintoutWindow", {
		shakeable = true,
		rightAnchor = true,
		leftAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		horizontalOffset = 80,
		verticalOffset = 181,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.schematic = f1_arg0:AddWidget( "C12Schematic", {
		shakeable = true,
		rightAnchor = false,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		horizontalOffset = 50,
		verticalOffset = 179,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.c12Reticles = f1_arg0:AddWidget( "C12Reticles" )
	f1_arg0:UpdateWidgetsVisibility()
end

LUI.C12Overlay.GetToggleWidgets = function ( f2_arg0 )
	local f2_local0 = f2_arg0:getRootController()
	return {}, false, {
		on = "fade",
		off = "fade"
	}
end

LockTable( _M )
