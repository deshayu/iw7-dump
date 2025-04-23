local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ApexCompass( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 20 * _1080p )
	self.id = "ApexCompass"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Compass = nil
	
	Compass = MenuBuilder.BuildRegisteredType( "Compass", {
		stretch = 0.85,
		controllerIndex = f1_local1
	} )
	Compass.id = "Compass"
	self:addElement( Compass )
	self.Compass = Compass
	
	return self
end

MenuBuilder.registerType( "ApexCompass", ApexCompass )
LockTable( _M )
