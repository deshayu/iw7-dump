local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ThermalVisionFriendlyDefault( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ThermalVisionFriendlyDefault"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local EnemyBox = nil
	
	EnemyBox = LUI.UIImage.new()
	EnemyBox.id = "EnemyBox"
	EnemyBox:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	EnemyBox:setImage( RegisterMaterial( "hud_fof_friendly_marker" ), 0 )
	EnemyBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 916, _1080p * 1004, _1080p * 517, _1080p * 605 )
	self:addElement( EnemyBox )
	self.EnemyBox = EnemyBox
	
	return self
end

MenuBuilder.registerType( "ThermalVisionFriendlyDefault", ThermalVisionFriendlyDefault )
LockTable( _M )
