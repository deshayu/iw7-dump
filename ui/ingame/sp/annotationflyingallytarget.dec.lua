local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AnnotationFlyingAllyTarget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "AnnotationFlyingAllyTarget"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local caret = nil
	
	caret = LUI.UIImage.new()
	caret.id = "caret"
	caret:SetRGBFromTable( SWATCHES.jackal.selected, 0 )
	caret:SetAlpha( 0.65, 0 )
	caret:SetScale( -0.65, 0 )
	caret:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_sm" ), 0 )
	caret:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -12, _1080p * -12 )
	self:addElement( caret )
	self.caret = caret
	
	return self
end

MenuBuilder.registerType( "AnnotationFlyingAllyTarget", AnnotationFlyingAllyTarget )
LockTable( _M )
