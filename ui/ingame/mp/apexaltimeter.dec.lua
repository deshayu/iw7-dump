local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ApexAltimeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 300 * _1080p )
	self.id = "ApexAltimeter"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Altimeter = nil
	
	Altimeter = MenuBuilder.BuildRegisteredType( "Altimeter", {
		stretch = 0.5,
		controllerIndex = f1_local1
	} )
	Altimeter.id = "Altimeter"
	Altimeter:SetRGBFromTable( SWATCHES.apex.stable, 0 )
	self:addElement( Altimeter )
	self.Altimeter = Altimeter
	
	return self
end

MenuBuilder.registerType( "ApexAltimeter", ApexAltimeter )
LockTable( _M )
