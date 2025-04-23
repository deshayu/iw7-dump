local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg0.ButtonHintRotate and not Engine.IsConsoleGame() and Engine.IsGamepadEnabled() == 0 then
		f1_arg0.ButtonHintRotate:setText( Engine.Localize( "LUA_MENU_MP_SCORESTREAK_PC_MAP_ROTATE" ), 0 )
	end
end

function LocationSelectorGridOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "LocationSelectorGridOverlay"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Map = nil
	
	Map = MenuBuilder.BuildRegisteredType( "LocationSelectorMap", {
		controllerIndex = f2_local1
	} )
	Map.id = "Map"
	Map:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 504, _1080p * -504, _1080p * 84, _1080p * -84 )
	self:addElement( Map )
	self.Map = Map
	
	local GridOverlay = nil
	
	GridOverlay = LUI.UIImage.new()
	GridOverlay.id = "GridOverlay"
	GridOverlay:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
	GridOverlay:setImage( RegisterMaterial( "hud_location_selector_grid" ), 0 )
	GridOverlay:SetBlendMode( BLEND_MODE.addWithAlpha )
	GridOverlay:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -485, _1080p * 485, _1080p * 55, _1080p * -55 )
	self:addElement( GridOverlay )
	self.GridOverlay = GridOverlay
	
	local AccentBarcode = nil
	
	AccentBarcode = LUI.UIImage.new()
	AccentBarcode.id = "AccentBarcode"
	AccentBarcode:SetAlpha( 0.3, 0 )
	AccentBarcode:setImage( RegisterMaterial( "wdg_barcode_01" ), 0 )
	AccentBarcode:SetBlendMode( BLEND_MODE.addWithAlpha )
	AccentBarcode:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 120, _1080p * 248, _1080p * -114, _1080p * -50 )
	self:addElement( AccentBarcode )
	self.AccentBarcode = AccentBarcode
	
	local AccentLogo = nil
	
	AccentLogo = LUI.UIImage.new()
	AccentLogo.id = "AccentLogo"
	AccentLogo:SetAlpha( 0.3, 0 )
	AccentLogo:setImage( RegisterMaterial( "icon_edi" ), 0 )
	AccentLogo:SetBlendMode( BLEND_MODE.addWithAlpha )
	AccentLogo:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -326, _1080p * -70, _1080p * -238, _1080p * -110 )
	self:addElement( AccentLogo )
	self.AccentLogo = AccentLogo
	
	local AccentTechCircle2 = nil
	
	AccentTechCircle2 = LUI.UIImage.new()
	AccentTechCircle2.id = "AccentTechCircle2"
	AccentTechCircle2:SetAlpha( 0.3, 0 )
	AccentTechCircle2:setImage( RegisterMaterial( "wdg_tech_circle" ), 0 )
	AccentTechCircle2:SetBlendMode( BLEND_MODE.addWithAlpha )
	AccentTechCircle2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -414, _1080p * -350, _1080p * 60, _1080p * 124 )
	self:addElement( AccentTechCircle2 )
	self.AccentTechCircle2 = AccentTechCircle2
	
	local AccentTechCircle1 = nil
	
	AccentTechCircle1 = LUI.UIImage.new()
	AccentTechCircle1.id = "AccentTechCircle1"
	AccentTechCircle1:SetAlpha( 0.3, 0 )
	AccentTechCircle1:setImage( RegisterMaterial( "wdg_tech_circle" ), 0 )
	AccentTechCircle1:SetBlendMode( BLEND_MODE.addWithAlpha )
	AccentTechCircle1:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 362, _1080p * 426, _1080p * -118, _1080p * -54 )
	self:addElement( AccentTechCircle1 )
	self.AccentTechCircle1 = AccentTechCircle1
	
	local AccentOverlay = nil
	
	AccentOverlay = MenuBuilder.BuildRegisteredType( "AccentLocationGridOverlay", {
		controllerIndex = f2_local1
	} )
	AccentOverlay.id = "AccentOverlay"
	AccentOverlay:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -440, _1080p * 440, _1080p * -440, _1080p * 440 )
	self:addElement( AccentOverlay )
	self.AccentOverlay = AccentOverlay
	
	local AccentInfo = nil
	
	AccentInfo = MenuBuilder.BuildRegisteredType( "LocationSelectorInfo", {
		controllerIndex = f2_local1
	} )
	AccentInfo.id = "AccentInfo"
	AccentInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 105, _1080p * 305, _1080p * 65, _1080p * 265 )
	self:addElement( AccentInfo )
	self.AccentInfo = AccentInfo
	
	local AccentCoordinates = nil
	
	AccentCoordinates = MenuBuilder.BuildRegisteredType( "AccentLocationCoordinates", {
		controllerIndex = f2_local1
	} )
	AccentCoordinates.id = "AccentCoordinates"
	AccentCoordinates:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
	AccentCoordinates:SetAlpha( 0.6, 0 )
	AccentCoordinates:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -326, _1080p * -96, _1080p * 60, _1080p * 130 )
	self:addElement( AccentCoordinates )
	self.AccentCoordinates = AccentCoordinates
	
	local f2_local12 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f2_local12 = LUI.UIText.new()
		f2_local12.id = "ButtonHintRotate"
		f2_local12:setText( Engine.Localize( "LUA_MENU_MP_SCORESTREAK_MAP_ROTATE" ), 0 )
		f2_local12:SetFontSize( 32 * _1080p )
		f2_local12:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f2_local12:SetAlignment( LUI.Alignment.Center )
		f2_local12:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -935, _1080p * -385, _1080p * -101, _1080p * -69 )
		f2_local12:BindAlphaToModel( DataSources.inGame.MP.scorestreakHuds.scorchersRotateTextHintAlpha:GetModel( f2_local1 ) )
		self:addElement( f2_local12 )
		self.ButtonHintRotate = f2_local12
	end
	local f2_local13 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f2_local13 = LUI.UIText.new()
		f2_local13.id = "ButtonHintSelect"
		f2_local13:setText( Engine.Localize( "LUA_MENU_MP_SCORESTREAK_MAP_SELECT" ), 0 )
		f2_local13:SetFontSize( 32 * _1080p )
		f2_local13:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f2_local13:SetAlignment( LUI.Alignment.Center )
		f2_local13:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -930, _1080p * -380, _1080p * -4.5, _1080p * 27.5 )
		f2_local13:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.scorchersRotateTextHintAlpha:GetModel( f2_local1 ), function ()
			local f3_local0 = DataSources.inGame.MP.scorestreakHuds.scorchersRotateTextHintAlpha:GetValue( f2_local1 )
			if f3_local0 ~= nil then
				f2_local13:SetAlpha( Multiply( Subtract( f3_local0, 1 ), -1 ), 0 )
			end
		end )
		self:addElement( f2_local13 )
		self.ButtonHintSelect = f2_local13
	end
	local f2_local14 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f2_local14 = LUI.UIText.new()
		f2_local14.id = "ButtonHintAttack"
		f2_local14:setText( Engine.Localize( "LUA_MENU_MP_SCORESTREAK_MAP_DISPATCH" ), 0 )
		f2_local14:SetFontSize( 32 * _1080p )
		f2_local14:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f2_local14:SetAlignment( LUI.Alignment.Center )
		f2_local14:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -930, _1080p * -380, _1080p * -4.5, _1080p * 27.5 )
		f2_local14:BindAlphaToModel( DataSources.inGame.MP.scorestreakHuds.scorchersRotateTextHintAlpha:GetModel( f2_local1 ) )
		self:addElement( f2_local14 )
		self.ButtonHintAttack = f2_local14
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AccentOverlay:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.AccentOverlay:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -800, _1080p * 800, _1080p * -800, _1080p * 800, 0 )
				end,
				function ()
					return self.AccentOverlay:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -800, _1080p * 800, _1080p * -800, _1080p * 800, 400 )
				end,
				function ()
					return self.AccentOverlay:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -440, _1080p * 440, _1080p * -440, _1080p * 440, 299, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.bootup = function ()
			AccentOverlay:AnimateSequence( "bootup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "bootup" )
	return self
end

MenuBuilder.registerType( "LocationSelectorGridOverlay", LocationSelectorGridOverlay )
LockTable( _M )
