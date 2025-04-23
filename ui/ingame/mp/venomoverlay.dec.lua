local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg0.RT and f1_arg0.L3Press and f1_arg0.A then
		f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
			element.RT:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_VENOM_EXPLODE" ) ), 0 )
			element.L3Press:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_VENOM_BOOST" ) ), 0 )
			element.A:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_VENOM_JUMP" ) ), 0 )
		end )
	end
	if GameX.IsSplitscreen() then
		assert( f1_arg0.ScorestreakStatus )
		assert( f1_arg0.A )
		assert( f1_arg0.L3Press )
		assert( f1_arg0.RT )
		f1_arg0.ScorestreakStatus:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -178, _1080p * 222, _1080p * -132, _1080p * -100 )
		if f1_arg0.RT and f1_arg0.L3Press and f1_arg0.A then
			f1_arg0.RT:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 189, _1080p * 805, _1080p * -143, _1080p * -115 )
			f1_arg0.L3Press:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -805, _1080p * -189, _1080p * -143, _1080p * -115 )
			f1_arg0.A:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -400, _1080p * 400, _1080p * -79, _1080p * -51 )
		end
	end
end

function VenomOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "VenomOverlay"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local DotRowBottomRight = nil
	
	DotRowBottomRight = LUI.UIImage.new()
	DotRowBottomRight.id = "DotRowBottomRight"
	DotRowBottomRight:SetAlpha( 0.35, 0 )
	DotRowBottomRight:setImage( RegisterMaterial( "hud_venom_dot_row" ), 0 )
	DotRowBottomRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	DotRowBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 960, _1080p * 280, _1080p * -143, _1080p * -15 )
	self:addElement( DotRowBottomRight )
	self.DotRowBottomRight = DotRowBottomRight
	
	local DotRowBottomLeft = nil
	
	DotRowBottomLeft = LUI.UIImage.new()
	DotRowBottomLeft.id = "DotRowBottomLeft"
	DotRowBottomLeft:SetAlpha( 0.35, 0 )
	DotRowBottomLeft:setImage( RegisterMaterial( "hud_venom_dot_row" ), 0 )
	DotRowBottomLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	DotRowBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -960, _1080p * -280, _1080p * -143, _1080p * -15 )
	self:addElement( DotRowBottomLeft )
	self.DotRowBottomLeft = DotRowBottomLeft
	
	local MeterLeft = nil
	
	MeterLeft = LUI.UIImage.new()
	MeterLeft.id = "MeterLeft"
	MeterLeft:SetAlpha( 0.6, 0 )
	MeterLeft:setImage( RegisterMaterial( "hud_venom_meter_left" ), 0 )
	MeterLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	MeterLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -396, _1080p * -332, _1080p * -256, _1080p * 256 )
	self:addElement( MeterLeft )
	self.MeterLeft = MeterLeft
	
	local MeterRight = nil
	
	MeterRight = LUI.UIImage.new()
	MeterRight.id = "MeterRight"
	MeterRight:SetAlpha( 0.6, 0 )
	MeterRight:setImage( RegisterMaterial( "hud_venom_meter_right" ), 0 )
	MeterRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	MeterRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 332, _1080p * 396, _1080p * -256, _1080p * 256 )
	self:addElement( MeterRight )
	self.MeterRight = MeterRight
	
	local f3_local7 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f3_local7 = LUI.UIText.new()
		f3_local7.id = "RT"
		f3_local7:setText( Engine.Localize( "LUA_MENU_MP_VENOM_EXPLODE" ), 0 )
		f3_local7:SetFontSize( 26 * _1080p )
		f3_local7:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local7:setTextStyle( CoD.TextStyle.Shadowed )
		f3_local7:SetAlignment( LUI.Alignment.Center )
		f3_local7:SetOptOutRightToLeftAlignmentFlip( true )
		f3_local7:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 189, _1080p * 805, _1080p * -219, _1080p * -193 )
		self:addElement( f3_local7 )
		self.RT = f3_local7
	end
	local f3_local8 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f3_local8 = LUI.UIText.new()
		f3_local8.id = "L3Press"
		f3_local8:setText( Engine.Localize( "LUA_MENU_MP_VENOM_BOOST" ), 0 )
		f3_local8:SetFontSize( 26 * _1080p )
		f3_local8:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local8:setTextStyle( CoD.TextStyle.Shadowed )
		f3_local8:SetAlignment( LUI.Alignment.Center )
		f3_local8:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -805, _1080p * -189, _1080p * -219, _1080p * -193 )
		self:addElement( f3_local8 )
		self.L3Press = f3_local8
	end
	local f3_local9 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f3_local9 = LUI.UIText.new()
		f3_local9.id = "A"
		f3_local9:setText( Engine.Localize( "LUA_MENU_MP_VENOM_JUMP" ), 0 )
		f3_local9:SetFontSize( 26 * _1080p )
		f3_local9:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local9:setTextStyle( CoD.TextStyle.Shadowed )
		f3_local9:SetAlignment( LUI.Alignment.Center )
		f3_local9:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -400, _1080p * 400, _1080p * -131, _1080p * -105 )
		self:addElement( f3_local9 )
		self.A = f3_local9
	end
	local ScorestreakStatus = nil
	
	ScorestreakStatus = MenuBuilder.BuildRegisteredType( "ScorestreakStatus", {
		controllerIndex = f3_local1
	} )
	ScorestreakStatus.id = "ScorestreakStatus"
	ScorestreakStatus.VenomOnlineText:setText( Engine.Localize( "LUA_MENU_MP_VENOM_ONLINE" ), 0 )
	ScorestreakStatus:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -175, _1080p * 225, _1080p * -207, _1080p * -175 )
	self:addElement( ScorestreakStatus )
	self.ScorestreakStatus = ScorestreakStatus
	
	local MissileIncomingWarning = nil
	
	MissileIncomingWarning = MenuBuilder.BuildRegisteredType( "MissileIncomingWarning", {
		controllerIndex = f3_local1
	} )
	MissileIncomingWarning.id = "MissileIncomingWarning"
	MissileIncomingWarning:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * 55, _1080p * 311 )
	self:addElement( MissileIncomingWarning )
	self.MissileIncomingWarning = MissileIncomingWarning
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DotRowBottomRight:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.DotRowBottomRight:SetAlpha( 0.35, 0 )
				end
			},
			{
				function ()
					return self.DotRowBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 960, _1080p * 280, _1080p * -43, _1080p * 85, 0 )
				end,
				function ()
					return self.DotRowBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 960, _1080p * 280, _1080p * -143, _1080p * -15, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		DotRowBottomLeft:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.DotRowBottomLeft:SetAlpha( 0.35, 0 )
				end
			},
			{
				function ()
					return self.DotRowBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -960, _1080p * -280, _1080p * -43, _1080p * 85, 0 )
				end,
				function ()
					return self.DotRowBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -960, _1080p * -280, _1080p * -143, _1080p * -15, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		MeterLeft:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.MeterLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MeterLeft:SetAlpha( 0.6, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.MeterLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, 0, _1080p * -256, _1080p * 256, 0 )
				end,
				function ()
					return self.MeterLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -396, _1080p * -332, _1080p * -256, _1080p * 256, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		MeterRight:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.MeterRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MeterRight:SetAlpha( 0.6, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.MeterRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 64, _1080p * -256, _1080p * 256, 0 )
				end,
				function ()
					return self.MeterRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 332, _1080p * 396, _1080p * -256, _1080p * 256, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f3_local7:RegisterAnimationSequence( "BootUp", {
				{
					function ()
						return self.RT:SetAlpha( 0, 370 )
					end,
					function ()
						return self.RT:SetAlpha( 1, 260, LUI.EASING.outQuadratic )
					end
				},
				{
					function ()
						return self.RT:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 298, _1080p * 914, _1080p * -205, _1080p * -173, 370 )
					end,
					function ()
						return self.RT:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 248, _1080p * 864, _1080p * -205, _1080p * -173, 259, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f3_local8:RegisterAnimationSequence( "BootUp", {
				{
					function ()
						return self.L3Press:SetAlpha( 0, 370 )
					end,
					function ()
						return self.L3Press:SetAlpha( 1, 260, LUI.EASING.outQuadratic )
					end
				},
				{
					function ()
						return self.L3Press:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -914, _1080p * -298, _1080p * -205, _1080p * -173, 370 )
					end,
					function ()
						return self.L3Press:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -864, _1080p * -248, _1080p * -205, _1080p * -173, 259, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f3_local9:RegisterAnimationSequence( "BootUp", {
				{
					function ()
						return self.A:SetAlpha( 0, 500 )
					end,
					function ()
						return self.A:SetAlpha( 1, 250, LUI.EASING.inOutQuadratic )
					end
				}
			} )
		end
		ScorestreakStatus:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ScorestreakStatus:SetAlpha( 1, 0 )
				end
			}
		} )
		MissileIncomingWarning:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.MissileIncomingWarning:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.BootUp = function ()
			DotRowBottomRight:AnimateSequence( "BootUp" )
			DotRowBottomLeft:AnimateSequence( "BootUp" )
			MeterLeft:AnimateSequence( "BootUp" )
			MeterRight:AnimateSequence( "BootUp" )
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f3_local7:AnimateSequence( "BootUp" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f3_local8:AnimateSequence( "BootUp" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f3_local9:AnimateSequence( "BootUp" )
			end
			ScorestreakStatus:AnimateSequence( "BootUp" )
			MissileIncomingWarning:AnimateSequence( "BootUp" )
		end
		
		DotRowBottomRight:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.DotRowBottomRight:SetAlpha( 0, 0 )
				end
			}
		} )
		DotRowBottomLeft:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.DotRowBottomLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		MeterLeft:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.MeterLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		MeterRight:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.MeterRight:SetAlpha( 0, 0 )
				end
			}
		} )
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f3_local7:RegisterAnimationSequence( "HideAll", {
				{
					function ()
						return self.RT:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f3_local8:RegisterAnimationSequence( "HideAll", {
				{
					function ()
						return self.L3Press:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f3_local9:RegisterAnimationSequence( "HideAll", {
				{
					function ()
						return self.A:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		ScorestreakStatus:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.ScorestreakStatus:SetAlpha( 0, 0 )
				end
			}
		} )
		MissileIncomingWarning:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.MissileIncomingWarning:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideAll = function ()
			DotRowBottomRight:AnimateSequence( "HideAll" )
			DotRowBottomLeft:AnimateSequence( "HideAll" )
			MeterLeft:AnimateSequence( "HideAll" )
			MeterRight:AnimateSequence( "HideAll" )
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f3_local7:AnimateSequence( "HideAll" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f3_local8:AnimateSequence( "HideAll" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f3_local9:AnimateSequence( "HideAll" )
			end
			ScorestreakStatus:AnimateSequence( "HideAll" )
			MissileIncomingWarning:AnimateSequence( "HideAll" )
		end
		
		DotRowBottomRight:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.DotRowBottomRight:SetAlpha( 0.35, 0 )
				end
			},
			{
				function ()
					return self.DotRowBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 960, _1080p * 280, _1080p * -43, _1080p * 85, 0 )
				end,
				function ()
					return self.DotRowBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 960, _1080p * 280, _1080p * -143, _1080p * -15, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		DotRowBottomLeft:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.DotRowBottomLeft:SetAlpha( 0.35, 0 )
				end
			},
			{
				function ()
					return self.DotRowBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -960, _1080p * -280, _1080p * -43, _1080p * 85, 0 )
				end,
				function ()
					return self.DotRowBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -960, _1080p * -280, _1080p * -143, _1080p * -15, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		MeterLeft:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.MeterLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MeterLeft:SetAlpha( 0.6, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.MeterLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, 0, _1080p * -256, _1080p * 256, 0 )
				end,
				function ()
					return self.MeterLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -396, _1080p * -332, _1080p * -256, _1080p * 256, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		MeterRight:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.MeterRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MeterRight:SetAlpha( 0.6, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.MeterRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 64, _1080p * -256, _1080p * 256, 0 )
				end,
				function ()
					return self.MeterRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 332, _1080p * 396, _1080p * -256, _1080p * 256, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f3_local7:RegisterAnimationSequence( "BootupSpectator", {
				{
					function ()
						return self.RT:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f3_local8:RegisterAnimationSequence( "BootupSpectator", {
				{
					function ()
						return self.L3Press:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f3_local9:RegisterAnimationSequence( "BootupSpectator", {
				{
					function ()
						return self.A:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		ScorestreakStatus:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.ScorestreakStatus:SetAlpha( 0, 0 )
				end
			}
		} )
		MissileIncomingWarning:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.MissileIncomingWarning:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.BootupSpectator = function ()
			DotRowBottomRight:AnimateSequence( "BootupSpectator" )
			DotRowBottomLeft:AnimateSequence( "BootupSpectator" )
			MeterLeft:AnimateSequence( "BootupSpectator" )
			MeterRight:AnimateSequence( "BootupSpectator" )
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f3_local7:AnimateSequence( "BootupSpectator" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f3_local8:AnimateSequence( "BootupSpectator" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f3_local9:AnimateSequence( "BootupSpectator" )
			end
			ScorestreakStatus:AnimateSequence( "BootupSpectator" )
			MissileIncomingWarning:AnimateSequence( "BootupSpectator" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.venomVisible:GetModel( f3_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.venomVisible:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.venomVisible:GetValue( f3_local1 ) == 1 and not CONDITIONS.InKillCam( self ) then
			ACTIONS.AnimateSequence( self, "BootUp" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "ScorestreakStatus",
				sequenceName = "DefaultBlueState",
				elementPath = "ScorestreakStatus"
			} )
		end
		if DataSources.inGame.MP.scorestreakHuds.venomVisible:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.venomVisible:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "HideAll" )
		end
		if DataSources.inGame.MP.scorestreakHuds.venomVisible:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.venomVisible:GetValue( f3_local1 ) == 1 and (CONDITIONS.InKillCam( self ) or CONDITIONS.IsSpectating( self )) then
			ACTIONS.AnimateSequence( self, "BootupSpectator" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "VenomOverlay", VenomOverlay )
LockTable( _M )
