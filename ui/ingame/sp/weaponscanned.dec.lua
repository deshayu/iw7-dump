local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.SpecialFunctionsText )
	assert( f1_arg0.BulletTypeText )
	assert( f1_arg0.WeaponTypeText )
	assert( f1_arg0.WeaponImage )
	assert( f1_arg0.WeaponNameText )
	local f1_local0 = LUI.AggregateDataSource.new( DataSources.inGame.player.currentWeapon, {
		DataSources.inGame.player.currentWeapon,
		DataSources.inGame.SP.weaponScanned
	}, "wasScanned", function ( f2_arg0 )
		local f2_local0 = DataSources.inGame.SP.weaponScanned:GetValue( f2_arg0 )
		local f2_local1 = DataSources.inGame.player.currentWeapon.name:GetValue( f2_arg0 )
		if f2_local0 == "none" then
			ACTIONS.AnimateSequence( f1_arg0, "Hidden" )
			return f2_local0
		elseif string.match( f2_local1, f2_local0:gsub( "weapon_", "" ) ) then
			return f2_local0
		else
			return nil
		end
	end )
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		local f3_local0 = f1_local0:GetValue( f1_arg1 )
		if f3_local0 ~= nil and f3_local0 ~= "none" then
			f1_arg0.SpecialFunctionsText:setText( DataSources.inGame.player.currentWeapon.specialFeatures:GetValue( f1_arg1 ), 0 )
			f1_arg0.BulletTypeText:setText( DataSources.inGame.player.currentWeapon.bulletType:GetValue( f1_arg1 ), 0 )
			f1_arg0.WeaponTypeText:setText( DataSources.inGame.player.currentWeapon.classDisplayName:GetValue( f1_arg1 ), 0 )
			f1_arg0.WeaponImage:setImage( RegisterMaterial( DataSources.inGame.player.currentWeapon.image:GetValue( f1_arg1 ) ), 0 )
			f1_arg0.WeaponNameText:setText( ToUpperCase( DataSources.inGame.player.currentWeapon.baseDisplayName:GetValue( f1_arg1 ) ), 0 )
		end
	end )
end

function WeaponScanned( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 275 * _1080p, 0, 450 * _1080p )
	self.id = "WeaponScanned"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Background:SetUseAA( true )
	self:addElement( Background )
	self.Background = Background
	
	local CapLeft = nil
	
	CapLeft = LUI.UIImage.new()
	CapLeft.id = "CapLeft"
	CapLeft:SetAlpha( 0.4, 0 )
	CapLeft:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, 0 )
	self:addElement( CapLeft )
	self.CapLeft = CapLeft
	
	local CapRight = nil
	
	CapRight = LUI.UIImage.new()
	CapRight.id = "CapRight"
	CapRight:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, 0 )
	self:addElement( CapRight )
	self.CapRight = CapRight
	
	local SpecialFunctionsText = nil
	
	SpecialFunctionsText = LUI.UIStyledText.new()
	SpecialFunctionsText.id = "SpecialFunctionsText"
	SpecialFunctionsText:setText( "", 0 )
	SpecialFunctionsText:SetFontSize( 24 * _1080p )
	SpecialFunctionsText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	SpecialFunctionsText:SetAlignment( LUI.Alignment.Left )
	SpecialFunctionsText:SetDecodeUseSystemTime( false )
	SpecialFunctionsText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 266, _1080p * 359, _1080p * 383 )
	self:addElement( SpecialFunctionsText )
	self.SpecialFunctionsText = SpecialFunctionsText
	
	local SpecialFunctionsHeader = nil
	
	SpecialFunctionsHeader = LUI.UIStyledText.new()
	SpecialFunctionsHeader.id = "SpecialFunctionsHeader"
	SpecialFunctionsHeader:SetRGBFromTable( SWATCHES.PIP.PIPMessageGeneral, 0 )
	SpecialFunctionsHeader:setText( ToUpperCase( Engine.Localize( "HUD_SPECIALFEATURES" ) ), 0 )
	SpecialFunctionsHeader:SetFontSize( 22 * _1080p )
	SpecialFunctionsHeader:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	SpecialFunctionsHeader:SetAlignment( LUI.Alignment.Left )
	SpecialFunctionsHeader:SetDecodeUseSystemTime( false )
	SpecialFunctionsHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 266, _1080p * 337, _1080p * 359 )
	self:addElement( SpecialFunctionsHeader )
	self.SpecialFunctionsHeader = SpecialFunctionsHeader
	
	local BulletTypeText = nil
	
	BulletTypeText = LUI.UIStyledText.new()
	BulletTypeText.id = "BulletTypeText"
	BulletTypeText:setText( "", 0 )
	BulletTypeText:SetFontSize( 24 * _1080p )
	BulletTypeText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	BulletTypeText:SetAlignment( LUI.Alignment.Left )
	BulletTypeText:SetDecodeUseSystemTime( false )
	BulletTypeText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 266, _1080p * 297, _1080p * 321 )
	self:addElement( BulletTypeText )
	self.BulletTypeText = BulletTypeText
	
	local BulletTypeHeader = nil
	
	BulletTypeHeader = LUI.UIStyledText.new()
	BulletTypeHeader.id = "BulletTypeHeader"
	BulletTypeHeader:SetRGBFromTable( SWATCHES.PIP.PIPMessageGeneral, 0 )
	BulletTypeHeader:setText( ToUpperCase( Engine.Localize( "HUD_BULLETTYPE" ) ), 0 )
	BulletTypeHeader:SetFontSize( 22 * _1080p )
	BulletTypeHeader:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	BulletTypeHeader:SetAlignment( LUI.Alignment.Left )
	BulletTypeHeader:SetDecodeUseSystemTime( false )
	BulletTypeHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 266, _1080p * 275.18, _1080p * 297.18 )
	self:addElement( BulletTypeHeader )
	self.BulletTypeHeader = BulletTypeHeader
	
	local WeaponTypeText = nil
	
	WeaponTypeText = LUI.UIStyledText.new()
	WeaponTypeText.id = "WeaponTypeText"
	WeaponTypeText:SetRGBFromInt( 16250871, 0 )
	WeaponTypeText:setText( "", 0 )
	WeaponTypeText:SetFontSize( 24 * _1080p )
	WeaponTypeText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WeaponTypeText:SetAlignment( LUI.Alignment.Left )
	WeaponTypeText:SetDecodeUseSystemTime( false )
	WeaponTypeText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 266, _1080p * 238, _1080p * 262 )
	self:addElement( WeaponTypeText )
	self.WeaponTypeText = WeaponTypeText
	
	local WeaponTypeHeader = nil
	
	WeaponTypeHeader = LUI.UIStyledText.new()
	WeaponTypeHeader.id = "WeaponTypeHeader"
	WeaponTypeHeader:SetRGBFromTable( SWATCHES.PIP.PIPMessageGeneral, 0 )
	WeaponTypeHeader:setText( ToUpperCase( Engine.Localize( "HUD_WEAPONTYPE" ) ), 0 )
	WeaponTypeHeader:SetFontSize( 22 * _1080p )
	WeaponTypeHeader:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WeaponTypeHeader:SetAlignment( LUI.Alignment.Left )
	WeaponTypeHeader:SetDecodeUseSystemTime( false )
	WeaponTypeHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 266, _1080p * 216, _1080p * 238 )
	self:addElement( WeaponTypeHeader )
	self.WeaponTypeHeader = WeaponTypeHeader
	
	local WeaponImage = nil
	
	WeaponImage = LUI.UIImage.new()
	WeaponImage.id = "WeaponImage"
	WeaponImage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -239.69, _1080p * -35.31, _1080p * 106.06, _1080p * 206 )
	self:addElement( WeaponImage )
	self.WeaponImage = WeaponImage
	
	local WeaponNameText = nil
	
	WeaponNameText = LUI.UIStyledText.new()
	WeaponNameText.id = "WeaponNameText"
	WeaponNameText:setText( "", 0 )
	WeaponNameText:SetFontSize( 30 * _1080p )
	WeaponNameText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WeaponNameText:SetAlignment( LUI.Alignment.Center )
	WeaponNameText:SetDecodeLetterLength( 100 )
	WeaponNameText:SetDecodeMaxRandChars( 10 )
	WeaponNameText:SetDecodeUpdatesPerLetter( 6 )
	WeaponNameText:SetDecodeUseSystemTime( false )
	WeaponNameText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, _1080p * 52.06, _1080p * 82.06 )
	self:addElement( WeaponNameText )
	self.WeaponNameText = WeaponNameText
	
	local FluffHeaderRight0 = nil
	
	FluffHeaderRight0 = MenuBuilder.BuildRegisteredType( "FluffHeaderRight", {
		controllerIndex = f4_local1
	} )
	FluffHeaderRight0.id = "FluffHeaderRight0"
	FluffHeaderRight0.HeaderText:setText( ToUpperCase( Engine.Localize( "HUD_NEW_WEAPON" ) ), 0 )
	FluffHeaderRight0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 15, _1080p * 45 )
	self:addElement( FluffHeaderRight0 )
	self.FluffHeaderRight0 = FluffHeaderRight0
	
	local EnergyBolt = nil
	
	EnergyBolt = LUI.UIImage.new()
	EnergyBolt.id = "EnergyBolt"
	EnergyBolt:SetRGBFromTable( SWATCHES.HUD.statusFill_Active, 0 )
	EnergyBolt:SetAlpha( 0, 0 )
	EnergyBolt:setImage( RegisterMaterial( "hud_weapon_info_energy_bolt" ), 0 )
	EnergyBolt:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7, _1080p * 35, _1080p * 107.06, _1080p * 135.06 )
	self:addElement( EnergyBolt )
	self.EnergyBolt = EnergyBolt
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 4250 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 500 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 350 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 275, 0, 0, _1080p * -375, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 275, 0, 0, _1080p * -375, 400 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -375, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 199, LUI.EASING.outBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 3850 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -375, 199, LUI.EASING.inBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 275, 0, 0, _1080p * -375, 200, LUI.EASING.inBack )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.CapLeft:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 100 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 4250 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 500 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 0 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 49 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 49 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 99 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -375, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, 0, 199, LUI.EASING.outBack )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, 0, 3850 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -375, 199, LUI.EASING.inBack )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 99 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 49 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 49 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 49 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 271, _1080p * 274, 0, _1080p * -375, 50 )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.CapRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 100 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 4250 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 500 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 0 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 49 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 49 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 99 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 200 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, 0, 199, LUI.EASING.outBack )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, 0, 3850 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 199, LUI.EASING.inBack )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 200 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 99 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 49 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 49 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 49 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -375, 50 )
				end
			}
		} )
		SpecialFunctionsText:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.SpecialFunctionsText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SpecialFunctionsText:SetAlpha( 0, 1150 )
				end,
				function ()
					return self.SpecialFunctionsText:SetAlpha( 1, 150 )
				end,
				function ()
					return self.SpecialFunctionsText:SetAlpha( 1, 3350 )
				end,
				function ()
					return self.SpecialFunctionsText:SetAlpha( 0, 50 )
				end
			}
		} )
		SpecialFunctionsHeader:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.SpecialFunctionsHeader:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SpecialFunctionsHeader:SetAlpha( 0, 1100 )
				end,
				function ()
					return self.SpecialFunctionsHeader:SetAlpha( 1, 150 )
				end,
				function ()
					return self.SpecialFunctionsHeader:SetAlpha( 1, 3400 )
				end,
				function ()
					return self.SpecialFunctionsHeader:SetAlpha( 0, 50 )
				end
			}
		} )
		BulletTypeText:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.BulletTypeText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BulletTypeText:SetAlpha( 0, 1050 )
				end,
				function ()
					return self.BulletTypeText:SetAlpha( 1, 150 )
				end,
				function ()
					return self.BulletTypeText:SetAlpha( 1, 3450 )
				end,
				function ()
					return self.BulletTypeText:SetAlpha( 0, 50 )
				end
			}
		} )
		BulletTypeHeader:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.BulletTypeHeader:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BulletTypeHeader:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.BulletTypeHeader:SetAlpha( 1, 150 )
				end,
				function ()
					return self.BulletTypeHeader:SetAlpha( 1, 3500 )
				end,
				function ()
					return self.BulletTypeHeader:SetAlpha( 0, 50 )
				end
			}
		} )
		WeaponTypeText:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.WeaponTypeText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WeaponTypeText:SetAlpha( 0, 950 )
				end,
				function ()
					return self.WeaponTypeText:SetAlpha( 1, 150 )
				end,
				function ()
					return self.WeaponTypeText:SetAlpha( 1, 3550 )
				end,
				function ()
					return self.WeaponTypeText:SetAlpha( 0, 50 )
				end
			}
		} )
		WeaponTypeHeader:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.WeaponTypeHeader:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WeaponTypeHeader:SetAlpha( 0, 900 )
				end,
				function ()
					return self.WeaponTypeHeader:SetAlpha( 1, 150 )
				end,
				function ()
					return self.WeaponTypeHeader:SetAlpha( 1, 3600 )
				end,
				function ()
					return self.WeaponTypeHeader:SetAlpha( 0, 50 )
				end
			}
		} )
		WeaponImage:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.WeaponImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WeaponImage:SetAlpha( 0, 850 )
				end,
				function ()
					return self.WeaponImage:SetAlpha( 1, 150 )
				end,
				function ()
					return self.WeaponImage:SetAlpha( 1, 3650 )
				end,
				function ()
					return self.WeaponImage:SetAlpha( 0, 50 )
				end
			}
		} )
		WeaponNameText:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.WeaponNameText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WeaponNameText:SetAlpha( 0, 800 )
				end,
				function ()
					return self.WeaponNameText:SetAlpha( 1, 150 )
				end,
				function ()
					return self.WeaponNameText:SetAlpha( 1, 3700 )
				end,
				function ()
					return self.WeaponNameText:SetAlpha( 0, 50 )
				end
			}
		} )
		FluffHeaderRight0:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.FluffHeaderRight0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FluffHeaderRight0:SetAlpha( 0, 750 )
				end,
				function ()
					return self.FluffHeaderRight0:SetAlpha( 1, 50 )
				end,
				function ()
					return self.FluffHeaderRight0:SetAlpha( 1, 3850 )
				end,
				function ()
					return self.FluffHeaderRight0:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.TextOn = function ()
			Background:AnimateSequence( "TextOn" )
			CapLeft:AnimateSequence( "TextOn" )
			CapRight:AnimateSequence( "TextOn" )
			SpecialFunctionsText:AnimateSequence( "TextOn" )
			SpecialFunctionsHeader:AnimateSequence( "TextOn" )
			BulletTypeText:AnimateSequence( "TextOn" )
			BulletTypeHeader:AnimateSequence( "TextOn" )
			WeaponTypeText:AnimateSequence( "TextOn" )
			WeaponTypeHeader:AnimateSequence( "TextOn" )
			WeaponImage:AnimateSequence( "TextOn" )
			WeaponNameText:AnimateSequence( "TextOn" )
			FluffHeaderRight0:AnimateSequence( "TextOn" )
		end
		
		Background:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.CapLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.CapRight:SetAlpha( 0, 0 )
				end
			}
		} )
		SpecialFunctionsText:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.SpecialFunctionsText:SetAlpha( 0, 0 )
				end
			}
		} )
		SpecialFunctionsHeader:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.SpecialFunctionsHeader:SetAlpha( 0, 0 )
				end
			}
		} )
		BulletTypeText:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.BulletTypeText:SetAlpha( 0, 0 )
				end
			}
		} )
		BulletTypeHeader:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.BulletTypeHeader:SetAlpha( 0, 0 )
				end
			}
		} )
		WeaponTypeText:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.WeaponTypeText:SetAlpha( 0, 0 )
				end
			}
		} )
		WeaponTypeHeader:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.WeaponTypeHeader:SetAlpha( 0, 0 )
				end
			}
		} )
		WeaponImage:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.WeaponImage:SetAlpha( 0, 0 )
				end
			}
		} )
		WeaponNameText:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.WeaponNameText:SetAlpha( 0, 0 )
				end
			}
		} )
		FluffHeaderRight0:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.FluffHeaderRight0:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			Background:AnimateSequence( "Hidden" )
			CapLeft:AnimateSequence( "Hidden" )
			CapRight:AnimateSequence( "Hidden" )
			SpecialFunctionsText:AnimateSequence( "Hidden" )
			SpecialFunctionsHeader:AnimateSequence( "Hidden" )
			BulletTypeText:AnimateSequence( "Hidden" )
			BulletTypeHeader:AnimateSequence( "Hidden" )
			WeaponTypeText:AnimateSequence( "Hidden" )
			WeaponTypeHeader:AnimateSequence( "Hidden" )
			WeaponImage:AnimateSequence( "Hidden" )
			WeaponNameText:AnimateSequence( "Hidden" )
			FluffHeaderRight0:AnimateSequence( "Hidden" )
		end
		
		EnergyBolt:RegisterAnimationSequence( "ShowEnergy", {
			{
				function ()
					return self.EnergyBolt:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EnergyBolt:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.EnergyBolt:SetAlpha( 1, 3560 )
				end,
				function ()
					return self.EnergyBolt:SetAlpha( 0, 940 )
				end
			}
		} )
		self._sequences.ShowEnergy = function ()
			EnergyBolt:AnimateSequence( "ShowEnergy" )
		end
		
		EnergyBolt:RegisterAnimationSequence( "HideEnergy", {
			{
				function ()
					return self.EnergyBolt:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideEnergy = function ()
			EnergyBolt:AnimateSequence( "HideEnergy" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.weaponScanned:GetModel( f4_local1 ), function ()
		if DataSources.inGame.SP.weaponScanned:GetValue( f4_local1 ) ~= nil and DataSources.inGame.SP.weaponScanned:GetValue( f4_local1 ) ~= "none" then
			ACTIONS.AnimateSequence( self, "TextOn" )
		end
		if DataSources.inGame.SP.weaponScanned:GetValue( f4_local1 ) ~= nil and DataSources.inGame.SP.weaponScanned:GetValue( f4_local1 ) ~= "none" and DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f4_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowEnergy" )
		end
		if DataSources.inGame.SP.weaponScanned:GetValue( f4_local1 ) ~= nil and DataSources.inGame.SP.weaponScanned:GetValue( f4_local1 ) ~= "none" and DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f4_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideEnergy" )
		end
	end )
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "Hidden" )
	return self
end

MenuBuilder.registerType( "WeaponScanned", WeaponScanned )
LockTable( _M )
