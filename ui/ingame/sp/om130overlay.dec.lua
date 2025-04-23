local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
MIN_EXPONENT = 0.5
MAX_EXPONENT = 2
MIN_STEP = 0.1
MAX_STEP = 0.25
NUM_GAUGE_ELEMENTS = 3
NUM_RETICLE_ELEMENTS = 4
OUT_OF_RANGE_ALPHA_MIN = 0.5
OUT_OF_RANGE_ALPHA_MAX = 1
OUT_OF_RANGE_LERP_TIME = 2500
function InitializeFSparGaugeSettings( f1_arg0 )
	for f1_local0 = 1, NUM_GAUGE_ELEMENTS, 1 do
		f1_arg0.fsparGaugeSettings[f1_local0] = {
			exponent = MIN_EXPONENT + (MAX_EXPONENT - MIN_EXPONENT) * math.random(),
			lastStep = 0,
			currentStep = MIN_STEP + (MAX_STEP - MIN_STEP) * math.random()
		}
		if f1_local0 == 1 then
			f1_arg0.fsparGaugeSettings[f1_local0].element = f1_arg0.FSparBarLeftMask
			f1_arg0.fsparGaugeSettings[f1_local0].parent = f1_arg0.FSparBarLeft
		elseif f1_local0 == 2 then
			f1_arg0.fsparGaugeSettings[f1_local0].element = f1_arg0.FSparBarCenterMask
			f1_arg0.fsparGaugeSettings[f1_local0].parent = f1_arg0.FSparBarCenter
		else
			f1_arg0.fsparGaugeSettings[f1_local0].element = f1_arg0.FSparBarRightMask
			f1_arg0.fsparGaugeSettings[f1_local0].parent = f1_arg0.FSparBarRight
		end
		f1_arg0.fsparGaugeSettings[f1_local0].parent:SetMask( f1_arg0.fsparGaugeSettings[f1_local0].element )
		local f1_local3, f1_local4, f1_local5, f1_local6 = f1_arg0.fsparGaugeSettings[f1_local0].parent:getLocalRect()
		f1_arg0.fsparGaugeSettings[f1_local0].element:SetTop( f1_local6, 0 )
	end
end

function ResetFSparGaugeSettings( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	f2_arg0.fsparGaugeSettings[f2_arg1].exponent = MIN_EXPONENT + (MAX_EXPONENT - MIN_EXPONENT) * math.random()
	f2_arg0.fsparGaugeSettings[f2_arg1].lastStep = LUI.clamp( f2_arg3, 0, 1 )
	if f2_arg2 then
		f2_arg0.fsparGaugeSettings[f2_arg1].currentStep = math.min( f2_arg0.fsparGaugeSettings[f2_arg1].lastStep + MIN_STEP + (MAX_STEP - MIN_STEP) * math.random(), 1 )
	else
		f2_arg0.fsparGaugeSettings[f2_arg1].currentStep = math.max( f2_arg0.fsparGaugeSettings[f2_arg1].lastStep - MIN_STEP + (MAX_STEP - MIN_STEP) * math.random(), 0 )
	end
end

function UpdateFSparGauge( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg0.fsparLastChargeState < f3_arg1
	for f3_local1 = 1, NUM_GAUGE_ELEMENTS, 1 do
		if not (f3_arg1 == f3_arg0.fsparLastChargeState or not f3_local0 or f3_arg0.fsparGaugeSettings[f3_local1].currentStep >= f3_arg1 and f3_arg1 >= f3_arg0.fsparGaugeSettings[f3_local1].lastStep) or not f3_local0 and (f3_arg1 < f3_arg0.fsparGaugeSettings[f3_local1].currentStep or f3_arg0.fsparGaugeSettings[f3_local1].lastStep < f3_arg1) then
			ResetFSparGaugeSettings( f3_arg0, f3_local1, f3_local0, f3_arg1 )
		end
		local f3_local4 = f3_arg0.fsparGaugeSettings[f3_local1].currentStep - f3_arg0.fsparGaugeSettings[f3_local1].lastStep
		if f3_local4 == 0 then
			f3_local4 = MIN_STEP
		end
		local f3_local5 = f3_arg0.fsparGaugeSettings[f3_local1].lastStep + f3_local4 * LUI.clamp( math.pow( math.abs( (f3_arg1 - f3_arg0.fsparGaugeSettings[f3_local1].lastStep) / f3_local4 ), f3_arg0.fsparGaugeSettings[f3_local1].exponent ), 0, 1 )
		if f3_arg1 >= 1 then
			f3_arg0.fsparGaugeSettings[f3_local1].lastStep = 1
			f3_arg0.fsparGaugeSettings[f3_local1].currentStep = 1
		elseif f3_arg1 <= 0 then
			f3_arg0.fsparGaugeSettings[f3_local1].lastStep = 0
			f3_arg0.fsparGaugeSettings[f3_local1].currentStep = 0
			if f3_arg0.fsparLastChargeState >= 1 then
				f3_local5 = 0
			end
		end
		local f3_local6, f3_local7, f3_local8, f3_local9 = f3_arg0.fsparGaugeSettings[f3_local1].parent:getLocalRect()
		f3_arg0.fsparGaugeSettings[f3_local1].element:SetTop( f3_local9 + (f3_local7 - f3_local9) * f3_local5, 0 )
	end
end

function PostLoadFunc( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0.fsparGaugeSettings = {}
	f4_arg0.fsparLastChargeState = 0
	InitializeFSparGaugeSettings( f4_arg0 )
	local f4_local0 = DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetModel( f4_arg1 )
	f4_arg0:SubscribeToModel( f4_local0, function ()
		local f5_local0 = DataModel.GetModelValue( f4_local0 )
		UpdateFSparGauge( f4_arg0, f5_local0 )
		f4_arg0.fsparLastChargeState = f5_local0
	end, true )
	local f4_local1 = DataSources.inGame.SP.heistSpace.olympusMonsOutOfRange:GetModel( f4_arg1 )
	f4_arg0:SubscribeToModel( f4_local1, function ()
		if DataModel.GetModelValue( f4_local1 ) then
			ACTIONS.AnimateSequence( f4_arg0, "OutOfRangeShow" )
		else
			ACTIONS.AnimateSequence( f4_arg0, "OutOfRangeHide" )
		end
	end, true )
	local f4_local2 = f4_arg0:Wait( 16 )
	f4_local2.onComplete = function ()
		ACTIONS.AnimateSequence( f4_arg0, "Connected" )
	end
	
end

function OM130Overlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "OM130Overlay"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local FrameGradient = nil
	
	FrameGradient = LUI.UIImage.new()
	FrameGradient.id = "FrameGradient"
	FrameGradient:SetGlitchEnabled( true )
	FrameGradient:SetGlitchAmount( 1, 0 )
	FrameGradient:SetGlitchBlockWidth( 80, 0 )
	FrameGradient:SetGlitchBlockHeight( 20, 0 )
	FrameGradient:SetGlitchDistortionRange( 32, 0 )
	FrameGradient:SetGlitchScanlinePitch( 1, 0 )
	FrameGradient:SetGlitchMaskPitch( 1, 0 )
	FrameGradient:setImage( RegisterMaterial( "hud_om130_frame_gradient" ), 0 )
	FrameGradient:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( FrameGradient )
	self.FrameGradient = FrameGradient
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetGlitchEnabled( true )
	Frame:SetGlitchAmount( 0.25, 0 )
	Frame:SetGlitchBlockWidth( 50, 0 )
	Frame:SetGlitchBlockHeight( 50, 0 )
	Frame:SetGlitchDistortionRange( 16, 0 )
	Frame:SetGlitchScanlinePitch( 1, 0 )
	Frame:SetGlitchMaskPitch( 1, 0 )
	Frame:setImage( RegisterMaterial( "hud_om130_frame" ), 0 )
	Frame:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( Frame )
	self.Frame = Frame
	
	local FSparRadialGlow = nil
	
	FSparRadialGlow = LUI.UIImage.new()
	FSparRadialGlow.id = "FSparRadialGlow"
	FSparRadialGlow:SetAlpha( 0, 0 )
	FSparRadialGlow:SetZRotation( 60, 0 )
	FSparRadialGlow:SetGlitchEnabled( true )
	FSparRadialGlow:SetGlitchAmount( 0.25, 0 )
	FSparRadialGlow:SetGlitchBlockWidth( 50, 0 )
	FSparRadialGlow:SetGlitchBlockHeight( 50, 0 )
	FSparRadialGlow:SetGlitchDistortionRange( 16, 0 )
	FSparRadialGlow:SetGlitchScanlinePitch( 1, 0 )
	FSparRadialGlow:SetGlitchMaskPitch( 1, 0 )
	FSparRadialGlow:setImage( RegisterMaterial( "hud_om130_reticle_circle_fill_glow" ), 0 )
	FSparRadialGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	FSparRadialGlow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 908, _1080p * -908, _1080p * 488, _1080p * -488 )
	self:addElement( FSparRadialGlow )
	self.FSparRadialGlow = FSparRadialGlow
	
	local FSparRadialCharge = nil
	
	FSparRadialCharge = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 4,
		segmentMaterial = "hud_om130_reticle_circle_fill",
		maskMaterial = "hud_grenade_cook_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f8_local1
	} )
	FSparRadialCharge.id = "FSparRadialCharge"
	FSparRadialCharge:SetGlitchEnabled( true )
	FSparRadialCharge:SetGlitchAmount( 0.25, 0 )
	FSparRadialCharge:SetGlitchBlockWidth( 50, 0 )
	FSparRadialCharge:SetGlitchBlockHeight( 50, 0 )
	FSparRadialCharge:SetGlitchDistortionRange( 16, 0 )
	FSparRadialCharge:SetGlitchScanlinePitch( 1, 0 )
	FSparRadialCharge:SetGlitchMaskPitch( 1, 0 )
	FSparRadialCharge:SetBlendMode( BLEND_MODE.addWithAlpha )
	FSparRadialCharge:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 908, _1080p * -908, _1080p * 488, _1080p * -488 )
	FSparRadialCharge:SubscribeToModel( DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetModel( f8_local1 ), function ()
		local f9_local0 = DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetValue( f8_local1 )
		if f9_local0 ~= nil then
			FSparRadialCharge:SetProgress( f9_local0 )
		end
	end )
	self:addElement( FSparRadialCharge )
	self.FSparRadialCharge = FSparRadialCharge
	
	local ReticleCrosshair = nil
	
	ReticleCrosshair = LUI.UIImage.new()
	ReticleCrosshair.id = "ReticleCrosshair"
	ReticleCrosshair:SetGlitchEnabled( true )
	ReticleCrosshair:SetGlitchAmount( 0.25, 0 )
	ReticleCrosshair:SetGlitchBlockWidth( 50, 0 )
	ReticleCrosshair:SetGlitchBlockHeight( 50, 0 )
	ReticleCrosshair:SetGlitchDistortionRange( 16, 0 )
	ReticleCrosshair:SetGlitchScanlinePitch( 1, 0 )
	ReticleCrosshair:SetGlitchMaskPitch( 1, 0 )
	ReticleCrosshair:setImage( RegisterMaterial( "hud_om130_reticle_crosshair" ), 0 )
	ReticleCrosshair:SetBlendMode( BLEND_MODE.addWithAlpha )
	ReticleCrosshair:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 908, _1080p * -908, _1080p * 488, _1080p * -488 )
	ReticleCrosshair:BindColorToModel( DataSources.inGame.SP.heistSpace.olympusMonsReticleColor:GetModel( f8_local1 ) )
	self:addElement( ReticleCrosshair )
	self.ReticleCrosshair = ReticleCrosshair
	
	local ReticleCircle = nil
	
	ReticleCircle = LUI.UIImage.new()
	ReticleCircle.id = "ReticleCircle"
	ReticleCircle:SetGlitchEnabled( true )
	ReticleCircle:SetGlitchAmount( 0.25, 0 )
	ReticleCircle:SetGlitchBlockWidth( 50, 0 )
	ReticleCircle:SetGlitchBlockHeight( 50, 0 )
	ReticleCircle:SetGlitchDistortionRange( 16, 0 )
	ReticleCircle:SetGlitchScanlinePitch( 1, 0 )
	ReticleCircle:SetGlitchMaskPitch( 1, 0 )
	ReticleCircle:setImage( RegisterMaterial( "hud_om130_reticle_circle" ), 0 )
	ReticleCircle:SetBlendMode( BLEND_MODE.addWithAlpha )
	ReticleCircle:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 908, _1080p * -908, _1080p * 488, _1080p * -488 )
	self:addElement( ReticleCircle )
	self.ReticleCircle = ReticleCircle
	
	local ReticleDot = nil
	
	ReticleDot = LUI.UIImage.new()
	ReticleDot.id = "ReticleDot"
	ReticleDot:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	ReticleDot:SetZRotation( 60, 0 )
	ReticleDot:SetGlitchEnabled( true )
	ReticleDot:SetGlitchAmount( 0.25, 0 )
	ReticleDot:SetGlitchBlockWidth( 50, 0 )
	ReticleDot:SetGlitchBlockHeight( 50, 0 )
	ReticleDot:SetGlitchDistortionRange( 16, 0 )
	ReticleDot:SetGlitchScanlinePitch( 1, 0 )
	ReticleDot:SetGlitchMaskPitch( 1, 0 )
	ReticleDot:setImage( RegisterMaterial( "hud_om130_reticle_dot" ), 0 )
	ReticleDot:SetBlendMode( BLEND_MODE.addWithAlpha )
	ReticleDot:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 957, _1080p * -957, _1080p * 537, _1080p * -537 )
	self:addElement( ReticleDot )
	self.ReticleDot = ReticleDot
	
	local OlympusMonsRadarTargeting = nil
	
	OlympusMonsRadarTargeting = MenuBuilder.BuildRegisteredType( "OlympusMonsRadarTargeting", {
		controllerIndex = f8_local1
	} )
	OlympusMonsRadarTargeting.id = "OlympusMonsRadarTargeting"
	OlympusMonsRadarTargeting:SetRGBFromInt( 16745006, 0 )
	OlympusMonsRadarTargeting:SetScale( -0.63, 0 )
	OlympusMonsRadarTargeting:SetGlitchEnabled( true )
	OlympusMonsRadarTargeting:SetGlitchAmount( 0.25, 0 )
	OlympusMonsRadarTargeting:SetGlitchBlockWidth( 50, 0 )
	OlympusMonsRadarTargeting:SetGlitchBlockHeight( 50, 0 )
	OlympusMonsRadarTargeting:SetGlitchDistortionRange( 16, 0 )
	OlympusMonsRadarTargeting:SetGlitchScanlinePitch( 1, 0 )
	OlympusMonsRadarTargeting:SetGlitchMaskPitch( 1, 0 )
	OlympusMonsRadarTargeting:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 340.2, _1080p * 1420.2 )
	self:addElement( OlympusMonsRadarTargeting )
	self.OlympusMonsRadarTargeting = OlympusMonsRadarTargeting
	
	local FSparBarLeft = nil
	
	FSparBarLeft = LUI.UIImage.new()
	FSparBarLeft.id = "FSparBarLeft"
	FSparBarLeft:SetGlitchEnabled( true )
	FSparBarLeft:SetGlitchAmount( 0.25, 0 )
	FSparBarLeft:SetGlitchBlockWidth( 50, 0 )
	FSparBarLeft:SetGlitchBlockHeight( 50, 0 )
	FSparBarLeft:SetGlitchDistortionRange( 16, 0 )
	FSparBarLeft:SetGlitchScanlinePitch( 1, 0 )
	FSparBarLeft:SetGlitchMaskPitch( 1, 0 )
	FSparBarLeft:setImage( RegisterMaterial( "hud_om130_fspar_bar" ), 0 )
	FSparBarLeft:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1785, _1080p * -125, _1080p * -348.8, _1080p * -79.8 )
	self:addElement( FSparBarLeft )
	self.FSparBarLeft = FSparBarLeft
	
	local FSparBarCenter = nil
	
	FSparBarCenter = LUI.UIImage.new()
	FSparBarCenter.id = "FSparBarCenter"
	FSparBarCenter:SetGlitchEnabled( true )
	FSparBarCenter:SetGlitchAmount( 0.25, 0 )
	FSparBarCenter:SetGlitchBlockWidth( 50, 0 )
	FSparBarCenter:SetGlitchBlockHeight( 50, 0 )
	FSparBarCenter:SetGlitchDistortionRange( 16, 0 )
	FSparBarCenter:SetGlitchScanlinePitch( 1, 0 )
	FSparBarCenter:SetGlitchMaskPitch( 1, 0 )
	FSparBarCenter:setImage( RegisterMaterial( "hud_om130_fspar_bar" ), 0 )
	FSparBarCenter:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1807, _1080p * -103, _1080p * -346.8, _1080p * -77.8 )
	self:addElement( FSparBarCenter )
	self.FSparBarCenter = FSparBarCenter
	
	local FSparBarRight = nil
	
	FSparBarRight = LUI.UIImage.new()
	FSparBarRight.id = "FSparBarRight"
	FSparBarRight:SetGlitchEnabled( true )
	FSparBarRight:SetGlitchAmount( 0.25, 0 )
	FSparBarRight:SetGlitchBlockWidth( 50, 0 )
	FSparBarRight:SetGlitchBlockHeight( 50, 0 )
	FSparBarRight:SetGlitchDistortionRange( 16, 0 )
	FSparBarRight:SetGlitchScanlinePitch( 1, 0 )
	FSparBarRight:SetGlitchMaskPitch( 1, 0 )
	FSparBarRight:setImage( RegisterMaterial( "hud_om130_fspar_bar" ), 0 )
	FSparBarRight:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1829, _1080p * -81, _1080p * -345.8, _1080p * -76.8 )
	self:addElement( FSparBarRight )
	self.FSparBarRight = FSparBarRight
	
	local FSparBarLeftMask = nil
	
	FSparBarLeftMask = LUI.UIImage.new()
	FSparBarLeftMask.id = "FSparBarLeftMask"
	FSparBarLeftMask:setImage( RegisterMaterial( "white_2d_stencil_mask" ), 0 )
	FSparBarLeftMask:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1785, _1080p * -125, _1080p * -348.8, _1080p * -79.8 )
	self:addElement( FSparBarLeftMask )
	self.FSparBarLeftMask = FSparBarLeftMask
	
	local FSparBarCenterMask = nil
	
	FSparBarCenterMask = LUI.UIImage.new()
	FSparBarCenterMask.id = "FSparBarCenterMask"
	FSparBarCenterMask:setImage( RegisterMaterial( "white_2d_stencil_mask" ), 0 )
	FSparBarCenterMask:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1807, _1080p * -103, _1080p * -346.8, _1080p * -77.8 )
	self:addElement( FSparBarCenterMask )
	self.FSparBarCenterMask = FSparBarCenterMask
	
	local FSparBarRightMask = nil
	
	FSparBarRightMask = LUI.UIImage.new()
	FSparBarRightMask.id = "FSparBarRightMask"
	FSparBarRightMask:setImage( RegisterMaterial( "white_2d_stencil_mask" ), 0 )
	FSparBarRightMask:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1829, _1080p * -81, _1080p * -345.8, _1080p * -76.8 )
	self:addElement( FSparBarRightMask )
	self.FSparBarRightMask = FSparBarRightMask
	
	local WeaponsControlsText = nil
	
	WeaponsControlsText = LUI.UIText.new()
	WeaponsControlsText.id = "WeaponsControlsText"
	WeaponsControlsText:SetGlitchEnabled( true )
	WeaponsControlsText:SetGlitchAmount( 0.25, 0 )
	WeaponsControlsText:SetGlitchBlockWidth( 50, 0 )
	WeaponsControlsText:SetGlitchBlockHeight( 50, 0 )
	WeaponsControlsText:SetGlitchDistortionRange( 16, 0 )
	WeaponsControlsText:SetGlitchScanlinePitch( 1, 0 )
	WeaponsControlsText:SetGlitchMaskPitch( 1, 0 )
	WeaponsControlsText:setText( Engine.Localize( "HEIST_WEAPONS_CONTROLS" ), 0 )
	WeaponsControlsText:SetFontSize( 22 * _1080p )
	WeaponsControlsText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	WeaponsControlsText:SetAlignment( LUI.Alignment.Center )
	WeaponsControlsText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 849.5, _1080p * 1070.5, _1080p * 101.5, _1080p * 123.5 )
	self:addElement( WeaponsControlsText )
	self.WeaponsControlsText = WeaponsControlsText
	
	local OlympusMonsText = nil
	
	OlympusMonsText = LUI.UIText.new()
	OlympusMonsText.id = "OlympusMonsText"
	OlympusMonsText:SetRGBFromInt( 16756081, 0 )
	OlympusMonsText:SetGlitchEnabled( true )
	OlympusMonsText:SetGlitchAmount( 0.25, 0 )
	OlympusMonsText:SetGlitchBlockWidth( 50, 0 )
	OlympusMonsText:SetGlitchBlockHeight( 50, 0 )
	OlympusMonsText:SetGlitchDistortionRange( 16, 0 )
	OlympusMonsText:SetGlitchScanlinePitch( 1, 0 )
	OlympusMonsText:SetGlitchMaskPitch( 1, 0 )
	OlympusMonsText:setText( Engine.Localize( "HEIST_OLYMPUS_MONS" ), 0 )
	OlympusMonsText:SetFontSize( 22 * _1080p )
	OlympusMonsText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	OlympusMonsText:SetAlignment( LUI.Alignment.Center )
	OlympusMonsText:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 840.5, _1080p * -845.5, _1080p * 73.5, _1080p * -983.5 )
	self:addElement( OlympusMonsText )
	self.OlympusMonsText = OlympusMonsText
	
	local FsparText = nil
	
	FsparText = LUI.UIText.new()
	FsparText.id = "FsparText"
	FsparText:SetRGBFromInt( 16756081, 0 )
	FsparText:SetXRotation( 8, 0 )
	FsparText:SetZRotation( -4, 0 )
	FsparText:SetGlitchEnabled( true )
	FsparText:SetGlitchAmount( 0.25, 0 )
	FsparText:SetGlitchBlockWidth( 50, 0 )
	FsparText:SetGlitchBlockHeight( 50, 0 )
	FsparText:SetGlitchDistortionRange( 16, 0 )
	FsparText:SetGlitchScanlinePitch( 1, 0 )
	FsparText:SetGlitchMaskPitch( 1, 0 )
	FsparText:setText( Engine.Localize( "HEIST_OM_WEAPONS_FSPAR" ), 0 )
	FsparText:SetFontSize( 24 * _1080p )
	FsparText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	FsparText:SetAlignment( LUI.Alignment.Center )
	FsparText:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1768.5, _1080p * -62.5, _1080p * 697.2, _1080p * -357.8 )
	self:addElement( FsparText )
	self.FsparText = FsparText
	
	local ReadyBG = nil
	
	ReadyBG = LUI.UIImage.new()
	ReadyBG.id = "ReadyBG"
	ReadyBG:SetGlitchEnabled( true )
	ReadyBG:SetGlitchAmount( 0.25, 0 )
	ReadyBG:SetGlitchBlockWidth( 50, 0 )
	ReadyBG:SetGlitchBlockHeight( 50, 0 )
	ReadyBG:SetGlitchDistortionRange( 16, 0 )
	ReadyBG:SetGlitchScanlinePitch( 1, 0 )
	ReadyBG:SetGlitchMaskPitch( 1, 0 )
	ReadyBG:setImage( RegisterMaterial( "hud_om130_ready_bg" ), 0 )
	ReadyBG:SetBlendMode( BLEND_MODE.addWithAlpha )
	ReadyBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1764, _1080p * 1863, _1080p * 665.35, _1080p * 700.35 )
	self:addElement( ReadyBG )
	self.ReadyBG = ReadyBG
	
	local ReadyText = nil
	
	ReadyText = LUI.UIText.new()
	ReadyText.id = "ReadyText"
	ReadyText:SetXRotation( 23, 0 )
	ReadyText:SetZRotation( -4, 0 )
	ReadyText:SetGlitchEnabled( true )
	ReadyText:SetGlitchAmount( 0.25, 0 )
	ReadyText:SetGlitchBlockWidth( 50, 0 )
	ReadyText:SetGlitchBlockHeight( 50, 0 )
	ReadyText:SetGlitchDistortionRange( 16, 0 )
	ReadyText:SetGlitchScanlinePitch( 1, 0 )
	ReadyText:SetGlitchMaskPitch( 1, 0 )
	ReadyText:setText( Engine.Localize( "HEIST_READY" ), 0 )
	ReadyText:SetFontSize( 24 * _1080p )
	ReadyText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ReadyText:SetAlignment( LUI.Alignment.Center )
	ReadyText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1767, _1080p * -60.5, _1080p * 671.5, _1080p * 695.5 )
	self:addElement( ReadyText )
	self.ReadyText = ReadyText
	
	local AText = nil
	
	AText = LUI.UIText.new()
	AText.id = "AText"
	AText:SetRGBFromInt( 16758892, 0 )
	AText:SetZRotation( -3, 0 )
	AText:SetGlitchEnabled( true )
	AText:SetGlitchAmount( 0.25, 0 )
	AText:SetGlitchBlockWidth( 50, 0 )
	AText:SetGlitchBlockHeight( 50, 0 )
	AText:SetGlitchDistortionRange( 16, 0 )
	AText:SetGlitchScanlinePitch( 1, 0 )
	AText:SetGlitchMaskPitch( 1, 0 )
	AText:setText( Engine.Localize( "HEIST_A" ), 0 )
	AText:SetFontSize( 10 * _1080p )
	AText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AText:SetAlignment( LUI.Alignment.Center )
	AText:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1785, _1080p * -124, _1080p * 1001.5, _1080p * -68.5 )
	self:addElement( AText )
	self.AText = AText
	
	local BText = nil
	
	BText = LUI.UIText.new()
	BText.id = "BText"
	BText:SetRGBFromInt( 16758892, 0 )
	BText:SetZRotation( -2, 0 )
	BText:SetGlitchEnabled( true )
	BText:SetGlitchAmount( 0.25, 0 )
	BText:SetGlitchBlockWidth( 50, 0 )
	BText:SetGlitchBlockHeight( 50, 0 )
	BText:SetGlitchDistortionRange( 16, 0 )
	BText:SetGlitchScanlinePitch( 1, 0 )
	BText:SetGlitchMaskPitch( 1, 0 )
	BText:setText( Engine.Localize( "HEIST_B" ), 0 )
	BText:SetFontSize( 10 * _1080p )
	BText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	BText:SetAlignment( LUI.Alignment.Center )
	BText:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1807, _1080p * -102, _1080p * 1002.5, _1080p * -67.5 )
	self:addElement( BText )
	self.BText = BText
	
	local CText = nil
	
	CText = LUI.UIText.new()
	CText.id = "CText"
	CText:SetRGBFromInt( 16758892, 0 )
	CText:SetZRotation( -2, 0 )
	CText:SetGlitchEnabled( true )
	CText:SetGlitchAmount( 0.25, 0 )
	CText:SetGlitchBlockWidth( 50, 0 )
	CText:SetGlitchBlockHeight( 50, 0 )
	CText:SetGlitchDistortionRange( 16, 0 )
	CText:SetGlitchScanlinePitch( 1, 0 )
	CText:SetGlitchMaskPitch( 1, 0 )
	CText:setText( Engine.Localize( "HEIST_C" ), 0 )
	CText:SetFontSize( 10 * _1080p )
	CText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CText:SetAlignment( LUI.Alignment.Center )
	CText:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1829, _1080p * -80, _1080p * 1004.5, _1080p * -65.5 )
	self:addElement( CText )
	self.CText = CText
	
	local DistanceToShipyard = nil
	
	DistanceToShipyard = MenuBuilder.BuildRegisteredType( "OlympusMonsDistanceToShipyard", {
		controllerIndex = f8_local1
	} )
	DistanceToShipyard.id = "DistanceToShipyard"
	DistanceToShipyard:SetXRotation( 15, 0 )
	DistanceToShipyard:SetYRotation( -70, 0 )
	DistanceToShipyard:SetZRotation( -1, 0 )
	DistanceToShipyard:SetGlitchEnabled( true )
	DistanceToShipyard:SetGlitchAmount( 0.25, 0 )
	DistanceToShipyard:SetGlitchBlockWidth( 50, 0 )
	DistanceToShipyard:SetGlitchBlockHeight( 50, 0 )
	DistanceToShipyard:SetGlitchDistortionRange( 16, 0 )
	DistanceToShipyard:SetGlitchScanlinePitch( 1, 0 )
	DistanceToShipyard:SetGlitchMaskPitch( 1, 0 )
	DistanceToShipyard:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -625, _1080p * -60, _1080p * 440, _1080p * -576 )
	self:addElement( DistanceToShipyard )
	self.DistanceToShipyard = DistanceToShipyard
	
	local StatusBG = nil
	
	StatusBG = LUI.UIImage.new()
	StatusBG.id = "StatusBG"
	StatusBG:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	StatusBG:SetAlpha( 0, 0 )
	StatusBG:SetGlitchEnabled( true )
	StatusBG:SetGlitchAmount( 1, 0 )
	StatusBG:SetGlitchBlockWidth( 50, 0 )
	StatusBG:SetGlitchBlockHeight( 25, 0 )
	StatusBG:SetGlitchDistortionRange( 16, 0 )
	StatusBG:SetGlitchScanlinePitch( 1, 0 )
	StatusBG:SetGlitchMaskPitch( 1, 0 )
	StatusBG:setImage( RegisterMaterial( "hud_om130_status_bg" ), 0 )
	StatusBG:SetBlendMode( BLEND_MODE.addWithAlpha )
	StatusBG:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 364, _1080p * -364, _1080p * 476, _1080p * -476 )
	self:addElement( StatusBG )
	self.StatusBG = StatusBG
	
	local StatusText = nil
	
	StatusText = LUI.UIText.new()
	StatusText.id = "StatusText"
	StatusText:SetRGBFromInt( 0, 0 )
	StatusText:SetAlpha( 0, 0 )
	StatusText:SetGlitchEnabled( true )
	StatusText:SetGlitchAmount( 1, 0 )
	StatusText:SetGlitchBlockWidth( 50, 0 )
	StatusText:SetGlitchBlockHeight( 25, 0 )
	StatusText:SetGlitchDistortionRange( 16, 0 )
	StatusText:SetGlitchScanlinePitch( 1, 0 )
	StatusText:SetGlitchMaskPitch( 1, 0 )
	StatusText:setText( Engine.Localize( "HEIST_HUD_CONNECTED" ), 0 )
	StatusText:SetFontSize( 105 * _1080p )
	StatusText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	StatusText:SetAlignment( LUI.Alignment.Center )
	StatusText:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 476, _1080p * -476 )
	self:addElement( StatusText )
	self.StatusText = StatusText
	
	local OutOfRangeText = nil
	
	OutOfRangeText = LUI.UIText.new()
	OutOfRangeText.id = "OutOfRangeText"
	OutOfRangeText:SetRGBFromInt( 16756081, 0 )
	OutOfRangeText:SetAlpha( 0, 0 )
	OutOfRangeText:setText( Engine.Localize( "HEIST_OUT_OF_RANGE" ), 0 )
	OutOfRangeText:SetFontSize( 30 * _1080p )
	OutOfRangeText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	OutOfRangeText:setTextStyle( CoD.TextStyle.Outlined )
	OutOfRangeText:SetAlignment( LUI.Alignment.Center )
	OutOfRangeText:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 700, _1080p * -700, _1080p * 611, _1080p * -438.35 )
	self:addElement( OutOfRangeText )
	self.OutOfRangeText = OutOfRangeText
	
	self._animationSets.DefaultAnimationSet = function ()
		FrameGradient:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FrameGradient:SetGlitchEnabled( false )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Frame:SetGlitchEnabled( false )
				end
			}
		} )
		FSparRadialGlow:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FSparRadialGlow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.FSparRadialGlow:SetGlitchEnabled( false )
				end
			}
		} )
		FSparRadialCharge:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FSparRadialCharge:SetGlitchEnabled( false )
				end
			},
			{
				function ()
					return self.FSparRadialCharge:SetAlpha( 1, 0 )
				end
			}
		} )
		ReticleCrosshair:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ReticleCrosshair:SetGlitchEnabled( false )
				end
			}
		} )
		ReticleCircle:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ReticleCircle:SetGlitchEnabled( false )
				end
			}
		} )
		ReticleDot:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ReticleDot:SetGlitchEnabled( false )
				end
			}
		} )
		OlympusMonsRadarTargeting:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.OlympusMonsRadarTargeting:SetGlitchEnabled( false )
				end
			}
		} )
		FSparBarLeft:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FSparBarLeft:SetGlitchEnabled( false )
				end
			}
		} )
		FSparBarCenter:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FSparBarCenter:SetGlitchEnabled( false )
				end
			}
		} )
		FSparBarRight:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FSparBarRight:SetGlitchEnabled( false )
				end
			}
		} )
		WeaponsControlsText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.WeaponsControlsText:SetGlitchEnabled( false )
				end
			}
		} )
		OlympusMonsText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.OlympusMonsText:SetGlitchEnabled( false )
				end
			}
		} )
		FsparText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FsparText:SetGlitchEnabled( false )
				end
			}
		} )
		ReadyBG:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ReadyBG:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.ReadyBG:SetGlitchEnabled( false )
				end
			}
		} )
		ReadyText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ReadyText:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.ReadyText:SetGlitchEnabled( false )
				end
			}
		} )
		AText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.AText:SetGlitchEnabled( false )
				end
			}
		} )
		BText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BText:SetGlitchEnabled( false )
				end
			}
		} )
		CText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CText:SetGlitchEnabled( false )
				end
			}
		} )
		DistanceToShipyard:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.DistanceToShipyard:SetGlitchEnabled( false )
				end
			}
		} )
		StatusBG:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.StatusBG:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.StatusBG:SetGlitchEnabled( false )
				end
			}
		} )
		StatusText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.StatusText:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.StatusText:SetGlitchEnabled( false )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			FrameGradient:AnimateSequence( "DefaultSequence" )
			Frame:AnimateSequence( "DefaultSequence" )
			FSparRadialGlow:AnimateSequence( "DefaultSequence" )
			FSparRadialCharge:AnimateSequence( "DefaultSequence" )
			ReticleCrosshair:AnimateSequence( "DefaultSequence" )
			ReticleCircle:AnimateSequence( "DefaultSequence" )
			ReticleDot:AnimateSequence( "DefaultSequence" )
			OlympusMonsRadarTargeting:AnimateSequence( "DefaultSequence" )
			FSparBarLeft:AnimateSequence( "DefaultSequence" )
			FSparBarCenter:AnimateSequence( "DefaultSequence" )
			FSparBarRight:AnimateSequence( "DefaultSequence" )
			WeaponsControlsText:AnimateSequence( "DefaultSequence" )
			OlympusMonsText:AnimateSequence( "DefaultSequence" )
			FsparText:AnimateSequence( "DefaultSequence" )
			ReadyBG:AnimateSequence( "DefaultSequence" )
			ReadyText:AnimateSequence( "DefaultSequence" )
			AText:AnimateSequence( "DefaultSequence" )
			BText:AnimateSequence( "DefaultSequence" )
			CText:AnimateSequence( "DefaultSequence" )
			DistanceToShipyard:AnimateSequence( "DefaultSequence" )
			StatusBG:AnimateSequence( "DefaultSequence" )
			StatusText:AnimateSequence( "DefaultSequence" )
		end
		
		FSparRadialGlow:RegisterAnimationSequence( "Charged", {
			{
				function ()
					return self.FSparRadialGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FSparRadialGlow:SetAlpha( 1, 500, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.FSparRadialGlow:SetAlpha( 0, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		FSparRadialCharge:RegisterAnimationSequence( "Charged", {
			{
				function ()
					return self.FSparRadialCharge:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.FSparRadialCharge:SetAlpha( 1, 500, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.FSparRadialCharge:SetAlpha( 0.5, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		ReadyBG:RegisterAnimationSequence( "Charged", {
			{
				function ()
					return self.ReadyBG:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 1, 750 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.75, 10 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.75, 240 )
				end
			}
		} )
		ReadyText:RegisterAnimationSequence( "Charged", {
			{
				function ()
					return self.ReadyText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ReadyText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReadyText:SetAlpha( 1, 740 )
				end,
				function ()
					return self.ReadyText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ReadyText:SetAlpha( 0, 240 )
				end
			}
		} )
		self._sequences.Charged = function ()
			FSparRadialGlow:AnimateLoop( "Charged" )
			FSparRadialCharge:AnimateLoop( "Charged" )
			ReadyBG:AnimateLoop( "Charged" )
			ReadyText:AnimateLoop( "Charged" )
		end
		
		FrameGradient:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.FrameGradient:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.FrameGradient:SetGlitchAmount( 0.75, 250 )
				end,
				function ()
					return self.FrameGradient:SetGlitchAmount( 0, 1250, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.FrameGradient:SetGlitchAmount( 0, 500 )
				end,
				function ()
					return self.FrameGradient:SetGlitchAmount( 0.05, 1000, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.FrameGradient:SetGlitchAmount( 0.05, 1500 )
				end,
				function ()
					return self.FrameGradient:SetGlitchAmount( 0, 1500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.FrameGradient:SetGlitchEnabled( true )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.Frame:SetGlitchEnabled( true )
				end
			}
		} )
		FSparRadialGlow:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.FSparRadialGlow:SetGlitchEnabled( true )
				end
			}
		} )
		FSparRadialCharge:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.FSparRadialCharge:SetGlitchEnabled( true )
				end
			}
		} )
		ReticleCrosshair:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.ReticleCrosshair:SetGlitchEnabled( true )
				end
			}
		} )
		ReticleCircle:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.ReticleCircle:SetGlitchEnabled( true )
				end
			}
		} )
		ReticleDot:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.ReticleDot:SetGlitchEnabled( true )
				end
			}
		} )
		OlympusMonsRadarTargeting:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.OlympusMonsRadarTargeting:SetGlitchEnabled( true )
				end
			}
		} )
		FSparBarLeft:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.FSparBarLeft:SetGlitchEnabled( true )
				end
			}
		} )
		FSparBarCenter:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.FSparBarCenter:SetGlitchEnabled( true )
				end
			}
		} )
		FSparBarRight:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.FSparBarRight:SetGlitchEnabled( true )
				end
			}
		} )
		WeaponsControlsText:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.WeaponsControlsText:SetGlitchEnabled( true )
				end
			}
		} )
		OlympusMonsText:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.OlympusMonsText:SetGlitchEnabled( true )
				end
			}
		} )
		FsparText:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.FsparText:SetGlitchEnabled( true )
				end
			}
		} )
		ReadyBG:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.ReadyBG:SetGlitchEnabled( true )
				end
			}
		} )
		ReadyText:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.ReadyText:SetGlitchEnabled( true )
				end
			}
		} )
		AText:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.AText:SetGlitchEnabled( true )
				end
			}
		} )
		BText:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.BText:SetGlitchEnabled( true )
				end
			}
		} )
		CText:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.CText:SetGlitchEnabled( true )
				end
			}
		} )
		DistanceToShipyard:RegisterAnimationSequence( "Disconnected", {
			{
				function ()
					return self.DistanceToShipyard:SetGlitchEnabled( true )
				end
			}
		} )
		self._sequences.Disconnected = function ()
			FrameGradient:AnimateSequence( "Disconnected" )
			Frame:AnimateSequence( "Disconnected" )
			FSparRadialGlow:AnimateSequence( "Disconnected" )
			FSparRadialCharge:AnimateSequence( "Disconnected" )
			ReticleCrosshair:AnimateSequence( "Disconnected" )
			ReticleCircle:AnimateSequence( "Disconnected" )
			ReticleDot:AnimateSequence( "Disconnected" )
			OlympusMonsRadarTargeting:AnimateSequence( "Disconnected" )
			FSparBarLeft:AnimateSequence( "Disconnected" )
			FSparBarCenter:AnimateSequence( "Disconnected" )
			FSparBarRight:AnimateSequence( "Disconnected" )
			WeaponsControlsText:AnimateSequence( "Disconnected" )
			OlympusMonsText:AnimateSequence( "Disconnected" )
			FsparText:AnimateSequence( "Disconnected" )
			ReadyBG:AnimateSequence( "Disconnected" )
			ReadyText:AnimateSequence( "Disconnected" )
			AText:AnimateSequence( "Disconnected" )
			BText:AnimateSequence( "Disconnected" )
			CText:AnimateSequence( "Disconnected" )
			DistanceToShipyard:AnimateSequence( "Disconnected" )
		end
		
		FrameGradient:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.FrameGradient:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.FrameGradient:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.FrameGradient:SetGlitchAmount( 1, 1000 )
				end,
				function ()
					return self.FrameGradient:SetGlitchAmount( 0, 1000, LUI.EASING.outQuintic )
				end
			},
			{
				function ()
					return self.FrameGradient:SetAlpha( 0, 1000 )
				end
			},
			{
				function ()
					return self.FrameGradient:SetBlendMode( BLEND_MODE.addWithAlpha )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Frame:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Frame:SetAlpha( 0, 1000, LUI.EASING.inOutBack )
				end
			}
		} )
		FSparRadialGlow:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.FSparRadialGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FSparRadialGlow:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		FSparRadialCharge:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.FSparRadialCharge:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FSparRadialCharge:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		ReticleCrosshair:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.ReticleCrosshair:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReticleCrosshair:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		ReticleCircle:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.ReticleCircle:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReticleCircle:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		ReticleDot:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.ReticleDot:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReticleDot:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		OlympusMonsRadarTargeting:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.OlympusMonsRadarTargeting:SetAlpha( 1, 0 )
				end,
				function ()
					return self.OlympusMonsRadarTargeting:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		FSparBarLeft:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.FSparBarLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FSparBarLeft:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		FSparBarCenter:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.FSparBarCenter:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FSparBarCenter:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		FSparBarRight:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.FSparBarRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FSparBarRight:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		WeaponsControlsText:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.WeaponsControlsText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WeaponsControlsText:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		OlympusMonsText:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.OlympusMonsText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.OlympusMonsText:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		FsparText:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.FsparText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FsparText:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		ReadyBG:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.ReadyBG:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		ReadyText:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.ReadyText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ReadyText:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		AText:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.AText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.AText:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		BText:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.BText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BText:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		CText:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.CText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CText:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		DistanceToShipyard:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.DistanceToShipyard:SetAlpha( 1, 0 )
				end,
				function ()
					return self.DistanceToShipyard:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		StatusBG:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.StatusBG:SetAlpha( 0, 0 )
				end,
				function ()
					return self.StatusBG:SetAlpha( 1, 500, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.StatusBG:SetAlpha( 1, 750 )
				end,
				function ()
					return self.StatusBG:SetAlpha( 0, 750, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.StatusBG:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.StatusBG:SetGlitchAmount( 0, 1250 )
				end,
				function ()
					return self.StatusBG:SetGlitchAmount( 1, 250 )
				end
			}
		} )
		StatusText:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.StatusText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.StatusText:SetAlpha( 1, 500, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.StatusText:SetAlpha( 1, 750 )
				end,
				function ()
					return self.StatusText:SetAlpha( 0, 750, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.StatusText:setText( Engine.Localize( "HEIST_HUD_DISCONNECTED" ), 0 )
				end
			},
			{
				function ()
					return self.StatusText:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.StatusText:SetGlitchAmount( 0, 1250 )
				end,
				function ()
					return self.StatusText:SetGlitchAmount( 1, 250 )
				end
			}
		} )
		self._sequences.FadeOut = function ()
			FrameGradient:AnimateSequence( "FadeOut" )
			Frame:AnimateSequence( "FadeOut" )
			FSparRadialGlow:AnimateSequence( "FadeOut" )
			FSparRadialCharge:AnimateSequence( "FadeOut" )
			ReticleCrosshair:AnimateSequence( "FadeOut" )
			ReticleCircle:AnimateSequence( "FadeOut" )
			ReticleDot:AnimateSequence( "FadeOut" )
			OlympusMonsRadarTargeting:AnimateSequence( "FadeOut" )
			FSparBarLeft:AnimateSequence( "FadeOut" )
			FSparBarCenter:AnimateSequence( "FadeOut" )
			FSparBarRight:AnimateSequence( "FadeOut" )
			WeaponsControlsText:AnimateSequence( "FadeOut" )
			OlympusMonsText:AnimateSequence( "FadeOut" )
			FsparText:AnimateSequence( "FadeOut" )
			ReadyBG:AnimateSequence( "FadeOut" )
			ReadyText:AnimateSequence( "FadeOut" )
			AText:AnimateSequence( "FadeOut" )
			BText:AnimateSequence( "FadeOut" )
			CText:AnimateSequence( "FadeOut" )
			DistanceToShipyard:AnimateSequence( "FadeOut" )
			StatusBG:AnimateSequence( "FadeOut" )
			StatusText:AnimateSequence( "FadeOut" )
		end
		
		StatusBG:RegisterAnimationSequence( "Connected", {
			{
				function ()
					return self.StatusBG:SetAlpha( 0, 0 )
				end,
				function ()
					return self.StatusBG:SetAlpha( 1, 500, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.StatusBG:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.StatusBG:SetAlpha( 0, 500, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.StatusBG:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.StatusBG:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 364, _1080p * -364, _1080p * 476, _1080p * -476, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		StatusText:RegisterAnimationSequence( "Connected", {
			{
				function ()
					return self.StatusText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.StatusText:SetAlpha( 1, 500, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.StatusText:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.StatusText:SetAlpha( 0, 500, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.StatusText:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 400, _1080p * -400, 0 )
				end,
				function ()
					return self.StatusText:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 476, _1080p * -476, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		self._sequences.Connected = function ()
			StatusBG:AnimateSequence( "Connected" )
			StatusText:AnimateSequence( "Connected" )
		end
		
		OutOfRangeText:RegisterAnimationSequence( "OutOfRangeShow", {
			{
				function ()
					return self.OutOfRangeText:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.OutOfRangeText:SetAlpha( 1, 1000, LUI.EASING.inOutSine )
				end,
				function ()
					return self.OutOfRangeText:SetAlpha( 0.25, 1000, LUI.EASING.inOutSine )
				end
			}
		} )
		self._sequences.OutOfRangeShow = function ()
			OutOfRangeText:AnimateLoop( "OutOfRangeShow" )
		end
		
		OutOfRangeText:RegisterAnimationSequence( "OutOfRangeHide", {
			{
				function ()
					return self.OutOfRangeText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.OutOfRangeHide = function ()
			OutOfRangeText:AnimateSequence( "OutOfRangeHide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f8_local29 = function ()
		if DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetValue( f8_local1 ) ~= nil and DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetValue( f8_local1 ) >= 1 and DataSources.inGame.SP.heistSpace.olympusMonsOverlay:GetValue( f8_local1 ) ~= nil and DataSources.inGame.SP.heistSpace.olympusMonsOverlay:GetValue( f8_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Charged" )
		end
		if DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetValue( f8_local1 ) ~= nil and DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetValue( f8_local1 ) < 1 and DataSources.inGame.SP.heistSpace.olympusMonsOverlay:GetValue( f8_local1 ) ~= nil and DataSources.inGame.SP.heistSpace.olympusMonsOverlay:GetValue( f8_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "DefaultSequence" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetModel( f8_local1 ), f8_local29 )
	self:SubscribeToModel( DataSources.inGame.SP.heistSpace.olympusMonsOverlay:GetModel( f8_local1 ), f8_local29 )
	self:SubscribeToModel( DataSources.inGame.SP.heistSpace.olympusMonsOverlay:GetModel( f8_local1 ), function ()
		if DataSources.inGame.SP.heistSpace.olympusMonsOverlay:GetValue( f8_local1 ) ~= nil and DataSources.inGame.SP.heistSpace.olympusMonsOverlay:GetValue( f8_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Disconnected" )
		end
		if DataSources.inGame.SP.heistSpace.olympusMonsOverlay:GetValue( f8_local1 ) ~= nil and DataSources.inGame.SP.heistSpace.olympusMonsOverlay:GetValue( f8_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "FadeOut" )
		end
	end )
	PostLoadFunc( self, f8_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "OM130Overlay", OM130Overlay )
LockTable( _M )
