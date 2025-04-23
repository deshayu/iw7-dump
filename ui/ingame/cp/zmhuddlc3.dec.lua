LUI.ZMHUDDLC3 = LUI.Class( LUI.HUD )
local f0_local0 = function ( f1_arg0 )
	DataSources.inGame.MP.splashes.localPlayer.headerAlpha:SetValue( f1_arg0, 0 )
	DataSources.inGame.MP.splashes.localPlayer.bodyAlpha:SetValue( f1_arg0, 0 )
	DataSources.inGame.MP.splashes.globalPlayer.headerAlpha:SetValue( f1_arg0, 0 )
	DataSources.inGame.MP.splashes.globalPlayer.bodyAlpha:SetValue( f1_arg0, 0 )
end

LUI.ZMHUDDLC3.init = function ( f2_arg0, f2_arg1 )
	LUI.ZMHUDDLC3.super.init( f2_arg0, f2_arg1 )
	f2_arg0.id = "ZMHUDDLC3"
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
			f2_arg0.reviveBarContainer = f2_arg0:AddWidget( "ReviveBarContainerDLC3", {
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
			f2_arg0.mainPlayerInfo = f2_arg0:AddWidget( "MainPlayerInfoContainerDLC3", {
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
			f2_arg0.filmGrain = f2_arg0:AddWidget( "filmGrain", {
				scalable = true,
				shakeable = true,
				rightAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				topAnchor = true,
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
			f2_arg0.questFullScreenSplash = f2_arg0:AddWidget( "questFullScreenSplashDLC3", {
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
			f2_arg0.localPlayerZombieSplashes = f2_arg0:AddWidget( "LocalPlayerZombieSplashDLC3Container", {
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
			f2_arg0.DeathRayCannonProgress = f2_arg0:AddWidget( "DeathRayCannonContainer", {
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
			f2_arg0:registerOmnvarHandler( "zm_ui_dialpad_4", LUI.HUD.UpdateWidgetsVisibility )
			local f2_local6 = function ( f3_arg0, f3_arg1 )
				local f3_local0 = f3_arg1.value
				if f3_local0 == 1 then
					LUI.FlowManager.RequestAddMenu( "bombCounterContainer", true, f2_arg1, false )
				end
				if f3_local0 == 2 then
					LUI.FlowManager.RequestAddMenu( "liferaycounterContainer", true, f2_arg1, false )
				end
			end
			
			f2_arg0:registerOmnvarHandler( "zm_ui_dialpad_2", f2_local6 )
			f2_local6( f2_arg0, {
				value = Game.GetOmnvar( "zm_ui_dialpad_2" )
			} )
			f2_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.hideWeaponInfo:GetModel( f2_arg0:getRootController() ), function ()
				LUI.HUD.UpdateWidgetsVisibility( f2_arg0 )
			end )
			f2_arg0:registerOmnvarHandler( "zm_arcade_emulator", function ( f5_arg0, f5_arg1 )
				if f5_arg1.value == "arcade_off" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_spider" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/spider1.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_barnstorming" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/barnsto1.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_cosmic" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/cosmic1.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_demon" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/demon.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_pitfall" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/pitfall2.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_riverraid" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/riverr2.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_robottank" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/robott1.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_starmaster" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/starmas1.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_chopper" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/chopper1.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_seaques" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/seaques1.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_plaque" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/plaque1.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_icehock" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/icehock1.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_oink" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/fishing1.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_hero" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/hero1.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_crackpo" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/crackpo1.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_boxing" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/boxing1.bin " .. f5_arg1.controller, f5_arg1.controller )
				elseif f5_arg1.value == "arcade_keyston" then
					Engine.Exec( "vcs_stop " .. f5_arg1.controller, f5_arg1.controller )
					Engine.Exec( "vcs_start " .. "roms/keyston1.bin " .. f5_arg1.controller, f5_arg1.controller )
				end
			end )
			f2_arg0:registerOmnvarHandler( "retry_popup", function ( f6_arg0, f6_arg1 )
				if f6_arg1.value == 1 then
					LUI.FlowManager.RequestPopupMenu( f6_arg0, "RetryGamePopup", true, f6_arg1.controller )
				end
			end )
			f2_arg0:registerOmnvarHandler( "zm_tutorial_num", function ( f7_arg0, f7_arg1 )
				if f7_arg1.value == -1 then
					LUI.FlowManager.RequestPopupMenu( f7_arg0, "tutorialYesNo", true, f7_arg1.controller )
					ACTIONS.ZombiePauseGame( f7_arg0 )
				end
				if f7_arg1.value > 0 then
					LUI.FlowManager.RequestPopupMenu( f7_arg0, "tutorialPopupMenu", true, f7_arg1.controller )
					ACTIONS.ZombiePauseGame( f7_arg0 )
				end
			end )
			f2_arg0:registerOmnvarHandler( "zm_ui_show_ghost_arcade_scores", function ( f8_arg0, f8_arg1 )
				local f8_local0 = nil
				if f8_arg1.value > 0 then
					f8_arg0.ghostScoreBoard = MenuBuilder.BuildRegisteredType( "ghostScoreBoard", f8_local0 )
					f8_arg0:addElement( f8_arg0.ghostScoreBoard )
				end
				if f8_arg1.value == 0 and f8_arg0.ghostScoreBoard ~= nil then
					f8_arg0.ghostScoreBoard:closeTree()
					f8_arg0.ghostScoreBoard = nil
				end
			end )
			f2_arg0:registerOmnvarHandler( "zm_boss_splash", function ( f9_arg0, f9_arg1 )
				local f9_local0 = nil
				if f9_arg1.value == 1 then
					f9_arg0.bossSplash = MenuBuilder.BuildRegisteredType( "BossSplash", f9_local0 )
					f9_arg0:addElement( f9_arg0.bossSplash )
				end
				if f9_arg1.value == 0 and f9_arg0.bossSplash ~= nil then
					f9_arg0.bossSplash:closeTree()
					f9_arg0.bossSplash = nil
				end
			end )
			local f2_local7 = 6
			for self = 0, f2_local7 - 1, 1 do
				local f2_local11 = DataSources.inGame.MP.splashes.omnvarList[self]
				f2_arg0:SubscribeToModel( f2_local11:GetModel( f2_arg1 ), LUI.ZMHUDDLC3.SplashSubscriptionHelper( f2_local11, DataSources.inGame.MP.splashes.paramList[self], DataSources.inGame.MP.splashes.cardClientIdList[self], f2_arg1 ), true )
			end
			local self = LUI.UIMessageQueue.new( nil, {
				controller = f2_arg1,
				nextMessageDelay = 250
			} )
			f2_arg0.splashMessageQueue = self
			f2_arg0:addElement( self )
			LUI.ZMHUDDLC3.RegisterSplashHandlers( f2_arg0 )
			f2_arg0:UpdateWidgetsVisibility()
		end
	end
	f2_local1 = 0
end

LUI.ZMHUDDLC3.GetToggleWidgets = function ( f10_arg0 )
	local f10_local0 = Engine.GetLuiRoot()
	local f10_local1 = f10_arg0.controllerIndex
	local f10_local2 = {}
	local f10_local3, f10_local4 = nil
	local f10_local5 = Game.GetOmnvar( "ui_session_state" )
	local f10_local6 = Game.IsSpectating() or f10_local5 == "spectator"
	local f10_local7 = not GameX.IsSpectatingNotOnTeam()
	local f10_local8 = f10_local5 ~= "playing"
	local f10_local9 = AnyActiveMenusInStack( f10_local0 )
	local f10_local10 = Game.GetOmnvar( "ui_match_start_countdown" ) > 0
	local f10_local11 = Game.GetOmnvar( "cp_media_demo_omnvar" ) ~= 0
	local f10_local12 = Game.GetOmnvar( "zm_dev_damage" ) ~= 0
	local f10_local13 = DataSources.inGame.player.currentWeapon.hideWeaponInfo:GetValue( f10_local1 )
	local f10_local14 = Game.GetOmnvar( "ui_hide_hud" ) == true
	local f10_local15 = Game.GetOmnvar( "zombie_arcade_game_time" ) > -1
	local f10_local16 = Game.GetOmnvar( "zombie_afterlife_soul_power_needed" ) > -1
	local f10_local17 = Game.GetOmnvar( "zm_ui_player_in_afterlife_arcade" )
	local f10_local18 = Game.GetOmnvar( "zm_ui_player_playing_ghost_arcade" )
	local f10_local19 = LUI.ScoreboardLayer:GetInstance()
	f10_local19 = f10_local19:IsShowingScoreboard()
	local f10_local20 = Game.GetOmnvar( "zm_ui_dialpad_4" ) == 1
	if f10_local20 then
		local f10_local21 = LUI.ScoreboardLayer:GetInstance()
		f10_local21:SetVisibilityOverride( false )
	else
		local f10_local21 = LUI.ScoreboardLayer:GetInstance()
		f10_local21:SetVisibilityOverride( nil )
	end
	if f10_local9 then
		f10_local3 = true
		f10_local4 = {
			on = "snap",
			off = "snap"
		}
	elseif f10_local6 then
		f10_local3 = true
		f10_local2 = {
			f10_arg0.lowHealth,
			f10_arg0.spectator,
			f10_arg0.bballScoreboard,
			f10_arg0.bballTwoScoreboard,
			f10_arg0.bballThreeScoreboard
		}
		if f10_local7 then
			f10_local2[#f10_local2 + 1] = f10_arg0.weaponInfo
			f10_local2[#f10_local2 + 1] = f10_arg0.bballScoreboard
			f10_local2[#f10_local2 + 1] = f10_arg0.bballTwoScoreboard
			f10_local2[#f10_local2 + 1] = f10_arg0.bballThreeScoreboard
		end
	elseif f10_local8 then
		f10_local3 = true
	elseif f10_local11 then
		f10_local3 = false
		f10_local2 = {
			f10_arg0.flashMessage,
			f10_arg0.splashes,
			f10_arg0.challenges,
			f10_arg0.spectator,
			f10_arg0.gameMessages,
			f10_arg0.lowHealth
		}
	elseif f10_local14 then
		f10_local3 = true
	elseif f10_local19 then
		f10_local3 = true
		f10_local2 = {
			f10_arg0.playerDamaged,
			f10_arg0.hitMarker,
			f10_arg0.hitMarkerIcon,
			f10_arg0.ghostArcadeGameCabinet,
			f10_arg0.binkWindow
		}
	elseif f10_local17 then
		f10_local3 = true
		if f10_local16 then
			f10_local2 = {
				f10_arg0.interactiveObjectPopup,
				f10_arg0.gameMessages,
				f10_arg0.shootingGalleryTwoScoreboard,
				f10_arg0.capturingHUD,
				f10_arg0.clownToothAfterlifeArcadeScoreboard,
				f10_arg0.afterlifeSelfReviveProgress,
				f10_arg0.skeeballAfterlifeArcadeScoreboard,
				f10_arg0.bballHelper,
				f10_arg0.bfpHelper,
				f10_arg0.gameHelper,
				f10_arg0.zzHelper,
				f10_arg0.reviveBarContainer,
				f10_arg0.bballTwoScoreboard,
				f10_arg0.arcadeHelper
			}
		else
			f10_local2 = {
				f10_arg0.interactiveObjectPopup,
				f10_arg0.gameMessages,
				f10_arg0.shootingGalleryTwoScoreboard,
				f10_arg0.capturingHUD,
				f10_arg0.clownToothAfterlifeArcadeScoreboard,
				f10_arg0.skeeballAfterlifeArcadeScoreboard,
				f10_arg0.bballHelper,
				f10_arg0.bfpHelper,
				f10_arg0.gameHelper,
				f10_arg0.zzHelper,
				f10_arg0.reviveBarContainer,
				f10_arg0.bballTwoScoreboard,
				f10_arg0.arcadeHelper
			}
		end
	elseif f10_local18 then
		f10_local3 = true
		f10_local2 = {
			f10_arg0.gameMessages,
			f10_arg0.ghostHUDContainer,
			f10_arg0.hitMarker
		}
	elseif f10_local20 then
		f10_local3 = true
		f10_local2 = {
			f10_arg0.gameMessages,
			f10_arg0.interactiveObjectPopup
		}
	elseif f10_local12 then
		f10_local3 = false
		f10_local2 = {
			f10_arg0.spectator
		}
	elseif f10_local15 then
		f10_local3 = false
		f10_local2 = {
			f10_arg0.wonderCard,
			f10_arg0.wonderCardFillWidget,
			f10_arg0.weaponInfo,
			f10_arg0.spectator,
			f10_arg0.damageNumbers,
			f10_arg0.dpad,
			f10_arg0.afterlifeSelfReviveProgress
		}
	else
		f10_local3 = false
		f10_local2 = {
			f10_arg0.spectator,
			f10_arg0.damageNumbers,
			f10_arg0.ghostghostHUDContainer,
			f10_arg0.afterlifeSelfReviveProgress
		}
		if Engine.GetDvarString( "ui_gametype" ) == "escape" then
			f10_local2[#f10_local2 + 1] = f10_arg0.challengeActive
			f10_local2[#f10_local2 + 1] = f10_arg0.challengeSplash
			f10_local2[#f10_local2 + 1] = f10_arg0.waveNumber
			f10_local2[#f10_local2 + 1] = f10_arg0.ticketCount
			f10_local2[#f10_local2 + 1] = f10_arg0.ticketMachine
			f10_local2[#f10_local2 + 1] = f10_arg0.mainPlayerInfo
			f10_local2[#f10_local2 + 1] = f10_arg0.playerCash
			f10_local2[#f10_local2 + 1] = f10_arg0.souvenir
			f10_local2[#f10_local2 + 1] = f10_arg0.waveNumberSplash
			f10_local2[#f10_local2 + 1] = f10_arg0.ghostArcadeGameCabinet
		end
	end
	return f10_local2, f10_local3, f10_local4
end

LUI.ZMHUDDLC3.SplashSubscriptionHelper = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	return function ()
		local f12_local0 = f11_arg0:GetValue( f11_arg3 )
		if f12_local0 < 0 then
			return 
		end
		local f12_local1 = Engine.BitwiseAnd( f12_local0, 2047 )
		DataSources.inGame.MP.splashes.queue.splashIndex:SetValue( f11_arg3, f12_local1 )
		local f12_local2 = f11_arg1:GetValue( f11_arg3 )
		local f12_local3 = Engine.TableLookupByRow( CSV.zombieSplashTable.file, f12_local1, CSV.zombieSplashTable.cols.name )
		local f12_local4 = 1
		if f12_local3 and f12_local3 ~= "" then
			if f12_local2 and f12_local2 >= 0 then
				f12_local3 = Engine.Localize( f12_local3, f12_local2 )
			else
				f12_local3 = Engine.Localize( f12_local3 )
			end
		else
			f12_local3 = ""
			f12_local4 = 0
		end
		DataSources.inGame.MP.splashes.queue.header:SetValue( f11_arg3, f12_local3 )
		DataSources.inGame.MP.splashes.queue.headerAlpha:SetValue( f11_arg3, f12_local4 )
		local f12_local5 = Engine.TableLookupByRow( CSV.zombieSplashTable.file, f12_local1, CSV.zombieSplashTable.cols.desc )
		local f12_local6 = 1
		if f12_local5 and f12_local5 ~= "" then
			if f12_local2 and f12_local2 >= 0 then
				f12_local5 = Engine.Localize( f12_local5, f12_local2 )
			else
				f12_local5 = Engine.Localize( f12_local5 )
			end
		else
			f12_local5 = ""
			f12_local6 = 0
		end
		DataSources.inGame.MP.splashes.queue.body:SetValue( f11_arg3, f12_local5 )
		DataSources.inGame.MP.splashes.queue.bodyAlpha:SetValue( f11_arg3, f12_local6 )
		local f12_local7 = Engine.TableLookupByRow( CSV.zombieSplashTable.file, f12_local1, CSV.zombieSplashTable.cols.icon )
		local f12_local8 = 1
		if not f12_local7 or f12_local7 == "" then
			f12_local7 = "white_multiply"
			f12_local8 = 0
		end
		DataSources.inGame.MP.splashes.queue.icon:SetValue( f11_arg3, f12_local7 )
		DataSources.inGame.MP.splashes.queue.iconAlpha:SetValue( f11_arg3, f12_local8 )
		local f12_local9 = f11_arg2:GetValue( f11_arg3 )
		if f12_local9 and f12_local9 >= 0 then
			DataSources.inGame.MP.splashes.queue.cardClientId:SetValue( f11_arg3, f12_local9 )
		else
			DataSources.inGame.MP.splashes.queue.cardClientId:SetValue( f11_arg3, -1 )
		end
		local f12_local10 = Engine.TableLookupByRow( CSV.zombieSplashTable.file, f12_local1, CSV.zombieSplashTable.cols.sound )
		if f12_local10 and f12_local10 ~= "" and f12_local10 ~= "null" then
			DataSources.inGame.MP.splashes.queue.sound:SetValue( f11_arg3, f12_local10 )
		else
			DataSources.inGame.MP.splashes.queue.sound:SetValue( f11_arg3, "" )
		end
		local f12_local11 = Engine.TableLookupByRow( CSV.zombieSplashTable.file, f12_local1, CSV.zombieSplashTable.cols.displayLocation )
		local f12_local12 = assert
		local f12_local13
		if f12_local11 ~= "otherPlayer" and f12_local11 ~= "local" then
			f12_local13 = false
		else
			f12_local13 = true
		end
		f12_local12( f12_local13, "Splash #" .. f12_local1 .. " has an unknown displayLocation" )
		if f12_local11 == "otherPlayer" then
			DataSources.inGame.MP.splashes.queue.pushToGlobalPlayer:SetValue( f11_arg3, true )
		else
			DataSources.inGame.MP.splashes.queue.pushToLocalPlayer:SetValue( f11_arg3, true )
		end
	end
	
end

LUI.ZMHUDDLC3.RegisterSplashHandlers = function ( f13_arg0 )
	LUI.UIMessageQueue.AddWidget( f13_arg0.splashMessageQueue, f13_arg0.localPlayerZombieSplashes, {
		messageType = LUI.UIMessageQueue.MessageType.LocalPlayerZombieSplashDLC3,
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
	LUI.UIMessageQueue.AddWidget( f13_arg0.splashMessageQueue, f13_arg0.waveNumberSplash, {
		messageType = LUI.UIMessageQueue.MessageType.WaveNumberSplash,
		dataSourcesFrom = {
			waveNum = DataSources.inGame.CP.zombies.waveNumberQueue.number,
			push = DataSources.inGame.CP.zombies.waveNumberQueue.push
		},
		dataSourcesTo = {
			waveNum = DataSources.inGame.CP.zombies.waveNumberSplash
		}
	} )
	LUI.UIMessageQueue.AddWidget( f13_arg0.splashMessageQueue, f13_arg0.ticketMachine, {
		messageType = LUI.UIMessageQueue.MessageType.TicketMachine,
		dataSourcesFrom = {
			tickets = DataSources.inGame.CP.zombies.ticketsDispersedQueue.tickets,
			push = DataSources.inGame.CP.zombies.ticketsDispersedQueue.push
		},
		dataSourcesTo = {
			tickets = DataSources.inGame.CP.zombies.ticketsDispersed
		}
	} )
	LUI.UIMessageQueue.AddWidget( f13_arg0.splashMessageQueue, f13_arg0.powerupActivated, {
		messageType = LUI.UIMessageQueue.MessageType.PowerupActivated,
		dataSourcesFrom = {
			activated = DataSources.inGame.CP.zombies.powerups.queue.powerupActivated,
			push = DataSources.inGame.CP.zombies.powerups.queue.push
		},
		dataSourcesTo = {
			activated = DataSources.inGame.CP.zombies.powerups.powerupActivated
		}
	} )
	LUI.UIMessageQueue.AddWidget( f13_arg0.splashMessageQueue, f13_arg0.challengeSplash, {
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

