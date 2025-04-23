local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalCenterReticleADSBrackets( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 188 * _1080p, 0, 188 * _1080p )
	self.id = "JackalCenterReticleADSBrackets"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CenterADSBracketR = nil
	
	CenterADSBracketR = LUI.UIImage.new()
	CenterADSBracketR.id = "CenterADSBracketR"
	CenterADSBracketR:SetScale( 1.1, 0 )
	CenterADSBracketR:setImage( RegisterMaterial( "hud_jackal_assault_reticule_vert_curve" ), 0 )
	CenterADSBracketR:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 88, _1080p * 108, _1080p * -79.25, _1080p * 81.75 )
	self:addElement( CenterADSBracketR )
	self.CenterADSBracketR = CenterADSBracketR
	
	local CenterADSBracketL = nil
	
	CenterADSBracketL = LUI.UIImage.new()
	CenterADSBracketL.id = "CenterADSBracketL"
	CenterADSBracketL:SetZRotation( 180, 0 )
	CenterADSBracketL:SetScale( 1.1, 0 )
	CenterADSBracketL:setImage( RegisterMaterial( "hud_jackal_assault_reticule_vert_curve" ), 0 )
	CenterADSBracketL:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -108, _1080p * -88, _1080p * -79.25, _1080p * 81.75 )
	self:addElement( CenterADSBracketL )
	self.CenterADSBracketL = CenterADSBracketL
	
	return self
end

MenuBuilder.registerType( "JackalCenterReticleADSBrackets", JackalCenterReticleADSBrackets )
LockTable( _M )
