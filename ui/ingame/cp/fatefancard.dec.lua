local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FateFanCard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 237 * _1080p, 0, 332 * _1080p )
	self.id = "FateFanCard"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local fanCard = nil
	
	fanCard = LUI.UIImage.new()
	fanCard.id = "fanCard"
	fanCard:setImage( RegisterMaterial( "zm_wc_card_fan" ), 0 )
	fanCard:SetUseAA( true )
	fanCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -11.5, _1080p * 244.5, 0, _1080p * 512 )
	self:addElement( fanCard )
	self.fanCard = fanCard
	
	local fanOverlay = nil
	
	fanOverlay = LUI.UIImage.new()
	fanOverlay.id = "fanOverlay"
	fanOverlay:setImage( RegisterMaterial( "zm_wc_card_fan_overlay" ), 0 )
	fanOverlay:SetUseAA( true )
	fanOverlay:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -11.5, _1080p * 244.5, 0, _1080p * 512 )
	self:addElement( fanOverlay )
	self.fanOverlay = fanOverlay
	
	return self
end

MenuBuilder.registerType( "FateFanCard", FateFanCard )
LockTable( _M )
