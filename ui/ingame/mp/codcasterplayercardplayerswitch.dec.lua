local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.LeftButtonIcon:setText( Engine.Localize( "LUA_MENU_PAD_LEFT_SHOULDER_BUTTON" ) )
	f1_arg0.LeftButtonIcon:SetLeft( 0 )
	f1_arg0.LeftButtonIcon:SetRight( 27 )
	f1_arg0.Text:setText( Engine.Localize( "CODCASTER_SPECTATING" ) )
	local f1_local0, f1_local1, f1_local2, f1_local3 = GetTextDimensions( f1_arg0.Text:getText(), f1_arg0.Text:GetCurrentFont(), 20 * _1080p )
	f1_arg0.Text:SetLeft( 32 )
	f1_arg0.Text:SetRight( 32 + f1_local2 )
	f1_arg0.RightButtonIcon:setText( Engine.Localize( "LUA_MENU_PAD_RIGHT_SHOULDER_BUTTON" ) )
	f1_arg0.RightButtonIcon:SetLeft( 37 + f1_local2 )
end

function CodcasterPlayerCardPlayerSwitch( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 34 * _1080p )
	self.id = "CodcasterPlayerCardPlayerSwitch"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local LeftButtonIcon = nil
	
	LeftButtonIcon = LUI.UIText.new()
	LeftButtonIcon.id = "LeftButtonIcon"
	LeftButtonIcon:setText( Engine.Localize( "MENU_NEW" ), 0 )
	LeftButtonIcon:SetFontSize( 20 * _1080p )
	LeftButtonIcon:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LeftButtonIcon:SetAlignment( LUI.Alignment.Left )
	LeftButtonIcon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 42, _1080p * 4.5, _1080p * 24.5 )
	self:addElement( LeftButtonIcon )
	self.LeftButtonIcon = LeftButtonIcon
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Text:SetFontSize( 20 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 42, _1080p * 138.5, _1080p * 4.5, _1080p * 24.5 )
	self:addElement( Text )
	self.Text = Text
	
	local RightButtonIcon = nil
	
	RightButtonIcon = LUI.UIText.new()
	RightButtonIcon.id = "RightButtonIcon"
	RightButtonIcon:setText( Engine.Localize( "MENU_NEW" ), 0 )
	RightButtonIcon:SetFontSize( 20 * _1080p )
	RightButtonIcon:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RightButtonIcon:SetAlignment( LUI.Alignment.Left )
	RightButtonIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 138.5, _1080p * 180.5, _1080p * 4.5, _1080p * 24.5 )
	self:addElement( RightButtonIcon )
	self.RightButtonIcon = RightButtonIcon
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "CodcasterPlayerCardPlayerSwitch", CodcasterPlayerCardPlayerSwitch )
LockTable( _M )
