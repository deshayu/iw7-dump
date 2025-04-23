local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalInteriorScreenMainWeapons( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 460 * _1080p )
	self.id = "JackalInteriorScreenMainWeapons"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BaseGunImage = nil
	
	BaseGunImage = LUI.UIImage.new()
	BaseGunImage.id = "BaseGunImage"
	BaseGunImage:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	BaseGunImage:SetAlpha( 0.75, 0 )
	BaseGunImage:setImage( RegisterMaterial( "hud_jackal_interior_main_gun_image" ), 0 )
	BaseGunImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 22, _1080p * 278, _1080p * 23, _1080p * 383 )
	self:addElement( BaseGunImage )
	self.BaseGunImage = BaseGunImage
	
	local Cannons50mm = nil
	
	Cannons50mm = LUI.UIImage.new()
	Cannons50mm.id = "Cannons50mm"
	Cannons50mm:SetRGBFromTable( SWATCHES.jackal.radarTint, 0 )
	Cannons50mm:SetAlpha( 0.94, 0 )
	Cannons50mm:setImage( RegisterMaterial( "hud_jackal_interior_main_gun_01" ), 0 )
	Cannons50mm:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 22, _1080p * 278, _1080p * 23, _1080p * 383 )
	self:addElement( Cannons50mm )
	self.Cannons50mm = Cannons50mm
	
	local MissileImage = nil
	
	MissileImage = LUI.UIImage.new()
	MissileImage.id = "MissileImage"
	MissileImage:SetRGBFromTable( SWATCHES.jackal.radarTint, 0 )
	MissileImage:SetAlpha( 0.75, 0 )
	MissileImage:setImage( RegisterMaterial( "hud_jackal_interior_main_missle" ), 0 )
	MissileImage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -182, _1080p * -118, _1080p * 23, _1080p * 383 )
	self:addElement( MissileImage )
	self.MissileImage = MissileImage
	
	local GNSLabelBox = nil
	
	GNSLabelBox = LUI.UIImage.new()
	GNSLabelBox.id = "GNSLabelBox"
	GNSLabelBox:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	GNSLabelBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 107.5, _1080p * 192.5, _1080p * 408.5, _1080p * 453.5 )
	self:addElement( GNSLabelBox )
	self.GNSLabelBox = GNSLabelBox
	
	local GNSText = nil
	
	GNSText = LUI.UIText.new()
	GNSText.id = "GNSText"
	GNSText:SetRGBFromTable( SWATCHES.jackal.boosterHeader, 0 )
	GNSText:setText( "GNS", 0 )
	GNSText:SetFontSize( 38 * _1080p )
	GNSText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	GNSText:SetAlignment( LUI.Alignment.Center )
	GNSText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 118, _1080p * 182, _1080p * 412, _1080p * 450 )
	self:addElement( GNSText )
	self.GNSText = GNSText
	
	local MSLLabelBox = nil
	
	MSLLabelBox = LUI.UIImage.new()
	MSLLabelBox.id = "MSLLabelBox"
	MSLLabelBox:SetRGBFromInt( 12772835, 0 )
	MSLLabelBox:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -191, _1080p * -109, _1080p * 408.5, _1080p * 453.5 )
	self:addElement( MSLLabelBox )
	self.MSLLabelBox = MSLLabelBox
	
	local MSLText = nil
	
	MSLText = LUI.UIText.new()
	MSLText.id = "MSLText"
	MSLText:SetRGBFromTable( SWATCHES.jackal.boosterHeader, 0 )
	MSLText:setText( "MSL", 0 )
	MSLText:SetFontSize( 38 * _1080p )
	MSLText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	MSLText:SetAlignment( LUI.Alignment.Center )
	MSLText:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -182, _1080p * -118, _1080p * 412, _1080p * 450 )
	self:addElement( MSLText )
	self.MSLText = MSLText
	
	return self
end

MenuBuilder.registerType( "JackalInteriorScreenMainWeapons", JackalInteriorScreenMainWeapons )
LockTable( _M )
