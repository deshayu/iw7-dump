local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	local f1_local0 = 100
	f1_arg0:SetDepth( -8, 0 )
	f1_arg0:SetScale( 0.25, 0 )
	f1_arg0:SetDotPitchX( 52, 0 )
	f1_arg0:SetDotPitchY( 43, 0 )
	f1_arg0:SetDotPitchContrast( 0.8, 0 )
	f1_arg0:SetDepth( 0, f1_local0 )
	f1_arg0:SetScale( 0, f1_local0 )
	f1_arg0:SetDotPitchX( 0, f1_local0 )
	f1_arg0:SetDotPitchY( 0, f1_local0 )
	f1_arg0:SetDotPitchContrast( 0, f1_local0 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = assert
	local f2_local1 = f2_arg0.TextRightClipAmmo
	if f2_local1 then
		f2_local1 = f2_arg0.TextLeftClipAmmo and f2_arg0.TextStockAmmo
	end
	f2_local0( f2_local1, "WARNING: SP Weapon Info Items Are Missing..." )
	f2_local0 = f2_arg0.TextRightClipAmmo
	f2_local1 = f2_arg0.TextLeftClipAmmo
	local f2_local2 = f2_arg0.TextStockAmmo
	f2_local0:SetWordWrap( false )
	f2_local1:SetWordWrap( false )
	f2_local2:SetWordWrap( false )
	f2_local0:SetShadowUOffset( -0 )
	f2_local0:SetShadowVOffset( -0 )
	f2_local1:SetShadowUOffset( -0 )
	f2_local1:SetShadowVOffset( -0 )
	f2_local2:SetShadowUOffset( -0 )
	f2_local2:SetShadowVOffset( -0 )
	local f2_local3 = DataSources.inGame.player.currentWeapon.stockAmmo
	local f2_local4 = DataSources.inGame.player.currentWeapon.clipAmmoRight
	local f2_local5 = DataSources.inGame.player.currentWeapon.clipAmmoLeft
	local f2_local6 = DataSources.inGame.player.currentWeapon.isDualWielding
	local f2_local7 = DataSources.inGame.player.currentWeapon.energyBullet
	local f2_local8 = DataSources.inGame.player.currentWeapon.clipAmmoMax
	local f2_local9 = DataSources.inGame.player.currentWeapon.lowAmmoThreshold
	local f2_local10 = DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay
	local f2_local11 = DataSources.inGame.player.currentWeapon.clipAmmoLeftDisplay
	local f2_local12 = function ()
		local f3_local0 = f2_local4:GetValue( f2_arg1 )
		local f3_local1 = f2_local5:GetValue( f2_arg1 )
		local f3_local2 = f2_local10:GetValue( f2_arg1 )
		local f3_local3 = f2_local11:GetValue( f2_arg1 )
		local f3_local4 = f2_local8:GetValue( f2_arg1 )
		local f3_local5 = f2_local9:GetValue( f2_arg1 )
		if f2_arg0.lastClipAmmoDisplayRight ~= f3_local2 then
			f0_local0( f2_local0 )
			f2_arg0.lastClipAmmoDisplayRight = f3_local2
		end
		if f3_local0 <= f3_local5 * f3_local4 then
			f2_local0:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
			ACTIONS.AnimateSequenceByElement( f2_arg0, {
				elementName = "GlowWarningRight",
				sequenceName = "WarningOn",
				elementPath = "GlowWarningRight"
			} )
		else
			f2_local0:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
			ACTIONS.AnimateSequenceByElement( f2_arg0, {
				elementName = "GlowWarningRight",
				sequenceName = "WarningOff",
				elementPath = "GlowWarningRight"
			} )
		end
		if f2_arg0.lastClipAmmoDisplayLeft ~= f3_local3 then
			f0_local0( f2_local1 )
			f2_arg0.lastClipAmmoDisplayLeft = f3_local3
		end
		if f3_local1 <= f3_local5 * f3_local4 then
			f2_local1:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
			ACTIONS.AnimateSequenceByElement( f2_arg0, {
				elementName = "GlowWarningLeft",
				sequenceName = "WarningOn",
				elementPath = "GlowWarningLeft"
			} )
		else
			f2_local1:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
			ACTIONS.AnimateSequenceByElement( f2_arg0, {
				elementName = "GlowWarningLeft",
				sequenceName = "WarningOff",
				elementPath = "GlowWarningLeft"
			} )
		end
	end
	
	local f2_local13 = function ()
		if f2_local6:GetValue( f2_arg1 ) then
			ACTIONS.AnimateSequence( f2_arg0, "AkimboActive" )
		else
			ACTIONS.AnimateSequence( f2_arg0, "AkimboInactive" )
		end
	end
	
	f2_arg0:SubscribeToModel( f2_local4:GetModel( f2_arg1 ), f2_local12 )
	f2_arg0:SubscribeToModel( f2_local5:GetModel( f2_arg1 ), f2_local12 )
	f2_arg0:SubscribeToModel( f2_local8:GetModel( f2_arg1 ), f2_local12 )
	f2_arg0:SubscribeToModel( f2_local9:GetModel( f2_arg1 ), f2_local12 )
	f2_arg0:SubscribeToModel( f2_local6:GetModel( f2_arg1 ), f2_local13 )
	f2_arg0:SubscribeToModel( f2_local7:GetModel( f2_arg1 ), function ()
		if f2_local7:GetValue( f2_arg1 ) then
			ACTIONS.AnimateSequence( f2_arg0, "EnergyActive" )
		else
			ACTIONS.AnimateSequence( f2_arg0, "EnergyInactive" )
		end
	end )
	f2_arg0:SubscribeToModel( f2_local3:GetModel( f2_arg1 ), function ()
		if f2_local3:GetValue( f2_arg1 ) > 0 then
			f2_local2:SetRGBFromTable( SWATCHES.HUD.secondary, 0 )
			ACTIONS.AnimateSequenceByElement( f2_arg0, {
				elementName = "GlowWarningStock",
				sequenceName = "WarningOff",
				elementPath = "GlowWarningStock"
			} )
		else
			f2_local2:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
			ACTIONS.AnimateSequenceByElement( f2_arg0, {
				elementName = "GlowWarningStock",
				sequenceName = "WarningOn",
				elementPath = "GlowWarningStock"
			} )
		end
	end )
end

function SPWeaponInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 50 * _1080p )
	self.id = "SPWeaponInfo"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local GlowWarningStock = nil
	
	GlowWarningStock = MenuBuilder.BuildRegisteredType( "WarningGlow", {
		controllerIndex = f7_local1
	} )
	GlowWarningStock.id = "GlowWarningStock"
	GlowWarningStock:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -55, _1080p * 5, _1080p * -30, _1080p * 30 )
	GlowWarningStock:BindAlphaToModel( DataSources.inGame.player.currentWeapon.ammoReserveAlpha:GetModel( f7_local1 ) )
	self:addElement( GlowWarningStock )
	self.GlowWarningStock = GlowWarningStock
	
	local GlowWarningRight = nil
	
	GlowWarningRight = MenuBuilder.BuildRegisteredType( "WarningGlow", {
		controllerIndex = f7_local1
	} )
	GlowWarningRight.id = "GlowWarningRight"
	GlowWarningRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -127, _1080p * -67, _1080p * -30, _1080p * 30 )
	GlowWarningRight:BindAlphaToModel( DataSources.inGame.player.currentWeapon.ammoInfoAlpha:GetModel( f7_local1 ) )
	self:addElement( GlowWarningRight )
	self.GlowWarningRight = GlowWarningRight
	
	local GlowWarningLeft = nil
	
	GlowWarningLeft = MenuBuilder.BuildRegisteredType( "WarningGlow", {
		controllerIndex = f7_local1
	} )
	GlowWarningLeft.id = "GlowWarningLeft"
	GlowWarningLeft:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -177, _1080p * -117, _1080p * -30, _1080p * 30 )
	GlowWarningLeft:BindAlphaToModel( DataSources.inGame.player.currentWeapon.leftAmmoReserveAlpha:GetModel( f7_local1 ) )
	self:addElement( GlowWarningLeft )
	self.GlowWarningLeft = GlowWarningLeft
	
	local VerticalDivider = nil
	
	VerticalDivider = LUI.UIImage.new()
	VerticalDivider.id = "VerticalDivider"
	VerticalDivider:SetRGBFromTable( SWATCHES.HUD.secondary, 0 )
	VerticalDivider:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	VerticalDivider:SetUseAA( true )
	VerticalDivider:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -57, _1080p * -55, _1080p * -16, _1080p * 16 )
	self:addElement( VerticalDivider )
	self.VerticalDivider = VerticalDivider
	
	local TextStockAmmo = nil
	
	TextStockAmmo = LUI.UIStyledText.new()
	TextStockAmmo.id = "TextStockAmmo"
	TextStockAmmo:SetRGBFromTable( SWATCHES.HUD.secondary, 0 )
	TextStockAmmo:SetFontSize( 32 * _1080p )
	TextStockAmmo:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextStockAmmo:SetAlignment( LUI.Alignment.Center )
	TextStockAmmo:SetShadowMinDistance( -0.02, 0 )
	TextStockAmmo:SetShadowMaxDistance( 0.02, 0 )
	TextStockAmmo:SetShadowRGBFromInt( 0, 0 )
	TextStockAmmo:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -55, _1080p * 5, _1080p * -16, _1080p * 16 )
	TextStockAmmo:BindAlphaToModel( DataSources.inGame.player.currentWeapon.ammoReserveAlpha:GetModel( f7_local1 ) )
	TextStockAmmo:SubscribeToModel( DataSources.inGame.player.currentWeapon.stockAmmoDisplay:GetModel( f7_local1 ), function ()
		local f8_local0 = DataSources.inGame.player.currentWeapon.stockAmmoDisplay:GetValue( f7_local1 )
		if f8_local0 ~= nil then
			TextStockAmmo:setText( f8_local0, 0 )
		end
	end )
	self:addElement( TextStockAmmo )
	self.TextStockAmmo = TextStockAmmo
	
	local TextRightClipAmmo = nil
	
	TextRightClipAmmo = LUI.UIStyledText.new()
	TextRightClipAmmo.id = "TextRightClipAmmo"
	TextRightClipAmmo:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	TextRightClipAmmo:SetDotPitchEnabled( true )
	TextRightClipAmmo:SetDotPitchX( 0, 0 )
	TextRightClipAmmo:SetDotPitchY( 0, 0 )
	TextRightClipAmmo:SetDotPitchContrast( 0, 0 )
	TextRightClipAmmo:SetDotPitchMode( 0 )
	TextRightClipAmmo:SetFontSize( 38 * _1080p )
	TextRightClipAmmo:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TextRightClipAmmo:SetAlignment( LUI.Alignment.Center )
	TextRightClipAmmo:SetShadowMinDistance( -0.03, 0 )
	TextRightClipAmmo:SetShadowMaxDistance( 0.03, 0 )
	TextRightClipAmmo:SetShadowRGBFromInt( 0, 0 )
	TextRightClipAmmo:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -127, _1080p * -67, _1080p * -19, _1080p * 19 )
	TextRightClipAmmo:BindAlphaToModel( DataSources.inGame.player.currentWeapon.ammoInfoAlpha:GetModel( f7_local1 ) )
	TextRightClipAmmo:SubscribeToModel( DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay:GetModel( f7_local1 ), function ()
		local f9_local0 = DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay:GetValue( f7_local1 )
		if f9_local0 ~= nil then
			TextRightClipAmmo:setText( f9_local0, 0 )
		end
	end )
	self:addElement( TextRightClipAmmo )
	self.TextRightClipAmmo = TextRightClipAmmo
	
	local TextLeftClipAmmo = nil
	
	TextLeftClipAmmo = LUI.UIStyledText.new()
	TextLeftClipAmmo.id = "TextLeftClipAmmo"
	TextLeftClipAmmo:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	TextLeftClipAmmo:SetAlpha( 0, 0 )
	TextLeftClipAmmo:SetDotPitchEnabled( true )
	TextLeftClipAmmo:SetDotPitchX( 0, 0 )
	TextLeftClipAmmo:SetDotPitchY( 0, 0 )
	TextLeftClipAmmo:SetDotPitchContrast( 0, 0 )
	TextLeftClipAmmo:SetDotPitchMode( 0 )
	TextLeftClipAmmo:SetFontSize( 38 * _1080p )
	TextLeftClipAmmo:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TextLeftClipAmmo:SetAlignment( LUI.Alignment.Center )
	TextLeftClipAmmo:SetShadowMinDistance( -0.02, 0 )
	TextLeftClipAmmo:SetShadowMaxDistance( 0.02, 0 )
	TextLeftClipAmmo:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -177, _1080p * -117, _1080p * -19, _1080p * 19 )
	TextLeftClipAmmo:SubscribeToModel( DataSources.inGame.player.currentWeapon.clipAmmoLeftDisplay:GetModel( f7_local1 ), function ()
		local f10_local0 = DataSources.inGame.player.currentWeapon.clipAmmoLeftDisplay:GetValue( f7_local1 )
		if f10_local0 ~= nil then
			TextLeftClipAmmo:setText( f10_local0, 0 )
		end
	end )
	self:addElement( TextLeftClipAmmo )
	self.TextLeftClipAmmo = TextLeftClipAmmo
	
	local AmmoBarRight = nil
	
	AmmoBarRight = MenuBuilder.BuildRegisteredType( "SPWeaponInfoAmmoBar", {
		controllerIndex = f7_local1
	} )
	AmmoBarRight.id = "AmmoBarRight"
	AmmoBarRight:SetDataSource( DataSources.inGame.player.currentWeapon.clipAmmoRightTotal, f7_local1 )
	AmmoBarRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -125, _1080p * 5, _1080p * -9, _1080p * -1 )
	self:addElement( AmmoBarRight )
	self.AmmoBarRight = AmmoBarRight
	
	local AmmoBarLeft = nil
	
	AmmoBarLeft = MenuBuilder.BuildRegisteredType( "SPWeaponInfoAmmoBar", {
		controllerIndex = f7_local1
	} )
	AmmoBarLeft.id = "AmmoBarLeft"
	AmmoBarLeft:SetAlpha( 0, 0 )
	AmmoBarLeft:SetDataSource( DataSources.inGame.player.currentWeapon.clipAmmoLeftTotal, f7_local1 )
	AmmoBarLeft:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -125, _1080p * -61, _1080p * -9, _1080p * -1 )
	self:addElement( AmmoBarLeft )
	self.AmmoBarLeft = AmmoBarLeft
	
	local Bolt = nil
	
	Bolt = LUI.UIImage.new()
	Bolt.id = "Bolt"
	Bolt:SetAlpha( 0, 0 )
	Bolt:setImage( RegisterMaterial( "hud_weapon_info_energy_bolt" ), 0 )
	Bolt:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 30, _1080p * -15, _1080p * 15 )
	self:addElement( Bolt )
	self.Bolt = Bolt
	
	self._animationSets.DefaultAnimationSet = function ()
		GlowWarningRight:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GlowWarningRight:SetScale( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			GlowWarningRight:AnimateSequence( "DefaultSequence" )
		end
		
		GlowWarningRight:RegisterAnimationSequence( "AkimboActive", {
			{
				function ()
					return self.GlowWarningRight:SetScale( -0.25, 0 )
				end
			}
		} )
		GlowWarningLeft:RegisterAnimationSequence( "AkimboActive", {
			{
				function ()
					return self.GlowWarningLeft:SetScale( -0.25, 0 )
				end
			}
		} )
		TextRightClipAmmo:RegisterAnimationSequence( "AkimboActive", {
			{
				function ()
					return self.TextRightClipAmmo:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -127, _1080p * -67, _1080p * -19, _1080p * 19, 0 )
				end
			}
		} )
		TextLeftClipAmmo:RegisterAnimationSequence( "AkimboActive", {
			{
				function ()
					return self.TextLeftClipAmmo:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TextLeftClipAmmo:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -177, _1080p * -117, _1080p * -19, _1080p * 19, 0 )
				end
			}
		} )
		AmmoBarRight:RegisterAnimationSequence( "AkimboActive", {
			{
				function ()
					return self.AmmoBarRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -59, _1080p * 5, _1080p * -9, _1080p * -1, 0 )
				end
			}
		} )
		AmmoBarLeft:RegisterAnimationSequence( "AkimboActive", {
			{
				function ()
					return self.AmmoBarLeft:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.AmmoBarLeft:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -125, _1080p * -61, _1080p * -9, _1080p * -1, 0 )
				end
			}
		} )
		self._sequences.AkimboActive = function ()
			GlowWarningRight:AnimateSequence( "AkimboActive" )
			GlowWarningLeft:AnimateSequence( "AkimboActive" )
			TextRightClipAmmo:AnimateSequence( "AkimboActive" )
			TextLeftClipAmmo:AnimateSequence( "AkimboActive" )
			AmmoBarRight:AnimateSequence( "AkimboActive" )
			AmmoBarLeft:AnimateSequence( "AkimboActive" )
		end
		
		Bolt:RegisterAnimationSequence( "EnergyActive", {
			{
				function ()
					return self.Bolt:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Bolt:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Bolt:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Bolt:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Bolt:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Bolt:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Bolt:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.EnergyActive = function ()
			Bolt:AnimateSequence( "EnergyActive" )
		end
		
		GlowWarningRight:RegisterAnimationSequence( "AkimboInactive", {
			{
				function ()
					return self.GlowWarningRight:SetScale( 0, 0 )
				end
			}
		} )
		TextRightClipAmmo:RegisterAnimationSequence( "AkimboInactive", {
			{
				function ()
					return self.TextRightClipAmmo:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -127, _1080p * -67, _1080p * -19, _1080p * 19, 0 )
				end
			}
		} )
		TextLeftClipAmmo:RegisterAnimationSequence( "AkimboInactive", {
			{
				function ()
					return self.TextLeftClipAmmo:SetAlpha( 0, 0 )
				end
			}
		} )
		AmmoBarRight:RegisterAnimationSequence( "AkimboInactive", {
			{
				function ()
					return self.AmmoBarRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -125, _1080p * 5, _1080p * -9, _1080p * -1, 0 )
				end
			}
		} )
		AmmoBarLeft:RegisterAnimationSequence( "AkimboInactive", {
			{
				function ()
					return self.AmmoBarLeft:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.AmmoBarLeft:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -195, _1080p * -100, _1080p * -9, _1080p * -1, 0 )
				end
			}
		} )
		self._sequences.AkimboInactive = function ()
			GlowWarningRight:AnimateSequence( "AkimboInactive" )
			TextRightClipAmmo:AnimateSequence( "AkimboInactive" )
			TextLeftClipAmmo:AnimateSequence( "AkimboInactive" )
			AmmoBarRight:AnimateSequence( "AkimboInactive" )
			AmmoBarLeft:AnimateSequence( "AkimboInactive" )
		end
		
		Bolt:RegisterAnimationSequence( "EnergyInactive", {
			{
				function ()
					return self.Bolt:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.EnergyInactive = function ()
			Bolt:AnimateSequence( "EnergyInactive" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	AmmoBarRight:SetDataSource( DataSources.inGame.player.currentWeapon.clipAmmoRightTotal, f7_local1 )
	AmmoBarLeft:SetDataSource( DataSources.inGame.player.currentWeapon.clipAmmoLeftTotal, f7_local1 )
	f0_local1( self, f7_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "SPWeaponInfo", SPWeaponInfo )
LockTable( _M )
