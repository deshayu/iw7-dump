local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FlashFade()
	local self = LUI.UIElement.new()
	if self.setFlashFade then
		self:setFlashFade()
	end
	self:registerAnimationState( "default", {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	self:animateToState( "default" )
	return self
end

MenuBuilder.registerType( "FlashFade", FlashFade )
LockTable( _M )
