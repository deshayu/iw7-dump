local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalInteriorMainAltimeterBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 128 * _1080p )
	self.id = "JackalInteriorMainAltimeterBase"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BottomText = nil
	
	BottomText = LUI.UIImage.new()
	BottomText.id = "BottomText"
	BottomText:setImage( RegisterMaterial( "hud_jackal_interior_main_bot_lt" ), 0 )
	self:addElement( BottomText )
	self.BottomText = BottomText
	
	return self
end

MenuBuilder.registerType( "JackalInteriorMainAltimeterBase", JackalInteriorMainAltimeterBase )
LockTable( _M )
