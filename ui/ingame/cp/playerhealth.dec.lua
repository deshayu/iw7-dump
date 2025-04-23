local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 140
f0_local1 = 64
function GradientBarFactory( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8 )
	local self = LUI.UIImage.new()
	self.id = "cap"
	local f1_local1 = self
	local f1_local2 = self.registerAnimationState
	local f1_local3 = "default"
	local f1_local4 = {
		material = RegisterMaterial( "hud_health_bar_ltcap" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false
	}
	if f1_arg5 then
		local f1_local5 = f1_arg8
	end
	f1_local4.left = f1_local5 or 0
	local f1_local6
	if f1_arg5 then
		f1_local6 = 0
		if not f1_local6 then
		
		else
			f1_local4.right = f1_local6
			if f1_arg6 then
				local f1_local7 = f1_arg3
			end
			f1_local4.top = f1_local7 or 0
			if f1_arg6 then
				f1_local6 = 0
				if not f1_local6 then
				
				else
					f1_local4.bottom = f1_local6
					f1_local2( f1_local1, f1_local3, f1_local4 )
					self:animateToState( "default" )
					f1_local2 = LUI.UIImage.new()
					f1_local2.id = "fill"
					f1_local2:setupUIScorebar( f1_arg1 )
					f1_local3 = f1_local2
					f1_local1 = f1_local2.registerAnimationState
					f1_local4 = "default"
					f1_local6 = {
						material = RegisterMaterial( "hud_health_bar_mid" ),
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = false,
						left = 0,
						right = 0
					}
					if f1_arg6 then
						local f1_local8 = f1_arg3
					end
					f1_local6.top = f1_local8 or 0
					local f1_local9
					if f1_arg6 then
						f1_local9 = 0
						if not f1_local9 then
						
						else
							f1_local6.bottom = f1_local9
							f1_local1( f1_local3, f1_local4, f1_local6 )
							f1_local2:animateToState( "default" )
							f1_local1 = LUI.UIHorizontalList.new()
							f1_local1.id = "bar"
							f1_local4 = f1_local1
							f1_local3 = f1_local1.registerAnimationState
							f1_local6 = "default"
							f1_local9 = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								top = 0,
								bottom = 0
							}
							local f1_local10
							if f1_arg7 then
								f1_local10 = 0
								if not f1_local10 then
									if f1_arg5 then
										f1_local10 = -f1_arg8 * 0.6
										if not f1_local10 then
										
										else
											f1_local9.left = f1_local10
											if f1_arg7 then
												f1_local10 = 0
												if not f1_local10 then
													if f1_arg5 then
														f1_local10 = 0
														if not f1_local10 then
														
														else
															f1_local9.right = f1_local10
															if f1_arg5 then
																f1_local10 = LUI.Alignment.Left
																if not f1_local10 then
																
																else
																	f1_local9.alignment = f1_local10
																	f1_local3( f1_local4, f1_local6, f1_local9 )
																	f1_local1:animateToState( "default" )
																	f1_local1:addElement( f1_local2 )
																	f1_local1:addElement( self )
																	f1_local3 = LUI.UIElement.new()
																	f1_local3:setUseStencil( true )
																	f1_local3.id = f1_arg0 .. "_bar"
																	f1_local3:registerAnimationState( "default", {
																		topAnchor = true,
																		bottomAnchor = true,
																		leftAnchor = true,
																		rightAnchor = true,
																		top = 0,
																		bottom = 0,
																		left = 0,
																		right = 0
																	} )
																	f1_local3:animateToState( "default" )
																	f1_local3:addElement( f1_local1 )
																	f1_local3.colorize = function ( f2_arg0 )
																		local f2_local0 = f2_arg0.r * 100 + f2_arg0.g * 10 + f2_arg0.b
																		if f1_local3.currentColor ~= f2_local0 then
																			f1_local3.currentColor = f2_local0
																			f1_local2:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																			f1_local2:animateToState( "current" )
																			self:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																			self:animateToState( "current" )
																		end
																	end
																	
																	f1_local3.setMax = function ( f3_arg0, f3_arg1 )
																		f1_local2.m_maxScore = f3_arg0
																		f1_local2.m_maxWidth = f3_arg1 - f1_arg8 * (f1_arg7 and 1 or 0.4)
																	end
																	
																	f1_local3.setMax( f1_arg4, f1_arg2 )
																	return f1_local3
																end
															end
															f1_local10 = LUI.Alignment.Right
														end
													end
													f1_local10 = f1_arg8 * 0.6
												end
											else
												if f1_arg5 then
													f1_local10 = 0
													if not f1_local10 then
													
													else
														f1_local9.right = f1_local10
														if f1_arg5 then
															f1_local10 = LUI.Alignment.Left
															if not f1_local10 then
															
															else
																f1_local9.alignment = f1_local10
																f1_local3( f1_local4, f1_local6, f1_local9 )
																f1_local1:animateToState( "default" )
																f1_local1:addElement( f1_local2 )
																f1_local1:addElement( self )
																f1_local3 = LUI.UIElement.new()
																f1_local3:setUseStencil( true )
																f1_local3.id = f1_arg0 .. "_bar"
																f1_local3:registerAnimationState( "default", {
																	topAnchor = true,
																	bottomAnchor = true,
																	leftAnchor = true,
																	rightAnchor = true,
																	top = 0,
																	bottom = 0,
																	left = 0,
																	right = 0
																} )
																f1_local3:animateToState( "default" )
																f1_local3:addElement( f1_local1 )
																f1_local3.colorize = function ( f2_arg0 )
																	local f2_local0 = f2_arg0.r * 100 + f2_arg0.g * 10 + f2_arg0.b
																	if f1_local3.currentColor ~= f2_local0 then
																		f1_local3.currentColor = f2_local0
																		f1_local2:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																		f1_local2:animateToState( "current" )
																		self:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																		self:animateToState( "current" )
																	end
																end
																
																f1_local3.setMax = function ( f3_arg0, f3_arg1 )
																	f1_local2.m_maxScore = f3_arg0
																	f1_local2.m_maxWidth = f3_arg1 - f1_arg8 * (f1_arg7 and 1 or 0.4)
																end
																
																f1_local3.setMax( f1_arg4, f1_arg2 )
																return f1_local3
															end
														end
														f1_local10 = LUI.Alignment.Right
													end
												end
												f1_local10 = f1_arg8 * 0.6
											end
											f1_local9.right = f1_local10
											if f1_arg5 then
												f1_local10 = LUI.Alignment.Left
												if not f1_local10 then
												
												else
													f1_local9.alignment = f1_local10
													f1_local3( f1_local4, f1_local6, f1_local9 )
													f1_local1:animateToState( "default" )
													f1_local1:addElement( f1_local2 )
													f1_local1:addElement( self )
													f1_local3 = LUI.UIElement.new()
													f1_local3:setUseStencil( true )
													f1_local3.id = f1_arg0 .. "_bar"
													f1_local3:registerAnimationState( "default", {
														topAnchor = true,
														bottomAnchor = true,
														leftAnchor = true,
														rightAnchor = true,
														top = 0,
														bottom = 0,
														left = 0,
														right = 0
													} )
													f1_local3:animateToState( "default" )
													f1_local3:addElement( f1_local1 )
													f1_local3.colorize = function ( f2_arg0 )
														local f2_local0 = f2_arg0.r * 100 + f2_arg0.g * 10 + f2_arg0.b
														if f1_local3.currentColor ~= f2_local0 then
															f1_local3.currentColor = f2_local0
															f1_local2:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
															f1_local2:animateToState( "current" )
															self:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
															self:animateToState( "current" )
														end
													end
													
													f1_local3.setMax = function ( f3_arg0, f3_arg1 )
														f1_local2.m_maxScore = f3_arg0
														f1_local2.m_maxWidth = f3_arg1 - f1_arg8 * (f1_arg7 and 1 or 0.4)
													end
													
													f1_local3.setMax( f1_arg4, f1_arg2 )
													return f1_local3
												end
											end
											f1_local10 = LUI.Alignment.Right
										end
									end
									f1_local10 = 0
								end
							else
								if f1_arg5 then
									f1_local10 = -f1_arg8 * 0.6
									if not f1_local10 then
									
									else
										f1_local9.left = f1_local10
										if f1_arg7 then
											f1_local10 = 0
											if not f1_local10 then
												if f1_arg5 then
													f1_local10 = 0
													if not f1_local10 then
													
													else
														f1_local9.right = f1_local10
														if f1_arg5 then
															f1_local10 = LUI.Alignment.Left
															if not f1_local10 then
															
															else
																f1_local9.alignment = f1_local10
																f1_local3( f1_local4, f1_local6, f1_local9 )
																f1_local1:animateToState( "default" )
																f1_local1:addElement( f1_local2 )
																f1_local1:addElement( self )
																f1_local3 = LUI.UIElement.new()
																f1_local3:setUseStencil( true )
																f1_local3.id = f1_arg0 .. "_bar"
																f1_local3:registerAnimationState( "default", {
																	topAnchor = true,
																	bottomAnchor = true,
																	leftAnchor = true,
																	rightAnchor = true,
																	top = 0,
																	bottom = 0,
																	left = 0,
																	right = 0
																} )
																f1_local3:animateToState( "default" )
																f1_local3:addElement( f1_local1 )
																f1_local3.colorize = function ( f2_arg0 )
																	local f2_local0 = f2_arg0.r * 100 + f2_arg0.g * 10 + f2_arg0.b
																	if f1_local3.currentColor ~= f2_local0 then
																		f1_local3.currentColor = f2_local0
																		f1_local2:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																		f1_local2:animateToState( "current" )
																		self:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																		self:animateToState( "current" )
																	end
																end
																
																f1_local3.setMax = function ( f3_arg0, f3_arg1 )
																	f1_local2.m_maxScore = f3_arg0
																	f1_local2.m_maxWidth = f3_arg1 - f1_arg8 * (f1_arg7 and 1 or 0.4)
																end
																
																f1_local3.setMax( f1_arg4, f1_arg2 )
																return f1_local3
															end
														end
														f1_local10 = LUI.Alignment.Right
													end
												end
												f1_local10 = f1_arg8 * 0.6
											end
										else
											if f1_arg5 then
												f1_local10 = 0
												if not f1_local10 then
												
												else
													f1_local9.right = f1_local10
													if f1_arg5 then
														f1_local10 = LUI.Alignment.Left
														if not f1_local10 then
														
														else
															f1_local9.alignment = f1_local10
															f1_local3( f1_local4, f1_local6, f1_local9 )
															f1_local1:animateToState( "default" )
															f1_local1:addElement( f1_local2 )
															f1_local1:addElement( self )
															f1_local3 = LUI.UIElement.new()
															f1_local3:setUseStencil( true )
															f1_local3.id = f1_arg0 .. "_bar"
															f1_local3:registerAnimationState( "default", {
																topAnchor = true,
																bottomAnchor = true,
																leftAnchor = true,
																rightAnchor = true,
																top = 0,
																bottom = 0,
																left = 0,
																right = 0
															} )
															f1_local3:animateToState( "default" )
															f1_local3:addElement( f1_local1 )
															f1_local3.colorize = function ( f2_arg0 )
																local f2_local0 = f2_arg0.r * 100 + f2_arg0.g * 10 + f2_arg0.b
																if f1_local3.currentColor ~= f2_local0 then
																	f1_local3.currentColor = f2_local0
																	f1_local2:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																	f1_local2:animateToState( "current" )
																	self:registerAnimationState( "current", CoD.ColorizeState( f2_arg0 ) )
																	self:animateToState( "current" )
																end
															end
															
															f1_local3.setMax = function ( f3_arg0, f3_arg1 )
																f1_local2.m_maxScore = f3_arg0
																f1_local2.m_maxWidth = f3_arg1 - f1_arg8 * (f1_arg7 and 1 or 0.4)
															end
															
															f1_local3.setMax( f1_arg4, f1_arg2 )
															return f1_local3
														end
													end
													f1_local10 = LUI.Alignment.Right
												end
											end
											f1_local10 = f1_arg8 * 0.6
										end
										-- ERROR: Infinite loop detected
									end
								end
								f1_local10 = 0
							end
							f1_local9.left = f1_local10
							if f1_arg7 then
								f1_local10 = 0
								if not f1_local10 then
									if f1_arg5 then
										f1_local10 = 0
										if not f1_local10 then
										
										else
											-- ERROR: Infinite loop detected
										end
									end
									f1_local10 = f1_arg8 * 0.6
								end
							else
								-- ERROR: Infinite loop detected
							end
							-- ERROR: Infinite loop detected
						end
					end
					f1_local9 = f1_arg3
				end
			end
			f1_local6 = f1_arg3
		end
	end
	f1_local6 = f1_arg8
end

f0_local2 = function ()
	local f4_local0 = 5
	local f4_local1 = 16
	local self = LUI.UIElement.new()
	self.id = "health"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = -49,
		left = 0,
		right = 0,
		height = 16
	} )
	self:animateToState( "default" )
	local f4_local3 = LUI.UIHorizontalList.new()
	f4_local3.id = "healthBarBG"
	f4_local3:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alignment = LUI.Alignment.Left,
		alpha = 0.5
	} )
	f4_local3:animateToState( "default" )
	local f4_local4 = LUI.UIImage.new()
	f4_local4.id = "healthBarBGLeftCap"
	f4_local4:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_health_bg_ltcap" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		left = 0,
		width = f0_local1,
		bottom = 0
	} )
	f4_local4:animateToState( "default" )
	f4_local3:addElement( f4_local4 )
	local f4_local5 = LUI.UIImage.new()
	f4_local5.id = "healthBarBGFill"
	f4_local5:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 5,
		left = 0,
		right = 0,
		height = 11,
		red = 0,
		green = 0,
		blue = 0
	} )
	f4_local5:animateToState( "default" )
	f4_local3:addElement( f4_local5 )
	local f4_local6 = LUI.UIImage.new()
	f4_local6.id = "healthBarBGRightCap"
	f4_local6:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_health_bg_rtcap" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 3,
		left = 0,
		width = f4_local1,
		height = 16
	} )
	f4_local6:animateToState( "default" )
	f4_local3:addElement( f4_local6 )
	local f4_local7 = LUI.UIElement.new()
	f4_local7.id = "healthBarContainer"
	f4_local7:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 7,
		left = f0_local1,
		right = 0,
		height = 12
	} )
	f4_local7:animateToState( "default" )
	local f4_local8 = LUI.UIElement.new()
	f4_local8.id = "healthBarTicks"
	f4_local8:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 4,
		left = 0,
		right = 0,
		height = 12
	} )
	f4_local8:animateToState( "default" )
	for f4_local9 = 0, f4_local0 - 1, 1 do
		local f4_local12 = LUI.UIImage.new()
		f4_local12.id = "tick_" .. f4_local9
		f4_local12:registerAnimationState( "default", {
			material = RegisterMaterial( "alien_health_bg_tic" ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			top = 0,
			left = f0_local1 + f0_local0 * (1 + f4_local9 / 4) - 14,
			width = 12,
			height = 12,
			alpha = 0
		} )
		f4_local12:registerAnimationState( "visible", {
			alpha = 1
		} )
		f4_local12:animateToState( "default" )
		f4_local8:addElement( f4_local12 )
		f4_local8["tick_" .. f4_local9] = f4_local12
	end
	local f4_local9 = LUI.UIImage.new()
	f4_local9.id = "healthIcon"
	f4_local9:registerAnimationState( "default", {
		material = RegisterMaterial( "hud_health_plus_icon" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 2,
		left = 42,
		width = 13,
		height = 13,
		red = 0.55,
		green = 0.78,
		blue = 0.25
	} )
	f4_local9:animateToState( "default" )
	local f4_local10 = nil
	local f4_local11 = LUI.UIElement.new()
	f4_local11:setupUIIntWatch( "PlayerHealth" )
	f4_local11.id = "health_watch"
	local f4_local13 = function ( f5_arg0, f5_arg1 )
		local f5_local0 = 25
		if f4_local10 then
			if f5_arg1.newValue <= f5_local0 then
				f4_local10.colorize( {
					r = 0.94,
					g = 0.25,
					b = 0
				} )
			elseif f5_local0 < f5_arg1.newValue then
				f4_local10.colorize( {
					r = 0.55,
					g = 0.78,
					b = 0.25
				} )
			end
		end
	end
	
	f4_local11:registerEventHandler( "int_watch_alert", f4_local13 )
	local f4_local12 = LUI.UIElement.new()
	f4_local12:setupUIIntWatch( "PlayerMaxHealth" )
	f4_local12.id = "maxHealthWatch"
	f4_local12:registerEventHandler( "int_watch_alert", function ( element, event )
		if event.newValue > 0 then
			if not f4_local10 then
				f4_local10 = GradientBarFactory( "health", "PlayerHealth", 0, 12, event.newValue, true, false, false, 12 )
				f4_local7:addElement( f4_local10 )
				f4_local13( element, {
					name = "int_watch_alert",
					newValue = Game.GetPlayerHealth()
				} )
			end
			local f6_local0 = f0_local0 * event.newValue / 100
			self:registerAnimationState( "current", {
				topAnchor = false,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = false,
				top = -48,
				left = 0,
				right = f6_local0 + f0_local1,
				height = 16
			} )
			f4_local10.setMax( event.newValue, f6_local0 )
			f4_local5:registerAnimationState( "current", {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				top = 5,
				left = 0,
				right = f6_local0 - f4_local1,
				height = 11
			} )
			self:animateToState( "current" )
			f4_local5:animateToState( "current" )
			for f6_local1 = 0, f4_local0 - 1, 1 do
				if 100 + f6_local1 * 25 <= event.newValue then
					f4_local8["tick_" .. f6_local1].animateToState( REG7["tick_" .. f6_local1], "visible" )
				else
					f4_local8["tick_" .. f6_local1].animateToState( REG7["tick_" .. f6_local1], "default" )
				end
			end
		end
	end )
	self:addElement( f4_local3 )
	self:addElement( f4_local9 )
	self:addElement( f4_local7 )
	self:addElement( f4_local8 )
	self:addElement( f4_local11 )
	self:addElement( f4_local12 )
	self:addElement( riotshieldIcon )
	self:addElement( riotshieldAmmo )
	return self
end

function ShieldBar()
	local f7_local0 = 8
	local f7_local1 = f0_local0 * 1.25
	local self = LUI.UIElement.new()
	self.id = "shield"
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = -31,
		left = 0,
		right = f7_local1 + f0_local1,
		height = 16
	} )
	self:animateToState( "default" )
	local f7_local3 = LUI.UIHorizontalList.new()
	f7_local3.id = "shieldBarBG"
	f7_local3:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alignment = LUI.Alignment.Left,
		alpha = 0.5
	} )
	f7_local3:animateToState( "default" )
	local f7_local4 = LUI.UIImage.new()
	f7_local4.id = "shieldBarBGLeftCap"
	f7_local4:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_shield_bg_ltcap" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		left = 0,
		width = f0_local1,
		bottom = 16
	} )
	f7_local4:animateToState( "default" )
	f7_local3:addElement( f7_local4 )
	local f7_local5 = LUI.UIImage.new()
	f7_local5.id = "shieldBarBGFill"
	f7_local5:registerAnimationState( "default", {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		left = 0,
		right = f7_local1 - f7_local0,
		height = 4,
		red = 0,
		green = 0,
		blue = 0
	} )
	f7_local5:animateToState( "default" )
	f7_local3:addElement( f7_local5 )
	local f7_local6 = LUI.UIImage.new()
	f7_local6.id = "shieldBarBGRightCap"
	f7_local6:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_shield_bg_rtcap" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -6,
		left = 0,
		width = f7_local0,
		height = 16
	} )
	f7_local6:animateToState( "default" )
	f7_local3:addElement( f7_local6 )
	local f7_local7 = LUI.UIImage.new()
	f7_local7.id = "shieldBarTick"
	f7_local7:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_shield_tic" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -9,
		left = f0_local1 + f7_local1 - 10,
		width = f7_local0,
		bottom = 16
	} )
	f7_local7:animateToState( "default" )
	self:addElement( f7_local7 )
	local f7_local8 = LUI.UIElement.new()
	f7_local8.id = "shieldBarContainer"
	f7_local8:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = -1,
		left = f0_local1,
		right = 0,
		height = 4
	} )
	f7_local8:animateToState( "default" )
	local f7_local9 = LUI.UIImage.new()
	f7_local9.id = "shieldIcon"
	f7_local9:registerAnimationState( "default", {
		material = RegisterMaterial( "hud_health_shield_icon" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 2,
		left = 42,
		width = 13,
		height = 13,
		red = 0,
		green = 0.68,
		blue = 0.94
	} )
	f7_local9:animateToState( "default" )
	local f7_local10 = GradientBarFactory( "shield", "PlayerArmor", f0_local0, 4, 100, true, true, false, 8 )
	f7_local10.colorize( {
		r = 0,
		g = 0.68,
		b = 0.94
	} )
	f7_local8:addElement( f7_local10 )
	self:addElement( f7_local3 )
	self:addElement( f7_local9 )
	self:addElement( f7_local8 )
	self:addElement( f7_local7 )
	return self
end

function PlayerHealthMeter()
	local self = LUI.UIElement.new()
	self.id = "health_meter"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		left = 0,
		width = 400,
		height = 200
	} )
	self:animateToState( "default" )
	local f8_local1 = LUI.UIImage.new()
	f8_local1.id = "background"
	f8_local1:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_health_bg_shadow" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		top = -64,
		bottom = 0,
		left = 0,
		right = 286,
		alpha = 0.35
	} )
	f8_local1:animateToState( "default" )
	local f8_local2
	if Game.GetOmnvar( "zm_ui_is_solo" ) or utils.cp.AliensUtils.IsChaosMode() then
		f8_local2 = 30
		if not f8_local2 then
		
		else
			local f8_local3 = LUI.UIElement.new()
			f8_local3.id = "health_meter"
			f8_local3:registerAnimationState( "default", {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = false,
				top = 0,
				bottom = 16,
				left = -25 + f8_local2,
				right = 0,
				alpha = 1
			} )
			f8_local3:registerAnimationState( "animating", {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = false,
				top = 0,
				bottom = 16,
				left = -5 + f8_local2,
				right = 0,
				alpha = 1
			} )
			f8_local3:registerAnimationState( "hidden", {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = false,
				top = 0,
				bottom = 16,
				left = -345 + f8_local2,
				right = 0,
				alpha = 0
			} )
			f8_local3:animateToState( "default" )
			f8_local3:addElement( f8_local1 )
			f8_local3:addElement( f0_local2() )
			f8_local3:addElement( ShieldBar() )
			local f8_local4 = function ( f9_arg0, f9_arg1 )
				if f9_arg1.value then
					local f9_local0 = MBh.AnimateSequence( {
						{
							"animating",
							125,
							true,
							true
						},
						{
							"hidden",
							250,
							true,
							true
						}
					} )
					f9_local0( f9_arg0, {} )
				else
					local f9_local0 = MBh.AnimateSequence( {
						{
							"animating",
							250,
							true,
							true
						},
						{
							"default",
							125,
							true,
							true
						}
					} )
					f9_local0( f9_arg0, {} )
				end
			end
			
			f8_local3:registerOmnvarHandler( "zm_ui_player_in_laststand", f8_local4 )
			local f8_local5 = Game.GetOmnvar( "zm_ui_player_in_laststand" )
			if f8_local5 then
				f8_local4( f8_local3, {
					value = f8_local5
				} )
			end
			self:addElement( f8_local3 )
			if Engine.GetDvarString( "ui_mapname" ) == "cp_beacon" then
				self:addElement( crafting_items( self ) )
			end
			return self
		end
	end
	f8_local2 = 0
end

MenuBuilder.registerType( "PlayerHealthMeter", PlayerHealthMeter )
LockTable( _M )
