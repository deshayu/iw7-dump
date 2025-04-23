local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function singleFateCardWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 232 * _1080p, 0, 330 * _1080p )
	self.id = "singleFateCardWidget"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local cardBack = nil
	
	cardBack = LUI.UIImage.new()
	cardBack.id = "cardBack"
	cardBack:setImage( RegisterMaterial( "zm_wc_card_base" ), 0 )
	cardBack:SetUseAA( true )
	cardBack:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -14, _1080p * 242, 0, _1080p * 512 )
	self:addElement( cardBack )
	self.cardBack = cardBack
	
	return self
end

MenuBuilder.registerType( "singleFateCardWidget", singleFateCardWidget )
LockTable( _M )
