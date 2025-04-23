local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DisguiseSideBars( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "DisguiseSideBars"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local SideBarTopLeft = nil
	
	SideBarTopLeft = LUI.UIImage.new()
	SideBarTopLeft.id = "SideBarTopLeft"
	SideBarTopLeft:SetZRotation( 180, 0 )
	SideBarTopLeft:setImage( RegisterMaterial( "hud_disguise_side_bar" ), 0 )
	SideBarTopLeft:SetUseAA( true )
	SideBarTopLeft:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 96, _1080p * -1882, _1080p * 145, _1080p * -540 )
	self:addElement( SideBarTopLeft )
	self.SideBarTopLeft = SideBarTopLeft
	
	local SideBarTopRight = nil
	
	SideBarTopRight = LUI.UIImage.new()
	SideBarTopRight.id = "SideBarTopRight"
	SideBarTopRight:SetZRotation( 180, 0 )
	SideBarTopRight:setImage( RegisterMaterial( "hud_disguise_side_bar" ), 0 )
	SideBarTopRight:SetUseAA( true )
	SideBarTopRight:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1824, _1080p * -38, _1080p * 145, _1080p * -540 )
	self:addElement( SideBarTopRight )
	self.SideBarTopRight = SideBarTopRight
	
	local SideBarBottomLeft = nil
	
	SideBarBottomLeft = LUI.UIImage.new()
	SideBarBottomLeft.id = "SideBarBottomLeft"
	SideBarBottomLeft:setImage( RegisterMaterial( "hud_disguise_side_bar" ), 0 )
	SideBarBottomLeft:SetUseAA( true )
	SideBarBottomLeft:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 38, _1080p * -1824, _1080p * 540, _1080p * -145 )
	self:addElement( SideBarBottomLeft )
	self.SideBarBottomLeft = SideBarBottomLeft
	
	local SideBarBottomRight = nil
	
	SideBarBottomRight = LUI.UIImage.new()
	SideBarBottomRight.id = "SideBarBottomRight"
	SideBarBottomRight:setImage( RegisterMaterial( "hud_disguise_side_bar" ), 0 )
	SideBarBottomRight:SetUseAA( true )
	SideBarBottomRight:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1882, _1080p * -96, _1080p * 540, _1080p * -145 )
	self:addElement( SideBarBottomRight )
	self.SideBarBottomRight = SideBarBottomRight
	
	return self
end

MenuBuilder.registerType( "DisguiseSideBars", DisguiseSideBars )
LockTable( _M )
