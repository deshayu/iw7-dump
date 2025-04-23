local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function radialAlphaLarge( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 183 * _1080p, 0, 183 * _1080p )
	self.id = "radialAlphaLarge"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local circleBacking = nil
	
	circleBacking = LUI.UIImage.new()
	circleBacking.id = "circleBacking"
	circleBacking:setImage( RegisterMaterial( "dpad_circle_outline" ), 0 )
	circleBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.5, _1080p * 166.5, _1080p * 16.5, _1080p * 166.5 )
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
	circleFill:SetScale( 0.02, 0 )
	circleFill:SetProgress( 0 )
	circleFill:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21.5, _1080p * 161.5, _1080p * 21.5, _1080p * 161.5 )
	self:addElement( circleFill )
	self.circleFill = circleFill
	
	return self
end

MenuBuilder.registerType( "radialAlphaLarge", radialAlphaLarge )
LockTable( _M )
