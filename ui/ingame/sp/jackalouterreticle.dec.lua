local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalOuterReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1280 * _1080p, 0, 550 * _1080p )
	self.id = "JackalOuterReticle"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local StrikeReticle = nil
	
	StrikeReticle = MenuBuilder.BuildRegisteredType( "JackalOuterReticleStrike", {
		controllerIndex = f1_local1
	} )
	StrikeReticle.id = "StrikeReticle"
	StrikeReticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -640, _1080p * 640, _1080p * -275, _1080p * 275 )
	self:addElement( StrikeReticle )
	self.StrikeReticle = StrikeReticle
	
	local AssaultReticle = nil
	
	AssaultReticle = MenuBuilder.BuildRegisteredType( "JackalOuterReticleAssault", {
		controllerIndex = f1_local1
	} )
	AssaultReticle.id = "AssaultReticle"
	AssaultReticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * -250, _1080p * 250 )
	self:addElement( AssaultReticle )
	self.AssaultReticle = AssaultReticle
	
	return self
end

MenuBuilder.registerType( "JackalOuterReticle", JackalOuterReticle )
LockTable( _M )
