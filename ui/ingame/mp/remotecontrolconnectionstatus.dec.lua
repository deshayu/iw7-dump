local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RemoteControlConnectionStatus( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 35 * _1080p )
	self.id = "RemoteControlConnectionStatus"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.4, 0 )
	Background:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -500, _1080p * 500, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local MessageText = nil
	
	MessageText = LUI.UIStyledText.new()
	MessageText.id = "MessageText"
	MessageText:setText( "OPENING CONNECTION", 0 )
	MessageText:SetFontSize( 38 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetDecodeLetterLength( 30 )
	MessageText:SetDecodeMaxRandChars( 3 )
	MessageText:SetDecodeUpdatesPerLetter( 3 )
	MessageText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -500, _1080p * 500, _1080p * -19, _1080p * 19 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	return self
end

MenuBuilder.registerType( "RemoteControlConnectionStatus", RemoteControlConnectionStatus )
LockTable( _M )
