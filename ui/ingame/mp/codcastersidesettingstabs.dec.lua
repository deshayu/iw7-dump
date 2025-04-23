local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CodcasterSideSettingsTabs( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "CodcasterSideSettingsTabs"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 62, _1080p * 438, 0, _1080p * 30 )
	self:addElement( Background )
	self.Background = Background
	
	local DisplayTab = nil
	
	DisplayTab = MenuBuilder.BuildRegisteredType( "SubMenuTab", {
		controllerIndex = f1_local1
	} )
	DisplayTab.id = "DisplayTab"
	DisplayTab:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 62, _1080p * 250, 0, _1080p * 30 )
	self:addElement( DisplayTab )
	self.DisplayTab = DisplayTab
	
	local LoadoutTab = nil
	
	LoadoutTab = MenuBuilder.BuildRegisteredType( "SubMenuTab", {
		controllerIndex = f1_local1
	} )
	LoadoutTab.id = "LoadoutTab"
	LoadoutTab:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 250, _1080p * 438, 0, _1080p * 30 )
	self:addElement( LoadoutTab )
	self.LoadoutTab = LoadoutTab
	
	local LeftBump = nil
	
	LeftBump = LUI.UIText.new()
	LeftBump.id = "LeftBump"
	LeftBump:setText( Engine.Localize( "MENU_NEW" ), 0 )
	LeftBump:SetFontSize( 19 * _1080p )
	LeftBump:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LeftBump:SetAlignment( LUI.Alignment.Left )
	LeftBump:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 10, _1080p * 42, _1080p * -8, _1080p * 11 )
	self:addElement( LeftBump )
	self.LeftBump = LeftBump
	
	local RightBump = nil
	
	RightBump = LUI.UIText.new()
	RightBump.id = "RightBump"
	RightBump:setText( Engine.Localize( "MENU_NEW" ), 0 )
	RightBump:SetFontSize( 20 * _1080p )
	RightBump:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RightBump:SetAlignment( LUI.Alignment.Left )
	RightBump:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 458, _1080p * 490, _1080p * -9, _1080p * 11 )
	self:addElement( RightBump )
	self.RightBump = RightBump
	
	return self
end

MenuBuilder.registerType( "CodcasterSideSettingsTabs", CodcasterSideSettingsTabs )
LockTable( _M )
