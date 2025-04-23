local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function StaticOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "StaticOverlay"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Static = nil
	
	Static = LUI.UIImage.new()
	Static.id = "Static"
	Static:SetAlpha( 0.64, 0 )
	Static:setImage( RegisterMaterial( "overlay_static" ), 0 )
	Static:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( Static )
	self.Static = Static
	
	return self
end

MenuBuilder.registerType( "StaticOverlay", StaticOverlay )
LockTable( _M )
