local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WeaponInfoContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 293 * _1080p, 0, 105 * _1080p )
	self.id = "WeaponInfoContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ZomWeaponInfoWidget = nil
	
	ZomWeaponInfoWidget = MenuBuilder.BuildRegisteredType( "ZomWeaponInfo", {
		controllerIndex = f1_local1
	} )
	ZomWeaponInfoWidget.id = "ZomWeaponInfoWidget"
	ZomWeaponInfoWidget:SetYRotation( -16, 0 )
	ZomWeaponInfoWidget:SetZRotation( -3, 0 )
	ZomWeaponInfoWidget:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 293, 0, _1080p * 105 )
	self:addElement( ZomWeaponInfoWidget )
	self.ZomWeaponInfoWidget = ZomWeaponInfoWidget
	
	return self
end

MenuBuilder.registerType( "WeaponInfoContainer", WeaponInfoContainer )
LockTable( _M )
