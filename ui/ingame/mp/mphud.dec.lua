LUI.MPHUD = LUI.Class( LUI.HUD )
local f0_local0 = function ( f1_arg0 )
	DataSources.inGame.MP.splashes.localPlayer.headerAlpha:SetValue( f1_arg0, 0 )
	DataSources.inGame.MP.splashes.localPlayer.bodyAlpha:SetValue( f1_arg0, 0 )
	DataSources.inGame.MP.splashes.globalPlayer.headerAlpha:SetValue( f1_arg0, 0 )
	DataSources.inGame.MP.splashes.globalPlayer.bodyAlpha:SetValue( f1_arg0, 0 )
	DataSources.inGame.MP.awardEvents:ClearContent( f1_arg0 )
	DataSources.inGame.MP.scoreEvents:ClearContent( f1_arg0 )
end

LUI.MPHUD.init = function ( f2_arg0, f2_arg1 )
	Engine.MeasureResourceEventStart( "LUI.MPHUD.init", "widget" )
	LUI.MPHUD.super.init( f2_arg0, f2_arg1 )
	f2_arg0.id = "MPHUD"
	f0_local0( f2_arg1 )
	local f2_local0 = 0
	local f2_local1 = 0
	local f2_local2 = GameX.IsSplitscreen()
	f2_arg0:AddOverlay( LUI.MPOverlayHUD.new( f2_arg0.controllerIndex ) )
	f2_arg0.oldOverlay = f2_arg0:AddWidget( "overlayHudDef" )
	local f2_local3 = Engine.GetDvarString( "ui_gametype" )
	f2_arg0.killCam = f2_arg0:AddWidget( "Killcam", {
		useFullscreenHUDMask = true
	} )
	f2_arg0.preKillcamPlayerCard = f2_arg0:AddWidget( "PreKillcamPlayerCard", {
		useFullscreenHUDMask = true,
		buildWhen = DataSources.inGame.MP.killcam.killedby.validKiller
	} )
	local f2_local4
	if f2_local2 then
		f2_local4 = -30
		if not f2_local4 then
		
		else
			f2_arg0.spectator = f2_arg0:AddWidget( "Spectating", {
				scalable = true,
				shakeable = false,
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = false,
				bottomAnchor = false,
				verticalOffset = f2_local4,
				useFullscreenHUDMask = false
			} )
			f2_arg0.ringRadar = f2_arg0:AddWidget( "ringRadarDef", {
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = true,
				verticalOffset = 110,
				useFullscreenHUDMask = true
			} )
			f2_arg0.edgeGlow = f2_arg0:AddWidget( "EdgeGlowContainer", {
				scalable = false,
				shakeable = false,
				useFullscreenHUDMask = true
			} )
			f2_arg0.damageOverlay = f2_arg0:AddWidget( "DamageOverlay", {
				scalable = false,
				shakeable = false,
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = true,
				useFullscreenHUDMask = false
			} )
			f2_arg0.outOfBounds = f2_arg0:AddWidget( "OutOfBoundsCountdown", {
				scalable = false,
				shakeable = false,
				leftAnchor = false,
				rightAnchor = false,
				topAnchor = false,
				bottomAnchor = false,
				useFullscreenHUDMask = false,
				buildWhen = DataSources.inGame.MP.outOfBoundsCountdownActive
			} )
			if not f2_local2 then
				f2_arg0.talkersList = f2_arg0:AddWidget( "TalkersList", {
					scalable = true,
					shakeable = true,
					topAnchor = false,
					bottomAnchor = true,
					leftAnchor = true,
					rightAnchor = false,
					verticalOffset = 100,
					horizontalOffset = 0
				} )
			end
			f2_arg0.thermalVision = f2_arg0:AddWidget( "ThermalVision", {} )
			f2_arg0.matchStart = f2_arg0:AddWidget( "matchStartHudDef", {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = false,
				bottomAnchor = false,
				useFullscreenHUDMask = true
			} )
			f2_arg0.matchStartObjective = f2_arg0:AddWidget( "matchStartObjectiveHudDef", {
				leftAnchor = true,
				rightAnchor = true,
				topAnchor = true,
				bottomAnchor = false,
				useFullscreenHUDMask = true
			} )
			local f2_local5
			if f2_local2 then
				f2_local5 = 10
				if not f2_local5 then
				
				else
					f2_arg0.minimap = f2_arg0:AddWidget( "Minimap", {
						rightAnchor = false,
						bottomAnchor = false,
						scalable = true,
						shakeable = true,
						horizontalOffset = 70,
						verticalOffset = f2_local5,
						useFullscreenHUDMask = true
					} )
					f2_arg0.minimap:SetXRotation( 15 * MP.SplitScreenRotModifier )
					f2_arg0.minimap:SetYRotation( 25 * MP.SplitScreenRotModifier )
					f2_arg0.minimap:SetZRotation( 0 * MP.SplitScreenRotModifier )
					local f2_local6
					if f2_local2 then
						f2_local6 = -18
						if not f2_local6 then
						
						else
							f2_arg0.teamScores = f2_arg0:AddWidget( "MatchStatus", {
								scalable = true,
								shakeable = true,
								rightAnchor = false,
								topAnchor = false,
								horizontalOffset = 50,
								verticalOffset = f2_local6,
								useFullscreenHUDMask = true
							} )
							f2_arg0.teamScores:SetXRotation( -35 * MP.SplitScreenRotModifier )
							f2_arg0.teamScores:SetYRotation( 70 * MP.SplitScreenRotModifier )
							f2_arg0.teamScores:SetZRotation( -14 * MP.SplitScreenRotModifier )
							f2_arg0.netStatsIcons = f2_arg0:AddWidget( "NetStatsIcons", {
								scalable = true,
								shakeable = false,
								leftAnchor = true,
								rightAnchor = false,
								topAnchor = false,
								bottomAnchor = false,
								verticalOffset = 0,
								horizontalOffset = 10
							} )
							if Engine.GetDvarBool( "killswitch_net_health_dev" ) ~= true then
								f2_arg0.netStatsDev = f2_arg0:AddWidget( "NetStatsDev", {
									scalable = true,
									shakeable = false,
									leftAnchor = false,
									rightAnchor = true,
									topAnchor = true,
									bottomAnchor = false,
									verticalOffset = 5,
									horizontalOffset = 5
								} )
							end
							f2_arg0.hitMarker = f2_arg0:AddWidget( "HitMarker", {
								leftAnchor = false,
								rightAnchor = false,
								topAnchor = false,
								bottomAnchor = false,
								useFullscreenHUDMask = false
							} )
							f2_arg0.hitMarkerIcon = f2_arg0:AddWidget( "HitMarkerIcon", {
								leftAnchor = false,
								rightAnchor = false,
								topAnchor = false,
								bottomAnchor = false,
								horizontalOffset = 40,
								verticalOffset = 35,
								useFullscreenHUDMask = true
							} )
							f2_arg0.gameMessages = f2_arg0:AddWidget( "gameMessageHudDef", {
								leftAnchor = false,
								rightAnchor = false,
								topAnchor = true,
								bottomAnchor = false,
								verticalOffset = 200,
								useFullscreenHUDMask = true
							} )
							if not CONDITIONS.ShouldHideButtonPrompts() then
								f2_arg0.hints = f2_arg0:AddWidget( "Hints", {
									useFullscreenHUDMask = true
								} )
								local f2_local7
								if f2_local2 then
									f2_local7 = 45
									if not f2_local7 then
									
									else
										f2_arg0.interactiveObjectPopup = f2_arg0:AddWidget( "InteractiveObjectPopup", {
											scalable = false,
											shakeable = false,
											leftAnchor = false,
											rightAnchor = false,
											topAnchor = false,
											bottomAnchor = true,
											verticalOffset = f2_local7,
											useFullscreenHUDMask = true
										} )
										f2_arg0.ammoWarning = f2_arg0:AddWidget( "AmmoWarning", {
											scalable = true,
											shakeable = true,
											topAnchor = false,
											bottomAnchor = false,
											leftAnchor = false,
											rightAnchor = false,
											verticalOffset = 90,
											useFullscreenHUDMask = true
										} )
									end
								end
								f2_local7 = 140
							end
							f2_arg0.iconType = f2_arg0:AddWidget( "hudIconTypeHudDef", {
								useFullscreenHUDMask = true
							} )
							f2_arg0.killedByLootWeaponNotification = f2_arg0:AddWidget( "KilledByLootNotificationContainer", {
								useFullscreenHUDMask = true
							} )
							local f2_local7
							if f2_local2 then
								f2_local7 = 100
								if not f2_local7 then
								
								else
									local f2_local8
									if f2_local2 then
										f2_local8 = -0.5
										if not f2_local8 then
										
										else
											f2_arg0.counterUAVJam = f2_arg0:AddWidget( "CounterUAVJam", {
												scalable = true,
												shakeable = true,
												topAnchor = false,
												bottomAnchor = true,
												leftAnchor = false,
												rightAnchor = false,
												verticalOffset = f2_local7,
												useFullscreenHUDMask = true
											} )
											f2_arg0.counterUAVJam:SetScale( f2_local8 )
											f2_arg0.lowHealth = f2_arg0:AddWidget( "lowHealthHudDef" )
											f2_arg0.fluffCurve = f2_arg0:AddWidget( "HudFluffCurve", {
												shakeable = true
											} )
											f2_arg0.obituaries = f2_arg0:AddWidget( "obituaryHudDef", {
												scalable = true,
												useFullscreenHUDMask = true
											} )
											local f2_local9
											if f2_local2 then
												f2_local9 = 6
												if not f2_local9 then
												
												else
													local f2_local10
													if f2_local2 then
														f2_local10 = 120
														if not f2_local10 then
														
														else
															f2_arg0.pointsPopup = f2_arg0:AddWidget( "PointsPopup", {
																leftAnchor = false,
																rightAnchor = false,
																topAnchor = false,
																bottomAnchor = false,
																verticalOffset = f2_local9,
																horizontalOffset = f2_local10,
																useFullscreenHUDMask = true
															} )
															local f2_local11
															if f2_local2 then
																f2_local11 = 0
																if not f2_local11 then
																
																else
																	f2_arg0.localPlayerSplashes = f2_arg0:AddWidget( "LocalPlayerSplash", {
																		scalable = true,
																		shakeable = false,
																		useFullscreenHUDMask = true,
																		leftAnchor = false,
																		rightAnchor = false,
																		topAnchor = true,
																		bottomAnchor = false,
																		verticalOffset = f2_local11,
																		horizontalOffset = 0
																	} )
																	local f2_local12
																	if f2_local2 then
																		f2_local12 = 10
																		if not f2_local12 then
																		
																		else
																			f2_arg0.globalPlayerSplashes = f2_arg0:AddWidget( "GlobalPlayerSplash", {
																				scalable = true,
																				shakeable = false,
																				useFullscreenHUDMask = true,
																				leftAnchor = false,
																				rightAnchor = true,
																				topAnchor = true,
																				bottomAnchor = false,
																				verticalOffset = f2_local12,
																				horizontalOffset = 60
																			} )
																			f2_arg0.globalPlayerSplashes:SetScale( -0.15 )
																			f2_arg0.globalPlayerSplashes:SetXRotation( 15 * MP.SplitScreenRotModifier )
																			f2_arg0.globalPlayerSplashes:SetYRotation( -25 * MP.SplitScreenRotModifier )
																			f2_arg0.globalPlayerSplashes:SetZRotation( 0 * MP.SplitScreenRotModifier )
																			local f2_local13 = 20
																			if f2_local2 then
																				if Engine.IsActiveLocalClientPrimary( f2_arg1 ) then
																					f2_local13 = -5
																				else
																					f2_local13 = 0
																				end
																			end
																			f2_arg0.MPWeaponInfoContainer = f2_arg0:AddWidget( "MPWeaponInfoContainer", {
																				scalable = true,
																				shakeable = true,
																				leftAnchor = false,
																				topAnchor = false,
																				horizontalOffset = 50,
																				verticalOffset = f2_local13,
																				useFullscreenHUDMask = true
																			} )
																			f2_arg0.MPWeaponInfoContainer:SetXRotation( -35 * MP.SplitScreenRotModifier )
																			f2_arg0.MPWeaponInfoContainer:SetYRotation( -70 * MP.SplitScreenRotModifier )
																			f2_arg0.MPWeaponInfoContainer:SetZRotation( 14 * MP.SplitScreenRotModifier )
																			local f2_local14 = 130
																			if f2_local2 then
																				if Engine.IsActiveLocalClientPrimary( f2_arg1 ) then
																					f2_local14 = 115
																				else
																					f2_local14 = 120
																				end
																			end
																			f2_arg0.scorestreaks = f2_arg0:AddWidget( "StreakList", {
																				scalable = true,
																				shakeable = true,
																				leftAnchor = false,
																				topAnchor = false,
																				horizontalOffset = 60,
																				verticalOffset = f2_local14,
																				useFullscreenHUDMask = true
																			} )
																			f2_arg0.scorestreaks:SetXRotation( -35 * MP.SplitScreenRotModifier )
																			f2_arg0.scorestreaks:SetYRotation( -70 * MP.SplitScreenRotModifier )
																			f2_arg0.scorestreaks:SetZRotation( 10 * MP.SplitScreenRotModifier )
																			f2_arg0.nukeTimer = f2_arg0:AddWidget( "NukeCountdown", {
																				scalable = true,
																				shakeable = true,
																				rightAnchor = false,
																				topAnchor = false,
																				horizontalOffset = 275,
																				verticalOffset = 50,
																				useFullscreenHUDMask = true,
																				buildWhen = DataSources.inGame.MP.scorestreakHuds.showNukeCountdown
																			} )
																			f2_arg0.streakReadyNotification = f2_arg0:AddWidget( "StreakReadyNotification", {
																				scalable = true,
																				shakeable = false,
																				leftAnchor = false,
																				rightAnchor = false,
																				topAnchor = false,
																				bottomAnchor = true,
																				verticalOffset = 40,
																				useFullscreenHUDMask = true
																			} )
																			local f2_local15
																			if f2_local2 then
																				f2_local15 = 100
																				if not f2_local15 then
																				
																				else
																					local f2_local16
																					if f2_local2 then
																						f2_local16 = 0
																						if not f2_local16 then
																						
																						else
																							f2_arg0.perksList = f2_arg0:AddWidget( "PerksHUDWidget", {
																								scalable = true,
																								shakeable = true,
																								leftAnchor = false,
																								rightAnchor = true,
																								topAnchor = false,
																								bottomAnchor = false,
																								horizontalOffset = f2_local15,
																								verticalOffset = f2_local16,
																								useFullscreenHUDMask = true
																							} )
																							local f2_local17 = f2_arg0.perksList
																							local f2_local18 = f2_local17
																							f2_local17 = f2_local17.SetScale
																							local f2_local19
																							if f2_local2 then
																								f2_local19 = -0.25
																								if not f2_local19 then
																								
																								else
																									f2_local17( f2_local18, f2_local19 )
																									f2_arg0.grenadeCook = f2_arg0:AddWidget( "GrenadeCook", {
																										scalable = false,
																										shakeable = false,
																										leftAnchor = false,
																										rightAnchor = false,
																										topAnchor = false,
																										bottomAnchor = false,
																										verticalOffset = 0,
																										horizontalOffset = 0,
																										useFullscreenHUDMask = true
																									} )
																									if IsPublicMatch() then
																										if f2_local2 then
																											f2_local17 = 10
																											if not f2_local17 then
																											
																											else
																												f2_arg0.intel = f2_arg0:AddWidget( "Intel", {
																													scalable = true,
																													shakeable = true,
																													leftAnchor = false,
																													rightAnchor = true,
																													topAnchor = true,
																													bottomAnchor = false,
																													verticalOffset = f2_local17,
																													horizontalOffset = 60,
																													useFullscreenHUDMask = true,
																													options = {
																														isHUDWidget = true
																													}
																												} )
																												f2_arg0.intel:SetXRotation( 15 * MP.SplitScreenRotModifier )
																												f2_arg0.intel:SetYRotation( -25 * MP.SplitScreenRotModifier )
																												f2_arg0.intel:SetZRotation( 0 * MP.SplitScreenRotModifier )
																											end
																										end
																										f2_local17 = 40
																									end
																									if f2_local2 then
																										f2_local17 = 10
																										if not f2_local17 then
																										
																										else
																											f2_arg0.awardFeed = f2_arg0:AddWidget( "AwardFeed", {
																												scalable = true,
																												shakeable = false,
																												leftAnchor = false,
																												rightAnchor = false,
																												topAnchor = true,
																												bottomAnchor = false,
																												verticalOffset = f2_local17
																											} )
																											f2_arg0.mpErrorMessage = f2_arg0:AddWidget( "MPErrorMessage", {
																												scalable = true,
																												shakeable = true,
																												leftAnchor = false,
																												rightAnchor = false,
																												topAnchor = true,
																												bottomAnchor = false,
																												verticalOffset = 230
																											} )
																											f2_arg0.miscMessages = f2_arg0:AddWidget( "MiscMessagesContainer", {
																												scalable = true,
																												shakeable = true,
																												leftAnchor = false,
																												rightAnchor = true,
																												topAnchor = false,
																												bottomAnchor = true,
																												verticalOffset = 170,
																												horizontalOffset = 190
																											} )
																											f2_arg0.miscMessages:SetXRotation( -35 * MP.SplitScreenRotModifier )
																											f2_arg0.miscMessages:SetYRotation( -65 * MP.SplitScreenRotModifier )
																											f2_arg0.miscMessages:SetZRotation( 12 * MP.SplitScreenRotModifier )
																											f2_arg0.TransponderOutOfRange = f2_arg0:AddWidget( "TransponderOutOfRange", {
																												scalable = true,
																												shakeable = true,
																												leftAnchor = false,
																												rightAnchor = false,
																												topAnchor = false,
																												bottomAnchor = false,
																												verticalOffset = 0,
																												horizontalOffset = 0,
																												useFullscreenHUDMask = true
																											} )
																											f2_arg0.battleSlideFeedback = f2_arg0:AddWidget( "battleslideHudDef", {
																												leftAnchor = false,
																												rightAnchor = false,
																												topAnchor = false,
																												bottomAnchor = false,
																												useFullscreenHUDMask = true
																											} )
																											if f2_local2 then
																												f2_local18 = 70
																												if not f2_local18 then
																												
																												else
																													f2_arg0.dodgeCharges = f2_arg0:AddWidget( "DodgeCharges", {
																														scalable = true,
																														shakeable = true,
																														leftAnchor = false,
																														rightAnchor = false,
																														topAnchor = false,
																														bottomAnchor = false,
																														verticalOffset = f2_local18,
																														horizontalOffset = 0,
																														useFullscreenHUDMask = true
																													} )
																													f2_local19 = f2_arg0.dodgeCharges
																													local f2_local20 = f2_local19
																													f2_local19 = f2_local19.SetScale
																													local f2_local21
																													if f2_local2 then
																														f2_local21 = -0.25
																														if not f2_local21 then
																														
																														else
																															f2_local19( f2_local20, f2_local21 )
																															f2_arg0.killstreakConnection = f2_arg0:AddWidget( "KillstreakConnection", {
																																scalable = true,
																																shakeable = true,
																																leftAnchor = true,
																																rightAnchor = true,
																																topAnchor = true,
																																bottomAnchor = true,
																																useFullscreenHUDMask = false,
																																buildWhen = DataSources.inGame.MP.scorestreakHuds.connectionStateVisible
																															} )
																															f2_arg0.remoteControlSequence = f2_arg0:AddWidget( "RemoteControlMain", {
																																scalable = false,
																																shakeable = false,
																																leftAnchor = false,
																																rightAnchor = false,
																																topAnchor = false,
																																bottomAnchor = false,
																																verticalOffset = 0,
																																horizontalOffset = 0,
																																useFullscreenHUDMask = true
																															} )
																															f2_arg0.objectiveStatusWidgets = {}
																															if f2_local2 then
																																f2_local19 = 110
																																if not f2_local19 then
																																
																																else
																																	if f2_local2 then
																																		f2_local20 = -250
																																		if not f2_local20 then
																																		
																																		else
																																			f2_local21 = f2_local19 - 35
																																			if f2_local3 == "sd" or f2_local3 == "sr" or f2_local3 == "dd" then
																																				local f2_local22 = nil
																																				if f2_local3 == "sd" or f2_local3 == "sr" then
																																					if f2_local2 then
																																						local f2_local23 = 240
																																					end
																																					f2_local22 = f2_local23 or 165
																																				else
																																					if f2_local2 then
																																						local f2_local24 = 95
																																					end
																																					f2_local22 = f2_local24 or 50
																																				end
																																				f2_arg0.bombPlantDefuse = f2_arg0:AddWidget( "ObjectiveProgress", {
																																					scalable = true,
																																					shakeable = false,
																																					leftAnchor = false,
																																					rightAnchor = false,
																																					topAnchor = true,
																																					bottomAnchor = false,
																																					verticalOffset = f2_local21,
																																					horizontalOffset = f2_local20,
																																					useFullscreenHUDMask = true
																																				} )
																																				local self
																																				if f2_local2 then
																																					self = 330
																																					if not self then
																																					
																																					else
																																						local f2_local26
																																						if f2_local2 then
																																							f2_local26 = 100
																																							if not f2_local26 then
																																							
																																							else
																																								f2_arg0.bombInfo = f2_arg0:AddWidget( "BombCarrierIcon", {
																																									scalable = true,
																																									shakeable = true,
																																									leftAnchor = false,
																																									rightAnchor = true,
																																									topAnchor = false,
																																									bottomAnchor = true,
																																									verticalOffset = f2_local26,
																																									horizontalOffset = self,
																																									useFullscreenHUDMask = true
																																								} )
																																								local f2_local27
																																								if f2_local2 then
																																									f2_local27 = 182
																																									if not f2_local27 then
																																									
																																									else
																																										f2_arg0.bombPlantedTimers = f2_arg0:AddWidget( "BombPlantedTimers", {
																																											scalable = true,
																																											shakeable = true,
																																											leftAnchor = true,
																																											rightAnchor = false,
																																											topAnchor = true,
																																											bottomAnchor = false,
																																											verticalOffset = f2_local27,
																																											horizontalOffset = f2_local22,
																																											useFullscreenHUDMask = true
																																										} )
																																										f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.bombPlantDefuse
																																										f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.bombInfo
																																										f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.bombPlantedTimers
																																									end
																																								end
																																								f2_local27 = 239
																																							end
																																						end
																																						f2_local26 = 115
																																					end
																																				end
																																				self = 280
																																			end
																																			f2_arg0.capture = f2_arg0:AddWidget( "GenericProgress", {
																																				scalable = true,
																																				shakeable = false,
																																				leftAnchor = false,
																																				rightAnchor = false,
																																				topAnchor = true,
																																				bottomAnchor = false,
																																				verticalOffset = f2_local19,
																																				horizontalOffset = f2_local20,
																																				useFullscreenHUDMask = true
																																			} )
																																			f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.capture
																																			if f2_local3 == "dom" or f2_local3 == "grind" or f2_local3 == "koth" or f2_local3 == "grnd" or f2_local3 == "siege" then
																																				f2_arg0.captureDom = f2_arg0:AddWidget( "ObjectiveProgress", {
																																					scalable = true,
																																					shakeable = false,
																																					leftAnchor = false,
																																					rightAnchor = false,
																																					topAnchor = true,
																																					bottomAnchor = false,
																																					verticalOffset = f2_local21,
																																					horizontalOffset = f2_local20,
																																					useFullscreenHUDMask = true
																																				} )
																																				f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.captureDom
																																			end
																																			if f2_local3 ~= "sd" and f2_local3 ~= "sr" and f2_local3 ~= "infect" and f2_local3 ~= "siege" and f2_local3 ~= "assault" then
																																				f2_arg0.crankedBombTimer = f2_arg0:AddWidget( "CrankedTimer", {
																																					scalable = true,
																																					shakeable = true,
																																					leftAnchor = true,
																																					rightAnchor = false,
																																					topAnchor = false,
																																					bottomAnchor = true,
																																					verticalOffset = 255,
																																					horizontalOffset = 280,
																																					useFullscreenHUDMask = true
																																				} )
																																				f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.crankedBombTimer
																																			end
																																			if f2_local3 == "ball" or f2_local3 == "tdef" then
																																				if not f2_local2 or not 75 then
																																					local f2_local22 = 65
																																				end
																																				if not f2_local2 or not 188 then
																																					local self = 208
																																				end
																																				if true == Game.GetOmnvar( "ui_uplink_timer_show" ) and f2_local2 then
																																					local f2_local22 = 215
																																					local self = 188
																																				end
																																				f2_arg0.uplinkLocation = f2_arg0:AddWidget( "UplinkLocation", {
																																					scalable = true,
																																					shakeable = true,
																																					leftAnchor = true,
																																					rightAnchor = false,
																																					topAnchor = true,
																																					bottomAnchor = false,
																																					verticalOffset = self,
																																					horizontalOffset = f2_local22,
																																					useFullscreenHUDMask = true
																																				} )
																																				if not f2_local2 or not 75 then
																																					local f2_local26 = 120
																																				end
																																				if f2_local2 and Engine.IsActiveLocalClientPrimary( f2_arg1 ) then
																																					local f2_local26 = 100
																																				end
																																				f2_arg0.uplinkCommandBar = f2_arg0:AddWidget( "UplinkCommandBar", {
																																					scalable = true,
																																					shakeable = true,
																																					leftAnchor = false,
																																					rightAnchor = false,
																																					topAnchor = false,
																																					bottomAnchor = true,
																																					verticalOffset = f2_local26,
																																					horizontalOffset = 0,
																																					useFullscreenHUDMask = true
																																				} )
																																				local f2_local27 = f2_arg0.uplinkCommandBar
																																				local f2_local28 = f2_local27
																																				f2_local27 = f2_local27.SetScale
																																				local f2_local29
																																				if f2_local2 then
																																					f2_local29 = -0.25
																																					if not f2_local29 then
																																					
																																					else
																																						f2_local27( f2_local28, f2_local29 )
																																						if f2_local2 then
																																							f2_local27 = 300
																																							if not f2_local27 then
																																							
																																							else
																																								if not f2_local2 or not 85 then
																																									f2_local28 = 115
																																								end
																																								if f2_local2 and Engine.IsActiveLocalClientPrimary( f2_arg1 ) then
																																									f2_local28 = 80
																																								end
																																								f2_arg0.uplinkBallIcon = f2_arg0:AddWidget( "UplinkBallIcon", {
																																									scalable = true,
																																									shakeable = true,
																																									leftAnchor = false,
																																									rightAnchor = true,
																																									topAnchor = false,
																																									bottomAnchor = true,
																																									verticalOffset = f2_local28,
																																									horizontalOffset = f2_local27,
																																									useFullscreenHUDMask = true
																																								} )
																																								f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.uplinkLocation
																																								f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.uplinkCommandBar
																																								f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.uplinkBallIcon
																																								if true == Game.GetOmnvar( "ui_uplink_timer_show" ) then
																																									if f2_local2 then
																																										f2_local29 = 8
																																										if not f2_local29 then
																																										
																																										else
																																											local f2_local30
																																											if f2_local2 then
																																												f2_local30 = 185
																																												if not f2_local30 then
																																												
																																												else
																																													f2_arg0.uplinkTimer = f2_arg0:AddWidget( "UplinkTimer", {
																																														scalable = true,
																																														shakeable = true,
																																														leftAnchor = true,
																																														rightAnchor = false,
																																														topAnchor = true,
																																														bottomAnchor = false,
																																														verticalOffset = f2_local30,
																																														horizontalOffset = f2_local29,
																																														useFullscreenHUDMask = true
																																													} )
																																													if not f2_local2 or not 130 then
																																														local f2_local31 = 175
																																													end
																																													local f2_local32
																																													if f2_local2 then
																																														f2_local32 = -150
																																														if not f2_local32 then
																																														
																																														else
																																															if f2_local2 and Engine.IsActiveLocalClientPrimary( f2_arg1 ) then
																																																local f2_local31 = 155
																																															end
																																															f2_arg0.uplinkCarrierTimer = f2_arg0:AddWidget( "UplinkCarrierTimer", {
																																																scalable = true,
																																																shakeable = true,
																																																leftAnchor = false,
																																																rightAnchor = false,
																																																topAnchor = false,
																																																bottomAnchor = true,
																																																verticalOffset = f2_local31,
																																																horizontalOffset = f2_local32,
																																																useFullscreenHUDMask = true
																																															} )
																																															f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.uplinkTimer
																																															f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.uplinkCarrierTimer
																																															f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.uplinkCarrierTimer
																																														end
																																													end
																																													f2_local32 = 0
																																												end
																																											end
																																											f2_local30 = 230
																																										end
																																									end
																																									f2_local29 = -5
																																								end
																																							end
																																						end
																																						f2_local27 = 280
																																					end
																																				end
																																				f2_local29 = 0
																																			end
																																			if f2_local3 == "front" then
																																				if not f2_local2 or not 90 then
																																					local f2_local22 = 122
																																				end
																																				local self
																																				if f2_local2 then
																																					self = 295
																																					if not self then
																																					
																																					else
																																						if f2_local2 and Engine.IsActiveLocalClientPrimary( f2_arg1 ) then
																																							local f2_local22 = 85
																																						end
																																						f2_arg0.frontlineImmuneIcon = f2_arg0:AddWidget( "FrontlineImmuneIcon", {
																																							scalable = true,
																																							shakeable = true,
																																							leftAnchor = false,
																																							rightAnchor = true,
																																							topAnchor = false,
																																							bottomAnchor = true,
																																							verticalOffset = f2_local22,
																																							horizontalOffset = self,
																																							useFullscreenHUDMask = true
																																						} )
																																						f2_arg0.frontlineImmuneIcon:SetXRotation( -35 * MP.SplitScreenRotModifier )
																																						f2_arg0.frontlineImmuneIcon:SetYRotation( -70 * MP.SplitScreenRotModifier )
																																						f2_arg0.frontlineImmuneIcon:SetZRotation( 14 * MP.SplitScreenRotModifier )
																																						if not f2_local2 or not 75 then
																																							local f2_local26 = 120
																																						end
																																						if f2_local2 and Engine.IsActiveLocalClientPrimary( f2_arg1 ) then
																																							local f2_local26 = 100
																																						end
																																						f2_arg0.uplinkCommandBar = f2_arg0:AddWidget( "UplinkCommandBar", {
																																							scalable = true,
																																							shakeable = true,
																																							leftAnchor = false,
																																							rightAnchor = false,
																																							topAnchor = false,
																																							bottomAnchor = true,
																																							verticalOffset = f2_local26,
																																							horizontalOffset = 0,
																																							useFullscreenHUDMask = true
																																						} )
																																						local f2_local27 = f2_arg0.uplinkCommandBar
																																						local f2_local28 = f2_local27
																																						f2_local27 = f2_local27.SetScale
																																						local f2_local29
																																						if f2_local2 then
																																							f2_local29 = -0.25
																																							if not f2_local29 then
																																							
																																							else
																																								f2_local27( f2_local28, f2_local29 )
																																								f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.frontlineImmuneIcon
																																								f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.uplinkCommandBar
																																							end
																																						end
																																						f2_local29 = 0
																																					end
																																				end
																																				self = 280
																																			end
																																			if f2_local3 == "koth" or f2_local3 == "grnd" then
																																				local f2_local22
																																				if f2_local2 then
																																					f2_local22 = 180
																																					if not f2_local22 then
																																					
																																					else
																																						local self
																																						if f2_local2 then
																																							self = 85
																																							if not self then
																																							
																																							else
																																								f2_arg0.hardpointStatus = f2_arg0:AddWidget( "HardpointStatus", {
																																									scalable = true,
																																									shakeable = true,
																																									leftAnchor = true,
																																									rightAnchor = false,
																																									topAnchor = true,
																																									bottomAnchor = false,
																																									verticalOffset = f2_local22,
																																									horizontalOffset = self,
																																									useFullscreenHUDMask = true
																																								} )
																																								f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.hardpointStatus
																																							end
																																						end
																																						self = 55
																																					end
																																				end
																																				f2_local22 = 230
																																			end
																																			if f2_local3 == "grind" then
																																				local f2_local22
																																				if f2_local2 then
																																					f2_local22 = 75
																																					if not f2_local22 then
																																					
																																					else
																																						local self
																																						if f2_local2 then
																																							self = 310
																																							if not self then
																																							
																																							else
																																								f2_arg0.grindIcon = f2_arg0:AddWidget( "GrindIcon", {
																																									scalable = true,
																																									shakeable = true,
																																									leftAnchor = false,
																																									rightAnchor = true,
																																									topAnchor = false,
																																									bottomAnchor = true,
																																									verticalOffset = f2_local22,
																																									horizontalOffset = self,
																																									useFullscreenHUDMask = true
																																								} )
																																								f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.grindIcon
																																							end
																																						end
																																						self = 275
																																					end
																																				end
																																				f2_local22 = 108
																																			end
																																			if f2_local3 == "sd" or f2_local3 == "sr" or f2_local3 == "siege" then
																																				local f2_local22
																																				if f2_local2 then
																																					f2_local22 = 180
																																					if not f2_local22 then
																																					
																																					else
																																						local self
																																						if f2_local2 then
																																							self = 105
																																							if not self then
																																							
																																							else
																																								f2_arg0.teamAliveCounter = f2_arg0:AddWidget( "TeamAliveCounter", {
																																									scalable = true,
																																									shakeable = true,
																																									leftAnchor = true,
																																									rightAnchor = false,
																																									topAnchor = true,
																																									bottomAnchor = false,
																																									verticalOffset = f2_local22,
																																									horizontalOffset = self,
																																									useFullscreenHUDMask = true
																																								} )
																																								f2_arg0.teamAliveCounter:SetYRotation( 40 * MP.SplitScreenRotModifier )
																																								f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.teamAliveCounter
																																							end
																																						end
																																						self = 50
																																					end
																																				end
																																				f2_local22 = 230
																																			end
																																			if f2_local3 == "ctf" then
																																				local f2_local22
																																				if f2_local2 then
																																					f2_local22 = 85
																																					if not f2_local22 then
																																					
																																					else
																																						local self
																																						if f2_local2 then
																																							self = 290
																																							if not self then
																																							
																																							else
																																								f2_arg0.flagCarrierIcon = f2_arg0:AddWidget( "FlagCarrierIcon", {
																																									scalable = true,
																																									shakeable = true,
																																									leftAnchor = false,
																																									rightAnchor = true,
																																									topAnchor = false,
																																									bottomAnchor = true,
																																									verticalOffset = f2_local22,
																																									horizontalOffset = self,
																																									useFullscreenHUDMask = true
																																								} )
																																								local f2_local26
																																								if f2_local2 then
																																									f2_local26 = 185
																																									if not f2_local26 then
																																									
																																									else
																																										local f2_local27
																																										if f2_local2 then
																																											f2_local27 = 70
																																											if not f2_local27 then
																																											
																																											else
																																												f2_arg0.flagLocation = f2_arg0:AddWidget( "FlagLocation", {
																																													scalable = true,
																																													shakeable = true,
																																													leftAnchor = true,
																																													rightAnchor = false,
																																													topAnchor = true,
																																													bottomAnchor = false,
																																													verticalOffset = f2_local26,
																																													horizontalOffset = f2_local27,
																																													useFullscreenHUDMask = true
																																												} )
																																												f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.flagCarrierIcon
																																												f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.flagLocation
																																											end
																																										end
																																										f2_local27 = 50
																																									end
																																								end
																																								f2_local26 = 230
																																							end
																																						end
																																						self = 280
																																					end
																																				end
																																				f2_local22 = 115
																																			end
																																			if f2_local3 == "dm" and (not (not MatchRules.IsUsingMatchRulesData() or MatchRules.GetData( "dmData", "aonRules" ) <= 2) or Engine.GetDvarInt( "scr_dm_aonrules" ) > 2) then
																																				f2_arg0.gestureReticle = f2_arg0:AddWidget( "GestureReticle", {
																																					scalable = true,
																																					shakeable = true,
																																					leftAnchor = false,
																																					rightAnchor = false,
																																					topAnchor = false,
																																					bottomAnchor = false
																																				} )
																																				f2_arg0.objectiveStatusWidgets[#f2_arg0.objectiveStatusWidgets + 1] = f2_arg0.gestureReticle
																																			end
																																			local f2_local22
																																			if f2_local2 then
																																				f2_local22 = 112
																																				if not f2_local22 then
																																				
																																				else
																																					f2_arg0.movementMeter = f2_arg0:AddWidget( "MovementMeter", {
																																						scalable = true,
																																						shakeable = true,
																																						topAnchor = false,
																																						bottomAnchor = false,
																																						leftAnchor = false,
																																						rightAnchor = false,
																																						horizontalOffset = 0,
																																						verticalOffset = f2_local22,
																																						useFullscreenHUDMask = true
																																					} )
																																					f2_arg0.CloakChargeProgressMeter = f2_arg0:AddWidget( "CloakChargeProgressMeter", {
																																						scalable = true,
																																						shakeable = true,
																																						leftAnchor = false,
																																						rightAnchor = false,
																																						topAnchor = false,
																																						bottomAnchor = false,
																																						verticalOffset = 270,
																																						horizontalOffset = 0,
																																						useFullscreenHUDMask = true
																																					} )
																																					f2_arg0.HealthScanline = f2_arg0:AddWidget( "HealthScanline", {
																																						scalable = true,
																																						shakeable = true,
																																						leftAnchor = false,
																																						rightAnchor = false,
																																						topAnchor = false,
																																						bottomAnchor = false,
																																						verticalOffset = 0,
																																						horizontalOffset = 0,
																																						useFullscreenHUDMask = true
																																					} )
																																					f2_arg0.ChargeMeleeTarget = f2_arg0:AddWidget( "ChargeMeleeTarget", {
																																						scalable = true,
																																						shakeable = true,
																																						leftAnchor = false,
																																						rightAnchor = false,
																																						topAnchor = false,
																																						bottomAnchor = false,
																																						verticalOffset = 80,
																																						horizontalOffset = 0,
																																						useFullscreenHUDMask = true
																																					} )
																																					if Engine.IsDevelopmentBuild() then
																																						f2_arg0.spawnDebug = f2_arg0:AddWidget( "SpawnDebug", {
																																							shakeable = true,
																																							leftAnchor = false,
																																							rightAnchor = true,
																																							topAnchor = false,
																																							bottomAnchor = true,
																																							horizontalOffset = 60,
																																							verticalOffset = 130,
																																							useFullscreenHUDMask = true
																																						} )
																																					end
																																					f2_arg0:registerOmnvarHandler( "ui_ads_minimap", LUI.HUD.UpdateWidgetsVisibility )
																																					f2_arg0:registerOmnvarHandler( "ui_match_start_countdown", LUI.HUD.UpdateWidgetsVisibility )
																																					f2_arg0:registerOmnvarHandler( "ui_hide_hud", LUI.HUD.UpdateWidgetsVisibility )
																																					f2_arg0:registerOmnvarHandler( "ui_killstreak_connection", LUI.HUD.UpdateWidgetsVisibility )
																																					f2_arg0:registerOmnvarHandler( "ui_using_killstreak_remote", LUI.HUD.UpdateWidgetsVisibility )
																																					f2_arg0:registerOmnvarHandler( "ui_venom_controls", LUI.HUD.UpdateWidgetsVisibility )
																																					f2_arg0:registerOmnvarHandler( "ui_minijackal_controls", LUI.HUD.UpdateWidgetsVisibility )
																																					f2_arg0:registerOmnvarHandler( "ui_predator_missile", LUI.HUD.UpdateWidgetsVisibility )
																																					f2_arg0:registerOmnvarHandler( "ui_out_of_bounds_countdown", LUI.HUD.UpdateWidgetsVisibility )
																																					f2_arg0:registerOmnvarHandler( "ui_show_hardcore_minimap", LUI.HUD.UpdateWidgetsVisibility )
																																					f2_arg0:SubscribeToModel( DataSources.inGame.player.affectedByUAVJam:GetModel( f2_arg1 ), function ()
																																						LUI.HUD.UpdateWidgetsVisibility( f2_arg0 )
																																					end )
																																					f2_arg0:SubscribeToModel( DataSources.inGame.HUD.overlay.locationSelectorActive:GetModel( f2_arg1 ), function ()
																																						LUI.HUD.UpdateWidgetsVisibility( f2_arg0 )
																																					end )
																																					f2_arg0:SubscribeToModel( DataSources.inGame.player.inADS:GetModel( f2_arg1 ), function ()
																																						LUI.HUD.UpdateWidgetsVisibility( f2_arg0 )
																																					end )
																																					local self = LUI.UIElement.new()
																																					self:setupUIIntWatch( "Jammed" )
																																					self.id = "jammedWatch"
																																					self:registerEventHandler( "int_watch_alert", function ()
																																						f2_arg0:UpdateWidgetsVisibility()
																																					end )
																																					f2_arg0:addElement( self )
																																					f2_arg0:UpdateWidgetsVisibility()
																																					f2_arg0.shakeable:SetParallaxMotionAmount( 0.5 )
																																					local f2_local26 = 6
																																					for f2_local27 = 0, f2_local26 - 1, 1 do
																																						local f2_local31 = DataSources.inGame.MP.splashes.omnvarList[f2_local27]
																																						f2_arg0:SubscribeToModel( f2_local31:GetModel( f2_arg1 ), LUI.MPHUD.SplashSubscriptionHelper( f2_local31, DataSources.inGame.MP.splashes.paramList[f2_local27], DataSources.inGame.MP.splashes.cardClientIdList[f2_local27], DataSources.inGame.MP.splashes.altDisplayList[f2_local27], f2_arg1 ), true )
																																					end
																																					local f2_local27 = LUI.UIMessageQueue.new( nil, {
																																						controller = f2_arg1,
																																						nextMessageDelay = 250
																																					} )
																																					f2_arg0.splashMessageQueue = f2_local27
																																					f2_arg0:addElement( f2_local27 )
																																					LUI.MPHUD.RegisterSplashHandlers( f2_arg0 )
																																					Engine.MeasureResourceEventEnd( "LUI.MPHUD.init", "widget" )
																																					f2_arg0.showGlitch = false
																																					local f2_local28 = nil
																																					f2_local28 = function ( f7_arg0 )
																																						f7_arg0:SetGlitchBlockWidth( math.random( 10, 40 ) )
																																						f7_arg0:SetGlitchBlockHeight( math.random( 5, 20 ) )
																																						f7_arg0:SetGlitchDistortionRange( math.random( 1, 80 ) )
																																						f7_arg0:SetGlitchScanlinePitch( 1 )
																																						f7_arg0:SetGlitchMaskPitch( 1 )
																																						local f7_local0 = f7_arg0:Wait( 25 )
																																						f7_local0.onComplete = function ()
																																							if f7_arg0.showGlitch then
																																								f2_local28( f7_arg0 )
																																							end
																																						end
																																						
																																					end
																																					
																																					local f2_local29 = function ( f9_arg0, f9_arg1, f9_arg2 )
																																						local f9_local0 = f9_arg1 or 200
																																						local f9_local1 = f9_arg2 or 300
																																						f9_arg0.showGlitch = true
																																						f9_arg0:SetAlpha( 0 )
																																						f9_arg0:SetScale( 1 )
																																						f9_arg0:SetGlitchEnabled( true )
																																						f9_arg0:SetGlitchAmount( 1 )
																																						f2_local28( f9_arg0 )
																																						local f9_local2 = f9_arg0:Wait( f9_local1 )
																																						f9_local2.onComplete = function ()
																																							f9_arg0:SetScale( 0, f9_local0, LUI.EASING.outQuadratic )
																																							f9_arg0:SetAlpha( 1, f9_local0, LUI.EASING.outQuadratic )
																																							local f10_local0 = f9_arg0:Wait( f9_local1 )
																																							f10_local0.onComplete = function ()
																																								f9_arg0:SetGlitchAmount( 0, f9_local0 )
																																								f9_arg0.showGlitch = false
																																							end
																																							
																																						end
																																						
																																					end
																																					
																																					f2_arg0:registerEventHandler( "prep_bootup", function ( element, event )
																																						element:SetAlpha( 0, 0 )
																																					end )
																																					f2_arg0:registerEventHandler( "bootup_hud", function ( element, event )
																																						f2_local29( element, 200, 300 )
																																					end )
																																				end
																																			end
																																			f2_local22 = 102
																																		end
																																	end
																																	f2_local20 = 0
																																end
																															end
																															f2_local19 = 200
																														end
																													end
																													f2_local21 = 0
																												end
																											end
																											f2_local18 = 120
																										end
																									end
																									f2_local17 = 45
																								end
																							end
																							f2_local19 = -0.1
																						end
																					end
																					f2_local16 = -50
																				end
																			end
																			f2_local15 = 20
																		end
																	end
																	f2_local12 = 128
																end
															end
															f2_local11 = 20
														end
													end
													f2_local10 = 70
												end
											end
											f2_local9 = -70
										end
									end
									f2_local8 = 0
								end
							end
							f2_local7 = 60
						end
					end
					f2_local6 = 20
				end
			end
			f2_local5 = 40
		end
	end
	f2_local4 = 0
end

LUI.MPHUD.GetToggleWidgets = function ( f14_arg0 )
	local f14_local0 = f14_arg0.controllerIndex
	local f14_local1 = LUI.UIRoot.GetRootForControllerIndex( f14_local0 )
	local f14_local2 = {}
	local f14_local3 = nil
	local f14_local4 = {
		on = "fade",
		off = "fade"
	}
	local f14_local5 = Game.GetCurrentLocalClient()
	Game.SetCurrentLocalClient( f14_local0 )
	local f14_local6 = Game.GetOmnvar( "ui_session_state" )
	local f14_local7 = CODCASTER.IsCODCaster()
	local f14_local8 = DataSources.inGame.MP.spectating.isSpectating:GetValue( f14_local0 ) and not f14_local7
	local f14_local9 = DataSources.inGame.player.inKillCam:GetValue( f14_local0 )
	local f14_local10 = GameX.IsHardcoreMode()
	local f14_local11 = nil
	local f14_local12 = Game.GetOmnvar( "ui_using_killstreak_remote" )
	local f14_local13 = AnyActiveMenusInStack( f14_local1 )
	local f14_local14 = Game.GetOmnvar( "ui_match_start_countdown" ) > 0
	local f14_local15 = Game.IsEmpJammed()
	local f14_local16 = DataSources.inGame.player.affectedByUAVJam:GetValue( f14_local0 )
	local f14_local17 = Game.GetOmnvar( "ui_hide_hud" ) == true
	local f14_local18 = DataSources.inGame.HUD.overlay.locationSelectorActive:GetValue( f14_local0 )
	local f14_local19 = DataSources.inGame.player.inADS:GetValue( f14_local0 )
	local f14_local20 = Game.GetOmnvar( "ui_venom_controls" ) == 1
	local f14_local21 = Game.GetOmnvar( "ui_ads_minimap" )
	local f14_local22 = Game.GetOmnvar( "ui_killstreak_connection" )
	local f14_local23
	if f14_local22 ~= KillstreakConnectionState.CONNECTING and f14_local22 ~= KillstreakConnectionState.CONNECTED then
		f14_local23 = false
	else
		f14_local23 = true
	end
	local f14_local24 = f14_local22 == KillstreakConnectionState.READY
	local f14_local25 = Game.GetOmnvar( "ui_out_of_bounds_countdown" ) > 0
	local f14_local26 = LUI.ScoreboardLayer:GetInstance()
	f14_local26 = f14_local26:IsShowingScoreboard()
	local f14_local27
	if Game.GetOmnvar( "ui_minijackal_controls" ) ~= 1 and Game.GetOmnvar( "ui_minijackal_controls" ) ~= 2 then
		f14_local27 = false
	else
		f14_local27 = true
	end
	local f14_local28 = Game.GetOmnvar( "ui_rc8_controls" ) == 1
	local f14_local29
	if Game.GetOmnvar( "ui_thor_show" ) ~= 1 and Game.GetOmnvar( "ui_thor_show" ) ~= 2 then
		f14_local29 = false
	else
		f14_local29 = true
	end
	local f14_local30 = Game.GetOmnvar( "ui_predator_missile" ) == 1
	local f14_local31 = Game.GetOmnvar( "ui_show_hardcore_minimap" )
	local f14_local32 = true ~= Engine.GetDvarBool( "killswitch_net_health_dev" )
	f14_local11 = f14_local6 ~= "playing"
	local f14_local33 = f14_local6 == "dead"
	if f14_local17 then
		f14_local3 = true
		if not f14_local13 and f14_local9 then
			f14_local2 = {
				f14_arg0.killCam
			}
		end
	elseif f14_local13 then
		f14_local3 = true
		if f14_local14 then
			f14_local2 = {
				f14_arg0.matchStartObjective
			}
		end
		f14_local4.on = "snap"
		f14_local4.off = "snap"
	elseif f14_local26 then
		f14_local3 = true
		if not f14_local10 then
			f14_local2 = {
				f14_arg0.lowHealth
			}
		end
		if f14_local9 then
			table.insert( f14_local2, f14_arg0.killCam )
		end
	elseif f14_local9 then
		f14_local3 = true
		f14_local2 = {
			f14_arg0.overlay,
			f14_arg0.oldOverlay,
			f14_arg0.crankedBombTimer,
			f14_arg0.killCam,
			f14_arg0.lowHealth,
			f14_arg0.pointsPopup,
			f14_arg0.hitMarker,
			f14_arg0.hitMarkerIcon,
			f14_arg0.iconType,
			f14_arg0.edgeGlow,
			f14_arg0.damageOverlay,
			f14_arg0.netStatsIcons,
			f14_arg0.thermalVision
		}
		if f14_local32 then
			f14_local2[#f14_local2 + 1] = f14_arg0.netStatsDev
		end
	elseif f14_local25 then
		f14_local3 = true
		f14_local2 = {
			f14_arg0.outOfBounds,
			f14_arg0.mpErrorMessage
		}
	elseif f14_local18 then
		f14_local3 = true
		f14_local2 = {
			f14_arg0.generalFrameElements,
			f14_arg0.overlay,
			f14_arg0.crankedBombTimer,
			f14_arg0.iconType,
			f14_arg0.splashes
		}
		if f14_local8 then
			f14_local2[#f14_local2 + 1] = f14_arg0.spectator
		end
		f14_local4.on = "bootup"
		f14_local4.off = "fade"
	elseif f14_local23 then
		f14_local3 = true
		f14_local2 = {
			f14_arg0.overlay,
			f14_arg0.oldOverlay,
			f14_arg0.killstreakConnection
		}
	elseif f14_local12 then
		f14_local3 = true
		f14_local2 = {
			f14_arg0.overlay,
			f14_arg0.oldOverlay,
			f14_arg0.pointsPopup,
			f14_arg0.matchStart,
			f14_arg0.hitMarker,
			f14_arg0.hitMarkerIcon,
			f14_arg0.iconType,
			f14_arg0.splashes,
			f14_arg0.remoteControlSequence,
			f14_arg0.crankedBombTimer
		}
		if f14_local32 then
			f14_local2[#f14_local2 + 1] = f14_arg0.netStatsDev
		end
		if f14_local8 then
			f14_local2[#f14_local2 + 1] = f14_arg0.spectator
		elseif f14_local20 then
			f14_local2[#f14_local2 + 1] = f14_arg0.minimap
			f14_local2[#f14_local2 + 1] = f14_arg0.awardFeed
			f14_local2[#f14_local2 + 1] = f14_arg0.thermalVision
			f14_local2[#f14_local2 + 1] = f14_arg0.movementMeter
			f14_local2[#f14_local2 + 1] = f14_arg0.obituaries
			f14_local2[#f14_local2 + 1] = f14_arg0.netStatsIcons
		elseif f14_local28 then
			f14_local2[#f14_local2 + 1] = f14_arg0.minimap
			f14_local2[#f14_local2 + 1] = f14_arg0.awardFeed
			f14_local2[#f14_local2 + 1] = f14_arg0.thermalVision
			f14_local2[#f14_local2 + 1] = f14_arg0.movementMeter
			f14_local2[#f14_local2 + 1] = f14_arg0.obituaries
			f14_local2[#f14_local2 + 1] = f14_arg0.netStatsIcons
		elseif f14_local27 then
			f14_local2[#f14_local2 + 1] = f14_arg0.minimap
			f14_local2[#f14_local2 + 1] = f14_arg0.awardFeed
			f14_local2[#f14_local2 + 1] = f14_arg0.thermalVision
			f14_local2[#f14_local2 + 1] = f14_arg0.obituaries
			f14_local2[#f14_local2 + 1] = f14_arg0.netStatsIcons
		elseif f14_local29 then
			f14_local2[#f14_local2 + 1] = f14_arg0.awardFeed
			f14_local2[#f14_local2 + 1] = f14_arg0.thermalVision
			f14_local2[#f14_local2 + 1] = f14_arg0.obituaries
			f14_local2[#f14_local2 + 1] = f14_arg0.netStatsIcons
		elseif f14_local30 then
			f14_local2[#f14_local2 + 1] = f14_arg0.awardFeed
			f14_local2[#f14_local2 + 1] = f14_arg0.thermalVision
			f14_local2[#f14_local2 + 1] = f14_arg0.obituaries
			f14_local2[#f14_local2 + 1] = f14_arg0.netStatsIcons
		end
		f14_local4.on = "bootup"
		f14_local4.off = "fade"
		if f14_arg0.minimap then
			f14_local4[f14_arg0.minimap] = {
				on = "bootup",
				off = "swipe"
			}
		end
	elseif f14_local7 then
		f14_local3 = true
		f14_local2 = {
			f14_arg0.overlay,
			f14_arg0.oldOverlay,
			f14_arg0.crankedBombTimer,
			f14_arg0.lowHealth,
			f14_arg0.matchStartObjective,
			f14_arg0.matchStart,
			f14_arg0.grenadeCook,
			f14_arg0.hitMarker,
			f14_arg0.hitMarkerIcon,
			f14_arg0.movementMeter
		}
		if MLG.ShoutcasterProfileVarValue( f14_local0, "shoutcaster_qs_playerhud" ) == 1 then
			if MLG.IsFollowing() then
				if MLG.ShoutcasterProfileVarValue( f14_local0, "shoutcaster_inventory" ) == 1 then
					f14_local2[#f14_local2 + 1] = f14_arg0.MPWeaponInfoContainer
				end
				f14_local2[#f14_local2 + 1] = f14_arg0.streakReadyNotification
				if MLG.ShoutcasterProfileVarValue( f14_local0, "shoutcaster_scorestreaks" ) == 1 then
					f14_local2[#f14_local2 + 1] = f14_arg0.scorestreaks
				end
				f14_local2[#f14_local2 + 1] = f14_arg0.perksList
			end
			if MLG.ShoutcasterProfileVarValue( f14_local0, "shoutcaster_teamscore" ) == 1 then
				f14_local2[#f14_local2 + 1] = f14_arg0.teamScores
			end
			if MLG.ShoutcasterProfileVarValue( f14_local0, "shoutcaster_voipdock" ) == 1 then
				f14_local2[#f14_local2 + 1] = f14_arg0.talkersList
			end
			if MLG.ShoutcasterProfileVarValue( f14_local0, "shoutcaster_killfeed" ) == 1 then
				f14_local2[#f14_local2 + 1] = f14_arg0.obituaries
			end
			if MLG.ShoutcasterProfileVarValue( f14_local0, "shoutcaster_calloutcards" ) == 1 then
				f14_local2[#f14_local2 + 1] = f14_arg0.globalPlayerSplashes
			end
			if MLG.ShoutcasterProfileVarValue( f14_local0, "shoutcaster_player_points" ) == 1 then
				f14_local2[#f14_local2 + 1] = f14_arg0.pointsPopup
			end
		end
		if MLG.ShoutcasterProfileVarValue( f14_local0, "shoutcaster_objective_status" ) == 1 and f14_arg0.objectiveStatusWidgets ~= nil then
			for f14_local37, f14_local38 in ipairs( f14_arg0.objectiveStatusWidgets ) do
				f14_local2[#f14_local2 + 1] = f14_local38
			end
		end
	elseif f14_local8 then
		if f14_local10 then
			f14_local3 = false
			f14_local2 = {
				f14_arg0.perksList,
				f14_arg0.teamScores,
				f14_arg0.MPWeaponInfoContainer,
				f14_arg0.preKillcamPlayerCard,
				f14_arg0.scorestreaks,
				f14_arg0.hints,
				f14_arg0.interactiveObjectPopup,
				f14_arg0.lowHealth,
				f14_arg0.movementMeter,
				f14_arg0.abilities,
				f14_arg0.ammoWarning,
				f14_arg0.trophy,
				f14_arg0.trophyTimer,
				f14_arg0.shoulderCannon,
				f14_arg0.shoulderCannonTimer,
				f14_arg0.engineerOverlay,
				f14_arg0.enemyHealth,
				f14_arg0.scoreboard,
				f14_arg0.killCam,
				f14_arg0.grenadeCook,
				f14_arg0.dodgeCharges,
				f14_arg0.counterUAVJam,
				f14_arg0.netStatsIcons
			}
			if not f14_local31 then
				f14_local2[#f14_local2 + 1] = f14_arg0.minimap
			end
			if f14_arg0.bombInfo then
				f14_local2[#f14_local2 + 1] = f14_arg0.bombPlantedTimers
			end
			if f14_arg0.uplinkLocation then
				f14_local2[#f14_local2 + 1] = f14_arg0.uplinkLocation
				f14_local2[#f14_local2 + 1] = f14_arg0.uplinkCommandBar
				f14_local2[#f14_local2 + 1] = f14_arg0.uplinkBallIcon
			end
			if f14_arg0.uplinkTimer then
				f14_local2[#f14_local2 + 1] = f14_arg0.uplinkTimer
				f14_local2[#f14_local2 + 1] = f14_arg0.uplinkCarrierTimer
			end
			if f14_arg0.frontlineImmuneIcon then
				f14_local2[#f14_local2 + 1] = f14_arg0.frontlineImmuneIcon
			end
			if f14_arg0.hardpointStatus then
				f14_local2[#f14_local2 + 1] = f14_arg0.hardpointStatus
				f14_local2[#f14_local2 + 1] = f14_arg0.hardpointIcon
			end
			if f14_arg0.teamAliveCounter then
				f14_local2[#f14_local2 + 1] = f14_arg0.teamAliveCounter
			end
			if f14_arg0.flagCarrierIcon then
				f14_local2[#f14_local2 + 1] = f14_arg0.flagCarrierIcon
				f14_local2[#f14_local2 + 1] = f14_arg0.flagLocation
			end
			if f14_arg0.grindIcon then
				f14_local2[#f14_local2 + 1] = f14_arg0.grindIcon
			end
		else
			f14_local3 = true
			f14_local2 = {
				f14_arg0.overlay,
				f14_arg0.oldOverlay,
				f14_arg0.crankedBombTimer,
				f14_arg0.lowHealth,
				f14_arg0.spectator,
				f14_arg0.matchStartObjective,
				f14_arg0.matchStart,
				f14_arg0.hitMarker,
				f14_arg0.hitMarkerIcon
			}
			if f14_arg0.bombPlantDefuse then
				f14_local2[#f14_local2 + 1] = f14_arg0.bombPlantDefuse
				f14_local2[#f14_local2 + 1] = f14_arg0.bombInfo
			end
			f14_local2[#f14_local2 + 1] = f14_arg0.capture
			if f14_arg0.captureDom then
				f14_local2[#f14_local2 + 1] = f14_arg0.captureDom
			end
			if f14_arg0.uplinkLocation then
				f14_local2[#f14_local2 + 1] = f14_arg0.uplinkLocation
				f14_local2[#f14_local2 + 1] = f14_arg0.uplinkCommandBar
				f14_local2[#f14_local2 + 1] = f14_arg0.uplinkBallIcon
			end
			if f14_arg0.uplinkTimer then
				f14_local2[#f14_local2 + 1] = f14_arg0.uplinkTimer
				f14_local2[#f14_local2 + 1] = f14_arg0.uplinkCarrierTimer
			end
			if f14_arg0.frontlineImmuneIcon then
				f14_local2[#f14_local2 + 1] = f14_arg0.frontlineImmuneIcon
			end
			if f14_arg0.hardpointStatus then
				f14_local2[#f14_local2 + 1] = f14_arg0.hardpointStatus
				f14_local2[#f14_local2 + 1] = f14_arg0.hardpointIcon
			end
			if f14_arg0.teamAliveCounter then
				f14_local2[#f14_local2 + 1] = f14_arg0.teamAliveCounter
			end
			if f14_arg0.flagCarrierIcon then
				f14_local2[#f14_local2 + 1] = f14_arg0.flagCarrierIcon
			end
			if f14_arg0.grindIcon then
				f14_local2[#f14_local2 + 1] = f14_arg0.grindIcon
			end
			if not Game.IsSpectatingSelf() then
				if not f14_local28 then
					f14_local2[#f14_local2 + 1] = f14_arg0.MPWeaponInfoContainer
				end
				f14_local2[#f14_local2 + 1] = f14_arg0.scorestreaks
				f14_local2[#f14_local2 + 1] = f14_arg0.obituaries
				f14_local2[#f14_local2 + 1] = f14_arg0.teamScores
				f14_local2[#f14_local2 + 1] = f14_arg0.bombInfo
				if not f14_local10 and (not f14_local19 or f14_local21) then
					f14_local2[#f14_local2 + 1] = f14_arg0.minimap
				end
			end
		end
	elseif f14_local10 then
		f14_local3 = false
		f14_local2 = {
			f14_arg0.perksList,
			f14_arg0.teamScores,
			f14_arg0.MPWeaponInfoContainer,
			f14_arg0.preKillcamPlayerCard,
			f14_arg0.hints,
			f14_arg0.interactiveObjectPopup,
			f14_arg0.lowHealth,
			f14_arg0.movementMeter,
			f14_arg0.abilities,
			f14_arg0.ammoWarning,
			f14_arg0.trophy,
			f14_arg0.trophyTimer,
			f14_arg0.shoulderCannon,
			f14_arg0.shoulderCannonTimer,
			f14_arg0.engineerOverlay,
			f14_arg0.enemyHealth,
			f14_arg0.spectator,
			f14_arg0.scoreboard,
			f14_arg0.killCam,
			f14_arg0.dodgeCharges,
			f14_arg0.counterUAVJam
		}
		if not f14_local31 then
			f14_local2[#f14_local2 + 1] = f14_arg0.minimap
		end
		if f14_arg0.bombInfo then
			f14_local2[#f14_local2 + 1] = f14_arg0.bombPlantedTimers
		end
		if f14_arg0.uplinkLocation then
			f14_local2[#f14_local2 + 1] = f14_arg0.uplinkLocation
			f14_local2[#f14_local2 + 1] = f14_arg0.uplinkCommandBar
			f14_local2[#f14_local2 + 1] = f14_arg0.uplinkBallIcon
		end
		if f14_arg0.uplinkTimer then
			f14_local2[#f14_local2 + 1] = f14_arg0.uplinkTimer
			f14_local2[#f14_local2 + 1] = f14_arg0.uplinkCarrierTimer
		end
		if f14_arg0.frontlineImmuneIcon then
			f14_local2[#f14_local2 + 1] = f14_arg0.frontlineImmuneIcon
		end
		if f14_arg0.hardpointStatus then
			f14_local2[#f14_local2 + 1] = f14_arg0.hardpointStatus
			f14_local2[#f14_local2 + 1] = f14_arg0.hardpointIcon
		end
		if f14_arg0.teamAliveCounter then
			f14_local2[#f14_local2 + 1] = f14_arg0.teamAliveCounter
		end
		if f14_arg0.flagCarrierIcon then
			f14_local2[#f14_local2 + 1] = f14_arg0.flagCarrierIcon
			f14_local2[#f14_local2 + 1] = f14_arg0.flagLocation
		end
		if f14_arg0.grindIcon then
			f14_local2[#f14_local2 + 1] = f14_arg0.grindIcon
		end
	elseif f14_local33 then
		f14_local3 = true
		f14_local2 = {
			f14_arg0.lowHealth,
			f14_arg0.damageOverlay,
			f14_arg0.obituaries,
			f14_arg0.pointsPopup,
			f14_arg0.awardFeed
		}
	elseif f14_local11 then
		f14_local3 = true
		f14_local2 = {
			f14_arg0.lowHealth,
			f14_arg0.damageOverlay,
			f14_arg0.preKillcamPlayerCard
		}
	elseif f14_local15 then
		f14_local3 = false
		f14_local2 = {
			f14_arg0.matchStartObjective,
			f14_arg0.ammoWarning,
			f14_arg0.intelInfo,
			f14_arg0.killCam,
			f14_arg0.spectator,
			f14_arg0.preKillcamPlayerCard,
			f14_arg0.killedByLootWeaponNotification,
			f14_arg0.counterUAVJam
		}
		if f14_local19 and isSniping then
			f14_local2[#f14_local2 + 1] = f14_arg0.minimap
		end
	elseif f14_local16 then
		f14_local3 = false
		f14_local2 = {
			f14_arg0.perksList,
			f14_arg0.teamScores,
			f14_arg0.MPWeaponInfoContainer,
			f14_arg0.preKillcamPlayerCard,
			f14_arg0.hints,
			f14_arg0.interactiveObjectPopup,
			f14_arg0.lowHealth,
			f14_arg0.movementMeter,
			f14_arg0.abilities,
			f14_arg0.ammoWarning,
			f14_arg0.trophy,
			f14_arg0.trophyTimer,
			f14_arg0.shoulderCannon,
			f14_arg0.shoulderCannonTimer,
			f14_arg0.engineerOverlay,
			f14_arg0.enemyHealth,
			f14_arg0.spectator,
			f14_arg0.scoreboard,
			f14_arg0.killCam,
			f14_arg0.dodgeCharges,
			f14_arg0.minimap,
			f14_arg0.scorestreaks,
			f14_arg0.ringRadar
		}
		f14_local4.on = "glitch"
		f14_local4.off = "glitch"
		f14_local4[f14_arg0.counterUAVJam] = {
			on = "bootup"
		}
	elseif f14_local14 then
		f14_local3 = false
		f14_local2 = {
			f14_arg0.killCam,
			f14_arg0.spectator,
			f14_arg0.preKillcamPlayerCard,
			f14_arg0.killedByLootWeaponNotification,
			f14_arg0.counterUAVJam
		}
	else
		f14_local3 = false
		f14_local2 = {
			f14_arg0.matchStart,
			f14_arg0.killCam,
			f14_arg0.spectator,
			f14_arg0.preKillcamPlayerCard,
			f14_arg0.killedByLootWeaponNotification,
			f14_arg0.counterUAVJam
		}
		if not (not f14_local19 or f14_local21) or f14_local24 then
			f14_local2[#f14_local2 + 1] = f14_arg0.minimap
		end
	end
	if f14_local3 and not f14_local13 then
		f14_local2[#f14_local2 + 1] = f14_arg0.killedByLootWeaponNotification
	end
	if f14_local2[f14_arg0.spectator] then
		f14_local4.on = "fade"
		f14_local4.off = "fade"
		f14_local4[f14_arg0.spectator] = {
			on = "snap",
			off = "snap"
		}
	end
	if f14_arg0.killCam ~= nil then
		f14_local4[f14_arg0.killCam] = {
			on = "snap",
			off = "snap"
		}
	end
	if f14_arg0.preKillcamPlayerCard ~= nil then
		f14_local4[f14_arg0.preKillcamPlayerCard] = {
			on = "snap",
			off = "snap"
		}
	end
	if f14_arg0.killedByLootWeaponNotification ~= nil then
		f14_local4[f14_arg0.killedByLootWeaponNotification] = {
			on = "snap",
			off = "snap"
		}
	end
	Game.SetCurrentLocalClient( f14_local5 )
	return f14_local2, f14_local3, f14_local4
end

local f0_local1 = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
	local f15_local0 = nil
	if 0 < f15_arg3 then
		f15_local0 = Engine.TableLookupByRow( CSV.splashTable.file, f15_arg0, f15_arg2 + CSV.splashTable.altDisplayColumnCount * (f15_arg3 - 1) )
	end
	if not f15_local0 or f15_local0 == "" then
		f15_local0 = Engine.TableLookupByRow( CSV.splashTable.file, f15_arg0, f15_arg1 )
	end
	return f15_local0
end

LUI.MPHUD.SplashSubscriptionHelper = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4 )
	return function ()
		local f17_local0 = f16_arg0:GetValue( f16_arg4 )
		if f17_local0 < 0 then
			return 
		end
		local f17_local1 = f16_arg3:GetValue( f16_arg4 )
		local f17_local2 = Engine.BitwiseAnd( f17_local0, 2047 )
		DataSources.inGame.MP.splashes.queue.splashIndex:SetValue( f16_arg4, f17_local2 )
		local f17_local3 = f16_arg1:GetValue( f16_arg4 )
		if f17_local3 < 0 then
			f17_local3 = nil
		end
		local f17_local4 = Engine.TableLookupByRow( CSV.splashTable.file, f17_local2, CSV.splashTable.cols.headerStringParam )
		if f17_local4 == "" then
			f17_local4 = nil
		end
		local f17_local5 = Engine.TableLookupByRow( CSV.splashTable.file, f17_local2, CSV.splashTable.cols.name )
		local f17_local6 = 1
		if f17_local5 and f17_local5 ~= "" then
			local f17_local7 = f17_local3
			if f17_local4 then
				f17_local7 = f17_local4
			end
			if f17_local7 then
				f17_local5 = Engine.Localize( f17_local5, f17_local7 )
			else
				f17_local5 = Engine.Localize( f17_local5 )
			end
		else
			f17_local5 = ""
			f17_local6 = 0
		end
		DataSources.inGame.MP.splashes.queue.header:SetValue( f16_arg4, f17_local5 )
		DataSources.inGame.MP.splashes.queue.headerAlpha:SetValue( f16_arg4, f17_local6 )
		local f17_local7 = f0_local1( f17_local2, CSV.splashTable.cols.desc, CSV.splashTable.altDisplayCols.desc, f17_local1 )
		local f17_local8 = 1
		if f17_local7 and f17_local7 ~= "" then
			if f17_local3 then
				f17_local7 = Engine.Localize( f17_local7, f17_local3 )
			else
				f17_local7 = Engine.Localize( f17_local7 )
			end
		else
			f17_local7 = ""
			f17_local8 = 0
		end
		DataSources.inGame.MP.splashes.queue.body:SetValue( f16_arg4, f17_local7 )
		DataSources.inGame.MP.splashes.queue.bodyAlpha:SetValue( f16_arg4, f17_local8 )
		local f17_local9 = f0_local1( f17_local2, CSV.splashTable.cols.icon, CSV.splashTable.altDisplayCols.icon, f17_local1 )
		local f17_local10 = 1
		if not f17_local9 or f17_local9 == "" then
			f17_local9 = "white_multiply"
			f17_local10 = 0
		end
		DataSources.inGame.MP.splashes.queue.icon:SetValue( f16_arg4, f17_local9 )
		DataSources.inGame.MP.splashes.queue.iconAlpha:SetValue( f16_arg4, f17_local10 )
		local f17_local11 = f16_arg2:GetValue( f16_arg4 )
		if f17_local11 and f17_local11 >= 0 then
			DataSources.inGame.MP.splashes.queue.cardClientId:SetValue( f16_arg4, f17_local11 )
		else
			DataSources.inGame.MP.splashes.queue.cardClientId:SetValue( f16_arg4, -1 )
		end
		local f17_local12 = f0_local1( f17_local2, CSV.splashTable.cols.sound, CSV.splashTable.altDisplayCols.sound, f17_local1 )
		if f17_local12 and f17_local12 ~= "" and f17_local12 ~= "null" then
			DataSources.inGame.MP.splashes.queue.sound:SetValue( f16_arg4, f17_local12 )
		else
			DataSources.inGame.MP.splashes.queue.sound:SetValue( f16_arg4, "" )
		end
		if Engine.TableLookupByRow( CSV.splashTable.file, f17_local2, CSV.splashTable.cols.useRectangleImage ) ~= "" then
			DataSources.inGame.MP.splashes.queue.useRectangleImage:SetValue( f16_arg4, true )
		else
			DataSources.inGame.MP.splashes.queue.useRectangleImage:SetValue( f16_arg4, false )
		end
		if Engine.TableLookupByRow( CSV.splashTable.file, f17_local2, CSV.splashTable.cols.useRectangleBacking ) ~= "" then
			DataSources.inGame.MP.splashes.queue.useRectangleBacking:SetValue( f16_arg4, true )
		else
			DataSources.inGame.MP.splashes.queue.useRectangleBacking:SetValue( f16_arg4, false )
		end
		local f17_local13 = Engine.TableLookupByRow( CSV.splashTable.file, f17_local2, CSV.splashTable.cols.displayLocation )
		local f17_local14 = assert
		local f17_local15
		if f17_local13 ~= "otherPlayer" and f17_local13 ~= "local" then
			f17_local15 = false
		else
			f17_local15 = true
		end
		f17_local14( f17_local15, "Splash #" .. f17_local2 .. " has an unknown displayLocation" )
		if f17_local13 == "otherPlayer" then
			DataSources.inGame.MP.splashes.queue.pushToGlobalPlayer:SetValue( f16_arg4, true )
		else
			DataSources.inGame.MP.splashes.queue.pushToLocalPlayer:SetValue( f16_arg4, true )
		end
	end
	
end

LUI.MPHUD.RegisterSplashHandlers = function ( f18_arg0 )
	LUI.UIMessageQueue.AddWidget( f18_arg0.splashMessageQueue, f18_arg0.localPlayerSplashes, {
		messageType = LUI.UIMessageQueue.MessageType.LocalPlayerSplash,
		dataSourcesFrom = {
			splashIndex = DataSources.inGame.MP.splashes.queue.splashIndex,
			icon = DataSources.inGame.MP.splashes.queue.icon,
			header = DataSources.inGame.MP.splashes.queue.header,
			body = DataSources.inGame.MP.splashes.queue.body,
			iconAlpha = DataSources.inGame.MP.splashes.queue.iconAlpha,
			headerAlpha = DataSources.inGame.MP.splashes.queue.headerAlpha,
			bodyAlpha = DataSources.inGame.MP.splashes.queue.bodyAlpha,
			sound = DataSources.inGame.MP.splashes.queue.sound,
			useRectangleImage = DataSources.inGame.MP.splashes.queue.useRectangleImage,
			useRectangleBacking = DataSources.inGame.MP.splashes.queue.useRectangleBacking,
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
			sound = DataSources.inGame.MP.splashes.localPlayer.sound,
			useRectangleImage = DataSources.inGame.MP.splashes.localPlayer.useRectangleImage,
			useRectangleBacking = DataSources.inGame.MP.splashes.localPlayer.useRectangleBacking
		}
	} )
	LUI.UIMessageQueue.AddWidget( f18_arg0.splashMessageQueue, f18_arg0.awardFeed, {
		messageType = LUI.UIMessageQueue.MessageType.PlayerAwards,
		dataSourcesFrom = {
			icon = DataSources.inGame.MP.awardQueue.icon,
			text = DataSources.inGame.MP.awardQueue.text,
			push = DataSources.inGame.MP.awardQueue.push
		},
		dataSourcesTo = {
			icon = DataSources.inGame.MP.awardEvents.icon,
			text = DataSources.inGame.MP.awardEvents.text,
			push = DataSources.inGame.MP.awardEvents.push
		}
	} )
end

LUI.MPHUD.ToggleCodcasting = function ( f19_arg0, f19_arg1 )
	local f19_local0 = Engine.GetDvarString( "ui_gametype" )
	local f19_local1 = 80
	local f19_local2 = 70
	local f19_local3 = 65
	local f19_local4 = 100
	local f19_local5 = 70
	local f19_local6 = 70
	if f19_arg1 then
		if GameX.gameModeIsFFA( f19_local0 ) and f19_arg0.teamScores ~= nil then
			f19_arg0.teamScores._widget:SetLogoVisibility( 0 )
		end
		if f19_local0 == "ctf" and f19_arg0.flagLocation ~= nil then
			local f19_local7, f19_local8, f19_local9, f19_local10 = f19_arg0.flagLocation:getLocalRect()
			f19_arg0.flagLocation:SetTop( f19_local8 + f19_local1 )
			f19_arg0.flagLocation:SetBottom( f19_local10 + f19_local1 )
			f19_arg0.flagLocation._widget:ResetTeamColor( f19_arg1 )
		elseif f19_local0 == "sd" and f19_arg0.teamAliveCounter ~= nil then
			local f19_local7, f19_local8, f19_local9, f19_local10 = f19_arg0.teamAliveCounter:getLocalRect()
			f19_arg0.teamAliveCounter:SetTop( f19_local8 + f19_local2 )
			f19_arg0.teamAliveCounter:SetBottom( f19_local10 + f19_local2 )
			local f19_local11, f19_local12, f19_local13, f19_local14 = f19_arg0.bombPlantedTimers:getLocalRect()
			f19_arg0.bombPlantedTimers:SetTop( f19_local12 + f19_local3 )
			f19_arg0.bombPlantedTimers:SetBottom( f19_local14 + f19_local3 )
			f19_arg0.teamAliveCounter._widget:ResetTeamColor( f19_arg1 )
		elseif f19_local0 == "ball" and f19_arg0.uplinkLocation ~= nil then
			local f19_local7, f19_local8, f19_local9, f19_local10 = f19_arg0.uplinkLocation:getLocalRect()
			f19_arg0.uplinkLocation:SetTop( f19_local8 + f19_local4 )
			f19_arg0.uplinkLocation:SetBottom( f19_local10 + f19_local4 )
		elseif f19_local0 == "koth" and f19_arg0.hardpointStatus ~= nil then
			local f19_local7, f19_local8, f19_local9, f19_local10 = f19_arg0.hardpointStatus:getLocalRect()
			f19_arg0.hardpointStatus:SetTop( f19_local8 + f19_local5 )
			f19_arg0.hardpointStatus:SetBottom( f19_local10 + f19_local5 )
		elseif f19_local0 == "grnd" and f19_arg0.hardpointStatus ~= nil then
			local f19_local7, f19_local8, f19_local9, f19_local10 = f19_arg0.hardpointStatus:getLocalRect()
			f19_arg0.hardpointStatus:SetTop( f19_local8 + f19_local6 )
			f19_arg0.hardpointStatus:SetBottom( f19_local10 + f19_local6 )
		end
	else
		if f19_arg0.teamScores ~= nil then
			f19_arg0.teamScores._widget:SetLogoVisibility( 1 )
			f19_arg0.teamScores._widget:UpdateCodcasterMatchStatus()
		end
		if f19_local0 == "ctf" and f19_arg0.flagLocation ~= nil then
			local f19_local7, f19_local8, f19_local9, f19_local10 = f19_arg0.flagLocation:getLocalRect()
			f19_arg0.flagLocation:SetTop( f19_local8 - f19_local1 )
			f19_arg0.flagLocation:SetBottom( f19_local10 - f19_local1 )
			f19_arg0.flagLocation._widget:ResetTeamColor( f19_arg1 )
		elseif f19_local0 == "sd" and f19_arg0.teamAliveCounter ~= nil then
			local f19_local7, f19_local8, f19_local9, f19_local10 = f19_arg0.teamAliveCounter:getLocalRect()
			f19_arg0.teamAliveCounter:SetTop( f19_local8 - f19_local2 )
			f19_arg0.teamAliveCounter:SetBottom( f19_local10 - f19_local2 )
			local f19_local11, f19_local12, f19_local13, f19_local14 = f19_arg0.bombPlantedTimers:getLocalRect()
			f19_arg0.bombPlantedTimers:SetTop( f19_local12 - f19_local3 )
			f19_arg0.bombPlantedTimers:SetBottom( f19_local14 - f19_local3 )
			f19_arg0.teamAliveCounter._widget:ResetTeamColor( f19_arg1 )
		elseif f19_local0 == "ball" and f19_arg0.uplinkLocation ~= nil then
			local f19_local7, f19_local8, f19_local9, f19_local10 = f19_arg0.uplinkLocation:getLocalRect()
			f19_arg0.uplinkLocation:SetTop( f19_local8 - f19_local4 )
			f19_arg0.uplinkLocation:SetBottom( f19_local10 - f19_local4 )
		elseif f19_local0 == "koth" and f19_arg0.hardpointStatus ~= nil then
			local f19_local7, f19_local8, f19_local9, f19_local10 = f19_arg0.hardpointStatus:getLocalRect()
			f19_arg0.hardpointStatus:SetTop( f19_local8 - f19_local5 )
			f19_arg0.hardpointStatus:SetBottom( f19_local10 - f19_local5 )
		elseif f19_local0 == "grnd" and f19_arg0.hardpointStatus ~= nil then
			local f19_local7, f19_local8, f19_local9, f19_local10 = f19_arg0.hardpointStatus:getLocalRect()
			f19_arg0.hardpointStatus:SetTop( f19_local8 - f19_local6 )
			f19_arg0.hardpointStatus:SetBottom( f19_local10 - f19_local6 )
		end
	end
end

