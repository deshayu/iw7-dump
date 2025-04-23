local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.ThorOverlay = LUI.Class( LUI.HUD )
LUI.ThorOverlay.init = function ( f1_arg0, f1_arg1 )
	LUI.ThorOverlay.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "ThorOverlay"
	f1_arg0:AddWidget( "ThorMissileDistanceIndicators", {
		useFullscreenHUDMask = true
	} )
	f1_arg0:AddWidget( "ThorControls", {
		scalable = true,
		shakeable = true,
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		verticalOffset = 0,
		horizontalOffset = 0,
		useFullscreenHUDMask = true
	} )
end

LUI.ThorOverlay.GetToggleWidgets = function ( f2_arg0 )
	return {}, false
end

LockTable( _M )
