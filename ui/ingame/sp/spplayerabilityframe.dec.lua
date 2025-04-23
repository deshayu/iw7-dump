local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SPPlayerAbilityFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "SPPlayerAbilityFrame"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.HUD.secondary, 0 )
	Background:SetAlpha( 0.2, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	Frame:setImage( RegisterMaterial( "hud_ability_frame" ), 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	return self
end

MenuBuilder.registerType( "SPPlayerAbilityFrame", SPPlayerAbilityFrame )
LockTable( _M )
