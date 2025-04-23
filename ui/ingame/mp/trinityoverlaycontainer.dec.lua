local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.TrinityOverlayContainer = LUI.Class( LUI.HUD )
LUI.TrinityOverlayContainer.init = function ( f1_arg0, f1_arg1 )
	LUI.TrinityOverlayContainer.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "TrinityOverlayContainer"
	f1_arg0.trinityOverlay = f1_arg0:AddWidget( "TrinityOverlay", {
		scalable = true,
		shakeable = true,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		verticalOffset = 0,
		horizontalOffset = 0,
		useFullscreenHUDMask = true
	} )
end

LUI.TrinityOverlayContainer.GetToggleWidgets = function ( f2_arg0 )
	return {}, false
end

LockTable( _M )
