local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RemoteControlFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "RemoteControlFrame"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ArcVignetteBottom = nil
	
	ArcVignetteBottom = LUI.UIImage.new()
	ArcVignetteBottom.id = "ArcVignetteBottom"
	ArcVignetteBottom:SetAlpha( 0.9, 0 )
	ArcVignetteBottom:setImage( RegisterMaterial( "hud_robot_hack_arc_vignette_opache" ), 0 )
	ArcVignetteBottom:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -64, _1080p * 28 )
	self:addElement( ArcVignetteBottom )
	self.ArcVignetteBottom = ArcVignetteBottom
	
	local ArcVignetteBottom2 = nil
	
	ArcVignetteBottom2 = LUI.UIImage.new()
	ArcVignetteBottom2.id = "ArcVignetteBottom2"
	ArcVignetteBottom2:SetAlpha( 0.9, 0 )
	ArcVignetteBottom2:SetZRotation( 180, 0 )
	ArcVignetteBottom2:setImage( RegisterMaterial( "hud_robot_hack_arc_vignette_opache" ), 0 )
	ArcVignetteBottom2:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * 28, _1080p * 120 )
	self:addElement( ArcVignetteBottom2 )
	self.ArcVignetteBottom2 = ArcVignetteBottom2
	
	local ArcVignetteTop = nil
	
	ArcVignetteTop = LUI.UIImage.new()
	ArcVignetteTop.id = "ArcVignetteTop"
	ArcVignetteTop:SetAlpha( 0.9, 0 )
	ArcVignetteTop:SetZRotation( 180, 0 )
	ArcVignetteTop:setImage( RegisterMaterial( "hud_robot_hack_arc_vignette_opache" ), 0 )
	ArcVignetteTop:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -28, _1080p * 64 )
	self:addElement( ArcVignetteTop )
	self.ArcVignetteTop = ArcVignetteTop
	
	local ArcVignetteTop2 = nil
	
	ArcVignetteTop2 = LUI.UIImage.new()
	ArcVignetteTop2.id = "ArcVignetteTop2"
	ArcVignetteTop2:SetAlpha( 0.9, 0 )
	ArcVignetteTop2:setImage( RegisterMaterial( "hud_robot_hack_arc_vignette_opache" ), 0 )
	ArcVignetteTop2:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -120, _1080p * -28 )
	self:addElement( ArcVignetteTop2 )
	self.ArcVignetteTop2 = ArcVignetteTop2
	
	local BottomMeter = nil
	
	BottomMeter = LUI.UIImage.new()
	BottomMeter.id = "BottomMeter"
	BottomMeter:setImage( RegisterMaterial( "hud_robot_hack_bottom_meter" ), 0 )
	BottomMeter:SetBlendMode( BLEND_MODE.addWithAlpha )
	BottomMeter:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -710, _1080p * 710, _1080p * -38, _1080p * 38 )
	self:addElement( BottomMeter )
	self.BottomMeter = BottomMeter
	
	local TopMeter = nil
	
	TopMeter = LUI.UIImage.new()
	TopMeter.id = "TopMeter"
	TopMeter:setImage( RegisterMaterial( "hud_robot_hack_top_meter" ), 0 )
	TopMeter:SetBlendMode( BLEND_MODE.addWithAlpha )
	TopMeter:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * -53, _1080p * 43 )
	self:addElement( TopMeter )
	self.TopMeter = TopMeter
	
	return self
end

MenuBuilder.registerType( "RemoteControlFrame", RemoteControlFrame )
LockTable( _M )
