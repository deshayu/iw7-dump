local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EquipmentUpgradedHeader( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 30 * _1080p )
	self.id = "EquipmentUpgradedHeader"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HighlightGlow = nil
	
	HighlightGlow = LUI.UIImage.new()
	HighlightGlow.id = "HighlightGlow"
	HighlightGlow:SetRGBFromTable( SWATCHES.HUD.glow, 0 )
	HighlightGlow:SetAlpha( 0.6, 0 )
	HighlightGlow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	HighlightGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	HighlightGlow:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -14, _1080p * 16, _1080p * -28, _1080p * 28 )
	self:addElement( HighlightGlow )
	self.HighlightGlow = HighlightGlow
	
	local HighlightNode = nil
	
	HighlightNode = LUI.UIImage.new()
	HighlightNode.id = "HighlightNode"
	HighlightNode:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	HighlightNode:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	HighlightNode:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 3, 0, 0 )
	self:addElement( HighlightNode )
	self.HighlightNode = HighlightNode
	
	local EquipHeader = nil
	
	EquipHeader = LUI.UIStyledText.new()
	EquipHeader.id = "EquipHeader"
	EquipHeader:setText( ToUpperCase( Engine.Localize( "EQUIPMENT_UPGRADE_DISCOVERED" ) ), 0 )
	EquipHeader:SetFontSize( 18 * _1080p )
	EquipHeader:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	EquipHeader:SetAlignment( LUI.Alignment.Left )
	EquipHeader:SetOptOutRightToLeftAlignmentFlip( true )
	EquipHeader:SetShadowMinDistance( -0.2, 0 )
	EquipHeader:SetShadowMaxDistance( 0.2, 0 )
	EquipHeader:SetShadowRGBFromInt( 0, 0 )
	EquipHeader:SetDecodeLetterLength( 25 )
	EquipHeader:SetDecodeMaxRandChars( 3 )
	EquipHeader:SetDecodeUpdatesPerLetter( 4 )
	EquipHeader:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 9, 0, _1080p * -16.5, _1080p * 1.5 )
	self:addElement( EquipHeader )
	self.EquipHeader = EquipHeader
	
	return self
end

MenuBuilder.registerType( "EquipmentUpgradedHeader", EquipmentUpgradedHeader )
LockTable( _M )
