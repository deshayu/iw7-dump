local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
end

function JackalAltimeters( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 300 * _1080p )
	self.id = "JackalAltimeters"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Right = nil
	
	Right = MenuBuilder.BuildRegisteredType( "Altimeter", {
		stretch = 0.4,
		controllerIndex = f2_local1
	} )
	Right.id = "Right"
	Right:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -64, 0, _1080p * -150, _1080p * 150 )
	self:addElement( Right )
	self.Right = Right
	
	local Left = nil
	
	Left = MenuBuilder.BuildRegisteredType( "Altimeter", {
		stretch = 0.4,
		controllerIndex = f2_local1
	} )
	Left.id = "Left"
	Left:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 64, _1080p * -150, _1080p * 150 )
	self:addElement( Left )
	self.Left = Left
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalAltimeters", JackalAltimeters )
LockTable( _M )
