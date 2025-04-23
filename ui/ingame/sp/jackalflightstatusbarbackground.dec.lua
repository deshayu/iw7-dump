local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalFlightStatusBarBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1008 * _1080p, 0, 128 * _1080p )
	self.id = "JackalFlightStatusBarBackground"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LeftSide = nil
	
	LeftSide = LUI.UIImage.new()
	LeftSide.id = "LeftSide"
	LeftSide:SetRGBFromInt( 0, 0 )
	LeftSide:SetAlpha( 0.08, 0 )
	LeftSide:setImage( RegisterMaterial( "hud_jackal_top_darken" ), 0 )
	LeftSide:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 500, 0, 0 )
	self:addElement( LeftSide )
	self.LeftSide = LeftSide
	
	local Center = nil
	
	Center = LUI.UIImage.new()
	Center.id = "Center"
	Center:SetRGBFromInt( 0, 0 )
	Center:SetAlpha( 0.08, 0 )
	Center:setImage( RegisterMaterial( "hud_jackal_top_darken_spacer" ), 0 )
	Center:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 500, _1080p * -500, 0, 0 )
	self:addElement( Center )
	self.Center = Center
	
	local RightSide = nil
	
	RightSide = LUI.UIImage.new()
	RightSide.id = "RightSide"
	RightSide:SetRGBFromInt( 0, 0 )
	RightSide:SetAlpha( 0.08, 0 )
	RightSide:setImage( RegisterMaterial( "hud_jackal_top_darken" ), 0 )
	RightSide:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * -500, 0, 0 )
	self:addElement( RightSide )
	self.RightSide = RightSide
	
	return self
end

MenuBuilder.registerType( "JackalFlightStatusBarBackground", JackalFlightStatusBarBackground )
LockTable( _M )
