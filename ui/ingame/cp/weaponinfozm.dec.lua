local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function weaponinfoZM( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 351 * _1080p, 0, 50 * _1080p )
	self.id = "weaponinfoZM"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local box = nil
	
	box = LUI.UIImage.new()
	box.id = "box"
	box:SetAlpha( 0.5, 0 )
	box:SetZRotation( 180, 0 )
	box:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	box:SetUseAA( true )
	box:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 351, _1080p * 1, _1080p * 48.69 )
	self:addElement( box )
	self.box = box
	
	local TextStockAmmo = nil
	
	TextStockAmmo = LUI.UIStyledText.new()
	TextStockAmmo.id = "TextStockAmmo"
	TextStockAmmo:SetRGBFromInt( 10066329, 0 )
	TextStockAmmo:SetFontSize( 20 * _1080p )
	TextStockAmmo:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TextStockAmmo:SetAlignment( LUI.Alignment.Right )
	TextStockAmmo:SetShadowMinDistance( -0.02, 0 )
	TextStockAmmo:SetShadowMaxDistance( 0.02, 0 )
	TextStockAmmo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 264.5, _1080p * 296.5, _1080p * 28.69, _1080p * 48.69 )
	TextStockAmmo:BindAlphaToModel( DataSources.inGame.player.currentWeapon.ammoReserveAlpha:GetModel( f1_local1 ) )
	TextStockAmmo:SubscribeToModel( DataSources.inGame.player.currentWeapon.stockAmmoDisplay:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.stockAmmoDisplay:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			TextStockAmmo:setText( f2_local0, 0 )
		end
	end )
	self:addElement( TextStockAmmo )
	self.TextStockAmmo = TextStockAmmo
	
	local TextLeftClipAmmo = nil
	
	TextLeftClipAmmo = LUI.UIStyledText.new()
	TextLeftClipAmmo.id = "TextLeftClipAmmo"
	TextLeftClipAmmo:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	TextLeftClipAmmo:SetAlpha( 0.92, 0 )
	TextLeftClipAmmo:SetDepth( 15, 0 )
	TextLeftClipAmmo:SetDotPitchEnabled( true )
	TextLeftClipAmmo:SetDotPitchX( 0, 0 )
	TextLeftClipAmmo:SetDotPitchY( 0, 0 )
	TextLeftClipAmmo:SetDotPitchContrast( 0, 0 )
	TextLeftClipAmmo:SetDotPitchMode( 0 )
	TextLeftClipAmmo:SetFontSize( 48 * _1080p )
	TextLeftClipAmmo:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TextLeftClipAmmo:SetAlignment( LUI.Alignment.Right )
	TextLeftClipAmmo:SetShadowMinDistance( -0.02, 0 )
	TextLeftClipAmmo:SetShadowMaxDistance( 0.02, 0 )
	TextLeftClipAmmo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 102, _1080p * 179, _1080p * 7, _1080p * 55 )
	TextLeftClipAmmo:SubscribeToModel( DataSources.inGame.player.currentWeapon.clipAmmoLeftDisplay:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.clipAmmoLeftDisplay:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			TextLeftClipAmmo:setText( f3_local0, 0 )
		end
	end )
	self:addElement( TextLeftClipAmmo )
	self.TextLeftClipAmmo = TextLeftClipAmmo
	
	local TextRightClipAmmo = nil
	
	TextRightClipAmmo = LUI.UIStyledText.new()
	TextRightClipAmmo.id = "TextRightClipAmmo"
	TextRightClipAmmo:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	TextRightClipAmmo:SetDotPitchEnabled( true )
	TextRightClipAmmo:SetDotPitchX( 0, 0 )
	TextRightClipAmmo:SetDotPitchY( 0, 0 )
	TextRightClipAmmo:SetDotPitchContrast( 0, 0 )
	TextRightClipAmmo:SetDotPitchMode( 0 )
	TextRightClipAmmo:SetFontSize( 48 * _1080p )
	TextRightClipAmmo:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TextRightClipAmmo:SetAlignment( LUI.Alignment.Right )
	TextRightClipAmmo:SetShadowMinDistance( -0.2, 0 )
	TextRightClipAmmo:SetShadowMaxDistance( 0.8, 0 )
	TextRightClipAmmo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 184, _1080p * 263.5, _1080p * 2, _1080p * 50 )
	TextRightClipAmmo:BindAlphaToModel( DataSources.inGame.player.currentWeapon.ammoInfoAlpha:GetModel( f1_local1 ) )
	TextRightClipAmmo:SubscribeToModel( DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			TextRightClipAmmo:setText( f4_local0, 0 )
		end
	end )
	self:addElement( TextRightClipAmmo )
	self.TextRightClipAmmo = TextRightClipAmmo
	
	local weaponDescriptionZM = nil
	
	weaponDescriptionZM = MenuBuilder.BuildRegisteredType( "weaponDescriptionZM", {
		controllerIndex = f1_local1
	} )
	weaponDescriptionZM.id = "weaponDescriptionZM"
	weaponDescriptionZM:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -13.5, _1080p * 286.5, _1080p * -133.13, _1080p * -83.13 )
	self:addElement( weaponDescriptionZM )
	self.weaponDescriptionZM = weaponDescriptionZM
	
	local bar = nil
	
	bar = LUI.UIImage.new()
	bar.id = "bar"
	bar:SetAlpha( 0.3, 0 )
	bar:SetUseAA( true )
	bar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 182, _1080p * 184, _1080p * 3, _1080p * 46.69 )
	self:addElement( bar )
	self.bar = bar
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TextStockAmmo:RegisterAnimationSequence( "NoStockAmmo", {
			{
				function ()
					return self.TextStockAmmo:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		self._sequences.NoStockAmmo = function ()
			TextStockAmmo:AnimateSequence( "NoStockAmmo" )
		end
		
		TextStockAmmo:RegisterAnimationSequence( "HasStockAmmo", {
			{
				function ()
					return self.TextStockAmmo:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		self._sequences.HasStockAmmo = function ()
			TextStockAmmo:AnimateSequence( "HasStockAmmo" )
		end
		
		box:RegisterAnimationSequence( "ShowLeftClipAmmo", {
			{
				function ()
					return self.box:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 156, _1080p * 351, _1080p * 1, _1080p * 48.69, 0 )
				end
			}
		} )
		TextLeftClipAmmo:RegisterAnimationSequence( "ShowLeftClipAmmo", {
			{
				function ()
					return self.TextLeftClipAmmo:SetAlpha( 1, 0 )
				end
			}
		} )
		bar:RegisterAnimationSequence( "ShowLeftClipAmmo", {
			{
				function ()
					return self.bar:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.ShowLeftClipAmmo = function ()
			box:AnimateSequence( "ShowLeftClipAmmo" )
			TextLeftClipAmmo:AnimateSequence( "ShowLeftClipAmmo" )
			bar:AnimateSequence( "ShowLeftClipAmmo" )
		end
		
		box:RegisterAnimationSequence( "HideLeftClipAmmo", {
			{
				function ()
					return self.box:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 156, _1080p * 351, _1080p * 1, _1080p * 48.69, 0 )
				end
			}
		} )
		TextLeftClipAmmo:RegisterAnimationSequence( "HideLeftClipAmmo", {
			{
				function ()
					return self.TextLeftClipAmmo:SetAlpha( 0, 0 )
				end
			}
		} )
		bar:RegisterAnimationSequence( "HideLeftClipAmmo", {
			{
				function ()
					return self.bar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideLeftClipAmmo = function ()
			box:AnimateSequence( "HideLeftClipAmmo" )
			TextLeftClipAmmo:AnimateSequence( "HideLeftClipAmmo" )
			TextRightClipAmmo:AnimateSequence( "HideLeftClipAmmo" )
			bar:AnimateSequence( "HideLeftClipAmmo" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	TextStockAmmo:SubscribeToModel( DataSources.inGame.player.currentWeapon.stockAmmo:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.stockAmmo:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.stockAmmo:GetValue( f1_local1 ) <= 0 then
			ACTIONS.AnimateSequence( self, "NoStockAmmo" )
		end
		if DataSources.inGame.player.currentWeapon.stockAmmo:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.stockAmmo:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "HasStockAmmo" )
		end
	end )
	local f1_local9 = function ()
		if DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f1_local1 ) == true and DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "ShowLeftClipAmmo" )
		end
		if DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideLeftClipAmmo" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isDualWielding:GetModel( f1_local1 ), f1_local9 )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetModel( f1_local1 ), f1_local9 )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "HideLeftClipAmmo" )
		end
	end )
	return self
end

MenuBuilder.registerType( "weaponinfoZM", weaponinfoZM )
LockTable( _M )
