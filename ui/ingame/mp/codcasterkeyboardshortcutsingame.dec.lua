local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CodcasterKeyboardShortcutsInGame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CodcasterKeyboardShortcutsInGame"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.genericMenu.popupBackground, 0 )
	Background:SetAlpha( 0.85, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 170, _1080p * 905 )
	self:addElement( Background )
	self.Background = Background
	
	local CodcasterKeyboardShortcuts = nil
	
	CodcasterKeyboardShortcuts = MenuBuilder.BuildRegisteredType( "CodcasterKeyboardShortcuts", {
		controllerIndex = f1_local1
	} )
	CodcasterKeyboardShortcuts.id = "CodcasterKeyboardShortcuts"
	CodcasterKeyboardShortcuts:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 339, _1080p * 1612, _1080p * 261.5, _1080p * 933.5 )
	self:addElement( CodcasterKeyboardShortcuts )
	self.CodcasterKeyboardShortcuts = CodcasterKeyboardShortcuts
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f1_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "CODCASTER_KEYBOARD_SHORTCUTS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( "", 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 295, _1080p * 1255, _1080p * 195, _1080p * 275 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	return self
end

MenuBuilder.registerType( "CodcasterKeyboardShortcutsInGame", CodcasterKeyboardShortcutsInGame )
LockTable( _M )
