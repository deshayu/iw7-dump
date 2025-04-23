local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CodCasterLoadoutItemName( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 50 * _1080p )
	self.id = "CodCasterLoadoutItemName"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Arrow = nil
	
	Arrow = LUI.UIImage.new()
	Arrow.id = "Arrow"
	Arrow:SetRGBFromInt( 16769792, 0 )
	Arrow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	Arrow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -10, _1080p * 6, _1080p * 34, _1080p * 50 )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Text:SetFontSize( 30 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:setTextStyle( CoD.TextStyle.Shadowed )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -150, _1080p * 150, _1080p * 3, _1080p * 33 )
	self:addElement( Text )
	self.Text = Text
	
	return self
end

MenuBuilder.registerType( "CodCasterLoadoutItemName", CodCasterLoadoutItemName )
LockTable( _M )
