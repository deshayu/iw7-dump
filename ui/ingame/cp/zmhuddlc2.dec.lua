LUI.ZMHUDDLC2 = LUI.Class( LUI.HUD )
local f0_local0 = function ( f1_arg0 )
	DataSources.inGame.MP.splashes.localPlayer.headerAlpha:SetValue( f1_arg0, 0 )
	DataSources.inGame.MP.splashes.localPlayer.bodyAlpha:SetValue( f1_arg0, 0 )
	DataSources.inGame.MP.splashes.globalPlayer.headerAlpha:SetValue( f1_arg0, 0 )
	DataSources.inGame.MP.splashes.globalPlayer.bodyAlpha:SetValue( f1_arg0, 0 )
end

LUI.ZMHUDDLC2.init = function ( f2_arg0, f2_arg1 )
	LUI.ZMHUDDLC2.super.init( f2_arg0, f2_arg1 )
	f2_arg0.id = "ZMHUDDLC2"
	f2_arg0.playerNameplates = f2_arg0:AddWidget( "PlayerNameplates", {
		scalable = false,
		shakeable = false
	} )
	f2_arg0.playerDamaged = f2_arg0:AddWidget( "ZomPlayerDamageFlash", {
		scalable = true,
		shakeable = true,
		rightAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		topAnchor = true,
		horizontalOffset = 0,
		verticalOffset = 0
	} )
	local f2_local0 = GameX.IsSplitscreen()
	local f2_local1
	if f2_local0 then
		f2_local1 = -30
		if not f2_local1 then
		
		else
			f2_arg0.spectator = f2_arg0:AddWidget( "Spectating", {
				scalable = true,
				shakeable = false,
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = false,
				bottomAnchor = false,
				verticalOffset = f2_local1,
				useFullscreenHUDMask = false
			} )
			f2_arg0.talkersList = f2_arg0:AddWidget( "TalkersList", {
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				scalable = true,
				shakeable = false,
				verticalOffset = Engine.UsingSplitscreenUpscaling() and 0 or 200,
				horizontalOffset = 20
			} )
			f2_arg0.reviveBarContainer = f2_arg0:AddWidget( "ReviveBarContainerDLC2", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				verticalOffset = -100,
				horizontalOffset = 0
			} )
			f2_arg0.hitMarker = f2_arg0:AddWidget( "HitMarker", {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false
			} )
			f2_arg0.hitMarkerIcon = f2_arg0:AddWidget( "HitMarkerIcon", {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				horizontalOffset = 40,
				verticalOffset = 35
			} )
			f2_arg0.damageNumbers = f2_arg0:AddWidget( "CPDamageIndicator", {
				topAnchor = false,
				bottomAnchor = false,
				leftAnchor = false,
				rightAnchor = false
			} )
			f2_arg0.iconType = f2_arg0:AddWidget( "hudIconTypeHudDef" )
			f2_arg0.xpReward = f2_arg0:AddWidget( "xpReward", {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				verticalOffset = 20,
				horizontalOffset = 150
			} )
			local f2_local2 = 450
			if f2_local0 then
				f2_local2 = 600
			end
			f2_arg0.lastStand = f2_arg0:AddWidget( "LastStandTimer", {
				scalable = true,
				shakeable = true,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = true,
				horizontalOffset = f2_local2,
				verticalOffset = 95
			} )
			f2_arg0.grenadeCook = f2_arg0:AddWidget( "GrenadeCook", {
				scalable = false,
				shakeable = false,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				verticalOffset = 0,
				horizontalOffset = 0
			} )
			f2_arg0.hints = f2_arg0:AddWidget( "Hints" )
			f2_arg0.interactiveObjectPopup = f2_arg0:AddWidget( "InteractiveObjectPopup", {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = true,
				verticalOffset = 200,
				buildWhen = DataSources.inGame.HUD.hints.interactiveObject.popup.shouldShow
			} )
			f2_arg0.ammoWarning = f2_arg0:AddWidget( "AmmoWarning", {
				scalable = true,
				shakeable = true,
				topAnchor = false,
				bottomAnchor = false,
				leftAnchor = false,
				rightAnchor = false,
				verticalOffset = 190
			} )
			f2_arg0.gameMessages = f2_arg0:AddWidget( "gameMessageHudDef", {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				verticalOffset = 200
			} )
			f2_arg0.shoulderCannon = f2_arg0:AddWidget( "shoulderCannonOverlayDef", {
				scalable = true,
				shakeable = true
			} )
			f2_arg0.trophy = f2_arg0:AddWidget( "playerTrophyOverlayDef", {
				shakeable = true
			} )
			f2_arg0.waveNumber = f2_arg0:AddWidget( "WaveNumberContainer", {
				scalable = true,
				shakeable = true,
				leftanchor = false,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				horizontalOffset = 0,
				verticalOffset = 0
			} )
			f2_arg0.waveNumberSplash = f2_arg0:AddWidget( "waveContainer", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = true,
				horizontalOffset = 0,
				verticalOffset = -25
			} )
			f2_arg0.inventoryNagWidget = f2_arg0:AddWidget( "inventoryNagWidget", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				horizontalOffset = 0,
				verticalOffset = 77
			} )
			local f2_local3 = 0
			if f2_local0 then
				f2_local3 = -200
			end
			f2_arg0.consumableGranted = f2_arg0:AddWidget( "FateCardsGranted", {
				scalable = true,
				shakeable = true,
				rightAnchor = false,
				bottomAnchor = false,
				leftAnchor = true,
				topAnchor = true,
				horizontalOffset = -29,
				verticalOffset = f2_local3
			} )
			f2_arg0.wonderCard = f2_arg0:AddWidget( "HudBottomRightDLC2", {
				scalable = true,
				shakeable = true,
				rightAnchor = true,
				bottomAnchor = true,
				leftAnchor = false,
				topAnchor = false,
				horizontalOffset = -25,
				verticalOffset = -10
			} )
			f2_arg0.consumableActivated = f2_arg0:AddWidget( "ConsumableActivate", {
				scalable = true,
				shakeable = true,
				rightAnchor = false,
				bottomAnchor = true,
				leftAnchor = false,
				topAnchor = false,
				horizontalOffset = 0,
				verticalOffset = 0
			} )
			f2_arg0.consumableUsed = f2_arg0:AddWidget( "fateCardUsedContainer", {
				scalable = true,
				shakeable = true,
				rightAnchor = false,
				bottomAnchor = false,
				leftAnchor = true,
				topAnchor = true,
				horizontalOffset = -300,
				verticalOffset = -100
			} )
			f2_arg0.mainPlayerInfo = f2_arg0:AddWidget( "MainPlayerInfoContainerDLC2", {
				scalable = true,
				shakeable = true,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = true,
				horizontalOffset = 25,
				verticalOffset = 7
			} )
			f2_arg0.cashEarned = f2_arg0:AddWidget( "CashEarned", {
				scalable = true,
				topAnchor = false,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = false,
				verticalOffset = 125,
				horizontalOffset = 220
			} )
			f2_arg0.bossTimer = f2_arg0:AddWidget( "BossTimerContainer", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				horizontalOffset = 0,
				verticalOffset = 0
			} )
			f2_arg0.shootingGalleryOneScoreboard = f2_arg0:AddWidget( "shootingGalleryOneScoreboard", {
				scalable = true,
				shakeable = false,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				horizontalOffset = 0,
				verticalOffset = 50
			} )
			f2_arg0.shootingGalleryTwoScoreboard = f2_arg0:AddWidget( "shootingGalleryTwoScoreboard", {
				scalable = true,
				shakeable = false,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				horizontalOffset = 0,
				verticalOffset = 50
			} )
			f2_arg0.coaster1ScoreBoard = f2_arg0:AddWidget( "coasterScoreboardPlayer1", {
				scalable = true,
				shakeable = true,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false
			} )
			f2_arg0.coaster2ScoreBoard = f2_arg0:AddWidget( "coasterScoreboardcoaster2", {
				scalable = true,
				shakeable = true,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false
			} )
			f2_arg0.bballHelper = f2_arg0:AddWidget( "bballhelperContainer", {
				scalable = true,
				shakeable = true,
				rightAnchor = true,
				bottomAnchor = true,
				leftAnchor = false,
				topAnchor = false,
				horizontalOffset = -25,
				verticalOffset = -10
			} )
			f2_arg0.bfpHelper = f2_arg0:AddWidget( "bfphelperContainer", {
				scalable = true,
				shakeable = true,
				rightAnchor = true,
				bottomAnchor = true,
				leftAnchor = false,
				topAnchor = false,
				horizontalOffset = -25,
				verticalOffset = -10
			} )
			f2_arg0.gameHelper = f2_arg0:AddWidget( "gamehelperContainer", {
				scalable = true,
				shakeable = true,
				rightAnchor = true,
				bottomAnchor = true,
				leftAnchor = false,
				topAnchor = false,
				horizontalOffset = -25,
				verticalOffset = -10
			} )
			f2_arg0.zzHelper = f2_arg0:AddWidget( "zzhelperContainer", {
				scalable = true,
				shakeable = true,
				rightAnchor = true,
				bottomAnchor = true,
				leftAnchor = false,
				topAnchor = false,
				horizontalOffset = -25,
				verticalOffset = -10
			} )
			f2_arg0.arcadeHelper = f2_arg0:AddWidget( "arcadeHelperContainer", {
				scalable = true,
				shakeable = true,
				rightAnchor = true,
				bottomAnchor = true,
				leftAnchor = false,
				topAnchor = false,
				horizontalOffset = -25,
				verticalOffset = -10
			} )
			f2_arg0.activeCharms = f2_arg0:AddWidget( "charmsHUDWidget", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = true,
				horizontalOffset = 0,
				verticalOffset = 35
			} )
			f2_arg0.activePerks = f2_arg0:AddWidget( "ZomPerksWidget", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = true,
				horizontalOffset = 0,
				verticalOffset = 0
			} )
			f2_arg0.activePowerups = f2_arg0:AddWidget( "ZomPowerupWidget", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				horizontalOffset = 115,
				verticalOffset = 43
			} )
			f2_arg0.powerupActivated = f2_arg0:AddWidget( "ZomPowerupActive", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				horizontalOffset = 0,
				verticalOffset = 100
			} )
			f2_arg0.challengeSplash = f2_arg0:AddWidget( "challengeSplash", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				horizontalOffset = 0,
				verticalOffset = 0
			} )
			f2_arg0.challengeActive = f2_arg0:AddWidget( "ChallengeMeterContainerDLC1", {
				scalable = true,
				shakeable = true,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				horizontalOffset = 0,
				verticalOffset = 0
			} )
			f2_arg0.interactionNotification = f2_arg0:AddWidget( "interactionNotification", {
				scalable = true,
				shakeable = true,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false
			} )
			f2_arg0.playerWeaponBuiltKit = f2_arg0:AddWidget( "playerWeaponBuiltKit", {
				scalable = true,
				shakeable = false,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false
			} )
			f2_arg0.afterlifeSelfReviveProgress = f2_arg0:AddWidget( "afterlifeSelfReviveProgress", {
				scalable = true,
				shakeable = false,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = true,
				verticalOffset = 15
			} )
			f2_arg0.coasterInfo = f2_arg0:AddWidget( "zomCoasterInfo", {
				scalable = true,
				shakeable = false,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = true
			} )
			f2_arg0.papTimer = f2_arg0:AddWidget( "papTimer", {
				scalable = true,
				shakeable = false,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = true
			} )
			local f2_local4 = 0
			local f2_local5 = 0
			if f2_local0 then
				f2_local4 = 6
				f2_local5 = -128
			end
			f2_arg0.questFullScreenSplash = f2_arg0:AddWidget( "questFullScreenSplashDLC2", {
				scalable = true,
				shakeable = true,
				useFullscreenHUDMask = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = true,
				verticalOffset = f2_local4,
				horizontalOffset = f2_local5
			} )
			f2_arg0.lostAndFoundTimer = f2_arg0:AddWidget( "lostAndFound", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				verticalOffset = 30,
				horizontalOffset = 0
			} )
			f2_arg0.speakerDefenseTimer = f2_arg0:AddWidget( "speakerDefenseIcon", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				verticalOffset = 30,
				horizontalOffset = 0
			} )
			f2_arg0.localPlayerZombieSplashes = f2_arg0:AddWidget( "LocalPlayerZombieSplashDLC2Container", {
				scalable = true,
				shakeable = true,
				useFullscreenHUDMask = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				verticalOffset = 0,
				horizontalOffset = 0,
				curvedX = xCurveValue,
				curvedY = yCurveValue
			} )
			f2_arg0.globalPlayerSplashes = f2_arg0:AddWidget( "GlobalPlayerZombieSplash", {
				scalable = true,
				shakeable = true,
				useFullscreenHUDMask = true,
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = false,
				bottomAnchor = false,
				verticalOffset = -80,
				horizontalOffset = 40,
				curvedX = xCurveValue,
				curvedY = yCurveValue
			} )
			f2_arg0.ghostArcadeGameCabinet = f2_arg0:AddWidget( "ghostArcadeGameCabinet", {
				scalable = false,
				shakeable = false,
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = true,
				verticalOffset = 0,
				horizontalOffset = 0
			} )
			f2_arg0.ghostHUDContainer = f2_arg0:AddWidget( "skullHUDContainer", {
				scalable = true,
				shakeable = true,
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = true,
				verticalOffset = 0,
				horizontalOffset = 0
			} )
			if Engine.GetDvarString( "ui_gametype" ) == "escape" then
				f2_arg0.escapeGateProgress = f2_arg0:AddWidget( "gateProgress", {
					scalable = true,
					shakeable = true,
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = false,
					bottomAnchor = true,
					verticalOffset = 0,
					horizontalOffset = 0
				} )
				f2_arg0.escapeGateOpened = f2_arg0:AddWidget( "gateOpened", {
					scalable = true,
					shakeable = true,
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = true,
					bottomAnchor = false,
					verticalOffset = 300,
					horizontalOffset = 425
				} )
				f2_arg0.comboSplashes = f2_arg0:AddWidget( "comboSplashes", {
					scalable = true,
					shakeable = true,
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = true,
					bottomAnchor = false,
					verticalOffset = 175,
					horizontalOffset = 380
				} )
			end
			f2_arg0:registerOmnvarHandler( "cp_media_demo_omnvar", LUI.HUD.UpdateWidgetsVisibility )
			f2_arg0:registerOmnvarHandler( "zm_dev_damage", LUI.HUD.UpdateWidgetsVisibility )
			f2_arg0:registerOmnvarHandler( "ui_session_state", LUI.HUD.UpdateWidgetsVisibility )
			f2_arg0:registerOmnvarHandler( "ui_hide_hud", LUI.HUD.UpdateWidgetsVisibility )
			f2_arg0:registerOmnvarHandler( "zombie_arcade_game_time", LUI.HUD.UpdateWidgetsVisibility )
			f2_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.hideWeaponInfo:GetModel( f2_arg0:getRootController() ), function ()
				LUI.HUD.UpdateWidgetsVisibility( f2_arg0 )
			end )
			f2_arg0:registerOmnvarHandler( "zm_arcade_emulator", function ( f4_arg0, f4_arg1 )
				if f4_arg1.value == "arcade_off" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_spider" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/spider1.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_barnstorming" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/barnsto1.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_cosmic" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/cosmic1.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_demon" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/demon.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_pitfall" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/pitfall2.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_riverraid" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/riverr2.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_robottank" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/robott1.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_starmaster" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/starmas1.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_chopper" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/chopper1.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_seaques" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/pitfall1.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_plaque" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/enduro1.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_icehock" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/riverr1.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_oink" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/atlantis.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_hero" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/megaman1.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_crackpo" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/grandpr1.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_boxing" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/pressur1.bin " .. f4_arg1.controller, f4_arg1.controller )
				elseif f4_arg1.value == "arcade_keyston" then
					Engine.Exec( "vcs_stop " .. f4_arg1.controller, f4_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/dolphin1.bin " .. f4_arg1.controller, f4_arg1.controller )
				end
			end )
			f2_arg0:registerOmnvarHandler( "retry_popup", function ( f5_arg0, f5_arg1 )
				if f5_arg1.value == 1 then
					LUI.FlowManager.RequestPopupMenu( f5_arg0, "RetryGamePopup", true, f5_arg1.controller )
				end
			end )
			f2_arg0:registerOmnvarHandler( "zm_tutorial_num", function ( f6_arg0, f6_arg1 )
				if f6_arg1.value == -1 then
					LUI.FlowManager.RequestPopupMenu( f6_arg0, "tutorialYesNo", true, f6_arg1.controller )
					ACTIONS.ZombiePauseGame( f6_arg0 )
				end
				if f6_arg1.value > 0 then
					LUI.FlowManager.RequestPopupMenu( f6_arg0, "tutorialPopupMenu", true, f6_arg1.controller )
					ACTIONS.ZombiePauseGame( f6_arg0 )
				end
			end )
			f2_arg0:registerOmnvarHandler( "zm_ui_show_ghost_arcade_scores", function ( f7_arg0, f7_arg1 )
				local f7_local0 = nil
				if f7_arg1.value > 0 then
					f7_arg0.ghostScoreBoard = MenuBuilder.BuildRegisteredType( "ghostScoreBoard", f7_local0 )
					f7_arg0:addElement( f7_arg0.ghostScoreBoard )
				end
				if f7_arg1.value == 0 and f7_arg0.ghostScoreBoard ~= nil then
					f7_arg0.ghostScoreBoard:closeTree()
					f7_arg0.ghostScoreBoard = nil
				end
			end )
			f2_arg0:registerOmnvarHandler( "zm_boss_splash", function ( f8_arg0, f8_arg1 )
				local f8_local0 = nil
				if f8_arg1.value == 1 then
					f8_arg0.bossSplash = MenuBuilder.BuildRegisteredType( "BossSplash", f8_local0 )
					f8_arg0:addElement( f8_arg0.bossSplash )
				end
				if f8_arg1.value == 0 and f8_arg0.bossSplash ~= nil then
					f8_arg0.bossSplash:closeTree()
					f8_arg0.bossSplash = nil
				end
			end )
			local f2_local6 = 6
			for self = 0, f2_local6 - 1, 1 do
				local f2_local10 = DataSources.inGame.MP.splashes.omnvarList[self]
				f2_arg0:SubscribeToModel( f2_local10:GetModel( f2_arg1 ), LUI.ZMHUDDLC2.SplashSubscriptionHelper( f2_local10, DataSources.inGame.MP.splashes.paramList[self], DataSources.inGame.MP.splashes.cardClientIdList[self], f2_arg1 ), true )
			end
			local self = LUI.UIMessageQueue.new( nil, {
				controller = f2_arg1,
				nextMessageDelay = 250
			} )
			f2_arg0.splashMessageQueue = self
			f2_arg0:addElement( self )
			LUI.ZMHUDDLC2.RegisterSplashHandlers( f2_arg0 )
			f2_arg0:UpdateWidgetsVisibility()
		end
	end
	f2_local1 = 0
end

LUI.ZMHUDDLC2.GetToggleWidgets = function ( f9_arg0 )
	local f9_local0 = Engine.GetLuiRoot()
	local f9_local1 = f9_arg0.controllerIndex
	local f9_local2 = {}
	local f9_local3, f9_local4 = nil
	local f9_local5 = Game.GetOmnvar( "ui_session_state" )
	local f9_local6 = Game.IsSpectating() or f9_local5 == "spectator"
	local f9_local7 = not GameX.IsSpectatingNotOnTeam()
	local f9_local8 = f9_local5 ~= "playing"
	local f9_local9 = AnyActiveMenusInStack( f9_local0 )
	local f9_local10 = Game.GetOmnvar( "ui_match_start_countdown" ) > 0
	local f9_local11 = Game.GetOmnvar( "cp_media_demo_omnvar" ) ~= 0
	local f9_local12 = Game.GetOmnvar( "zm_dev_damage" ) ~= 0
	local f9_local13 = DataSources.inGame.player.currentWeapon.hideWeaponInfo:GetValue( f9_local1 )
	local f9_local14 = Game.GetOmnvar( "ui_hide_hud" ) == true
	local f9_local15 = Game.GetOmnvar( "zombie_arcade_game_time" ) > -1
	local f9_local16 = Game.GetOmnvar( "zombie_afterlife_soul_power_needed" ) > -1
	local f9_local17 = Game.GetOmnvar( "zm_ui_player_in_afterlife_arcade" )
	local f9_local18 = Game.GetOmnvar( "zm_ui_player_playing_ghost_arcade" )
	local f9_local19 = LUI.ScoreboardLayer:GetInstance()
	f9_local19 = f9_local19:IsShowingScoreboard()
	if f9_local9 then
		f9_local3 = true
		f9_local4 = {
			on = "snap",
			off = "snap"
		}
	elseif f9_local6 then
		f9_local3 = true
		f9_local2 = {
			f9_arg0.lowHealth,
			f9_arg0.spectator,
			f9_arg0.bballScoreboard,
			f9_arg0.bballTwoScoreboard,
			f9_arg0.bballThreeScoreboard
		}
		if f9_local7 then
			f9_local2[#f9_local2 + 1] = f9_arg0.weaponInfo
			f9_local2[#f9_local2 + 1] = f9_arg0.bballScoreboard
			f9_local2[#f9_local2 + 1] = f9_arg0.bballTwoScoreboard
			f9_local2[#f9_local2 + 1] = f9_arg0.bballThreeScoreboard
		end
	elseif f9_local8 then
		f9_local3 = true
	elseif f9_local11 then
		f9_local3 = false
		f9_local2 = {
			f9_arg0.flashMessage,
			f9_arg0.splashes,
			f9_arg0.challenges,
			f9_arg0.spectator,
			f9_arg0.gameMessages,
			f9_arg0.lowHealth
		}
	elseif f9_local14 then
		f9_local3 = true
	elseif f9_local19 then
		f9_local3 = true
		f9_local2 = {
			f9_arg0.playerDamaged,
			f9_arg0.hitMarker,
			f9_arg0.hitMarkerIcon,
			f9_arg0.ghostArcadeGameCabinet,
			f9_arg0.binkWindow
		}
	elseif f9_local17 then
		f9_local3 = true
		if f9_local16 then
			f9_local2 = {
				f9_arg0.interactiveObjectPopup,
				f9_arg0.gameMessages,
				f9_arg0.shootingGalleryTwoScoreboard,
				f9_arg0.capturingHUD,
				f9_arg0.clownToothAfterlifeArcadeScoreboard,
				f9_arg0.afterlifeSelfReviveProgress,
				f9_arg0.skeeballAfterlifeArcadeScoreboard,
				f9_arg0.bballHelper,
				f9_arg0.bfpHelper,
				f9_arg0.gameHelper,
				f9_arg0.zzHelper,
				f9_arg0.reviveBarContainer,
				f9_arg0.bballTwoScoreboard,
				f9_arg0.arcadeHelper
			}
		else
			f9_local2 = {
				f9_arg0.interactiveObjectPopup,
				f9_arg0.gameMessages,
				f9_arg0.shootingGalleryTwoScoreboard,
				f9_arg0.capturingHUD,
				f9_arg0.clownToothAfterlifeArcadeScoreboard,
				f9_arg0.skeeballAfterlifeArcadeScoreboard,
				f9_arg0.bballHelper,
				f9_arg0.bfpHelper,
				f9_arg0.gameHelper,
				f9_arg0.zzHelper,
				f9_arg0.reviveBarContainer,
				f9_arg0.bballTwoScoreboard,
				f9_arg0.arcadeHelper
			}
		end
	elseif f9_local18 then
		f9_local3 = true
		f9_local2 = {
			f9_arg0.gameMessages,
			f9_arg0.ghostHUDContainer,
			f9_arg0.hitMarker
		}
	elseif f9_local12 then
		f9_local3 = false
		f9_local2 = {
			f9_arg0.spectator
		}
	elseif f9_local15 then
		f9_local3 = false
		f9_local2 = {
			f9_arg0.wonderCard,
			f9_arg0.wonderCardFillWidget,
			f9_arg0.weaponInfo,
			f9_arg0.spectator,
			f9_arg0.damageNumbers,
			f9_arg0.dpad,
			f9_arg0.afterlifeSelfReviveProgress
		}
	else
		f9_local3 = false
		f9_local2 = {
			f9_arg0.spectator,
			f9_arg0.damageNumbers,
			f9_arg0.ghostghostHUDContainer,
			f9_arg0.afterlifeSelfReviveProgress
		}
		if Engine.GetDvarString( "ui_gametype" ) == "escape" then
			f9_local2[#f9_local2 + 1] = f9_arg0.challengeActive
			f9_local2[#f9_local2 + 1] = f9_arg0.challengeSplash
			f9_local2[#f9_local2 + 1] = f9_arg0.waveNumber
			f9_local2[#f9_local2 + 1] = f9_arg0.ticketCount
			f9_local2[#f9_local2 + 1] = f9_arg0.ticketMachine
			f9_local2[#f9_local2 + 1] = f9_arg0.mainPlayerInfo
			f9_local2[#f9_local2 + 1] = f9_arg0.playerCash
			f9_local2[#f9_local2 + 1] = f9_arg0.souvenir
			f9_local2[#f9_local2 + 1] = f9_arg0.waveNumberSplash
			f9_local2[#f9_local2 + 1] = f9_arg0.ghostArcadeGameCabinet
		end
	end
	return f9_local2, f9_local3, f9_local4
end

LUI.ZMHUDDLC2.SplashSubscriptionHelper = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	return function ()
		local f11_local0 = f10_arg0:GetValue( f10_arg3 )
		if f11_local0 < 0 then
			return 
		end
		local f11_local1 = Engine.BitwiseAnd( f11_local0, 2047 )
		DataSources.inGame.MP.splashes.queue.splashIndex:SetValue( f10_arg3, f11_local1 )
		local f11_local2 = f10_arg1:GetValue( f10_arg3 )
		local f11_local3 = Engine.TableLookupByRow( CSV.zombieSplashTable.file, f11_local1, CSV.zombieSplashTable.cols.name )
		local f11_local4 = 1
		if f11_local3 and f11_local3 ~= "" then
			if f11_local2 and f11_local2 >= 0 then
				f11_local3 = Engine.Localize( f11_local3, f11_local2 )
			else
				f11_local3 = Engine.Localize( f11_local3 )
			end
		else
			f11_local3 = ""
			f11_local4 = 0
		end
		DataSources.inGame.MP.splashes.queue.header:SetValue( f10_arg3, f11_local3 )
		DataSources.inGame.MP.splashes.queue.headerAlpha:SetValue( f10_arg3, f11_local4 )
		local f11_local5 = Engine.TableLookupByRow( CSV.zombieSplashTable.file, f11_local1, CSV.zombieSplashTable.cols.desc )
		local f11_local6 = 1
		if f11_local5 and f11_local5 ~= "" then
			if f11_local2 and f11_local2 >= 0 then
				f11_local5 = Engine.Localize( f11_local5, f11_local2 )
			else
				f11_local5 = Engine.Localize( f11_local5 )
			end
		else
			f11_local5 = ""
			f11_local6 = 0
		end
		DataSources.inGame.MP.splashes.queue.body:SetValue( f10_arg3, f11_local5 )
		DataSources.inGame.MP.splashes.queue.bodyAlpha:SetValue( f10_arg3, f11_local6 )
		local f11_local7 = Engine.TableLookupByRow( CSV.zombieSplashTable.file, f11_local1, CSV.zombieSplashTable.cols.icon )
		local f11_local8 = 1
		if not f11_local7 or f11_local7 == "" then
			f11_local7 = "white_multiply"
			f11_local8 = 0
		end
		DataSources.inGame.MP.splashes.queue.icon:SetValue( f10_arg3, f11_local7 )
		DataSources.inGame.MP.splashes.queue.iconAlpha:SetValue( f10_arg3, f11_local8 )
		local f11_local9 = f10_arg2:GetValue( f10_arg3 )
		if f11_local9 and f11_local9 >= 0 then
			DataSources.inGame.MP.splashes.queue.cardClientId:SetValue( f10_arg3, f11_local9 )
		else
			DataSources.inGame.MP.splashes.queue.cardClientId:SetValue( f10_arg3, -1 )
		end
		local f11_local10 = Engine.TableLookupByRow( CSV.zombieSplashTable.file, f11_local1, CSV.zombieSplashTable.cols.sound )
		if f11_local10 and f11_local10 ~= "" and f11_local10 ~= "null" then
			DataSources.inGame.MP.splashes.queue.sound:SetValue( f10_arg3, f11_local10 )
		else
			DataSources.inGame.MP.splashes.queue.sound:SetValue( f10_arg3, "" )
		end
		local f11_local11 = Engine.TableLookupByRow( CSV.zombieSplashTable.file, f11_local1, CSV.zombieSplashTable.cols.displayLocation )
		local f11_local12 = assert
		local f11_local13
		if f11_local11 ~= "otherPlayer" and f11_local11 ~= "local" then
			f11_local13 = false
		else
			f11_local13 = true
		end
		f11_local12( f11_local13, "Splash #" .. f11_local1 .. " has an unknown displayLocation" )
		if f11_local11 == "otherPlayer" then
			DataSources.inGame.MP.splashes.queue.pushToGlobalPlayer:SetValue( f10_arg3, true )
		else
			DataSources.inGame.MP.splashes.queue.pushToLocalPlayer:SetValue( f10_arg3, true )
		end
	end
	
end

LUI.ZMHUDDLC2.RegisterSplashHandlers = function ( f12_arg0 )
	LUI.UIMessageQueue.AddWidget( f12_arg0.splashMessageQueue, f12_arg0.localPlayerZombieSplashes, {
		messageType = LUI.UIMessageQueue.MessageType.LocalPlayerZombieSplash,
		dataSourcesFrom = {
			splashIndex = DataSources.inGame.MP.splashes.queue.splashIndex,
			icon = DataSources.inGame.MP.splashes.queue.icon,
			header = DataSources.inGame.MP.splashes.queue.header,
			body = DataSources.inGame.MP.splashes.queue.body,
			iconAlpha = DataSources.inGame.MP.splashes.queue.iconAlpha,
			headerAlpha = DataSources.inGame.MP.splashes.queue.headerAlpha,
			bodyAlpha = DataSources.inGame.MP.splashes.queue.bodyAlpha,
			sound = DataSources.inGame.MP.splashes.queue.sound,
			push = DataSources.inGame.MP.splashes.queue.pushToLocalPlayer
		},
		dataSourcesTo = {
			splashIndex = DataSources.inGame.MP.splashes.localPlayer.splashIndex,
			icon = DataSources.inGame.MP.splashes.localPlayer.icon,
			header = DataSources.inGame.MP.splashes.localPlayer.header,
			body = DataSources.inGame.MP.splashes.localPlayer.body,
			iconAlpha = DataSources.inGame.MP.splashes.localPlayer.iconAlpha,
			headerAlpha = DataSources.inGame.MP.splashes.localPlayer.headerAlpha,
			bodyAlpha = DataSources.inGame.MP.splashes.localPlayer.bodyAlpha,
			sound = DataSources.inGame.MP.splashes.localPlayer.sound
		}
	} )
	LUI.UIMessageQueue.AddWidget( f12_arg0.splashMessageQueue, f12_arg0.waveNumberSplash, {
		messageType = LUI.UIMessageQueue.MessageType.WaveNumberSplash,
		dataSourcesFrom = {
			waveNum = DataSources.inGame.CP.zombies.waveNumberQueue.number,
			push = DataSources.inGame.CP.zombies.waveNumberQueue.push
		},
		dataSourcesTo = {
			waveNum = DataSources.inGame.CP.zombies.waveNumberSplash
		}
	} )
	LUI.UIMessageQueue.AddWidget( f12_arg0.splashMessageQueue, f12_arg0.ticketMachine, {
		messageType = LUI.UIMessageQueue.MessageType.TicketMachine,
		dataSourcesFrom = {
			tickets = DataSources.inGame.CP.zombies.ticketsDispersedQueue.tickets,
			push = DataSources.inGame.CP.zombies.ticketsDispersedQueue.push
		},
		dataSourcesTo = {
			tickets = DataSources.inGame.CP.zombies.ticketsDispersed
		}
	} )
	LUI.UIMessageQueue.AddWidget( f12_arg0.splashMessageQueue, f12_arg0.powerupActivated, {
		messageType = LUI.UIMessageQueue.MessageType.PowerupActivated,
		dataSourcesFrom = {
			activated = DataSources.inGame.CP.zombies.powerups.queue.powerupActivated,
			push = DataSources.inGame.CP.zombies.powerups.queue.push
		},
		dataSourcesTo = {
			activated = DataSources.inGame.CP.zombies.powerups.powerupActivated
		}
	} )
	LUI.UIMessageQueue.AddWidget( f12_arg0.splashMessageQueue, f12_arg0.challengeSplash, {
		messageType = LUI.UIMessageQueue.MessageType.ChallengeSplash,
		dataSourcesFrom = {
			activated = DataSources.inGame.CP.zombies.challenges.queue.activated,
			push = DataSources.inGame.CP.zombies.challenges.queue.push
		},
		dataSourcesTo = {
			activated = DataSources.inGame.CP.zombies.challenges.challengeSplash
		}
	} )
end

