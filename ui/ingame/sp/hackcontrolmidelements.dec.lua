local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "bootup_anim", function ()
		ACTIONS.AnimateSequence( f1_arg0, "BootUp" )
	end )
end

function HackControlMidElements( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HackControlMidElements"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BottomRightMeter = nil
	
	BottomRightMeter = LUI.UIImage.new()
	BottomRightMeter.id = "BottomRightMeter"
	BottomRightMeter:setImage( RegisterMaterial( "hud_robot_hack_bottom_right_meter" ), 0 )
	BottomRightMeter:SetBlendMode( BLEND_MODE.addWithAlpha )
	BottomRightMeter:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -476, _1080p * -172, _1080p * -324, _1080p * -92 )
	self:addElement( BottomRightMeter )
	self.BottomRightMeter = BottomRightMeter
	
	local TopRightMeter = nil
	
	TopRightMeter = LUI.UIImage.new()
	TopRightMeter.id = "TopRightMeter"
	TopRightMeter:setImage( RegisterMaterial( "hud_robot_hack_top_right_meter" ), 0 )
	TopRightMeter:SetBlendMode( BLEND_MODE.addWithAlpha )
	TopRightMeter:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -448, _1080p * -240, _1080p * 140, _1080p * 408 )
	self:addElement( TopRightMeter )
	self.TopRightMeter = TopRightMeter
	
	local MidLinesBottom = nil
	
	MidLinesBottom = LUI.UIImage.new()
	MidLinesBottom.id = "MidLinesBottom"
	MidLinesBottom:SetAlpha( 0.8, 0 )
	MidLinesBottom:SetZRotation( 180, 0 )
	MidLinesBottom:setImage( RegisterMaterial( "hud_robot_hack_lines_middle" ), 0 )
	MidLinesBottom:SetBlendMode( BLEND_MODE.addWithAlpha )
	MidLinesBottom:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -660, _1080p * 660, _1080p * -313, _1080p * -185 )
	self:addElement( MidLinesBottom )
	self.MidLinesBottom = MidLinesBottom
	
	local MidLinesTop = nil
	
	MidLinesTop = LUI.UIImage.new()
	MidLinesTop.id = "MidLinesTop"
	MidLinesTop:SetAlpha( 0.8, 0 )
	MidLinesTop:setImage( RegisterMaterial( "hud_robot_hack_lines_middle" ), 0 )
	MidLinesTop:SetBlendMode( BLEND_MODE.addWithAlpha )
	MidLinesTop:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -660, _1080p * 660, _1080p * 185, _1080p * 313 )
	self:addElement( MidLinesTop )
	self.MidLinesTop = MidLinesTop
	
	local SideBracketRight = nil
	
	SideBracketRight = LUI.UIImage.new()
	SideBracketRight.id = "SideBracketRight"
	SideBracketRight:setImage( RegisterMaterial( "hud_robot_hack_side_bracket" ), 0 )
	SideBracketRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	SideBracketRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -232, _1080p * -60, _1080p * -400, _1080p * 400 )
	self:addElement( SideBracketRight )
	self.SideBracketRight = SideBracketRight
	
	local SideBracketLeft = nil
	
	SideBracketLeft = LUI.UIImage.new()
	SideBracketLeft.id = "SideBracketLeft"
	SideBracketLeft:SetZRotation( 180, 0 )
	SideBracketLeft:setImage( RegisterMaterial( "hud_robot_hack_side_bracket" ), 0 )
	SideBracketLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	SideBracketLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 60, _1080p * 232, _1080p * -400, _1080p * 400 )
	self:addElement( SideBracketLeft )
	self.SideBracketLeft = SideBracketLeft
	
	local AudioDup = nil
	
	AudioDup = LUI.UIImage.new()
	AudioDup.id = "AudioDup"
	AudioDup:SetRGBFromInt( 11033088, 0 )
	AudioDup:SetAlpha( 0.2, 0 )
	AudioDup:SetGlitchEnabled( true )
	AudioDup:SetGlitchAmount( 0, 0 )
	AudioDup:SetGlitchBlockWidth( 50, 0 )
	AudioDup:SetGlitchBlockHeight( 50, 0 )
	AudioDup:SetGlitchDistortionRange( 16, 0 )
	AudioDup:SetGlitchScanlinePitch( 1, 0 )
	AudioDup:SetGlitchMaskPitch( 1, 0 )
	AudioDup:setImage( RegisterMaterial( "wdg_commander_audio" ), 0 )
	AudioDup:SetBlendMode( BLEND_MODE.addWithAlpha )
	AudioDup:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -469, _1080p * -200, _1080p * -286, _1080p * -199 )
	self:addElement( AudioDup )
	self.AudioDup = AudioDup
	
	local Audio = nil
	
	Audio = LUI.UIImage.new()
	Audio.id = "Audio"
	Audio:SetRGBFromInt( 16746752, 0 )
	Audio:SetAlpha( 0.6, 0 )
	Audio:SetGlitchEnabled( true )
	Audio:SetGlitchAmount( 0, 0 )
	Audio:SetGlitchBlockWidth( 50, 0 )
	Audio:SetGlitchBlockHeight( 50, 0 )
	Audio:SetGlitchDistortionRange( 16, 0 )
	Audio:SetGlitchScanlinePitch( 1, 0 )
	Audio:SetGlitchMaskPitch( 1, 0 )
	Audio:setImage( RegisterMaterial( "wdg_commander_audio" ), 0 )
	Audio:SetBlendMode( BLEND_MODE.addWithAlpha )
	Audio:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -456, _1080p * -187, _1080p * -280, _1080p * -193 )
	self:addElement( Audio )
	self.Audio = Audio
	
	local ScanLine = nil
	
	ScanLine = LUI.UIImage.new()
	ScanLine.id = "ScanLine"
	ScanLine:SetAlpha( 0.1, 0 )
	ScanLine:setImage( RegisterMaterial( "hud_glow" ), 0 )
	ScanLine:SetBlendMode( BLEND_MODE.addWithAlpha )
	ScanLine:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -2000, _1080p * 2000, 0, _1080p * 8 )
	self:addElement( ScanLine )
	self.ScanLine = ScanLine
	
	local Meter1Dup = nil
	
	Meter1Dup = LUI.UIImage.new()
	Meter1Dup.id = "Meter1Dup"
	Meter1Dup:SetRGBFromInt( 11033088, 0 )
	Meter1Dup:SetAlpha( 0.2, 0 )
	Meter1Dup:setImage( RegisterMaterial( "hud_robot_hack_meter" ), 0 )
	Meter1Dup:SetUMax( 0.33, 0 )
	Meter1Dup:SetBlendMode( BLEND_MODE.addWithAlpha )
	Meter1Dup:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -412.5, _1080p * -235, _1080p * 314.01, _1080p * 334.01 )
	self:addElement( Meter1Dup )
	self.Meter1Dup = Meter1Dup
	
	local Meter1 = nil
	
	Meter1 = LUI.UIImage.new()
	Meter1.id = "Meter1"
	Meter1:SetRGBFromInt( 16746752, 0 )
	Meter1:SetAlpha( 0.6, 0 )
	Meter1:setImage( RegisterMaterial( "hud_robot_hack_meter" ), 0 )
	Meter1:SetUMax( 0.33, 0 )
	Meter1:SetBlendMode( BLEND_MODE.addWithAlpha )
	Meter1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -409.5, _1080p * -232, _1080p * 306.01, _1080p * 326.01 )
	self:addElement( Meter1 )
	self.Meter1 = Meter1
	
	local Meter3Dup = nil
	
	Meter3Dup = LUI.UIImage.new()
	Meter3Dup.id = "Meter3Dup"
	Meter3Dup:SetRGBFromInt( 11033088, 0 )
	Meter3Dup:SetAlpha( 0.2, 0 )
	Meter3Dup:setImage( RegisterMaterial( "hud_robot_hack_meter" ), 0 )
	Meter3Dup:SetUMin( 0.33, 0 )
	Meter3Dup:SetUMax( 0.66, 0 )
	Meter3Dup:SetBlendMode( BLEND_MODE.addWithAlpha )
	Meter3Dup:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -412.5, _1080p * -235, _1080p * 381.01, _1080p * 401.01 )
	self:addElement( Meter3Dup )
	self.Meter3Dup = Meter3Dup
	
	local Meter3 = nil
	
	Meter3 = LUI.UIImage.new()
	Meter3.id = "Meter3"
	Meter3:SetRGBFromInt( 16746752, 0 )
	Meter3:SetAlpha( 0.6, 0 )
	Meter3:setImage( RegisterMaterial( "hud_robot_hack_meter" ), 0 )
	Meter3:SetUMin( 0.33, 0 )
	Meter3:SetUMax( 0.66, 0 )
	Meter3:SetBlendMode( BLEND_MODE.addWithAlpha )
	Meter3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -409.5, _1080p * -232, _1080p * 373.01, _1080p * 393.01 )
	self:addElement( Meter3 )
	self.Meter3 = Meter3
	
	local Meter2Dup = nil
	
	Meter2Dup = LUI.UIImage.new()
	Meter2Dup.id = "Meter2Dup"
	Meter2Dup:SetRGBFromInt( 11033088, 0 )
	Meter2Dup:SetAlpha( 0.2, 0 )
	Meter2Dup:setImage( RegisterMaterial( "hud_robot_hack_meter" ), 0 )
	Meter2Dup:SetUMin( 0.66, 0 )
	Meter2Dup:SetBlendMode( BLEND_MODE.addWithAlpha )
	Meter2Dup:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -412.5, _1080p * -235, _1080p * 347.01, _1080p * 367.01 )
	self:addElement( Meter2Dup )
	self.Meter2Dup = Meter2Dup
	
	local Meter2 = nil
	
	Meter2 = LUI.UIImage.new()
	Meter2.id = "Meter2"
	Meter2:SetRGBFromInt( 16746752, 0 )
	Meter2:SetAlpha( 0.6, 0 )
	Meter2:setImage( RegisterMaterial( "hud_robot_hack_meter" ), 0 )
	Meter2:SetUMin( 0.66, 0 )
	Meter2:SetBlendMode( BLEND_MODE.addWithAlpha )
	Meter2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -409.5, _1080p * -232, _1080p * 339.01, _1080p * 359.01 )
	self:addElement( Meter2 )
	self.Meter2 = Meter2
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BottomRightMeter:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.BottomRightMeter:SetAlpha( 0, 0 )
				end
			}
		} )
		TopRightMeter:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.TopRightMeter:SetAlpha( 0, 0 )
				end
			}
		} )
		MidLinesBottom:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.MidLinesBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		MidLinesTop:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.MidLinesTop:SetAlpha( 0, 0 )
				end
			}
		} )
		SideBracketRight:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.SideBracketRight:SetAlpha( 0, 0 )
				end
			}
		} )
		SideBracketLeft:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.SideBracketLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		AudioDup:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.AudioDup:SetAlpha( 0, 0 )
				end
			}
		} )
		Audio:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Audio:SetAlpha( 0, 0 )
				end
			}
		} )
		ScanLine:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.ScanLine:SetAlpha( 0, 0 )
				end
			}
		} )
		Meter1Dup:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Meter1Dup:SetAlpha( 0, 0 )
				end
			}
		} )
		Meter1:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Meter1:SetAlpha( 0, 0 )
				end
			}
		} )
		Meter3Dup:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Meter3Dup:SetAlpha( 0, 0 )
				end
			}
		} )
		Meter3:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Meter3:SetAlpha( 0, 0 )
				end
			}
		} )
		Meter2Dup:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Meter2Dup:SetAlpha( 0, 0 )
				end
			}
		} )
		Meter2:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Meter2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Off = function ()
			BottomRightMeter:AnimateSequence( "Off" )
			TopRightMeter:AnimateSequence( "Off" )
			MidLinesBottom:AnimateSequence( "Off" )
			MidLinesTop:AnimateSequence( "Off" )
			SideBracketRight:AnimateSequence( "Off" )
			SideBracketLeft:AnimateSequence( "Off" )
			AudioDup:AnimateSequence( "Off" )
			Audio:AnimateSequence( "Off" )
			ScanLine:AnimateSequence( "Off" )
			Meter1Dup:AnimateSequence( "Off" )
			Meter1:AnimateSequence( "Off" )
			Meter3Dup:AnimateSequence( "Off" )
			Meter3:AnimateSequence( "Off" )
			Meter2Dup:AnimateSequence( "Off" )
			Meter2:AnimateSequence( "Off" )
		end
		
		BottomRightMeter:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.BottomRightMeter:SetAlpha( 0, 560 )
				end,
				function ()
					return self.BottomRightMeter:SetAlpha( 0.5, 20 )
				end,
				function ()
					return self.BottomRightMeter:SetAlpha( 0, 20 )
				end,
				function ()
					return self.BottomRightMeter:SetAlpha( 0.5, 20 )
				end,
				function ()
					return self.BottomRightMeter:SetAlpha( 0, 20 )
				end,
				function ()
					return self.BottomRightMeter:SetAlpha( 0.5, 20 )
				end
			}
		} )
		TopRightMeter:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.TopRightMeter:SetAlpha( 0, 560 )
				end,
				function ()
					return self.TopRightMeter:SetAlpha( 0.5, 20 )
				end,
				function ()
					return self.TopRightMeter:SetAlpha( 0, 20 )
				end,
				function ()
					return self.TopRightMeter:SetAlpha( 0.5, 20 )
				end,
				function ()
					return self.TopRightMeter:SetAlpha( 0, 20 )
				end,
				function ()
					return self.TopRightMeter:SetAlpha( 0.5, 20 )
				end
			}
		} )
		MidLinesBottom:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.MidLinesBottom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MidLinesBottom:SetAlpha( 0, 240 )
				end,
				function ()
					return self.MidLinesBottom:SetAlpha( 0.4, 10 )
				end
			},
			{
				function ()
					return self.MidLinesBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -660, _1080p * 660, _1080p * 265, _1080p * 269, 250 )
				end,
				function ()
					return self.MidLinesBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -660, _1080p * 660, _1080p * 227, _1080p * 355, 199 )
				end
			}
		} )
		MidLinesTop:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.MidLinesTop:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MidLinesTop:SetAlpha( 0, 240 )
				end,
				function ()
					return self.MidLinesTop:SetAlpha( 0.4, 10 )
				end
			},
			{
				function ()
					return self.MidLinesTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -660, _1080p * 660, _1080p * -268, _1080p * -264, 250 )
				end,
				function ()
					return self.MidLinesTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -660, _1080p * 660, _1080p * -355, _1080p * -227, 199 )
				end
			}
		} )
		SideBracketRight:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.SideBracketRight:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.SideBracketRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 18, _1080p * 190, _1080p * -400, _1080p * 400, 0 )
				end,
				function ()
					return self.SideBracketRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -232, _1080p * -60, _1080p * -400, _1080p * 400, 150 )
				end
			}
		} )
		SideBracketLeft:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.SideBracketLeft:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.SideBracketLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -190, _1080p * -18, _1080p * -400, _1080p * 400, 0 )
				end,
				function ()
					return self.SideBracketLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 60, _1080p * 232, _1080p * -400, _1080p * 400, 150 )
				end
			}
		} )
		AudioDup:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.AudioDup:SetAlpha( 0, 560 )
				end,
				function ()
					return self.AudioDup:SetAlpha( 0.2, 20 )
				end,
				function ()
					return self.AudioDup:SetAlpha( 0, 20 )
				end,
				function ()
					return self.AudioDup:SetAlpha( 0.2, 20 )
				end,
				function ()
					return self.AudioDup:SetAlpha( 0, 20 )
				end,
				function ()
					return self.AudioDup:SetAlpha( 0.2, 20 )
				end
			}
		} )
		Audio:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Audio:SetAlpha( 0, 560 )
				end,
				function ()
					return self.Audio:SetAlpha( 0.4, 20 )
				end,
				function ()
					return self.Audio:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Audio:SetAlpha( 0.4, 20 )
				end,
				function ()
					return self.Audio:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Audio:SetAlpha( 0.4, 20 )
				end
			}
		} )
		ScanLine:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ScanLine:SetAlpha( 0.1, 0 )
				end
			}
		} )
		Meter1Dup:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Meter1Dup:SetAlpha( 0, 560 )
				end,
				function ()
					return self.Meter1Dup:SetAlpha( 0.2, 20 )
				end,
				function ()
					return self.Meter1Dup:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Meter1Dup:SetAlpha( 0.2, 20 )
				end,
				function ()
					return self.Meter1Dup:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Meter1Dup:SetAlpha( 0.2, 20 )
				end
			}
		} )
		Meter1:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Meter1:SetAlpha( 0, 560 )
				end,
				function ()
					return self.Meter1:SetAlpha( 0.4, 20 )
				end,
				function ()
					return self.Meter1:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Meter1:SetAlpha( 0.4, 20 )
				end,
				function ()
					return self.Meter1:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Meter1:SetAlpha( 0.4, 20 )
				end
			}
		} )
		Meter3Dup:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Meter3Dup:SetAlpha( 0, 560 )
				end,
				function ()
					return self.Meter3Dup:SetAlpha( 0.2, 20 )
				end,
				function ()
					return self.Meter3Dup:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Meter3Dup:SetAlpha( 0.2, 20 )
				end,
				function ()
					return self.Meter3Dup:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Meter3Dup:SetAlpha( 0.2, 20 )
				end
			}
		} )
		Meter3:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Meter3:SetAlpha( 0, 560 )
				end,
				function ()
					return self.Meter3:SetAlpha( 0.4, 20 )
				end,
				function ()
					return self.Meter3:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Meter3:SetAlpha( 0.4, 20 )
				end,
				function ()
					return self.Meter3:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Meter3:SetAlpha( 0.4, 20 )
				end
			}
		} )
		Meter2Dup:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Meter2Dup:SetAlpha( 0, 560 )
				end,
				function ()
					return self.Meter2Dup:SetAlpha( 0.2, 20 )
				end,
				function ()
					return self.Meter2Dup:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Meter2Dup:SetAlpha( 0.2, 20 )
				end,
				function ()
					return self.Meter2Dup:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Meter2Dup:SetAlpha( 0.2, 20 )
				end
			}
		} )
		Meter2:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Meter2:SetAlpha( 0, 560 )
				end,
				function ()
					return self.Meter2:SetAlpha( 0.4, 20 )
				end,
				function ()
					return self.Meter2:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Meter2:SetAlpha( 0.4, 20 )
				end,
				function ()
					return self.Meter2:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Meter2:SetAlpha( 0.4, 20 )
				end
			}
		} )
		self._sequences.BootUp = function ()
			BottomRightMeter:AnimateSequence( "BootUp" )
			TopRightMeter:AnimateSequence( "BootUp" )
			MidLinesBottom:AnimateSequence( "BootUp" )
			MidLinesTop:AnimateSequence( "BootUp" )
			SideBracketRight:AnimateSequence( "BootUp" )
			SideBracketLeft:AnimateSequence( "BootUp" )
			AudioDup:AnimateSequence( "BootUp" )
			Audio:AnimateSequence( "BootUp" )
			ScanLine:AnimateSequence( "BootUp" )
			Meter1Dup:AnimateSequence( "BootUp" )
			Meter1:AnimateSequence( "BootUp" )
			Meter3Dup:AnimateSequence( "BootUp" )
			Meter3:AnimateSequence( "BootUp" )
			Meter2Dup:AnimateSequence( "BootUp" )
			Meter2:AnimateSequence( "BootUp" )
		end
		
		BottomRightMeter:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.BottomRightMeter:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.BottomRightMeter:SetAlpha( 0, 150 )
				end
			}
		} )
		TopRightMeter:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.TopRightMeter:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.TopRightMeter:SetAlpha( 0, 150 )
				end
			}
		} )
		MidLinesBottom:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.MidLinesBottom:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.MidLinesBottom:SetAlpha( 0, 150 )
				end
			}
		} )
		MidLinesTop:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.MidLinesTop:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.MidLinesTop:SetAlpha( 0, 150 )
				end
			}
		} )
		SideBracketRight:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.SideBracketRight:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.SideBracketRight:SetAlpha( 0, 150 )
				end
			}
		} )
		SideBracketLeft:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.SideBracketLeft:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.SideBracketLeft:SetAlpha( 0, 150 )
				end
			}
		} )
		Audio:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Audio:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.Audio:SetAlpha( 0, 150 )
				end
			}
		} )
		ScanLine:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.ScanLine:SetAlpha( 0, 0 )
				end
			}
		} )
		Meter1Dup:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Meter1Dup:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Meter1Dup:SetAlpha( 0, 150 )
				end
			}
		} )
		Meter1:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Meter1:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Meter1:SetAlpha( 0, 150 )
				end
			}
		} )
		Meter3Dup:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Meter3Dup:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Meter3Dup:SetAlpha( 0, 150 )
				end
			}
		} )
		Meter3:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Meter3:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Meter3:SetAlpha( 0, 150 )
				end
			}
		} )
		Meter2Dup:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Meter2Dup:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Meter2Dup:SetAlpha( 0, 150 )
				end
			}
		} )
		Meter2:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Meter2:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Meter2:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.Outro = function ()
			BottomRightMeter:AnimateSequence( "Outro" )
			TopRightMeter:AnimateSequence( "Outro" )
			MidLinesBottom:AnimateSequence( "Outro" )
			MidLinesTop:AnimateSequence( "Outro" )
			SideBracketRight:AnimateSequence( "Outro" )
			SideBracketLeft:AnimateSequence( "Outro" )
			Audio:AnimateSequence( "Outro" )
			ScanLine:AnimateSequence( "Outro" )
			Meter1Dup:AnimateSequence( "Outro" )
			Meter1:AnimateSequence( "Outro" )
			Meter3Dup:AnimateSequence( "Outro" )
			Meter3:AnimateSequence( "Outro" )
			Meter2Dup:AnimateSequence( "Outro" )
			Meter2:AnimateSequence( "Outro" )
		end
		
		ScanLine:RegisterAnimationSequence( "ScanLoop", {
			{
				function ()
					return self.ScanLine:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -2000, _1080p * 2000, 0, _1080p * 8, 0 )
				end,
				function ()
					return self.ScanLine:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -2000, _1080p * 2000, _1080p * -1088, _1080p * -1080, 2000 )
				end,
				function ()
					return self.ScanLine:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -2000, _1080p * 2000, _1080p * -1088, _1080p * -1080, 3000 )
				end
			}
		} )
		self._sequences.ScanLoop = function ()
			ScanLine:AnimateLoop( "ScanLoop" )
		end
		
		Meter1Dup:RegisterAnimationSequence( "MeterLoop", {
			{
				function ()
					return self.Meter1Dup:SetUMin( 0, 0 )
				end,
				function ()
					return self.Meter1Dup:SetUMin( 1, 10000 )
				end
			},
			{
				function ()
					return self.Meter1Dup:SetUMax( 0.33, 0 )
				end,
				function ()
					return self.Meter1Dup:SetUMax( 1.33, 10000 )
				end
			}
		} )
		Meter1:RegisterAnimationSequence( "MeterLoop", {
			{
				function ()
					return self.Meter1:SetUMin( 0, 0 )
				end,
				function ()
					return self.Meter1:SetUMin( 1, 10000 )
				end
			},
			{
				function ()
					return self.Meter1:SetUMax( 0.33, 0 )
				end,
				function ()
					return self.Meter1:SetUMax( 1.33, 10000 )
				end
			}
		} )
		Meter3Dup:RegisterAnimationSequence( "MeterLoop", {
			{
				function ()
					return self.Meter3Dup:SetUMin( 0.33, 0 )
				end,
				function ()
					return self.Meter3Dup:SetUMin( 1.33, 10000 )
				end
			},
			{
				function ()
					return self.Meter3Dup:SetUMax( 0.66, 0 )
				end,
				function ()
					return self.Meter3Dup:SetUMax( 1.66, 10000 )
				end
			}
		} )
		Meter3:RegisterAnimationSequence( "MeterLoop", {
			{
				function ()
					return self.Meter3:SetUMin( 0.33, 0 )
				end,
				function ()
					return self.Meter3:SetUMin( 1.33, 10000 )
				end
			},
			{
				function ()
					return self.Meter3:SetUMax( 0.66, 0 )
				end,
				function ()
					return self.Meter3:SetUMax( 1.66, 10000 )
				end
			}
		} )
		Meter2Dup:RegisterAnimationSequence( "MeterLoop", {
			{
				function ()
					return self.Meter2Dup:SetUMin( 0.66, 0 )
				end,
				function ()
					return self.Meter2Dup:SetUMin( 1.66, 10000 )
				end
			},
			{
				function ()
					return self.Meter2Dup:SetUMax( 1, 0 )
				end,
				function ()
					return self.Meter2Dup:SetUMax( 2, 10000 )
				end
			}
		} )
		Meter2:RegisterAnimationSequence( "MeterLoop", {
			{
				function ()
					return self.Meter2:SetUMin( 0.66, 0 )
				end,
				function ()
					return self.Meter2:SetUMin( 1.66, 10000 )
				end
			},
			{
				function ()
					return self.Meter2:SetUMax( 1, 0 )
				end,
				function ()
					return self.Meter2:SetUMax( 2, 10000 )
				end
			}
		} )
		self._sequences.MeterLoop = function ()
			Meter1Dup:AnimateLoop( "MeterLoop" )
			Meter1:AnimateLoop( "MeterLoop" )
			Meter3Dup:AnimateLoop( "MeterLoop" )
			Meter3:AnimateLoop( "MeterLoop" )
			Meter2Dup:AnimateLoop( "MeterLoop" )
			Meter2:AnimateLoop( "MeterLoop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.hackControlOutro:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.hackControlOutro:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.hackControlOutro:GetValue( f3_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Outro" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Off" )
	ACTIONS.AnimateSequence( self, "ScanLoop" )
	ACTIONS.AnimateSequence( self, "MeterLoop" )
	return self
end

MenuBuilder.registerType( "HackControlMidElements", HackControlMidElements )
LockTable( _M )
