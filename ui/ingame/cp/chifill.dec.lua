local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function chiFill( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 183 * _1080p, 0, 183 * _1080p )
	self.id = "chiFill"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local circleBacking = nil
	
	circleBacking = LUI.UIImage.new()
	circleBacking.id = "circleBacking"
	circleBacking:SetRGBFromInt( 14093324, 0 )
	circleBacking:SetScale( -0.43, 0 )
	circleBacking:setImage( RegisterMaterial( "zm_chi_asian_ring" ), 0 )
	circleBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -35.98, _1080p * 220.02, _1080p * -35.98, _1080p * 220.02 )
	self:addElement( circleBacking )
	self.circleBacking = circleBacking
	
	local circleFill = nil
	
	circleFill = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "dpad_circle_segment",
		maskMaterial = "dpad_circle_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f1_local1
	} )
	circleFill.id = "circleFill"
	circleFill:SetRGBFromInt( 15900471, 0 )
	circleFill:SetScale( 0.03, 0 )
	circleFill:SetProgress( 0 )
	circleFill:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21.5, _1080p * 161.5, _1080p * 21.5, _1080p * 161.5 )
	self:addElement( circleFill )
	self.circleFill = circleFill
	
	local asianPatern = nil
	
	asianPatern = LUI.UIImage.new()
	asianPatern.id = "asianPatern"
	asianPatern:SetAlpha( 0.6, 0 )
	asianPatern:SetScale( -0.43, 0 )
	asianPatern:setImage( RegisterMaterial( "zm_chi_asian_pattern" ), 0 )
	asianPatern:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -35.98, _1080p * 220.02, _1080p * -35.98, _1080p * 220.02 )
	self:addElement( asianPatern )
	self.asianPatern = asianPatern
	
	return self
end

MenuBuilder.registerType( "chiFill", chiFill )
LockTable( _M )
