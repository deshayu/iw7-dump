local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetDotPitchEnabled( true )
	f1_arg0:SetDotPitchX( 6, 0 )
	f1_arg0:SetDotPitchY( 3, 0 )
	f1_arg0:SetDotPitchContrast( 0.15, 0 )
	f1_arg0:SetXRotation( -25 )
	f1_arg0:SetYRotation( -30 )
	f1_arg0:SetZRotation( -1 )
end

function SPWeaponInfoContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 410 * _1080p, 0, 120 * _1080p )
	self.id = "SPWeaponInfoContainer"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local SPWeaponInfo = nil
	
	SPWeaponInfo = MenuBuilder.BuildRegisteredType( "SPWeaponInfo", {
		controllerIndex = f2_local1
	} )
	SPWeaponInfo.id = "SPWeaponInfo"
	SPWeaponInfo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -340, _1080p * -40, _1080p * 15, _1080p * 65 )
	self:addElement( SPWeaponInfo )
	self.SPWeaponInfo = SPWeaponInfo
	
	local SPWeaponInfoDesc = nil
	
	SPWeaponInfoDesc = MenuBuilder.BuildRegisteredType( "SPWeaponInfoDesc", {
		controllerIndex = f2_local1
	} )
	SPWeaponInfoDesc.id = "SPWeaponInfoDesc"
	SPWeaponInfoDesc:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -355, _1080p * -55, _1080p * 65, _1080p * 105 )
	self:addElement( SPWeaponInfoDesc )
	self.SPWeaponInfoDesc = SPWeaponInfoDesc
	
	local WeaponCharge = nil
	
	WeaponCharge = MenuBuilder.BuildRegisteredType( "WeaponCharge", {
		controllerIndex = f2_local1
	} )
	WeaponCharge.id = "WeaponCharge"
	WeaponCharge:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -225, _1080p * -25, _1080p * -70, _1080p * -35 )
	self:addElement( WeaponCharge )
	self.WeaponCharge = WeaponCharge
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "SPWeaponInfoContainer", SPWeaponInfoContainer )
LockTable( _M )
