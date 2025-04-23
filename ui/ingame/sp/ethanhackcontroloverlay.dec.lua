local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.EthanHackControlOverlay = LUI.Class( LUI.HUD )
LUI.EthanHackControlOverlay.init = function ( f1_arg0, f1_arg1 )
	LUI.EthanHackControlOverlay.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "EthanHackControlOverlay"
	local f1_local0 = 0.4
	local f1_local1 = -0.2
	f1_arg0.ethanHackOverlay = f1_arg0:AddWidget( "EthanHackOverlay", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = true,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		curvedX = 0,
		curvedY = 0
	} )
	f1_arg0.transitionElements = f1_arg0:AddWidget( "HackControlTransitionElements", {
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
	local f1_local2 = f1_arg0:Wait( 2100 )
	f1_local2.onComplete = function ()
		f1_arg0.ethanHackOverlay:processEvent( {
			name = "bootup_anim"
		} )
	end
	
end

LUI.EthanHackControlOverlay.GetToggleWidgets = function ( f3_arg0 )
	return {}, false
end

LockTable( _M )
