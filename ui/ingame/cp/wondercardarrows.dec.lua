local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WonderCardArrows( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 89 * _1080p, 0, 183 * _1080p )
	self.id = "WonderCardArrows"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local rightArrow = nil
	
	rightArrow = LUI.UIImage.new()
	rightArrow.id = "rightArrow"
	rightArrow:SetZRotation( 180, 0 )
	rightArrow:SetScale( -0.72, 0 )
	rightArrow:setImage( RegisterMaterial( "zm_wc_side_directional" ), 0 )
	rightArrow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2.86, _1080p * 134.08, _1080p * 25.92, _1080p * 153.92 )
	self:addElement( rightArrow )
	self.rightArrow = rightArrow
	
	local downArrow = nil
	
	downArrow = LUI.UIImage.new()
	downArrow.id = "downArrow"
	downArrow:SetZRotation( 90, 0 )
	downArrow:SetScale( -0.72, 0 )
	downArrow:setImage( RegisterMaterial( "zm_wc_side_directional" ), 0 )
	downArrow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -46.14, _1080p * 85.08, _1080p * 97.08, _1080p * 225.08 )
	self:addElement( downArrow )
	self.downArrow = downArrow
	
	local upArrow = nil
	
	upArrow = LUI.UIImage.new()
	upArrow.id = "upArrow"
	upArrow:SetZRotation( -90, 0 )
	upArrow:SetScale( -0.72, 0 )
	upArrow:setImage( RegisterMaterial( "zm_wc_side_directional" ), 0 )
	upArrow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -46.14, _1080p * 85.08, _1080p * -43.16, _1080p * 84.84 )
	self:addElement( upArrow )
	self.upArrow = upArrow
	
	return self
end

MenuBuilder.registerType( "WonderCardArrows", WonderCardArrows )
LockTable( _M )
