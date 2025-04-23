local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissionPopupAuthorize( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 45 * _1080p )
	self.id = "MissionPopupAuthorize"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 3355443, 0 )
	Background:setImage( RegisterMaterial( "ops_map_scr_gradient_1" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:SetRGBFromTable( SWATCHES.OpsMap.deploy, 0 )
	Text:setText( ToUpperCase( Engine.Localize( "OPS_MAP_PRESS_TO_DEPLOY" ) ), 0 )
	Text:SetFontSize( 32 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -16, _1080p * 16 )
	self:addElement( Text )
	self.Text = Text
	
	return self
end

MenuBuilder.registerType( "MissionPopupAuthorize", MissionPopupAuthorize )
LockTable( _M )
