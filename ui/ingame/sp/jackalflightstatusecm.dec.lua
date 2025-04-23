local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalFlightStatusECM( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 56 * _1080p, 0, 26 * _1080p )
	self.id = "JackalFlightStatusECM"
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
	Frame:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Label = nil
	
	Label = LUI.UIText.new()
	Label.id = "Label"
	Label:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	Label:setText( "ECM", 0 )
	Label:SetFontSize( 20 * _1080p )
	Label:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label:SetAlignment( LUI.Alignment.Center )
	Label:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -10, _1080p * 10 )
	self:addElement( Label )
	self.Label = Label
	
	return self
end

MenuBuilder.registerType( "JackalFlightStatusECM", JackalFlightStatusECM )
LockTable( _M )
