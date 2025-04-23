local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	return function ()
		assert( f1_arg0.ProgressBar )
		assert( f1_arg0.ProgressBar.Fill )
		if not f1_arg0.contractComplete then
			if Contracts.CheckCompletion( f1_arg1, f1_arg0.contractData.index ) == true then
				f1_arg0.contractComplete = true
				ACTIONS.AnimateSequence( f1_arg0, "ContractComplete" )
			else
				local f2_local0 = Contracts.GetCurrentChallengeProgress( f1_arg1, f1_arg0.contractData.index )
				local f2_local1 = tonumber( f1_arg0.contractData.challengeData.target )
				f1_arg0.FractionText:setText( Engine.Localize( "LUA_MENU_MP_PROGRESS_TOTAL", Contracts.GetCurrentChallengeProgress( f1_arg1, f1_arg0.contractData.index ), f2_local1 ) )
				assert( f2_local1 ~= 0 )
				f1_arg0.ProgressBar.Fill:SetRightAnchor( LUI.clamp( 1 - f2_local0 / f2_local1, 0, 1 ), f1_arg2 )
			end
		end
	end
	
end

f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	assert( f3_arg0.Type )
	assert( f3_arg0.DescriptionText )
	assert( f3_arg0.Background )
	f3_arg0.contractData = Contracts.GetContractData( f3_arg1, f3_arg2, f3_arg3 )
	f3_arg0.Type:setText( ToUpperCase( f3_arg0.contractData.type ) )
	f3_arg0.DescriptionText:setText( f3_arg0.contractData.desc )
	assert( f3_arg0.contractData.color )
	f3_arg0.Type:SetRGBFromTable( COLORS.white )
	f3_arg0.Background:SetRGBFromInt( f3_arg0.contractData.color, 0 )
	f3_arg0.Border:SetRGBFromInt( f3_arg0.contractData.color, 0 )
	f3_arg0.LabelBacker:SetRGBFromInt( f3_arg0.contractData.color, 0 )
	f3_arg0.LabelBackerAngle:SetRGBFromInt( f3_arg0.contractData.color, 0 )
	local f3_local0 = ""
	if f3_arg0.contractData.teamIndex == 0 then
		f3_local0 = Engine.Localize( "ZM_CONTRACTS_REQUIREMENTS_SPACELAND" )
	elseif f3_arg0.contractData.teamIndex == 1 then
		f3_local0 = Engine.Localize( "ZM_CONTRACTS_REQUIREMENTS_RAVE" )
	elseif f3_arg0.contractData.teamIndex == 2 then
		f3_local0 = Engine.Localize( "ZM_CONTRACTS_REQUIREMENTS_SHAOLIN" )
	elseif f3_arg0.contractData.teamIndex == 3 then
		f3_local0 = Engine.Localize( "ZM_CONTRACTS_REQUIREMENTS_ATTACK" )
	elseif f3_arg0.contractData.teamIndex == 4 then
		f3_local0 = Engine.Localize( "ZM_CONTRACTS_REQUIREMENTS_BEYOND" )
	end
	f3_arg0.RequirementText:setText( f3_local0 )
	local f3_local1 = LUI.DataSourceFromPlayerData.new( CoD.StatsGroup.Ranked, CoD.PlayMode.Core )
	f3_arg0:SubscribeToModel( f3_local1.contracts.challenges[f3_arg3].progress.GetModel( REG6.progress, f3_arg1 ), f0_local0( f3_arg0, f3_arg1, 250 ), true )
	local f3_local2 = f0_local0( f3_arg0, f3_arg1, 0 )
	f3_local2()
end

f0_local2 = function ( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0.SetupContract = f0_local1
end

function SmallContractCP( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 455 * _1080p, 0, 130 * _1080p )
	self.id = "SmallContractCP"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 52.75, _1080p * 56.75 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local Background = nil
	
	Background = LUI.UIBlur.new()
	Background.id = "Background"
	Background:SetGlitchEnabled( true )
	Background:SetGlitchAmount( 0, 0 )
	Background:SetGlitchBlockWidth( 50, 0 )
	Background:SetGlitchBlockHeight( 50, 0 )
	Background:SetGlitchDistortionRange( 16, 0 )
	Background:SetGlitchScanlinePitch( 1, 0 )
	Background:SetGlitchMaskPitch( 1, 0 )
	Background:SetUseAA( true )
	Background:SetBlurStrength( 2.25, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 132.75 )
	self:addElement( Background )
	self.Background = Background
	
	local PopupBacker = nil
	
	PopupBacker = LUI.UIImage.new()
	PopupBacker.id = "PopupBacker"
	PopupBacker:SetRGBFromInt( 0, 0 )
	PopupBacker:SetAlpha( 0.3, 0 )
	PopupBacker:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 132.75 )
	self:addElement( PopupBacker )
	self.PopupBacker = PopupBacker
	
	local MeterGradient = nil
	
	MeterGradient = LUI.UIImage.new()
	MeterGradient.id = "MeterGradient"
	MeterGradient:SetRGBFromInt( 0, 0 )
	MeterGradient:SetAlpha( 0.5, 0 )
	MeterGradient:SetGlitchEnabled( true )
	MeterGradient:SetGlitchAmount( 0, 0 )
	MeterGradient:SetGlitchBlockWidth( 50, 0 )
	MeterGradient:SetGlitchBlockHeight( 50, 0 )
	MeterGradient:SetGlitchDistortionRange( 16, 0 )
	MeterGradient:SetGlitchScanlinePitch( 1, 0 )
	MeterGradient:SetGlitchMaskPitch( 1, 0 )
	MeterGradient:SetUseAA( true )
	MeterGradient:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 38.75, _1080p * 66.75 )
	self:addElement( MeterGradient )
	self.MeterGradient = MeterGradient
	
	local LabelBacker = nil
	
	LabelBacker = LUI.UIImage.new()
	LabelBacker.id = "LabelBacker"
	LabelBacker:SetGlitchEnabled( true )
	LabelBacker:SetGlitchAmount( 0, 0 )
	LabelBacker:SetGlitchBlockWidth( 50, 0 )
	LabelBacker:SetGlitchBlockHeight( 50, 0 )
	LabelBacker:SetGlitchDistortionRange( 16, 0 )
	LabelBacker:SetGlitchScanlinePitch( 1, 0 )
	LabelBacker:SetGlitchMaskPitch( 1, 0 )
	LabelBacker:SetUseAA( true )
	LabelBacker:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 455, 0, _1080p * 32 )
	self:addElement( LabelBacker )
	self.LabelBacker = LabelBacker
	
	local LabelBackerAngle = nil
	
	LabelBackerAngle = LUI.UIImage.new()
	LabelBackerAngle.id = "LabelBackerAngle"
	LabelBackerAngle:SetGlitchEnabled( true )
	LabelBackerAngle:SetGlitchAmount( 0, 0 )
	LabelBackerAngle:SetGlitchBlockWidth( 50, 0 )
	LabelBackerAngle:SetGlitchBlockHeight( 50, 0 )
	LabelBackerAngle:SetGlitchDistortionRange( 16, 0 )
	LabelBackerAngle:SetGlitchScanlinePitch( 1, 0 )
	LabelBackerAngle:SetGlitchMaskPitch( 1, 0 )
	LabelBackerAngle:setImage( RegisterMaterial( "wdg_slot_cut_out_1" ), 0 )
	LabelBackerAngle:SetUseAA( true )
	LabelBackerAngle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 374, _1080p * 406, 0, _1080p * 32 )
	self:addElement( LabelBackerAngle )
	self.LabelBackerAngle = LabelBackerAngle
	
	local DescriptionText = nil
	
	DescriptionText = LUI.UIStyledText.new()
	DescriptionText.id = "DescriptionText"
	DescriptionText:SetRGBFromTable( SWATCHES.fieldOrders.descriptionText, 0 )
	DescriptionText:setText( "", 0 )
	DescriptionText:SetFontSize( 20 * _1080p )
	DescriptionText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DescriptionText:SetAlignment( LUI.Alignment.Left )
	DescriptionText:SetStartupDelay( 1000 )
	DescriptionText:SetLineHoldTime( 400 )
	DescriptionText:SetAnimMoveTime( 150 )
	DescriptionText:SetEndDelay( 1000 )
	DescriptionText:SetCrossfadeTime( 400 )
	DescriptionText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	DescriptionText:SetMaxVisibleLines( 2 )
	DescriptionText:SetShadowRGBFromInt( 0, 0 )
	DescriptionText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8.5, _1080p * -7, _1080p * 40.25, _1080p * 60.25 )
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
	FractionText:setText( "", 0 )
	FractionText:SetFontSize( 22 * _1080p )
	FractionText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FractionText:SetAlignment( LUI.Alignment.Center )
	FractionText:SetShadowMinDistance( -0.2, 0 )
	FractionText:SetShadowMaxDistance( 0.2, 0 )
	FractionText:SetShadowRGBFromInt( 0, 0 )
	FractionText:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -155, _1080p * -7, _1080p * 108, _1080p * 129.5 )
	self:addElement( FractionText )
	self.FractionText = FractionText
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "MatchStatusScoreBar", {
		controllerIndex = f5_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar.Fill:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	ProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 297, _1080p * 112.75, _1080p * 124.75 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local CompleteBar = nil
	
	CompleteBar = LUI.UIImage.new()
	CompleteBar.id = "CompleteBar"
	CompleteBar:SetRGBFromInt( 0, 0 )
	CompleteBar:SetAlpha( 0, 0 )
	CompleteBar:SetUseAA( true )
	CompleteBar:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -400, _1080p * 37, _1080p * 65 )
	self:addElement( CompleteBar )
	self.CompleteBar = CompleteBar
	
	local CompleteText = nil
	
	CompleteText = LUI.UIText.new()
	CompleteText.id = "CompleteText"
	CompleteText:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	CompleteText:SetAlpha( 0, 0 )
	CompleteText:setText( ToUpperCase( Engine.Localize( "ZM_CONTRACTS_BOUNTY_COMPLETE" ) ), 0 )
	CompleteText:SetFontSize( 24 * _1080p )
	CompleteText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	CompleteText:SetAlignment( LUI.Alignment.Center )
	CompleteText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 115.25, _1080p * 341.25, _1080p * 105.5, _1080p * 129.5 )
	self:addElement( CompleteText )
	self.CompleteText = CompleteText
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Border.id = "Border"
	Border:SetBorderThicknessLeft( _1080p * 2, 0 )
	Border:SetBorderThicknessRight( _1080p * 2, 0 )
	Border:SetBorderThicknessTop( _1080p * 2, 0 )
	Border:SetBorderThicknessBottom( _1080p * 2, 0 )
	Border:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 132.75 )
	self:addElement( Border )
	self.Border = Border
	
	local Type = nil
	
	Type = LUI.UIStyledText.new()
	Type.id = "Type"
	Type:SetRGBFromInt( 0, 0 )
	Type:setText( "", 0 )
	Type:SetFontSize( 18 * _1080p )
	Type:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Type:SetAlignment( LUI.Alignment.Left )
	Type:SetStartupDelay( 1500 )
	Type:SetLineHoldTime( 400 )
	Type:SetAnimMoveTime( 300 )
	Type:SetEndDelay( 1000 )
	Type:SetCrossfadeTime( 500 )
	Type:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Type:SetMaxVisibleLines( 1 )
	Type:SetShadowRGBFromInt( 0, 0 )
	Type:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8.5, _1080p * -143.5, _1080p * 7, _1080p * 25 )
	self:addElement( Type )
	self.Type = Type
	
	local RequirementText = nil
	
	RequirementText = LUI.UIStyledText.new()
	RequirementText.id = "RequirementText"
	RequirementText:SetRGBFromTable( SWATCHES.fieldOrders.descriptionText, 0 )
	RequirementText:setText( "", 0 )
	RequirementText:SetFontSize( 20 * _1080p )
	RequirementText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RequirementText:SetAlignment( LUI.Alignment.Left )
	RequirementText:SetStartupDelay( 1500 )
	RequirementText:SetLineHoldTime( 400 )
	RequirementText:SetAnimMoveTime( 300 )
	RequirementText:SetEndDelay( 1000 )
	RequirementText:SetCrossfadeTime( 500 )
	RequirementText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	RequirementText:SetMaxVisibleLines( 1 )
	RequirementText:SetShadowRGBFromInt( 0, 0 )
	RequirementText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8.5, _1080p * -7, _1080p * 80, _1080p * 100 )
	self:addElement( RequirementText )
	self.RequirementText = RequirementText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FractionText:RegisterAnimationSequence( "ContractComplete", {
			{
				function ()
					return self.FractionText:SetAlpha( 0, 0 )
				end
			}
		} )
		CompleteBar:RegisterAnimationSequence( "ContractComplete", {
			{
				function ()
					return self.CompleteBar:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CompleteBar:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
				end
			},
			{
				function ()
					return self.CompleteBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * -400, _1080p * -28, 0, 0 )
				end,
				function ()
					return self.CompleteBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -28, 0, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.CompleteBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -28, 0, 949 )
				end
			}
		} )
		CompleteText:RegisterAnimationSequence( "ContractComplete", {
			{
				function ()
					return self.CompleteText:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.CompleteText:SetAlpha( 0, 300 )
				end,
				function ()
					return self.CompleteText:SetAlpha( 1, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.CompleteText:SetAlpha( 1, 450 )
				end
			},
			{
				function ()
					return self.CompleteText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 29, _1080p * 285, _1080p * 106, _1080p * 130, 0 )
				end,
				function ()
					return self.CompleteText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 29, _1080p * 285, _1080p * 106, _1080p * 130, 300 )
				end,
				function ()
					return self.CompleteText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 67, _1080p * 338, _1080p * 106, _1080p * 130, 199, LUI.EASING.outSine )
				end,
				function ()
					return self.CompleteText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 67, _1080p * 338, _1080p * 106, _1080p * 130, 449 )
				end
			}
		} )
		RequirementText:RegisterAnimationSequence( "ContractComplete", {
			{
				function ()
					return self.RequirementText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ContractComplete = function ()
			FractionText:AnimateSequence( "ContractComplete" )
			CompleteBar:AnimateSequence( "ContractComplete" )
			CompleteText:AnimateSequence( "ContractComplete" )
			RequirementText:AnimateSequence( "ContractComplete" )
		end
		
		Background:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 110 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 80 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Background:SetGlitchAmount( 0, 190 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchBlockWidth( 10, 0 )
				end,
				function ()
					return self.Background:SetGlitchBlockWidth( 1, 190 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchBlockHeight( 10, 0 )
				end,
				function ()
					return self.Background:SetGlitchBlockHeight( 16, 190 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchDistortionRange( 16, 0 )
				end,
				function ()
					return self.Background:SetGlitchDistortionRange( 30, 190 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchScanlinePitch( 60, 0 )
				end,
				function ()
					return self.Background:SetGlitchScanlinePitch( 60, 190 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchMaskPitch( 50, 0 )
				end,
				function ()
					return self.Background:SetGlitchMaskPitch( 50, 190 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 304, 0, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 304, 0, 0, 0, 270 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 69, LUI.EASING.outBack )
				end
			}
		} )
		MeterGradient:RegisterAnimationSequence( "Bootup", {
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
		LabelBacker:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.LabelBacker:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.LabelBacker:SetAlpha( 0, 110 )
				end,
				function ()
					return self.LabelBacker:SetAlpha( 0.4, 80 )
				end
			},
			{
				function ()
					return self.LabelBacker:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.LabelBacker:SetGlitchAmount( 0, 190 )
				end
			},
			{
				function ()
					return self.LabelBacker:SetGlitchBlockWidth( 10, 0 )
				end,
				function ()
					return self.LabelBacker:SetGlitchBlockWidth( 1, 190 )
				end
			},
			{
				function ()
					return self.LabelBacker:SetGlitchBlockHeight( 10, 0 )
				end,
				function ()
					return self.LabelBacker:SetGlitchBlockHeight( 16, 190 )
				end
			},
			{
				function ()
					return self.LabelBacker:SetGlitchDistortionRange( 16, 0 )
				end,
				function ()
					return self.LabelBacker:SetGlitchDistortionRange( 30, 190 )
				end
			},
			{
				function ()
					return self.LabelBacker:SetGlitchScanlinePitch( 60, 0 )
				end,
				function ()
					return self.LabelBacker:SetGlitchScanlinePitch( 60, 190 )
				end
			},
			{
				function ()
					return self.LabelBacker:SetGlitchMaskPitch( 50, 0 )
				end,
				function ()
					return self.LabelBacker:SetGlitchMaskPitch( 50, 190 )
				end
			},
			{
				function ()
					return self.LabelBacker:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 304, 0, 0, _1080p * 24, 0 )
				end,
				function ()
					return self.LabelBacker:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 304, 0, 0, _1080p * 24, 270 )
				end,
				function ()
					return self.LabelBacker:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24, 69, LUI.EASING.outBack )
				end
			}
		} )
		DescriptionText:RegisterAnimationSequence( "Bootup", {
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
		FractionText:RegisterAnimationSequence( "Bootup", {
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
		Type:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Type:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Type:SetAlpha( 0, 340 )
				end,
				function ()
					return self.Type:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Type:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Type:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Type:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Type:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Type:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Type:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Background:AnimateSequence( "Bootup" )
			MeterGradient:AnimateSequence( "Bootup" )
			LabelBacker:AnimateSequence( "Bootup" )
			DescriptionText:AnimateSequence( "Bootup" )
			FractionText:AnimateSequence( "Bootup" )
			Type:AnimateSequence( "Bootup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local2( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "SmallContractCP", SmallContractCP )
LockTable( _M )
