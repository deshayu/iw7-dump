local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.MarsRemoteMissileOverlay = LUI.Class( LUI.HUD )
LUI.MarsRemoteMissileOverlay.init = function ( f1_arg0, f1_arg1 )
	LUI.MarsRemoteMissileOverlay.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "MarsRemoteMissileOverlay"
	local f1_local0 = 0
	local f1_local1 = 0
	f1_arg0.marsRemoteMissileReticles = f1_arg0:AddWidget( "MarsRemoteMissileReticles" )
	f1_arg0.marsRemoteMissileMain = f1_arg0:AddWidget( "MarsRemoteMissileMain", {
		scalable = false,
		shakeable = false,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		useFullscreenHUDMask = false,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.mars.marsRemoteMissileState:GetModel( f1_arg0.controllerIndex ), function ()
		LUI.HUD.UpdateWidgetsVisibility( f1_arg0 )
	end )
end

LUI.MarsRemoteMissileOverlay.GetToggleWidgets = function ( f3_arg0 )
	return {}, false
end

LockTable( _M )
