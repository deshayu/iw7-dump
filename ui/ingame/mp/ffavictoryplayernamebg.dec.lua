local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FFAVictoryPlayerNameBG( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 80 * _1080p )
	self.id = "FFAVictoryPlayerNameBG"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BlurCopy = nil
	
	BlurCopy = LUI.UIBlur.new()
	BlurCopy.id = "BlurCopy"
	BlurCopy:SetUseAA( true )
	BlurCopy:SetBlurStrength( 2.75, 0 )
	BlurCopy:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 0.5, 0 )
	self:addElement( BlurCopy )
	self.BlurCopy = BlurCopy
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.75, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:SetRGBFromInt( 8421504, 0 )
	Divider:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 120, _1080p * 121, 0, 0 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local BottomBar = nil
	
	BottomBar = LUI.UIImage.new()
	BottomBar.id = "BottomBar"
	BottomBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -1, 0 )
	self:addElement( BottomBar )
	self.BottomBar = BottomBar
	
	local TopBar = nil
	
	TopBar = LUI.UIImage.new()
	TopBar.id = "TopBar"
	TopBar:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 1 )
	self:addElement( TopBar )
	self.TopBar = TopBar
	
	local StubBottom = nil
	
	StubBottom = LUI.UIImage.new()
	StubBottom.id = "StubBottom"
	StubBottom:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -16, 0, _1080p * -4, 0 )
	self:addElement( StubBottom )
	self.StubBottom = StubBottom
	
	local StubTop = nil
	
	StubTop = LUI.UIImage.new()
	StubTop.id = "StubTop"
	StubTop:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -16, 0, 0, _1080p * 4 )
	self:addElement( StubTop )
	self.StubTop = StubTop
	
	return self
end

MenuBuilder.registerType( "FFAVictoryPlayerNameBG", FFAVictoryPlayerNameBG )
LockTable( _M )
