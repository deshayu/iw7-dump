local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WonderCardFillWidgetContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 76 * _1080p, 0, 458 * _1080p )
	self.id = "WonderCardFillWidgetContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local WonderCardFillWidget = nil
	
	WonderCardFillWidget = MenuBuilder.BuildRegisteredType( "WonderCardFillWidget", {
		controllerIndex = f1_local1
	} )
	WonderCardFillWidget.id = "WonderCardFillWidget"
	WonderCardFillWidget:SetYRotation( -16, 0 )
	WonderCardFillWidget:SetZRotation( -3, 0 )
	WonderCardFillWidget:SetScale( -0.3, 0 )
	WonderCardFillWidget:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -95.4, _1080p * 20.6, _1080p * -111, _1080p * 561 )
	self:addElement( WonderCardFillWidget )
	self.WonderCardFillWidget = WonderCardFillWidget
	
	return self
end

MenuBuilder.registerType( "WonderCardFillWidgetContainer", WonderCardFillWidgetContainer )
LockTable( _M )
