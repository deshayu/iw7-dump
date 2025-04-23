local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = function ()
		if f1_arg0._layoutInitialized then
			local f2_local0, f2_local1 = f1_arg0.Text:getElementTextDims()
			local f2_local2, f2_local3 = f1_arg0.BufferText:getElementTextDims()
			local f2_local4, f2_local5, f2_local6, f2_local7 = f1_arg0.TextBackground:getLocalRect()
			local f2_local8 = f2_local6 - f2_local0 + f2_local2 * 2
			f1_arg0.TextBackground:SetLeft( f2_local8 )
			f1_arg0.TextGradient:SetLeft( f2_local8 )
			f1_arg0.Text:SetRight( f2_local6 - f2_local2 )
			local f2_local9 = f1_arg0.EndCap:getWidth()
			f1_arg0.EndCap:SetRight( f2_local8 )
			f1_arg0.EndCap:SetLeft( f2_local8 - f2_local9 )
		end
	end
	
	local f1_local1 = function ()
		local f3_local0 = f1_arg0:Wait( 16 )
		f3_local0.onComplete = f1_local0
	end
	
	f1_arg0.Timer:addEventHandler( "time10sec", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or f1_arg1
		ACTIONS.AnimateSequence( f1_arg0, "Time10Sec" )
		f1_local1()
	end )
	f1_arg0.Timer:addEventHandler( "timeout", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or f1_arg1
		ACTIONS.AnimateSequence( f1_arg0, "Timeout" )
		f1_local1()
	end )
	f1_arg0.Timer:addEventHandler( "timeReset", function ( f6_arg0, f6_arg1 )
		if DataSources.inGame.SP.missionCountdown.timer:GetValue( f6_arg1.controller or f1_arg1 ) > 0 then
			ACTIONS.AnimateSequence( f1_arg0, "Reset" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "Hide" )
		end
		f1_local1()
	end )
	f1_arg0.Timer:SetUseAA( true )
	f1_arg0.Text:SetUseAA( true )
	f1_arg0._layoutInitialized = false
	f1_arg0:SetNotifyOnLayoutInit( true )
	f1_arg0:addEventHandler( "layout_initialized", function ( f7_arg0, f7_arg1 )
		f7_arg0._layoutInitialized = true
		f7_arg0:SubscribeToModel( DataSources.inGame.SP.missionCountdown.missionText:GetModel( f1_arg1 ), f1_local1 )
		f1_local0()
	end )
end

function CountdownTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 465 * _1080p, 0, 64 * _1080p )
	self.id = "CountdownTimer"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
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
	TimerBackground:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 347, _1080p * 465, 0, 0 )
	self:addElement( TimerBackground )
	self.TimerBackground = TimerBackground
	
	local TextBackground = nil
	
	TextBackground = LUI.UIImage.new()
	TextBackground.id = "TextBackground"
	TextBackground:setImage( RegisterMaterial( "hud_countdown_timer_background" ), 0 )
	TextBackground:SetUseAA( true )
	TextBackground:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -465, _1080p * -128, 0, 0 )
	self:addElement( TextBackground )
	self.TextBackground = TextBackground
	
	local TextGradient = nil
	
	TextGradient = LUI.UIImage.new()
	TextGradient.id = "TextGradient"
	TextGradient:SetRGBFromInt( 41727, 0 )
	TextGradient:SetAlpha( 0.2, 0 )
	TextGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	TextGradient:SetUseAA( true )
	TextGradient:SetBlendMode( BLEND_MODE.addWithAlpha )
	TextGradient:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -465, _1080p * -128, 0, 0 )
	self:addElement( TextGradient )
	self.TextGradient = TextGradient
	
	local EndCap = nil
	
	EndCap = LUI.UIImage.new()
	EndCap.id = "EndCap"
	EndCap:setImage( RegisterMaterial( "hud_countdown_timer_end_cap" ), 0 )
	EndCap:SetUseAA( true )
	EndCap:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -465, _1080p * -458, 0, 0 )
	self:addElement( EndCap )
	self.EndCap = EndCap
	
	local Separator = nil
	
	Separator = LUI.UIImage.new()
	Separator.id = "Separator"
	Separator:setImage( RegisterMaterial( "hud_countdown_timer_separator" ), 0 )
	Separator:SetUseAA( true )
	Separator:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 337, _1080p * -118, 0, 0 )
	self:addElement( Separator )
	self.Separator = Separator
	
	local Timer = nil
	
	Timer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f8_local1
	} )
	Timer.id = "Timer"
	Timer:SetFontSize( 32 * _1080p )
	Timer:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Timer:setTextStyle( CoD.TextStyle.Outlined )
	Timer:SetAlignment( LUI.Alignment.Left )
	Timer:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 350, _1080p * -15, _1080p * 18.5, _1080p * -18.5 )
	Timer:SubscribeToModel( DataSources.inGame.SP.missionCountdown.timer:GetModel( f8_local1 ), function ()
		local f9_local0 = DataSources.inGame.SP.missionCountdown.timer:GetValue( f8_local1 )
		if f9_local0 ~= nil then
			Timer:setEndTime( f9_local0 )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:SetFontSize( 30 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:setTextStyle( CoD.TextStyle.Outlined )
	Text:SetAlignment( LUI.Alignment.Right )
	Text:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -130, _1080p * 18.5, _1080p * -18.5 )
	Text:SubscribeToModel( DataSources.inGame.SP.missionCountdown.missionText:GetModel( f8_local1 ), function ()
		local f10_local0 = DataSources.inGame.SP.missionCountdown.missionText:GetValue( f8_local1 )
		if f10_local0 ~= nil then
			Text:setText( LocalizeLongString( f10_local0 ), 0 )
		end
	end )
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
			},
			{
				function ()
					return self.TextGradient:SetRGBFromInt( 41727, 0 )
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
		Timer:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Timer:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Timer:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Timer:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 350, _1080p * -15, _1080p * 18.5, _1080p * -18.5, 0 )
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
			Timer:AnimateSequence( "DefaultSequence" )
			Text:AnimateSequence( "DefaultSequence" )
		end
		
		TimerBackground:RegisterAnimationSequence( "Reset", {
			{
				function ()
					return self.TimerBackground:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TimerBackground:SetAlpha( 1, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		TextBackground:RegisterAnimationSequence( "Reset", {
			{
				function ()
					return self.TextBackground:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TextBackground:SetAlpha( 1, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		TextGradient:RegisterAnimationSequence( "Reset", {
			{
				function ()
					return self.TextGradient:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TextGradient:SetAlpha( 0.2, 500, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.TextGradient:SetRGBFromInt( 41727, 0 )
				end
			}
		} )
		EndCap:RegisterAnimationSequence( "Reset", {
			{
				function ()
					return self.EndCap:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EndCap:SetAlpha( 1, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		Separator:RegisterAnimationSequence( "Reset", {
			{
				function ()
					return self.Separator:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Separator:SetAlpha( 1, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "Reset", {
			{
				function ()
					return self.Timer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Timer:SetAlpha( 1, 500, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Timer:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Timer:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 350, _1080p * -50, _1080p * 18.5, _1080p * -18.5, 0 )
				end,
				function ()
					return self.Timer:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 350, _1080p * -15, _1080p * 18.5, _1080p * -18.5, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		Text:RegisterAnimationSequence( "Reset", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 1, 500, LUI.EASING.inQuadratic )
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
		self._sequences.Reset = function ()
			TimerBackground:AnimateSequence( "Reset" )
			TextBackground:AnimateSequence( "Reset" )
			TextGradient:AnimateSequence( "Reset" )
			EndCap:AnimateSequence( "Reset" )
			Separator:AnimateSequence( "Reset" )
			Timer:AnimateSequence( "Reset" )
			Text:AnimateSequence( "Reset" )
		end
		
		TimerBackground:RegisterAnimationSequence( "Timeout", {
			{
				function ()
					return self.TimerBackground:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TimerBackground:SetAlpha( 0, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		TextBackground:RegisterAnimationSequence( "Timeout", {
			{
				function ()
					return self.TextBackground:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TextBackground:SetAlpha( 0, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		TextGradient:RegisterAnimationSequence( "Timeout", {
			{
				function ()
					return self.TextGradient:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.TextGradient:SetAlpha( 0, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		EndCap:RegisterAnimationSequence( "Timeout", {
			{
				function ()
					return self.EndCap:SetAlpha( 1, 0 )
				end,
				function ()
					return self.EndCap:SetAlpha( 0, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		Separator:RegisterAnimationSequence( "Timeout", {
			{
				function ()
					return self.Separator:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Separator:SetAlpha( 0, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "Timeout", {
			{
				function ()
					return self.Timer:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Timer:SetAlpha( 0, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		Text:RegisterAnimationSequence( "Timeout", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.Timeout = function ()
			TimerBackground:AnimateSequence( "Timeout" )
			TextBackground:AnimateSequence( "Timeout" )
			TextGradient:AnimateSequence( "Timeout" )
			EndCap:AnimateSequence( "Timeout" )
			Separator:AnimateSequence( "Timeout" )
			Timer:AnimateSequence( "Timeout" )
			Text:AnimateSequence( "Timeout" )
		end
		
		BufferText:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.BufferText:SetAlpha( 0, 0 )
				end
			}
		} )
		TimerBackground:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.TimerBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		TextBackground:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.TextBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		TextGradient:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.TextGradient:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.TextGradient:SetRGBFromInt( 41727, 0 )
				end
			}
		} )
		EndCap:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.EndCap:SetAlpha( 0, 0 )
				end
			}
		} )
		Separator:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Separator:SetAlpha( 0, 0 )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Timer:SetAlpha( 0, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			BufferText:AnimateSequence( "Hide" )
			TimerBackground:AnimateSequence( "Hide" )
			TextBackground:AnimateSequence( "Hide" )
			TextGradient:AnimateSequence( "Hide" )
			EndCap:AnimateSequence( "Hide" )
			Separator:AnimateSequence( "Hide" )
			Timer:AnimateSequence( "Hide" )
			Text:AnimateSequence( "Hide" )
		end
		
		TextGradient:RegisterAnimationSequence( "Time10Sec", {
			{
				function ()
					return self.TextGradient:SetRGBFromInt( 16711680, 0 )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "Time10Sec", {
			{
				function ()
					return self.Timer:SetAlpha( 1, 0, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Timer:SetAlpha( 0.5, 250, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Timer:SetAlpha( 1, 250, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.Timer:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 350, _1080p * -15, _1080p * 16.5, _1080p * -16.5, 0, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Timer:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 350, _1080p * -7.5, _1080p * 16.5, _1080p * -16.5, 250, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Timer:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 350, 0, _1080p * 16.5, _1080p * -16.5, 250, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		Text:RegisterAnimationSequence( "Time10Sec", {
			{
				function ()
					return self.Text:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0.5, 250, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Text:SetAlpha( 1, 250, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -165, _1080p * 16.5, _1080p * -16.5, 0 )
				end
			}
		} )
		self._sequences.Time10Sec = function ()
			TextGradient:AnimateLoop( "Time10Sec" )
			Timer:AnimateLoop( "Time10Sec" )
			Text:AnimateLoop( "Time10Sec" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f8_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CountdownTimer", CountdownTimer )
LockTable( _M )
