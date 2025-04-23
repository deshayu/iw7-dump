local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function eyeEquation( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p )
	self.id = "eyeEquation"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local piIcon = nil
	
	piIcon = LUI.UIImage.new()
	piIcon.id = "piIcon"
	piIcon:setImage( RegisterMaterial( "cp_town_chem_pi_symbol" ), 0 )
	piIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292, _1080p * 420, _1080p * 136, _1080p * 264 )
	self:addElement( piIcon )
	self.piIcon = piIcon
	
	local eye = nil
	
	eye = LUI.UIImage.new()
	eye.id = "eye"
	eye:setImage( RegisterMaterial( "cp_town_chem_eye_symbol" ), 0 )
	eye:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 120, _1080p * 136, _1080p * 264 )
	self:addElement( eye )
	self.eye = eye
	
	local icon = nil
	
	icon = LUI.UIImage.new()
	icon.id = "icon"
	icon:setImage( RegisterMaterial( "cp_town_chem_diamond_symbol" ), 0 )
	icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 149, _1080p * 277, _1080p * 136, _1080p * 264 )
	self:addElement( icon )
	self.icon = icon
	
	local lineBottom = nil
	
	lineBottom = LUI.UIImage.new()
	lineBottom.id = "lineBottom"
	lineBottom:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 120, _1080p * 157, _1080p * 204.5, _1080p * 211.5 )
	self:addElement( lineBottom )
	self.lineBottom = lineBottom
	
	local lineTop = nil
	
	lineTop = LUI.UIImage.new()
	lineTop.id = "lineTop"
	lineTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 120, _1080p * 157, _1080p * 190, _1080p * 197 )
	self:addElement( lineTop )
	self.lineTop = lineTop
	
	local lineX2 = nil
	
	lineX2 = LUI.UIImage.new()
	lineX2.id = "lineX2"
	lineX2:SetZRotation( 45, 0 )
	lineX2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 261, _1080p * 298, _1080p * 196.5, _1080p * 203.5 )
	self:addElement( lineX2 )
	self.lineX2 = lineX2
	
	local lineX1 = nil
	
	lineX1 = LUI.UIImage.new()
	lineX1.id = "lineX1"
	lineX1:SetZRotation( -45, 0 )
	lineX1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 261, _1080p * 298, _1080p * 196.5, _1080p * 203.5 )
	self:addElement( lineX1 )
	self.lineX1 = lineX1
	
	return self
end

MenuBuilder.registerType( "eyeEquation", eyeEquation )
LockTable( _M )
