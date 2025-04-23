local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Scanline( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 512 * _1080p )
	self.id = "Scanline"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Scanline = nil
	
	Scanline = LUI.UIImage.new()
	Scanline.id = "Scanline"
	Scanline:SetRGBFromInt( 1630931, 0 )
	Scanline:setImage( RegisterMaterial( "hud_scanline_thick" ), 0 )
	self:addElement( Scanline )
	self.Scanline = Scanline
	
	return self
end

MenuBuilder.registerType( "Scanline", Scanline )
LockTable( _M )
