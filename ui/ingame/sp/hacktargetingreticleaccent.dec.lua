local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HackTargetingReticleAccent( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 200 * _1080p )
	self.id = "HackTargetingReticleAccent"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local outerline1 = nil
	
	outerline1 = LUI.UIImage.new()
	outerline1.id = "outerline1"
	outerline1:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -1, 0, _1080p * 1, _1080p * -1 )
	self:addElement( outerline1 )
	self.outerline1 = outerline1
	
	local outerline1Copy0 = nil
	
	outerline1Copy0 = LUI.UIImage.new()
	outerline1Copy0.id = "outerline1Copy0"
	outerline1Copy0:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -25, 0, 0, _1080p * 1 )
	self:addElement( outerline1Copy0 )
	self.outerline1Copy0 = outerline1Copy0
	
	local outerline1Copy1 = nil
	
	outerline1Copy1 = LUI.UIImage.new()
	outerline1Copy1.id = "outerline1Copy1"
	outerline1Copy1:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -25, 0, _1080p * -1, 0 )
	self:addElement( outerline1Copy1 )
	self.outerline1Copy1 = outerline1Copy1
	
	local outerline1Copy2 = nil
	
	outerline1Copy2 = LUI.UIImage.new()
	outerline1Copy2.id = "outerline1Copy2"
	outerline1Copy2:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 1, _1080p * 1, _1080p * -1 )
	self:addElement( outerline1Copy2 )
	self.outerline1Copy2 = outerline1Copy2
	
	local outerline1Copy3 = nil
	
	outerline1Copy3 = LUI.UIImage.new()
	outerline1Copy3.id = "outerline1Copy3"
	outerline1Copy3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 25, 0, _1080p * 1 )
	self:addElement( outerline1Copy3 )
	self.outerline1Copy3 = outerline1Copy3
	
	local outerline1Copy4 = nil
	
	outerline1Copy4 = LUI.UIImage.new()
	outerline1Copy4.id = "outerline1Copy4"
	outerline1Copy4:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 25, _1080p * -1, 0 )
	self:addElement( outerline1Copy4 )
	self.outerline1Copy4 = outerline1Copy4
	
	local Border0 = nil
	
	Border0 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border0.id = "Border0"
	Border0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40, _1080p * 50, _1080p * 60, _1080p * 70 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Border0Copy0 = nil
	
	Border0Copy0 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border0Copy0.id = "Border0Copy0"
	Border0Copy0:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 40, _1080p * 50, _1080p * -70, _1080p * -60 )
	self:addElement( Border0Copy0 )
	self.Border0Copy0 = Border0Copy0
	
	local Border0Copy1 = nil
	
	Border0Copy1 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border0Copy1.id = "Border0Copy1"
	Border0Copy1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -50, _1080p * -40, _1080p * 60, _1080p * 70 )
	self:addElement( Border0Copy1 )
	self.Border0Copy1 = Border0Copy1
	
	local Border0Copy2 = nil
	
	Border0Copy2 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border0Copy2.id = "Border0Copy2"
	Border0Copy2:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -50, _1080p * -40, _1080p * -70, _1080p * -60 )
	self:addElement( Border0Copy2 )
	self.Border0Copy2 = Border0Copy2
	
	local TechyDigits = nil
	
	TechyDigits = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 6,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	TechyDigits.id = "TechyDigits"
	TechyDigits:SetAlpha( 0.5, 0 )
	TechyDigits:SetFontSize( 12 * _1080p )
	TechyDigits:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TechyDigits:SetAlignment( LUI.Alignment.Right )
	TechyDigits:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -55, _1080p * -10, _1080p * -22, _1080p * -10 )
	self:addElement( TechyDigits )
	self.TechyDigits = TechyDigits
	
	return self
end

MenuBuilder.registerType( "HackTargetingReticleAccent", HackTargetingReticleAccent )
LockTable( _M )
