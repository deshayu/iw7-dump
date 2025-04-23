local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg0.ThrustersText and f1_arg0.MissilesText and f1_arg0.FiringModeText and f1_arg0.ToggleThermalText then
		f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
			element.ThrustersText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_THOR_THRUSTERS" ) ), 0 )
			element.MissilesText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_THOR_MISSILES" ) ), 0 )
			element.FiringModeText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_THOR_FIRING_MODE" ) ), 0 )
			element.ToggleThermalText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_THOR_TOGGLE_THERMAL" ) ), 0 )
		end )
	end
end

function ThorControls( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ThorControls"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local f3_local3 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f3_local3 = LUI.UIText.new()
		f3_local3.id = "ThrustersText"
		f3_local3:setText( Engine.Localize( "LUA_MENU_MP_THOR_THRUSTERS" ), 0 )
		f3_local3:SetFontSize( 26 * _1080p )
		f3_local3:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local3:setTextStyle( CoD.TextStyle.Shadowed )
		f3_local3:SetAlignment( LUI.Alignment.Center )
		f3_local3:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -855, _1080p * -167, _1080p * -615, _1080p * -589 )
		self:addElement( f3_local3 )
		self.ThrustersText = f3_local3
	end
	local f3_local4 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f3_local4 = LUI.UIText.new()
		f3_local4.id = "MissilesText"
		f3_local4:setText( Engine.Localize( "LUA_MENU_MP_THOR_MISSILES" ), 0 )
		f3_local4:SetFontSize( 26 * _1080p )
		f3_local4:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local4:setTextStyle( CoD.TextStyle.Shadowed )
		f3_local4:SetAlignment( LUI.Alignment.Center )
		f3_local4:SetOptOutRightToLeftAlignmentFlip( true )
		f3_local4:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 167, _1080p * 855, _1080p * -493, _1080p * -467 )
		self:addElement( f3_local4 )
		self.MissilesText = f3_local4
	end
	local f3_local5 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f3_local5 = LUI.UIText.new()
		f3_local5.id = "FiringModeText"
		f3_local5:setText( Engine.Localize( "LUA_MENU_MP_THOR_FIRING_MODE" ), 0 )
		f3_local5:SetFontSize( 26 * _1080p )
		f3_local5:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local5:setTextStyle( CoD.TextStyle.Shadowed )
		f3_local5:SetAlignment( LUI.Alignment.Center )
		f3_local5:SetOptOutRightToLeftAlignmentFlip( true )
		f3_local5:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 167, _1080p * 855, _1080p * -615, _1080p * -589 )
		self:addElement( f3_local5 )
		self.FiringModeText = f3_local5
	end
	local f3_local6 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f3_local6 = LUI.UIText.new()
		f3_local6.id = "ToggleThermalText"
		f3_local6:setText( Engine.Localize( "LUA_MENU_MP_THOR_TOGGLE_THERMAL" ), 0 )
		f3_local6:SetFontSize( 26 * _1080p )
		f3_local6:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local6:setTextStyle( CoD.TextStyle.Shadowed )
		f3_local6:SetAlignment( LUI.Alignment.Center )
		f3_local6:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -855, _1080p * -167, _1080p * -493, _1080p * -467 )
		self:addElement( f3_local6 )
		self.ToggleThermalText = f3_local6
	end
	local Reticle = nil
	
	Reticle = LUI.UIImage.new()
	Reticle.id = "Reticle"
	Reticle:setImage( RegisterMaterial( "hud_scorestreak_thor_reticle" ), 0 )
	Reticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( Reticle )
	self.Reticle = Reticle
	
	local FireModeBG = nil
	
	FireModeBG = LUI.UIImage.new()
	FireModeBG.id = "FireModeBG"
	FireModeBG:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	FireModeBG:SetAlpha( 0.5, 0 )
	FireModeBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -78, _1080p * 76, _1080p * -146, _1080p * -126 )
	self:addElement( FireModeBG )
	self.FireModeBG = FireModeBG
	
	local TextSingleFire = nil
	
	TextSingleFire = LUI.UIText.new()
	TextSingleFire.id = "TextSingleFire"
	TextSingleFire:setText( ToUpperCase( Engine.Localize( "KILLSTREAKS_THOR_SINGLE_FIRE" ) ), 0 )
	TextSingleFire:SetFontSize( 16 * _1080p )
	TextSingleFire:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextSingleFire:SetAlignment( LUI.Alignment.Center )
	TextSingleFire:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -76, _1080p * 74, _1080p * 126, _1080p * 142 )
	self:addElement( TextSingleFire )
	self.TextSingleFire = TextSingleFire
	
	local TextTrackingCluster = nil
	
	TextTrackingCluster = LUI.UIText.new()
	TextTrackingCluster.id = "TextTrackingCluster"
	TextTrackingCluster:setText( ToUpperCase( Engine.Localize( "KILLSTREAKS_THOR_TRACKING_CLUSTER" ) ), 0 )
	TextTrackingCluster:SetFontSize( 16 * _1080p )
	TextTrackingCluster:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextTrackingCluster:SetAlignment( LUI.Alignment.Center )
	TextTrackingCluster:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * 75, _1080p * -144, _1080p * -128 )
	self:addElement( TextTrackingCluster )
	self.TextTrackingCluster = TextTrackingCluster
	
	local TopPips = nil
	
	TopPips = LUI.UIImage.new()
	TopPips.id = "TopPips"
	TopPips:SetAlpha( 0.65, 0 )
	TopPips:setImage( RegisterMaterial( "hud_scorestreak_thor_pips_horz" ), 0 )
	TopPips:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 103, _1080p * -5 )
	self:addElement( TopPips )
	self.TopPips = TopPips
	
	local BottomPips = nil
	
	BottomPips = LUI.UIImage.new()
	BottomPips.id = "BottomPips"
	BottomPips:SetAlpha( 0.65, 0 )
	BottomPips:setImage( RegisterMaterial( "hud_scorestreak_thor_pips_horz" ), 0 )
	BottomPips:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -138, _1080p * -30 )
	self:addElement( BottomPips )
	self.BottomPips = BottomPips
	
	local RightPips = nil
	
	RightPips = LUI.UIImage.new()
	RightPips.id = "RightPips"
	RightPips:SetAlpha( 0.65, 0 )
	RightPips:setImage( RegisterMaterial( "hud_scorestreak_thor_pips_vert" ), 0 )
	RightPips:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -30, _1080p * -286, _1080p * -430, _1080p * 430 )
	self:addElement( RightPips )
	self.RightPips = RightPips
	
	local LeftPips = nil
	
	LeftPips = LUI.UIImage.new()
	LeftPips.id = "LeftPips"
	LeftPips:SetAlpha( 0.65, 0 )
	LeftPips:setImage( RegisterMaterial( "hud_scorestreak_thor_pips_vert" ), 0 )
	LeftPips:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 30, _1080p * 286, _1080p * -430, _1080p * 430 )
	self:addElement( LeftPips )
	self.LeftPips = LeftPips
	
	local ReticleCrosshairsRed = nil
	
	ReticleCrosshairsRed = LUI.UIImage.new()
	ReticleCrosshairsRed.id = "ReticleCrosshairsRed"
	ReticleCrosshairsRed:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 0 )
	ReticleCrosshairsRed:SetAlpha( 0, 0 )
	ReticleCrosshairsRed:setImage( RegisterMaterial( "hud_scorestreak_thor_reticle_crosshairs" ), 0 )
	ReticleCrosshairsRed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -41, _1080p * 39, _1080p * -40, _1080p * 40 )
	self:addElement( ReticleCrosshairsRed )
	self.ReticleCrosshairsRed = ReticleCrosshairsRed
	
	local ReticleCrosshairsRed2 = nil
	
	ReticleCrosshairsRed2 = LUI.UIImage.new()
	ReticleCrosshairsRed2.id = "ReticleCrosshairsRed2"
	ReticleCrosshairsRed2:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 0 )
	ReticleCrosshairsRed2:SetAlpha( 0, 0 )
	ReticleCrosshairsRed2:setImage( RegisterMaterial( "hud_scorestreak_thor_reticle_crosshairs" ), 0 )
	ReticleCrosshairsRed2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -41, _1080p * 39, _1080p * -40, _1080p * 40 )
	self:addElement( ReticleCrosshairsRed2 )
	self.ReticleCrosshairsRed2 = ReticleCrosshairsRed2
	
	local ScorestreakStatus = nil
	
	ScorestreakStatus = MenuBuilder.BuildRegisteredType( "ScorestreakStatus", {
		controllerIndex = f3_local1
	} )
	ScorestreakStatus.id = "ScorestreakStatus"
	ScorestreakStatus.VenomOnlineText:setText( Engine.Localize( "LUA_MENU_MP_THOR_ONLINE" ), 0 )
	ScorestreakStatus:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -178, _1080p * 222, _1080p * -812, _1080p * -780 )
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
	
	local ThorMissileGrid = nil
	
	ThorMissileGrid = MenuBuilder.BuildRegisteredType( "ThorMissileGrid", {
		controllerIndex = f3_local1
	} )
	ThorMissileGrid.id = "ThorMissileGrid"
	ThorMissileGrid:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -244, _1080p * 256, _1080p * -292.38, _1080p * -236.38 )
	self:addElement( ThorMissileGrid )
	self.ThorMissileGrid = ThorMissileGrid
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.MissileWarningOn = function ()
			
		end
		
		self._sequences.MissileWarningOff = function ()
			
		end
		
		FireModeBG:RegisterAnimationSequence( "FireMode1", {
			{
				function ()
					return self.FireModeBG:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FireModeBG:SetAlpha( 0.5, 250 )
				end
			},
			{
				function ()
					return self.FireModeBG:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.FireModeBG:SetRGBFromTable( SWATCHES.HUD.active, 250 )
				end
			},
			{
				function ()
					return self.FireModeBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -78, _1080p * 76, _1080p * -146, _1080p * -126, 0 )
				end
			}
		} )
		self._sequences.FireMode1 = function ()
			FireModeBG:AnimateSequence( "FireMode1" )
		end
		
		FireModeBG:RegisterAnimationSequence( "FireMode2", {
			{
				function ()
					return self.FireModeBG:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.FireModeBG:SetRGBFromTable( SWATCHES.HUD.active, 250 )
				end
			},
			{
				function ()
					return self.FireModeBG:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FireModeBG:SetAlpha( 0.5, 250 )
				end
			},
			{
				function ()
					return self.FireModeBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -78, _1080p * 76, _1080p * 125, _1080p * 144, 0 )
				end
			}
		} )
		self._sequences.FireMode2 = function ()
			FireModeBG:AnimateSequence( "FireMode2" )
		end
		
		ReticleCrosshairsRed:RegisterAnimationSequence( "FlashReticle", {
			{
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end
			}
		} )
		ReticleCrosshairsRed2:RegisterAnimationSequence( "FlashReticle", {
			{
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReticleCrosshairsRed2:SetAlpha( 0, 240, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.FlashReticle = function ()
			ReticleCrosshairsRed:AnimateSequence( "FlashReticle" )
			ReticleCrosshairsRed2:AnimateSequence( "FlashReticle" )
		end
		
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f3_local3:RegisterAnimationSequence( "BootupSpectator", {
				{
					function ()
						return self.ThrustersText:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f3_local4:RegisterAnimationSequence( "BootupSpectator", {
				{
					function ()
						return self.MissilesText:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f3_local5:RegisterAnimationSequence( "BootupSpectator", {
				{
					function ()
						return self.FiringModeText:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f3_local6:RegisterAnimationSequence( "BootupSpectator", {
				{
					function ()
						return self.ToggleThermalText:SetAlpha( 0, 0 )
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
		self._sequences.BootupSpectator = function ()
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f3_local3:AnimateSequence( "BootupSpectator" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f3_local4:AnimateSequence( "BootupSpectator" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f3_local5:AnimateSequence( "BootupSpectator" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f3_local6:AnimateSequence( "BootupSpectator" )
			end
			ScorestreakStatus:AnimateSequence( "BootupSpectator" )
		end
		
		ScorestreakStatus:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.ScorestreakStatus:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -178, _1080p * 222, _1080p * 268, _1080p * 300, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			ScorestreakStatus:AnimateSequence( "Splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.missileWarningVisible:GetModel( f3_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.missileWarningVisible:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.missileWarningVisible:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "MissileWarningOn" )
		end
		if DataSources.inGame.MP.scorestreakHuds.missileWarningVisible:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.missileWarningVisible:GetValue( f3_local1 ) == false then
			ACTIONS.AnimateSequence( self, "MissileWarningOff" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.thorMissilesCurrentState:GetModel( f3_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.thorMissilesCurrentState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.thorMissilesCurrentState:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "FireMode1" )
		end
		if DataSources.inGame.MP.scorestreakHuds.thorMissilesCurrentState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.thorMissilesCurrentState:GetValue( f3_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "FireMode2" )
		end
	end )
	local f3_local20 = function ()
		if DataSources.inGame.MP.scorestreakHuds.thorMissilesLoaded:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.thorMissilesLoaded:GetValue( f3_local1 ) == 0 and DataSources.inGame.MP.scorestreakHuds.thorMissilesCurrentState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.thorMissilesCurrentState:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "FlashReticle" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.thorMissilesLoaded:GetModel( f3_local1 ), f3_local20 )
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.thorMissilesCurrentState:GetModel( f3_local1 ), f3_local20 )
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.thorMissilesVisible:GetModel( f3_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.thorMissilesVisible:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.thorMissilesVisible:GetValue( f3_local1 ) == 1 and (CONDITIONS.InKillCam( self ) or CONDITIONS.IsSpectating( self )) then
			ACTIONS.AnimateSequence( self, "BootupSpectator" )
		end
		if DataSources.inGame.MP.scorestreakHuds.thorMissilesVisible:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.thorMissilesVisible:GetValue( f3_local1 ) == 1 and CONDITIONS.IsSplitscreen( self ) then
			ACTIONS.AnimateSequence( self, "Splitscreen" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ScorestreakStatus",
		sequenceName = "YellowOrangeState",
		elementPath = "ScorestreakStatus"
	} )
	ACTIONS.AnimateSequence( self, "MissileWarningOff" )
	return self
end

MenuBuilder.registerType( "ThorControls", ThorControls )
LockTable( _M )
