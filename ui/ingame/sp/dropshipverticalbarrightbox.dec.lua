local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DropshipVerticalBarRightBox( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 54 * _1080p )
	self.id = "DropshipVerticalBarRightBox"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "dropship_hud_vertical_bar_box_1" ), 0 )
	Background:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * -64, _1080p * -32, _1080p * 32 )
	self:addElement( Background )
	self.Background = Background
	
	local Numbers = nil
	
	Numbers = LUI.UIText.new()
	Numbers.id = "Numbers"
	Numbers:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	Numbers:setText( "---", 0 )
	Numbers:SetFontSize( 24 * _1080p )
	Numbers:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Numbers:SetAlignment( LUI.Alignment.Center )
	Numbers:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -55, 0, _1080p * -12, _1080p * 12 )
	self:addElement( Numbers )
	self.Numbers = Numbers
	
	return self
end

MenuBuilder.registerType( "DropshipVerticalBarRightBox", DropshipVerticalBarRightBox )
LockTable( _M )
