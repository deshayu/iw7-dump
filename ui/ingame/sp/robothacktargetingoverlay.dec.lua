local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.RobotHackTargetingOverlay = LUI.Class( LUI.HUD )
LUI.RobotHackTargetingOverlay.init = function ( f1_arg0, f1_arg1 )
	LUI.RobotHackTargetingOverlay.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "RobotHackTargetingOverlay"
	f1_arg0.targetingOverlay = f1_arg0:AddWidget( "HackTargetingOverlay", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = true,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
end

LUI.RobotHackTargetingOverlay.GetToggleWidgets = function ( f2_arg0 )
	return {}, false
end

LockTable( _M )
