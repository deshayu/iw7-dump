local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReviveBarHeader( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 150 * _1080p, 0, 32 * _1080p )
	self.id = "ReviveBarHeader"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "ReviveBarHeaderBG", {
		controllerIndex = f1_local1
	} )
	Background.id = "Background"
	Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 32 )
	self:addElement( Background )
	self.Background = Background
	
	local MessageText = nil
	
	MessageText = LUI.UIStyledText.new()
	MessageText.id = "MessageText"
	MessageText:setText( ToUpperCase( "" ), 0 )
	MessageText:SetFontSize( 16 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	MessageText:SetAlignment( LUI.Alignment.Left )
	MessageText:SetOptOutRightToLeftAlignmentFlip( true )
	MessageText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 142, _1080p * 6, _1080p * 22 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	return self
end

MenuBuilder.registerType( "ReviveBarHeader", ReviveBarHeader )
LockTable( _M )
