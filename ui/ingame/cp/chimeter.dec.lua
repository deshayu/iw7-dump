local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = DataSources.inGame.player.primaryPower.iconAlpha
	local f1_local1 = DataSources.inGame.player.secondaryPower.iconAlpha
	local f1_local2 = DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Alpha
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		if f1_local0:GetValue( f1_arg1 ) == 1 then
			ACTIONS.AnimateSequence( f1_arg0, "primaryActive" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "primaryInactive" )
		end
	end )
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ()
		if f1_local1:GetValue( f1_arg1 ) == 1 then
			ACTIONS.AnimateSequence( f1_arg0, "secondaryActive" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "secondaryInactive" )
		end
	end )
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		if f1_local2:GetValue( f1_arg1 ) == 1 then
			ACTIONS.AnimateSequence( f1_arg0, "superActive" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "superInactive" )
		end
	end )
end

function ChiMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 269 * _1080p, 0, 233 * _1080p )
	self.id = "ChiMeter"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local LightRays = nil
	
	LightRays = MenuBuilder.BuildRegisteredType( "GenericSplashLightRays", {
		controllerIndex = f5_local1
	} )
	LightRays.id = "LightRays"
	LightRays:SetAlpha( 0, 0 )
	LightRays:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( LightRays )
	self.LightRays = LightRays
	
	local flame = nil
	
	flame = LUI.UIImage.new()
	flame.id = "flame"
	flame:SetAlpha( 0, 0 )
	flame:setImage( RegisterMaterial( "zm_chi_flame" ), 0 )
	flame:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 70.5, _1080p * 198.5, _1080p * -153.87, _1080p * 102.13 )
	self:addElement( flame )
	self.flame = flame
	
	local cornerLeft = nil
	
	cornerLeft = LUI.UIImage.new()
	cornerLeft.id = "cornerLeft"
	cornerLeft:setImage( RegisterMaterial( "zm_chi_corner_piece" ), 0 )
	cornerLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 47.5, _1080p * 111.5, _1080p * 34.34, _1080p * 98.34 )
	self:addElement( cornerLeft )
	self.cornerLeft = cornerLeft
	
	local cornerRight = nil
	
	cornerRight = LUI.UIImage.new()
	cornerRight.id = "cornerRight"
	cornerRight:SetYRotation( 180, 0 )
	cornerRight:setImage( RegisterMaterial( "zm_chi_corner_piece" ), 0 )
	cornerRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 156.5, _1080p * 220.5, _1080p * 34.34, _1080p * 98.34 )
	self:addElement( cornerRight )
	self.cornerRight = cornerRight
	
	local blueGlowBlast = nil
	
	blueGlowBlast = LUI.UIImage.new()
	blueGlowBlast.id = "blueGlowBlast"
	blueGlowBlast:SetRGBFromInt( 15301888, 0 )
	blueGlowBlast:SetAlpha( 0.65, 0 )
	blueGlowBlast:SetScale( -0.59, 0 )
	blueGlowBlast:setImage( RegisterMaterial( "zm_powerup_glow_element" ), 0 )
	blueGlowBlast:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -122, _1080p * 390, _1080p * -144.5, _1080p * 367.5 )
	self:addElement( blueGlowBlast )
	self.blueGlowBlast = blueGlowBlast
	
	local blueGlow = nil
	
	blueGlow = LUI.UIImage.new()
	blueGlow.id = "blueGlow"
	blueGlow:SetRGBFromInt( 15301888, 0 )
	blueGlow:SetAlpha( 0.65, 0 )
	blueGlow:SetScale( -0.34, 0 )
	blueGlow:setImage( RegisterMaterial( "zm_powerup_glow_element" ), 0 )
	blueGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -122, _1080p * 390, _1080p * -144.5, _1080p * 367.5 )
	self:addElement( blueGlow )
	self.blueGlow = blueGlow
	
	local styleIcon = nil
	
	styleIcon = LUI.UIImage.new()
	styleIcon.id = "styleIcon"
	styleIcon:SetUseAA( true )
	styleIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 70, _1080p * 198, _1080p * 50.1, _1080p * 178.11 )
	styleIcon:SubscribeToModel( DataSources.inGame.CP.zombies.dlc2.chiStyleIcon:GetModel( f5_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.dlc2.chiStyleIcon:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			styleIcon:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( styleIcon )
	self.styleIcon = styleIcon
	
	local chiFill = nil
	
	chiFill = MenuBuilder.BuildRegisteredType( "chiFill", {
		controllerIndex = f5_local1
	} )
	chiFill.id = "chiFill"
	chiFill:SetScale( 0.11, 0 )
	chiFill.circleFill:SetAlpha( 0, 0 )
	chiFill:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 42.5, _1080p * 225.5, _1080p * 22.61, _1080p * 205.61 )
	chiFill:SubscribeToModel( DataSources.inGame.CP.zombies.dlc1.raveFill:GetModel( f5_local1 ), function ()
		local f7_local0 = DataSources.inGame.CP.zombies.dlc1.raveFill:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			chiFill.circleFill:SetProgress( f7_local0 )
		end
	end )
	self:addElement( chiFill )
	self.chiFill = chiFill
	
	local innerRing = nil
	
	innerRing = LUI.UIImage.new()
	innerRing.id = "innerRing"
	innerRing:SetRGBFromInt( 0, 0 )
	innerRing:SetScale( -0.49, 0 )
	innerRing:setImage( RegisterMaterial( "zm_chi_ring" ), 0 )
	innerRing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 262, _1080p * -13.5, _1080p * 242.5 )
	self:addElement( innerRing )
	self.innerRing = innerRing
	
	local outerRing = nil
	
	outerRing = LUI.UIImage.new()
	outerRing.id = "outerRing"
	outerRing:SetRGBFromInt( 0, 0 )
	outerRing:SetScale( -0.31, 0 )
	outerRing:setImage( RegisterMaterial( "zm_chi_ring" ), 0 )
	outerRing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 262, _1080p * -12.89, _1080p * 243.11 )
	self:addElement( outerRing )
	self.outerRing = outerRing
	
	local PowerLightRays = nil
	
	PowerLightRays = MenuBuilder.BuildRegisteredType( "GenericSplashLightRays", {
		controllerIndex = f5_local1
	} )
	PowerLightRays.id = "PowerLightRays"
	PowerLightRays:SetAlpha( 0, 0 )
	PowerLightRays:SetScale( -0.75, 0 )
	PowerLightRays:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -180.6, _1080p * 331.4, _1080p * -178.77, _1080p * 333.23 )
	self:addElement( PowerLightRays )
	self.PowerLightRays = PowerLightRays
	
	local PrimaryBacking = nil
	
	PrimaryBacking = MenuBuilder.BuildRegisteredType( "ZomPlayerAbilityBase", {
		controllerIndex = f5_local1
	} )
	PrimaryBacking.id = "PrimaryBacking"
	PrimaryBacking:SetScale( -0.73, 0 )
	PrimaryBacking:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -124.95, _1080p * 5.05, _1080p * 134.88, _1080p * 259.88 )
	self:addElement( PrimaryBacking )
	self.PrimaryBacking = PrimaryBacking
	
	local PrimaryAbility = nil
	
	PrimaryAbility = MenuBuilder.BuildRegisteredType( "ZomPlayerAbilityBase", {
		controllerIndex = f5_local1
	} )
	PrimaryAbility.id = "PrimaryAbility"
	PrimaryAbility:SetScale( -0.73, 0 )
	PrimaryAbility:SetDataSource( DataSources.inGame.player.primaryPower, f5_local1 )
	PrimaryAbility:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -124.95, _1080p * 5.05, _1080p * 134.88, _1080p * 259.88 )
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.icon:GetModel( f5_local1 ), function ()
		local f8_local0 = DataSources.inGame.player.primaryPower.icon:GetValue( f5_local1 )
		if f8_local0 ~= nil then
			PrimaryAbility.AbilityIcon:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( PrimaryAbility )
	self.PrimaryAbility = PrimaryAbility
	
	local SecondaryBacking = nil
	
	SecondaryBacking = MenuBuilder.BuildRegisteredType( "ZomPlayerAbilityBase", {
		controllerIndex = f5_local1
	} )
	SecondaryBacking.id = "SecondaryBacking"
	SecondaryBacking:SetScale( -0.73, 0 )
	SecondaryBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5.05, _1080p * 124.95, _1080p * 134.88, _1080p * 259.88 )
	self:addElement( SecondaryBacking )
	self.SecondaryBacking = SecondaryBacking
	
	local SecondaryAbility = nil
	
	SecondaryAbility = MenuBuilder.BuildRegisteredType( "ZomPlayerAbilityBase", {
		controllerIndex = f5_local1
	} )
	SecondaryAbility.id = "SecondaryAbility"
	SecondaryAbility:SetScale( -0.73, 0 )
	SecondaryAbility:SetDataSource( DataSources.inGame.player.secondaryPower, f5_local1 )
	SecondaryAbility:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5.05, _1080p * 124.95, _1080p * 134.88, _1080p * 259.88 )
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.icon:GetModel( f5_local1 ), function ()
		local f9_local0 = DataSources.inGame.player.secondaryPower.icon:GetValue( f5_local1 )
		if f9_local0 ~= nil then
			SecondaryAbility.AbilityIcon:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	self:addElement( SecondaryAbility )
	self.SecondaryAbility = SecondaryAbility
	
	local SuperBacking = nil
	
	SuperBacking = LUI.UIImage.new()
	SuperBacking.id = "SuperBacking"
	SuperBacking:SetScale( -0.75, 0 )
	SuperBacking:SetUseAA( true )
	SuperBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 70.5, _1080p * 198.5, _1080p * 160.19, _1080p * 288.19 )
	self:addElement( SuperBacking )
	self.SuperBacking = SuperBacking
	
	local SuperAbility = nil
	
	SuperAbility = LUI.UIImage.new()
	SuperAbility.id = "SuperAbility"
	SuperAbility:SetScale( -0.75, 0 )
	SuperAbility:SetUseAA( true )
	SuperAbility:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 70.5, _1080p * 198.5, _1080p * 160.19, _1080p * 288.19 )
	SuperAbility:SubscribeToModel( DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Icon:GetModel( f5_local1 ), function ()
		local f10_local0 = DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Icon:GetValue( f5_local1 )
		if f10_local0 ~= nil then
			SuperAbility:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	self:addElement( SuperAbility )
	self.SuperAbility = SuperAbility
	
	local LB = nil
	
	LB = LUI.UIText.new()
	LB.id = "LB"
	LB:setText( Engine.Localize( "CP_ZOMBIE_LB" ), 0 )
	LB:SetFontSize( 20 * _1080p )
	LB:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LB:SetAlignment( LUI.Alignment.Center )
	LB:SetOptOutRightToLeftAlignmentFlip( true )
	LB:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2.95, _1080p * 116.95, _1080p * 210, _1080p * 230 )
	self:addElement( LB )
	self.LB = LB
	
	local RB = nil
	
	RB = LUI.UIText.new()
	RB.id = "RB"
	RB:setText( Engine.Localize( "CP_ZOMBIE_RB" ), 0 )
	RB:SetFontSize( 20 * _1080p )
	RB:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RB:SetAlignment( LUI.Alignment.Center )
	RB:SetOptOutRightToLeftAlignmentFlip( true )
	RB:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 157, _1080p * 262, _1080p * 210, _1080p * 230 )
	self:addElement( RB )
	self.RB = RB
	
	local LBRB = nil
	
	LBRB = LUI.UIText.new()
	LBRB.id = "LBRB"
	LBRB:setText( Engine.Localize( "CP_ZOMBIE_LBRB" ), 0 )
	LBRB:SetFontSize( 19 * _1080p )
	LBRB:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LBRB:SetAlignment( LUI.Alignment.Center )
	LBRB:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 69.5, _1080p * 198.5, _1080p * 246.88, _1080p * 266.88 )
	self:addElement( LBRB )
	self.LBRB = LBRB
	
	self._animationSets.DefaultAnimationSet = function ()
		PrimaryBacking:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.PrimaryBacking:SetAlpha( 0, 0 )
				end
			}
		} )
		PrimaryAbility:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.PrimaryAbility:SetAlpha( 0, 0 )
				end
			}
		} )
		SecondaryBacking:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.SecondaryBacking:SetAlpha( 0, 0 )
				end
			}
		} )
		SecondaryAbility:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.SecondaryAbility:SetAlpha( 0, 0 )
				end
			}
		} )
		SuperBacking:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.SuperBacking:SetAlpha( 0, 0 )
				end
			}
		} )
		SuperAbility:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.SuperAbility:SetAlpha( 0, 0 )
				end
			}
		} )
		LB:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LB:SetAlpha( 0, 0 )
				end
			}
		} )
		RB:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.RB:SetAlpha( 0, 0 )
				end
			}
		} )
		LBRB:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LBRB:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			PrimaryBacking:AnimateSequence( "DefaultSequence" )
			PrimaryAbility:AnimateSequence( "DefaultSequence" )
			SecondaryBacking:AnimateSequence( "DefaultSequence" )
			SecondaryAbility:AnimateSequence( "DefaultSequence" )
			SuperBacking:AnimateSequence( "DefaultSequence" )
			SuperAbility:AnimateSequence( "DefaultSequence" )
			LB:AnimateSequence( "DefaultSequence" )
			RB:AnimateSequence( "DefaultSequence" )
			LBRB:AnimateSequence( "DefaultSequence" )
		end
		
		LightRays:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.LightRays:SetAlpha( 0, 0 )
				end
			}
		} )
		flame:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.flame:SetAlpha( 0, 0 )
				end
			}
		} )
		cornerLeft:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.cornerLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		cornerRight:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.cornerRight:SetAlpha( 0, 0 )
				end
			}
		} )
		blueGlowBlast:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.blueGlowBlast:SetAlpha( 0, 0 )
				end
			}
		} )
		blueGlow:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.blueGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		styleIcon:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.styleIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		chiFill:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.chiFill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.chiFill.circleFill:SetAlpha( 0, 0 )
				end
			}
		} )
		innerRing:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.innerRing:SetAlpha( 0, 0 )
				end
			}
		} )
		outerRing:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.outerRing:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			LightRays:AnimateSequence( "initial" )
			flame:AnimateSequence( "initial" )
			cornerLeft:AnimateSequence( "initial" )
			cornerRight:AnimateSequence( "initial" )
			blueGlowBlast:AnimateSequence( "initial" )
			blueGlow:AnimateSequence( "initial" )
			styleIcon:AnimateSequence( "initial" )
			chiFill:AnimateSequence( "initial" )
			innerRing:AnimateSequence( "initial" )
			outerRing:AnimateSequence( "initial" )
		end
		
		cornerLeft:RegisterAnimationSequence( "chiOn", {
			{
				function ()
					return self.cornerLeft:SetAlpha( 1, 0 )
				end
			}
		} )
		cornerRight:RegisterAnimationSequence( "chiOn", {
			{
				function ()
					return self.cornerRight:SetAlpha( 1, 0 )
				end
			}
		} )
		blueGlow:RegisterAnimationSequence( "chiOn", {
			{
				function ()
					return self.blueGlow:SetAlpha( 0.8, 0 )
				end
			}
		} )
		styleIcon:RegisterAnimationSequence( "chiOn", {
			{
				function ()
					return self.styleIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		chiFill:RegisterAnimationSequence( "chiOn", {
			{
				function ()
					return self.chiFill.circleFill:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.chiFill:SetAlpha( 1, 0 )
				end
			}
		} )
		innerRing:RegisterAnimationSequence( "chiOn", {
			{
				function ()
					return self.innerRing:SetAlpha( 1, 0 )
				end
			}
		} )
		outerRing:RegisterAnimationSequence( "chiOn", {
			{
				function ()
					return self.outerRing:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.chiOn = function ()
			cornerLeft:AnimateSequence( "chiOn" )
			cornerRight:AnimateSequence( "chiOn" )
			blueGlow:AnimateSequence( "chiOn" )
			styleIcon:AnimateSequence( "chiOn" )
			chiFill:AnimateSequence( "chiOn" )
			innerRing:AnimateSequence( "chiOn" )
			outerRing:AnimateSequence( "chiOn" )
		end
		
		blueGlow:RegisterAnimationSequence( "chiOnSPin", {
			{
				function ()
					return self.blueGlow:SetZRotation( 0, 0 )
				end,
				function ()
					return self.blueGlow:SetZRotation( 360, 10000 )
				end
			},
			{
				function ()
					return self.blueGlow:SetScale( -0.59, 0 )
				end,
				function ()
					return self.blueGlow:SetScale( -0.4, 2500 )
				end,
				function ()
					return self.blueGlow:SetScale( -0.59, 2500 )
				end,
				function ()
					return self.blueGlow:SetScale( -0.4, 2500 )
				end,
				function ()
					return self.blueGlow:SetScale( -0.59, 2500 )
				end
			}
		} )
		self._sequences.chiOnSPin = function ()
			blueGlow:AnimateLoop( "chiOnSPin" )
		end
		
		blueGlowBlast:RegisterAnimationSequence( "glowBlast", {
			{
				function ()
					return self.blueGlowBlast:SetScale( -0.8, 0 )
				end,
				function ()
					return self.blueGlowBlast:SetScale( -0.2, 40 )
				end,
				function ()
					return self.blueGlowBlast:SetScale( -0.2, 100 )
				end,
				function ()
					return self.blueGlowBlast:SetScale( -0.8, 170 )
				end
			},
			{
				function ()
					return self.blueGlowBlast:SetAlpha( 0, 0 )
				end,
				function ()
					return self.blueGlowBlast:SetAlpha( 0.66, 40 )
				end,
				function ()
					return self.blueGlowBlast:SetAlpha( 0.66, 100 )
				end,
				function ()
					return self.blueGlowBlast:SetAlpha( 0, 170 )
				end
			},
			{
				function ()
					return self.blueGlowBlast:SetRGBFromInt( 16743680, 0 )
				end
			},
			{
				function ()
					return self.blueGlowBlast:SetZRotation( 0, 0 )
				end,
				function ()
					return self.blueGlowBlast:SetZRotation( 360, 310 )
				end
			}
		} )
		self._sequences.glowBlast = function ()
			blueGlowBlast:AnimateSequence( "glowBlast" )
		end
		
		LightRays:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.LightRays:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LightRays:SetAlpha( 0.5, 300, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LightRays:SetAlpha( 0.75, 1700 )
				end,
				function ()
					return self.LightRays:SetAlpha( 0, 1000, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.LightRays:SetScale( -0.5, 0 )
				end,
				function ()
					return self.LightRays:SetScale( 0, 300, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LightRays:SetScale( 0.15, 1700 )
				end,
				function ()
					return self.LightRays:SetScale( -0.5, 1000, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.intro = function ()
			LightRays:AnimateSequence( "intro" )
		end
		
		PowerLightRays:RegisterAnimationSequence( "primaryActive", {
			{
				function ()
					return self.PowerLightRays:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PowerLightRays:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PowerLightRays:SetAlpha( 0, 1300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.PowerLightRays:SetScale( -0.85, 0 )
				end,
				function ()
					return self.PowerLightRays:SetScale( -0.75, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PowerLightRays:SetScale( -0.7, 1300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.PowerLightRays:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -173.6, _1080p * 338.4, _1080p * -178.77, _1080p * 333.23, 0 )
				end
			}
		} )
		PrimaryBacking:RegisterAnimationSequence( "primaryActive", {
			{
				function ()
					return self.PrimaryBacking:SetAlpha( 1, 0 )
				end
			}
		} )
		PrimaryAbility:RegisterAnimationSequence( "primaryActive", {
			{
				function ()
					return self.PrimaryAbility:SetAlpha( 1, 0 )
				end
			}
		} )
		RB:RegisterAnimationSequence( "primaryActive", {
			{
				function ()
					return self.RB:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.primaryActive = function ()
			PowerLightRays:AnimateSequence( "primaryActive" )
			PrimaryBacking:AnimateSequence( "primaryActive" )
			PrimaryAbility:AnimateSequence( "primaryActive" )
			RB:AnimateSequence( "primaryActive" )
		end
		
		PowerLightRays:RegisterAnimationSequence( "secondaryActive", {
			{
				function ()
					return self.PowerLightRays:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PowerLightRays:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PowerLightRays:SetAlpha( 0, 1300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.PowerLightRays:SetScale( -0.85, 0 )
				end,
				function ()
					return self.PowerLightRays:SetScale( -0.8, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PowerLightRays:SetScale( -0.7, 1300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.PowerLightRays:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -337.55, _1080p * 174.45, _1080p * -178.62, _1080p * 333.38, 0 )
				end
			}
		} )
		SecondaryBacking:RegisterAnimationSequence( "secondaryActive", {
			{
				function ()
					return self.SecondaryBacking:SetAlpha( 1, 0 )
				end
			}
		} )
		SecondaryAbility:RegisterAnimationSequence( "secondaryActive", {
			{
				function ()
					return self.SecondaryAbility:SetAlpha( 1, 0 )
				end
			}
		} )
		LB:RegisterAnimationSequence( "secondaryActive", {
			{
				function ()
					return self.LB:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.secondaryActive = function ()
			PowerLightRays:AnimateSequence( "secondaryActive" )
			SecondaryBacking:AnimateSequence( "secondaryActive" )
			SecondaryAbility:AnimateSequence( "secondaryActive" )
			LB:AnimateSequence( "secondaryActive" )
		end
		
		PowerLightRays:RegisterAnimationSequence( "superActive", {
			{
				function ()
					return self.PowerLightRays:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PowerLightRays:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PowerLightRays:SetAlpha( 0, 1300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.PowerLightRays:SetScale( -0.85, 0 )
				end,
				function ()
					return self.PowerLightRays:SetScale( -0.8, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PowerLightRays:SetScale( -0.7, 1300, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.PowerLightRays:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256.5, _1080p * 255.5, _1080p * -148.32, _1080p * 363.69, 0 )
				end
			}
		} )
		SuperBacking:RegisterAnimationSequence( "superActive", {
			{
				function ()
					return self.SuperBacking:SetAlpha( 1, 0 )
				end
			}
		} )
		SuperAbility:RegisterAnimationSequence( "superActive", {
			{
				function ()
					return self.SuperAbility:SetAlpha( 1, 0 )
				end
			}
		} )
		LBRB:RegisterAnimationSequence( "superActive", {
			{
				function ()
					return self.LBRB:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.superActive = function ()
			PowerLightRays:AnimateSequence( "superActive" )
			SuperBacking:AnimateSequence( "superActive" )
			SuperAbility:AnimateSequence( "superActive" )
			LBRB:AnimateSequence( "superActive" )
		end
		
		PrimaryBacking:RegisterAnimationSequence( "primaryInactive", {
			{
				function ()
					return self.PrimaryBacking:SetAlpha( 0, 0 )
				end
			}
		} )
		PrimaryAbility:RegisterAnimationSequence( "primaryInactive", {
			{
				function ()
					return self.PrimaryAbility:SetAlpha( 0, 0 )
				end
			}
		} )
		RB:RegisterAnimationSequence( "primaryInactive", {
			{
				function ()
					return self.RB:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.primaryInactive = function ()
			PrimaryBacking:AnimateSequence( "primaryInactive" )
			PrimaryAbility:AnimateSequence( "primaryInactive" )
			RB:AnimateSequence( "primaryInactive" )
		end
		
		SecondaryBacking:RegisterAnimationSequence( "secondaryInactive", {
			{
				function ()
					return self.SecondaryBacking:SetAlpha( 0, 0 )
				end
			}
		} )
		SecondaryAbility:RegisterAnimationSequence( "secondaryInactive", {
			{
				function ()
					return self.SecondaryAbility:SetAlpha( 0, 0 )
				end
			}
		} )
		LB:RegisterAnimationSequence( "secondaryInactive", {
			{
				function ()
					return self.LB:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.secondaryInactive = function ()
			SecondaryBacking:AnimateSequence( "secondaryInactive" )
			SecondaryAbility:AnimateSequence( "secondaryInactive" )
			LB:AnimateSequence( "secondaryInactive" )
		end
		
		SuperBacking:RegisterAnimationSequence( "superInactive", {
			{
				function ()
					return self.SuperBacking:SetAlpha( 0, 0 )
				end
			}
		} )
		SuperAbility:RegisterAnimationSequence( "superInactive", {
			{
				function ()
					return self.SuperAbility:SetAlpha( 0, 0 )
				end
			}
		} )
		LBRB:RegisterAnimationSequence( "superInactive", {
			{
				function ()
					return self.LBRB:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.superInactive = function ()
			SuperBacking:AnimateSequence( "superInactive" )
			SuperAbility:AnimateSequence( "superInactive" )
			LBRB:AnimateSequence( "superInactive" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PrimaryAbility:SetDataSource( DataSources.inGame.player.primaryPower, f5_local1 )
	SecondaryAbility:SetDataSource( DataSources.inGame.player.secondaryPower, f5_local1 )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc1.raveMode:GetModel( f5_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f5_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f5_local1 ) >= 1 then
			ACTIONS.AnimateSequence( self, "chiOn" )
			ACTIONS.AnimateSequence( self, "chiOnSPin" )
		end
		if DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f5_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f5_local1 ) < 1 then
			
		else
			
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc1.raveFill:GetModel( f5_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc1.raveFill:GetValue( f5_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveFill:GetValue( f5_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "glowBlast" )
		end
	end )
	f0_local0( self, f5_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "ChiMeter", ChiMeter )
LockTable( _M )
