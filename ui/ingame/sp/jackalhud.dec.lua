LUI.JackalHUD = LUI.Class( LUI.HUD )
LUI.JackalHUD.init = function ( f1_arg0, f1_arg1 )
	Engine.MeasureResourceEventStart( "LUI.JackalHUD.init", "widget" )
	LUI.JackalHUD.super.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "JackalHUD"
	f1_arg0.deathHint = f1_arg0:AddWidget( "DeathHint", {
		scalable = true,
		shakeable = false,
		leftAnchor = false,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		verticalOffset = -50,
		useFullscreenHUDMask = true,
		curvedX = xValue,
		curvedY = yValue
	} )
	f1_arg0.jackalFlightStatus = f1_arg0:AddWidget( "JackalFlightStatusBar", {
		scalable = false,
		shakeable = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		topAnchor = true,
		verticalOffset = 20,
		staggerBuild = true,
		useFullscreenHUDMask = true
	} )
	f1_arg0.fluffMessages = f1_arg0:AddWidget( "FluffMessages", {
		scalable = true,
		shakeable = true,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		horizontalOffset = 80,
		verticalOffset = 190,
		useFullscreenHUDMask = true
	} )
	f1_arg0.fluffMessages:SetYRotation( 50 )
	f1_arg0.jackalLaunchOverlay = f1_arg0:AddWidget( "JackalLaunchOverlay", {
		scalable = false,
		shakeable = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		useFullscreenHUDMask = true,
		buildWhen = DataSources.inGame.jackal.atmoLaunch
	} )
	if not Engine.GetDvarBool( "reveal_ui" ) then
		f1_arg0.jackalTutorialMessages = f1_arg0:AddWidget( "TutorialMessage", {
			scalable = false,
			shakeable = true,
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = true,
			bottomAnchor = false,
			verticalOffset = 210,
			useFullscreenHUDMask = true
		} )
	end
	f1_arg0.jackalThrusters = f1_arg0:AddWidget( "JackalThrusters", {
		scalable = true,
		shakeable = true,
		staggerBuild = true,
		useFullscreenHUDMask = true
	} )
	f1_arg0.binkWindow = f1_arg0:AddWidget( "BinkWindow", {
		scalable = true,
		shakeable = true,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		buildWhen = DataSources.inGame.SP.showBink,
		useFullscreenHUDMask = true
	} )
	f1_arg0.levelTransition = f1_arg0:AddWidget( "LevelTransition", {
		scalable = true,
		shakeable = true,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		curvedX = xValue,
		curvedY = yValue,
		buildWhen = DataSources.inGame.SP.levelTransitionActive
	} )
	f1_arg0.countdownTimer = f1_arg0:AddWidget( "JackalCountdownTimer", {
		scalable = true,
		shakeable = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		topAnchor = true,
		verticalOffset = 110,
		useFullscreenHUDMask = true
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
		curvedX = xValue,
		curvedY = yValue
	} )
	if Engine.TableLookup( CSV.levels.file, CSV.levels.cols.name, Engine.GetDvarString( "ui_mapname" ), CSV.levels.cols.isShipCrib ) == "1" ~= true then
		f1_arg0.missionTimer = f1_arg0:AddWidget( "JackalMissionTimer", {
			scalable = true,
			shakeable = true,
			leftAnchor = false,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			verticalOffset = _1080p * 290,
			horizontalOffset = _1080p * 160,
			useFullscreenHUDMask = true,
			buildWhen = DataSources.inGame.SP.missionCountdown.timer
		} )
		f1_arg0.jackalMessages = f1_arg0:AddWidget( "JackalWarningWithIcon", {
			scalable = false,
			shakeable = true,
			leftAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			topAnchor = true,
			verticalOffset = 115,
			staggerBuild = true,
			useFullscreenHUDMask = true
		} )
		f1_arg0.targetLockon = f1_arg0:AddWidget( "JackalTargetLockon", {
			leftAnchor = true,
			bottomAnchor = false,
			rightAnchor = false,
			topAnchor = true,
			staggerBuild = true,
			useFullscreenHUDMask = true
		} )
		f1_arg0.targetLockonLead = f1_arg0:AddWidget( "JackalTargetLockonLead", {
			staggerBuild = true,
			useFullscreenHUDMask = true
		} )
		f1_arg0.vehicleTargets = f1_arg0:AddWidget( "VehicleTargets", {
			useFullscreenHUDMask = true
		} )
		f1_arg0.targetAnnotations = f1_arg0:AddWidget( "EntityAnnotations", {
			staggerBuild = true,
			useFullscreenHUDMask = true
		} )
		f1_arg0.hitMarker = f1_arg0:AddWidget( "HitMarker", {
			leftAnchor = false,
			rightAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			curvedX = xValue,
			curvedY = yValue,
			staggerBuild = true
		} )
		f1_arg0.overheat = f1_arg0:AddWidget( "JackalOverheatOverlay", {
			scalable = true,
			shakeable = true,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = false,
			bottomAnchor = false,
			staggerBuild = true,
			useFullscreenHUDMask = true
		} )
		f1_arg0.jackalLeavingBattle = f1_arg0:AddWidget( "JackalLeavingBattle", {
			scalable = true,
			shakeable = true,
			leftAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			topAnchor = true,
			verticalOffset = 400,
			staggerBuild = true,
			useFullscreenHUDMask = true
		} )
		f1_arg0.jackalEnemyLockonIndicator = f1_arg0:AddWidget( "JackalEnemyLockonIndicator", {
			scalable = true,
			shakeable = true,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true,
			staggerBuild = true,
			useFullscreenHUDMask = true
		} )
		f1_arg0.shipCallouts = f1_arg0:AddWidget( "JackalShipCallouts", {
			buildWhen = DataSources.inGame.jackal.calloutsActive,
			noCallbackOnSubscribeForBuildWhen = false,
			useFullscreenHUDMask = true
		} )
		f1_arg0.pip = f1_arg0:AddWidget( "PipTopRight", {
			scalable = true,
			shakeable = true,
			leftAnchor = false,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			horizontalOffset = 35,
			verticalOffset = 25,
			curvedX = xValue,
			curvedY = yValue,
			useFullscreenHUDMask = true,
			buildWhen = DataSources.inGame.SP.showPIP
		} )
		f1_arg0.objectiveList = f1_arg0:AddWidget( "JackalObjectiveList", {
			scalable = true,
			shakeable = true,
			leftAnchor = false,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			verticalOffset = _1080p * 340,
			horizontalOffset = _1080p * 160,
			staggerBuild = true,
			useFullscreenHUDMask = true
		} )
		local self = LUI.UIImage.new( {
			material = RegisterMaterial( "hud_jackal_target_mask" ),
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			top = -400,
			bottom = 400,
			left = -400,
			right = 400
		} )
		self.id = "targetMask"
		f1_arg0:addElement( self )
		f1_arg0.targetLockonLead:SetMask( self )
		f1_arg0.lastPlayedAnimations = {}
		f1_arg0.lastPlayedAnimations.JackalCenterReticle = ""
		f1_arg0.lastPlayedAnimations.LockOn = ""
		f1_arg0.lastPlayedAnimations.targetLockon = ""
		f1_arg0:SubscribeToModel( DataSources.inGame.jackal.missleLockPercent:GetModel( f1_arg1 ), function ()
			local f2_local0 = DataSources.inGame.jackal.missleLockPercent:GetValue( f1_arg1 )
			if f2_local0 ~= nil then
				local f2_local1
				if f2_local0 == 1 then
					f2_local1 = SWATCHES.jackal.lockOnMeterFill
					if not f2_local1 then
					
					else
						if f2_local0 == 1 then
							if f1_arg0.lastPlayedAnimations.JackalCenterReticle ~= "has_lock" then
								ACTIONS.AnimateSequence( f1_arg0.jackalReticle._widget.JackalCenterReticle, "has_lock" )
								f1_arg0.lastPlayedAnimations.JackalCenterReticle = "has_lock"
							end
						elseif f2_local0 < 1 and f1_arg0.lastPlayedAnimations.JackalCenterReticle ~= "no_lock" then
							ACTIONS.AnimateSequence( f1_arg0.jackalReticle._widget.JackalCenterReticle, "no_lock" )
							f1_arg0.lastPlayedAnimations.JackalCenterReticle = "no_lock"
						end
						f1_arg0.jackalReticle._widget.JackalCenterReticle.LockOn.RadialProgressBar:SetProgress( f2_local0 )
						f1_arg0.jackalReticle._widget.JackalCenterReticle.LockOn.RadialProgressBar:SetRGBFromTable( f2_local1 )
						if f2_local0 > 0 then
							if f1_arg0.lastPlayedAnimations.LockOn ~= "Intro" then
								ACTIONS.AnimateSequence( f1_arg0.jackalReticle._widget.JackalCenterReticle.LockOn, "Intro" )
								f1_arg0.lastPlayedAnimations.LockOn = "Intro"
							end
						elseif f1_arg0.lastPlayedAnimations.LockOn ~= "Outtro" then
							ACTIONS.AnimateSequence( f1_arg0.jackalReticle._widget.JackalCenterReticle.LockOn, "Outtro" )
							f1_arg0.lastPlayedAnimations.LockOn = "Outtro"
						end
						local f2_local2 = 0
						if f2_local0 == 1 then
							f2_local2 = 1
						elseif f2_local0 == 0 then
							f2_local2 = 0.6
						else
							f2_local2 = 0.75 * (1 + math.sin( (Engine.GetDvarFloat( "spaceshipLockOnBlinkAmount" ) or 12) * (math.pow( f2_local0 + 1, 3 ) - 1) + math.pi / 2 ))
						end
						f1_arg0.targetLockon._widget.ReticleBrackets:SetAlpha( f2_local2 )
						if f2_local0 == 1 then
							if f1_arg0.lastPlayedAnimations.targetLockon ~= "Lockon" then
								ACTIONS.AnimateSequence( f1_arg0.targetLockon._widget, "Lockon" )
								f1_arg0.lastPlayedAnimations.targetLockon = "Lockon"
							end
						elseif f1_arg0.lastPlayedAnimations.targetLockon ~= "Default" then
							ACTIONS.AnimateSequence( f1_arg0.targetLockon._widget, "Default" )
							f1_arg0.lastPlayedAnimations.targetLockon = "Default"
						end
						for f2_local3 = 1, 5, 1 do
							f1_arg0.targetLockonLead._widget.dots[f2_local3].JackalTargetLockonLeadDot0.Square:SetRGBFromTable( f2_local1 )
						end
					end
				end
				f2_local1 = SWATCHES.jackal.stable
			end
		end, true )
	end
	f1_arg0.jackalReticle = f1_arg0:AddWidget( "JackalReticle", {
		scalable = false,
		shakeable = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		staggerBuild = true,
		useFullscreenHUDMask = true
	} )
	f1_arg0:registerOmnvarHandler( "ui_hide_hud", LUI.HUD.UpdateWidgetsVisibility )
	f1_arg0:registerOmnvarHandler( "ui_jackal_deathquote", LUI.HUD.UpdateWidgetsVisibility )
	if Engine.IsSingleplayer() then
		f1_arg0:SubscribeToModel( DataSources.inGame.SP.showBink:GetModel( f1_arg0:getRootController() ), function ()
			LUI.HUD.UpdateWidgetsVisibility( f1_arg0 )
		end )
		f1_arg0:SubscribeToModel( DataSources.inGame.jackal.atmoLaunch:GetModel( f1_arg0:getRootController() ), function ()
			LUI.HUD.UpdateWidgetsVisibility( f1_arg0 )
		end )
	end
	local self = LUI.UIMessageQueue.new( nil, {
		controller = 0,
		nextMessageDelay = 500
	} )
	f1_arg0:addElement( self )
	LUI.UIMessageQueue.AddWidget( self, f1_arg0.jackalMessages, {
		messageType = LUI.UIMessageQueue.MessageType.JackalAutopilot,
		dataSourcesFrom = {
			push = DataSources.inGame.jackal.jackalWarning.autopilotpush
		},
		dataSourcesTo = {}
	} )
	LUI.UIMessageQueue.AddWidget( self, f1_arg0.jackalMessages, {
		messageType = LUI.UIMessageQueue.MessageType.JackalBoosterState,
		dataSourcesFrom = {
			push = DataSources.inGame.jackal.jackalWarning.boosterpush
		},
		dataSourcesTo = {}
	} )
	LUI.UIMessageQueue.AddWidget( self, f1_arg0.jackalMessages, {
		messageType = LUI.UIMessageQueue.MessageType.JackalMissileWarning,
		dataSourcesFrom = {
			push = DataSources.inGame.jackal.jackalWarning.missilepush
		},
		dataSourcesTo = {}
	} )
	LUI.UIMessageQueue.AddWidget( self, f1_arg0.jackalMessages, {
		messageType = LUI.UIMessageQueue.MessageType.JackalLeavingWarning,
		dataSourcesFrom = {
			push = DataSources.inGame.jackal.jackalWarning.leavingareapush
		},
		dataSourcesTo = {}
	} )
	LUI.UIMessageQueue.AddWidget( self, f1_arg0.jackalMessages, {
		messageType = LUI.UIMessageQueue.MessageType.JackalOverheatWarning,
		dataSourcesFrom = {
			push = DataSources.inGame.jackal.jackalWarning.weaponoverheatpush
		},
		dataSourcesTo = {}
	} )
	LUI.UIMessageQueue.AddWidget( self, f1_arg0.jackalMessages, {
		messageType = LUI.UIMessageQueue.MessageType.JackalFlaresWarning,
		dataSourcesFrom = {
			push = DataSources.inGame.jackal.jackalWarning.flarespush
		},
		dataSourcesTo = {}
	} )
	Engine.MeasureResourceEventEnd( "LUI.JackalHUD.init", "widget" )
end

LUI.JackalHUD.GetToggleWidgets = function ( f5_arg0 )
	local f5_local0 = Engine.GetLuiRoot()
	local f5_local1 = {}
	local f5_local2, f5_local3 = nil
	local f5_local4 = AnyActiveMenusInStack( f5_local0 )
	local f5_local5 = Game.GetOmnvar( "ui_hide_hud" ) == true
	local f5_local6 = Game.GetOmnvar( "ui_jackal_deathquote" ) == true
	local f5_local7 = Engine.IsSingleplayer()
	if f5_local7 then
		f5_local7 = DataSources.inGame.SP.showBink:GetValue( f5_arg0:getRootController() )
	end
	local f5_local8 = DataSources.inGame.jackal.atmoLaunch:GetValue( f5_arg0:getRootController() )
	if f5_local4 then
		f5_local2 = true
		f5_local3 = {
			on = "snap",
			off = "snap"
		}
	elseif f5_local5 then
		local f5_local9 = Game.GetOmnvar( "ui_jackal_hud_shutdown" )
		f5_local2 = true
		f5_local3 = {
			on = "snap",
			off = "snap"
		}
		if f5_local9 then
			f5_local3[f5_arg0.jackalReticle] = {
				on = "snap",
				off = "shutdown"
			}
			f5_local3[f5_arg0.jackalFlightStatus] = {
				on = "snap",
				off = "shutdown"
			}
		end
	elseif f5_local6 then
		f5_local2 = true
		f5_local1 = {
			f5_arg0.deathHint
		}
	elseif f5_local7 then
		f5_local2 = true
		f5_local1 = {
			f5_arg0.binkWindow
		}
	elseif f5_local8 then
		f5_local2 = true
		f5_local1 = {
			f5_arg0.jackalFlightStatus,
			f5_arg0.jackalReticle,
			f5_arg0.jackalMessages,
			f5_arg0.jackalTutorialMessages,
			f5_arg0.jackalLaunchOverlay
		}
	else
		f5_local2 = false
	end
	return f5_local1, f5_local2, f5_local3
end

