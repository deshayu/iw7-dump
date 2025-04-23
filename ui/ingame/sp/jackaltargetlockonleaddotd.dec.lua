local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalTargetLockonLeadDotD( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 3 * _1080p, 0, 3 * _1080p )
	self.id = "JackalTargetLockonLeadDotD"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local JackalTargetLockonLeadDot0 = nil
	
	JackalTargetLockonLeadDot0 = MenuBuilder.BuildRegisteredType( "JackalTargetLockonLeadDot", {
		controllerIndex = f1_local1
	} )
	JackalTargetLockonLeadDot0.id = "JackalTargetLockonLeadDot0"
	JackalTargetLockonLeadDot0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 1.5, _1080p * -1.5, _1080p * 1.5, _1080p * -1.5 )
	JackalTargetLockonLeadDot0:BindAlphaToModel( DataSources.inGame.jackal.missileLockTargetLeadAlpha:GetModel( f1_local1 ) )
	self:addElement( JackalTargetLockonLeadDot0 )
	self.JackalTargetLockonLeadDot0 = JackalTargetLockonLeadDot0
	
	return self
end

MenuBuilder.registerType( "JackalTargetLockonLeadDotD", JackalTargetLockonLeadDotD )
LockTable( _M )
