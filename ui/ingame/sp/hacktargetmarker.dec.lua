local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HackTargetMarker( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 40 * _1080p, 0, 40 * _1080p )
	self.id = "HackTargetMarker"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CenterBorder = nil
	
	CenterBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	CenterBorder.id = "CenterBorder"
	CenterBorder:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 9, _1080p * -10, _1080p * 10, _1080p * -10 )
	self:addElement( CenterBorder )
	self.CenterBorder = CenterBorder
	
	local Brackets = nil
	
	Brackets = MenuBuilder.BuildRegisteredType( "GenericReticleBrackets", {
		controllerIndex = f1_local1
	} )
	Brackets.id = "Brackets"
	Brackets.BottomRightBracketHorzLine:SetLeft( _1080p * -10, 0 )
	Brackets.BottomRightBracketVertLine:SetTop( _1080p * -10, 0 )
	Brackets.BottomLeftBracketHorzLine:SetRight( _1080p * 10, 0 )
	Brackets.BottomLeftBracketVertLine:SetTop( _1080p * -10, 0 )
	Brackets.TopRightBracketHorzLine:SetLeft( _1080p * -10, 0 )
	Brackets.TopRightBracketVertLine:SetBottom( _1080p * 10, 0 )
	Brackets.TopLeftBracketHorzLine:SetRight( _1080p * 10, 0 )
	Brackets.TopLeftBracketVertLine:SetBottom( _1080p * 10, 0 )
	Brackets:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Brackets )
	self.Brackets = Brackets
	
	return self
end

MenuBuilder.registerType( "HackTargetMarker", HackTargetMarker )
LockTable( _M )
