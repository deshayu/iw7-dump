local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HelmetOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HelmetOverlay"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Overlay = nil
	
	Overlay = MenuBuilder.BuildRegisteredType( "GeneralHUDOverlay", {
		controllerIndex = f1_local1
	} )
	Overlay.id = "Overlay"
	Overlay:SetAlpha( 0.75, 0 )
	Overlay:SetScale( 0.05, 0 )
	Overlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Overlay )
	self.Overlay = Overlay
	
	return self
end

MenuBuilder.registerType( "HelmetOverlay", HelmetOverlay )
LockTable( _M )
