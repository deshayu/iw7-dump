local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function radialAlpha( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "radialAlpha"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CircleBacking = nil
	
	CircleBacking = LUI.UIImage.new()
	CircleBacking.id = "CircleBacking"
	CircleBacking:SetRGBFromInt( 2039583, 0 )
	CircleBacking:SetAlpha( 0.9, 0 )
	CircleBacking:setImage( RegisterMaterial( "dpad_circle_outline" ), 0 )
	CircleBacking:SetBlendMode( BLEND_MODE.addWithAlpha )
	CircleBacking:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	self:addElement( CircleBacking )
	self.CircleBacking = CircleBacking
	
	local CircleFill = nil
	
	CircleFill = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "dpad_circle_segment",
		maskMaterial = "dpad_circle_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f1_local1
	} )
	CircleFill.id = "CircleFill"
	CircleFill:SetRGBFromInt( 3860046, 0 )
	CircleFill:SetProgress( 0 )
	CircleFill:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	self:addElement( CircleFill )
	self.CircleFill = CircleFill
	
	return self
end

MenuBuilder.registerType( "radialAlpha", radialAlpha )
LockTable( _M )
