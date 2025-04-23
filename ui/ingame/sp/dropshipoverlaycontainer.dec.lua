local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.DropshipOverlayContainer = LUI.Class( LUI.HUD )
LUI.DropshipOverlayContainer.init = function ( f1_arg0, f1_arg1 )
	LUI.DropshipOverlayContainer.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "DropshipOverlayContainer"
	f1_arg0.overlay = f1_arg0:AddWidget( "DropshipOverlay", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = true,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	f1_arg0.flightStatusBar = f1_arg0:AddWidget( "DropshipFlightStatusBar", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = false,
		leftAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		verticalOffset = 64
	} )
	f1_arg0.reticle = f1_arg0:AddWidget( "DropshipCenterReticle", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = false,
		leftAnchor = false,
		topAnchor = false,
		bottomAnchor = false
	} )
end

LUI.DropshipOverlayContainer.GetToggleWidgets = function ( f2_arg0 )
	return {}, false
end

LockTable( _M )
