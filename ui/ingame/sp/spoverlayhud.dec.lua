local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.SPOverlayHUD = LUI.Class( LUI.OverlayHUD )
LUI.SPOverlayHUD.init = function ( f1_arg0, f1_arg1 )
	LUI.SPOverlayHUD.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "SPOverlayHUD"
	f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.HUD.overlay.isC12Active )
	f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.HUD.overlay.jackalCallDownActive )
	f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.HUD.overlay.isDropshipActive )
	f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.SP.hackTargeting )
	f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.SP.hackControlOverlay )
	f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.SP.hackEthanControlOverlay )
	if DataSources.inGame.SP.mars.marsRemoteMissileActive then
		f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.SP.mars.marsRemoteMissileActive )
	end
	if DataSources.inGame.SP.europa.haloDropActive then
		f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.SP.europa.haloDropActive )
	end
	if DataSources.inGame.SP.heistSpace.olympusMonsOverlayShow then
		f1_arg0:RefreshOnDataSourceChange( DataSources.inGame.SP.heistSpace.olympusMonsOverlayShow )
	end
end

LUI.SPOverlayHUD.GetToggleOverlays = function ( f2_arg0 )
	local f2_local0 = {}
	local f2_local1 = DataSources.inGame.HUD.overlay.isC12Active:GetValue( f2_arg0.controllerIndex )
	local f2_local2 = DataSources.inGame.HUD.overlay.jackalCallDownActive:GetValue( f2_arg0.controllerIndex )
	local f2_local3 = DataSources.inGame.SP.mars.marsRemoteMissileActive:GetValue( f2_arg0.controllerIndex )
	local f2_local4 = DataSources.inGame.HUD.overlay.isDropshipActive:GetValue( f2_arg0.controllerIndex )
	local f2_local5 = DataSources.inGame.SP.hackTargeting:GetValue( f2_arg0.controllerIndex )
	local f2_local6 = DataSources.inGame.SP.hackControlOverlay:GetValue( f2_arg0.controllerIndex )
	local f2_local7 = DataSources.inGame.SP.hackEthanControlOverlay:GetValue( f2_arg0.controllerIndex )
	local f2_local8 = DataSources.inGame.SP.europa.haloDropActive:GetValue( f2_arg0.controllerIndex )
	local f2_local9 = DataSources.inGame.SP.heistSpace.olympusMonsOverlayShow:GetValue( f2_arg0.controllerIndex )
	if f2_local1 == 1 then
		f2_local0 = {
			C12Overlay = LUI.C12Overlay
		}
	elseif f2_local2 then
		f2_local0 = {
			jackalCallDown = LUI.JackalCallDownOverlay
		}
	elseif f2_local3 then
		f2_local0 = {
			marsRemoteMissile = LUI.MarsRemoteMissileOverlay
		}
	elseif f2_local4 then
		f2_local0 = {
			dropshipOverlay = LUI.DropshipOverlayContainer
		}
	elseif f2_local5 then
		f2_local0 = {
			robotHackTargetingOverlay = LUI.RobotHackTargetingOverlay
		}
	elseif f2_local6 then
		f2_local0 = {
			robotHackControlOverlay = LUI.RobotHackControlOverlay
		}
	elseif f2_local7 > 0 then
		f2_local0 = {
			ethanHackControlOverlay = LUI.EthanHackControlOverlay
		}
	elseif f2_local8 then
		f2_local0 = {
			haloDropOverlay = LUI.HaloDropOverlay
		}
	elseif f2_local9 then
		f2_local0 = {
			om130ControlOverlay = LUI.OM130ControlOverlay
		}
	end
	return f2_local0, 450
end

LockTable( _M )
