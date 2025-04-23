local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalTargetIndicator( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "JackalTargetIndicator"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local caret2 = nil
	
	caret2 = LUI.UIImage.new()
	caret2.id = "caret2"
	caret2:SetAlpha( 0.85, 0 )
	caret2:SetScale( -0.4, 0 )
	caret2:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_ax_sm" ), 0 )
	caret2:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -12, _1080p * -12 )
	self:addElement( caret2 )
	self.caret2 = caret2
	
	return self
end

MenuBuilder.registerType( "JackalTargetIndicator", JackalTargetIndicator )
LockTable( _M )
