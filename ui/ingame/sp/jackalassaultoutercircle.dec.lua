local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalAssaultOuterCircle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 682 * _1080p, 0, 642 * _1080p )
	self.id = "JackalAssaultOuterCircle"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local assaultOuterCurve1 = nil
	
	assaultOuterCurve1 = LUI.UIImage.new()
	assaultOuterCurve1.id = "assaultOuterCurve1"
	assaultOuterCurve1:setImage( RegisterMaterial( "hud_jackal_assault_reticule_outer_curve_01" ), 0 )
	assaultOuterCurve1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 256, 0, _1080p * 256 )
	self:addElement( assaultOuterCurve1 )
	self.assaultOuterCurve1 = assaultOuterCurve1
	
	local assaultOuterCurve2 = nil
	
	assaultOuterCurve2 = LUI.UIImage.new()
	assaultOuterCurve2.id = "assaultOuterCurve2"
	assaultOuterCurve2:setImage( RegisterMaterial( "hud_jackal_assault_reticule_outer_curve_02" ), 0 )
	assaultOuterCurve2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -256, 0, 0, _1080p * 256 )
	self:addElement( assaultOuterCurve2 )
	self.assaultOuterCurve2 = assaultOuterCurve2
	
	local assaultOuterCurve3 = nil
	
	assaultOuterCurve3 = LUI.UIImage.new()
	assaultOuterCurve3.id = "assaultOuterCurve3"
	assaultOuterCurve3:setImage( RegisterMaterial( "hud_jackal_assault_reticule_outer_curve_03" ), 0 )
	assaultOuterCurve3:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 256, _1080p * -256, 0 )
	self:addElement( assaultOuterCurve3 )
	self.assaultOuterCurve3 = assaultOuterCurve3
	
	local assaultOuterCurve4 = nil
	
	assaultOuterCurve4 = LUI.UIImage.new()
	assaultOuterCurve4.id = "assaultOuterCurve4"
	assaultOuterCurve4:setImage( RegisterMaterial( "hud_jackal_assault_reticule_outer_curve_04" ), 0 )
	assaultOuterCurve4:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -256, 0, _1080p * -256, 0 )
	self:addElement( assaultOuterCurve4 )
	self.assaultOuterCurve4 = assaultOuterCurve4
	
	return self
end

MenuBuilder.registerType( "JackalAssaultOuterCircle", JackalAssaultOuterCircle )
LockTable( _M )
