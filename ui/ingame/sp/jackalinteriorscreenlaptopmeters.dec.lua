local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalInteriorScreenLaptopMeters( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 200 * _1080p )
	self.id = "JackalInteriorScreenLaptopMeters"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ProgressBar1 = nil
	
	ProgressBar1 = MenuBuilder.BuildRegisteredType( "JackalInteriorScreenLaptopBar", {
		controllerIndex = f1_local1
	} )
	ProgressBar1.id = "ProgressBar1"
	ProgressBar1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 164 )
	self:addElement( ProgressBar1 )
	self.ProgressBar1 = ProgressBar1
	
	local ProgressBar2 = nil
	
	ProgressBar2 = MenuBuilder.BuildRegisteredType( "JackalInteriorScreenLaptopBar", {
		controllerIndex = f1_local1
	} )
	ProgressBar2.id = "ProgressBar2"
	ProgressBar2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 210, _1080p * 221, 0, _1080p * 164 )
	self:addElement( ProgressBar2 )
	self.ProgressBar2 = ProgressBar2
	
	local ProgressBar3 = nil
	
	ProgressBar3 = MenuBuilder.BuildRegisteredType( "JackalInteriorScreenLaptopBar", {
		controllerIndex = f1_local1
	} )
	ProgressBar3.id = "ProgressBar3"
	ProgressBar3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 421, _1080p * 432, 0, _1080p * 164 )
	self:addElement( ProgressBar3 )
	self.ProgressBar3 = ProgressBar3
	
	return self
end

MenuBuilder.registerType( "JackalInteriorScreenLaptopMeters", JackalInteriorScreenLaptopMeters )
LockTable( _M )
