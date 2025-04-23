local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.MPOverlayHUD = LUI.Class( LUI.OverlayHUD )
LUI.MPOverlayHUD.init = function ( f1_arg0, f1_arg1 )
	LUI.MPOverlayHUD.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "MPOverlayHUD"
	f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.HUD.overlay.locationSelectorActive )
	f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.MP.scorestreakHuds.thorMissilesVisible )
	f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.MP.scorestreakHuds.miniJackalVisible )
	f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.MP.scorestreakHuds.venomVisible )
	f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.MP.scorestreakHuds.rc8Visible )
	f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.MP.scorestreakHuds.trinityVisible )
	f1_arg0:registerEventHandler( "camera_client_changed", LUI.OverlayHUD.UpdateOverlays )
end

LUI.MPOverlayHUD.GetToggleOverlays = function ( f2_arg0 )
	local f2_local0 = {}
	if Game.IsKillCamEntityActive() then
		return {}
	elseif DataSources.inGame.HUD.overlay.locationSelectorActive:GetValue( f2_arg0.controllerIndex ) then
		f2_local0.locationSelector = LUI.LocationSelectorOverlay
	end
	if DataSources.inGame.MP.scorestreakHuds.thorMissilesVisible:GetValue( f2_arg0.controllerIndex ) == 1 then
		f2_local0.thorStreak = LUI.ThorOverlay
	end
	local f2_local1 = DataSources.inGame.MP.scorestreakHuds.miniJackalVisible:GetValue( f2_arg0.controllerIndex )
	if f2_local1 == 1 or f2_local1 == 2 then
		f2_local0.apexStreak = LUI.ApexOverlay
	end
	if DataSources.inGame.MP.scorestreakHuds.venomVisible:GetValue( f2_arg0.controllerIndex ) == 1 then
		f2_local0.venomStreak = LUI.VenomOverlayContainer
	end
	if DataSources.inGame.MP.scorestreakHuds.rc8Visible:GetValue( f2_arg0.controllerIndex ) == 1 then
		f2_local0.rc8Streak = LUI.RC8Overlay
	end
	if DataSources.inGame.MP.scorestreakHuds.trinityVisible:GetValue( f2_arg0.controllerIndex ) == 1 then
		f2_local0.trinityStreak = LUI.TrinityOverlayContainer
	end
	return f2_local0
end

LockTable( _M )
