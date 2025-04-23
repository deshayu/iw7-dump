local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5 )
	local f1_local0 = CODCASTER.GetTeamName( f1_arg1, f1_arg5 )
	local f1_local1 = RegisterMaterial( CODCASTER.GetTeamLogoMaterial( f1_arg1, f1_arg5 ) )
	f1_arg2:SetAlpha( 1, 0 )
	f1_arg2:setImage( f1_local1, 0 )
	f1_arg3:setText( f1_local0, 0 )
	local f1_local2, f1_local3, f1_local4, f1_local5 = f1_arg3:getLocalRect()
	CODCASTER.ResizeTeamNameText( f1_arg3, f1_local3 )
	f1_arg3:SetAlpha( 1, 0 )
	local f1_local6 = f1_arg0.RoundEndReason:getText()
	if string.find( f1_local6, "UNSA" ) then
		f1_arg0.RoundEndReason:setText( string.gsub( f1_local6, "UNSA", CODCASTER.GetTeam1Name( f1_arg1 ) ), 0 )
	elseif string.find( f1_local6, "SDF" ) then
		f1_arg0.RoundEndReason:setText( string.gsub( f1_local6, "SDF", CODCASTER.GetTeam2Name( f1_arg1 ) ), 0 )
	end
	f1_arg0.PlayCodcasterTeamAnim( f1_arg5, f1_arg2 )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0.EnemyWatermark:SetAlpha( 0, 0 )
	f2_arg0.FriendlyWatermark:SetAlpha( 0, 0 )
	f2_arg0.FactionTeamIcon:SetAlpha( 0, 0 )
	f2_arg0.FactionEnemyIcon:SetAlpha( 0, 0 )
	f2_arg0._sequences.Intro = function ()
		f2_arg0.HeaderBackground:AnimateSequence( "Intro" )
		f2_arg0.FriendlyTeamScore:AnimateSequence( "Intro" )
		f2_arg0.EnemyTeamScore:AnimateSequence( "Intro" )
		f2_arg0.Vs:AnimateSequence( "Intro" )
		f2_arg0.RoundEndReason:AnimateSequence( "Intro" )
		f2_arg0.RoundEndTitle:AnimateSequence( "Intro" )
	end
	
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = nil
	f4_local0 = {
		{
			function ()
				return f4_arg1:SetAlpha( 0, 0 )
			end,
			function ()
				return f4_arg1:SetAlpha( 0, 400 )
			end,
			function ()
				return f4_arg1:SetAlpha( 1, 200, LUI.EASING.outBack )
			end
		}
	}
	if f4_arg0 == 1 then
		f4_local0[1] = {
			function ()
				return f4_arg1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -660, _1080p * -420, _1080p * 214, _1080p * 454, 0 )
			end,
			function ()
				return f4_arg1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -660, _1080p * -420, _1080p * 214, _1080p * 454, 400 )
			end,
			function ()
				return f4_arg1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 390, _1080p * 214, _1080p * 454, 200, LUI.EASING.outBack )
			end
		}
	elseif f4_arg0 == 2 then
		f4_local0[1] = {
			function ()
				return f4_arg1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 420, _1080p * 660, _1080p * 214, _1080p * 454, 0 )
			end,
			function ()
				return f4_arg1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 420, _1080p * 660, _1080p * 214, _1080p * 454, 400 )
			end,
			function ()
				return f4_arg1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -390, _1080p * -150, _1080p * 214, _1080p * 454, 200, LUI.EASING.outBack )
			end
		}
	end
	f4_arg1:RegisterAnimationSequence( "Intro", f4_local0 )
	f4_arg1:AnimateSequence( "Intro" )
end

local f0_local3 = function ( f14_arg0, f14_arg1, f14_arg2 )
	assert( f14_arg0.FriendlyTeamScore )
	assert( f14_arg0.EnemyTeamScore )
	assert( f14_arg0.RoundEndTitle )
	assert( f14_arg0.RoundEndReason )
	if not CONDITIONS.IsSplitscreen() then
		f14_arg0:setupLetterboxElement( true )
	end
	f14_arg0.FriendlyTeamScore:SetShadowUOffset( 0 )
	f14_arg0.EnemyTeamScore:SetShadowUOffset( -0 )
	f14_arg0.RoundEndTitle:SetShadowUOffset( -0 )
	f14_arg0.RoundEndTitle:SetShadowVOffset( -0 )
	f14_arg0.RoundEndReason:SetShadowUOffset( -0 )
	f14_arg0.RoundEndReason:SetShadowVOffset( -0 )
	f14_arg0.PlayCodcasterTeamAnim = f0_local2
	f14_arg0:SubscribeToModel( DataSources.inGame.MP.match.matchOver:GetModel( f14_arg1 ), function ()
		if GameX.IsRankedMatch() then
			if DataSources.inGame.MP.match.matchOver:GetValue( f14_arg1 ) ~= nil and DataSources.inGame.MP.match.matchOver:GetValue( f14_arg1 ) == true then
				ACTIONS.AnimateSequence( f14_arg0, "showMatchBonus" )
			end
			if DataSources.inGame.MP.match.matchOver:GetValue( f14_arg1 ) ~= nil and DataSources.inGame.MP.match.matchOver:GetValue( f14_arg1 ) == false then
				ACTIONS.AnimateSequence( f14_arg0, "hideMatchBonus" )
			end
		else
			ACTIONS.AnimateSequence( f14_arg0, "hideMatchBonus" )
		end
	end )
	local f14_local0 = DataSources.inGame.MP.roundEnd.timeToBeatFriendly:GetValue( f14_arg1 )
	local f14_local1 = DataSources.inGame.MP.roundEnd.timeToBeatEnemy:GetValue( f14_arg1 )
	if f14_local0 > 0 or f14_local1 > 0 then
		f14_arg0.FriendlyTeamScore:UnsubscribeFromModel( DataSources.inGame.MP.match.teamScoreFriendly:GetModel( f14_arg1 ) )
		f14_arg0.EnemyTeamScore:UnsubscribeFromModel( DataSources.inGame.MP.match.teamScoreEnemy:GetModel( f14_arg1 ) )
		f14_arg0.FriendlyTeamScore:SubscribeToModel( DataSources.inGame.MP.roundEnd.timeToBeatFriendlyString:GetModel( f14_arg1 ), function ()
			local f16_local0 = DataSources.inGame.MP.roundEnd.timeToBeatFriendlyString:GetValue( f14_arg1 )
			if f16_local0 ~= nil then
				f14_arg0.FriendlyTeamScore:setText( f16_local0, 0 )
			end
		end )
		f14_arg0.EnemyTeamScore:SubscribeToModel( DataSources.inGame.MP.roundEnd.timeToBeatEnemyString:GetModel( f14_arg1 ), function ()
			local f17_local0 = DataSources.inGame.MP.roundEnd.timeToBeatEnemyString:GetValue( f14_arg1 )
			if f17_local0 ~= nil then
				f14_arg0.EnemyTeamScore:setText( f17_local0, 0 )
			end
		end )
		if MP.IsRoundEndTitleEndOfMatch( DataSources.inGame.MP.roundEnd.roundEndTitleIndex:GetValue( f14_arg1 ) ) then
			if not (f14_local1 <= 0 or f14_local0 <= 0 or f14_local1 >= f14_local0) or f14_local0 == 0 then
				f14_arg0.EnemyTeamScore:SetRGBFromTable( SWATCHES.HUD.enemyTeam, 0 )
			elseif not (f14_local1 <= 0 or f14_local0 <= 0 or f14_local0 >= f14_local1) or f14_local1 == 0 then
				f14_arg0.FriendlyTeamScore:SetRGBFromTable( SWATCHES.HUD.friendlyTeam, 0 )
			end
		elseif not (f14_local1 <= 0 or f14_local0 <= 0 or f14_local1 >= f14_local0) or f14_local0 == 0 then
			ACTIONS.AnimateSequence( f14_arg0, "ShowTimeToBeatIndicatorEnemy" )
		else
			ACTIONS.AnimateSequence( f14_arg0, "ShowTimeToBeatIndicatorFriendly" )
		end
	end
	if CODCASTER.IsCODCaster() and CODCASTER.CanCODCast() then
		f0_local1( f14_arg0, f14_arg1 )
		if MLG.ShoutcasterProfileVarBool( f14_arg1, "shoutcaster_team_identity" ) then
			f0_local0( f14_arg0, f14_arg1, f14_arg0.CodcasterTeam1Icon, f14_arg0.CodcasterTeam1Name, f14_arg0.FriendlyTeamScore, 1 )
			f0_local0( f14_arg0, f14_arg1, f14_arg0.CodcasterTeam2Icon, f14_arg0.CodcasterTeam2Name, f14_arg0.EnemyTeamScore, 2 )
		end
		f14_arg0.FriendlyTeamScore:SetShadowRGBFromInt( CODCASTER.GetTeamDarkColor( f14_arg1, 1 ), 0 )
		f14_arg0.EnemyTeamScore:SetShadowRGBFromInt( CODCASTER.GetTeamDarkColor( f14_arg1, 2 ), 0 )
	end
end

function RoundEndTeamHUD( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "RoundEndTeamHUD"
	self._animationSets = {}
	self._sequences = {}
	local f18_local1 = controller and controller.controllerIndex
	if not f18_local1 and not Engine.InFrontend() then
		f18_local1 = self:getRootController()
	end
	assert( f18_local1 )
	self:playSound( "menu_open" )
	local f18_local2 = self
	local RoundEndMatchBonus = nil
	
	RoundEndMatchBonus = MenuBuilder.BuildRegisteredType( "RoundEndMatchBonus", {
		controllerIndex = f18_local1
	} )
	RoundEndMatchBonus.id = "RoundEndMatchBonus"
	RoundEndMatchBonus.MatchBonusTitleText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MATCH_BONUS" ) ), 0 )
	RoundEndMatchBonus:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -200, _1080p * 200, _1080p * -208, _1080p * -100 )
	RoundEndMatchBonus:SubscribeToModel( DataSources.inGame.MP.roundEnd.roundEndMatchBonus:GetModel( f18_local1 ), function ()
		local f19_local0 = DataSources.inGame.MP.roundEnd.roundEndMatchBonus:GetValue( f18_local1 )
		if f19_local0 ~= nil then
			RoundEndMatchBonus.MatchBonusValueText:setText( LocalizeString( f19_local0 ), 0 )
		end
	end )
	self:addElement( RoundEndMatchBonus )
	self.RoundEndMatchBonus = RoundEndMatchBonus
	
	local HeaderBackground = nil
	
	HeaderBackground = MenuBuilder.BuildRegisteredType( "ScoreboardHeaderBG", {
		controllerIndex = f18_local1
	} )
	HeaderBackground.id = "HeaderBackground"
	HeaderBackground:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * 250, _1080p * 455 )
	self:addElement( HeaderBackground )
	self.HeaderBackground = HeaderBackground
	
	local FactionTeamIcon = nil
	
	FactionTeamIcon = LUI.UIImage.new()
	FactionTeamIcon.id = "FactionTeamIcon"
	FactionTeamIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 390, _1080p * 170, _1080p * 594 )
	FactionTeamIcon:SubscribeToModel( DataSources.inGame.scoreboard.teamA.logo:GetModel( f18_local1 ), function ()
		local f20_local0 = DataSources.inGame.scoreboard.teamA.logo:GetValue( f18_local1 )
		if f20_local0 ~= nil then
			FactionTeamIcon:setImage( RegisterMaterial( f20_local0 ), 0 )
		end
	end )
	self:addElement( FactionTeamIcon )
	self.FactionTeamIcon = FactionTeamIcon
	
	local FactionEnemyIcon = nil
	
	FactionEnemyIcon = LUI.UIImage.new()
	FactionEnemyIcon.id = "FactionEnemyIcon"
	FactionEnemyIcon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -150, _1080p * -390, _1080p * 170, _1080p * 594 )
	FactionEnemyIcon:SubscribeToModel( DataSources.inGame.scoreboard.teamB.logo:GetModel( f18_local1 ), function ()
		local f21_local0 = DataSources.inGame.scoreboard.teamB.logo:GetValue( f18_local1 )
		if f21_local0 ~= nil then
			FactionEnemyIcon:setImage( RegisterMaterial( f21_local0 ), 0 )
		end
	end )
	self:addElement( FactionEnemyIcon )
	self.FactionEnemyIcon = FactionEnemyIcon
	
	local FriendlyWatermark = nil
	
	FriendlyWatermark = LUI.UIImage.new()
	FriendlyWatermark.id = "FriendlyWatermark"
	FriendlyWatermark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 400, _1080p * 556, _1080p * 360, _1080p * 400 )
	FriendlyWatermark:SubscribeToModel( DataSources.inGame.scoreboard.teamA.watermark:GetModel( f18_local1 ), function ()
		local f22_local0 = DataSources.inGame.scoreboard.teamA.watermark:GetValue( f18_local1 )
		if f22_local0 ~= nil then
			FriendlyWatermark:setImage( RegisterMaterial( f22_local0 ), 0 )
		end
	end )
	self:addElement( FriendlyWatermark )
	self.FriendlyWatermark = FriendlyWatermark
	
	local EnemyWatermark = nil
	
	EnemyWatermark = LUI.UIImage.new()
	EnemyWatermark.id = "EnemyWatermark"
	EnemyWatermark:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -556, _1080p * -400, _1080p * 360, _1080p * 400 )
	EnemyWatermark:SubscribeToModel( DataSources.inGame.scoreboard.teamB.watermark:GetModel( f18_local1 ), function ()
		local f23_local0 = DataSources.inGame.scoreboard.teamB.watermark:GetValue( f18_local1 )
		if f23_local0 ~= nil then
			EnemyWatermark:setImage( RegisterMaterial( f23_local0 ), 0 )
		end
	end )
	self:addElement( EnemyWatermark )
	self.EnemyWatermark = EnemyWatermark
	
	local FriendlyTeamScore = nil
	
	FriendlyTeamScore = LUI.UIStyledText.new()
	FriendlyTeamScore.id = "FriendlyTeamScore"
	FriendlyTeamScore:SetFontSize( 105 * _1080p )
	FriendlyTeamScore:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendlyTeamScore:SetAlignment( LUI.Alignment.Right )
	FriendlyTeamScore:SetStartupDelay( 1000 )
	FriendlyTeamScore:SetLineHoldTime( 400 )
	FriendlyTeamScore:SetAnimMoveTime( 150 )
	FriendlyTeamScore:SetEndDelay( 1000 )
	FriendlyTeamScore:SetCrossfadeTime( 400 )
	FriendlyTeamScore:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	FriendlyTeamScore:SetMaxVisibleLines( 1 )
	FriendlyTeamScore:SetShadowMinDistance( -0.01, 0 )
	FriendlyTeamScore:SetShadowMaxDistance( 0.01, 0 )
	FriendlyTeamScore:SetShadowRGBFromInt( 3305631, 0 )
	FriendlyTeamScore:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 589, _1080p * 890, _1080p * 325, _1080p * 425 )
	FriendlyTeamScore:SubscribeToModel( DataSources.inGame.MP.match.teamScoreFriendly:GetModel( f18_local1 ), function ()
		local f24_local0 = DataSources.inGame.MP.match.teamScoreFriendly:GetValue( f18_local1 )
		if f24_local0 ~= nil then
			FriendlyTeamScore:setText( f24_local0, 0 )
		end
	end )
	self:addElement( FriendlyTeamScore )
	self.FriendlyTeamScore = FriendlyTeamScore
	
	local EnemyTeamScore = nil
	
	EnemyTeamScore = LUI.UIStyledText.new()
	EnemyTeamScore.id = "EnemyTeamScore"
	EnemyTeamScore:SetFontSize( 105 * _1080p )
	EnemyTeamScore:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	EnemyTeamScore:SetAlignment( LUI.Alignment.Left )
	EnemyTeamScore:SetOptOutRightToLeftAlignmentFlip( true )
	EnemyTeamScore:SetStartupDelay( 1000 )
	EnemyTeamScore:SetLineHoldTime( 400 )
	EnemyTeamScore:SetAnimMoveTime( 150 )
	EnemyTeamScore:SetEndDelay( 1000 )
	EnemyTeamScore:SetCrossfadeTime( 400 )
	EnemyTeamScore:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	EnemyTeamScore:SetMaxVisibleLines( 1 )
	EnemyTeamScore:SetShadowMinDistance( -0.01, 0 )
	EnemyTeamScore:SetShadowMaxDistance( 0.01, 0 )
	EnemyTeamScore:SetShadowRGBFromInt( 9456195, 0 )
	EnemyTeamScore:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -890, _1080p * -585, _1080p * 325, _1080p * 425 )
	EnemyTeamScore:SubscribeToModel( DataSources.inGame.MP.match.teamScoreEnemy:GetModel( f18_local1 ), function ()
		local f25_local0 = DataSources.inGame.MP.match.teamScoreEnemy:GetValue( f18_local1 )
		if f25_local0 ~= nil then
			EnemyTeamScore:setText( f25_local0, 0 )
		end
	end )
	self:addElement( EnemyTeamScore )
	self.EnemyTeamScore = EnemyTeamScore
	
	local Vs = nil
	
	Vs = LUI.UIStyledText.new()
	Vs.id = "Vs"
	Vs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_VERSUS" ) ), 0 )
	Vs:SetFontSize( 48 * _1080p )
	Vs:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Vs:SetAlignment( LUI.Alignment.Center )
	Vs:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -100, _1080p * 100, _1080p * 355, _1080p * 403 )
	self:addElement( Vs )
	self.Vs = Vs
	
	local RoundEndReason = nil
	
	RoundEndReason = LUI.UIStyledText.new()
	RoundEndReason.id = "RoundEndReason"
	RoundEndReason:SetFontSize( 38 * _1080p )
	RoundEndReason:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RoundEndReason:SetAlignment( LUI.Alignment.Center )
	RoundEndReason:SetShadowMinDistance( -0.01, 0 )
	RoundEndReason:SetShadowMaxDistance( 0.01, 0 )
	RoundEndReason:SetShadowRGBFromInt( 0, 0 )
	RoundEndReason:SetDecodeUseSystemTime( false )
	RoundEndReason:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * 256, _1080p * 294 )
	RoundEndReason:SubscribeToModel( DataSources.inGame.MP.roundEnd.roundEndReason:GetModel( f18_local1 ), function ()
		local f26_local0 = DataSources.inGame.MP.roundEnd.roundEndReason:GetValue( f18_local1 )
		if f26_local0 ~= nil then
			RoundEndReason:setText( ToUpperCase( LocalizeString( f26_local0 ) ), 0 )
		end
	end )
	self:addElement( RoundEndReason )
	self.RoundEndReason = RoundEndReason
	
	local RoundEndTitle = nil
	
	RoundEndTitle = LUI.UIStyledText.new()
	RoundEndTitle.id = "RoundEndTitle"
	RoundEndTitle:SetFontSize( 105 * _1080p )
	RoundEndTitle:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	RoundEndTitle:SetAlignment( LUI.Alignment.Center )
	RoundEndTitle:SetShadowMinDistance( -0.01, 0 )
	RoundEndTitle:SetShadowMaxDistance( 0.01, 0 )
	RoundEndTitle:SetShadowRGBFromInt( 0, 0 )
	RoundEndTitle:SetDecodeUseSystemTime( false )
	RoundEndTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * 125, _1080p * 245 )
	RoundEndTitle:SubscribeToModel( DataSources.inGame.MP.roundEnd.roundEndTitle:GetModel( f18_local1 ), function ()
		local f27_local0 = DataSources.inGame.MP.roundEnd.roundEndTitle:GetValue( f18_local1 )
		if f27_local0 ~= nil then
			RoundEndTitle:setText( LocalizeString( ToUpperCase( f27_local0 ) ), 0 )
		end
	end )
	self:addElement( RoundEndTitle )
	self.RoundEndTitle = RoundEndTitle
	
	local TimeToBeatIndicator = nil
	
	TimeToBeatIndicator = MenuBuilder.BuildRegisteredType( "TimeToBeat", {
		controllerIndex = f18_local1
	} )
	TimeToBeatIndicator.id = "TimeToBeatIndicator"
	TimeToBeatIndicator:SetAlpha( 0, 0 )
	TimeToBeatIndicator:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -100, _1080p * 100, _1080p * 440, _1080p * 466 )
	self:addElement( TimeToBeatIndicator )
	self.TimeToBeatIndicator = TimeToBeatIndicator
	
	local CodcasterTeam2Icon = nil
	
	CodcasterTeam2Icon = LUI.UIImage.new()
	CodcasterTeam2Icon.id = "CodcasterTeam2Icon"
	CodcasterTeam2Icon:SetAlpha( 0, 0 )
	CodcasterTeam2Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1530, _1080p * 1770, _1080p * 214, _1080p * 454 )
	self:addElement( CodcasterTeam2Icon )
	self.CodcasterTeam2Icon = CodcasterTeam2Icon
	
	local CodcasterTeam1Icon = nil
	
	CodcasterTeam1Icon = LUI.UIImage.new()
	CodcasterTeam1Icon.id = "CodcasterTeam1Icon"
	CodcasterTeam1Icon:SetAlpha( 0, 0 )
	CodcasterTeam1Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 390, _1080p * 214, _1080p * 454 )
	self:addElement( CodcasterTeam1Icon )
	self.CodcasterTeam1Icon = CodcasterTeam1Icon
	
	local CodcasterTeam1Name = nil
	
	CodcasterTeam1Name = LUI.UIText.new()
	CodcasterTeam1Name.id = "CodcasterTeam1Name"
	CodcasterTeam1Name:SetAlpha( 0, 0 )
	CodcasterTeam1Name:setText( Engine.Localize( "MENU_NEW" ), 0 )
	CodcasterTeam1Name:SetFontSize( 45 * _1080p )
	CodcasterTeam1Name:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CodcasterTeam1Name:SetAlignment( LUI.Alignment.Left )
	CodcasterTeam1Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 391, _1080p * 670, _1080p * 360, _1080p * 405 )
	self:addElement( CodcasterTeam1Name )
	self.CodcasterTeam1Name = CodcasterTeam1Name
	
	local CodcasterTeam2Name = nil
	
	CodcasterTeam2Name = LUI.UIText.new()
	CodcasterTeam2Name.id = "CodcasterTeam2Name"
	CodcasterTeam2Name:SetAlpha( 0, 0 )
	CodcasterTeam2Name:setText( Engine.Localize( "MENU_NEW" ), 0 )
	CodcasterTeam2Name:SetFontSize( 45 * _1080p )
	CodcasterTeam2Name:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CodcasterTeam2Name:SetAlignment( LUI.Alignment.Right )
	CodcasterTeam2Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1245, _1080p * 1524, _1080p * 360, _1080p * 405 )
	self:addElement( CodcasterTeam2Name )
	self.CodcasterTeam2Name = CodcasterTeam2Name
	
	local f18_local19 = nil
	if CONDITIONS.IsCorePublicMatch( self ) then
		f18_local19 = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
			controllerIndex = f18_local1
		} )
		f18_local19.id = "DoubleXPNotifications"
		f18_local19:SetScale( -0.5, 0 )
		f18_local19:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32, _1080p * 288, _1080p * 22, _1080p * 150 )
		self:addElement( f18_local19 )
		self.DoubleXPNotifications = f18_local19
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RoundEndMatchBonus:RegisterAnimationSequence( "showMatchBonus", {
			{
				function ()
					return self.RoundEndMatchBonus:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.showMatchBonus = function ()
			RoundEndMatchBonus:AnimateSequence( "showMatchBonus" )
		end
		
		RoundEndMatchBonus:RegisterAnimationSequence( "hideMatchBonus", {
			{
				function ()
					return self.RoundEndMatchBonus:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hideMatchBonus = function ()
			RoundEndMatchBonus:AnimateSequence( "hideMatchBonus" )
		end
		
		HeaderBackground:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.HeaderBackground:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HeaderBackground:SetAlpha( 0, 90 )
				end,
				function ()
					return self.HeaderBackground:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.HeaderBackground:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 960, _1080p * -960, _1080p * 250, _1080p * 455, 0 )
				end,
				function ()
					return self.HeaderBackground:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 960, _1080p * -960, _1080p * 250, _1080p * 455, 100 )
				end,
				function ()
					return self.HeaderBackground:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * 250, _1080p * 455, 200, LUI.EASING.outBack )
				end
			}
		} )
		FactionTeamIcon:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.FactionTeamIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FactionTeamIcon:SetAlpha( 0, 400 )
				end,
				function ()
					return self.FactionTeamIcon:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.FactionTeamIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -660, _1080p * -420, _1080p * 170, _1080p * 594, 0 )
				end,
				function ()
					return self.FactionTeamIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -660, _1080p * -420, _1080p * 170, _1080p * 594, 400 )
				end,
				function ()
					return self.FactionTeamIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 390, _1080p * 170, _1080p * 594, 200, LUI.EASING.outBack )
				end
			}
		} )
		FactionEnemyIcon:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.FactionEnemyIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FactionEnemyIcon:SetAlpha( 0, 400 )
				end,
				function ()
					return self.FactionEnemyIcon:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.FactionEnemyIcon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 660, _1080p * 420, _1080p * 170, _1080p * 594, 0 )
				end,
				function ()
					return self.FactionEnemyIcon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 660, _1080p * 420, _1080p * 170, _1080p * 594, 400 )
				end,
				function ()
					return self.FactionEnemyIcon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -150, _1080p * -390, _1080p * 170, _1080p * 594, 200, LUI.EASING.outBack )
				end
			}
		} )
		FriendlyWatermark:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.FriendlyWatermark:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FriendlyWatermark:SetAlpha( 0, 300 )
				end,
				function ()
					return self.FriendlyWatermark:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.FriendlyWatermark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -410, _1080p * -254, _1080p * 360, _1080p * 400, 0 )
				end,
				function ()
					return self.FriendlyWatermark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -410, _1080p * -254, _1080p * 360, _1080p * 400, 300 )
				end,
				function ()
					return self.FriendlyWatermark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 400, _1080p * 556, _1080p * 360, _1080p * 400, 199, LUI.EASING.outBack )
				end
			}
		} )
		EnemyWatermark:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.EnemyWatermark:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EnemyWatermark:SetAlpha( 0, 300 )
				end,
				function ()
					return self.EnemyWatermark:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.EnemyWatermark:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 254, _1080p * 410, _1080p * 360, _1080p * 400, 0 )
				end,
				function ()
					return self.EnemyWatermark:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 254, _1080p * 410, _1080p * 360, _1080p * 400, 300 )
				end,
				function ()
					return self.EnemyWatermark:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -556, _1080p * -400, _1080p * 360, _1080p * 400, 199, LUI.EASING.outBack )
				end
			}
		} )
		FriendlyTeamScore:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.FriendlyTeamScore:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FriendlyTeamScore:SetAlpha( 0, 200 )
				end,
				function ()
					return self.FriendlyTeamScore:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.FriendlyTeamScore:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -305, 0, _1080p * 325, _1080p * 425, 0 )
				end,
				function ()
					return self.FriendlyTeamScore:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -305, 0, _1080p * 325, _1080p * 425, 200 )
				end,
				function ()
					return self.FriendlyTeamScore:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 585, _1080p * 890, _1080p * 325, _1080p * 425, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.FriendlyTeamScore:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 585, _1080p * 890, _1080p * 325, _1080p * 425, 200 )
				end
			}
		} )
		EnemyTeamScore:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.EnemyTeamScore:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EnemyTeamScore:SetAlpha( 0, 200 )
				end,
				function ()
					return self.EnemyTeamScore:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.EnemyTeamScore:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * 305, _1080p * 320, _1080p * 440, 0 )
				end,
				function ()
					return self.EnemyTeamScore:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * 305, _1080p * 325, _1080p * 425, 200 )
				end,
				function ()
					return self.EnemyTeamScore:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -890, _1080p * -585, _1080p * 325, _1080p * 425, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.EnemyTeamScore:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -890, _1080p * -585, _1080p * 325, _1080p * 425, 200 )
				end
			}
		} )
		Vs:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Vs:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Vs:SetAlpha( 0, 150 )
				end,
				function ()
					return self.Vs:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Vs:SetScale( -1, 150 )
				end,
				function ()
					return self.Vs:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		RoundEndReason:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.RoundEndReason:SetScale( 1, 0 )
				end,
				function ()
					return self.RoundEndReason:SetScale( 0, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.RoundEndReason:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RoundEndReason:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			}
		} )
		RoundEndTitle:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.RoundEndTitle:SetScale( 1, 0 )
				end,
				function ()
					return self.RoundEndTitle:SetScale( 0, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.RoundEndTitle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RoundEndTitle:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Intro = function ()
			HeaderBackground:AnimateSequence( "Intro" )
			FactionTeamIcon:AnimateSequence( "Intro" )
			FactionEnemyIcon:AnimateSequence( "Intro" )
			FriendlyWatermark:AnimateSequence( "Intro" )
			EnemyWatermark:AnimateSequence( "Intro" )
			FriendlyTeamScore:AnimateSequence( "Intro" )
			EnemyTeamScore:AnimateSequence( "Intro" )
			Vs:AnimateSequence( "Intro" )
			RoundEndReason:AnimateSequence( "Intro" )
			RoundEndTitle:AnimateSequence( "Intro" )
		end
		
		TimeToBeatIndicator:RegisterAnimationSequence( "ShowTimeToBeatIndicatorFriendly", {
			{
				function ()
					return self.TimeToBeatIndicator:SetAlpha( 0, 200 )
				end,
				function ()
					return self.TimeToBeatIndicator:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.TimeToBeatIndicator:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 647.5, _1080p * 847.5, _1080p * 440, _1080p * 466, 0 )
				end
			}
		} )
		self._sequences.ShowTimeToBeatIndicatorFriendly = function ()
			TimeToBeatIndicator:AnimateSequence( "ShowTimeToBeatIndicatorFriendly" )
		end
		
		TimeToBeatIndicator:RegisterAnimationSequence( "ShowTimeToBeatIndicatorEnemy", {
			{
				function ()
					return self.TimeToBeatIndicator:SetAlpha( 0, 200 )
				end,
				function ()
					return self.TimeToBeatIndicator:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.TimeToBeatIndicator:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -847.5, _1080p * -647.5, _1080p * 440, _1080p * 466, 0 )
				end
			}
		} )
		self._sequences.ShowTimeToBeatIndicatorEnemy = function ()
			TimeToBeatIndicator:AnimateSequence( "ShowTimeToBeatIndicatorEnemy" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local3( self, f18_local1, controller )
	ACTIONS.AnimateSequence( self, "Intro" )
	ACTIONS.PlaySoundSetSound( self, "intro", false )
	return self
end

MenuBuilder.registerType( "RoundEndTeamHUD", RoundEndTeamHUD )
LockTable( _M )
