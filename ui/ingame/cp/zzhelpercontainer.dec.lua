local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function zzhelperContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "zzhelperContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local zzHelper = nil
	
	zzHelper = MenuBuilder.BuildRegisteredType( "zzHelper", {
		controllerIndex = f1_local1
	} )
	zzHelper.id = "zzHelper"
	zzHelper:SetYRotation( -16, 0 )
	zzHelper:SetZRotation( -3, 0 )
	zzHelper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 1980, _1080p * -17, _1080p * 1063 )
	self:addElement( zzHelper )
	self.zzHelper = zzHelper
	
	return self
end

MenuBuilder.registerType( "zzhelperContainer", zzhelperContainer )
LockTable( _M )
