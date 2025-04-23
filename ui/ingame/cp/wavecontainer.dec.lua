local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function waveContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 263 * _1080p, 0, 323 * _1080p )
	self.id = "waveContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if not CONDITIONS.JustPlayedBossBattle( self ) then
		f1_local3 = MenuBuilder.BuildRegisteredType( "waveNumberSplash", {
			controllerIndex = f1_local1
		} )
		f1_local3.id = "waveNumberSplash"
		f1_local3:SetYRotation( 16, 0 )
		f1_local3:SetZRotation( 5, 0 )
		f1_local3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 256, _1080p * -113, _1080p * 310 )
		self:addElement( f1_local3 )
		self.waveNumberSplash = f1_local3
	end
	return self
end

MenuBuilder.registerType( "waveContainer", waveContainer )
LockTable( _M )
