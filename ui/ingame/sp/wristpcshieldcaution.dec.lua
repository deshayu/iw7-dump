local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WristPCShieldCaution( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 90 * _1080p, 0, 20 * _1080p )
	self.id = "WristPCShieldCaution"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local criticalBar = nil
	
	criticalBar = LUI.UIImage.new()
	criticalBar.id = "criticalBar"
	criticalBar:setImage( RegisterMaterial( "dropship_hud_critical_box_1" ), 0 )
	self:addElement( criticalBar )
	self.criticalBar = criticalBar
	
	local critical = nil
	
	critical = LUI.UIText.new()
	critical.id = "critical"
	critical:SetRGBFromInt( 0, 0 )
	critical:setText( ToUpperCase( Engine.Localize( "DROPSHIP_CRITICAL" ) ), 0 )
	critical:SetFontSize( 12 * _1080p )
	critical:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	critical:SetAlignment( LUI.Alignment.Center )
	critical:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 9, _1080p * -9, _1080p * -6, _1080p * 6 )
	self:addElement( critical )
	self.critical = critical
	
	return self
end

MenuBuilder.registerType( "WristPCShieldCaution", WristPCShieldCaution )
LockTable( _M )
