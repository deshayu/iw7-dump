local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function IntelProgressBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 4 * _1080p )
	self.id = "IntelProgressBar"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.fieldOrders.fillTint, 0 )
	Background:SetAlpha( 0.3, 0 )
	Background:SetUseAA( true )
	self:addElement( Background )
	self.Background = Background
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetUseAA( true )
	self:addElement( Fill )
	self.Fill = Fill
	
	return self
end

MenuBuilder.registerType( "IntelProgressBar", IntelProgressBar )
LockTable( _M )
