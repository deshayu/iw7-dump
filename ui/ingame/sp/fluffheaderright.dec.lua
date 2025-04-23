local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FluffHeaderRight( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 30 * _1080p )
	self.id = "FluffHeaderRight"
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
	HighlightGlow:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -17, _1080p * 13, _1080p * -28, _1080p * 28 )
	self:addElement( HighlightGlow )
	self.HighlightGlow = HighlightGlow
	
	local HighlightNode = nil
	
	HighlightNode = LUI.UIImage.new()
	HighlightNode.id = "HighlightNode"
	HighlightNode:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	HighlightNode:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	HighlightNode:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3, 0, 0, 0 )
	self:addElement( HighlightNode )
	self.HighlightNode = HighlightNode
	
	local HeaderText = nil
	
	HeaderText = LUI.UIStyledText.new()
	HeaderText.id = "HeaderText"
	HeaderText:setText( ToUpperCase( LocalizeString( "Objectives" ) ), 0 )
	HeaderText:SetFontSize( 22 * _1080p )
	HeaderText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	HeaderText:SetAlignment( LUI.Alignment.Right )
	HeaderText:SetShadowMinDistance( -0.2, 0 )
	HeaderText:SetShadowMaxDistance( 0.2, 0 )
	HeaderText:SetShadowRGBFromInt( 0, 0 )
	HeaderText:SetDecodeLetterLength( 25 )
	HeaderText:SetDecodeMaxRandChars( 3 )
	HeaderText:SetDecodeUpdatesPerLetter( 4 )
	HeaderText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -11, _1080p * 11 )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	return self
end

MenuBuilder.registerType( "FluffHeaderRight", FluffHeaderRight )
LockTable( _M )
