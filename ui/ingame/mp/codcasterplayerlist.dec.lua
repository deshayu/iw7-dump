local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GetPlayerCount( f1_arg0 )
	local f1_local0 = f1_arg0.teams[1]
	local f1_local1 = f1_arg0.teams[2]
	if GameX.gameModeIsFFA( GameX.GetGameMode() ) then
		return f1_local0:GetNumRows()
	else
		return f1_local0:GetNumRows() + f1_local1:GetNumRows()
	end
end

function GetOppositeTeam( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.teamTop
	if f2_arg1 == f2_arg0.teamTop and not GameX.gameModeIsFFA( GameX.GetGameMode() ) then
		f2_local0 = f2_arg0.teamBottom
	end
	return f2_local0
end

function SetTeamNamesVisibility( f3_arg0, f3_arg1 )
	f3_arg0.Team1Header.Name:SetAlpha( f3_arg1 )
	f3_arg0.Team2Header.Name:SetAlpha( f3_arg1 )
end

function SetListenInVisibility( f4_arg0, f4_arg1 )
	local f4_local0 = MLG.ShoutcasterProfileVarBool( f4_arg1, "shoutcaster_qs_listen_in" )
	if f4_arg0.followedTeam == f4_arg0.teamTop then
		local f4_local1 = f4_arg0.Team1Header.ListenIn
		local f4_local2 = f4_local1
		f4_local1 = f4_local1.SetAlpha
		local f4_local3
		if f4_local0 then
			f4_local3 = 0.5
			if not f4_local3 then
			
			else
				f4_local1( f4_local2, f4_local3 )
				f4_arg0.Team2Header.ListenIn:SetAlpha( 0 )
			end
		end
		f4_local3 = 0
	elseif f4_arg0.followedTeam == f4_arg0.teamBottom then
		f4_arg0.Team1Header.ListenIn:SetAlpha( 0 )
		local f4_local1 = f4_arg0.Team2Header.ListenIn
		local f4_local2 = f4_local1
		f4_local1 = f4_local1.SetAlpha
		local f4_local3
		if f4_local0 then
			f4_local3 = 0.5
			if not f4_local3 then
			
			else
				f4_local1( f4_local2, f4_local3 )
			end
		end
		f4_local3 = 0
	end
end

function SwapTeamFocus( f5_arg0, f5_arg1, f5_arg2 )
	f5_arg0.teams[f5_arg0.teamFocus]:processEvent( {
		name = "lose_focus",
		controller = f5_arg1
	} )
	f5_arg0.teamFocus = GetOppositeTeam( f5_arg0, f5_arg0.teamFocus )
	f5_arg0.teams[f5_arg0.teamFocus]:processEvent( {
		name = "gain_focus",
		controller = f5_arg1
	} )
	f5_arg0.teams[f5_arg0.teamFocus]:SetFocusedPosition( {
		x = 0,
		y = GetListEdgeIndex( f5_arg0, not f5_arg2, f5_arg0.teamFocus )
	}, true )
end

function GetListEdgeIndex( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = 0
	local f6_local1 = f6_arg0.teams[f6_arg2]:GetContentSize( LUI.DIRECTION.vertical )
	if f6_arg1 and 0 < f6_local1 then
		f6_local0 = f6_local1 - 1
	end
	return f6_local0
end

function ProcessPlayerListInput( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = GetListEdgeIndex( f7_arg0, f7_arg2, f7_arg0.teamFocus )
	local f7_local1 = GetOppositeTeam( f7_arg0, f7_arg0.teamFocus )
	if f7_arg0.teams[f7_arg0.teamFocus]:GetFocusPosition( LUI.DIRECTION.vertical ) == f7_local0 and f7_arg0.teams[GetOppositeTeam( f7_arg0, f7_arg0.teamFocus )]:GetNumRows() > 0 then
		SwapTeamFocus( f7_arg0, f7_arg1.controllerIndex, f7_arg2 )
	else
		f7_arg0.teams[f7_arg0.teamFocus]:ProcessEventToChildInFocus( f7_arg1 )
	end
end

function UpdateDpadSelection( f8_arg0, f8_arg1 )
	local f8_local0 = f8_arg0.teams[f8_arg0.teamFocus]:GetFocusPosition( LUI.DIRECTION.vertical )
	if f8_local0 ~= nil then
		local f8_local1 = f8_arg0.teams[f8_arg0.teamFocus]:GetElementAtPosition( 0, f8_local0 )
		if f8_local1 ~= nil then
			f8_local1.isDpadSelected = f8_arg1
			local f8_local2 = Game.GetTeamPlayerAtIndex( GetTeamIndex( f8_arg0, f8_arg0.teamFocus ), f8_local0 )
			if f8_local2 ~= nil then
				MLG.SetSelectedClientNum( f8_local2 )
			end
		end
	end
end

function ProcessDpadButtonEvent( f9_arg0, f9_arg1 )
	if f9_arg0.teams[f9_arg0.teamFocus]:GetFocusPosition( LUI.DIRECTION.vertical ) ~= nil then
		UpdateDpadSelection( f9_arg0, false )
		if GameX.gameModeIsFFA( GameX.GetGameMode() ) then
			f9_arg0.Team1:ProcessEventToChildInFocus( f9_arg1 )
		else
			ProcessPlayerListInput( f9_arg0, f9_arg1, f9_arg1.button == "down" )
		end
		UpdateDpadSelection( f9_arg0, true )
	end
end

function RemoveFocus( f10_arg0 )
	f10_arg0.previousFocusRow = f10_arg0.teams[f10_arg0.teamFocus]:GetFocusPosition( LUI.DIRECTION.vertical )
	f10_arg0.teams[f10_arg0.teamFocus]:processEvent( {
		name = "lose_focus",
		controller = controllerIndex
	} )
	f10_arg0.focusWanted = false
end

function GiveFocus( f11_arg0 )
	local f11_local0 = {
		x = 0,
		y = f11_arg0.previousFocusRow
	}
	if f11_arg0.previousFocusRow ~= nil then
		f11_arg0.teams[f11_arg0.teamFocus]:SetFocusedPosition( f11_local0, true )
	else
		f11_arg0.teams[f11_arg0.teamFocus]:processEvent( {
			name = "gain_focus",
			controller = controllerIndex
		} )
	end
	f11_arg0.focusWanted = true
end

function ScrollFollowedPlayer( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
	if f12_arg0.followedPlayer == GetListEdgeIndex( f12_arg0, f12_arg2, f12_arg0.followedTeam ) then
		local f12_local0 = GetOppositeTeam( f12_arg0, f12_arg0.followedTeam )
		if f12_local0 ~= f12_arg0.followedTeam and Game.GetNumPlayersOnTeam( GetTeamIndex( f12_arg0, f12_local0 ) ) > 0 then
			local f12_local1 = f12_local0
		end
		local f12_local2 = f12_local1 or f12_arg0.followedTeam
		UpdateFollowedPlayer( f12_arg0, f12_arg1, f12_local2, GetListEdgeIndex( f12_arg0, not f12_arg2, f12_local2 ), f12_arg3, true )
	else
		local f12_local0 = f12_arg0.followedPlayer - 1
		if f12_arg2 then
			f12_local0 = f12_arg0.followedPlayer + 1
		end
		UpdateFollowedPlayer( f12_arg0, f12_arg1, f12_arg0.followedTeam, f12_local0, f12_arg3, true )
	end
end

function ScrollFollowedAlivePlayer( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = GetPlayerCount( f13_arg0 )
	if f13_local0 ~= nil then
		for f13_local1 = 0, f13_local0 - 1, 1 do
			local f13_local4 = f13_local1
			ScrollFollowedPlayer( f13_arg0, f13_arg1, f13_arg2, true )
			local f13_local5 = Game.GetScoreboardRowData( GetTeamIndex( f13_arg0, f13_arg0.followedTeam ), f13_arg0.followedPlayer )
			if f13_local5.isDead == false then
				break
			end
		end
	end
end

function FollowNextPlayer( f14_arg0, f14_arg1 )
	ScrollFollowedAlivePlayer( f14_arg0, f14_arg1, true )
end

function FollowPreviousPlayer( f15_arg0, f15_arg1 )
	ScrollFollowedAlivePlayer( f15_arg0, f15_arg1, false )
end

function FollowNextAlivePlayer( f16_arg0, f16_arg1 )
	ScrollFollowedAlivePlayer( f16_arg0, f16_arg1, true )
end

function FollowSelectedPlayer( f17_arg0, f17_arg1 )
	local f17_local0 = f17_arg0.teams[f17_arg0.teamFocus]:GetFocusPosition( LUI.DIRECTION.vertical )
	if f17_local0 ~= nil then
		UpdateFollowedPlayer( f17_arg0, f17_arg1, f17_arg0.teamFocus, f17_local0, false, true )
	end
end

function FindPlayerIndex( f18_arg0, f18_arg1, f18_arg2 )
	local f18_local0 = f18_arg0.teams[f18_arg1]
	local f18_local1 = -1
	for f18_local2 = 0, f18_local0:GetNumRows() - 1, 1 do
		local f18_local5 = f18_local0:GetElementAtPosition( 0, f18_local2 )
		if f18_local5 and tonumber( f18_local5.PlayerIndex.Field:getText() ) == f18_arg2 then
			f18_local1 = f18_local2
			break
		end
	end
	return f18_local1
end

function FollowPlayerNumber( f19_arg0, f19_arg1, f19_arg2 )
	local f19_local0 = f19_arg0.teamTop
	local f19_local1 = FindPlayerIndex( f19_arg0, f19_local0, f19_arg1 )
	if f19_local1 == -1 then
		f19_local0 = f19_arg0.teamBottom
		f19_local1 = FindPlayerIndex( f19_arg0, f19_local0, f19_arg1 )
	end
	if f19_local1 ~= -1 then
		UpdateFollowedPlayer( f19_arg0, f19_arg2, f19_local0, f19_local1, false, true )
	end
end

function GetTeamIndex( f20_arg0, f20_arg1 )
	local f20_local0 = Teams.axis
	if GameX.gameModeIsFFA( GameX.GetGameMode() ) then
		f20_local0 = Teams.free
	elseif f20_arg0.teams[f20_arg1] == f20_arg0.Team1 then
		f20_local0 = Teams.allies
	end
	return f20_local0
end

function UpdateFollowedPlayer( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4, f21_arg5 )
	if not f21_arg4 then
		local f21_local0 = Game.GetScoreboardRowData( GetTeamIndex( f21_arg0, f21_arg2 ), f21_arg3 )
		if f21_local0.isDead == true then
			return 
		end
	end
	local f21_local1 = f21_arg0.teams[f21_arg0.followedTeam]
	if f21_arg0.followedPlayer < f21_local1:GetNumRows() then
		local f21_local0 = f21_local1:GetElementAtPosition( 0, f21_arg0.followedPlayer )
		if f21_local0 ~= nil then
			f21_local0.isFollowed = false
			f21_local0:SetSelected( false )
			ACTIONS.AnimateSequence( f21_local0, "ButtonUp" )
			if f21_local0.isDpadSelected then
				ACTIONS.AnimateSequence( f21_local0, "ScrollOver" )
			end
			f21_local0:SetPlayerNumberVisibility( MLG.ShoutcasterProfileVarBool( f21_arg1, "shoutcaster_qs_playernumbers" ) )
		end
	end
	if f21_arg0.followedTeam ~= f21_arg2 or f21_arg0.firstUpdate then
		local f21_local0 = f21_arg0:getParent()
		f21_local0:processEvent( {
			name = "team_change",
			controller = f21_arg1,
			team = f21_arg2
		} )
		f21_arg0.followedTeam = f21_arg2
		f21_arg0.firstUpdate = false
	end
	f21_arg0.followedPlayer = f21_arg3
	local f21_local0 = f21_arg0.teams[f21_arg0.followedTeam]
	if f21_arg3 < f21_local0:GetNumRows() then
		local f21_local2 = f21_local0:GetElementAtPosition( 0, f21_arg0.followedPlayer )
		if f21_local2 then
			f21_local2.isFollowed = true
			f21_local2:SetSelected( true )
			if f21_local2.isDpadSelected then
				ACTIONS.AnimateSequence( f21_local2, "ScrollUp" )
			end
			ACTIONS.AnimateSequence( f21_local2, "ButtonOver" )
			f21_local2:SetPlayerNumberVisibility( MLG.ShoutcasterProfileVarBool( f21_arg1, "shoutcaster_qs_playernumbers" ) )
		end
		if f21_arg5 then
			local f21_local3 = Game.GetTeamPlayerAtIndex( GetTeamIndex( f21_arg0, f21_arg0.followedTeam ), f21_arg0.followedPlayer )
			if f21_local3 ~= nil then
				MLG.FollowClientnum( f21_local3 )
			end
		end
	end
	SetListenInVisibility( f21_arg0, f21_arg1 )
end

f0_local0 = function ( f22_arg0 )
	return function ( f23_arg0, f23_arg1 )
		local f23_local0 = MLG.GetFollowedClientNum()
		if f23_local0 == nil then
			return 
		end
		local f23_local1, f23_local2 = Game.GetTeamIndexPlayerIndexOfClientNum( f23_local0 )
		local f23_local3
		if f23_local1 == 1 then
			f23_local3 = 2
			if not f23_local3 then
			
			else
				UpdateFollowedPlayer( f23_arg0, f22_arg0, f23_local3, f23_local2, false, false )
			end
		end
		f23_local3 = 1
	end
	
end

function IsTeamOnHardpoint( f24_arg0, f24_arg1, f24_arg2 )
	local f24_local0 = f24_arg0.teams[f24_arg2]
	local f24_local1 = false
	local f24_local2 = GetTeamIndex( f24_arg0, f24_arg2 )
	local f24_local3 = Game.GetNumPlayersOnTeam( f24_local2 )
	for f24_local4 = 0, f24_local3 - 1, 1 do
		local f24_local7 = Game.GetScoreboardRowData( f24_local2, f24_local4 )
		if f24_local7.isGametypeVIP and f24_local7.isDead == false then
			f24_local1 = true
			break
		end
	end
	return f24_local1
end

function SetTeamHardpointColor( f25_arg0, f25_arg1, f25_arg2 )
	local f25_local0 = f25_arg0.teams[f25_arg1]
	for f25_local1 = 0, f25_local0:GetNumRows() - 1, 1 do
		local f25_local4 = f25_local0:GetElementAtPosition( 0, f25_local1 )
		if f25_local4 then
			f25_local4.OnHardpointIcon:SetRGBFromInt( f25_arg2, 0 )
		end
	end
end

function UpdateHardpointsColor( f26_arg0, f26_arg1 )
	local f26_local0 = IsTeamOnHardpoint( f26_arg0, f26_arg1, 1 )
	local f26_local1 = IsTeamOnHardpoint( f26_arg0, f26_arg1, 2 )
	if f26_local0 and f26_local1 then
		local f26_local2 = GetIntForColor( COLORS.white )
		SetTeamHardpointColor( f26_arg0, 1, f26_local2 )
		SetTeamHardpointColor( f26_arg0, 2, f26_local2 )
	elseif f26_local0 then
		SetTeamHardpointColor( f26_arg0, 1, CODCASTER.GetTeam1Color( f26_arg1 ) )
	elseif f26_local1 then
		SetTeamHardpointColor( f26_arg0, 2, CODCASTER.GetTeam2Color( f26_arg1 ) )
	end
end

function SetGridPlayerNumbersVisibility( f27_arg0, f27_arg1, f27_arg2 )
	local f27_local0 = f27_arg0.teams[f27_arg1]
	for f27_local1 = 0, f27_local0:GetNumRows() - 1, 1 do
		local f27_local4 = f27_local0:GetElementAtPosition( 0, f27_local1 )
		if f27_local4 then
			f27_local4:SetPlayerNumberVisibility( f27_arg2 )
		end
	end
end

function SetPlayerNumbersVisibility( f28_arg0, f28_arg1 )
	local f28_local0 = MLG.ShoutcasterProfileVarBool( f28_arg1, "shoutcaster_qs_playernumbers" )
	SetGridPlayerNumbersVisibility( f28_arg0, f28_arg0.teamTop, f28_local0 )
	if not GameX.gameModeIsFFA( GameX.GetGameMode() ) then
		SetGridPlayerNumbersVisibility( f28_arg0, f28_arg0.teamBottom, f28_local0 )
	end
end

function ResetFocusPosition( f29_arg0 )
	f29_arg0.teamFocus = GetOppositeTeam( f29_arg0, f29_arg0.teamFocus )
	f29_arg0.teams[f29_arg0.teamFocus]:SetFocusedPosition( {
		x = 0,
		y = 0
	}, true )
end

function PostLoadFunc( f30_arg0, f30_arg1, f30_arg2 )
	f30_arg0.teamTop = 1
	f30_arg0.teamBottom = 2
	f30_arg0.teams = {
		f30_arg0.Team1,
		f30_arg0.Team2
	}
	f30_arg0.teamFocus = f30_arg0.teamTop
	f30_arg0.focusWanted = false
	f30_arg0.followedTeam = f30_arg0.teamTop
	f30_arg0.followedPlayer = 0
	f30_arg0.previousFocusRow = 0
	f30_arg0.firstUpdate = true
	local f30_local0 = function ()
		local f31_local0 = 30
		local f31_local1 = 25
		local f31_local2 = 54
		local f31_local3 = f31_local2 + f31_local0 + Game.GetNumPlayersOnTeam( Teams.allies ) * f31_local1 + 12
		f30_arg0.Team2Header:SetTop( _1080p * f31_local3, 0 )
		local f31_local4 = f31_local3 + f31_local0
		f30_arg0.Team2Header:SetBottom( _1080p * f31_local4, 0 )
		f30_arg0.Team2:SetTop( _1080p * f31_local4, 0 )
		f30_arg0.Team1Header:SetTop( _1080p * f31_local2, 0 )
		f30_arg0.Team1Header:SetBottom( _1080p * (f31_local2 + f31_local0), 0 )
		f30_arg0.Team1:SetTop( _1080p * (f31_local2 + f31_local0), 0 )
		local f31_local5 = Game.GetNumPlayersOnTeam( GetTeamIndex( f30_arg0, f30_arg0.teamBottom ) )
		local f31_local6 = Game.GetNumPlayersOnTeam( GetTeamIndex( f30_arg0, f30_arg0.teamTop ) )
		if f31_local5 == 0 and f30_arg0.teamFocus == f30_arg0.teamBottom then
			ResetFocusPosition( f30_arg0 )
		elseif f31_local6 == 0 and f30_arg0.teamFocus == f30_arg0.teamTop then
			ResetFocusPosition( f30_arg0 )
		end
		if f30_arg0.focusWanted then
			f30_arg0.teams[f30_arg0.teamFocus]:processEvent( {
				name = "gain_focus",
				controller = f30_arg1
			} )
		end
		local f31_local7 = GameX.gameModeIsFFA( GameX.GetGameMode() )
		local f31_local8 = 4144959
		for f31_local14, f31_local15 in ipairs( {
			f30_arg0.teamTop,
			f30_arg0.teamBottom
		} ) do
			local f31_local16 = f30_arg0.teams[f31_local15]:GetNumRows()
			for f31_local13 = 0, f31_local16 - 1, 1 do
				local f31_local12 = f30_arg0.teams[f31_local15]:GetElementAtPosition( 0, f31_local13 )
				if f31_local12 then
					if f31_local7 then
						f31_local12.Background:SetRGBFromInt( f31_local8, 0 )
					else
						f31_local12.Background:SetRGBFromInt( CODCASTER.GetTeamColor( f30_arg1, f31_local15 ), 0 )
					end
				end
			end
		end
	end
	
	f30_local0()
	local f30_local1 = LUI.DataSourceInGlobalModel.new( "cg.scoreBoard.players.numPlayersTeamA" )
	f30_arg0:SubscribeToModel( f30_local1:GetModel( f30_arg1 ), f30_local0 )
	local f30_local2 = LUI.DataSourceInGlobalModel.new( "cg.scoreBoard.players.numPlayersTeamB" )
	f30_arg0:SubscribeToModel( f30_local2:GetModel( f30_arg1 ), f30_local0 )
	local f30_local3 = LUI.DataSourceInGlobalModel.new( "cg.scoreBoard.players.numFFAPlayers" )
	f30_arg0:SubscribeToModel( f30_local3:GetModel( f30_arg1 ), f30_local0 )
	local f30_local4 = GameX.gameModeIsFFA( GameX.GetGameMode() )
	if f30_local4 then
		ACTIONS.AnimateSequence( f30_arg0, "VisibleNonTeamBased" )
	else
		ACTIONS.AnimateSequence( f30_arg0, "VisibleTeamBased" )
	end
	f30_arg0.ProcessDpadButtonEvent = ProcessDpadButtonEvent
	f30_arg0.RemoveFocus = RemoveFocus
	f30_arg0.GiveFocus = GiveFocus
	f30_arg0.FollowNextPlayer = FollowNextPlayer
	f30_arg0.FollowPreviousPlayer = FollowPreviousPlayer
	f30_arg0.FollowSelectedPlayer = FollowSelectedPlayer
	f30_arg0.FollowPlayerNumber = FollowPlayerNumber
	f30_arg0.UpdateHardpointsColor = UpdateHardpointsColor
	f30_arg0.FollowNextAlivePlayer = FollowNextAlivePlayer
	f30_arg0.SetPlayerNumbersVisibility = SetPlayerNumbersVisibility
	f30_arg0.ResetFocusPosition = ResetFocusPosition
	f30_arg0.SetListenInVisibility = SetListenInVisibility
	f30_arg0.SetTeamNamesVisibility = SetTeamNamesVisibility
	if f30_local4 then
		local self = DataSources.inGame.MP.match.gameMode:GetValue( f30_arg1 )
		if self ~= nil then
			f30_arg0.Team1Header.Name.Field:setText( self, 0 )
		end
	else
		f30_arg0.team1Color = CODCASTER.GetTeam1Color( f30_arg1 )
		f30_arg0.team2Color = CODCASTER.GetTeam2Color( f30_arg1 )
		f30_arg0.Team1Header.Background:SetRGBFromInt( f30_arg0.team1Color, 0 )
		f30_arg0.Team2Header.Background:SetRGBFromInt( f30_arg0.team2Color, 0 )
		f30_arg0.Team1Header.Name.Field:setText( CODCASTER.GetTeam1Name( f30_arg1 ), 0 )
		f30_arg0.Team2Header.Name.Field:setText( CODCASTER.GetTeam2Name( f30_arg1 ), 0 )
	end
	local self = LUI.UITimer.new( nil, {
		interval = 100,
		event = "refreshPlayerListData"
	} )
	self.id = "PlayerListUpdateTimer"
	f30_arg0:addElement( self )
	f30_arg0:registerEventHandler( "refreshPlayerListData", function ( element, event )
		local f32_local0 = {
			element.teamTop
		}
		if not f30_local4 then
			f32_local0[2] = element.teamBottom
		end
		for f32_local8, f32_local9 in ipairs( f32_local0 ) do
			local f32_local10 = GetTeamIndex( element, f32_local9 )
			local f32_local11 = element.teams[f32_local9]
			local f32_local12 = Game.GetNumPlayersOnTeam( f32_local10 )
			if f32_local12 ~= element.playerCountByGrid[f32_local9] then
				f32_local11:SetNumRows( f32_local12 )
				element.playerCountByGrid[f32_local9] = f32_local12
			end
			for f32_local4 = 0, f32_local12 - 1, 1 do
				local f32_local7 = element.teams[f32_local9]:GetElementAtPosition( 0, f32_local4 )
				if f32_local7 then
					f32_local7:RefreshRowContent( f30_arg1, f32_local10, f32_local4 )
				end
			end
		end
	end )
	f30_arg0:registerEventHandler( "playerstate_client_changed", f0_local0( f30_arg1 ) )
	f30_arg0.playerCountByGrid = {}
	f30_arg0.playerCountByGrid[1] = -1
	f30_arg0.playerCountByGrid[2] = -1
end

function CodCasterPlayerList( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CodCasterPlayerList"
	self._animationSets = {}
	self._sequences = {}
	local f33_local1 = controller and controller.controllerIndex
	if not f33_local1 and not Engine.InFrontend() then
		f33_local1 = self:getRootController()
	end
	assert( f33_local1 )
	local f33_local2 = self
	local Team1 = nil
	
	Team1 = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 18,
		controllerIndex = f33_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CodCasterPlayerListRowWidget", {
				controllerIndex = f33_local1
			} )
		end,
		refreshChild = function ( f35_arg0, f35_arg1, f35_arg2 )
			
		end,
		numRows = 18,
		numColumns = 1,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 542,
		rowHeight = _1080p * 25,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Team1.id = "Team1"
	Team1:setUseStencil( false )
	Team1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1324, _1080p * 1866, _1080p * 85, _1080p * 535 )
	self:addElement( Team1 )
	self.Team1 = Team1
	
	local Team1Header = nil
	
	Team1Header = MenuBuilder.BuildRegisteredType( "CodCasterPlayerListHeaderWidget", {
		controllerIndex = f33_local1
	} )
	Team1Header.id = "Team1Header"
	Team1Header:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1324, _1080p * 1866, _1080p * 54, _1080p * 86 )
	self:addElement( Team1Header )
	self.Team1Header = Team1Header
	
	local Team2 = nil
	
	Team2 = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 9,
		controllerIndex = f33_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CodCasterPlayerListRowWidget", {
				controllerIndex = f33_local1
			} )
		end,
		refreshChild = function ( f37_arg0, f37_arg1, f37_arg2 )
			
		end,
		numRows = 9,
		numColumns = 1,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * -0.5,
		spacingY = _1080p * -0.5,
		columnWidth = _1080p * 542,
		rowHeight = _1080p * 25,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Team2.id = "Team2"
	Team2:setUseStencil( false )
	Team2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1324, _1080p * 1866, _1080p * 355, _1080p * 576 )
	self:addElement( Team2 )
	self.Team2 = Team2
	
	local Team2Header = nil
	
	Team2Header = MenuBuilder.BuildRegisteredType( "CodCasterPlayerListHeaderWidget", {
		controllerIndex = f33_local1
	} )
	Team2Header.id = "Team2Header"
	Team2Header:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1324, _1080p * 1866, _1080p * 324, _1080p * 356 )
	self:addElement( Team2Header )
	self.Team2Header = Team2Header
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Team2:RegisterAnimationSequence( "VisibleTeamBased", {
			{
				function ()
					return self.Team2:SetAlpha( 1, 0 )
				end
			}
		} )
		Team2Header:RegisterAnimationSequence( "VisibleTeamBased", {
			{
				function ()
					return self.Team2Header:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.VisibleTeamBased = function ()
			Team2:AnimateSequence( "VisibleTeamBased" )
			Team2Header:AnimateSequence( "VisibleTeamBased" )
		end
		
		Team2:RegisterAnimationSequence( "VisibleNonTeamBased", {
			{
				function ()
					return self.Team2:SetAlpha( 0, 0 )
				end
			}
		} )
		Team2Header:RegisterAnimationSequence( "VisibleNonTeamBased", {
			{
				function ()
					return self.Team2Header:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.VisibleNonTeamBased = function ()
			Team2:AnimateSequence( "VisibleNonTeamBased" )
			Team2Header:AnimateSequence( "VisibleNonTeamBased" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f33_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterPlayerList", CodCasterPlayerList )
LockTable( _M )
