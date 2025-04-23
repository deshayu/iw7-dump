local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.HaloDropOverlay = LUI.Class( LUI.HUD )
LUI.HaloDropOverlay.init = function ( f1_arg0, f1_arg1 )
	LUI.HaloDropOverlay.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "HaloDropOverlay"
	local f1_local0 = 0
	local f1_local1 = 0
	f1_arg0.haloDropMain = f1_arg0:AddWidget( "HaloDropOverlayMain", {
		scalable = false,
		shakeable = true,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		useFullscreenHUDMask = false,
		curvedX = f1_local0,
		curvedY = f1_local1
	} )
	f1_arg0.fakeBoostMeter = f1_arg0:AddWidget( "HeistFakeBoostMeter", {
		scalable = true,
		shakeable = true,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		horizontalOffset = 0,
		verticalOffset = 112,
		useFullscreenHUDMask = true,
		curvedX = f1_local0,
		curvedY = f1_local1,
		buildWhen = DataSources.inGame.SP.heist.boostEnergy,
		gracePeriod = 1200
	} )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.europa.haloDropState:GetModel( f1_arg0.controllerIndex ), function ()
		LUI.HUD.UpdateWidgetsVisibility( f1_arg0 )
	end )
end

LUI.HaloDropOverlay.GetToggleWidgets = function ( f3_arg0 )
	return {}, false
end

LockTable( _M )
