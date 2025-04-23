local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ghostArcadeGameCircle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ghostArcadeGameCircle"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local icon = nil
	
	icon = LUI.UIImage.new()
	icon.id = "icon"
	icon:SetScale( -0.23, 0 )
	icon:setImage( RegisterMaterial( "zm_hud_pixel_skull" ), 0 )
	icon:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 10, _1080p * -10, _1080p * 14, _1080p * -6 )
	self:addElement( icon )
	self.icon = icon
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetRGBFromInt( 16250871, 0 )
	Frame:setImage( RegisterMaterial( "cp_zmb_ghost_skull_slot_frame" ), 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	return self
end

MenuBuilder.registerType( "ghostArcadeGameCircle", ghostArcadeGameCircle )
LockTable( _M )
