local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.LocationSelectorOverlay = LUI.Class( LUI.HUD )
LUI.LocationSelectorOverlay.init = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 0
	local f1_local1 = 0
	LUI.LocationSelectorOverlay.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "LocationSelectorOverlay"
	f1_arg0.locationSelectoMain = f1_arg0:AddWidget( "LocationSelectorMain", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = true,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
end

LUI.LocationSelectorOverlay.GetToggleWidgets = function ( f2_arg0 )
	return {}, false
end

LockTable( _M )
