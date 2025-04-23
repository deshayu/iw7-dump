local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPClapboardArm( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 32 * _1080p )
	self.id = "CPClapboardArm"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Arm = nil
	
	Arm = LUI.UIImage.new()
	Arm.id = "Arm"
	Arm:setImage( RegisterMaterial( "clapboard_arm" ), 0 )
	Arm:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 256, 0, _1080p * 32 )
	self:addElement( Arm )
	self.Arm = Arm
	
	return self
end

MenuBuilder.registerType( "CPClapboardArm", CPClapboardArm )
LockTable( _M )
