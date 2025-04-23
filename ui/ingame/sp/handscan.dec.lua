local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HandScan( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 500 * _1080p )
	self.id = "HandScan"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TalkToTheHand = nil
	
	TalkToTheHand = LUI.UIImage.new()
	TalkToTheHand.id = "TalkToTheHand"
	TalkToTheHand:setImage( RegisterMaterial( "hud_placeholder_hand" ), 0 )
	self:addElement( TalkToTheHand )
	self.TalkToTheHand = TalkToTheHand
	
	return self
end

MenuBuilder.registerType( "HandScan", HandScan )
LockTable( _M )
