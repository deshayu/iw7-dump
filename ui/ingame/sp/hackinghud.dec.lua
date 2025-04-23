local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.PulseBottom:RegisterAnimationSequence( "Pulse", {
		{
			function ()
				return f1_arg0.PulseBottom:SetAlpha( 1, 0 )
			end,
			function ()
				return f1_arg0.PulseBottom:SetAlpha( 0, 500, LUI.EASING.inOutSine )
			end
		},
		{
			function ()
				return f1_arg0.PulseBottom:SetBottom( _1080p * -39, 0 )
			end,
			function ()
				return f1_arg0.PulseBottom:SetBottom( _1080p * -14.56, 500, LUI.EASING.inOutSine )
			end
		}
	} )
	f1_arg0.PulseTop:RegisterAnimationSequence( "Pulse", {
		{
			function ()
				return f1_arg0.PulseTop:SetAlpha( 1, 0 )
			end,
			function ()
				return f1_arg0.PulseTop:SetAlpha( 0, 500, LUI.EASING.inOutSine )
			end
		},
		{
			function ()
				return f1_arg0.PulseTop:SetTop( _1080p * 32, 0 )
			end,
			function ()
				return f1_arg0.PulseTop:SetTop( _1080p * 7.44, 500, LUI.EASING.inOutSine )
			end
		}
	} )
	f1_arg0._sequences.Pulse()
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.hackingTime:GetModel( f1_arg1 ), function ()
		local f10_local0 = LUI.clamp( DataSources.inGame.SP.hackingTime:GetValue( f1_arg1 ), 0.01, 1 )
		f1_arg0.Bar:SetRightAnchor( 1 - f10_local0, 0 )
		f1_arg0.PulseTop:SetRightAnchor( 1 - f10_local0, 0 )
		f1_arg0.PulseBottom:SetRightAnchor( 1 - f10_local0, 0 )
	end, true )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.hackingState:GetModel( f1_arg1 ), function ()
		local f11_local0 = DataSources.inGame.SP.hackingState:GetValue( f1_arg1 )
		if f11_local0 then
			local f11_local1 = {
				hiding = 0,
				inRange = 1,
				losingSignal = 2,
				outOfRange = 3,
				complete = 4,
				failure = 5
			}
			if f11_local0 == f11_local1.hiding then
				ACTIONS.AnimateSequence( f1_arg0, "FadeOut" )
				ACTIONS.AnimateSequence( f1_arg0, "StopPulse" )
			elseif f11_local0 == f11_local1.inRange then
				ACTIONS.AnimateSequence( f1_arg0, "Default" )
				f1_arg0._sequences.Pulse()
			elseif f11_local0 == f11_local1.losingSignal then
				ACTIONS.AnimateSequence( f1_arg0, "Warning" )
				f1_arg0._sequences.Pulse()
			elseif f11_local0 == f11_local1.outOfRange then
				ACTIONS.AnimateSequence( f1_arg0, "OutOfRange" )
				ACTIONS.AnimateSequence( f1_arg0, "StopPulse" )
			elseif f11_local0 == f11_local1.complete then
				ACTIONS.AnimateSequence( f1_arg0, "Decrypted" )
				local f11_local2 = f1_arg0:Wait( 1500 )
				f11_local2.onComplete = function ()
					ACTIONS.AnimateSequence( f1_arg0, "FadeOut" )
					ACTIONS.AnimateSequence( f1_arg0, "StopPulse" )
				end
				
			elseif f11_local0 == f11_local1.failure then
				ACTIONS.AnimateSequence( f1_arg0, "HackFailed" )
				ACTIONS.AnimateSequence( f1_arg0, "StopPulse" )
			end
		end
	end, true )
end

function HackingHud( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 448 * _1080p, 0, 90 * _1080p )
	self.id = "HackingHud"
	self._animationSets = {}
	self._sequences = {}
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	local f13_local2 = self
	local FrameMultiply = nil
	
	FrameMultiply = LUI.UIImage.new()
	FrameMultiply.id = "FrameMultiply"
	FrameMultiply:setImage( RegisterMaterial( "hud_hack_bar_frame_multiply" ), 0 )
	FrameMultiply:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -6, _1080p * 462, _1080p * -8, _1080p * 60 )
	self:addElement( FrameMultiply )
	self.FrameMultiply = FrameMultiply
	
	local BarFill = nil
	
	BarFill = LUI.UIImage.new()
	BarFill.id = "BarFill"
	BarFill:SetRGBFromInt( 15132390, 0 )
	BarFill:SetBlendMode( BLEND_MODE.multiply )
	BarFill:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 2.5, _1080p * -2.5, _1080p * 32, _1080p * -39 )
	self:addElement( BarFill )
	self.BarFill = BarFill
	
	local BarEndCap = nil
	
	BarEndCap = LUI.UIImage.new()
	BarEndCap.id = "BarEndCap"
	BarEndCap:setImage( RegisterMaterial( "hud_hack_bar_frame_fill_end" ), 0 )
	BarEndCap:SetBlendMode( BLEND_MODE.addWithAlpha )
	BarEndCap:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * 4.71, 0, _1080p * 11 )
	self:addElement( BarEndCap )
	self.BarEndCap = BarEndCap
	
	local Bar = nil
	
	Bar = LUI.UIImage.new()
	Bar.id = "Bar"
	Bar:setImage( RegisterMaterial( "hud_hack_bar_frame_fill" ), 0 )
	Bar:SetBlendMode( BLEND_MODE.addWithAlpha )
	Bar:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 2.5, _1080p * -2.5, _1080p * 36, _1080p * -43 )
	self:addElement( Bar )
	self.Bar = Bar
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:setImage( RegisterMaterial( "hud_hack_bar_frame" ), 0 )
	Frame:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -38 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local HackingText = nil
	
	HackingText = LUI.UIText.new()
	HackingText.id = "HackingText"
	HackingText:SetRGBFromInt( 13762547, 0 )
	HackingText:setText( Engine.Localize( "HUD_PROXIMITY_HACK" ), 0 )
	HackingText:SetFontSize( 18 * _1080p )
	HackingText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	HackingText:SetAlignment( LUI.Alignment.Center )
	HackingText:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 448, 0, _1080p * -69 )
	self:addElement( HackingText )
	self.HackingText = HackingText
	
	local PulseBottom = nil
	
	PulseBottom = LUI.UIImage.new()
	PulseBottom.id = "PulseBottom"
	PulseBottom:setImage( RegisterMaterial( "hud_hack_bar_frame_pulse" ), 0 )
	PulseBottom:SetBlendMode( BLEND_MODE.addWithAlpha )
	PulseBottom:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 2.5, _1080p * -2.5, _1080p * 51.44, _1080p * -14.56 )
	self:addElement( PulseBottom )
	self.PulseBottom = PulseBottom
	
	local PulseTop = nil
	
	PulseTop = LUI.UIImage.new()
	PulseTop.id = "PulseTop"
	PulseTop:SetZRotation( 180, 0 )
	PulseTop:setImage( RegisterMaterial( "hud_hack_bar_frame_pulse" ), 0 )
	PulseTop:SetBlendMode( BLEND_MODE.addWithAlpha )
	PulseTop:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 2.5, _1080p * -2.5, _1080p * 7.44, _1080p * -58.56 )
	self:addElement( PulseTop )
	self.PulseTop = PulseTop
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BarEndCap:RegisterAnimationSequence( "Decrypted", {
			{
				function ()
					return self.BarEndCap:SetAlpha( 0, 0 )
				end
			}
		} )
		HackingText:RegisterAnimationSequence( "Decrypted", {
			{
				function ()
					return self.HackingText:setText( Engine.Localize( "HUD_HACK_COMPLETE" ), 0 )
				end
			},
			{
				function ()
					return self.HackingText:SetRGBFromInt( 13762547, 0 )
				end
			}
		} )
		self._sequences.Decrypted = function ()
			BarEndCap:AnimateSequence( "Decrypted" )
			HackingText:AnimateSequence( "Decrypted" )
		end
		
		FrameMultiply:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.FrameMultiply:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FrameMultiply:SetAlpha( 0, 120 )
				end
			}
		} )
		BarFill:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.BarFill:SetRGBFromInt( 8421504, 0 )
				end,
				function ()
					return self.BarFill:SetRGBFromInt( 16777215, 250, LUI.EASING.outSine )
				end
			}
		} )
		BarEndCap:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.BarEndCap:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BarEndCap:SetAlpha( 0, 250, LUI.EASING.outSine )
				end
			}
		} )
		Bar:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Bar:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Bar:SetAlpha( 0, 250, LUI.EASING.outSine )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Frame:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Frame:SetAlpha( 0, 250 )
				end
			}
		} )
		HackingText:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.HackingText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HackingText:SetAlpha( 0, 250, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.FadeOut = function ()
			FrameMultiply:AnimateSequence( "FadeOut" )
			BarFill:AnimateSequence( "FadeOut" )
			BarEndCap:AnimateSequence( "FadeOut" )
			Bar:AnimateSequence( "FadeOut" )
			Frame:AnimateSequence( "FadeOut" )
			HackingText:AnimateSequence( "FadeOut" )
		end
		
		HackingText:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.HackingText:setText( Engine.Localize( "HUD_LOSING_SIGNAL" ), 0 )
				end
			},
			{
				function ()
					return self.HackingText:SetRGBFromInt( 16740352, 0 )
				end
			},
			{
				function ()
					return self.HackingText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HackingText:SetAlpha( 0, 100 )
				end,
				function ()
					return self.HackingText:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.Warning = function ()
			HackingText:AnimateLoop( "Warning" )
		end
		
		HackingText:RegisterAnimationSequence( "OutOfRange", {
			{
				function ()
					return self.HackingText:setText( Engine.Localize( "HUD_OUT_OF_RANGE" ), 0 )
				end
			},
			{
				function ()
					return self.HackingText:SetRGBFromInt( 16740352, 0 )
				end
			},
			{
				function ()
					return self.HackingText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HackingText:SetAlpha( 0, 250 )
				end,
				function ()
					return self.HackingText:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.OutOfRange = function ()
			HackingText:AnimateLoop( "OutOfRange" )
		end
		
		FrameMultiply:RegisterAnimationSequence( "HackFailed", {
			{
				function ()
					return self.FrameMultiply:SetAlpha( 0, 700 )
				end
			}
		} )
		BarFill:RegisterAnimationSequence( "HackFailed", {
			{
				function ()
					return self.BarFill:SetRGBFromInt( 8421504, 700 )
				end,
				function ()
					return self.BarFill:SetRGBFromInt( 16777215, 500, LUI.EASING.outSine )
				end
			}
		} )
		Bar:RegisterAnimationSequence( "HackFailed", {
			{
				function ()
					return self.Bar:SetAlpha( 1, 700 )
				end,
				function ()
					return self.Bar:SetAlpha( 0, 500, LUI.EASING.outSine )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "HackFailed", {
			{
				function ()
					return self.Frame:SetAlpha( 1, 700 )
				end,
				function ()
					return self.Frame:SetAlpha( 0, 500, LUI.EASING.outSine )
				end
			}
		} )
		HackingText:RegisterAnimationSequence( "HackFailed", {
			{
				function ()
					return self.HackingText:setText( Engine.Localize( "HUD_HACK_FAILED" ), 0 )
				end
			},
			{
				function ()
					return self.HackingText:SetRGBFromInt( 16740352, 0 )
				end
			},
			{
				function ()
					return self.HackingText:SetAlpha( 1, 700 )
				end,
				function ()
					return self.HackingText:SetAlpha( 0, 500, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.HackFailed = function ()
			FrameMultiply:AnimateSequence( "HackFailed" )
			BarFill:AnimateSequence( "HackFailed" )
			Bar:AnimateSequence( "HackFailed" )
			Frame:AnimateSequence( "HackFailed" )
			HackingText:AnimateSequence( "HackFailed" )
		end
		
		HackingText:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.HackingText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.HackingText:SetRGBFromInt( 13762547, 0 )
				end
			},
			{
				function ()
					return self.HackingText:setText( Engine.Localize( "HUD_PROXIMITY_HACK" ), 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			HackingText:AnimateSequence( "Default" )
		end
		
		HackingText:RegisterAnimationSequence( "OutOfRangeHackPaused", {
			{
				function ()
					return self.HackingText:setText( Engine.Localize( "HUD_OUT_OF_RANGE_HACK_PAUSED" ), 0 )
				end
			},
			{
				function ()
					return self.HackingText:SetRGBFromInt( 16740352, 0 )
				end
			},
			{
				function ()
					return self.HackingText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HackingText:SetAlpha( 0, 250 )
				end,
				function ()
					return self.HackingText:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.OutOfRangeHackPaused = function ()
			HackingText:AnimateLoop( "OutOfRangeHackPaused" )
		end
		
		PulseBottom:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.PulseBottom:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PulseBottom:SetAlpha( 0, 500, LUI.EASING.inOutSine )
				end
			},
			{
				function ()
					return self.PulseBottom:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 51.44, _1080p * -39, 0 )
				end,
				function ()
					return self.PulseBottom:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 51.44, _1080p * -14.56, 500, LUI.EASING.inOutSine )
				end
			}
		} )
		PulseTop:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.PulseTop:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PulseTop:SetAlpha( 0, 500, LUI.EASING.inOutSine )
				end
			},
			{
				function ()
					return self.PulseTop:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 32, _1080p * -58.56, 0 )
				end,
				function ()
					return self.PulseTop:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 7.44, _1080p * -58.56, 500, LUI.EASING.inOutSine )
				end
			}
		} )
		self._sequences.Pulse = function ()
			PulseBottom:AnimateLoop( "Pulse" )
			PulseTop:AnimateLoop( "Pulse" )
		end
		
		PulseBottom:RegisterAnimationSequence( "StopPulse", {
			{
				function ()
					return self.PulseBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		PulseTop:RegisterAnimationSequence( "StopPulse", {
			{
				function ()
					return self.PulseTop:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.StopPulse = function ()
			PulseBottom:AnimateSequence( "StopPulse" )
			PulseTop:AnimateSequence( "StopPulse" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f13_local1, controller )
	return self
end

MenuBuilder.registerType( "HackingHud", HackingHud )
LockTable( _M )
