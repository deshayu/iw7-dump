local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MatchStatusScoreBarArrow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 36 * _1080p )
	self.id = "MatchStatusScoreBarArrow"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local arrowNode = nil
	
	arrowNode = LUI.UIImage.new()
	arrowNode.id = "arrowNode"
	arrowNode:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	arrowNode:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -10, _1080p * -5, _1080p * -2.5, _1080p * 2.5 )
	self:addElement( arrowNode )
	self.arrowNode = arrowNode
	
	local arrow = nil
	
	arrow = LUI.UIImage.new()
	arrow.id = "arrow"
	arrow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	arrow:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -16, 0, 0, _1080p * 16 )
	self:addElement( arrow )
	self.arrow = arrow
	
	local arrow0 = nil
	
	arrow0 = LUI.UIImage.new()
	arrow0.id = "arrow0"
	arrow0:SetZRotation( 180, 0 )
	arrow0:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	arrow0:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -16, 0, _1080p * -16, 0 )
	self:addElement( arrow0 )
	self.arrow0 = arrow0
	
	return self
end

MenuBuilder.registerType( "MatchStatusScoreBarArrow", MatchStatusScoreBarArrow )
LockTable( _M )
