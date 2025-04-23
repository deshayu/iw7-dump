local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WonderCardBacking( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 134 * _1080p, 0, 168 * _1080p )
	self.id = "WonderCardBacking"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local base = nil
	
	base = LUI.UIImage.new()
	base.id = "base"
	base:setImage( RegisterMaterial( "zm_wc_base" ), 0 )
	base:SetUseAA( true )
	base:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2.5, _1080p * 130.5, 0, _1080p * 260 )
	self:addElement( base )
	self.base = base
	
	local gradient = nil
	
	gradient = LUI.UIImage.new()
	gradient.id = "gradient"
	gradient:setImage( RegisterMaterial( "zm_wc_back_gradient" ), 0 )
	gradient:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.5, _1080p * 122.5, _1080p * 2, _1080p * 128 )
	self:addElement( gradient )
	self.gradient = gradient
	
	local banner = nil
	
	banner = LUI.UIImage.new()
	banner.id = "banner"
	banner:setImage( RegisterMaterial( "zm_wc_banner" ), 0 )
	banner:SetUseAA( true )
	banner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1.25, _1080p * 134.25, _1080p * 5, _1080p * 70 )
	self:addElement( banner )
	self.banner = banner
	
	local devilHead = nil
	
	devilHead = LUI.UIImage.new()
	devilHead.id = "devilHead"
	devilHead:setImage( RegisterMaterial( "zm_wc_devil_head_top" ), 0 )
	devilHead:SetUseAA( true )
	devilHead:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2.5, _1080p * 130.5, _1080p * 31.81, _1080p * 159.81 )
	self:addElement( devilHead )
	self.devilHead = devilHead
	
	return self
end

MenuBuilder.registerType( "WonderCardBacking", WonderCardBacking )
LockTable( _M )
