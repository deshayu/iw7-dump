local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg0.ButtonHintRT and f1_arg0.ButtonHintLT then
		f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
			element.ButtonHintRT:setText( Engine.Localize( "LUA_MENU_MP_RC8_FIRE" ), 0 )
			element.ButtonHintLT:setText( Engine.Localize( "LUA_MENU_MP_RC8_SHIELD" ), 0 )
		end )
	end
	local f1_local0 = function ( f3_arg0 )
		local f3_local0 = nil
		local f3_local1 = function ()
			local f4_local0 = f3_arg0:SetZRotation( math.random( 0, 360 ), math.random( 200, 1000 ), math.random( LUI.EASING.linear, LUI.EASING.inOutBack ) )
			f4_local0.onComplete = f3_local0
		end
		
		f3_local1()
	end
	
	f1_local0( f1_arg0.ReticleAccent1 )
	f1_local0( f1_arg0.ReticleAccent2 )
end

function RC8Controls( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "RC8Controls"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local HackControlScreenElements = nil
	
	HackControlScreenElements = MenuBuilder.BuildRegisteredType( "HackControlScreenElements", {
		controllerIndex = f5_local1
	} )
	HackControlScreenElements.id = "HackControlScreenElements"
	HackControlScreenElements:SetCurvedRenderingX( 0.4 )
	HackControlScreenElements:SetCurvedRenderingY( -0.2 )
	HackControlScreenElements:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( HackControlScreenElements )
	self.HackControlScreenElements = HackControlScreenElements
	
	local f5_local4 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f5_local4 = LUI.UIText.new()
		f5_local4.id = "ButtonHintRT"
		f5_local4:setText( Engine.Localize( "LUA_MENU_MP_RC8_FIRE" ), 0 )
		f5_local4:SetFontSize( 26 * _1080p )
		f5_local4:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f5_local4:setTextStyle( CoD.TextStyle.Shadowed )
		f5_local4:SetAlignment( LUI.Alignment.Center )
		f5_local4:SetOptOutRightToLeftAlignmentFlip( true )
		f5_local4:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, 0, _1080p * 625, _1080p * -152, _1080p * -126 )
		f5_local4:BindAlphaToModel( DataSources.inGame.MP.scorestreakHuds.rc8Visible:GetModel( f5_local1 ) )
		self:addElement( f5_local4 )
		self.ButtonHintRT = f5_local4
	end
	local f5_local5 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f5_local5 = LUI.UIText.new()
		f5_local5.id = "ButtonHintMelee"
		f5_local5:setText( Engine.Localize( "LUA_MENU_MP_RC8_MELEE" ), 0 )
		f5_local5:SetFontSize( 26 * _1080p )
		f5_local5:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f5_local5:setTextStyle( CoD.TextStyle.Shadowed )
		f5_local5:SetAlignment( LUI.Alignment.Center )
		f5_local5:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -344, _1080p * 344, _1080p * -152, _1080p * -126 )
		self:addElement( f5_local5 )
		self.ButtonHintMelee = f5_local5
	end
	local f5_local6 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f5_local6 = LUI.UIText.new()
		f5_local6.id = "ButtonHintLT"
		f5_local6:setText( Engine.Localize( "LUA_MENU_MP_RC8_SHIELD" ), 0 )
		f5_local6:SetFontSize( 26 * _1080p )
		f5_local6:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f5_local6:setTextStyle( CoD.TextStyle.Shadowed )
		f5_local6:SetAlignment( LUI.Alignment.Center )
		f5_local6:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -625, 0, _1080p * -152, _1080p * -126 )
		f5_local6:BindAlphaToModel( DataSources.inGame.MP.scorestreakHuds.rc8Visible:GetModel( f5_local1 ) )
		self:addElement( f5_local6 )
		self.ButtonHintLT = f5_local6
	end
	local ReticleRing = nil
	
	ReticleRing = LUI.UIImage.new()
	ReticleRing.id = "ReticleRing"
	ReticleRing:SetRGBFromTable( SWATCHES.robotHacking.warning, 0 )
	ReticleRing:setImage( RegisterMaterial( "hud_ability_frame_outer_circle" ), 0 )
	ReticleRing:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( ReticleRing )
	self.ReticleRing = ReticleRing
	
	local ReticleAccent1 = nil
	
	ReticleAccent1 = LUI.UIImage.new()
	ReticleAccent1.id = "ReticleAccent1"
	ReticleAccent1:SetAlpha( 0.2, 0 )
	ReticleAccent1:setImage( RegisterMaterial( "hud_ability_frame_spin" ), 0 )
	ReticleAccent1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( ReticleAccent1 )
	self.ReticleAccent1 = ReticleAccent1
	
	local ReticleAccent2 = nil
	
	ReticleAccent2 = LUI.UIImage.new()
	ReticleAccent2.id = "ReticleAccent2"
	ReticleAccent2:SetAlpha( 0.1, 0 )
	ReticleAccent2:setImage( RegisterMaterial( "hud_rt_circle_spin" ), 0 )
	ReticleAccent2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( ReticleAccent2 )
	self.ReticleAccent2 = ReticleAccent2
	
	local ScorestreakStatusRC8 = nil
	
	ScorestreakStatusRC8 = MenuBuilder.BuildRegisteredType( "ScorestreakStatusRC8", {
		controllerIndex = f5_local1
	} )
	ScorestreakStatusRC8.id = "ScorestreakStatusRC8"
	ScorestreakStatusRC8.VenomOnlineText:setText( Engine.Localize( "LUA_MENU_MP_RC8_ONLINE" ), 0 )
	ScorestreakStatusRC8:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -178, _1080p * 222, _1080p * -210, _1080p * -178 )
	self:addElement( ScorestreakStatusRC8 )
	self.ScorestreakStatusRC8 = ScorestreakStatusRC8
	
	local MissileIncomingWarning = nil
	
	MissileIncomingWarning = MenuBuilder.BuildRegisteredType( "MissileIncomingWarning", {
		controllerIndex = f5_local1
	} )
	MissileIncomingWarning.id = "MissileIncomingWarning"
	MissileIncomingWarning:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * 55, _1080p * 311 )
	self:addElement( MissileIncomingWarning )
	self.MissileIncomingWarning = MissileIncomingWarning
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HackControlScreenElements:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.HackControlScreenElements:SetAlpha( 1, 0 )
				end
			}
		} )
		ReticleRing:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ReticleRing:SetAlpha( 1, 0 )
				end
			}
		} )
		ReticleAccent1:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ReticleAccent1:SetAlpha( 0.2, 0 )
				end
			}
		} )
		ReticleAccent2:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ReticleAccent2:SetAlpha( 0.1, 0 )
				end
			}
		} )
		ScorestreakStatusRC8:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ScorestreakStatusRC8:SetAlpha( 1, 0 )
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
			HackControlScreenElements:AnimateSequence( "BootUp" )
			ReticleRing:AnimateSequence( "BootUp" )
			ReticleAccent1:AnimateSequence( "BootUp" )
			ReticleAccent2:AnimateSequence( "BootUp" )
			ScorestreakStatusRC8:AnimateSequence( "BootUp" )
			MissileIncomingWarning:AnimateSequence( "BootUp" )
		end
		
		HackControlScreenElements:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.HackControlScreenElements:SetAlpha( 0, 0 )
				end
			}
		} )
		ReticleRing:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ReticleRing:SetAlpha( 0, 0 )
				end
			}
		} )
		ReticleAccent1:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ReticleAccent1:SetAlpha( 0, 0 )
				end
			}
		} )
		ReticleAccent2:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ReticleAccent2:SetAlpha( 0, 0 )
				end
			}
		} )
		ScorestreakStatusRC8:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ScorestreakStatusRC8:SetAlpha( 0, 0 )
				end
			}
		} )
		MissileIncomingWarning:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.MissileIncomingWarning:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			HackControlScreenElements:AnimateSequence( "Hide" )
			ReticleRing:AnimateSequence( "Hide" )
			ReticleAccent1:AnimateSequence( "Hide" )
			ReticleAccent2:AnimateSequence( "Hide" )
			ScorestreakStatusRC8:AnimateSequence( "Hide" )
			MissileIncomingWarning:AnimateSequence( "Hide" )
		end
		
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f5_local4:RegisterAnimationSequence( "BootupSpectator", {
				{
					function ()
						return self.ButtonHintRT:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, 0, _1080p * 625, _1080p * 525, _1080p * 553, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f5_local5:RegisterAnimationSequence( "BootupSpectator", {
				{
					function ()
						return self.ButtonHintMelee:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f5_local6:RegisterAnimationSequence( "BootupSpectator", {
				{
					function ()
						return self.ButtonHintLT:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -625, 0, _1080p * 525, _1080p * 553, 0 )
					end
				}
			} )
		end
		ScorestreakStatusRC8:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.ScorestreakStatusRC8:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.BootupSpectator = function ()
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f5_local4:AnimateSequence( "BootupSpectator" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f5_local5:AnimateSequence( "BootupSpectator" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f5_local6:AnimateSequence( "BootupSpectator" )
			end
			ScorestreakStatusRC8:AnimateSequence( "BootupSpectator" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.rc8Visible:GetModel( f5_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.rc8Visible:GetValue( f5_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.rc8Visible:GetValue( f5_local1 ) == 1 and (not CONDITIONS.InKillCam( self ) or not CONDITIONS.IsSpectating( self )) then
			ACTIONS.AnimateSequence( self, "BootUp" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "ScorestreakStatusRC8",
				sequenceName = "YellowOrangeState",
				elementPath = "ScorestreakStatusRC8"
			} )
		end
		if DataSources.inGame.MP.scorestreakHuds.rc8Visible:GetValue( f5_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.rc8Visible:GetValue( f5_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "Hide" )
		end
		if DataSources.inGame.MP.scorestreakHuds.rc8Visible:GetValue( f5_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.rc8Visible:GetValue( f5_local1 ) == 1 and (CONDITIONS.InKillCam( self ) or CONDITIONS.IsSpectating( self )) then
			ACTIONS.AnimateSequence( self, "BootupSpectator" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HackControlScreenElements",
				sequenceName = "BootupSpectator",
				elementPath = "HackControlScreenElements"
			} )
		end
	end )
	f0_local0( self, f5_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ScorestreakStatusRC8",
		sequenceName = "YellowOrangeState",
		elementPath = "ScorestreakStatusRC8"
	} )
	ACTIONS.AnimateSequence( self, "BootUp" )
	return self
end

MenuBuilder.registerType( "RC8Controls", RC8Controls )
LockTable( _M )
