local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "inGame.MP.scoreboard"
f0_local1 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 32
	local f1_local1 = CONDITIONS.IsSplitscreen( f1_arg0 ) and 288 or 455
	local f1_local2 = CONDITIONS.IsSplitscreen( f1_arg0 ) and 80 or 250
	local f1_local3 = CONDITIONS.IsSplitscreen( f1_arg0 ) and 285 or 100
	local f1_local4 = CONDITIONS.IsSplitscreen( f1_arg0 ) and -295 or -100
	local f1_local5 = f1_arg1 * f1_local0 + f1_local1 + 22
	if f1_arg0.BackgroundBlur then
		f1_arg0.BackgroundBlur:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * f1_local3, _1080p * f1_local4, _1080p * f1_local2, _1080p * f1_local5 )
	end
	if f1_arg0.ButtonHelperBar then
		local f1_local6 = f1_local5
		local f1_local7 = f1_local6 + 55
		if CONDITIONS.IsSplitscreen( f1_arg0 ) then
			f1_arg0.ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 285, _1080p * -295, _1080p * f1_local6, _1080p * f1_local7 )
		else
			f1_arg0.ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * f1_local6, _1080p * f1_local7 )
		end
	end
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.MatchTimer )
	assert( f2_arg0.FriendlyScores )
	assert( f2_arg0.EnemyScores )
	assert( f2_arg0.FactionTeamIcon )
	assert( f2_arg0.FactionEnemyIcon )
	assert( f2_arg0.FriendlyTeamScore )
	assert( f2_arg0.EnemyTeamScore )
	assert( f2_arg0.FriendlyWatermark )
	assert( f2_arg0.EnemyWatermark )
	assert( f2_arg0.FriendlyTeamTimeToBeat )
	assert( f2_arg0.EnemyTeamTimeToBeat )
	if not CONDITIONS.IsSplitscreen() then
		f2_arg0:setupLetterboxElement( true )
	end
	f2_arg0.FriendlyTeamScore:SetShadowUOffset( 0 )
	f2_arg0.EnemyTeamScore:SetShadowUOffset( -0 )
	f2_arg0.FriendlyTeamTimeToBeat:SetShadowUOffset( 0 )
	f2_arg0.EnemyTeamTimeToBeat:SetShadowUOffset( -0 )
	local self = LUI.UITimer.new( nil, {
		interval = 1000,
		event = "refreshScores"
	} )
	self.id = "TeamScoresTimer"
	f2_arg0:addElement( self )
	f2_arg0:registerEventHandler( "refreshScores", function ( element, event )
		element.FriendlyScores:RefreshRows()
		element.EnemyScores:RefreshRows()
		local f3_local0 = element.FriendlyScores:GetNumPlayers()
		local f3_local1 = element.EnemyScores:GetNumPlayers()
		local f3_local2 = LUI.clamp( math.max( f3_local0, f3_local1 ), 4, SCOREBOARD.maxVisibleTeamSize )
		element.FriendlyScores:UpdateScrollIndicatorArrow( f3_local0, SCOREBOARD.maxVisibleTeamSize )
		element.EnemyScores:UpdateScrollIndicatorArrow( f3_local1, SCOREBOARD.maxVisibleTeamSize )
		element.FriendlyScores:SetBackgroundRowCount( f3_local2 )
		element.EnemyScores:SetBackgroundRowCount( f3_local2 )
		f0_local1( element, f3_local2 )
	end )
	f2_arg0.team1LogoDefault = f2_arg0.FactionTeamIcon:GetImage()
	f2_arg0.team2LogoDefault = f2_arg0.FactionEnemyIcon:GetImage()
	f2_arg0.FriendlyScores.Background:SetRGBFromTable( SWATCHES.Scoreboard.friendlyTeam, 0 )
	f2_arg0.EnemyScores.Background:SetRGBFromTable( SWATCHES.Scoreboard.enemyTeam, 0 )
	f2_arg0.IsCODCaster = false
	f2_arg0.UpdateScoreboardTeamIdentity = function ( f4_arg0 )
		local f4_local0 = f4_arg0.team1LogoDefault
		local f4_local1 = f4_arg0.team2LogoDefault
		local f4_local2 = CODCASTER.GetTeam1Name( f2_arg1 )
		local f4_local3 = CODCASTER.GetTeam2Name( f2_arg1 )
		local f4_local4 = MLG.ShoutcasterProfileVarValue( f2_arg1, "shoutcaster_fe_team1_color" )
		local f4_local5 = MLG.ShoutcasterProfileVarValue( f2_arg1, "shoutcaster_fe_team2_color" )
		if f4_arg0.IsCODCaster ~= CODCASTER.IsCODCaster() then
			f4_arg0.IsCODCaster = CODCASTER.IsCODCaster()
			if CODCASTER.IsCODCaster() and CODCASTER.CanCODCast() then
				f4_local0 = RegisterMaterial( CODCASTER.GetTeam1LogoMaterial( f2_arg1 ) )
				f4_local1 = RegisterMaterial( CODCASTER.GetTeam2LogoMaterial( f2_arg1 ) )
				f4_arg0.CodcasterTeam1Icon:SetAlpha( 1, 0 )
				f4_arg0.CodcasterTeam2Icon:SetAlpha( 1, 0 )
				f4_arg0.FactionTeamIcon:SetAlpha( 0, 0 )
				f4_arg0.FactionEnemyIcon:SetAlpha( 0, 0 )
				f4_arg0.CodcasterTeam1Name:setText( f4_local2, 0 )
				f4_arg0.CodcasterTeam2Name:setText( f4_local3, 0 )
				f4_arg0.CodcasterTeam1Name:SetAlpha( 1, 0 )
				f4_arg0.CodcasterTeam2Name:SetAlpha( 1, 0 )
				f4_arg0.EnemyWatermark:SetAlpha( 0, 0 )
				f4_arg0.FriendlyWatermark:SetAlpha( 0, 0 )
				local f4_local6, f4_local7, f4_local8, f4_local9 = f4_arg0.CodcasterTeam1Name:getLocalRect()
				CODCASTER.ResizeTeamNameText( f4_arg0.CodcasterTeam1Name, f4_local7 )
				CODCASTER.ResizeTeamNameText( f4_arg0.CodcasterTeam2Name, f4_local7 )
				local f4_local10 = CODCASTER.GetTeam1DarkColor( f2_arg1 )
				local f4_local11 = CODCASTER.GetTeam2DarkColor( f2_arg1 )
				f4_arg0.FriendlyTeamScore:SetShadowRGBFromInt( f4_local10, 0 )
				f4_arg0.EnemyTeamScore:SetShadowRGBFromInt( f4_local11, 0 )
				f4_arg0.FriendlyScores.Background:SetRGBFromInt( f4_local10, 0 )
				f4_arg0.EnemyScores.Background:SetRGBFromInt( f4_local11, 0 )
				f4_arg0.FriendlyScores.Background:SetAlpha( 0.5, 0 )
				f4_arg0.EnemyScores.Background:SetAlpha( 0.5, 0 )
			else
				f4_local0 = RegisterMaterial( DataSources.inGame.scoreboard.teamA.logo:GetValue( f2_arg1 ) )
				f4_local1 = RegisterMaterial( DataSources.inGame.scoreboard.teamB.logo:GetValue( f2_arg1 ) )
				f4_arg0.CodcasterTeam1Icon:SetAlpha( 0, 0 )
				f4_arg0.CodcasterTeam2Icon:SetAlpha( 0, 0 )
				f4_arg0.FactionTeamIcon:SetAlpha( 1, 0 )
				f4_arg0.FactionEnemyIcon:SetAlpha( 1, 0 )
				f4_arg0.CodcasterTeam1Name:SetAlpha( 0, 0 )
				f4_arg0.CodcasterTeam2Name:SetAlpha( 0, 0 )
				f4_arg0.EnemyWatermark:SetAlpha( 1, 0 )
				f4_arg0.FriendlyWatermark:SetAlpha( 1, 0 )
				f4_arg0.FriendlyScores.Background:SetRGBFromTable( SWATCHES.Scoreboard.friendlyTeam, 0 )
				f4_arg0.EnemyScores.Background:SetRGBFromTable( SWATCHES.Scoreboard.enemyTeam, 0 )
				f4_arg0.FriendlyTeamScore:SetShadowRGBFromTable( SWATCHES.Scoreboard.friendlyTeam, 0 )
				f4_arg0.EnemyTeamScore:SetShadowRGBFromTable( SWATCHES.Scoreboard.enemyTeam, 0 )
			end
			f4_arg0.CodcasterTeam1Icon:setImage( f4_local0, 0 )
			f4_arg0.CodcasterTeam2Icon:setImage( f4_local1, 0 )
		end
		if CODCASTER.IsCODCaster() and CODCASTER.CanCODCast() then
			local f4_local6 = MLG.ShoutcasterProfileVarBool( f2_arg1, "shoutcaster_team_identity" ) and 1 or 0
			f4_arg0.CodcasterTeam1Icon:SetAlpha( f4_local6 )
			f4_arg0.CodcasterTeam2Icon:SetAlpha( f4_local6 )
			f4_arg0.CodcasterTeam1Name:SetAlpha( f4_local6 )
			f4_arg0.CodcasterTeam2Name:SetAlpha( f4_local6 )
		end
	end
	
	local f2_local1 = LUI.UIBindButton.new()
	f2_local1.id = "EnemyScoresBindButton"
	f2_arg0.EnemyScores:addElement( f2_local1 )
	f2_local1:addEventHandler( "button_left", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or controller
		local f5_local1 = f5_arg0:getParent()
		if #f5_local1:getAllFocusedChildren() <= 0 then
			f5_local1 = f5_arg0:getParent()
			if f5_local1:isInFocus() then
			
			else
				return false
			end
		end
		if f2_arg0.FriendlyScores.Players:GetNumRows() > 0 then
			ACTIONS.LoseFocus( f2_arg0, "EnemyScores", f2_arg1 )
			ACTIONS.GainFocus( f2_arg0, "FriendlyScores", f2_arg1 )
			return true
		end
		return false
	end )
	local f2_local2 = LUI.UIBindButton.new()
	f2_local2.id = "FriendlyScoresBindButton"
	f2_arg0.FriendlyScores:addElement( f2_local2 )
	f2_local2:addEventHandler( "button_right", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f6_arg1.controller or controller
		local f6_local1 = f6_arg0:getParent()
		if #f6_local1:getAllFocusedChildren() <= 0 then
			f6_local1 = f6_arg0:getParent()
			if f6_local1:isInFocus() then
			
			else
				return false
			end
		end
		if f2_arg0.EnemyScores.Players:GetNumRows() > 0 then
			ACTIONS.LoseFocus( f2_arg0, "FriendlyScores", f2_arg1 )
			ACTIONS.GainFocus( f2_arg0, "EnemyScores", f2_arg1 )
			return true
		end
		return false
	end )
	f2_arg0:addEventHandler( "open_scoreboard", function ( f7_arg0, f7_arg1 )
		f2_arg0:UpdateScoreboardTeamIdentity()
		f2_arg0:processEvent( {
			name = "refreshScores"
		} )
		ACTIONS.GainFocus( f2_arg0, "FriendlyScores", f2_arg1 )
	end )
	f2_arg0:addEventHandler( "close_scoreboard", function ( f8_arg0, f8_arg1 )
		ACTIONS.LoseFocus( f2_arg0, "FriendlyScores", f2_arg1 )
		ACTIONS.LoseFocus( f2_arg0, "EnemyScores", f2_arg1 )
		WipeControllerModelsAtPath( f0_local0 )
	end )
	local f2_local3 = LUI.DataSourceInControllerModel.new( f0_local0 .. ".friendlyFocus" )
	local f2_local4 = LUI.DataSourceInControllerModel.new( f0_local0 .. ".enemyFocus" )
	f2_arg0.FriendlyScores.Players:SetLastFocusIndexDataSource( f2_local3 )
	f2_arg0.EnemyScores.Players:SetLastFocusIndexDataSource( f2_local4 )
	local f2_local5 = DataSources.inGame.currentPlayerClientNum:GetValue( f2_arg1 )
	f2_arg0:SubscribeToModel( DataSources.inGame.MP.match.team:GetModel( f2_arg1 ), function ()
		local f9_local0 = DataSources.inGame.MP.match.team:GetValue( f2_arg1 )
		if f9_local0 == Teams.axis then
			f2_arg0.FriendlyScores:SetTeam( f9_local0 )
			f2_arg0.EnemyScores:SetTeam( Teams.allies )
		elseif f9_local0 == Teams.allies then
			f2_arg0.FriendlyScores:SetTeam( f9_local0 )
			f2_arg0.EnemyScores:SetTeam( Teams.axis )
		else
			f2_arg0.FriendlyScores:SetTeam( Teams.allies )
			f2_arg0.EnemyScores:SetTeam( Teams.axis )
		end
		local f9_local1 = function ( f10_arg0, f10_arg1 )
			return function ()
				local f11_local0 = f10_arg1:GetValue( f2_arg1 )
				if not f11_local0 then
					f11_local0 = f10_arg0:GetMyRowIndex()
				end
				if f11_local0 then
					return {
						x = 0,
						y = f11_local0
					}
				else
					
				end
			end
			
		end
		
		f2_arg0.FriendlyScores:SetDefaultFocusFunction( f9_local1( f2_arg0.FriendlyScores, f2_local4 ) )
		f2_arg0.EnemyScores:SetDefaultFocusFunction( f9_local1( f2_arg0.EnemyScores, f2_local3 ) )
	end )
	f2_arg0:addEventHandler( "gamepad_button", function ( f12_arg0, f12_arg1 )
		if #f2_arg0.FriendlyScores:getAllFocusedChildren() > 0 then
			assert( f2_arg0.FriendlyScores.Players )
			return f2_arg0.FriendlyScores.Players:ProcessEventToChildInFocus( f12_arg1 )
		elseif #f2_arg0.EnemyScores:getAllFocusedChildren() > 0 then
			assert( f2_arg0.EnemyScores.Players )
			return f2_arg0.EnemyScores.Players:ProcessEventToChildInFocus( f12_arg1 )
		else
			
		end
	end )
	f2_arg0:SubscribeToModel( DataSources.inGame.MP.match.matchTimerHidden:GetModel( f2_arg1 ), function ()
		if DataSources.inGame.MP.match.matchTimerHidden:GetValue( f2_arg1 ) ~= nil and DataSources.inGame.MP.match.matchTimerHidden:GetValue( f2_arg1 ) == true then
			f2_arg0.MatchTimer:SetAlpha( 0 )
		end
		if DataSources.inGame.MP.match.matchTimerHidden:GetValue( f2_arg1 ) ~= nil and DataSources.inGame.MP.match.matchTimerHidden:GetValue( f2_arg1 ) == false then
			f2_arg0.MatchTimer:SetAlpha( 1 )
		end
	end )
	local f2_local6 = DataSources.inGame.MP.match.endTime
	f2_arg0:SubscribeToModel( f2_local6:GetModel( f2_arg1 ), function ()
		local f14_local0 = f2_local6:GetValue( f2_arg1 )
		if f14_local0 ~= nil and f14_local0 <= 0 then
			f2_arg0.MatchTimer:SetAlpha( 0 )
		elseif DataSources.inGame.MP.match.matchTimerHidden:GetValue( f2_arg1 ) ~= nil and DataSources.inGame.MP.match.matchTimerHidden:GetValue( f2_arg1 ) == false then
			f2_arg0.MatchTimer:SetAlpha( 1 )
		end
	end )
	if CONDITIONS.IsSplitscreen( f2_arg0 ) then
		f2_arg0.ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 285, _1080p * -295, _1080p * -50, 0 )
	end
	f2_arg0:SubscribeToModel( DataSources.inGame.MP.match.matchTimerStopped:GetModel( f2_arg1 ), function ( f15_arg0 )
		if DataModel.GetModelValue( f15_arg0 ) then
			f2_arg0.MatchTimer:freeze()
		else
			f2_arg0.MatchTimer:unfreeze()
		end
	end )
	f2_arg0:SubscribeToModel( DataSources.inGame.MP.roundEnd.showTimeToBeat:GetModel( f2_arg1 ), function ()
		if DataSources.inGame.MP.roundEnd.showTimeToBeat:GetValue( f2_arg1 ) ~= nil and DataSources.inGame.MP.roundEnd.showTimeToBeat:GetValue( f2_arg1 ) == true then
			f2_arg0.FriendlyTeamScore:SetAlpha( 0, 0 )
			f2_arg0.EnemyTeamScore:SetAlpha( 0, 0 )
			f2_arg0.EnemyTeamTimeToBeat:SetAlpha( 1, 0 )
			f2_arg0.FriendlyTeamTimeToBeat:SetAlpha( 1, 0 )
		else
			f2_arg0.FriendlyTeamScore:SetAlpha( 1, 0 )
			f2_arg0.EnemyTeamScore:SetAlpha( 1, 0 )
			f2_arg0.EnemyTeamTimeToBeat:SetAlpha( 0, 0 )
			f2_arg0.FriendlyTeamTimeToBeat:SetAlpha( 0, 0 )
		end
	end )
	f2_arg0.FriendlyTeamTimeToBeat:SubscribeToModel( DataSources.inGame.MP.roundEnd.timeToBeatFriendlyString:GetModel( f2_arg1 ), function ()
		assert( f2_arg0.FriendlyTeamTimeToBeat )
		assert( f2_arg0.TimeToBeatFriendlyIndicator )
		local f17_local0 = DataSources.inGame.MP.roundEnd.timeToBeatFriendlyString:GetValue( f2_arg1 )
		if f17_local0 ~= nil then
			f2_arg0.FriendlyTeamTimeToBeat:setText( f17_local0, 0 )
		end
	end )
	f2_arg0.EnemyTeamTimeToBeat:SubscribeToModel( DataSources.inGame.MP.roundEnd.timeToBeatEnemyString:GetModel( f2_arg1 ), function ()
		assert( f2_arg0.EnemyTeamTimeToBeat )
		assert( f2_arg0.TimeToBeatEnemyIndicator )
		local f18_local0 = DataSources.inGame.MP.roundEnd.timeToBeatEnemyString:GetValue( f2_arg1 )
		if f18_local0 ~= nil then
			f2_arg0.EnemyTeamTimeToBeat:setText( f18_local0, 0 )
		end
	end )
	if not Engine.InFrontend() then
		f2_arg0:SubscribeToModel( DataSources.inGame.MP.roundEnd.roundEndTitleIndex:GetModel( f2_arg1 ), function ()
			local f19_local0 = DataSources.inGame.MP.roundEnd.timeToBeatFriendly:GetValue( f2_arg1 )
			local f19_local1 = DataSources.inGame.MP.roundEnd.timeToBeatEnemy:GetValue( f2_arg1 )
			local f19_local2 = MP.IsRoundEndTitleEndOfMatch( DataSources.inGame.MP.roundEnd.roundEndTitleIndex:GetValue( f2_arg1 ) )
			if f19_local1 > 0 and f19_local0 == 0 and not f19_local2 then
				f2_arg0.TimeToBeatEnemyIndicator:SetAlpha( 1, 0 )
			else
				f2_arg0.TimeToBeatEnemyIndicator:SetAlpha( 0, 0 )
			end
			if f19_local0 > 0 and f19_local1 == 0 and not f19_local2 then
				f2_arg0.TimeToBeatFriendlyIndicator:SetAlpha( 1, 0 )
			else
				f2_arg0.TimeToBeatFriendlyIndicator:SetAlpha( 0, 0 )
			end
		end )
	end
end

function TeamScoreboard( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "TeamScoreboard"
	self._animationSets = {}
	self._sequences = {}
	local f20_local1 = controller and controller.controllerIndex
	if not f20_local1 and not Engine.InFrontend() then
		f20_local1 = self:getRootController()
	end
	assert( f20_local1 )
	self:playSound( "menu_open" )
	local f20_local2 = self
	local f20_local3 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f20_local3 = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
			controllerIndex = f20_local1
		} )
		f20_local3.id = "ButtonHelperBar"
		f20_local3:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -82, 0 )
		self:addElement( f20_local3 )
		self.ButtonHelperBar = f20_local3
	end
	local BackgroundBlur = nil
	
	BackgroundBlur = MenuBuilder.BuildRegisteredType( "ScoreboardHeaderBG", {
		controllerIndex = f20_local1
	} )
	BackgroundBlur.id = "BackgroundBlur"
	BackgroundBlur:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * 250, _1080p * 765 )
	self:addElement( BackgroundBlur )
	self.BackgroundBlur = BackgroundBlur
	
	local GameType = nil
	
	GameType = LUI.UIText.new()
	GameType.id = "GameType"
	GameType:SetFontSize( 38 * _1080p )
	GameType:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GameType:SetAlignment( LUI.Alignment.Center )
	GameType:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, _1080p * -96, _1080p * 256, _1080p * 294 )
	GameType:SubscribeToModel( DataSources.inGame.MP.match.gameMode:GetModel( f20_local1 ), function ()
		local f21_local0 = DataSources.inGame.MP.match.gameMode:GetValue( f20_local1 )
		if f21_local0 ~= nil then
			GameType:setText( ToUpperCase( f21_local0 ), 0 )
		end
	end )
	self:addElement( GameType )
	self.GameType = GameType
	
	local MatchTimer = nil
	
	MatchTimer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f20_local1
	} )
	MatchTimer.id = "MatchTimer"
	MatchTimer:SetFontSize( 32 * _1080p )
	MatchTimer:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MatchTimer:SetAlignment( LUI.Alignment.Center )
	MatchTimer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 240, _1080p * 490, _1080p * 260, _1080p * 292 )
	MatchTimer:SubscribeToModel( DataSources.inGame.MP.match.endTime:GetModel( f20_local1 ), function ()
		local f22_local0 = DataSources.inGame.MP.match.endTime:GetValue( f20_local1 )
		if f22_local0 ~= nil then
			MatchTimer:setEndTime( f22_local0 )
		end
	end )
	self:addElement( MatchTimer )
	self.MatchTimer = MatchTimer
	
	local MapName = nil
	
	MapName = LUI.UIStyledText.new()
	MapName.id = "MapName"
	MapName:SetFontSize( 32 * _1080p )
	MapName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MapName:SetAlignment( LUI.Alignment.Center )
	MapName:SetStartupDelay( 1000 )
	MapName:SetLineHoldTime( 400 )
	MapName:SetAnimMoveTime( 150 )
	MapName:SetEndDelay( 1000 )
	MapName:SetCrossfadeTime( 400 )
	MapName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	MapName:SetMaxVisibleLines( 1 )
	MapName:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -500, _1080p * -230, _1080p * 260, _1080p * 292 )
	MapName:SubscribeToModel( DataSources.inGame.mapName:GetModel( f20_local1 ), function ()
		local f23_local0 = DataSources.inGame.mapName:GetValue( f20_local1 )
		if f23_local0 ~= nil then
			MapName:setText( ToUpperCase( f23_local0 ), 0 )
		end
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	local FactionTeamIcon = nil
	
	FactionTeamIcon = LUI.UIImage.new()
	FactionTeamIcon.id = "FactionTeamIcon"
	FactionTeamIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 390, _1080p * 170, _1080p * 594 )
	FactionTeamIcon:SubscribeToModel( DataSources.inGame.scoreboard.teamA.logo:GetModel( f20_local1 ), function ()
		local f24_local0 = DataSources.inGame.scoreboard.teamA.logo:GetValue( f20_local1 )
		if f24_local0 ~= nil then
			FactionTeamIcon:setImage( RegisterMaterial( f24_local0 ), 0 )
		end
	end )
	self:addElement( FactionTeamIcon )
	self.FactionTeamIcon = FactionTeamIcon
	
	local FactionEnemyIcon = nil
	
	FactionEnemyIcon = LUI.UIImage.new()
	FactionEnemyIcon.id = "FactionEnemyIcon"
	FactionEnemyIcon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -150, _1080p * -390, _1080p * 170, _1080p * 594 )
	FactionEnemyIcon:SubscribeToModel( DataSources.inGame.scoreboard.teamB.logo:GetModel( f20_local1 ), function ()
		local f25_local0 = DataSources.inGame.scoreboard.teamB.logo:GetValue( f20_local1 )
		if f25_local0 ~= nil then
			FactionEnemyIcon:setImage( RegisterMaterial( f25_local0 ), 0 )
		end
	end )
	self:addElement( FactionEnemyIcon )
	self.FactionEnemyIcon = FactionEnemyIcon
	
	local EnemyScores = nil
	
	EnemyScores = MenuBuilder.BuildRegisteredType( "TeamScores", {
		controllerIndex = f20_local1
	} )
	EnemyScores.id = "EnemyScores"
	EnemyScores:SetDataSource( DataSources.inGame.scoreboard.teamB, f20_local1 )
	EnemyScores:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -959, _1080p * -100, _1080p * 455, _1080p * 765 )
	self:addElement( EnemyScores )
	self.EnemyScores = EnemyScores
	
	local FriendlyScores = nil
	
	FriendlyScores = MenuBuilder.BuildRegisteredType( "TeamScores", {
		controllerIndex = f20_local1
	} )
	FriendlyScores.id = "FriendlyScores"
	FriendlyScores:SetDataSource( DataSources.inGame.scoreboard.teamA, f20_local1 )
	FriendlyScores:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 959, _1080p * 455, _1080p * 765 )
	self:addElement( FriendlyScores )
	self.FriendlyScores = FriendlyScores
	
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
	FriendlyTeamScore:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 683, _1080p * 890, _1080p * 325, _1080p * 425 )
	FriendlyTeamScore:SubscribeToModel( DataSources.inGame.MP.match.teamScoreFriendly:GetModel( f20_local1 ), function ()
		local f26_local0 = DataSources.inGame.MP.match.teamScoreFriendly:GetValue( f20_local1 )
		if f26_local0 ~= nil then
			FriendlyTeamScore:setText( f26_local0, 0 )
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
	EnemyTeamScore:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -890, _1080p * -683, _1080p * 325, _1080p * 425 )
	EnemyTeamScore:SubscribeToModel( DataSources.inGame.MP.match.teamScoreEnemy:GetModel( f20_local1 ), function ()
		local f27_local0 = DataSources.inGame.MP.match.teamScoreEnemy:GetValue( f20_local1 )
		if f27_local0 ~= nil then
			EnemyTeamScore:setText( f27_local0, 0 )
		end
	end )
	self:addElement( EnemyTeamScore )
	self.EnemyTeamScore = EnemyTeamScore
	
	local FriendlyWatermark = nil
	
	FriendlyWatermark = LUI.UIImage.new()
	FriendlyWatermark.id = "FriendlyWatermark"
	FriendlyWatermark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 400, _1080p * 556, _1080p * 360, _1080p * 400 )
	FriendlyWatermark:SubscribeToModel( DataSources.inGame.scoreboard.teamA.watermark:GetModel( f20_local1 ), function ()
		local f28_local0 = DataSources.inGame.scoreboard.teamA.watermark:GetValue( f20_local1 )
		if f28_local0 ~= nil then
			FriendlyWatermark:setImage( RegisterMaterial( f28_local0 ), 0 )
		end
	end )
	self:addElement( FriendlyWatermark )
	self.FriendlyWatermark = FriendlyWatermark
	
	local EnemyWatermark = nil
	
	EnemyWatermark = LUI.UIImage.new()
	EnemyWatermark.id = "EnemyWatermark"
	EnemyWatermark:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -556, _1080p * -400, _1080p * 360, _1080p * 400 )
	EnemyWatermark:SubscribeToModel( DataSources.inGame.scoreboard.teamB.watermark:GetModel( f20_local1 ), function ()
		local f29_local0 = DataSources.inGame.scoreboard.teamB.watermark:GetValue( f20_local1 )
		if f29_local0 ~= nil then
			EnemyWatermark:setImage( RegisterMaterial( f29_local0 ), 0 )
		end
	end )
	self:addElement( EnemyWatermark )
	self.EnemyWatermark = EnemyWatermark
	
	local Vs = nil
	
	Vs = LUI.UIText.new()
	Vs.id = "Vs"
	Vs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_VERSUS" ) ), 0 )
	Vs:SetFontSize( 48 * _1080p )
	Vs:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Vs:SetAlignment( LUI.Alignment.Center )
	Vs:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -100, _1080p * 100, _1080p * 355, _1080p * 403 )
	self:addElement( Vs )
	self.Vs = Vs
	
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
	
	local EnemyTeamTimeToBeat = nil
	
	EnemyTeamTimeToBeat = LUI.UIStyledText.new()
	EnemyTeamTimeToBeat.id = "EnemyTeamTimeToBeat"
	EnemyTeamTimeToBeat:SetAlpha( 0, 0 )
	EnemyTeamTimeToBeat:setText( "0:00", 0 )
	EnemyTeamTimeToBeat:SetFontSize( 90 * _1080p )
	EnemyTeamTimeToBeat:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	EnemyTeamTimeToBeat:SetAlignment( LUI.Alignment.Center )
	EnemyTeamTimeToBeat:SetOptOutRightToLeftAlignmentFlip( true )
	EnemyTeamTimeToBeat:SetShadowMinDistance( -0.01, 0 )
	EnemyTeamTimeToBeat:SetShadowMaxDistance( 0.01, 0 )
	EnemyTeamTimeToBeat:SetShadowRGBFromInt( 9456195, 0 )
	EnemyTeamTimeToBeat:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -920, _1080p * -720, _1080p * 330, _1080p * 420 )
	self:addElement( EnemyTeamTimeToBeat )
	self.EnemyTeamTimeToBeat = EnemyTeamTimeToBeat
	
	local FriendlyTeamTimeToBeat = nil
	
	FriendlyTeamTimeToBeat = LUI.UIStyledText.new()
	FriendlyTeamTimeToBeat.id = "FriendlyTeamTimeToBeat"
	FriendlyTeamTimeToBeat:SetAlpha( 0, 0 )
	FriendlyTeamTimeToBeat:setText( "0:00", 0 )
	FriendlyTeamTimeToBeat:SetFontSize( 90 * _1080p )
	FriendlyTeamTimeToBeat:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	FriendlyTeamTimeToBeat:SetAlignment( LUI.Alignment.Center )
	FriendlyTeamTimeToBeat:SetShadowMinDistance( -0.01, 0 )
	FriendlyTeamTimeToBeat:SetShadowMaxDistance( 0.01, 0 )
	FriendlyTeamTimeToBeat:SetShadowRGBFromInt( 3305631, 0 )
	FriendlyTeamTimeToBeat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 720, _1080p * 920, _1080p * 330, _1080p * 420 )
	self:addElement( FriendlyTeamTimeToBeat )
	self.FriendlyTeamTimeToBeat = FriendlyTeamTimeToBeat
	
	local TimeToBeatFriendlyIndicator = nil
	
	TimeToBeatFriendlyIndicator = MenuBuilder.BuildRegisteredType( "TimeToBeat", {
		controllerIndex = f20_local1
	} )
	TimeToBeatFriendlyIndicator.id = "TimeToBeatFriendlyIndicator"
	TimeToBeatFriendlyIndicator:SetAlpha( 0, 0 )
	TimeToBeatFriendlyIndicator:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 682.98, _1080p * 792.02, _1080p * 434.5, _1080p * 449.5 )
	self:addElement( TimeToBeatFriendlyIndicator )
	self.TimeToBeatFriendlyIndicator = TimeToBeatFriendlyIndicator
	
	local TimeToBeatEnemyIndicator = nil
	
	TimeToBeatEnemyIndicator = MenuBuilder.BuildRegisteredType( "TimeToBeat", {
		controllerIndex = f20_local1
	} )
	TimeToBeatEnemyIndicator.id = "TimeToBeatEnemyIndicator"
	TimeToBeatEnemyIndicator:SetAlpha( 0, 0 )
	TimeToBeatEnemyIndicator:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -791.97, _1080p * -683.03, _1080p * 434.5, _1080p * 449.5 )
	self:addElement( TimeToBeatEnemyIndicator )
	self.TimeToBeatEnemyIndicator = TimeToBeatEnemyIndicator
	
	local f20_local25 = nil
	if CONDITIONS.IsCorePublicMatch( self ) then
		f20_local25 = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
			controllerIndex = f20_local1
		} )
		f20_local25.id = "DoubleXPNotifications"
		f20_local25:SetScale( -0.5, 0 )
		f20_local25:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32, _1080p * 288, _1080p * 22, _1080p * 148 )
		self:addElement( f20_local25 )
		self.DoubleXPNotifications = f20_local25
	end
	self._animationSets.DefaultAnimationSet = function ()
		FriendlyTeamScore:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FriendlyTeamScore:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 683, _1080p * 890, _1080p * 325, _1080p * 425, 0 )
				end
			}
		} )
		EnemyTeamScore:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.EnemyTeamScore:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -890, _1080p * -683, _1080p * 325, _1080p * 425, 0 )
				end
			}
		} )
		EnemyTeamTimeToBeat:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.EnemyTeamTimeToBeat:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -920, _1080p * -720, _1080p * 330, _1080p * 420, 0 )
				end
			}
		} )
		FriendlyTeamTimeToBeat:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FriendlyTeamTimeToBeat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 720, _1080p * 920, _1080p * 330, _1080p * 420, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			FriendlyTeamScore:AnimateSequence( "DefaultSequence" )
			EnemyTeamScore:AnimateSequence( "DefaultSequence" )
			EnemyTeamTimeToBeat:AnimateSequence( "DefaultSequence" )
			FriendlyTeamTimeToBeat:AnimateSequence( "DefaultSequence" )
		end
		
		BackgroundBlur:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.BackgroundBlur:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 285, _1080p * -295, _1080p * 80, _1080p * 599, 0 )
				end
			}
		} )
		GameType:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.GameType:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, _1080p * -96, _1080p * 86, _1080p * 124, 0 )
				end
			}
		} )
		MatchTimer:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.MatchTimer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 240, _1080p * 490, _1080p * 90, _1080p * 122, 0 )
				end
			}
		} )
		MapName:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.MapName:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -490, _1080p * -240, _1080p * 90, _1080p * 122, 0 )
				end
			}
		} )
		FactionTeamIcon:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.FactionTeamIcon:SetScale( -0.1, 0 )
				end
			},
			{
				function ()
					return self.FactionTeamIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 285, _1080p * 525, 0, _1080p * 424, 0 )
				end
			}
		} )
		FactionEnemyIcon:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.FactionEnemyIcon:SetScale( -0.1, 0 )
				end
			},
			{
				function ()
					return self.FactionEnemyIcon:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -295, _1080p * -555, 0, _1080p * 424, 0 )
				end
			}
		} )
		EnemyScores:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.EnemyScores:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1154, _1080p * -295, _1080p * 287.5, _1080p * 597.5, 0 )
				end
			}
		} )
		FriendlyScores:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.FriendlyScores:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 285, _1080p * 1144, _1080p * 287.5, _1080p * 597.5, 0 )
				end
			}
		} )
		FriendlyTeamScore:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.FriendlyTeamScore:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 707, _1080p * 890, _1080p * 160, _1080p * 260, 0 )
				end
			}
		} )
		EnemyTeamScore:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.EnemyTeamScore:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -890, _1080p * -701, _1080p * 160, _1080p * 260, 0 )
				end
			}
		} )
		FriendlyWatermark:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.FriendlyWatermark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 535, _1080p * 691, _1080p * 190, _1080p * 230, 0 )
				end
			}
		} )
		EnemyWatermark:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.EnemyWatermark:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -701, _1080p * -545, _1080p * 190, _1080p * 230, 0 )
				end
			}
		} )
		Vs:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Vs:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -100, _1080p * 100, _1080p * 190, _1080p * 228, 0 )
				end
			}
		} )
		EnemyTeamTimeToBeat:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.EnemyTeamTimeToBeat:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 40, _1080p * 240, _1080p * 165, _1080p * 255, 0 )
				end
			}
		} )
		FriendlyTeamTimeToBeat:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.FriendlyTeamTimeToBeat:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -240, _1080p * -40, _1080p * 165, _1080p * 255, 0 )
				end
			}
		} )
		if CONDITIONS.IsCorePublicMatch( self ) then
			f20_local25:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.DoubleXPNotifications:SetScale( -0.5, 0 )
					end
				},
				{
					function ()
						return self.DoubleXPNotifications:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32, _1080p * 288, _1080p * 22, _1080p * 150, 0 )
					end
				}
			} )
		end
		self._sequences.Splitscreen = function ()
			BackgroundBlur:AnimateSequence( "Splitscreen" )
			GameType:AnimateSequence( "Splitscreen" )
			MatchTimer:AnimateSequence( "Splitscreen" )
			MapName:AnimateSequence( "Splitscreen" )
			FactionTeamIcon:AnimateSequence( "Splitscreen" )
			FactionEnemyIcon:AnimateSequence( "Splitscreen" )
			EnemyScores:AnimateSequence( "Splitscreen" )
			FriendlyScores:AnimateSequence( "Splitscreen" )
			FriendlyTeamScore:AnimateSequence( "Splitscreen" )
			EnemyTeamScore:AnimateSequence( "Splitscreen" )
			FriendlyWatermark:AnimateSequence( "Splitscreen" )
			EnemyWatermark:AnimateSequence( "Splitscreen" )
			Vs:AnimateSequence( "Splitscreen" )
			EnemyTeamTimeToBeat:AnimateSequence( "Splitscreen" )
			FriendlyTeamTimeToBeat:AnimateSequence( "Splitscreen" )
			if CONDITIONS.IsCorePublicMatch( self ) then
				f20_local25:AnimateSequence( "Splitscreen" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	EnemyScores:SetDataSource( DataSources.inGame.scoreboard.teamB, f20_local1 )
	FriendlyScores:SetDataSource( DataSources.inGame.scoreboard.teamA, f20_local1 )
	PostLoadFunc( self, f20_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "TeamScoreboard", TeamScoreboard )
LockTable( _M )
