local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "cg.versus"
f0_local1 = {
	"icon_faction_watermark_unsa",
	"icon_faction_watermark_sdf"
}
f0_local2 = {
	"GAME_UNSA_RANGERS",
	"GAME_SDF_REBELS"
}
local f0_local3 = function ( f1_arg0 )
	assert( f1_arg0 )
	f1_arg0:setImage( RegisterMaterial( Engine.TableLookup( CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, Engine.GetDvarString( "ui_gametype" ), CSV.gameTypesTable.cols.image ) ), 0 )
end

local f0_local4 = function ( f2_arg0 )
	local f2_local0 = assert
	local f2_local1 = f2_arg0.GameModeLabel
	if f2_local1 then
		f2_local1 = f2_arg0.LocationLabel and f2_arg0.InstructionsLabel
	end
	f2_local0( f2_local1, "WARNING: Versus Screen Items Are Missing..." )
	f2_local1 = Engine.TableLookup( CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, Engine.GetDvarString( "ui_gametype" ), CSV.gameTypesTable.cols.name )
	local f2_local2 = Engine.TableLookup( CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, Engine.GetDvarString( "ui_mapname" ), CSV.mpMapTable.cols.caps )
	f2_arg0.GameModeLabel:setText( Engine.Localize( f2_local1 ) )
	f2_arg0.LocationLabel:setText( Engine.Localize( f2_local2 ) )
	f2_arg0.InstructionsLabel:setText( Engine.Localize( "LUA_MENU_PREPARE_FOR_LANDING" ) )
end

local f0_local5 = function ( f3_arg0 )
	if CONDITIONS.IsPublicMatch() then
		return false
	else
		return CODCASTER.IsCustomTeamIdentity( f3_arg0 ) and CONDITIONS.IsTeamBasedGameType( self ) and Lobby.IsLocalMemberMLGSpectator( f3_arg0 ) and CODCASTER.CanCODCast()
	end
end

local f0_local6 = function ( f4_arg0 )
	assert( f4_arg0 )
	f4_arg0:setText( Engine.TableLookup( CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, Engine.GetDvarString( "ui_mapname" ), CSV.mpMapTable.cols.loadingFluffText ) )
end

local f0_local7 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4, f5_arg5 )
	if not f5_arg1 or f5_arg1 and f5_arg2 == Teams.free then
		GetIntForColor( COLORS.white )
		
	elseif f5_arg4 then
		if f5_arg2 == Teams.allies then
			return CODCASTER.GetTeamColor( f5_arg5, 1 )
		else
			return CODCASTER.GetTeamColor( f5_arg5, 2 )
		end
	elseif not (f5_arg0.isPlayerOnTeam or f5_arg2 ~= Teams.allies) or f5_arg0.isPlayerOnTeam and f5_arg2 == f5_arg0.playerTeam then
		return f5_arg3 % 2 and GetIntForColor( SWATCHES.Versus.teamABackground ) or GetIntForColor( SWATCHES.Versus.teamABackgroundAlt )
	else
		return f5_arg3 % 2 and GetIntForColor( SWATCHES.Versus.teamBBackground ) or GetIntForColor( SWATCHES.Versus.teamBBackgroundAlt )
	end
end

local f0_local8 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

local f0_local9 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
	f7_arg0.teamAData.teamList = {}
	f7_arg0.teamBData.teamList = {}
	if f7_arg0.isPlayerOnTeam and f7_arg4 and not f7_arg3 then
		if IsMlgGameBattlesMatch() then
			local f7_local0 = GAMEBATTLES.GetCurrentMatch( f7_arg1 )
			if f7_local0 ~= nil then
				ACTIONS.AnimateSequence( f7_arg0, "GBTeamNames" )
				if f7_arg0.playerTeam == Teams.allies then
					f7_arg0.TeamAName:setText( f7_local0.teams[1].teamName )
					f7_arg0.TeamBName:setText( f7_local0.teams[2].teamName )
				elseif f7_arg0.playerTeam == Teams.axis then
					f7_arg0.TeamAName:setText( f7_local0.teams[2].teamName )
					f7_arg0.TeamBName:setText( f7_local0.teams[1].teamName )
				end
			end
		end
		if f7_arg0.playerTeam == Teams.allies then
			f7_arg0.TeamALogo:setImage( RegisterMaterial( TeamLogos.allies ), 0 )
			f7_arg0.TeamBLogo:setImage( RegisterMaterial( TeamLogos.axis ), 0 )
			f7_arg0.TeamAWatermark:setImage( RegisterMaterial( f0_local1[1] ), 0 )
			f7_arg0.TeamBWatermark:setImage( RegisterMaterial( f0_local1[2] ), 0 )
		elseif f7_arg0.playerTeam == Teams.axis then
			f7_arg0.TeamALogo:setImage( RegisterMaterial( TeamLogos.axis ), 0 )
			f7_arg0.TeamBLogo:setImage( RegisterMaterial( TeamLogos.allies ), 0 )
			f7_arg0.TeamAWatermark:setImage( RegisterMaterial( f0_local1[2] ), 0 )
			f7_arg0.TeamBWatermark:setImage( RegisterMaterial( f0_local1[1] ), 0 )
		end
	end
	local f7_local0 = Engine.GetDvarString( "ui_gametype" )
	local f7_local1 = DataModel.GetGlobalModel()
	local f7_local2 = LUI.DataSourceInGlobalModel.new( "alwaysLoaded.activeParty.members.teamAlliesCount" )
	local f7_local3 = f7_local2:GetValue( f7_arg1 )
	local f7_local4 = IsMlgGameBattlesMatch()
	local f7_local5 = MLG.GetMaxMlgTeamSize()
	local f7_local6 = 0
	for f7_local7 = 0, f7_arg2 - 1, 1 do
		local f7_local10 = f7_local7
		if f7_local4 then
			if Engine.GetTeamForPartyMemberIndex( f7_local7 ) == Teams.spectator then
				f7_local10 = f7_local6 + f7_local5 * 2
				f7_local6 = f7_local6 + 1
			else
				f7_local10 = f7_local10 - f7_local6
				if f7_local3 <= f7_local10 then
					f7_local10 = f7_local10 - f7_local3 + f7_local5
				end
			end
		end
		local f7_local11 = "alwaysLoaded.activeParty.members." .. f7_local10
		local f7_local12 = f0_local0 .. ".menuMemberData." .. f7_local10
		local f7_local13 = LUI.DataSourceInGlobalModel.new( f7_local12 )
		local f7_local14 = DataModel.GetModelValue( DataModel.GetModel( DataModel.GetModel( f7_local1, f7_local11 ), "team" ) )
		local f7_local15 = nil
		if not Lobby.IsMemberMLGSpectator( f7_local7, f7_arg1 ) then
			if not f7_local4 and (not (f7_arg4 or f7_local14 == Teams.spectator) or f7_arg4 and f7_local14 == Teams.free) then
				if f7_local7 % 2 == 0 then
					f7_local15 = f7_arg0.teamAData.teamList
				else
					f7_local15 = f7_arg0.teamBData.teamList
				end
			elseif f7_arg0.isPlayerOnTeam and f7_local14 ~= Teams.spectator and f7_local14 ~= Teams.free then
				if f7_local14 == f7_arg0.playerTeam then
					f7_local15 = f7_arg0.teamAData.teamList
				else
					f7_local15 = f7_arg0.teamBData.teamList
				end
			elseif f7_local14 == Teams.allies then
				f7_local15 = f7_arg0.teamAData.teamList
			elseif f7_local14 == Teams.axis then
				f7_local15 = f7_arg0.teamBData.teamList
			end
		end
		if f7_local15 then
			local f7_local16 = function ( f8_arg0 )
				return Rank.GetRankDisplay( tostring( f8_arg0 ) )
			end
			
			local f7_local17 = function ( f9_arg0 )
				return Engine.Localize( Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.index, f9_arg0 - 1, CSV.battleRigs.cols.name ) )
			end
			
			local f7_local18 = #f7_local15
			local f7_local19 = LUI.DataSourceInGlobalModel.new( f7_local11 .. ".rank" )
			local f7_local20 = LUI.DataSourceInGlobalModel.new( f7_local11 .. ".prestige" )
			local f7_local21 = LUI.AggregateDataSource.new( f7_local13, {
				f7_local19,
				f7_local20
			}, "rankIcon", Rank.MakeRankIconAggregateFunction( f7_local19, f7_local20 ) )
			local f7_local22 = LUI.AggregateDataSource.new( f7_local19, {
				f7_local19,
				f7_local20
			}, "display", Rank.MakeRankDisplayAggregateFunction( f7_local19, f7_local20, true, true ) )
			local f7_local23 = f7_local20:Filter( "isMasterPrestige", Rank.IsMasterPrestige )
			local f7_local24 = LUI.DataSourceInGlobalModel.new( f7_local11 .. ".microphoneState" )
			local f7_local25 = LUI.DataSourceInGlobalModel.new( f7_local11 .. ".rigIndex" )
			f7_local15[f7_local18 + 1] = {
				gamertag = LUI.DataSourceInGlobalModel.new( f7_local11 .. ".gamertag" ),
				missingGamertag = LUI.DataSourceInGlobalModel.new( f7_local11 .. ".missingGamertag" ),
				clanTag = LUI.DataSourceInGlobalModel.new( f7_local11 .. ".clanTag" ),
				microphoneState = f7_local24,
				microphoneIcon = f7_local24:FilterTo( f7_local13, "icon", Mic.GetIcon ),
				microphoneAlpha = f7_local24:FilterTo( f7_local13, "alpha", Mic.GetIconAlpha ),
				rank = f7_local19,
				prestige = f7_local20,
				displayRank = f7_local22,
				rankIcon = f7_local21,
				isMasterPrestige = f7_local23,
				backgroundColor = LUI.DataSourceInGlobalModel.new( f7_local12 .. ".backgroundColor", f0_local7( f7_arg0, f7_arg4, f7_local14, f7_local18, f7_arg3, f7_arg1 ) ),
				rigName = f7_local25:FilterTo( f7_local13, "rigName", f7_local17 ),
				memberIndex = LUI.DataSourceInGlobalModel.new( f7_local11 .. ".memberIndex" ),
				isMyPlayer = LUI.DataSourceInGlobalModel.new( f7_local11 .. ".isMyPlayer" )
			}
		end
	end
end

local f0_local10 = function ( f10_arg0, f10_arg1, f10_arg2 )
	Lobby.ClearLocalCommitReady()
	f10_arg0.teamAData = {}
	f10_arg0.teamBData = {}
	if not CONDITIONS.IsSplitscreen() then
		f10_arg0:setupLetterboxElement()
	end
	f10_arg0.playerTeam = Game.GetPlayerTeam()
	local f10_local0
	if f10_arg0.playerTeam == Teams.spectator or f10_arg0.playerTeam == Teams.free then
		f10_local0 = false
	else
		f10_local0 = true
	end
	f10_arg0.isPlayerOnTeam = f10_local0
	if f10_arg0.playerTeam == Teams.spectator and IsMlgGameBattlesMatch() then
		LobbyMember.SelectedMember_SetLocalMemberMLGSpectator( true, f10_arg1 )
	end
	f10_local0 = LUI.DataSourceInControllerModel.new( f0_local0 .. ".teamAFocus" )
	local f10_local1 = LUI.DataSourceInControllerModel.new( f0_local0 .. ".teamBFocus" )
	f10_arg0.TeamAList:SetLastFocusIndexDataSource( f10_local0 )
	f10_arg0.TeamBList:SetLastFocusIndexDataSource( f10_local1 )
	f10_arg0.TeamAMemberCount = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".teamACount", 0 )
	f10_arg0.TeamAListDataSource = LUI.DataSourceFromList.new( f10_arg0.TeamAMemberCount )
	f10_arg0.TeamAListDataSource.MakeDataSourceAtIndex = function ( f11_arg0, f11_arg1 )
		return f10_arg0.teamAData.teamList[f11_arg1 + 1]
	end
	
	f10_arg0.TeamAListDataSource.GetDefaultFocusIndex = function ()
		return f10_local1:GetValue( f10_arg1 )
	end
	
	f10_arg0.TeamBMemberCount = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".teamBCount", 0 )
	f10_arg0.TeamBListDataSource = LUI.DataSourceFromList.new( f10_arg0.TeamBMemberCount )
	f10_arg0.TeamBListDataSource.MakeDataSourceAtIndex = function ( f13_arg0, f13_arg1 )
		return f10_arg0.teamBData.teamList[f13_arg1 + 1]
	end
	
	f10_arg0.TeamBListDataSource.GetDefaultFocusIndex = function ()
		return f10_local0:GetValue( f10_arg1 )
	end
	
	local f10_local2 = DataModel.GetGlobalModel()
	local f10_local3 = DataModel.GetModel( f10_local2, "alwaysLoaded.activeParty.members.count" )
	local f10_local4 = DataModel.GetModel( f10_local2, "alwaysLoaded.activeParty.members.teamAlliesCount" )
	local f10_local5 = DataModel.GetModel( f10_local2, "alwaysLoaded.activeParty.members.teamAxisCount" )
	local f10_local6
	if f10_local4 then
		f10_local6 = DataModel.GetModelValue( f10_local4 )
		if not f10_local6 then
		
		else
			local f10_local7
			if f10_local5 then
				f10_local7 = DataModel.GetModelValue( f10_local5 )
				if not f10_local7 then
				
				else
					local f10_local8 = CONDITIONS.IsTeamBasedGameType( f10_arg0 )
					if f10_local8 then
						if f10_local6 <= 0 and f10_local7 <= 0 then
							f10_local8 = false
						else
							f10_local8 = true
						end
					end
					local f10_local9 = f0_local5( f10_arg1 )
					if f10_local9 and MLG.ShoutcasterProfileVarBool( f10_arg1, "shoutcaster_team_identity" ) then
						f10_arg0.TeamALogo:setImage( RegisterMaterial( CODCASTER.GetTeam1LogoMaterial( f10_arg1 ) ), 0 )
						f10_arg0.TeamBLogo:setImage( RegisterMaterial( CODCASTER.GetTeam2LogoMaterial( f10_arg1 ) ), 0 )
						f10_arg0.TeamAWatermark:SetAlpha( 0 )
						f10_arg0.TeamBWatermark:SetAlpha( 0 )
						f10_arg0.TeamAName:setText( CODCASTER.GetTeam1Name( f10_arg1 ) )
						f10_arg0.TeamBName:setText( CODCASTER.GetTeam2Name( f10_arg1 ) )
						ACTIONS.AnimateSequence( f10_arg0, "Codcaster" )
					elseif not f10_local8 then
						ACTIONS.AnimateSequence( f10_arg0, "NoPreassignedTeams" )
					end
					if f10_local3 then
						f10_arg0:SubscribeToModel( f10_local3, function ()
							f0_local9( f10_arg0, f10_arg1, DataModel.GetModelValue( f10_local3 ), f10_local9, f10_local8 )
							f10_arg0.TeamAMemberCount:SetValue( f10_arg1, #f10_arg0.teamAData.teamList )
							f10_arg0.TeamBMemberCount:SetValue( f10_arg1, #f10_arg0.teamBData.teamList )
						end )
					end
					f10_arg0:SetDataSource( {
						teamAMemberList = f10_arg0.TeamAListDataSource,
						teamBMemberList = f10_arg0.TeamBListDataSource
					}, f10_arg1 )
					f0_local3( f10_arg0.GameMode )
					f0_local4( f10_arg0 )
					f10_arg0:addEventHandler( "gamepad_button", function ( f16_arg0, f16_arg1 )
						local f16_local0 = f16_arg1.down
						if f16_local0 then
							f16_local0 = f16_arg1.button == "left"
						end
						local f16_local1 = f16_arg1.down
						if f16_local1 then
							f16_local1 = f16_arg1.button == "right"
						end
						if f16_local1 and f10_arg0.TeamBMemberCount:GetValue( f10_arg1 ) > 0 then
							ACTIONS.LoseFocus( f10_arg0, "TeamAList", f10_arg1 )
							ACTIONS.GainFocus( f10_arg0, "TeamBList", f10_arg1 )
							return true
						elseif f16_local0 and f10_arg0.TeamAMemberCount:GetValue( f10_arg1 ) > 0 then
							ACTIONS.LoseFocus( f10_arg0, "TeamBList", f10_arg1 )
							ACTIONS.GainFocus( f10_arg0, "TeamAList", f10_arg1 )
							return true
						else
							
						end
					end )
					ACTIONS.GainFocus( f10_arg0, "TeamAList", f10_arg1 )
					if not CONDITIONS.IsTeamBasedGameType( f10_arg0 ) then
						f10_arg0.TeamAList:SetTop( _1080p * 370 )
						f10_arg0.TeamAList:SetBottom( _1080p * 792 )
						f10_arg0.TeamBList:SetTop( _1080p * 370 )
						f10_arg0.TeamBList:SetBottom( _1080p * 792 )
					end
					f10_arg0:addEventHandler( "menu_create", function ( f17_arg0, f17_arg1 )
						f17_arg0:AddButtonHelperText( {
							helper_text = Engine.Localize( "SPEECH_MUTE_UNMUTE" ),
							button_ref = "button_primary",
							side = "left",
							clickable = false
						} )
						if Engine.IsXB3() or Engine.IsPCApp() then
							f17_arg0:AddButtonHelperText( {
								helper_text = Engine.Localize( "XBOXLIVE_VIEW_PROFILE" ),
								button_ref = "button_start",
								side = "left",
								clickable = false
							} )
						end
					end )
				end
			end
			f10_local7 = 0
		end
	end
	f10_local6 = 0
end

function Versus( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "Versus"
	self._animationSets = {}
	self._sequences = {}
	local f18_local1 = controller and controller.controllerIndex
	if not f18_local1 and not Engine.InFrontend() then
		f18_local1 = self:getRootController()
	end
	assert( f18_local1 )
	self:playSound( "menu_open" )
	local f18_local2 = self
	local TopBG = nil
	
	TopBG = LUI.UIImage.new()
	TopBG.id = "TopBG"
	TopBG:setImage( RegisterMaterial( "wdg_vs_background" ), 0 )
	self:addElement( TopBG )
	self.TopBG = TopBG
	
	local DividerLine = nil
	
	DividerLine = LUI.UIImage.new()
	DividerLine.id = "DividerLine"
	DividerLine:SetRGBFromTable( SWATCHES.genericMenu.socialFeedAccent, 0 )
	DividerLine:SetAlpha( 0.5, 0 )
	DividerLine:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -135, _1080p * -134 )
	self:addElement( DividerLine )
	self.DividerLine = DividerLine
	
	local TeamAWatermark = nil
	
	TeamAWatermark = LUI.UIImage.new()
	TeamAWatermark.id = "TeamAWatermark"
	TeamAWatermark:SetRGBFromInt( 12566463, 0 )
	TeamAWatermark:SetAlpha( 0.3, 0 )
	TeamAWatermark:SetZRotation( 90, 0 )
	TeamAWatermark:SetScale( -0.4, 0 )
	TeamAWatermark:setImage( RegisterMaterial( "icon_faction_watermark_unsa" ), 0 )
	TeamAWatermark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -161.26, _1080p * 457.26, _1080p * 221.5, _1080p * 386.5 )
	self:addElement( TeamAWatermark )
	self.TeamAWatermark = TeamAWatermark
	
	local TeamALogo = nil
	
	TeamALogo = LUI.UIImage.new()
	TeamALogo.id = "TeamALogo"
	TeamALogo:setImage( RegisterMaterial( "icon_faction_unsa_bw" ), 0 )
	TeamALogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 229, _1080p * 571, _1080p * 133, _1080p * 475 )
	self:addElement( TeamALogo )
	self.TeamALogo = TeamALogo
	
	local TeamBLogo = nil
	
	TeamBLogo = LUI.UIImage.new()
	TeamBLogo.id = "TeamBLogo"
	TeamBLogo:setImage( RegisterMaterial( "icon_faction_sdf_bw" ), 0 )
	TeamBLogo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -575, _1080p * -228, _1080p * 133, _1080p * 480 )
	self:addElement( TeamBLogo )
	self.TeamBLogo = TeamBLogo
	
	local TeamAList = nil
	
	TeamAList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 9,
		controllerIndex = f18_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "VersusMember", {
				controllerIndex = f18_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 690,
		rowHeight = _1080p * 32,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	TeamAList.id = "TeamAList"
	TeamAList:setUseStencil( true )
	TeamAList:SetGridDataSourceThroughElement( self, "teamAMemberList" )
	TeamAList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 160, _1080p * 850, _1080p * 497, _1080p * 865 )
	self:addElement( TeamAList )
	self.TeamAList = TeamAList
	
	local TeamBList = nil
	
	TeamBList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 9,
		controllerIndex = f18_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "VersusMember", {
				controllerIndex = f18_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 690,
		rowHeight = _1080p * 32,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	TeamBList.id = "TeamBList"
	TeamBList:setUseStencil( true )
	TeamBList:SetGridDataSourceThroughElement( self, "teamBMemberList" )
	TeamBList:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -850, _1080p * -160, _1080p * 497, _1080p * 865 )
	self:addElement( TeamBList )
	self.TeamBList = TeamBList
	
	local HeaderLeft = nil
	
	HeaderLeft = LUI.UIImage.new()
	HeaderLeft.id = "HeaderLeft"
	HeaderLeft:setImage( RegisterMaterial( "wdg_vs_header_half" ), 0 )
	HeaderLeft:SetUseAA( true )
	HeaderLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2, _1080p * 960, 0, _1080p * 400 )
	self:addElement( HeaderLeft )
	self.HeaderLeft = HeaderLeft
	
	local HeaderRight = nil
	
	HeaderRight = LUI.UIImage.new()
	HeaderRight.id = "HeaderRight"
	HeaderRight:setImage( RegisterMaterial( "wdg_vs_header_half" ), 0 )
	HeaderRight:SetUseAA( true )
	HeaderRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 2, _1080p * -960, 0, _1080p * 400 )
	self:addElement( HeaderRight )
	self.HeaderRight = HeaderRight
	
	local GameMode = nil
	
	GameMode = LUI.UIImage.new()
	GameMode.id = "GameMode"
	GameMode:setImage( RegisterMaterial( "gamemode_generic" ), 0 )
	GameMode:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -125, _1080p * 125, _1080p * 29, _1080p * 279 )
	self:addElement( GameMode )
	self.GameMode = GameMode
	
	local InstructionsLabel = nil
	
	InstructionsLabel = LUI.UIStyledText.new()
	InstructionsLabel.id = "InstructionsLabel"
	InstructionsLabel:SetRGBFromInt( 15132390, 0 )
	InstructionsLabel:setText( Engine.Localize( "MENU_NEW" ), 0 )
	InstructionsLabel:SetFontSize( 50 * _1080p )
	InstructionsLabel:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	InstructionsLabel:SetAlignment( LUI.Alignment.Center )
	InstructionsLabel:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 96, _1080p * -96, _1080p * -129, _1080p * -79 )
	self:addElement( InstructionsLabel )
	self.InstructionsLabel = InstructionsLabel
	
	local LocationLabel = nil
	
	LocationLabel = LUI.UIStyledText.new()
	LocationLabel.id = "LocationLabel"
	LocationLabel:SetRGBFromInt( 15132390, 0 )
	LocationLabel:setText( Engine.Localize( "MENU_NEW" ), 0 )
	LocationLabel:SetFontSize( 50 * _1080p )
	LocationLabel:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	LocationLabel:SetAlignment( LUI.Alignment.Center )
	LocationLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1260, _1080p * -96, _1080p * 60, _1080p * 110 )
	self:addElement( LocationLabel )
	self.LocationLabel = LocationLabel
	
	local GameModeLabel = nil
	
	GameModeLabel = LUI.UIStyledText.new()
	GameModeLabel.id = "GameModeLabel"
	GameModeLabel:SetRGBFromInt( 15132390, 0 )
	GameModeLabel:setText( Engine.Localize( "MENU_NEW" ), 0 )
	GameModeLabel:SetFontSize( 50 * _1080p )
	GameModeLabel:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	GameModeLabel:SetAlignment( LUI.Alignment.Center )
	GameModeLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, _1080p * -1260, _1080p * 60, _1080p * 110 )
	self:addElement( GameModeLabel )
	self.GameModeLabel = GameModeLabel
	
	local CenterGlow = nil
	
	CenterGlow = LUI.UIImage.new()
	CenterGlow.id = "CenterGlow"
	CenterGlow:SetAlpha( 0, 0 )
	CenterGlow:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	CenterGlow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 355, _1080p * 357 )
	self:addElement( CenterGlow )
	self.CenterGlow = CenterGlow
	
	local TeamBWatermark = nil
	
	TeamBWatermark = LUI.UIImage.new()
	TeamBWatermark.id = "TeamBWatermark"
	TeamBWatermark:SetRGBFromInt( 12566463, 0 )
	TeamBWatermark:SetAlpha( 0.3, 0 )
	TeamBWatermark:SetZRotation( -90, 0 )
	TeamBWatermark:SetScale( -0.4, 0 )
	TeamBWatermark:setImage( RegisterMaterial( "icon_faction_watermark_sdf" ), 0 )
	TeamBWatermark:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -436, _1080p * 148, _1080p * 246, _1080p * 411 )
	self:addElement( TeamBWatermark )
	self.TeamBWatermark = TeamBWatermark
	
	local VS = nil
	
	VS = LUI.UIImage.new()
	VS.id = "VS"
	VS:setImage( RegisterMaterial( "wdg_vs_image" ), 0 )
	VS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -86, _1080p * 86, _1080p * -215, _1080p * -43 )
	self:addElement( VS )
	self.VS = VS
	
	local TeamAName = nil
	
	TeamAName = LUI.UIStyledText.new()
	TeamAName.id = "TeamAName"
	TeamAName:SetAlpha( 0, 0 )
	TeamAName:setText( "UNSA", 0 )
	TeamAName:SetFontSize( 45 * _1080p )
	TeamAName:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	TeamAName:SetAlignment( LUI.Alignment.Center )
	TeamAName:SetStartupDelay( 1000 )
	TeamAName:SetLineHoldTime( 400 )
	TeamAName:SetAnimMoveTime( 150 )
	TeamAName:SetEndDelay( 1000 )
	TeamAName:SetCrossfadeTime( 400 )
	TeamAName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TeamAName:SetMaxVisibleLines( 1 )
	TeamAName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 650, _1080p * 480, _1080p * 525 )
	self:addElement( TeamAName )
	self.TeamAName = TeamAName
	
	local TeamBName = nil
	
	TeamBName = LUI.UIStyledText.new()
	TeamBName.id = "TeamBName"
	TeamBName:SetAlpha( 0, 0 )
	TeamBName:setText( "SDF", 0 )
	TeamBName:SetFontSize( 45 * _1080p )
	TeamBName:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	TeamBName:SetAlignment( LUI.Alignment.Center )
	TeamBName:SetStartupDelay( 1000 )
	TeamBName:SetLineHoldTime( 400 )
	TeamBName:SetAnimMoveTime( 150 )
	TeamBName:SetEndDelay( 1000 )
	TeamBName:SetCrossfadeTime( 400 )
	TeamBName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TeamBName:SetMaxVisibleLines( 1 )
	TeamBName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1276, _1080p * 1776, _1080p * 480, _1080p * 525 )
	self:addElement( TeamBName )
	self.TeamBName = TeamBName
	
	local f18_local21 = nil
	if CONDITIONS.IsCorePublicMatch( self ) then
		f18_local21 = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
			controllerIndex = f18_local1
		} )
		f18_local21.id = "DoubleXPNotifications"
		f18_local21:SetScale( -0.5, 0 )
		f18_local21:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 34, _1080p * 418, _1080p * -165, _1080p * -37 )
		self:addElement( f18_local21 )
		self.DoubleXPNotifications = f18_local21
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.FFAList = function ()
			
		end
		
		TeamAList:RegisterAnimationSequence( "Codcaster", {
			{
				function ()
					return self.TeamAList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 160, _1080p * 835, _1080p * 540, _1080p * 908, 0 )
				end
			}
		} )
		TeamBList:RegisterAnimationSequence( "Codcaster", {
			{
				function ()
					return self.TeamBList:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -835, _1080p * -160, _1080p * 540, _1080p * 908, 0 )
				end
			}
		} )
		VS:RegisterAnimationSequence( "Codcaster", {
			{
				function ()
					return self.VS:SetAlpha( 1, 0 )
				end
			}
		} )
		TeamAName:RegisterAnimationSequence( "Codcaster", {
			{
				function ()
					return self.TeamAName:SetAlpha( 1, 0 )
				end
			}
		} )
		TeamBName:RegisterAnimationSequence( "Codcaster", {
			{
				function ()
					return self.TeamBName:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Codcaster = function ()
			TeamAList:AnimateSequence( "Codcaster" )
			TeamBList:AnimateSequence( "Codcaster" )
			VS:AnimateSequence( "Codcaster" )
			TeamAName:AnimateSequence( "Codcaster" )
			TeamBName:AnimateSequence( "Codcaster" )
		end
		
		TeamAWatermark:RegisterAnimationSequence( "NoPreassignedTeams", {
			{
				function ()
					return self.TeamAWatermark:SetAlpha( 0, 0 )
				end
			}
		} )
		TeamALogo:RegisterAnimationSequence( "NoPreassignedTeams", {
			{
				function ()
					return self.TeamALogo:SetAlpha( 0, 0 )
				end
			}
		} )
		TeamBLogo:RegisterAnimationSequence( "NoPreassignedTeams", {
			{
				function ()
					return self.TeamBLogo:SetAlpha( 0, 0 )
				end
			}
		} )
		TeamBWatermark:RegisterAnimationSequence( "NoPreassignedTeams", {
			{
				function ()
					return self.TeamBWatermark:SetAlpha( 0, 0 )
				end
			}
		} )
		VS:RegisterAnimationSequence( "NoPreassignedTeams", {
			{
				function ()
					return self.VS:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoPreassignedTeams = function ()
			TeamAWatermark:AnimateSequence( "NoPreassignedTeams" )
			TeamALogo:AnimateSequence( "NoPreassignedTeams" )
			TeamBLogo:AnimateSequence( "NoPreassignedTeams" )
			TeamBWatermark:AnimateSequence( "NoPreassignedTeams" )
			VS:AnimateSequence( "NoPreassignedTeams" )
		end
		
		TeamAName:RegisterAnimationSequence( "GBTeamNames", {
			{
				function ()
					return self.TeamAName:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TeamAName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 650, _1080p * 420, _1080p * 465, 0 )
				end
			}
		} )
		TeamBName:RegisterAnimationSequence( "GBTeamNames", {
			{
				function ()
					return self.TeamBName:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TeamBName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1276, _1080p * 1776, _1080p * 420, _1080p * 465, 0 )
				end
			}
		} )
		self._sequences.GBTeamNames = function ()
			TeamAName:AnimateSequence( "GBTeamNames" )
			TeamBName:AnimateSequence( "GBTeamNames" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local10( self, f18_local1, controller )
	return self
end

MenuBuilder.registerType( "Versus", Versus )
LUI.FlowManager.RegisterStackPopBehaviour( "Versus", f0_local8 )
LockTable( _M )
