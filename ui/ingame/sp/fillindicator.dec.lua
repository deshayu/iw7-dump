local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FillIndicator( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 19 * _1080p )
	self.id = "FillIndicator"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ammoBarNode = nil
	
	ammoBarNode = LUI.UIImage.new()
	ammoBarNode.id = "ammoBarNode"
	ammoBarNode:SetUseAA( true )
	ammoBarNode:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 6, _1080p * 10, _1080p * -5, 0 )
	self:addElement( ammoBarNode )
	self.ammoBarNode = ammoBarNode
	
	local arrow = nil
	
	arrow = LUI.UIImage.new()
	arrow.id = "arrow"
	arrow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	arrow:SetUseAA( true )
	arrow:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 16, 0, _1080p * 16 )
	self:addElement( arrow )
	self.arrow = arrow
	
	return self
end

MenuBuilder.registerType( "FillIndicator", FillIndicator )
LockTable( _M )
