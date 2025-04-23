LUI.SPHUD = LUI.Class( LUI.HUD )
LUI.SPHUD.init = function ( f1_arg0, f1_arg1 )
	Engine.MeasureResourceEventStart( "LUI.SPHUD.init", "widget" )
	local f1_local0 = Game.GetMapName()
	local f1_local1 = string.match( f1_local0, "^sa_" )
	if not f1_local1 then
		f1_local1 = string.match( f1_local0, "^ja_" )
	end
	local f1_local2 = Engine.TableLookup( CSV.levels.file, CSV.levels.cols.name, Game.GetMapName(), CSV.levels.cols.isShipCrib ) == "1"
	LUI.SPHUD.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "SPHUD"
	local f1_local3 = 0
	local f1_local4 = 0
	f1_arg0:addElement( LUI.SPOverlayHUD.new( f1_arg0.controllerIndex ) )
	f1_arg0.spHUDFrame = f1_arg0:AddWidget( "SPHUDFrame", {
		scalable = true,
		shakeable = true
	} )
	f1_arg0.fragReticles = f1_arg0:AddWidget( "FragReticles", {
		useFullscreenHUDMask = true
	} )
	f1_arg0.binkWindow = f1_arg0:AddWidget( "BinkWindow", {
		scalable = true,
		shakeable = true,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		curvedX = f1_local3,
		curvedY = f1_local4,
		buildWhen = DataSources.inGame.SP.showBink
	} )
	f1_arg0.levelTransition = f1_arg0:AddWidget( "LevelTransition", {
		scalable = true,
		shakeable = true,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		curvedX = f1_local3,
		curvedY = f1_local4,
		buildWhen = DataSources.inGame.SP.levelTransitionActive
	} )
	f1_arg0.vehicleTargets = f1_arg0:AddWidget( "VehicleTargets", {
		curvedX = f1_local3,
		curvedY = f1_local4
	} )
	f1_arg0.vehicleReticle = f1_arg0:AddWidget( "VehicleWeaponReticle", {
		curvedX = f1_local3,
		curvedY = f1_local4
	} )
	f1_arg0.interactiveObjectButtons = f1_arg0:AddWidget( "InteractiveObjectButtons", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		useFullscreenHUDMask = true,
		curvedX = f1_local3,
		curvedY = f1_local4
	} )
	f1_arg0.arCallout = f1_arg0:AddWidget( "SPARCallout", {
		scalable = false,
		shakeable = false,
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		horizontalOffset = 0,
		verticalOffset = 0,
		useFullscreenHUDMask = true,
		curvedX = f1_local3,
		curvedY = f1_local4,
		buildWhen = DataSources.inGame.SP.showARElement,
		gracePeriod = 250
	} )
	if not Engine.GetDvarBool( "reveal_ui" ) then
		f1_arg0.ammoWarning = f1_arg0:AddWidget( "AmmoWarning", {
			scalable = true,
			shakeable = true,
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			verticalOffset = 90,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4
		} )
		f1_arg0.SPWeaponInfoContainer = f1_arg0:AddWidget( "SPWeaponInfoContainer", {
			scalable = true,
			shakeable = true,
			leftAnchor = false,
			topAnchor = false,
			horizontalOffset = 30,
			verticalOffset = 30,
			useFullscreenHUDMask = true,
			curvedX = 0,
			curvedY = 0
		} )
		f1_arg0.hitMarker = f1_arg0:AddWidget( "HitMarker", {
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			useFullscreenHUDMask = false,
			curvedX = f1_local3,
			curvedY = f1_local4
		} )
		f1_arg0.dPad = f1_arg0:AddWidget( "DPadContainer", {
			scalable = true,
			shakeable = true,
			leftAnchor = true,
			rightAnchor = false,
			topAnchor = false,
			bottomAnchor = true,
			horizontalOffset = 30,
			verticalOffset = 30,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4
		} )
		f1_arg0.compass = f1_arg0:AddWidget( "CompassHUD", {
			scalable = true,
			shakeable = true,
			leftAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			topAnchor = true,
			verticalOffset = 10,
			useFullscreenHUDMask = true,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4,
			buildWhen = DataSources.inGame.SP.showCompass
		} )
		f1_arg0.grenadeCook = f1_arg0:AddWidget( "GrenadeCook", {
			scalable = true,
			shakeable = false,
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			verticalOffset = 0,
			horizontalOffset = 0,
			useFullscreenHUDMask = true
		} )
		f1_arg0.interactiveObjectPopup = f1_arg0:AddWidget( "InteractiveObjectPopup", {
			scalable = false,
			shakeable = true,
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = false,
			bottomAnchor = true,
			verticalOffset = 155,
			useFullscreenHUDMask = true
		} )
		f1_arg0.hints = f1_arg0:AddWidget( "Hints", {
			useFullscreenHUDMask = true,
			curvedX = xCurveValue,
			curvedY = yCurveValue
		} )
		f1_arg0.deathHint = f1_arg0:AddWidget( "DeathHint", {
			scalable = true,
			shakeable = false,
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			verticalOffset = -50,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4
		} )
		f1_arg0.tutorialMessage = f1_arg0:AddWidget( "TutorialMessage", {
			scalable = false,
			shakeable = true,
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			verticalOffset = 210,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4
		} )
		f1_arg0.warningMessage = f1_arg0:AddWidget( "WarningMessage", {
			scalable = true,
			shakeable = true,
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			verticalOffset = 40,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4
		} )
		f1_arg0.helmetMeters = f1_arg0:AddWidget( "ContextualHelmetMeters", {
			scalable = true,
			shakeable = true,
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			horizontalOffset = 0,
			verticalOffset = 0,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4
		} )
		f1_arg0.checkpointReachedMessage = f1_arg0:AddWidget( "CheckpointReached", {
			scalable = true,
			shakeable = true,
			leftAnchor = true,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			verticalOffset = 5,
			horizontalOffset = 20,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4
		} )
		f1_arg0.weaponScanned = f1_arg0:AddWidget( "WeaponScanned", {
			scalable = true,
			shakeable = true,
			leftAnchor = false,
			rightAnchor = true,
			topAnchor = false,
			bottomAnchor = true,
			verticalOffset = 250,
			horizontalOffset = 50,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4
		} )
		f1_arg0.weaponScanned:SetYRotation( -30 )
		f1_arg0.minimizedInteractiveObjects = f1_arg0:AddWidget( "MinimizedInteractiveObjects", {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4
		} )
		if f1_local1 then
			f1_arg0.pip = f1_arg0:AddWidget( "ShipAssaultPip", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				useFullscreenHUDMask = true,
				curvedX = f1_local3,
				curvedY = f1_local4,
				buildWhen = DataSources.inGame.SP.showPIP
			} )
		else
			f1_arg0.pip = f1_arg0:AddWidget( "PipTopRight", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				useFullscreenHUDMask = true,
				horizontalOffset = 35,
				verticalOffset = 25,
				curvedX = f1_local3,
				curvedY = f1_local4,
				buildWhen = DataSources.inGame.SP.showPIP
			} )
		end
		if f1_local0 == "europa" then
			f1_arg0.chyron = f1_arg0:AddWidget( "EuropaChyron", {
				scalable = true,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				horizontalOffset = 640,
				verticalOffset = 390,
				useFullscreenHUDMask = true,
				buildWhen = DataSources.inGame.SP.chyron
			} )
			f1_arg0.chyron:SetYRotation( 0 )
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
				curvedX = f1_local3,
				curvedY = f1_local4,
				buildWhen = DataSources.inGame.SP.heist.boostEnergy,
				gracePeriod = 1200
			} )
			f1_arg0.europaSelfDestruct = f1_arg0:AddWidget( "EuropaSelfDestruct", {
				scalable = true,
				shakeable = true,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				verticalOffset = 100,
				horizontalOffset = 60,
				useFullscreenHUDMask = true,
				curvedX = f1_local3,
				curvedY = f1_local4,
				buildWhen = DataSources.inGame.SP.europaSelfDestruct
			} )
		elseif f1_local0 == "heist" then
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
				curvedX = f1_local3,
				curvedY = f1_local4,
				buildWhen = DataSources.inGame.SP.heist.boostEnergy,
				gracePeriod = 1200
			} )
		elseif f1_local0 == "yard" then
			f1_arg0.epilogueLines = f1_arg0:AddWidget( "EpilogueLines", {
				scalable = true,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				horizontalOffset = 80,
				verticalOffset = 440,
				useFullscreenHUDMask = true,
				buildWhen = DataSources.inGame.SP.shipCrib.epilogueLinesShow
			} )
		elseif f1_local0 == "phstreets" then
			f1_arg0.HVTSelfDestruct = f1_arg0:AddWidget( "HVTSelfDestructTimer", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				verticalOffset = 40,
				horizontalOffset = 0,
				useFullscreenHUDMask = false,
				buildWhen = DataSources.inGame.SP.pearlHarbor.hvtSelfDestruct
			} )
		elseif f1_local0 == "sa_assassination" then
			f1_arg0.assassinationDisguise = f1_arg0:AddWidget( "DisguiseSideBars", {
				scalable = false,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				verticalOffset = 0,
				horizontalOffset = 0,
				useFullscreenHUDMask = true,
				curvedX = f1_local3,
				curvedY = f1_local4,
				buildWhen = DataSources.inGame.SP.assassination.disguiseShow
			} )
		elseif f1_local0 == "sa_wounded" then
			f1_arg0.woundedLifeSupportHackReady = f1_arg0:AddWidget( "LifeSupportHackReady", {
				scalable = true,
				shakeable = true,
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = true,
				verticalOffset = 150,
				horizontalOffset = 90,
				useFullscreenHUDMask = true,
				curvedX = f1_local3,
				curvedY = f1_local4,
				buildWhen = DataSources.inGame.SP.wounded.lifeSupportHackReadyShow
			} )
			f1_arg0.woundedLifeSupportHackReady:SetYRotation( 30 )
			f1_arg0.woundedLifeSupportDisabled = f1_arg0:AddWidget( "LifeSupportDisabled", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = true,
				topAnchor = false,
				bottomAnchor = false,
				verticalOffset = 0,
				horizontalOffset = 20,
				useFullscreenHUDMask = true,
				curvedX = f1_local3,
				curvedY = f1_local4,
				buildWhen = DataSources.inGame.SP.wounded.lifeSupportDisabledShow
			} )
		end
		f1_arg0.radiotransmitter = f1_arg0:AddWidget( "RadioTransmitter", {
			scalable = true,
			shakeable = true,
			leftAnchor = false,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			verticalOffset = 187,
			horizontalOffset = 32
		} )
		f1_arg0.movementMeter = f1_arg0:AddWidget( "MovementMeter", {
			scalable = true,
			shakeable = true,
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			horizontalOffset = 0,
			verticalOffset = 112,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4,
			buildWhen = DataSources.inGame.player.displayMovementEnergy,
			gracePeriod = 1200
		} )
		f1_arg0.abilities = f1_arg0:AddWidget( "SPPlayerAbilities", {
			scalable = true,
			shakeable = true,
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = false,
			horizontalOffset = 0,
			verticalOffset = 5,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4
		} )
		f1_arg0.fluffMessages = f1_arg0:AddWidget( "FluffMessages", {
			scalable = true,
			shakeable = true,
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			horizontalOffset = 80,
			verticalOffset = 100,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4
		} )
		f1_arg0.fluffMessages:SetYRotation( 30 )
		f1_arg0.droneWidget = f1_arg0:AddWidget( "DroneList", {
			scalable = true,
			shakeable = true,
			leftAnchor = false,
			rightAnchor = true,
			topAnchor = false,
			bottomAnchor = false,
			horizontalOffset = 60,
			verticalOffset = 0,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4
		} )
		f1_arg0.droneReticles = f1_arg0:AddWidget( "DroneReticles", {
			useFullscreenHUDMask = true
		} )
		f1_arg0.flashFade = f1_arg0:AddWidget( "FlashFade" )
		if not f1_local2 and f1_local0 ~= "vr_firing_range" then
			f1_arg0.threatMeter = f1_arg0:AddWidget( "ThreatMeter", {
				scalable = false,
				shakeable = false,
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				horizontalOffset = 0,
				verticalOffset = 0,
				useFullscreenHUDMask = true,
				curvedX = f1_local3,
				curvedY = f1_local4
			} )
			f1_arg0.hacking = f1_arg0:AddWidget( "HackingHud", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				verticalOffset = 100,
				useFullscreenHUDMask = true,
				curvedX = f1_local3,
				curvedY = f1_local4,
				buildWhen = DataSources.inGame.SP.showHack,
				gracePeriod = 250
			} )
			f1_arg0.getToCover = f1_arg0:AddWidget( "GetToCover", {
				scalable = true,
				shakeable = true,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				verticalOffset = -70,
				horizontalOffset = 0
			} )
			f1_arg0.hackingTerminal = f1_arg0:AddWidget( "HackTerminalWrapper1", {
				leftAnchor = false,
				topAnchor = false,
				rightAnchor = false,
				leftAnchor = false
			} )
			if f1_local0 == "sa_wounded" then
				f1_arg0.hackingTerminal2 = f1_arg0:AddWidget( "HackTerminalWrapper2", {
					leftAnchor = false,
					topAnchor = false,
					rightAnchor = false,
					leftAnchor = false
				} )
			end
		end
		f1_arg0.upgraded = f1_arg0:AddWidget( "EquipmentUpgraded", {
			scalable = true,
			shakeable = true,
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			horizontalOffset = 80,
			verticalOffset = 100,
			useFullscreenHUDMask = true,
			buildWhen = DataSources.inGame.SP.lootUnlocked,
			gracePeroid = 250
		} )
		f1_arg0.upgraded:SetYRotation( 30 )
		f1_arg0.countdownTimer = f1_arg0:AddWidget( "CountdownTimer", {
			scalable = true,
			shakeable = true,
			leftAnchor = false,
			rightAnchor = true,
			topAnchor = false,
			bottomAnchor = false,
			verticalOffset = -100,
			horizontalOffset = 50,
			useFullscreenHUDMask = true,
			curvedX = f1_local3,
			curvedY = f1_local4,
			buildWhen = DataSources.inGame.SP.missionCountdown.show
		} )
		f1_arg0.countdownTimer:SetXRotation( 15 )
		f1_arg0.countdownTimer:SetYRotation( -70 )
		f1_arg0.countdownTimer:SetZRotation( -5 )
		f1_arg0.lockonTargets = f1_arg0:AddWidget( "LockonTargets", {
			useFullscreenHUDMask = true,
			buildWhen = DataSources.inGame.SP.lockonADS
		} )
	end
	f1_arg0:UpdateWidgetsVisibility()
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.opsMap.active:GetModel( f1_arg1 ), function ( f2_arg0 )
		if DataModel.GetModelValue( f2_arg0 ) then
			LUI.FlowManager.RequestAddMenu( "OpsMap", true, f1_arg1, false, {}, true )
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.weaponScannedUnique:GetModel( f1_arg1 ), function ( f3_arg0 )
		local f3_local0 = DataModel.GetModelValue( f3_arg0 )
		if f3_local0 and f3_local0 ~= "none" then
			LUI.FlowManager.RequestAddMenu( "WeaponScannedUnique", true, f1_arg1, false, {}, true )
		end
	end )
	f1_arg0:registerOmnvarHandler( "ui_options_menu", function ( f4_arg0, f4_arg1 )
		f4_arg0:OpenMenuByScriptRequest( f4_arg1.value )
	end )
	f1_arg0:registerOmnvarHandler( "ui_hide_hud", LUI.HUD.UpdateWidgetsVisibility )
	f1_arg0:RegisterOmnvarMenuOpenHandler( "ui_terminal_invoke", "CaptainsComputerMenu" )
	f1_arg0:RegisterOmnvarMenuOpenHandler( "ui_most_wanted_board", "MostWantedCardsBoard" )
	f1_arg0:RegisterOmnvarMenuOpenHandler( "ui_lounge_invoke", "LoungeHud" )
	f1_arg0:RegisterOmnvarMenuOpenHandler( "ui_open_loadout_menu", "SPLoadouts", true )
	f1_arg0:RegisterOmnvarMenuOpenHandler( "ui_lounge_record_invoke", "JackalDiagMenu" )
	f1_arg0:RegisterOmnvarMenuOpenHandler( "ui_jackal_hot_landing", "JackalDiagMenuKeyboard" )
	f1_arg0:RegisterOmnvarMenuOpenHandler( "ui_kleenex_popup", "KleenexPopup" )
	f1_arg0:RegisterOmnvarMenuOpenHandler( "ui_shiplog", "ShipAssaultShipLog" )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.hideWeaponInfo:GetModel( f1_arg0:getRootController() ), function ()
		LUI.HUD.UpdateWidgetsVisibility( f1_arg0 )
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.HUD.overlay.active:GetModel( f1_arg0:getRootController() ), function ()
		LUI.HUD.UpdateWidgetsVisibility( f1_arg0 )
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.name:GetModel( f1_arg0:getRootController() ), function ()
		LUI.HUD.UpdateWidgetsVisibility( f1_arg0 )
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.showBink:GetModel( f1_arg0:getRootController() ), function ()
		LUI.HUD.UpdateWidgetsVisibility( f1_arg0 )
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.offhandShieldInUse:GetModel( f1_arg0:getRootController() ), function ()
		LUI.HUD.UpdateWidgetsVisibility( f1_arg0 )
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.weaponScanned:GetModel( f1_arg0:getRootController() ), function ()
		LUI.HUD.UpdateWidgetsVisibility( f1_arg0 )
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.hudTintColor:GetModel( f1_arg1 ), function ( f11_arg0 )
		local f11_local0 = DataModel.GetModelValue( f11_arg0 )
		f1_arg0.ammoWarning:SetRGBFromInt( f11_local0 )
		f1_arg0.SPWeaponInfoContainer:SetRGBFromInt( f11_local0 )
		f1_arg0.hitMarker:SetRGBFromInt( f11_local0 )
		f1_arg0.dPad:SetRGBFromInt( f11_local0 )
		f1_arg0.compass:SetRGBFromInt( f11_local0 )
		f1_arg0.grenadeCook:SetRGBFromInt( f11_local0 )
		f1_arg0.interactiveObjectPopup:SetRGBFromInt( f11_local0 )
		f1_arg0.checkpointReachedMessage:SetRGBFromInt( f11_local0 )
		f1_arg0.movementMeter:SetRGBFromInt( f11_local0 )
		f1_arg0.helmetMeters:SetRGBFromInt( f11_local0 )
		f1_arg0.abilities:SetRGBFromInt( f11_local0 )
		f1_arg0.fluffMessages:SetRGBFromInt( f11_local0 )
		if f1_arg0.assassinationDisguise ~= nil then
			f1_arg0.assassinationDisguise:SetRGBFromInt( f11_local0 )
		end
	end )
	f1_arg0.shakeable:SetParallaxMotionAmount( 1 )
	f1_arg0.currentState = "HelmetOff"
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.helmetState:GetModel( f1_arg1 ), function ( f12_arg0 )
		local f12_local0 = DataModel.GetModelValue( f12_arg0 )
		local f12_local1
		if f12_local0 > 0 then
			f12_local1 = "HelmetOn"
			if not f12_local1 then
			
			else
				local f12_local2 = 200
				local f12_local3 = 500
				if f1_arg0.currentState ~= f12_local1 then
					f1_arg0.currentState = f12_local1
					if f12_local0 == 0 then
						f1_arg0:SetScale( 0, 0 )
						f1_arg0:SetScale( -0.5, f12_local2, LUI.EASING.inBack )
						f1_arg0:SetAlpha( 1 )
						f1_arg0:SetAlpha( 0, f12_local2 )
						local f12_local4 = f1_arg0:Wait( f12_local3 )
						f12_local4.onComplete = function ()
							f1_arg0:SetScale( 0, 0 )
							f1_arg0:SetAlpha( 1, f12_local2 )
						end
						
					else
						f1_arg0:SetScale( -0.5, 0 )
						f1_arg0:SetScale( 0, f12_local2, LUI.EASING.outBack )
						f1_arg0:SetAlpha( 0 )
						f1_arg0:SetAlpha( 1, f12_local2 )
					end
				end
			end
		end
		f12_local1 = "HelmetOff"
	end )
	Engine.MeasureResourceEventEnd( "LUI.SPHUD.init", "widget" )
end

LUI.SPHUD.GetToggleWidgets = function ( f14_arg0 )
	local f14_local0 = Engine.GetLuiRoot()
	local f14_local1 = {}
	local f14_local2 = f14_arg0.controllerIndex
	local f14_local3, f14_local4 = nil
	local f14_local5 = AnyActiveMenusInStack( f14_local0 )
	local f14_local6 = DataSources.inGame.player.currentWeapon.hideWeaponInfo:GetValue( f14_local2 )
	local f14_local7 = DataSources.inGame.HUD.overlay.active:GetValue( f14_local2 )
	local f14_local8 = DataSources.inGame.player.currentWeapon.name:GetValue( f14_local2 )
	local f14_local9 = DataSources.inGame.SP.showBink:GetValue( f14_local2 )
	local f14_local10 = DataSources.inGame.SP.offhandShieldInUse:GetValue( f14_local2 )
	local f14_local11 = DataSources.inGame.SP.weaponScanned:GetValue( f14_local2 )
	local f14_local12 = Game.GetOmnvar( "ui_hide_hud" ) == true
	local f14_local13 = Game.GetOmnvar( "ui_player_dead" ) == true
	local f14_local14 = Game.GetOmnvar( "ui_hud_hidden_by_timer" ) == true
	if f14_local5 then
		f14_local3 = true
		f14_local4 = {
			on = "snap",
			off = "snap"
		}
	elseif f14_local12 then
		f14_local3 = true
		f14_local1 = {
			f14_arg0.interactiveObjectButtons,
			f14_arg0.tutorialMessage
		}
	elseif f14_local7 then
		f14_local3 = true
		f14_local1 = {
			f14_arg0.tutorialMessage,
			f14_arg0.deathHint,
			f14_arg0.flashFade,
			f14_arg0.arCallout,
			f14_arg0.interactiveObjectButtons,
			f14_arg0.minimizedInteractiveObjects
		}
	elseif f14_local8 == "apc_target_designator" then
		f14_local3 = true
		f14_local1 = {
			f14_arg0.tutorialMessage,
			f14_arg0.flashFade
		}
	elseif f14_local6 then
		f14_local3 = false
		f14_local1 = {
			f14_arg0.SPWeaponInfoContainer,
			f14_arg0.ammoWarning,
			f14_arg0.abilities,
			f14_arg0.dPad
		}
		if not f14_local14 then
			f14_local1[#f14_local1 + 1] = f14_arg0.compass
		end
	elseif f14_local9 then
		f14_local3 = true
		f14_local1 = {
			f14_arg0.binkWindow
		}
	elseif f14_local10 then
		f14_local3 = false
		f14_local1 = {
			f14_arg0.abilities
		}
	elseif f14_local11 ~= "none" then
		f14_local3 = false
		f14_local1 = {
			f14_arg0.countdownTimer,
			f14_arg0.droneWidget
		}
	else
		f14_local3 = false
	end
	if f14_local13 and not f14_local3 then
		f14_local1[#f14_local1 + 1] = f14_arg0.movementMeter
	end
	return f14_local1, f14_local3, f14_local4
end

