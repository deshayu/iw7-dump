local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalCenterReticleBlurRing( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "JackalCenterReticleBlurRing"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BlurRing = nil
	
	BlurRing = LUI.UIImage.new()
	BlurRing.id = "BlurRing"
	BlurRing:SetRGBFromTable( SWATCHES.jackal.stableAlt, 0 )
	BlurRing:SetAlpha( 0.1, 0 )
	BlurRing:setImage( RegisterMaterial( "hud_jackal_blur_ring_lg" ), 0 )
	BlurRing:SetBlendMode( BLEND_MODE.addWithAlpha )
	BlurRing:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( BlurRing )
	self.BlurRing = BlurRing
	
	local Accent = nil
	
	Accent = LUI.UIImage.new()
	Accent.id = "Accent"
	Accent:SetAlpha( 0.25, 0 )
	Accent:setImage( RegisterMaterial( "hud_jackal_blur_accent" ), 0 )
	Accent:SetBlendMode( BLEND_MODE.addWithAlpha )
	Accent:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( Accent )
	self.Accent = Accent
	
	local LargeCenterRing = nil
	
	LargeCenterRing = LUI.UIImage.new()
	LargeCenterRing.id = "LargeCenterRing"
	LargeCenterRing:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	LargeCenterRing:SetAlpha( 0.5, 0 )
	LargeCenterRing:setImage( RegisterMaterial( "hud_jackal_large_center_ring" ), 0 )
	LargeCenterRing:SetBlendMode( BLEND_MODE.addWithAlpha )
	LargeCenterRing:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( LargeCenterRing )
	self.LargeCenterRing = LargeCenterRing
	
	return self
end

MenuBuilder.registerType( "JackalCenterReticleBlurRing", JackalCenterReticleBlurRing )
LockTable( _M )
