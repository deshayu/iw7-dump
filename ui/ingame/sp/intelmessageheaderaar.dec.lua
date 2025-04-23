local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.HighlightNode )
	assert( f1_arg0.HighlightGlow )
	local f1_local0 = ToUpperCase( LocalizeString( "MENU_SP_AAR_SUMMARY" ) )
	f1_arg0.HeaderText:setText( f1_local0, 0 )
	local f1_local1 = f1_arg0.HeaderText:GetCurrentFont()
	local f1_local2, f1_local3, f1_local4, f1_local5 = f1_arg0.HeaderText:getLocalRect()
	local f1_local6, f1_local7, f1_local8, f1_local9 = GetTextDimensions( f1_local0, f1_local1, math.abs( f1_local5 - f1_local3 ), math.abs( f1_local4 - f1_local2 ) )
	local f1_local10 = f1_local7 - f1_local9
	local f1_local11 = f1_local10 - 2
	local f1_local12 = f1_local10 + 17
	f1_arg0.HighlightNode:SetBottom( f1_local11, 100 )
	f1_arg0.HighlightGlow:SetBottom( f1_local12, 100 )
end

function IntelMessageHeaderAAR( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 30 * _1080p )
	self.id = "IntelMessageHeaderAAR"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local HighlightNode = nil
	
	HighlightNode = LUI.UIImage.new()
	HighlightNode.id = "HighlightNode"
	HighlightNode:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	HighlightNode:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	HighlightNode:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 3, 0, _1080p * 30 )
	self:addElement( HighlightNode )
	self.HighlightNode = HighlightNode
	
	local HighlightGlow = nil
	
	HighlightGlow = LUI.UIImage.new()
	HighlightGlow.id = "HighlightGlow"
	HighlightGlow:SetRGBFromTable( SWATCHES.HUD.glow, 0 )
	HighlightGlow:SetAlpha( 0.6, 0 )
	HighlightGlow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	HighlightGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	HighlightGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -14, _1080p * 16, _1080p * -28, _1080p * 58 )
	self:addElement( HighlightGlow )
	self.HighlightGlow = HighlightGlow
	
	local HeaderText = nil
	
	HeaderText = LUI.UIStyledText.new()
	HeaderText.id = "HeaderText"
	HeaderText:setText( ToUpperCase( LocalizeString( "Mission Summary " ) ), 0 )
	HeaderText:SetFontSize( 18 * _1080p )
	HeaderText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	HeaderText:SetAlignment( LUI.Alignment.Left )
	HeaderText:SetShadowMinDistance( -0.2, 0 )
	HeaderText:SetShadowMaxDistance( 0.2, 0 )
	HeaderText:SetShadowRGBFromInt( 0, 0 )
	HeaderText:SetDecodeLetterLength( 25 )
	HeaderText:SetDecodeMaxRandChars( 3 )
	HeaderText:SetDecodeUpdatesPerLetter( 4 )
	HeaderText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 244, _1080p * -2, _1080p * 15 )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "IntelMessageHeaderAAR", IntelMessageHeaderAAR )
LockTable( _M )
