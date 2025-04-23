local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GreenDot( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "GreenDot"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.4, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local CenterPoint = nil
	
	CenterPoint = LUI.UIImage.new()
	CenterPoint.id = "CenterPoint"
	CenterPoint:SetRGBFromInt( 65280, 0 )
	CenterPoint:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2 )
	self:addElement( CenterPoint )
	self.CenterPoint = CenterPoint
	
	return self
end

MenuBuilder.registerType( "GreenDot", GreenDot )
LockTable( _M )
