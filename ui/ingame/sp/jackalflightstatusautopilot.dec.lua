local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0 = DataSources.inGame.jackal.mode
	local f1_local1 = DataSources.inGame.jackal.autopilot
	local f1_local2 = function ( f2_arg0 )
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		local f2_local1 = f1_local1:GetValue( f1_arg1 )
		if (f2_local0 == 3) or f2_local1 and f2_local1 == true then
			ACTIONS.AnimateSequence( f1_arg0, "autopilotOn" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "autopilotOff" )
		end
	end
	
	f1_local2()
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local2, true )
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), f1_local2, true )
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence( f1_arg0, "ReadsRightToLeft" )
	end
	if IsLanguageOversizedFont() then
		f1_arg0.textOn:SetFontSize( 14 * _1080p )
		f1_arg0.textOn:SetTop( -17 * _1080p, 0 )
		f1_arg0.textOn:SetBottom( -3 * _1080p, 0 )
		f1_arg0.textOff:SetFontSize( 14 * _1080p )
		f1_arg0.textOff:SetTop( -17 * _1080p, 0 )
		f1_arg0.textOff:SetBottom( -3 * _1080p, 0 )
	end
end

function JackalFlightStatusAutopilot( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 196 * _1080p, 0, 27 * _1080p )
	self.id = "JackalFlightStatusAutopilot"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Hightlight = nil
	
	Hightlight = LUI.UIImage.new()
	Hightlight.id = "Hightlight"
	Hightlight:SetRGBFromTable( SWATCHES.jackal.flightModeHighlight, 0 )
	Hightlight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -70, _1080p * -10, 0, _1080p * 5 )
	self:addElement( Hightlight )
	self.Hightlight = Hightlight
	
	local dividingLine = nil
	
	dividingLine = LUI.UIText.new()
	dividingLine.id = "dividingLine"
	dividingLine:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	dividingLine:SetAlpha( 0.5, 0 )
	dividingLine:setText( ToUpperCase( "/" ), 0 )
	dividingLine:SetFontSize( 22 * _1080p )
	dividingLine:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	dividingLine:SetAlignment( LUI.Alignment.Center )
	dividingLine:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -50, _1080p * -34, _1080p * -22, 0 )
	self:addElement( dividingLine )
	self.dividingLine = dividingLine
	
	local textAutoPilot = nil
	
	textAutoPilot = LUI.UIText.new()
	textAutoPilot.id = "textAutoPilot"
	textAutoPilot:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	textAutoPilot:setText( ToUpperCase( Engine.Localize( "JACKAL_AUTOPILOT_COLON" ) ), 0 )
	textAutoPilot:SetFontSize( 22 * _1080p )
	textAutoPilot:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	textAutoPilot:SetAlignment( LUI.Alignment.Right )
	textAutoPilot:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -50, _1080p * 103, _1080p * -22, 0 )
	self:addElement( textAutoPilot )
	self.textAutoPilot = textAutoPilot
	
	local textOn = nil
	
	textOn = LUI.UIText.new()
	textOn.id = "textOn"
	textOn:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	textOn:setText( ToUpperCase( Engine.Localize( "JACKAL_ON" ) ), 0 )
	textOn:SetFontSize( 22 * _1080p )
	textOn:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	textOn:SetAlignment( LUI.Alignment.Right )
	textOn:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -88, _1080p * -52, _1080p * -22, 0 )
	self:addElement( textOn )
	self.textOn = textOn
	
	local textOff = nil
	
	textOff = LUI.UIText.new()
	textOff.id = "textOff"
	textOff:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	textOff:setText( ToUpperCase( Engine.Localize( "JACKAL_OFF" ) ), 0 )
	textOff:SetFontSize( 22 * _1080p )
	textOff:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	textOff:SetAlignment( LUI.Alignment.Left )
	textOff:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -34, _1080p * 18, _1080p * -22, 0 )
	self:addElement( textOff )
	self.textOff = textOff
	
	local HighlightGlow = nil
	
	HighlightGlow = LUI.UIImage.new()
	HighlightGlow.id = "HighlightGlow"
	HighlightGlow:SetRGBFromTable( SWATCHES.jackal.hightlight, 0 )
	HighlightGlow:SetAlpha( 0.6, 0 )
	HighlightGlow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	HighlightGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	HighlightGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -140, _1080p * 60, _1080p * -61, _1080p * 39 )
	self:addElement( HighlightGlow )
	self.HighlightGlow = HighlightGlow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Hightlight:RegisterAnimationSequence( "autopilotOn", {
			{
				function ()
					return self.Hightlight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 1, 50 )
				end
			}
		} )
		textAutoPilot:RegisterAnimationSequence( "autopilotOn", {
			{
				function ()
					return self.textAutoPilot:SetRGBFromTable( SWATCHES.jackal.normal, 0 )
				end
			},
			{
				function ()
					return self.textAutoPilot:SetAlpha( 1, 0 )
				end
			}
		} )
		textOn:RegisterAnimationSequence( "autopilotOn", {
			{
				function ()
					return self.textOn:SetRGBFromTable( SWATCHES.jackal.normal, 0 )
				end
			},
			{
				function ()
					return self.textOn:SetAlpha( 1, 0 )
				end
			}
		} )
		textOff:RegisterAnimationSequence( "autopilotOn", {
			{
				function ()
					return self.textOff:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.textOff:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			}
		} )
		HighlightGlow:RegisterAnimationSequence( "autopilotOn", {
			{
				function ()
					return self.HighlightGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0.6, 50 )
				end
			}
		} )
		self._sequences.autopilotOn = function ()
			Hightlight:AnimateSequence( "autopilotOn" )
			textAutoPilot:AnimateSequence( "autopilotOn" )
			textOn:AnimateSequence( "autopilotOn" )
			textOff:AnimateSequence( "autopilotOn" )
			HighlightGlow:AnimateSequence( "autopilotOn" )
		end
		
		Hightlight:RegisterAnimationSequence( "autopilotOff", {
			{
				function ()
					return self.Hightlight:SetAlpha( 0, 0 )
				end
			}
		} )
		textAutoPilot:RegisterAnimationSequence( "autopilotOff", {
			{
				function ()
					return self.textAutoPilot:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			},
			{
				function ()
					return self.textAutoPilot:SetAlpha( 0.4, 0 )
				end
			}
		} )
		textOn:RegisterAnimationSequence( "autopilotOff", {
			{
				function ()
					return self.textOn:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			},
			{
				function ()
					return self.textOn:SetAlpha( 0.4, 0 )
				end
			}
		} )
		textOff:RegisterAnimationSequence( "autopilotOff", {
			{
				function ()
					return self.textOff:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.textOff:SetRGBFromTable( SWATCHES.jackal.normal, 0 )
				end
			}
		} )
		HighlightGlow:RegisterAnimationSequence( "autopilotOff", {
			{
				function ()
					return self.HighlightGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.autopilotOff = function ()
			Hightlight:AnimateSequence( "autopilotOff" )
			textAutoPilot:AnimateSequence( "autopilotOff" )
			textOn:AnimateSequence( "autopilotOff" )
			textOff:AnimateSequence( "autopilotOff" )
			HighlightGlow:AnimateSequence( "autopilotOff" )
		end
		
		Hightlight:RegisterAnimationSequence( "ReadsRightToLeft", {
			{
				function ()
					return self.Hightlight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 23, _1080p * 83, 0, _1080p * 5, 0 )
				end
			}
		} )
		dividingLine:RegisterAnimationSequence( "ReadsRightToLeft", {
			{
				function ()
					return self.dividingLine:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -148, _1080p * -137, _1080p * -20, 0, 0 )
				end
			}
		} )
		textAutoPilot:RegisterAnimationSequence( "ReadsRightToLeft", {
			{
				function ()
					return self.textAutoPilot:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 98, _1080p * 200, _1080p * -20, 0, 0 )
				end
			}
		} )
		textOn:RegisterAnimationSequence( "ReadsRightToLeft", {
			{
				function ()
					return self.textOn:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -137, _1080p * -102, _1080p * -20, 0, 0 )
				end
			}
		} )
		textOff:RegisterAnimationSequence( "ReadsRightToLeft", {
			{
				function ()
					return self.textOff:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -200, _1080p * -148, _1080p * -20, 0, 0 )
				end
			}
		} )
		HighlightGlow:RegisterAnimationSequence( "ReadsRightToLeft", {
			{
				function ()
					return self.HighlightGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -47, _1080p * 153, _1080p * -61, _1080p * 39, 0 )
				end
			}
		} )
		self._sequences.ReadsRightToLeft = function ()
			Hightlight:AnimateSequence( "ReadsRightToLeft" )
			dividingLine:AnimateSequence( "ReadsRightToLeft" )
			textAutoPilot:AnimateSequence( "ReadsRightToLeft" )
			textOn:AnimateSequence( "ReadsRightToLeft" )
			textOff:AnimateSequence( "ReadsRightToLeft" )
			HighlightGlow:AnimateSequence( "ReadsRightToLeft" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalFlightStatusAutopilot", JackalFlightStatusAutopilot )
LockTable( _M )
