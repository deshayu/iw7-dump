local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Timer:addEventHandler( "time10sec", function ( f2_arg0, f2_arg1 )
		ACTIONS.AnimateSequence( f1_arg0, "Time10Sec" )
	end )
	f1_arg0.Timer:addEventHandler( "timeout", function ( f3_arg0, f3_arg1 )
		ACTIONS.AnimateSequence( f1_arg0, "Timeout" )
	end )
	f1_arg0.Timer:addEventHandler( "timeReset", function ( f4_arg0, f4_arg1 )
		if DataSources.inGame.SP.missionCountdown.timer:GetValue( f1_arg1 ) > 0 then
			ACTIONS.AnimateSequence( f1_arg0, "Reset" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "Hide" )
		end
	end )
end

function EthanHackCountdownTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 75 * _1080p )
	self.id = "EthanHackCountdownTimer"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local TextBackground = nil
	
	TextBackground = LUI.UIImage.new()
	TextBackground.id = "TextBackground"
	TextBackground:setImage( RegisterMaterial( "hud_countdown_timer_background" ), 0 )
	TextBackground:SetUseAA( true )
	TextBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 7, 0, 0, 0 )
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
	TextGradient:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 7, 0, 0, 0 )
	self:addElement( TextGradient )
	self.TextGradient = TextGradient
	
	local EndCap = nil
	
	EndCap = LUI.UIImage.new()
	EndCap.id = "EndCap"
	EndCap:setImage( RegisterMaterial( "hud_countdown_timer_end_cap" ), 0 )
	EndCap:SetUseAA( true )
	EndCap:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 7, 0, 0 )
	self:addElement( EndCap )
	self.EndCap = EndCap
	
	local Timer = nil
	
	Timer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f5_local1
	} )
	Timer.id = "Timer"
	Timer:SetFontSize( 28 * _1080p )
	Timer:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Timer:setTextStyle( CoD.TextStyle.Outlined )
	Timer:SetAlignment( LUI.Alignment.Center )
	Timer:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 7, 0, _1080p * 40, _1080p * -7 )
	Timer:SubscribeToModel( DataSources.inGame.SP.missionCountdown.timer:GetModel( f5_local1 ), function ()
		local f6_local0 = DataSources.inGame.SP.missionCountdown.timer:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			Timer:setEndTime( f6_local0 )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:setTextStyle( CoD.TextStyle.Outlined )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 7, 0, _1080p * 7, _1080p * -47 )
	Text:SubscribeToModel( DataSources.inGame.SP.missionCountdown.missionText:GetModel( f5_local1 ), function ()
		local f7_local0 = DataSources.inGame.SP.missionCountdown.missionText:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			Text:setText( LocalizeLongString( f7_local0 ), 0 )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	self._animationSets.DefaultAnimationSet = function ()
		TextBackground:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TextBackground:SetAlpha( 0, 0 )
				end
			}
		} )
		TextGradient:RegisterAnimationSequence( "DefaultSequence", {
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
		EndCap:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.EndCap:SetAlpha( 0, 0 )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Timer:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Timer:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Text:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			TextBackground:AnimateSequence( "DefaultSequence" )
			TextGradient:AnimateSequence( "DefaultSequence" )
			EndCap:AnimateSequence( "DefaultSequence" )
			Timer:AnimateSequence( "DefaultSequence" )
			Text:AnimateSequence( "DefaultSequence" )
		end
		
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
			}
		} )
		self._sequences.Reset = function ()
			TextBackground:AnimateSequence( "Reset" )
			TextGradient:AnimateSequence( "Reset" )
			EndCap:AnimateSequence( "Reset" )
			Timer:AnimateSequence( "Reset" )
			Text:AnimateSequence( "Reset" )
		end
		
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
			TextBackground:AnimateSequence( "Timeout" )
			TextGradient:AnimateSequence( "Timeout" )
			EndCap:AnimateSequence( "Timeout" )
			Timer:AnimateSequence( "Timeout" )
			Text:AnimateSequence( "Timeout" )
		end
		
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
			TextBackground:AnimateSequence( "Hide" )
			TextGradient:AnimateSequence( "Hide" )
			EndCap:AnimateSequence( "Hide" )
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
			}
		} )
		self._sequences.Time10Sec = function ()
			TextGradient:AnimateLoop( "Time10Sec" )
			Timer:AnimateLoop( "Time10Sec" )
			Text:AnimateLoop( "Time10Sec" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f5_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "EthanHackCountdownTimer", EthanHackCountdownTimer )
LockTable( _M )
