LUI.CPHUD = LUI.Class( LUI.HUD )
LUI.CPHUD.init = function ( f1_arg0, f1_arg1 )
	LUI.CPHUD.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "CPHUD"
	f1_arg0.overlay = f1_arg0:AddWidget( "overlayHudDef" )
	f1_arg0.spectator = f1_arg0:AddWidget( "spectatorHudDef", {
		scalable = true
	} )
	f1_arg0.nukeTimer = f1_arg0:AddWidget( "NukeTimer" )
	f1_arg0.c6Timer = f1_arg0:AddWidget( "C6Timer" )
	f1_arg0.talkersList = f1_arg0:AddWidget( "TalkersList", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		scalable = true,
		shakeable = false,
		verticalOffset = Engine.UsingSplitscreenUpscaling() and 0 or 200,
		horizontalOffset = 20
	} )
	f1_arg0.hitMarker = f1_arg0:AddWidget( "HitMarker", {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false
	} )
	f1_arg0.hitMarkerIcon = f1_arg0:AddWidget( "HitMarkerIcon", {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		horizontalOffset = 40,
		verticalOffset = 35
	} )
	f1_arg0.damageNumbers = f1_arg0:AddWidget( "CPDamageIndicator", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false
	} )
	f1_arg0.iconType = f1_arg0:AddWidget( "hudIconTypeHudDef" )
	if not Engine.GetDvarString( "ui_gametype" ) == "zombie" then
		f1_arg0.lowHealth = f1_arg0:AddWidget( "lowHealthHudDef", {
			scalable = false
		} )
	end
	f1_arg0.weaponInfo = f1_arg0:AddWidget( "CPWeaponInfo", {
		scalable = true,
		shakeable = true,
		leftAnchor = false,
		topAnchor = false,
		horizontalOffset = 90,
		verticalOffset = 10
	} )
	f1_arg0.playerHealth = f1_arg0:AddWidget( "PlayerHealthMeter", {
		scalable = true,
		shakeable = true,
		leftAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		verticalOffset = 50,
		horizontalOffset = 70
	} )
	f1_arg0.lastStand = f1_arg0:AddWidget( "LastStandTimer", {
		scalable = true,
		shakeable = true,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = true,
		horizontalOffset = 275,
		verticalOffset = 60
	} )
	f1_arg0.selfRevive = f1_arg0:AddWidget( "SelfRevive", {
		scalable = true,
		shakeable = true,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = true,
		horizontalOffset = 65,
		verticalOffset = 50
	} )
	f1_arg0.cashEarned = f1_arg0:AddWidget( "CashEarned", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false
	} )
	f1_arg0.juicedTimer = f1_arg0:AddWidget( "JuicedTimer" )
	f1_arg0.grenadeCook = f1_arg0:AddWidget( "GrenadeCook", {
		scalable = true,
		shakeable = false,
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		verticalOffset = 0,
		horizontalOffset = 0
	} )
	f1_arg0.hints = f1_arg0:AddWidget( "Hints" )
	f1_arg0.interactiveObjectPopup = f1_arg0:AddWidget( "InteractiveObjectPopup", {
		scalable = false,
		shakeable = true,
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = true,
		verticalOffset = 200
	} )
	f1_arg0.ammoWarning = f1_arg0:AddWidget( "AmmoWarning", {
		scalable = true,
		shakeable = true,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		verticalOffset = 190
	} )
	f1_arg0.splashes = f1_arg0:AddWidget( "CPSplashes", {
		scalable = true
	} )
	f1_arg0.challenges = f1_arg0:AddWidget( "CPChallenges", {
		scalable = true,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = true,
		verticalOffset = 50
	} )
	f1_arg0.gameMessages = f1_arg0:AddWidget( "gameMessageHudDef", {
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		verticalOffset = 200
	} )
	f1_arg0.movementMeter = f1_arg0:AddWidget( "MovementMeter", {
		scalable = true,
		shakeable = true,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		horizontalOffset = 0,
		verticalOffset = 130
	} )
	f1_arg0.shoulderCannon = f1_arg0:AddWidget( "shoulderCannonOverlayDef", {
		scalable = true,
		shakeable = true
	} )
	f1_arg0.shoulderCannonTimer = f1_arg0:AddWidget( "shoulderCannonTimerHudDef", {
		shakeable = true
	} )
	f1_arg0.abilities = f1_arg0:AddWidget( "PlayerAbilities", {
		scalable = true,
		shakeable = true,
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		verticalOffset = 10
	} )
	f1_arg0.trophy = f1_arg0:AddWidget( "playerTrophyOverlayDef", {
		shakeable = true
	} )
	f1_arg0.trophyTimer = f1_arg0:AddWidget( "trophyTimerHudDef", {
		shakeable = true
	} )
	f1_arg0.chargeWeaponReticle = f1_arg0:AddWidget( "ChargeWeaponReticle" )
	if Engine.GetDvarString( "ui_gametype" ) == "zombie" then
		f1_arg0.waveNumber = f1_arg0:AddWidget( "WaveNumber", {
			scalable = true
		} )
		f1_arg0.PlayerCash = f1_arg0:AddWidget( "PlayerCash", {
			scalable = true
		} )
		f1_arg0.bballScoreboard = f1_arg0:AddWidget( "bball_scoreboard", {
			scalable = true,
			shakeable = false,
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			horizontalOffset = 0,
			verticalOffset = 50
		} )
	end
	f1_arg0:registerOmnvarHandler( "cp_media_demo_omnvar", LUI.HUD.UpdateWidgetsVisibility )
	f1_arg0:registerOmnvarHandler( "ui_predator_missile", LUI.HUD.UpdateWidgetsVisibility )
	f1_arg0:registerOmnvarHandler( "ui_session_state", LUI.HUD.UpdateWidgetsVisibility )
	f1_arg0:registerOmnvarHandler( "ui_hide_hud", LUI.HUD.UpdateWidgetsVisibility )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.hideWeaponInfo:GetModel( f1_arg0:getRootController() ), function ()
		LUI.HUD.UpdateWidgetsVisibility( f1_arg0 )
	end )
	f1_arg0:registerOmnvarHandler( "retry_popup", function ( f3_arg0, f3_arg1 )
		if f3_arg1.value == 1 then
			LUI.FlowManager.RequestPopupMenu( f3_arg0, "RetryGamePopup", true, f3_arg1.controller )
		end
	end )
	f1_arg0:registerOmnvarHandler( "loadout_menu_open", function ( f4_arg0, f4_arg1 )
		LUI.FlowManager.RequestAddMenu( "aliens_cac_menu", true, f4_arg1.controller, false )
	end )
	f1_arg0:UpdateWidgetsVisibility()
end

LUI.CPHUD.GetToggleWidgets = function ( f5_arg0 )
	local f5_local0 = Engine.GetLuiRoot()
	local f5_local1 = f5_arg0.controllerIndex
	local f5_local2 = {}
	local f5_local3, f5_local4 = nil
	local f5_local5 = Game.GetOmnvar( "ui_session_state" )
	local f5_local6 = Game.IsSpectating() or f5_local5 == "spectator"
	local f5_local7 = not GameX.IsSpectatingNotOnTeam()
	local f5_local8 = f5_local5 ~= "playing"
	local f5_local9 = AnyActiveMenusInStack( f5_local0 )
	local f5_local10 = Game.GetOmnvar( "ui_match_start_countdown" ) > 0
	local f5_local11 = Game.GetOmnvar( "cp_media_demo_omnvar" ) ~= 0
	local f5_local12 = DataSources.inGame.player.currentWeapon.hideWeaponInfo:GetValue( f5_local1 )
	local f5_local13 = Game.GetOmnvar( "ui_hide_hud" ) == true
	if f5_local9 then
		f5_local3 = true
		f5_local4 = {
			on = "snap",
			off = "snap"
		}
	elseif f5_local6 then
		f5_local3 = true
		f5_local2 = {
			f5_arg0.lowHealth,
			f5_arg0.spectator
		}
		if f5_local7 then
			f5_local2[#f5_local2 + 1] = f5_arg0.weaponInfo
		end
	elseif f5_local8 then
		f5_local3 = true
	elseif f5_local11 then
		f5_local3 = false
		f5_local2 = {
			f5_arg0.flashMessage,
			f5_arg0.splashes,
			f5_arg0.challenges,
			f5_arg0.spectator,
			f5_arg0.gameMessages,
			f5_arg0.lowHealth
		}
	elseif f5_local12 then
		f5_local3 = false
		f5_local2 = {
			f5_arg0.weaponInfo,
			f5_arg0.ammoWarning,
			f5_arg0.spectator
		}
	elseif f5_local13 then
		f5_local3 = true
	else
		f5_local3 = false
		f5_local2 = {
			f5_arg0.spectator
		}
	end
	return f5_local2, f5_local3, f5_local4
end

