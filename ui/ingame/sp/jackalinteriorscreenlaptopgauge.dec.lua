local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = nil
	local f1_local1 = function ()
		local f2_local0 = f1_arg0.Needle:SetZRotation( math.random( -100, -80 ), math.random( 100, 250 ), math.random( LUI.EASING.linear, LUI.EASING.inOutBack ) )
		f2_local0.onComplete = f1_local0
	end
	
	f1_local1()
end

function JackalInteriorScreenLaptopGauge( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 256 * _1080p )
	self.id = "JackalInteriorScreenLaptopGauge"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Needle = nil
	
	Needle = LUI.UIImage.new()
	Needle.id = "Needle"
	Needle:setImage( RegisterMaterial( "hud_jackal_interior_laptop_meter_arrow" ), 0 )
	Needle:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 16, 0, _1080p * 256 )
	self:addElement( Needle )
	self.Needle = Needle
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalInteriorScreenLaptopGauge", JackalInteriorScreenLaptopGauge )
LockTable( _M )
