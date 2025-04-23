local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
INTEL_STATE = {
	MINIMIZE = 0,
	REMIND = 1,
	PROGRESS = 2,
	COMPLETE_TIER = 3
}
function SetFractionText( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.FractionText:setText( Engine.Localize( "HUD_FRACTION", f1_arg1, f1_arg2 ) )
end

function SetDescriptionText( f2_arg0, f2_arg1 )
	f2_arg0.DescriptionText:setText( f2_arg1 )
end

function SetTierIcon( f3_arg0, f3_arg1 )
	f3_arg0.MarkerLarge:setImage( RegisterMaterial( MissionDirector.GetActiveMissionTeamTierIcon( f3_arg0._controllerIndex, f3_arg1 ) ) )
end

function GetTierCompletionText( f4_arg0 )
	if f4_arg0 == 1 then
		return "HUD_BRONZE_HONORS"
	elseif f4_arg0 == 2 then
		return "HUD_SILVER_HONORS"
	elseif f4_arg0 == 3 then
		return "HUD_GOLD_HONORS"
	else
		return "HUD_MISSION_COMPLETE"
	end
end

function GetTierCompletionSound( f5_arg0 )
	if f5_arg0 == 3 then
		return "ui_iw7_mission_complete_gold_slam"
	else
		return "ui_iw7_mission_complete_slam"
	end
end

function GetCurrentTarget( f6_arg0 )
	assert( f6_arg0._id >= 0 )
	local f6_local0 = f6_arg0._tierDataSource:GetValue( f6_arg0._controllerIndex )
	assert( f6_local0 >= 0 )
	assert( f6_local0 <= 4 )
	f6_local0 = math.min( f6_local0, 3 )
	local f6_local1 = CSV.intelChallenges
	local f6_local2 = tonumber( Engine.TableLookup( f6_local1.file, f6_local1.cols.id, f6_arg0._id, f6_local1.cols.target1 + f6_local0 * 2 ) )
	assert( f6_local2 )
	return f6_local2
end

function GetCurrentDescription( f7_arg0 )
	assert( f7_arg0._id >= 0 )
	local f7_local0 = GetCurrentTarget( f7_arg0 )
	local f7_local1 = CSV.intelChallenges
	if f7_local0 == 1 then
		return Engine.Localize( Engine.TableLookup( f7_local1.file, f7_local1.cols.id, f7_arg0._id, f7_local1.cols.uiSingularDesc ) )
	else
		return Engine.Localize( Engine.TableLookup( f7_local1.file, f7_local1.cols.id, f7_arg0._id, f7_local1.cols.uiPluralDesc ), f7_local0 )
	end
end

function AnimateProgress( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
	local f8_local0 = f8_arg1
	local f8_local1 = f8_arg2 - f8_arg1
	if 0 < f8_arg4 and f8_local1 ~= 0 then
		local f8_local2 = nil
		local f8_local3 = function ()
			local f9_local0 = f8_arg0:Wait( f8_arg4 / math.abs( f8_local1 ) )
			f9_local0.onComplete = function ()
				f8_local0 = f8_local0 + f8_local1 / math.abs( f8_local1 )
				SetFractionText( f8_arg0, f8_local0, f8_arg3 )
				if f8_local0 ~= f8_arg2 then
					f8_local2()
				end
			end
			
		end
		
		f8_local3()
	else
		SetFractionText( f8_arg0, f8_arg2, f8_arg3 )
	end
	local f8_local2 = LUI.clamp( f8_arg1 / f8_arg3, 0, 1 )
	local f8_local3 = LUI.clamp( f8_arg2 / f8_arg3, 0, 1 )
	f8_arg0.ProgressBar.Fill:SetRightAnchor( 1 - f8_local2 )
	f8_arg0.ProgressBar.Fill:SetRightAnchor( 1 - f8_local3, f8_arg4, LUI.EASING.inOutQuadratic )
end

function UpdateProgress( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	local f11_local0 = 400
	local f11_local1 = 1500
	AnimateProgress( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_local0 )
	local f11_local2 = f11_arg0:Wait( f11_local0 + f11_local1 )
	f11_local2.onComplete = function ()
		f11_arg0:processEvent( {
			name = "progress_updated"
		} )
	end
	
end

function UpdateCurrentTier( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4, f13_arg5, f13_arg6 )
	local f13_local0 = 400
	local f13_local1 = 400
	local f13_local2 = 1300
	local f13_local3 = 300
	local f13_local4 = f13_local0 + f13_local1 + f13_local2 + 1500
	AnimateProgress( f13_arg0, f13_arg1, f13_arg4, f13_arg4, f13_local0 )
	local f13_local5 = f13_arg0:Wait( f13_local0 + f13_local1 )
	f13_local5.onComplete = function ()
		ACTIONS.AnimateSequence( f13_arg0, "TierComplete" )
		f13_arg0.TierCompleteText:setText( Engine.Localize( GetTierCompletionText( f13_arg3 - 1 ) ) )
		Engine.PlaySound( GetTierCompletionSound( f13_arg3 - 1 ) )
		local f14_local0 = f13_arg0:Wait( f13_local2 / 2 )
		f14_local0.onComplete = function ()
			AnimateProgress( f13_arg0, 0, f13_arg2, f13_arg5, 0 )
			if f13_arg3 < 4 then
				ACTIONS.AnimateSequence( f13_arg0, "UpdateTierIcon" )
				local f15_local0 = f13_arg0:Wait( f13_local3 / 2 )
				f15_local0.onComplete = function ()
					SetTierIcon( f13_arg0, f13_arg3 )
				end
				
			else
				SetTierIcon( f13_arg0, f13_arg3 )
			end
			SetDescriptionText( f13_arg0, f13_arg6 )
		end
		
	end
	
	local f13_local6 = f13_arg0:Wait( f13_local4 )
	f13_local6.onComplete = function ()
		f13_arg0:processEvent( {
			name = "tier_updated"
		} )
	end
	
end

function Minimize( f18_arg0 )
	f18_arg0._currentState = nil
	ACTIONS.AnimateSequence( f18_arg0, "Minimized" )
end

function Remind( f19_arg0 )
	f19_arg0._currentState = INTEL_STATE.REMIND
	ACTIONS.AnimateSequence( f19_arg0, "Expand" )
	local f19_local0 = f19_arg0:Wait( 5000 )
	f19_local0.onComplete = function ()
		ACTIONS.AnimateSequence( f19_arg0, "Minimize" )
		FreeState( f19_arg0 )
	end
	
end

function Progress( f21_arg0 )
	f21_arg0._currentState = INTEL_STATE.PROGRESS
	local f21_local0 = f21_arg0._progress
	local f21_local1 = f21_arg0._progressDataSource:GetValue( f21_arg0._controllerIndex )
	local f21_local2 = f21_arg0._target
	f21_arg0._progress = f21_local1
	ACTIONS.AnimateSequence( f21_arg0, "Expand" )
	local f21_local3 = f21_arg0:Wait( 600 )
	f21_local3.onComplete = function ()
		f21_arg0:registerEventHandler( "progress_updated", function ( element, event )
			ACTIONS.AnimateSequence( element, "Minimize" )
			FreeState( element )
		end )
		UpdateProgress( f21_arg0, f21_local0, f21_local1, f21_local2 )
	end
	
end

function CompleteTier( f24_arg0 )
	f24_arg0._currentState = INTEL_STATE.COMPLETE_TIER
	local f24_local0 = f24_arg0._progress
	local f24_local1 = f24_arg0._progressDataSource:GetValue( f24_arg0._controllerIndex )
	local f24_local2 = f24_arg0._tierDataSource:GetValue( f24_arg0._controllerIndex )
	local f24_local3 = f24_arg0._target
	local f24_local4 = GetCurrentTarget( f24_arg0 )
	local f24_local5 = GetCurrentDescription( f24_arg0 )
	f24_arg0._tier = f24_local2
	f24_arg0._target = f24_local4
	f24_arg0._progress = f24_local1
	ACTIONS.AnimateSequence( f24_arg0, "Expand" )
	local f24_local6 = f24_arg0:Wait( 600 )
	f24_local6.onComplete = function ()
		f24_arg0:registerEventHandler( "tier_updated", function ( element, event )
			ACTIONS.AnimateSequence( element, "Minimize" )
			FreeState( element )
		end )
		UpdateCurrentTier( f24_arg0, f24_local0, f24_local1, f24_local2, f24_local3, f24_local4, f24_local5 )
	end
	
end

function SetState( f27_arg0, f27_arg1 )
	if f27_arg0._currentState then
		if f27_arg1 == INTEL_STATE.REMIND then
			return 
		elseif not f27_arg0._queuedState or f27_arg0._queuedState < f27_arg1 then
			f27_arg0._queuedState = f27_arg1
		end
		return 
	elseif f27_arg1 == INTEL_STATE.MINIMIZE then
		Minimize( f27_arg0 )
	elseif f27_arg1 == INTEL_STATE.REMIND then
		Remind( f27_arg0 )
	elseif f27_arg1 == INTEL_STATE.PROGRESS then
		Progress( f27_arg0 )
	elseif f27_arg1 == INTEL_STATE.COMPLETE_TIER then
		CompleteTier( f27_arg0 )
	end
end

function FreeState( f28_arg0 )
	f28_arg0._currentState = nil
	local f28_local0 = f28_arg0._queuedState
	if f28_local0 then
		f28_arg0._queuedState = nil
		SetState( f28_arg0, f28_local0 )
	end
end

function SnapToCurrentValues( f29_arg0 )
	f29_arg0._tier = f29_arg0._tierDataSource:GetValue( f29_arg0._controllerIndex )
	f29_arg0._progress = f29_arg0._progressDataSource:GetValue( f29_arg0._controllerIndex )
	f29_arg0._target = GetCurrentTarget( f29_arg0 )
	AnimateProgress( f29_arg0, 0, f29_arg0._progress, f29_arg0._target, 0 )
	SetFractionText( f29_arg0, f29_arg0._progress, f29_arg0._target )
	SetTierIcon( f29_arg0, f29_arg0._tier )
	SetDescriptionText( f29_arg0, GetCurrentDescription( f29_arg0 ) )
end

function PostLoadFunc( f30_arg0, f30_arg1, f30_arg2 )
	f30_arg0._controllerIndex = f30_arg1
	f30_arg0._idDataSource = LUI.DataSourceFromOmnvar.new( "ui_intel_active_index" )
	f30_arg0._tierDataSource = LUI.DataSourceFromOmnvar.new( "ui_intel_current_tier" )
	f30_arg0._progressDataSource = LUI.DataSourceFromOmnvar.new( "ui_intel_progress_current" )
	SetState( f30_arg0, INTEL_STATE.MINIMIZE )
	f30_arg0.FractionText:SetShadowUOffset( -0 )
	f30_arg0.FractionText:SetShadowVOffset( -0 )
	f30_arg0:SubscribeToModel( f30_arg0._idDataSource:GetModel( f30_arg1 ), function ( f31_arg0 )
		f30_arg0._id = DataModel.GetModelValue( f31_arg0 )
		if f30_arg0._id >= 0 then
			SnapToCurrentValues( f30_arg0 )
		end
	end )
	if f30_arg2.isHUDWidget then
		f30_arg0:SubscribeToModel( f30_arg0._progressDataSource:GetModel( f30_arg1 ), function ( f32_arg0 )
			if f30_arg0._tierDataSource:GetValue( f30_arg1 ) == f30_arg0._tier and f30_arg0._id >= 0 and DataModel.GetModelValue( f32_arg0 ) ~= f30_arg0._progress then
				SetState( f30_arg0, INTEL_STATE.PROGRESS )
			end
		end, true )
		f30_arg0:SubscribeToModel( f30_arg0._tierDataSource:GetModel( f30_arg1 ), function ( f33_arg0 )
			local f33_local0 = DataModel.GetModelValue( f33_arg0 )
			if f30_arg0._id >= 0 and f33_local0 >= 0 and f33_local0 <= 4 then
				SetState( f30_arg0, INTEL_STATE.COMPLETE_TIER )
			end
		end, true )
		f30_arg0:SubscribeToModel( DataSources.inGame.player.spawnCount:GetModel( f30_arg1 ), function ( f34_arg0 )
			if DataModel.GetModelValue( f34_arg0 ) > 3 and f30_arg0._id >= 0 and f30_arg0._tier >= 0 and f30_arg0._tier < 4 then
				SetState( f30_arg0, INTEL_STATE.REMIND )
			end
		end, true )
		f30_arg0:registerOmnvarHandler( "ui_match_start_countdown", function ( f35_arg0, f35_arg1 )
			if f35_arg1.value == 0 and f35_arg0._id >= 0 and f35_arg0._tier >= 0 and f35_arg0._tier < 4 then
				SetState( f35_arg0, INTEL_STATE.REMIND )
			end
		end )
	else
		ACTIONS.AnimateSequence( f30_arg0, "PauseMenu" )
	end
end

function Intel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 125 * _1080p )
	self.id = "Intel"
	self._animationSets = {}
	self._sequences = {}
	local f36_local1 = controller and controller.controllerIndex
	if not f36_local1 and not Engine.InFrontend() then
		f36_local1 = self:getRootController()
	end
	assert( f36_local1 )
	local f36_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromTable( SWATCHES.MissionSelectButton.tabBackground, 0 )
	Blur:SetGlitchEnabled( true )
	Blur:SetGlitchAmount( 0, 0 )
	Blur:SetGlitchBlockWidth( 50, 0 )
	Blur:SetGlitchBlockHeight( 50, 0 )
	Blur:SetGlitchDistortionRange( 16, 0 )
	Blur:SetGlitchScanlinePitch( 1, 0 )
	Blur:SetGlitchMaskPitch( 1, 0 )
	Blur:SetUseAA( true )
	Blur:SetBlurStrength( 0.75, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local MeterGradient = nil
	
	MeterGradient = LUI.UIImage.new()
	MeterGradient.id = "MeterGradient"
	MeterGradient:SetRGBFromInt( 0, 0 )
	MeterGradient:SetAlpha( 0.4, 0 )
	MeterGradient:SetGlitchEnabled( true )
	MeterGradient:SetGlitchAmount( 0, 0 )
	MeterGradient:SetGlitchBlockWidth( 50, 0 )
	MeterGradient:SetGlitchBlockHeight( 50, 0 )
	MeterGradient:SetGlitchDistortionRange( 16, 0 )
	MeterGradient:SetGlitchScanlinePitch( 1, 0 )
	MeterGradient:SetGlitchMaskPitch( 1, 0 )
	MeterGradient:SetUseAA( true )
	MeterGradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -28, 0 )
	self:addElement( MeterGradient )
	self.MeterGradient = MeterGradient
	
	local LabelGradient = nil
	
	LabelGradient = LUI.UIImage.new()
	LabelGradient.id = "LabelGradient"
	LabelGradient:SetRGBFromInt( 0, 0 )
	LabelGradient:SetAlpha( 0.4, 0 )
	LabelGradient:SetGlitchEnabled( true )
	LabelGradient:SetGlitchAmount( 0, 0 )
	LabelGradient:SetGlitchBlockWidth( 50, 0 )
	LabelGradient:SetGlitchBlockHeight( 50, 0 )
	LabelGradient:SetGlitchDistortionRange( 16, 0 )
	LabelGradient:SetGlitchScanlinePitch( 1, 0 )
	LabelGradient:SetGlitchMaskPitch( 1, 0 )
	LabelGradient:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	LabelGradient:SetUseAA( true )
	LabelGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( LabelGradient )
	self.LabelGradient = LabelGradient
	
	local DescriptionText = nil
	
	DescriptionText = LUI.UIStyledText.new()
	DescriptionText.id = "DescriptionText"
	DescriptionText:SetRGBFromTable( SWATCHES.fieldOrders.descriptionText, 0 )
	DescriptionText:setText( "", 0 )
	DescriptionText:SetFontSize( 22 * _1080p )
	DescriptionText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DescriptionText:SetAlignment( LUI.Alignment.Left )
	DescriptionText:SetShadowMinDistance( -0.2, 0 )
	DescriptionText:SetShadowMaxDistance( 0.2, 0 )
	DescriptionText:SetShadowRGBFromInt( 0, 0 )
	DescriptionText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 11, _1080p * -97.5, _1080p * 26, _1080p * 48 )
	self:addElement( DescriptionText )
	self.DescriptionText = DescriptionText
	
	local FractionText = nil
	
	FractionText = LUI.UIStyledText.new()
	FractionText.id = "FractionText"
	FractionText:SetGlitchEnabled( true )
	FractionText:SetGlitchAmount( 0, 0 )
	FractionText:SetGlitchBlockWidth( 50, 0 )
	FractionText:SetGlitchBlockHeight( 50, 0 )
	FractionText:SetGlitchDistortionRange( 16, 0 )
	FractionText:SetGlitchScanlinePitch( 1, 0 )
	FractionText:SetGlitchMaskPitch( 1, 0 )
	FractionText:setText( "0/0", 0 )
	FractionText:SetFontSize( 22 * _1080p )
	FractionText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FractionText:SetAlignment( LUI.Alignment.Center )
	FractionText:SetShadowMinDistance( -0.2, 0 )
	FractionText:SetShadowMaxDistance( 0.2, 0 )
	FractionText:SetShadowRGBFromInt( 0, 0 )
	FractionText:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -100.5, _1080p * 4.5, _1080p * -24.75, _1080p * -3.25 )
	self:addElement( FractionText )
	self.FractionText = FractionText
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "MatchStatusScoreBar", {
		controllerIndex = f36_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar.Fill:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	ProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 295, _1080p * 105, _1080p * 117 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local TierCompleteBar = nil
	
	TierCompleteBar = LUI.UIImage.new()
	TierCompleteBar.id = "TierCompleteBar"
	TierCompleteBar:SetRGBFromInt( 0, 0 )
	TierCompleteBar:SetAlpha( 0, 0 )
	TierCompleteBar:SetUseAA( true )
	TierCompleteBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -28, 0 )
	self:addElement( TierCompleteBar )
	self.TierCompleteBar = TierCompleteBar
	
	local TierCompleteText = nil
	
	TierCompleteText = LUI.UIText.new()
	TierCompleteText.id = "TierCompleteText"
	TierCompleteText:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	TierCompleteText:SetAlpha( 0, 0 )
	TierCompleteText:setText( ToUpperCase( Engine.Localize( "HUD_MISSION_COMPLETE" ) ), 0 )
	TierCompleteText:SetFontSize( 24 * _1080p )
	TierCompleteText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	TierCompleteText:SetAlignment( LUI.Alignment.Center )
	TierCompleteText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 49, _1080p * 275, _1080p * 84, _1080p * 108 )
	self:addElement( TierCompleteText )
	self.TierCompleteText = TierCompleteText
	
	local MarkerLarge = nil
	
	MarkerLarge = LUI.UIImage.new()
	MarkerLarge.id = "MarkerLarge"
	MarkerLarge:SetGlitchEnabled( true )
	MarkerLarge:SetGlitchAmount( 0, 0 )
	MarkerLarge:SetGlitchBlockWidth( 50, 0 )
	MarkerLarge:SetGlitchBlockHeight( 50, 0 )
	MarkerLarge:SetGlitchDistortionRange( 16, 0 )
	MarkerLarge:SetGlitchScanlinePitch( 1, 0 )
	MarkerLarge:SetGlitchMaskPitch( 1, 0 )
	MarkerLarge:setImage( RegisterMaterial( "splash_icon_team_wolverines" ), 0 )
	MarkerLarge:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -92, _1080p * -4, _1080p * 6.25, _1080p * 94.25 )
	self:addElement( MarkerLarge )
	self.MarkerLarge = MarkerLarge
	
	local CapLeft = nil
	
	CapLeft = LUI.UIImage.new()
	CapLeft.id = "CapLeft"
	CapLeft:SetGlitchEnabled( true )
	CapLeft:SetGlitchAmount( 0, 0 )
	CapLeft:SetGlitchBlockWidth( 50, 0 )
	CapLeft:SetGlitchBlockHeight( 50, 0 )
	CapLeft:SetGlitchDistortionRange( 16, 0 )
	CapLeft:SetGlitchScanlinePitch( 1, 0 )
	CapLeft:SetGlitchMaskPitch( 1, 0 )
	CapLeft:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapLeft:SetUseAA( true )
	CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -4, 0, 0, 0 )
	self:addElement( CapLeft )
	self.CapLeft = CapLeft
	
	local MissionLabel = nil
	
	MissionLabel = LUI.UIStyledText.new()
	MissionLabel.id = "MissionLabel"
	MissionLabel:SetRGBFromTable( SWATCHES.fieldOrders.descriptionText, 0 )
	MissionLabel:setText( ToUpperCase( Engine.Localize( "MPUI_ACTIVE_MISSION" ) ), 0 )
	MissionLabel:SetFontSize( 19 * _1080p )
	MissionLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissionLabel:SetAlignment( LUI.Alignment.Left )
	MissionLabel:SetShadowMinDistance( -0.2, 0 )
	MissionLabel:SetShadowMaxDistance( 0.2, 0 )
	MissionLabel:SetShadowRGBFromInt( 0, 0 )
	MissionLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 11, _1080p * -97, _1080p * 2, _1080p * 21 )
	self:addElement( MissionLabel )
	self.MissionLabel = MissionLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TierCompleteBar:RegisterAnimationSequence( "TierComplete", {
			{
				function ()
					return self.TierCompleteBar:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TierCompleteBar:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			},
			{
				function ()
					return self.TierCompleteBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * -400, _1080p * -28, 0, 0 )
				end,
				function ()
					return self.TierCompleteBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -28, 0, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.TierCompleteBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -28, 0, 949 )
				end,
				function ()
					return self.TierCompleteBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 400, 0, _1080p * -28, 0, 149, LUI.EASING.inSine )
				end
			}
		} )
		TierCompleteText:RegisterAnimationSequence( "TierComplete", {
			{
				function ()
					return self.TierCompleteText:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.TierCompleteText:SetAlpha( 0, 300 )
				end,
				function ()
					return self.TierCompleteText:SetAlpha( 1, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.TierCompleteText:SetAlpha( 1, 450 )
				end,
				function ()
					return self.TierCompleteText:SetAlpha( 0, 200 )
				end,
				function ()
					return self.TierCompleteText:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.TierCompleteText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 29, _1080p * 285, _1080p * 99, _1080p * 123, 300 )
				end,
				function ()
					return self.TierCompleteText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 67, _1080p * 338, _1080p * 99, _1080p * 123, 199, LUI.EASING.outSine )
				end,
				function ()
					return self.TierCompleteText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 67, _1080p * 338, _1080p * 99, _1080p * 123, 449 )
				end,
				function ()
					return self.TierCompleteText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 105, _1080p * 371, _1080p * 99, _1080p * 123, 199 )
				end
			}
		} )
		self._sequences.TierComplete = function ()
			TierCompleteBar:AnimateSequence( "TierComplete" )
			TierCompleteText:AnimateSequence( "TierComplete" )
		end
		
		Blur:RegisterAnimationSequence( "Expand", {
			{
				function ()
					return self.Blur:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Blur:SetAlpha( 0, 110 )
				end,
				function ()
					return self.Blur:SetAlpha( 1, 80 )
				end
			},
			{
				function ()
					return self.Blur:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Blur:SetGlitchAmount( 0, 190 )
				end
			},
			{
				function ()
					return self.Blur:SetGlitchBlockWidth( 10, 0 )
				end,
				function ()
					return self.Blur:SetGlitchBlockWidth( 1, 190 )
				end
			},
			{
				function ()
					return self.Blur:SetGlitchBlockHeight( 10, 0 )
				end,
				function ()
					return self.Blur:SetGlitchBlockHeight( 16, 190 )
				end
			},
			{
				function ()
					return self.Blur:SetGlitchDistortionRange( 16, 0 )
				end,
				function ()
					return self.Blur:SetGlitchDistortionRange( 30, 190 )
				end
			},
			{
				function ()
					return self.Blur:SetGlitchScanlinePitch( 60, 0 )
				end,
				function ()
					return self.Blur:SetGlitchScanlinePitch( 60, 190 )
				end
			},
			{
				function ()
					return self.Blur:SetGlitchMaskPitch( 50, 0 )
				end,
				function ()
					return self.Blur:SetGlitchMaskPitch( 50, 190 )
				end
			},
			{
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 304, 0, 0, 0, 0 )
				end,
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 304, 0, 0, 0, 270 )
				end,
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 69, LUI.EASING.outBack )
				end
			}
		} )
		MeterGradient:RegisterAnimationSequence( "Expand", {
			{
				function ()
					return self.MeterGradient:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MeterGradient:SetAlpha( 0, 110 )
				end,
				function ()
					return self.MeterGradient:SetAlpha( 0.4, 80 )
				end
			},
			{
				function ()
					return self.MeterGradient:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.MeterGradient:SetGlitchAmount( 0, 190 )
				end
			},
			{
				function ()
					return self.MeterGradient:SetGlitchBlockWidth( 10, 0 )
				end,
				function ()
					return self.MeterGradient:SetGlitchBlockWidth( 1, 190 )
				end
			},
			{
				function ()
					return self.MeterGradient:SetGlitchBlockHeight( 10, 0 )
				end,
				function ()
					return self.MeterGradient:SetGlitchBlockHeight( 16, 190 )
				end
			},
			{
				function ()
					return self.MeterGradient:SetGlitchDistortionRange( 16, 0 )
				end,
				function ()
					return self.MeterGradient:SetGlitchDistortionRange( 30, 190 )
				end
			},
			{
				function ()
					return self.MeterGradient:SetGlitchScanlinePitch( 60, 0 )
				end,
				function ()
					return self.MeterGradient:SetGlitchScanlinePitch( 60, 190 )
				end
			},
			{
				function ()
					return self.MeterGradient:SetGlitchMaskPitch( 50, 0 )
				end,
				function ()
					return self.MeterGradient:SetGlitchMaskPitch( 50, 190 )
				end
			},
			{
				function ()
					return self.MeterGradient:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 304, 0, _1080p * -28, 0, 0 )
				end,
				function ()
					return self.MeterGradient:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 304, 0, _1080p * -28, 0, 270 )
				end,
				function ()
					return self.MeterGradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -28, 0, 69, LUI.EASING.outBack )
				end
			}
		} )
		LabelGradient:RegisterAnimationSequence( "Expand", {
			{
				function ()
					return self.LabelGradient:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.LabelGradient:SetAlpha( 0, 110 )
				end,
				function ()
					return self.LabelGradient:SetAlpha( 0.4, 80 )
				end
			},
			{
				function ()
					return self.LabelGradient:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.LabelGradient:SetGlitchAmount( 0, 190 )
				end
			},
			{
				function ()
					return self.LabelGradient:SetGlitchBlockWidth( 10, 0 )
				end,
				function ()
					return self.LabelGradient:SetGlitchBlockWidth( 1, 190 )
				end
			},
			{
				function ()
					return self.LabelGradient:SetGlitchBlockHeight( 10, 0 )
				end,
				function ()
					return self.LabelGradient:SetGlitchBlockHeight( 16, 190 )
				end
			},
			{
				function ()
					return self.LabelGradient:SetGlitchDistortionRange( 16, 0 )
				end,
				function ()
					return self.LabelGradient:SetGlitchDistortionRange( 30, 190 )
				end
			},
			{
				function ()
					return self.LabelGradient:SetGlitchScanlinePitch( 60, 0 )
				end,
				function ()
					return self.LabelGradient:SetGlitchScanlinePitch( 60, 190 )
				end
			},
			{
				function ()
					return self.LabelGradient:SetGlitchMaskPitch( 50, 0 )
				end,
				function ()
					return self.LabelGradient:SetGlitchMaskPitch( 50, 190 )
				end
			},
			{
				function ()
					return self.LabelGradient:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 304, 0, 0, _1080p * 24, 0 )
				end,
				function ()
					return self.LabelGradient:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 304, 0, 0, _1080p * 24, 270 )
				end,
				function ()
					return self.LabelGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24, 69, LUI.EASING.outBack )
				end
			}
		} )
		DescriptionText:RegisterAnimationSequence( "Expand", {
			{
				function ()
					return self.DescriptionText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DescriptionText:SetAlpha( 0, 340 )
				end,
				function ()
					return self.DescriptionText:SetAlpha( 1, 110 )
				end
			},
			{
				function ()
					return self.DescriptionText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1, _1080p * -107.5, _1080p * 26, _1080p * 48, 0 )
				end,
				function ()
					return self.DescriptionText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1, _1080p * -107.5, _1080p * 26, _1080p * 48, 340 )
				end,
				function ()
					return self.DescriptionText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 11, _1080p * -97.5, _1080p * 26, _1080p * 48, 109 )
				end
			}
		} )
		FractionText:RegisterAnimationSequence( "Expand", {
			{
				function ()
					return self.FractionText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FractionText:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.FractionText:SetGlitchAmount( 0, 110 )
				end
			},
			{
				function ()
					return self.FractionText:SetGlitchBlockWidth( 10, 0 )
				end,
				function ()
					return self.FractionText:SetGlitchBlockWidth( 1, 110 )
				end
			},
			{
				function ()
					return self.FractionText:SetGlitchBlockHeight( 10, 0 )
				end,
				function ()
					return self.FractionText:SetGlitchBlockHeight( 16, 110 )
				end
			},
			{
				function ()
					return self.FractionText:SetGlitchDistortionRange( 16, 0 )
				end,
				function ()
					return self.FractionText:SetGlitchDistortionRange( 30, 110 )
				end
			},
			{
				function ()
					return self.FractionText:SetGlitchScanlinePitch( 60, 0 )
				end,
				function ()
					return self.FractionText:SetGlitchScanlinePitch( 60, 110 )
				end
			},
			{
				function ()
					return self.FractionText:SetGlitchMaskPitch( 50, 0 )
				end,
				function ()
					return self.FractionText:SetGlitchMaskPitch( 50, 110 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "Expand", {
			{
				function ()
					return self.ProgressBar:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ProgressBar:SetAlpha( 0, 340 )
				end,
				function ()
					return self.ProgressBar:SetAlpha( 1, 110 )
				end
			},
			{
				function ()
					return self.ProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 295, _1080p * 105, _1080p * 117, 0 )
				end
			}
		} )
		MarkerLarge:RegisterAnimationSequence( "Expand", {
			{
				function ()
					return self.MarkerLarge:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MarkerLarge:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.MarkerLarge:SetGlitchAmount( 0, 110 )
				end
			},
			{
				function ()
					return self.MarkerLarge:SetGlitchBlockWidth( 10, 0 )
				end,
				function ()
					return self.MarkerLarge:SetGlitchBlockWidth( 1, 110 )
				end
			},
			{
				function ()
					return self.MarkerLarge:SetGlitchBlockHeight( 10, 0 )
				end,
				function ()
					return self.MarkerLarge:SetGlitchBlockHeight( 16, 110 )
				end
			},
			{
				function ()
					return self.MarkerLarge:SetGlitchDistortionRange( 16, 0 )
				end,
				function ()
					return self.MarkerLarge:SetGlitchDistortionRange( 30, 110 )
				end
			},
			{
				function ()
					return self.MarkerLarge:SetGlitchScanlinePitch( 60, 0 )
				end,
				function ()
					return self.MarkerLarge:SetGlitchScanlinePitch( 60, 110 )
				end
			},
			{
				function ()
					return self.MarkerLarge:SetGlitchMaskPitch( 50, 0 )
				end,
				function ()
					return self.MarkerLarge:SetGlitchMaskPitch( 50, 110 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Expand", {
			{
				function ()
					return self.CapLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 110 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 90 )
				end
			},
			{
				function ()
					return self.CapLeft:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.CapLeft:SetGlitchAmount( 0, 200 )
				end
			},
			{
				function ()
					return self.CapLeft:SetGlitchBlockWidth( 10, 0 )
				end,
				function ()
					return self.CapLeft:SetGlitchBlockWidth( 1, 200 )
				end
			},
			{
				function ()
					return self.CapLeft:SetGlitchBlockHeight( 10, 0 )
				end,
				function ()
					return self.CapLeft:SetGlitchBlockHeight( 16, 200 )
				end
			},
			{
				function ()
					return self.CapLeft:SetGlitchDistortionRange( 16, 0 )
				end,
				function ()
					return self.CapLeft:SetGlitchDistortionRange( 30, 200 )
				end
			},
			{
				function ()
					return self.CapLeft:SetGlitchScanlinePitch( 60, 0 )
				end,
				function ()
					return self.CapLeft:SetGlitchScanlinePitch( 60, 200 )
				end
			},
			{
				function ()
					return self.CapLeft:SetGlitchMaskPitch( 50, 0 )
				end,
				function ()
					return self.CapLeft:SetGlitchMaskPitch( 50, 200 )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 300, _1080p * 304, 0, 0, 0 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 300, _1080p * 304, 0, 0, 270 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -4, 0, 0, 0, 69, LUI.EASING.outBack )
				end
			}
		} )
		MissionLabel:RegisterAnimationSequence( "Expand", {
			{
				function ()
					return self.MissionLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MissionLabel:SetAlpha( 0, 340 )
				end,
				function ()
					return self.MissionLabel:SetAlpha( 1, 10 )
				end,
				function ()
					return self.MissionLabel:SetAlpha( 0, 30 )
				end,
				function ()
					return self.MissionLabel:SetAlpha( 1, 30 )
				end,
				function ()
					return self.MissionLabel:SetAlpha( 0, 30 )
				end,
				function ()
					return self.MissionLabel:SetAlpha( 1, 30 )
				end,
				function ()
					return self.MissionLabel:SetAlpha( 0, 30 )
				end,
				function ()
					return self.MissionLabel:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.Expand = function ()
			Blur:AnimateSequence( "Expand" )
			MeterGradient:AnimateSequence( "Expand" )
			LabelGradient:AnimateSequence( "Expand" )
			DescriptionText:AnimateSequence( "Expand" )
			FractionText:AnimateSequence( "Expand" )
			ProgressBar:AnimateSequence( "Expand" )
			MarkerLarge:AnimateSequence( "Expand" )
			CapLeft:AnimateSequence( "Expand" )
			MissionLabel:AnimateSequence( "Expand" )
		end
		
		Blur:RegisterAnimationSequence( "Minimize", {
			{
				function ()
					return self.Blur:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Blur:SetAlpha( 1, 250, LUI.EASING.inBack )
				end,
				function ()
					return self.Blur:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 50 )
				end,
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 304, 0, 0, 0, 199, LUI.EASING.inBack )
				end
			}
		} )
		MeterGradient:RegisterAnimationSequence( "Minimize", {
			{
				function ()
					return self.MeterGradient:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.MeterGradient:SetAlpha( 0.4, 250, LUI.EASING.inBack )
				end,
				function ()
					return self.MeterGradient:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.MeterGradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -28, 0, 50 )
				end,
				function ()
					return self.MeterGradient:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 304, 0, _1080p * -28, 0, 199, LUI.EASING.inBack )
				end
			}
		} )
		LabelGradient:RegisterAnimationSequence( "Minimize", {
			{
				function ()
					return self.LabelGradient:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.LabelGradient:SetAlpha( 0.4, 250, LUI.EASING.inBack )
				end,
				function ()
					return self.LabelGradient:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.LabelGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24, 50 )
				end,
				function ()
					return self.LabelGradient:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 304, 0, 0, _1080p * 24, 199, LUI.EASING.inBack )
				end
			}
		} )
		DescriptionText:RegisterAnimationSequence( "Minimize", {
			{
				function ()
					return self.DescriptionText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.DescriptionText:SetAlpha( 0, 50 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "Minimize", {
			{
				function ()
					return self.ProgressBar:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ProgressBar:SetAlpha( 0, 50 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Minimize", {
			{
				function ()
					return self.CapLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 250, LUI.EASING.inBack )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -4, 0, 0, 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 300, _1080p * 304, 0, 0, 199, LUI.EASING.inBack )
				end
			}
		} )
		MissionLabel:RegisterAnimationSequence( "Minimize", {
			{
				function ()
					return self.MissionLabel:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MissionLabel:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.Minimize = function ()
			Blur:AnimateSequence( "Minimize" )
			MeterGradient:AnimateSequence( "Minimize" )
			LabelGradient:AnimateSequence( "Minimize" )
			DescriptionText:AnimateSequence( "Minimize" )
			ProgressBar:AnimateSequence( "Minimize" )
			CapLeft:AnimateSequence( "Minimize" )
			MissionLabel:AnimateSequence( "Minimize" )
		end
		
		MarkerLarge:RegisterAnimationSequence( "UpdateTierIcon", {
			{
				function ()
					return self.MarkerLarge:SetYRotation( 0, 0 )
				end,
				function ()
					return self.MarkerLarge:SetYRotation( 360, 300, LUI.EASING.outSine )
				end
			},
			{
				function ()
					return self.MarkerLarge:SetScale( 0, 0 )
				end,
				function ()
					return self.MarkerLarge:SetScale( 0.1, 150 )
				end,
				function ()
					return self.MarkerLarge:SetScale( 0, 150, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.UpdateTierIcon = function ()
			MarkerLarge:AnimateSequence( "UpdateTierIcon" )
		end
		
		Blur:RegisterAnimationSequence( "PauseMenu", {
			{
				function ()
					return self.Blur:SetBlurStrength( 0, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetAlpha( 0.4, 0 )
				end
			}
		} )
		MeterGradient:RegisterAnimationSequence( "PauseMenu", {
			{
				function ()
					return self.MeterGradient:SetAlpha( 0.4, 0 )
				end
			}
		} )
		LabelGradient:RegisterAnimationSequence( "PauseMenu", {
			{
				function ()
					return self.LabelGradient:SetAlpha( 0.4, 0 )
				end
			}
		} )
		DescriptionText:RegisterAnimationSequence( "PauseMenu", {
			{
				function ()
					return self.DescriptionText:SetAlpha( 1, 0 )
				end
			}
		} )
		FractionText:RegisterAnimationSequence( "PauseMenu", {
			{
				function ()
					return self.FractionText:SetAlpha( 1, 0 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "PauseMenu", {
			{
				function ()
					return self.ProgressBar:SetAlpha( 1, 0 )
				end
			}
		} )
		TierCompleteBar:RegisterAnimationSequence( "PauseMenu", {
			{
				function ()
					return self.TierCompleteBar:SetAlpha( 0, 0 )
				end
			}
		} )
		TierCompleteText:RegisterAnimationSequence( "PauseMenu", {
			{
				function ()
					return self.TierCompleteText:SetAlpha( 0, 0 )
				end
			}
		} )
		MarkerLarge:RegisterAnimationSequence( "PauseMenu", {
			{
				function ()
					return self.MarkerLarge:SetAlpha( 1, 0 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "PauseMenu", {
			{
				function ()
					return self.CapLeft:SetAlpha( 1, 0 )
				end
			}
		} )
		MissionLabel:RegisterAnimationSequence( "PauseMenu", {
			{
				function ()
					return self.MissionLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.PauseMenu = function ()
			Blur:AnimateSequence( "PauseMenu" )
			MeterGradient:AnimateSequence( "PauseMenu" )
			LabelGradient:AnimateSequence( "PauseMenu" )
			DescriptionText:AnimateSequence( "PauseMenu" )
			FractionText:AnimateSequence( "PauseMenu" )
			ProgressBar:AnimateSequence( "PauseMenu" )
			TierCompleteBar:AnimateSequence( "PauseMenu" )
			TierCompleteText:AnimateSequence( "PauseMenu" )
			MarkerLarge:AnimateSequence( "PauseMenu" )
			CapLeft:AnimateSequence( "PauseMenu" )
			MissionLabel:AnimateSequence( "PauseMenu" )
		end
		
		Blur:RegisterAnimationSequence( "Minimized", {
			{
				function ()
					return self.Blur:SetAlpha( 0, 0 )
				end
			}
		} )
		MeterGradient:RegisterAnimationSequence( "Minimized", {
			{
				function ()
					return self.MeterGradient:SetAlpha( 0, 0 )
				end
			}
		} )
		LabelGradient:RegisterAnimationSequence( "Minimized", {
			{
				function ()
					return self.LabelGradient:SetAlpha( 0, 0 )
				end
			}
		} )
		DescriptionText:RegisterAnimationSequence( "Minimized", {
			{
				function ()
					return self.DescriptionText:SetAlpha( 0, 0 )
				end
			}
		} )
		FractionText:RegisterAnimationSequence( "Minimized", {
			{
				function ()
					return self.FractionText:SetAlpha( 1, 0 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "Minimized", {
			{
				function ()
					return self.ProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		TierCompleteBar:RegisterAnimationSequence( "Minimized", {
			{
				function ()
					return self.TierCompleteBar:SetAlpha( 0, 0 )
				end
			}
		} )
		TierCompleteText:RegisterAnimationSequence( "Minimized", {
			{
				function ()
					return self.TierCompleteText:SetAlpha( 0, 0 )
				end
			}
		} )
		MarkerLarge:RegisterAnimationSequence( "Minimized", {
			{
				function ()
					return self.MarkerLarge:SetAlpha( 1, 0 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Minimized", {
			{
				function ()
					return self.CapLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		MissionLabel:RegisterAnimationSequence( "Minimized", {
			{
				function ()
					return self.MissionLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Minimized = function ()
			Blur:AnimateSequence( "Minimized" )
			MeterGradient:AnimateSequence( "Minimized" )
			LabelGradient:AnimateSequence( "Minimized" )
			DescriptionText:AnimateSequence( "Minimized" )
			FractionText:AnimateSequence( "Minimized" )
			ProgressBar:AnimateSequence( "Minimized" )
			TierCompleteBar:AnimateSequence( "Minimized" )
			TierCompleteText:AnimateSequence( "Minimized" )
			MarkerLarge:AnimateSequence( "Minimized" )
			CapLeft:AnimateSequence( "Minimized" )
			MissionLabel:AnimateSequence( "Minimized" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f36_local1, controller )
	return self
end

MenuBuilder.registerType( "Intel", Intel )
LockTable( _M )
