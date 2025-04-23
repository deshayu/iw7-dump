local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DroneReticleKillMsg( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 80 * _1080p, 0, 23 * _1080p )
	self.id = "DroneReticleKillMsg"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local KillBg = nil
	
	KillBg = LUI.UIImage.new()
	KillBg.id = "KillBg"
	KillBg:SetRGBFromInt( 0, 0 )
	KillBg:SetAlpha( 0.3, 0 )
	self:addElement( KillBg )
	self.KillBg = KillBg
	
	local KillText = nil
	
	KillText = LUI.UIText.new()
	KillText.id = "KillText"
	KillText:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	KillText:setText( Engine.Localize( "EQUIPMENT_DRONE_UI_KILL" ), 0 )
	KillText:SetFontSize( 20 * _1080p )
	KillText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	KillText:setTextStyle( CoD.TextStyle.Shadowed )
	KillText:SetAlignment( LUI.Alignment.Center )
	KillText:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * -4, _1080p * 1, _1080p * -1 )
	self:addElement( KillText )
	self.KillText = KillText
	
	return self
end

MenuBuilder.registerType( "DroneReticleKillMsg", DroneReticleKillMsg )
LockTable( _M )
