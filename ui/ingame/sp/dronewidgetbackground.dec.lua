local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DroneWidgetBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 270 * _1080p, 0, 88 * _1080p )
	self.id = "DroneWidgetBackground"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BackgroundMain = nil
	
	BackgroundMain = LUI.UIImage.new()
	BackgroundMain.id = "BackgroundMain"
	BackgroundMain:SetRGBFromInt( 0, 0 )
	BackgroundMain:SetAlpha( 0.15, 0 )
	BackgroundMain:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 2.5, _1080p * -2.5, _1080p * 2, _1080p * -2 )
	self:addElement( BackgroundMain )
	self.BackgroundMain = BackgroundMain
	
	local BackgroundSquare = nil
	
	BackgroundSquare = LUI.UIImage.new()
	BackgroundSquare.id = "BackgroundSquare"
	BackgroundSquare:SetRGBFromInt( 12641249, 0 )
	BackgroundSquare:SetAlpha( 0.5, 0 )
	BackgroundSquare:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 5, _1080p * -4, 0 )
	self:addElement( BackgroundSquare )
	self.BackgroundSquare = BackgroundSquare
	
	local BackgroundSquareCopy0 = nil
	
	BackgroundSquareCopy0 = LUI.UIImage.new()
	BackgroundSquareCopy0.id = "BackgroundSquareCopy0"
	BackgroundSquareCopy0:SetRGBFromInt( 12641249, 0 )
	BackgroundSquareCopy0:SetAlpha( 0.5, 0 )
	BackgroundSquareCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 5, 0, _1080p * 4 )
	self:addElement( BackgroundSquareCopy0 )
	self.BackgroundSquareCopy0 = BackgroundSquareCopy0
	
	local BackgroundSquareCopy1 = nil
	
	BackgroundSquareCopy1 = LUI.UIImage.new()
	BackgroundSquareCopy1.id = "BackgroundSquareCopy1"
	BackgroundSquareCopy1:SetRGBFromInt( 12641249, 0 )
	BackgroundSquareCopy1:SetAlpha( 0.5, 0 )
	BackgroundSquareCopy1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -5, 0, 0, _1080p * 4 )
	self:addElement( BackgroundSquareCopy1 )
	self.BackgroundSquareCopy1 = BackgroundSquareCopy1
	
	local BackgroundSquareCopy2 = nil
	
	BackgroundSquareCopy2 = LUI.UIImage.new()
	BackgroundSquareCopy2.id = "BackgroundSquareCopy2"
	BackgroundSquareCopy2:SetRGBFromInt( 12641249, 0 )
	BackgroundSquareCopy2:SetAlpha( 0.5, 0 )
	BackgroundSquareCopy2:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -5, 0, _1080p * -4, 0 )
	self:addElement( BackgroundSquareCopy2 )
	self.BackgroundSquareCopy2 = BackgroundSquareCopy2
	
	local BackgroundLineTop = nil
	
	BackgroundLineTop = LUI.UIImage.new()
	BackgroundLineTop.id = "BackgroundLineTop"
	BackgroundLineTop:SetRGBFromInt( 12641249, 0 )
	BackgroundLineTop:SetAlpha( 0.5, 0 )
	BackgroundLineTop:SetUseAA( true )
	BackgroundLineTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 2, _1080p * 3 )
	self:addElement( BackgroundLineTop )
	self.BackgroundLineTop = BackgroundLineTop
	
	local BackgroundLineBot = nil
	
	BackgroundLineBot = LUI.UIImage.new()
	BackgroundLineBot.id = "BackgroundLineBot"
	BackgroundLineBot:SetRGBFromInt( 12641249, 0 )
	BackgroundLineBot:SetAlpha( 0.5, 0 )
	BackgroundLineBot:SetUseAA( true )
	BackgroundLineBot:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -3, _1080p * -2 )
	self:addElement( BackgroundLineBot )
	self.BackgroundLineBot = BackgroundLineBot
	
	return self
end

MenuBuilder.registerType( "DroneWidgetBackground", DroneWidgetBackground )
LockTable( _M )
