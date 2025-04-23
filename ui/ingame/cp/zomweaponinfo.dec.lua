local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ZomWeaponInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 293 * _1080p, 0, 105 * _1080p )
	self.id = "ZomWeaponInfo"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PrimaryAbilityQuantity = nil
	
	PrimaryAbilityQuantity = LUI.UIText.new()
	PrimaryAbilityQuantity.id = "PrimaryAbilityQuantity"
	PrimaryAbilityQuantity:SetScale( 0, 0 )
	PrimaryAbilityQuantity:SetFontSize( 22 * _1080p )
	PrimaryAbilityQuantity:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PrimaryAbilityQuantity:SetAlignment( LUI.Alignment.Center )
	PrimaryAbilityQuantity:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -28.54, _1080p * 1.46, _1080p * 11.75, _1080p * 33.75 )
	PrimaryAbilityQuantity:BindColorToModel( DataSources.inGame.player.primaryPower.color:GetModel( f1_local1 ) )
	PrimaryAbilityQuantity:BindAlphaToModel( DataSources.inGame.player.primaryPower.numAlpha:GetModel( f1_local1 ) )
	PrimaryAbilityQuantity:SubscribeToModel( DataSources.inGame.player.primaryPower.numCharges:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.primaryPower.numCharges:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			PrimaryAbilityQuantity:setText( f2_local0, 0 )
		end
	end )
	self:addElement( PrimaryAbilityQuantity )
	self.PrimaryAbilityQuantity = PrimaryAbilityQuantity
	
	local PrimaryAbility = nil
	
	PrimaryAbility = MenuBuilder.BuildRegisteredType( "ZomPlayerAbilityBase", {
		controllerIndex = f1_local1
	} )
	PrimaryAbility.id = "PrimaryAbility"
	PrimaryAbility:SetScale( -0.73, 0 )
	PrimaryAbility:SetDataSource( DataSources.inGame.player.primaryPower, f1_local1 )
	PrimaryAbility:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -106.91, _1080p * 23.09, _1080p * -43.37, _1080p * 81.63 )
	PrimaryAbility:BindAlphaToModel( DataSources.inGame.player.primaryPower.iconAlpha:GetModel( f1_local1 ) )
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.icon:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.primaryPower.icon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			PrimaryAbility.AbilityIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( PrimaryAbility )
	self.PrimaryAbility = PrimaryAbility
	
	local SecondaryAbilityQuantity = nil
	
	SecondaryAbilityQuantity = LUI.UIText.new()
	SecondaryAbilityQuantity.id = "SecondaryAbilityQuantity"
	SecondaryAbilityQuantity:SetScale( 0, 0 )
	SecondaryAbilityQuantity:SetFontSize( 22 * _1080p )
	SecondaryAbilityQuantity:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	SecondaryAbilityQuantity:SetAlignment( LUI.Alignment.Center )
	SecondaryAbilityQuantity:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 202.64, _1080p * 232.64, _1080p * 11.75, _1080p * 33.75 )
	SecondaryAbilityQuantity:BindColorToModel( DataSources.inGame.player.secondaryPower.color:GetModel( f1_local1 ) )
	SecondaryAbilityQuantity:BindAlphaToModel( DataSources.inGame.player.secondaryPower.numAlpha:GetModel( f1_local1 ) )
	SecondaryAbilityQuantity:SubscribeToModel( DataSources.inGame.player.secondaryPower.numCharges:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.secondaryPower.numCharges:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			SecondaryAbilityQuantity:setText( f4_local0, 0 )
		end
	end )
	self:addElement( SecondaryAbilityQuantity )
	self.SecondaryAbilityQuantity = SecondaryAbilityQuantity
	
	local SecondaryAbility = nil
	
	SecondaryAbility = MenuBuilder.BuildRegisteredType( "ZomPlayerAbilityBase", {
		controllerIndex = f1_local1
	} )
	SecondaryAbility.id = "SecondaryAbility"
	SecondaryAbility:SetScale( -0.73, 0 )
	SecondaryAbility:SetDataSource( DataSources.inGame.player.secondaryPower, f1_local1 )
	SecondaryAbility:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 124.54, _1080p * 254.54, _1080p * -43.37, _1080p * 81.63 )
	SecondaryAbility:BindAlphaToModel( DataSources.inGame.player.secondaryPower.iconAlpha:GetModel( f1_local1 ) )
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.icon:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.secondaryPower.icon:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			SecondaryAbility.AbilityIcon:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( SecondaryAbility )
	self.SecondaryAbility = SecondaryAbility
	
	local slashMark = nil
	
	slashMark = LUI.UIText.new()
	slashMark.id = "slashMark"
	slashMark:SetAlpha( 0, 0 )
	slashMark:setText( Engine.Localize( "ZOM_WEAPON_SLASH_MARK" ), 0 )
	slashMark:SetFontSize( 19 * _1080p )
	slashMark:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	slashMark:SetAlignment( LUI.Alignment.Left )
	slashMark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 235.99, _1080p * 264.99, _1080p * 82.64, _1080p * 102.64 )
	self:addElement( slashMark )
	self.slashMark = slashMark
	
	local UnlimitedAmmoIcon = nil
	
	UnlimitedAmmoIcon = LUI.UIImage.new()
	UnlimitedAmmoIcon.id = "UnlimitedAmmoIcon"
	UnlimitedAmmoIcon:SetScale( 0.16, 0 )
	UnlimitedAmmoIcon:setImage( RegisterMaterial( "hud_alien_ammo_infinite" ), 0 )
	UnlimitedAmmoIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -94.63, _1080p * -30.63, _1080p * -9.19, _1080p * 22.81 )
	UnlimitedAmmoIcon:BindAlphaToModel( DataSources.inGame.CP.ammo.unlimitedAlpha:GetModel( f1_local1 ) )
	self:addElement( UnlimitedAmmoIcon )
	self.UnlimitedAmmoIcon = UnlimitedAmmoIcon
	
	local CraftedWeapon = nil
	
	CraftedWeapon = MenuBuilder.BuildRegisteredType( "CraftedWeapon", {
		controllerIndex = f1_local1
	} )
	CraftedWeapon.id = "CraftedWeapon"
	CraftedWeapon:SetScale( 1.86, 0 )
	CraftedWeapon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28.16, _1080p * 66.16, _1080p * 33.38, _1080p * 72.38 )
	self:addElement( CraftedWeapon )
	self.CraftedWeapon = CraftedWeapon
	
	local weaponinfoZM = nil
	
	weaponinfoZM = MenuBuilder.BuildRegisteredType( "weaponinfoZM", {
		controllerIndex = f1_local1
	} )
	weaponinfoZM.id = "weaponinfoZM"
	weaponinfoZM:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -12.39, _1080p * 287.61, _1080p * 34.71, _1080p * 84.71 )
	weaponinfoZM:SubscribeToModel( DataSources.inGame.CP.ammo.unlimitedAlpha:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.ammo.unlimitedAlpha:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			weaponinfoZM:SetAlpha( Mirror( f6_local0, 0, 1 ), 0 )
		end
	end )
	self:addElement( weaponinfoZM )
	self.weaponinfoZM = weaponinfoZM
	
	local muleWeaponIndicator = nil
	
	muleWeaponIndicator = LUI.UIImage.new()
	muleWeaponIndicator.id = "muleWeaponIndicator"
	muleWeaponIndicator:setImage( RegisterMaterial( "cp_zmb_perk_icon_more" ), 0 )
	muleWeaponIndicator:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.37, _1080p * 297.37, _1080p * 29, _1080p * 65.75 )
	muleWeaponIndicator:BindAlphaToModel( DataSources.inGame.CP.zombies.perks.muleMunchiesWeapIcon:GetModel( f1_local1 ) )
	self:addElement( muleWeaponIndicator )
	self.muleWeaponIndicator = muleWeaponIndicator
	
	PrimaryAbility:SetDataSource( DataSources.inGame.player.primaryPower, f1_local1 )
	SecondaryAbility:SetDataSource( DataSources.inGame.player.secondaryPower, f1_local1 )
	return self
end

MenuBuilder.registerType( "ZomWeaponInfo", ZomWeaponInfo )
LockTable( _M )
