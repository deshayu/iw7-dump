local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CaptainsComputerMenuTitle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 40 * _1080p )
	self.id = "CaptainsComputerMenuTitle"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 5526870, 0 )
	Background:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 21, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuTitle = nil
	
	MenuTitle = LUI.UIText.new()
	MenuTitle.id = "MenuTitle"
	MenuTitle:SetRGBFromInt( 12303291, 0 )
	MenuTitle:setText( "HOME", 0 )
	MenuTitle:SetFontSize( 32 * _1080p )
	MenuTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MenuTitle:SetAlignment( LUI.Alignment.Left )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32, _1080p * 500, _1080p * 4, _1080p * 36 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local BackgroundCopy0 = nil
	
	BackgroundCopy0 = LUI.UIImage.new()
	BackgroundCopy0.id = "BackgroundCopy0"
	BackgroundCopy0:SetRGBFromInt( 7303280, 0 )
	BackgroundCopy0:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	BackgroundCopy0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -479, 0, 0 )
	self:addElement( BackgroundCopy0 )
	self.BackgroundCopy0 = BackgroundCopy0
	
	return self
end

MenuBuilder.registerType( "CaptainsComputerMenuTitle", CaptainsComputerMenuTitle )
LockTable( _M )
