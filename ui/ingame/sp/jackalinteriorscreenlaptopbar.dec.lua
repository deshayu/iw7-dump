local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 164
	local f1_local1 = nil
	local f1_local2 = function ()
		local f2_local0 = math.random( 75, 98 ) / 100
		local f2_local1 = math.random( 200, 1500 )
		local f2_local2 = math.random( LUI.EASING.linear, LUI.EASING.inOutBack )
		local f2_local3 = f2_local0 * -f1_local0
		local f2_local4 = f2_local3 - 3
		local f2_local5 = f2_local3 + 3
		local f2_local6 = f2_local3 - 8
		local f2_local7 = f2_local3 + 8
		local f2_local8 = f1_arg0.Fill:SetTop( _1080p * f2_local3, f2_local1, f2_local2 )
		local f2_local9 = f1_arg0.EndCap:SetTop( _1080p * f2_local4, f2_local1, f2_local2 )
		local f2_local10 = f1_arg0.EndCap:SetBottom( _1080p * f2_local5, f2_local1, f2_local2 )
		local f2_local11 = f1_arg0.Arrow:SetTop( _1080p * f2_local6, f2_local1, f2_local2 )
		local f2_local12 = f1_arg0.Arrow:SetBottom( _1080p * f2_local7, f2_local1, f2_local2 )
		f2_local8.onComplete = f1_local1
		f2_local9.onComplete = f1_local1
		f2_local10.onComplete = f1_local1
		f2_local11.onComplete = f1_local1
		f2_local12.onComplete = f1_local1
	end
	
	f1_local2()
end

function JackalInteriorScreenLaptopBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 8 * _1080p, 0, 164 * _1080p )
	self.id = "JackalInteriorScreenLaptopBar"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetRGBFromTable( SWATCHES.jackalInteriors.progressFill, 0 )
	Fill:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -164, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local EndCap = nil
	
	EndCap = LUI.UIImage.new()
	EndCap.id = "EndCap"
	EndCap:SetRGBFromInt( 0, 0 )
	EndCap:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -164, _1080p * -160 )
	self:addElement( EndCap )
	self.EndCap = EndCap
	
	local Arrow = nil
	
	Arrow = LUI.UIImage.new()
	Arrow.id = "Arrow"
	Arrow:SetRGBFromInt( 0, 0 )
	Arrow:SetZRotation( 90, 0 )
	Arrow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	Arrow:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -16, 0, _1080p * -169, _1080p * -153 )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Frame.id = "Frame"
	Frame:SetRGBFromInt( 0, 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalInteriorScreenLaptopBar", JackalInteriorScreenLaptopBar )
LockTable( _M )
