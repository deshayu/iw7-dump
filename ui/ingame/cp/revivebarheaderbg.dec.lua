local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReviveBarHeaderBG( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 24 * _1080p, 0, 32 * _1080p )
	self.id = "ReviveBarHeaderBG"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Left = nil
	
	Left = LUI.UIImage.new()
	Left.id = "Left"
	Left:setImage( RegisterMaterial( "zm_revive_bar_header_left_cap" ), 0 )
	Left:SetUseAA( true )
	Left:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 8, 0, 0 )
	self:addElement( Left )
	self.Left = Left
	
	local Center = nil
	
	Center = LUI.UIImage.new()
	Center.id = "Center"
	Center:setImage( RegisterMaterial( "zm_revive_bar_header_center" ), 0 )
	Center:SetUseAA( true )
	Center:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 8, _1080p * -8, 0, 0 )
	self:addElement( Center )
	self.Center = Center
	
	local Right = nil
	
	Right = LUI.UIImage.new()
	Right.id = "Right"
	Right:setImage( RegisterMaterial( "zm_revive_bar_header_right_cap" ), 0 )
	Right:SetUseAA( true )
	Right:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -8, 0, 0, 0 )
	self:addElement( Right )
	self.Right = Right
	
	return self
end

MenuBuilder.registerType( "ReviveBarHeaderBG", ReviveBarHeaderBG )
LockTable( _M )
