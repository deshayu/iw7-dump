local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.SpecialAmmoIcon:SetAlpha( 0 )
	f1_arg0.TurretAmmoIcon:SetAlpha( 0 )
	f1_arg0.UnlimitedAmmoIcon:SetAlpha( 0 )
end

function CPWeaponInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 150 * _1080p )
	self.id = "CPWeaponInfo"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local WeaponInfo = nil
	
	WeaponInfo = MenuBuilder.BuildRegisteredType( "WeaponInfo", {
		controllerIndex = f2_local1
	} )
	WeaponInfo.id = "WeaponInfo"
	WeaponInfo:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( WeaponInfo )
	self.WeaponInfo = WeaponInfo
	
	local SpecialAmmoIcon = nil
	
	SpecialAmmoIcon = LUI.UIImage.new()
	SpecialAmmoIcon.id = "SpecialAmmoIcon"
	SpecialAmmoIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -20.99, _1080p * 11.01, _1080p * -44, _1080p * -12 )
	SpecialAmmoIcon:BindAlphaToModel( DataSources.inGame.CP.ammo.specialAlpha:GetModel( f2_local1 ) )
	SpecialAmmoIcon:SubscribeToModel( DataSources.inGame.CP.ammo.specialImage:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.ammo.specialImage:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			SpecialAmmoIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( SpecialAmmoIcon )
	self.SpecialAmmoIcon = SpecialAmmoIcon
	
	local TurretAmmoIcon = nil
	
	TurretAmmoIcon = LUI.UIImage.new()
	TurretAmmoIcon.id = "TurretAmmoIcon"
	TurretAmmoIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -175, _1080p * -143, _1080p * -19, _1080p * 13 )
	TurretAmmoIcon:BindAlphaToModel( DataSources.inGame.CP.ammo.turretAlpha:GetModel( f2_local1 ) )
	TurretAmmoIcon:SubscribeToModel( DataSources.inGame.CP.ammo.turretImage:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.ammo.turretImage:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			TurretAmmoIcon:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( TurretAmmoIcon )
	self.TurretAmmoIcon = TurretAmmoIcon
	
	local UnlimitedAmmoIcon = nil
	
	UnlimitedAmmoIcon = LUI.UIImage.new()
	UnlimitedAmmoIcon.id = "UnlimitedAmmoIcon"
	UnlimitedAmmoIcon:setImage( RegisterMaterial( "hud_alien_ammo_infinite" ), 0 )
	UnlimitedAmmoIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -96.99, _1080p * -32.99, _1080p * -23, _1080p * 9 )
	UnlimitedAmmoIcon:BindAlphaToModel( DataSources.inGame.CP.ammo.unlimitedAlpha:GetModel( f2_local1 ) )
	self:addElement( UnlimitedAmmoIcon )
	self.UnlimitedAmmoIcon = UnlimitedAmmoIcon
	
	self:SubscribeToModel( DataSources.inGame.CP.ammo.unlimited:GetModel( f2_local1 ), function ()
		if DataSources.inGame.CP.ammo.unlimited:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.ammo.unlimited:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "WeaponInfo",
				sequenceName = "HideAmmo",
				elementPath = ""
			} )
		end
		if DataSources.inGame.CP.ammo.unlimited:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.ammo.unlimited:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "WeaponInfo",
				sequenceName = "ShowAmmo",
				elementPath = ""
			} )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "CPWeaponInfo", CPWeaponInfo )
LockTable( _M )
