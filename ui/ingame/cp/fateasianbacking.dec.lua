local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function fateAsianBacking( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 591 * _1080p, 0, 102 * _1080p )
	self.id = "fateAsianBacking"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local bg1 = nil
	
	bg1 = LUI.UIImage.new()
	bg1.id = "bg1"
	bg1:SetScale( -0.07, 0 )
	bg1:setImage( RegisterMaterial( "zm_dlc2_inventory_fnf_bg" ), 0 )
	bg1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -12, _1080p * 116, _1080p * -13, _1080p * 115 )
	self:addElement( bg1 )
	self.bg1 = bg1
	
	local bg2 = nil
	
	bg2 = LUI.UIImage.new()
	bg2.id = "bg2"
	bg2:SetScale( -0.07, 0 )
	bg2:setImage( RegisterMaterial( "zm_dlc2_inventory_fnf_bg" ), 0 )
	bg2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 110, _1080p * 238, _1080p * -13, _1080p * 115 )
	self:addElement( bg2 )
	self.bg2 = bg2
	
	local bg3 = nil
	
	bg3 = LUI.UIImage.new()
	bg3.id = "bg3"
	bg3:SetScale( -0.07, 0 )
	bg3:setImage( RegisterMaterial( "zm_dlc2_inventory_fnf_bg" ), 0 )
	bg3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 231.5, _1080p * 359.5, _1080p * -13, _1080p * 115 )
	self:addElement( bg3 )
	self.bg3 = bg3
	
	local bg4 = nil
	
	bg4 = LUI.UIImage.new()
	bg4.id = "bg4"
	bg4:SetScale( -0.07, 0 )
	bg4:setImage( RegisterMaterial( "zm_dlc2_inventory_fnf_bg" ), 0 )
	bg4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 354, _1080p * 482, _1080p * -13, _1080p * 115 )
	self:addElement( bg4 )
	self.bg4 = bg4
	
	local bg5 = nil
	
	bg5 = LUI.UIImage.new()
	bg5.id = "bg5"
	bg5:SetScale( -0.07, 0 )
	bg5:setImage( RegisterMaterial( "zm_dlc2_inventory_fnf_bg" ), 0 )
	bg5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 476, _1080p * 604, _1080p * -13, _1080p * 115 )
	self:addElement( bg5 )
	self.bg5 = bg5
	
	return self
end

MenuBuilder.registerType( "fateAsianBacking", fateAsianBacking )
LockTable( _M )
