local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.VenomOverlayContainer = LUI.Class( LUI.HUD )
LUI.VenomOverlayContainer.init = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 0
	local f1_local1 = 0
	LUI.VenomOverlayContainer.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "VenomOverlayContainer"
	f1_arg0.venomOverlay = f1_arg0:AddWidget( "VenomOverlay", {
		scalable = true,
		shakeable = true,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		verticalOffset = 0,
		horizontalOffset = 0,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
end

LUI.VenomOverlayContainer.GetToggleWidgets = function ( f2_arg0 )
	return {}, false
end

LockTable( _M )
