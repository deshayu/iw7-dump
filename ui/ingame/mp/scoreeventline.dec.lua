local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Text:SetShadowVOffset( -0 )
	f1_arg0.Text:SetShadowUOffset( -0 )
	f1_arg0.Text:SubscribeToModelThroughElement( f1_arg0, "scoreEvent.text", function ()
		if f1_arg0:isChildOf( f1_arg0:getParent() ) then
			ACTIONS.AnimateSequence( f1_arg0, "FadeIn" )
		end
	end )
	f1_arg0:addEventHandler( "feed_expiration", function ()
		f1_arg0.Text:SetAlpha( 0 )
	end )
end

function ScoreEventLine( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1200 * _1080p, 0, 24 * _1080p )
	self.id = "ScoreEventLine"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:SetGlitchEnabled( true )
	Text:SetGlitchAmount( 1, 0 )
	Text:SetGlitchBlockWidth( 50, 0 )
	Text:SetGlitchBlockHeight( 50, 0 )
	Text:SetGlitchDistortionRange( 16, 0 )
	Text:SetGlitchScanlinePitch( 1, 0 )
	Text:SetGlitchMaskPitch( 1, 0 )
	Text:SetFontSize( 24 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetOptOutRightToLeftAlignmentFlip( true )
	Text:SetShadowMinDistance( -0.2, 0 )
	Text:SetShadowMaxDistance( 0.2, 0 )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1149, 0, _1080p * 24 )
	Text:SubscribeToModelThroughElement( self, "scoreEvent.text", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.scoreEvent.text:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			Text:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Text:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 250, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.Text:SetGlitchAmount( 1, 250, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Text:SetGlitchAmount( 0, 10 )
				end
			},
			{
				function ()
					return self.Text:SetGlitchScanlinePitch( 60, 0 )
				end
			},
			{
				function ()
					return self.Text:SetGlitchMaskPitch( 50, 0 )
				end
			},
			{
				function ()
					return self.Text:SetGlitchDistortionRange( 30, 0 )
				end,
				function ()
					return self.Text:SetGlitchDistortionRange( 60, 100 )
				end,
				function ()
					return self.Text:SetGlitchDistortionRange( 20, 100 )
				end,
				function ()
					return self.Text:SetGlitchDistortionRange( 50, 50, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetGlitchBlockHeight( 15, 0 )
				end,
				function ()
					return self.Text:SetGlitchBlockHeight( 10, 100 )
				end,
				function ()
					return self.Text:SetGlitchBlockHeight( 20, 100 )
				end,
				function ()
					return self.Text:SetGlitchBlockHeight( 10, 50, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.Text:SetGlitchBlockWidth( 10, 100 )
				end,
				function ()
					return self.Text:SetGlitchBlockWidth( 20, 100 )
				end,
				function ()
					return self.Text:SetGlitchBlockWidth( 10, 50, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.FadeOut = function ()
			Text:AnimateSequence( "FadeOut" )
		end
		
		Text:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 1, 1180 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 270 )
				end
			},
			{
				function ()
					return self.Text:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.Text:SetGlitchAmount( 0, 1180 )
				end,
				function ()
					return self.Text:SetGlitchAmount( 1, 270 )
				end
			},
			{
				function ()
					return self.Text:SetGlitchBlockWidth( 7, 1180 )
				end,
				function ()
					return self.Text:SetGlitchBlockWidth( 20, 120 )
				end,
				function ()
					return self.Text:SetGlitchBlockWidth( 8, 100 )
				end,
				function ()
					return self.Text:SetGlitchBlockWidth( 15, 50 )
				end
			},
			{
				function ()
					return self.Text:SetGlitchBlockHeight( 8, 1180 )
				end,
				function ()
					return self.Text:SetGlitchBlockHeight( 20, 120 )
				end,
				function ()
					return self.Text:SetGlitchBlockHeight( 8, 100 )
				end,
				function ()
					return self.Text:SetGlitchBlockHeight( 15, 50 )
				end
			},
			{
				function ()
					return self.Text:SetGlitchDistortionRange( 10, 1180 )
				end,
				function ()
					return self.Text:SetGlitchDistortionRange( 60, 120 )
				end,
				function ()
					return self.Text:SetGlitchDistortionRange( 15, 100 )
				end,
				function ()
					return self.Text:SetGlitchDistortionRange( 30, 50 )
				end
			},
			{
				function ()
					return self.Text:SetGlitchScanlinePitch( 30, 1180 )
				end,
				function ()
					return self.Text:SetGlitchScanlinePitch( 5, 120 )
				end,
				function ()
					return self.Text:SetGlitchScanlinePitch( 1, 100 )
				end,
				function ()
					return self.Text:SetGlitchScanlinePitch( 1, 50 )
				end
			},
			{
				function ()
					return self.Text:SetGlitchMaskPitch( 15, 1180 )
				end,
				function ()
					return self.Text:SetGlitchMaskPitch( 10, 120 )
				end,
				function ()
					return self.Text:SetGlitchMaskPitch( 2, 100 )
				end,
				function ()
					return self.Text:SetGlitchMaskPitch( 1, 50 )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1200, _1080p * 2, _1080p * 16, 0 )
				end,
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1200, _1080p * -7, _1080p * 25, 29 )
				end,
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1200, _1080p * -12, _1080p * 36, 29 )
				end,
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1200, 0, _1080p * 26, 59 )
				end
			}
		} )
		self._sequences.FadeIn = function ()
			Text:AnimateSequence( "FadeIn" )
		end
		
		Text:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.Hide = function ()
			Text:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ScoreEventLine", ScoreEventLine )
LockTable( _M )
