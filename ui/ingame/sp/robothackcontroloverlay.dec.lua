local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.RobotHackControlOverlay = LUI.Class( LUI.HUD )
LUI.RobotHackControlOverlay.init = function ( f1_arg0, f1_arg1 )
	LUI.RobotHackControlOverlay.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "RobotHackControlOverlay"
	local f1_local0 = 0.4
	local f1_local1 = -0.2
	f1_arg0.reticles = f1_arg0:AddWidget( "RobotHackReticles", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = false,
		rightAnchor = true,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		staggerBuild = true
	} )
	f1_arg0.midElements = f1_arg0:AddWidget( "HackControlMidElements", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = true,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		curvedX = f1_local0,
		curvedY = f1_local1,
		staggerBuild = true
	} )
	f1_arg0.crosshairLarge = f1_arg0:AddWidget( "HackControlCrosshairLarge", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = true,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		curvedX = f1_local0,
		curvedY = f1_local1,
		staggerBuild = true
	} )
	f1_arg0.reticle = f1_arg0:AddWidget( "HackControlReticle", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = false,
		leftAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		staggerBuild = true
	} )
	f1_arg0.frame = f1_arg0:AddWidget( "HackControlFrame", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = true,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		curvedX = f1_local0,
		curvedY = f1_local1,
		staggerBuild = true
	} )
	f1_arg0.signalFailing = f1_arg0:AddWidget( "HackControlSignalFailing", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = true,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		verticalOffset = _1080p * 264,
		curvedX = 0,
		curvedY = 0,
		staggerBuild = true
	} )
	f1_arg0.selfDestruct = f1_arg0:AddWidget( "HackControlSelfDestruct", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = true,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		verticalOffset = _1080p * 238,
		curvedX = 0,
		curvedY = 0,
		staggerBuild = true
	} )
	f1_arg0.transitionElements = f1_arg0:AddWidget( "HackControlTransitionElements", {
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
	local f1_local2 = f1_arg0:Wait( 350 )
	f1_local2.onComplete = function ()
		f1_arg0.frame:processEvent( {
			name = "bootup_anim"
		} )
	end
	
	local f1_local3 = f1_arg0:Wait( 2150 )
	f1_local3.onComplete = function ()
		f1_arg0.midElements:processEvent( {
			name = "bootup_anim"
		} )
		f1_arg0.crosshairLarge:processEvent( {
			name = "bootup_anim"
		} )
		f1_arg0.reticle:processEvent( {
			name = "bootup_anim"
		} )
	end
	
end

LUI.RobotHackControlOverlay.GetToggleWidgets = function ( f4_arg0 )
	return {}, false
end

LockTable( _M )
