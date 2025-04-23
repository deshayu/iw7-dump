local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WonderCardDevil( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 172 * _1080p, 0, 248 * _1080p )
	self.id = "WonderCardDevil"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local WonderCardBacking = nil
	
	WonderCardBacking = MenuBuilder.BuildRegisteredType( "WonderCardBacking", {
		controllerIndex = f1_local1
	} )
	WonderCardBacking.id = "WonderCardBacking"
	WonderCardBacking:SetScale( 0.44, 0 )
	WonderCardBacking.devilHead:SetAlpha( 0, 0 )
	WonderCardBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 153, _1080p * 40, _1080p * 208 )
	self:addElement( WonderCardBacking )
	self.WonderCardBacking = WonderCardBacking
	
	return self
end

MenuBuilder.registerType( "WonderCardDevil", WonderCardDevil )
LockTable( _M )
