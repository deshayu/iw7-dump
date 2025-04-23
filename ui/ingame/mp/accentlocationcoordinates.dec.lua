local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AccentLocationCoordinates( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 230 * _1080p, 0, 75 * _1080p )
	self.id = "AccentLocationCoordinates"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Frame.id = "Frame"
	self:addElement( Frame )
	self.Frame = Frame
	
	local TechyDigitsBottomA = nil
	
	TechyDigitsBottomA = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 6,
		minValue = 0,
		maxValue = 100000000,
		longWait = 500,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	TechyDigitsBottomA.id = "TechyDigitsBottomA"
	TechyDigitsBottomA:SetFontSize( 24 * _1080p )
	TechyDigitsBottomA:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TechyDigitsBottomA:SetAlignment( LUI.Alignment.Center )
	TechyDigitsBottomA:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 10, _1080p * 110, _1080p * -34, _1080p * -10 )
	self:addElement( TechyDigitsBottomA )
	self.TechyDigitsBottomA = TechyDigitsBottomA
	
	local TechyDigitsBottomB = nil
	
	TechyDigitsBottomB = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 6,
		minValue = 0,
		maxValue = 100000000,
		longWait = 600,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	TechyDigitsBottomB.id = "TechyDigitsBottomB"
	TechyDigitsBottomB:SetFontSize( 24 * _1080p )
	TechyDigitsBottomB:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TechyDigitsBottomB:SetAlignment( LUI.Alignment.Center )
	TechyDigitsBottomB:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -110, _1080p * -10, _1080p * -34, _1080p * -10 )
	self:addElement( TechyDigitsBottomB )
	self.TechyDigitsBottomB = TechyDigitsBottomB
	
	local TechyDigitsTopA = nil
	
	TechyDigitsTopA = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 6,
		minValue = 0,
		maxValue = 100000000,
		longWait = 300,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	TechyDigitsTopA.id = "TechyDigitsTopA"
	TechyDigitsTopA:SetFontSize( 24 * _1080p )
	TechyDigitsTopA:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TechyDigitsTopA:SetAlignment( LUI.Alignment.Center )
	TechyDigitsTopA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 110, _1080p * 11, _1080p * 35 )
	self:addElement( TechyDigitsTopA )
	self.TechyDigitsTopA = TechyDigitsTopA
	
	local TechyDigitsTopB = nil
	
	TechyDigitsTopB = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 6,
		minValue = 0,
		maxValue = 100000000,
		longWait = 400,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	TechyDigitsTopB.id = "TechyDigitsTopB"
	TechyDigitsTopB:SetFontSize( 24 * _1080p )
	TechyDigitsTopB:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TechyDigitsTopB:SetAlignment( LUI.Alignment.Center )
	TechyDigitsTopB:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -110, _1080p * -10, _1080p * 11, _1080p * 35 )
	self:addElement( TechyDigitsTopB )
	self.TechyDigitsTopB = TechyDigitsTopB
	
	return self
end

MenuBuilder.registerType( "AccentLocationCoordinates", AccentLocationCoordinates )
LockTable( _M )
