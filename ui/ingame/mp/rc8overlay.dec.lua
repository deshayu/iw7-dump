local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.RC8Overlay = LUI.Class( LUI.HUD )
LUI.RC8Overlay.init = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 0
	local f1_local1 = 0
	LUI.RC8Overlay.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "RC8Overlay"
	f1_arg0.rc8Controls = f1_arg0:AddWidget( "RC8Controls", {
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

LUI.RC8Overlay.GetToggleWidgets = function ( f2_arg0 )
	return {}, false
end

LockTable( _M )
