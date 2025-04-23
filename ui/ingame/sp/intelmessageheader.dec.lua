local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.HeaderText:SubscribeToModel( DataSources.inGame.SP.SPMessageHeaderText:GetModel( f1_arg1 ), function ()
		assert( f1_arg0.HighlightNode )
		assert( f1_arg0.HighlightGlow )
		local f2_local0 = DataSources.inGame.SP.SPMessageHeaderText:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			local f2_local1 = ToUpperCase( LocalizeString( f2_local0 ) )
			f1_arg0.HeaderText:setText( f2_local1, 0 )
			local f2_local2 = f1_arg0.HeaderText:GetCurrentFont()
			local f2_local3, f2_local4, f2_local5, f2_local6 = f1_arg0.HeaderText:getLocalRect()
			local f2_local7, f2_local8, f2_local9, f2_local10 = GetTextDimensions( f2_local1, f2_local2, math.abs( f2_local6 - f2_local4 ), math.abs( f2_local5 - f2_local3 ) )
			local f2_local11 = f2_local8 - f2_local10
			local f2_local12 = f2_local11 - 2
			local f2_local13 = f2_local11 + 17
			f1_arg0.HighlightNode:SetBottom( f2_local12, 100 )
			f1_arg0.HighlightGlow:SetBottom( f2_local13, 100 )
		end
	end )
end

function IntelMessageHeader( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 30 * _1080p )
	self.id = "IntelMessageHeader"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
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
	
	local HighlightNode = nil
	
	HighlightNode = LUI.UIImage.new()
	HighlightNode.id = "HighlightNode"
	HighlightNode:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	HighlightNode:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	HighlightNode:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 3, 0, _1080p * 30 )
	self:addElement( HighlightNode )
	self.HighlightNode = HighlightNode
	
	local HeaderText = nil
	
	HeaderText = LUI.UIStyledText.new()
	HeaderText.id = "HeaderText"
	HeaderText:setText( ToUpperCase( LocalizeString( "New Intel available in Captain's Operations Office" ) ), 0 )
	HeaderText:SetFontSize( 18 * _1080p )
	HeaderText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	HeaderText:SetAlignment( LUI.Alignment.Left )
	HeaderText:SetShadowMinDistance( -0.2, 0 )
	HeaderText:SetShadowMaxDistance( 0.2, 0 )
	HeaderText:SetShadowRGBFromInt( 0, 0 )
	HeaderText:SetDecodeLetterLength( 25 )
	HeaderText:SetDecodeMaxRandChars( 3 )
	HeaderText:SetDecodeUpdatesPerLetter( 4 )
	HeaderText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 244, _1080p * -3, _1080p * 15 )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "IntelMessageHeader", IntelMessageHeader )
LockTable( _M )
