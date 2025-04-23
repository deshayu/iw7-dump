local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OlympusMonsDistanceToShipyard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 565 * _1080p, 0, 64 * _1080p )
	self.id = "OlympusMonsDistanceToShipyard"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BufferText = nil
	
	BufferText = LUI.UIText.new()
	BufferText.id = "BufferText"
	BufferText:SetAlpha( 0, 0 )
	BufferText:setText( "-", 0 )
	BufferText:SetFontSize( 34 * _1080p )
	BufferText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	BufferText:setTextStyle( CoD.TextStyle.Outlined )
	BufferText:SetAlignment( LUI.Alignment.Right )
	BufferText:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 335, _1080p * 18.5, _1080p * -18.5 )
	self:addElement( BufferText )
	self.BufferText = BufferText
	
	local TimerBackground = nil
	
	TimerBackground = LUI.UIImage.new()
	TimerBackground.id = "TimerBackground"
	TimerBackground:setImage( RegisterMaterial( "hud_countdown_timer_background" ), 0 )
	TimerBackground:SetUseAA( true )
	TimerBackground:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -118, 0, 0, 0 )
	self:addElement( TimerBackground )
	self.TimerBackground = TimerBackground
	
	local TextBackground = nil
	
	TextBackground = LUI.UIImage.new()
	TextBackground.id = "TextBackground"
	TextBackground:setImage( RegisterMaterial( "hud_countdown_timer_background" ), 0 )
	TextBackground:SetUseAA( true )
	TextBackground:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -558, _1080p * -128, 0, 0 )
	self:addElement( TextBackground )
	self.TextBackground = TextBackground
	
	local TextGradient = nil
	
	TextGradient = LUI.UIImage.new()
	TextGradient.id = "TextGradient"
	TextGradient:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	TextGradient:SetAlpha( 0.2, 0 )
	TextGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	TextGradient:SetUseAA( true )
	TextGradient:SetBlendMode( BLEND_MODE.addWithAlpha )
	TextGradient:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -561.5, _1080p * -128, 0, 0 )
	self:addElement( TextGradient )
	self.TextGradient = TextGradient
	
	local EndCap = nil
	
	EndCap = LUI.UIImage.new()
	EndCap.id = "EndCap"
	EndCap:setImage( RegisterMaterial( "hud_countdown_timer_end_cap" ), 0 )
	EndCap:SetUseAA( true )
	EndCap:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -565, _1080p * -558, 0, 0 )
	self:addElement( EndCap )
	self.EndCap = EndCap
	
	local Separator = nil
	
	Separator = LUI.UIImage.new()
	Separator.id = "Separator"
	Separator:setImage( RegisterMaterial( "hud_countdown_timer_separator" ), 0 )
	Separator:SetUseAA( true )
	Separator:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -128, _1080p * -118, 0, 0 )
	self:addElement( Separator )
	self.Separator = Separator
	
	local DistanceValue = nil
	
	DistanceValue = LUI.UIText.new()
	DistanceValue.id = "DistanceValue"
	DistanceValue:SetFontSize( 32 * _1080p )
	DistanceValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DistanceValue:setTextStyle( CoD.TextStyle.Outlined )
	DistanceValue:SetAlignment( LUI.Alignment.Left )
	DistanceValue:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -115, _1080p * -55, _1080p * 18.5, _1080p * -18.5 )
	DistanceValue:SubscribeToModel( DataSources.inGame.SP.heistSpace.olympusMonsDistance:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.SP.heistSpace.olympusMonsDistance:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			DistanceValue:setText( f2_local0, 0 )
		end
	end )
	self:addElement( DistanceValue )
	self.DistanceValue = DistanceValue
	
	local DistanceLabel = nil
	
	DistanceLabel = LUI.UIText.new()
	DistanceLabel.id = "DistanceLabel"
	DistanceLabel:setText( Engine.Localize( "HEIST_KM" ), 0 )
	DistanceLabel:SetFontSize( 45 * _1080p )
	DistanceLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DistanceLabel:setTextStyle( CoD.TextStyle.Outlined )
	DistanceLabel:SetAlignment( LUI.Alignment.Left )
	DistanceLabel:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -53, _1080p * -13, _1080p * 18.5, _1080p * -18.5 )
	self:addElement( DistanceLabel )
	self.DistanceLabel = DistanceLabel
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( Engine.Localize( "HEIST_DISTANCE_TO_SHIPYARD" ), 0 )
	Text:SetFontSize( 32 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:setTextStyle( CoD.TextStyle.Outlined )
	Text:SetAlignment( LUI.Alignment.Right )
	Text:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -558, _1080p * -130, _1080p * 18.5, _1080p * -18.5 )
	self:addElement( Text )
	self.Text = Text
	
	self._animationSets.DefaultAnimationSet = function ()
		TimerBackground:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TimerBackground:SetAlpha( 1, 0 )
				end
			}
		} )
		TextBackground:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TextBackground:SetAlpha( 1, 0 )
				end
			}
		} )
		TextGradient:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TextGradient:SetAlpha( 0.2, 0 )
				end
			}
		} )
		EndCap:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.EndCap:SetAlpha( 1, 0 )
				end
			}
		} )
		Separator:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Separator:SetAlpha( 1, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Text:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -165, _1080p * 18.5, _1080p * -18.5, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			TimerBackground:AnimateSequence( "DefaultSequence" )
			TextBackground:AnimateSequence( "DefaultSequence" )
			TextGradient:AnimateSequence( "DefaultSequence" )
			EndCap:AnimateSequence( "DefaultSequence" )
			Separator:AnimateSequence( "DefaultSequence" )
			Text:AnimateSequence( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "OlympusMonsDistanceToShipyard", OlympusMonsDistanceToShipyard )
LockTable( _M )
