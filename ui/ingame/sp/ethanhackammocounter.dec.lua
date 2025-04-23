local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.ClipAmmo and f1_arg0.StockAmmo, "WARNING: Ethan Hack Ammo Counter Items Are Missing..." )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0 = DataSources.inGame.player.currentWeapon.clipAmmoRight
	local f1_local1 = DataSources.inGame.player.currentWeapon.clipAmmoMax
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		ACTIONS.AnimateSequence( f1_arg0, "UpdateClip" )
	end )
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ()
		ACTIONS.AnimateSequence( f1_arg0, "UpdateStock" )
	end )
	f1_arg0.ClipAmmo:SetShadowUOffset( -0 )
	f1_arg0.ClipAmmo:SetShadowVOffset( -0 )
	f1_arg0.StockAmmo:SetShadowUOffset( -0 )
	f1_arg0.StockAmmo:SetShadowVOffset( -0 )
end

function EthanHackAmmoCounter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 120 * _1080p, 0, 80 * _1080p )
	self.id = "EthanHackAmmoCounter"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Ammunition = nil
	
	Ammunition = LUI.UIStyledText.new()
	Ammunition.id = "Ammunition"
	Ammunition:setText( ToUpperCase( Engine.Localize( "EQUIPMENT_HACK_AMMUNITION" ) ), 0 )
	Ammunition:SetFontSize( 24 * _1080p )
	Ammunition:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Ammunition:SetAlignment( LUI.Alignment.Right )
	Ammunition:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -500, 0, 0, _1080p * 24 )
	self:addElement( Ammunition )
	self.Ammunition = Ammunition
	
	local StockAmmo = nil
	
	StockAmmo = LUI.UIStyledText.new()
	StockAmmo.id = "StockAmmo"
	StockAmmo:SetRGBFromInt( 10066329, 0 )
	StockAmmo:SetFontSize( 32 * _1080p )
	StockAmmo:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StockAmmo:SetAlignment( LUI.Alignment.Center )
	StockAmmo:SetShadowMinDistance( -0.02, 0 )
	StockAmmo:SetShadowMaxDistance( 0.02, 0 )
	StockAmmo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -60, 0, _1080p * 26, _1080p * 58 )
	StockAmmo:BindAlphaToModel( DataSources.inGame.player.currentWeapon.ammoReserveAlpha:GetModel( f4_local1 ) )
	StockAmmo:SubscribeToModel( DataSources.inGame.player.currentWeapon.stockAmmoDisplay:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.currentWeapon.stockAmmoDisplay:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			StockAmmo:setText( f5_local0, 0 )
		end
	end )
	self:addElement( StockAmmo )
	self.StockAmmo = StockAmmo
	
	local ClipAmmo = nil
	
	ClipAmmo = LUI.UIStyledText.new()
	ClipAmmo.id = "ClipAmmo"
	ClipAmmo:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	ClipAmmo:SetDotPitchEnabled( true )
	ClipAmmo:SetDotPitchX( 0, 0 )
	ClipAmmo:SetDotPitchY( 0, 0 )
	ClipAmmo:SetDotPitchContrast( 0, 0 )
	ClipAmmo:SetDotPitchMode( 0 )
	ClipAmmo:SetFontSize( 48 * _1080p )
	ClipAmmo:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ClipAmmo:SetAlignment( LUI.Alignment.Center )
	ClipAmmo:SetShadowMinDistance( -0.2, 0 )
	ClipAmmo:SetShadowMaxDistance( 0.8, 0 )
	ClipAmmo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -120, _1080p * -60, _1080p * 24, _1080p * 72 )
	ClipAmmo:BindAlphaToModel( DataSources.inGame.player.currentWeapon.ammoInfoAlpha:GetModel( f4_local1 ) )
	ClipAmmo:SubscribeToModel( DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay:GetModel( f4_local1 ), function ()
		local f6_local0 = DataSources.inGame.player.currentWeapon.clipAmmoRightDisplay:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			ClipAmmo:setText( f6_local0, 0 )
		end
	end )
	self:addElement( ClipAmmo )
	self.ClipAmmo = ClipAmmo
	
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:SetAlpha( 0.5, 0 )
	Divider:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -61, _1080p * -59, _1080p * 33, _1080p * 55 )
	self:addElement( Divider )
	self.Divider = Divider
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ClipAmmo:RegisterAnimationSequence( "UpdateClip", {
			{
				function ()
					return self.ClipAmmo:SetDepth( -8, 0 )
				end,
				function ()
					return self.ClipAmmo:SetDepth( 0, 100 )
				end
			},
			{
				function ()
					return self.ClipAmmo:SetScale( 0.25, 0 )
				end,
				function ()
					return self.ClipAmmo:SetScale( 0, 100 )
				end
			},
			{
				function ()
					return self.ClipAmmo:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.ClipAmmo:SetDotPitchX( 0, 100 )
				end
			},
			{
				function ()
					return self.ClipAmmo:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.ClipAmmo:SetDotPitchY( 0, 100 )
				end
			},
			{
				function ()
					return self.ClipAmmo:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.ClipAmmo:SetDotPitchContrast( 0, 100 )
				end
			}
		} )
		self._sequences.UpdateClip = function ()
			ClipAmmo:AnimateSequence( "UpdateClip" )
		end
		
		StockAmmo:RegisterAnimationSequence( "UpdateStock", {
			{
				function ()
					return self.StockAmmo:SetDepth( -8, 0 )
				end,
				function ()
					return self.StockAmmo:SetDepth( 0, 100 )
				end
			},
			{
				function ()
					return self.StockAmmo:SetScale( 0.25, 0 )
				end,
				function ()
					return self.StockAmmo:SetScale( 0, 100 )
				end
			},
			{
				function ()
					return self.StockAmmo:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.StockAmmo:SetDotPitchX( 0, 100 )
				end
			},
			{
				function ()
					return self.StockAmmo:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.StockAmmo:SetDotPitchY( 0, 100 )
				end
			},
			{
				function ()
					return self.StockAmmo:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.StockAmmo:SetDotPitchContrast( 0, 100 )
				end
			}
		} )
		self._sequences.UpdateStock = function ()
			StockAmmo:AnimateSequence( "UpdateStock" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "EthanHackAmmoCounter", EthanHackAmmoCounter )
LockTable( _M )
