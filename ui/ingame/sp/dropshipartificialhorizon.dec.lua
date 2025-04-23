local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DropshipArtificialHorizon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1024 * _1080p, 0, 64 * _1080p )
	self.id = "DropshipArtificialHorizon"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HorizonBar = nil
	
	HorizonBar = LUI.UIImage.new()
	HorizonBar.id = "HorizonBar"
	HorizonBar:setImage( RegisterMaterial( "dropship_hud_horizontal_bar_1" ), 0 )
	HorizonBar:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -32, _1080p * 32 )
	self:addElement( HorizonBar )
	self.HorizonBar = HorizonBar
	
	local TechyDigitsTop = nil
	
	TechyDigitsTop = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 2,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	TechyDigitsTop.id = "TechyDigitsTop"
	TechyDigitsTop:SetRGBFromTable( SWATCHES.dropship.overlay, 0 )
	TechyDigitsTop:SetFontSize( 16 * _1080p )
	TechyDigitsTop:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	TechyDigitsTop:SetAlignment( LUI.Alignment.Center )
	TechyDigitsTop:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -127, _1080p * -107, _1080p * -5, _1080p * 11 )
	self:addElement( TechyDigitsTop )
	self.TechyDigitsTop = TechyDigitsTop
	
	local TechyDigitsBottom = nil
	
	TechyDigitsBottom = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 2,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	TechyDigitsBottom.id = "TechyDigitsBottom"
	TechyDigitsBottom:SetRGBFromTable( SWATCHES.dropship.overlay, 0 )
	TechyDigitsBottom:SetFontSize( 16 * _1080p )
	TechyDigitsBottom:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	TechyDigitsBottom:SetAlignment( LUI.Alignment.Center )
	TechyDigitsBottom:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 105, _1080p * 125, _1080p * 55, _1080p * 71 )
	self:addElement( TechyDigitsBottom )
	self.TechyDigitsBottom = TechyDigitsBottom
	
	return self
end

MenuBuilder.registerType( "DropshipArtificialHorizon", DropshipArtificialHorizon )
LockTable( _M )
