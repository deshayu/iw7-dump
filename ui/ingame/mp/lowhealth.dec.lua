local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function lowHealthHudDef()
	local self = LUI.UILitImage.new()
	self.id = "lowHealthHudDefId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGLowHealthOverlay )
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "vfx_blood_screen_overlay" )
	} )
	self:animateToState( "default", 0 )
	return self
end

MenuBuilder.registerType( "lowHealthHudDef", lowHealthHudDef )
LockTable( _M )
