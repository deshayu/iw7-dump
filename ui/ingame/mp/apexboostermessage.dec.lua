local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ApexBoosterMessage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 40 * _1080p )
	self.id = "ApexBoosterMessage"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	Background:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( Background )
	self.Background = Background
	
	local MessageText = nil
	
	MessageText = LUI.UIText.new()
	MessageText.id = "MessageText"
	MessageText:SetRGBFromTable( SWATCHES.apex.activeText, 0 )
	MessageText:setText( ToUpperCase( Engine.Localize( "JACKAL_BOOSTERS_ENGAGED" ) ), 0 )
	MessageText:SetFontSize( 26 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -13, _1080p * 13 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	return self
end

MenuBuilder.registerType( "ApexBoosterMessage", ApexBoosterMessage )
LockTable( _M )
