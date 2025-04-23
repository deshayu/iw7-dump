local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageRightToLeft( GetCurrentLanguage() ) then
		f1_arg0.ButtonText:SetAnchorsAndPosition( 0.1, 1, 0.5, 0.5, _1080p * 35, _1080p * 192, _1080p * -9, _1080p * 7 )
	end
end

function CodcasterToolbarButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 29 * _1080p )
	self.id = "CodcasterToolbarButton"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local ButtonIcon = nil
	
	ButtonIcon = LUI.UIText.new()
	ButtonIcon.id = "ButtonIcon"
	ButtonIcon:setText( Engine.Localize( "MENU_NEW" ), 0 )
	ButtonIcon:SetFontSize( 20 * _1080p )
	ButtonIcon:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ButtonIcon:SetAlignment( LUI.Alignment.Left )
	ButtonIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 32, _1080p * -11, _1080p * 9 )
	self:addElement( ButtonIcon )
	self.ButtonIcon = ButtonIcon
	
	local ButtonText = nil
	
	ButtonText = LUI.UIText.new()
	ButtonText.id = "ButtonText"
	ButtonText:setText( Engine.Localize( "MENU_NEW" ), 0 )
	ButtonText:SetFontSize( 16 * _1080p )
	ButtonText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ButtonText:SetAlignment( LUI.Alignment.Left )
	ButtonText:SetOptOutRightToLeftAlignmentFlip( true )
	ButtonText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 35, _1080p * 192, _1080p * -9, _1080p * 7 )
	self:addElement( ButtonText )
	self.ButtonText = ButtonText
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "CodcasterToolbarButton", CodcasterToolbarButton )
LockTable( _M )
