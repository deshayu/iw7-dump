local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AfterLifeGradientBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1200 * _1080p, 0, 90 * _1080p )
	self.id = "AfterLifeGradientBackground"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LeftSide = nil
	
	LeftSide = LUI.UIImage.new()
	LeftSide.id = "LeftSide"
	LeftSide:SetAlpha( 0.25, 0 )
	LeftSide:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
	LeftSide:SetUseAA( true )
	LeftSide:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -600, 0, 0, 0 )
	self:addElement( LeftSide )
	self.LeftSide = LeftSide
	
	local RightSide = nil
	
	RightSide = LUI.UIImage.new()
	RightSide.id = "RightSide"
	RightSide:SetAlpha( 0.25, 0 )
	RightSide:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	RightSide:SetUseAA( true )
	RightSide:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, 0, _1080p * 600, 0, 0 )
	self:addElement( RightSide )
	self.RightSide = RightSide
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetAlpha( 0.25, 0 )
	self:addElement( Border )
	self.Border = Border
	
	return self
end

MenuBuilder.registerType( "AfterLifeGradientBackground", AfterLifeGradientBackground )
LockTable( _M )
