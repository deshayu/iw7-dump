local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AccentLineWithNodes( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 4 * _1080p )
	self.id = "AccentLineWithNodes"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local NodeLeft = nil
	
	NodeLeft = LUI.UIImage.new()
	NodeLeft.id = "NodeLeft"
	NodeLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 4, 0, 0 )
	self:addElement( NodeLeft )
	self.NodeLeft = NodeLeft
	
	local NodeRight = nil
	
	NodeRight = LUI.UIImage.new()
	NodeRight.id = "NodeRight"
	NodeRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -4, 0, 0, 0 )
	self:addElement( NodeRight )
	self.NodeRight = NodeRight
	
	local Line = nil
	
	Line = LUI.UIImage.new()
	Line.id = "Line"
	Line:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 4, _1080p * -4, _1080p * -0.5, _1080p * 0.5 )
	self:addElement( Line )
	self.Line = Line
	
	return self
end

MenuBuilder.registerType( "AccentLineWithNodes", AccentLineWithNodes )
LockTable( _M )
