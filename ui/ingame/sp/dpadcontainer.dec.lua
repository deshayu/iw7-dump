local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetDotPitchEnabled( true )
	f1_arg0:SetDotPitchX( 6, 0 )
	f1_arg0:SetDotPitchY( 3, 0 )
	f1_arg0:SetDotPitchContrast( 0.15, 0 )
	f1_arg0:SetYRotation( 30 )
end

function DPadContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 410 * _1080p, 0, 120 * _1080p )
	self.id = "DPadContainer"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local DPad = nil
	
	DPad = MenuBuilder.BuildRegisteredType( "DPad", {
		controllerIndex = f2_local1
	} )
	DPad.id = "DPad"
	DPad:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 68, _1080p * 132, _1080p * -45, _1080p * 19 )
	DPad:BindAlphaToModel( DataSources.inGame.SP.dPad.containerAlpha:GetModel( f2_local1 ) )
	self:addElement( DPad )
	self.DPad = DPad
	
	local f2_local4 = nil
	if CONDITIONS.IsPearlHarbor( self ) then
		f2_local4 = MenuBuilder.BuildRegisteredType( "JackalStatus", {
			controllerIndex = f2_local1
		} )
		f2_local4.id = "JackalStatus"
		f2_local4:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 35, _1080p * 165, _1080p * 25.25, _1080p * 41.25 )
		self:addElement( f2_local4 )
		self.JackalStatus = f2_local4
	end
	local f2_local5 = nil
	if CONDITIONS.IsMars( self ) then
		f2_local5 = MenuBuilder.BuildRegisteredType( "MarsRemoteMissileStatus", {
			controllerIndex = f2_local1
		} )
		f2_local5.id = "MarsRemoteMissileStatus"
		f2_local5:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 35, _1080p * 165, _1080p * 25.25, _1080p * 41.25 )
		self:addElement( f2_local5 )
		self.MarsRemoteMissileStatus = f2_local5
	end
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "DPadContainer", DPadContainer )
LockTable( _M )
