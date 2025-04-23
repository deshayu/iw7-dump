local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WonderCardContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 277 * _1080p, 0, 436 * _1080p )
	self.id = "WonderCardContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local FateCardWidget = nil
	
	FateCardWidget = MenuBuilder.BuildRegisteredType( "FateCardWidget", {
		controllerIndex = f1_local1
	} )
	FateCardWidget.id = "FateCardWidget"
	FateCardWidget:SetYRotation( -16, 0 )
	FateCardWidget:SetZRotation( -3, 0 )
	FateCardWidget:SetScale( 0.25, 0 )
	FateCardWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3.63, _1080p * 222.63, _1080p * -25.39, _1080p * 258.61 )
	self:addElement( FateCardWidget )
	self.FateCardWidget = FateCardWidget
	
	return self
end

MenuBuilder.registerType( "WonderCardContainer", WonderCardContainer )
LockTable( _M )
