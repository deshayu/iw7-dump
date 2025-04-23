local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ObjectiveProgressBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 275 * _1080p, 0, 11 * _1080p )
	self.id = "ObjectiveProgressBar"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetAlpha( 0.1, 0 )
	Border:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2, _1080p * 277, _1080p * -1, _1080p * 12 )
	self:addElement( Border )
	self.Border = Border
	
	local FillBG = nil
	
	FillBG = LUI.UIImage.new()
	FillBG.id = "FillBG"
	FillBG:SetRGBFromInt( 2697513, 0 )
	FillBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1, _1080p * 276, 0, _1080p * 11 )
	self:addElement( FillBG )
	self.FillBG = FillBG
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetRGBFromInt( 16772096, 0 )
	Fill:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1, _1080p * -1, 0, _1080p * 10.5 )
	self:addElement( Fill )
	self.Fill = Fill
	
	return self
end

MenuBuilder.registerType( "ObjectiveProgressBar", ObjectiveProgressBar )
LockTable( _M )
