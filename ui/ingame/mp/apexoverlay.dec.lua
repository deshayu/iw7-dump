local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.ApexOverlay = LUI.Class( LUI.HUD )
LUI.ApexOverlay.init = function ( f1_arg0, f1_arg1 )
	LUI.ApexOverlay.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "ApexOverlay"
	f1_arg0.overlay = f1_arg0:AddWidget( "ApexScorestreak", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = true,
		leftAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	if not Game.InKillCam() and not Game.IsSpectating() and not CONDITIONS.ShouldHideButtonPrompts() then
		f1_arg0.controls = f1_arg0:AddWidget( "MinijackalControls", {
			useFullscreenHUDMask = true,
			scalable = false,
			shakeable = true,
			rightAnchor = true,
			leftAnchor = true,
			topAnchor = true,
			bottomAnchor = true
		} )
	end
	f1_arg0.target = f1_arg0:AddWidget( "ApexTarget", {
		useFullscreenHUDMask = true,
		scalable = false,
		shakeable = true,
		rightAnchor = false,
		leftAnchor = false,
		topAnchor = false,
		bottomAnchor = false
	} )
end

LUI.ApexOverlay.GetToggleWidgets = function ( f2_arg0 )
	return {}, false
end

LockTable( _M )
