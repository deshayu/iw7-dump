local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PreLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	InitCoreMPRankedDataSources()
end

function PopFunc()
	Engine.Unpause()
end

function PostLoadFunc( f3_arg0, f3_arg1, f3_arg2 )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f3_arg0:addElement( self )
	if GameX.IsSplitscreen() then
		f3_arg0.GameDetails:SetLeft( _1080p * -1346, 0 )
		if CONDITIONS.AreContractsEnabled( f3_arg0 ) then
			f3_arg0.SmallContracts.Contracts:SetColumnSpacing( 26 )
		end
	end
	if IsMlgGameBattlesMatch() then
		ACTIONS.AnimateSequence( f3_arg0, "GameBattles" )
		local f3_local1 = GAMEBATTLES.GetCurrentMatch( f3_arg1 )
		if f3_local1 ~= nil then
			f3_arg0.GameBattlesMatchID:setText( Engine.Localize( "MLG_GAMEBATTLES_PAUSE_MATCH_ID", f3_local1.matchId ), 0 )
			f3_arg0.GameBattlesGamesProgress:setText( Engine.Localize( "MLG_GAMEBATTLES_PAUSE_GAME_PROGRESS", MLG.GetActiveGameIndex() + 1, f3_local1.gameCount ), 0 )
			local f3_local2, f3_local3, f3_local4 = GAMEBATTLES.GetMatchVictoryInfo( f3_local1 )
			if f3_local2 == 1 then
				f3_arg0.GameBattlesTeam1Victories:setText( Engine.Localize( "MLG_GAMEBATTLES_PAUSE_TEAM_VICTORY", f3_local1.teams[1].teamName ), 0 )
			else
				f3_arg0.GameBattlesTeam1Victories:setText( Engine.Localize( "MLG_GAMEBATTLES_PAUSE_TEAM_VICTORIES", f3_local1.teams[1].teamName, f3_local2 ), 0 )
			end
			if f3_local3 == 1 then
				f3_arg0.GameBattlesTeam2Victories:setText( Engine.Localize( "MLG_GAMEBATTLES_PAUSE_TEAM_VICTORY", f3_local1.teams[2].teamName ), 0 )
			else
				f3_arg0.GameBattlesTeam2Victories:setText( Engine.Localize( "MLG_GAMEBATTLES_PAUSE_TEAM_VICTORIES", f3_local1.teams[2].teamName, f3_local3 ), 0 )
			end
		end
	end
end

function MPPauseMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "MPPauseMenu"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	PreLoadFunc( self, f4_local1, controller )
	self.soundSet = "inGame"
	self:playSound( "menu_open" )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f4_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f4_local5 = nil
	if CONDITIONS.IsFriendsButtonAccessible( self, f4_local1 ) then
		f4_local5 = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
			controllerIndex = f4_local1
		} )
		f4_local5.id = "FriendsElement"
		f4_local5:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
		f4_local5:SetAlignment( LUI.Alignment.Left )
		f4_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1420, _1080p * 1920, _1080p * 1035, _1080p * 1080 )
		self:addElement( f4_local5 )
		self.FriendsElement = f4_local5
	end
	local PauseMenuButtons = nil
	
	PauseMenuButtons = MenuBuilder.BuildRegisteredType( "PauseMenuButtons", {
		controllerIndex = f4_local1
	} )
	PauseMenuButtons.id = "PauseMenuButtons"
	PauseMenuButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 491 )
	self:addElement( PauseMenuButtons )
	self.PauseMenuButtons = PauseMenuButtons
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f4_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_PAUSED_CAPS" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, _1080p * -88, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local f4_local8 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f4_local8 = MenuBuilder.BuildRegisteredType( "Intel", {
			controllerIndex = f4_local1
		} )
		f4_local8.id = "Intel"
		f4_local8:SetScale( 0.13, 0 )
		f4_local8:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1760, _1080p * -1360, _1080p * 451.94, _1080p * 576.94 )
		self:addElement( f4_local8 )
		self.Intel = f4_local8
	end
	local GameDetails = nil
	
	GameDetails = MenuBuilder.BuildRegisteredType( "GameDetails", {
		controllerIndex = f4_local1
	} )
	GameDetails.id = "GameDetails"
	GameDetails:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1024, 0, _1080p * 216, _1080p * 949 )
	self:addElement( GameDetails )
	self.GameDetails = GameDetails
	
	local f4_local10 = nil
	if CONDITIONS.IsCorePublicMatch( self ) then
		f4_local10 = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
			controllerIndex = f4_local1
		} )
		f4_local10.id = "DoubleXPNotifications"
		f4_local10:SetScale( -0.5, 0 )
		f4_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 66, _1080p * 322, _1080p * 104, _1080p * 232 )
		self:addElement( f4_local10 )
		self.DoubleXPNotifications = f4_local10
	end
	local f4_local11 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f4_local11 = MenuBuilder.BuildRegisteredType( "RankProgression", {
			controllerIndex = f4_local1
		} )
		f4_local11.id = "RankProgression"
		if CONDITIONS.IsPublicMatch( self ) then
			f4_local11:SetDataSource( DataSources.alwaysLoaded.MP.ranked.progression, f4_local1 )
		end
		f4_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1550, _1080p * 1700, _1080p * 54, _1080p * 204 )
		self:addElement( f4_local11 )
		self.RankProgression = f4_local11
	end
	local GameBattlesNode = nil
	
	GameBattlesNode = LUI.UIImage.new()
	GameBattlesNode.id = "GameBattlesNode"
	GameBattlesNode:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	GameBattlesNode:SetAlpha( 0, 0 )
	GameBattlesNode:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 130, _1080p * 145, _1080p * -592.5, _1080p * -588.5 )
	self:addElement( GameBattlesNode )
	self.GameBattlesNode = GameBattlesNode
	
	local GameBattlesDarkBase = nil
	
	GameBattlesDarkBase = LUI.UIImage.new()
	GameBattlesDarkBase.id = "GameBattlesDarkBase"
	GameBattlesDarkBase:SetRGBFromInt( 0, 0 )
	GameBattlesDarkBase:SetAlpha( 0, 0 )
	GameBattlesDarkBase:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 136, _1080p * -1094, _1080p * -537, _1080p * -465 )
	self:addElement( GameBattlesDarkBase )
	self.GameBattlesDarkBase = GameBattlesDarkBase
	
	local GameBattlesDarkHeader = nil
	
	GameBattlesDarkHeader = LUI.UIImage.new()
	GameBattlesDarkHeader.id = "GameBattlesDarkHeader"
	GameBattlesDarkHeader:SetRGBFromInt( 0, 0 )
	GameBattlesDarkHeader:SetAlpha( 0, 0 )
	GameBattlesDarkHeader:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 136, _1080p * -1094, _1080p * -592.5, _1080p * -537 )
	self:addElement( GameBattlesDarkHeader )
	self.GameBattlesDarkHeader = GameBattlesDarkHeader
	
	local GameBattlesDarkFooter = nil
	
	GameBattlesDarkFooter = LUI.UIImage.new()
	GameBattlesDarkFooter.id = "GameBattlesDarkFooter"
	GameBattlesDarkFooter:SetRGBFromInt( 0, 0 )
	GameBattlesDarkFooter:SetAlpha( 0, 0 )
	GameBattlesDarkFooter:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 136, _1080p * -1094, _1080p * -465, _1080p * -410 )
	self:addElement( GameBattlesDarkFooter )
	self.GameBattlesDarkFooter = GameBattlesDarkFooter
	
	local GameBattlesDarkTab = nil
	
	GameBattlesDarkTab = LUI.UIImage.new()
	GameBattlesDarkTab.id = "GameBattlesDarkTab"
	GameBattlesDarkTab:SetRGBFromInt( 0, 0 )
	GameBattlesDarkTab:SetAlpha( 0, 0 )
	GameBattlesDarkTab:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 130, _1080p * 136, _1080p * -592.5, _1080p * -410 )
	self:addElement( GameBattlesDarkTab )
	self.GameBattlesDarkTab = GameBattlesDarkTab
	
	local GameBattlesTeam2Victories = nil
	
	GameBattlesTeam2Victories = LUI.UIText.new()
	GameBattlesTeam2Victories.id = "GameBattlesTeam2Victories"
	GameBattlesTeam2Victories:SetAlpha( 0, 0 )
	GameBattlesTeam2Victories:setText( "", 0 )
	GameBattlesTeam2Victories:SetFontSize( 22 * _1080p )
	GameBattlesTeam2Victories:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GameBattlesTeam2Victories:SetAlignment( LUI.Alignment.Left )
	GameBattlesTeam2Victories:SetOptOutRightToLeftAlignmentFlip( true )
	GameBattlesTeam2Victories:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 148, _1080p * -1094, _1080p * -494.75, _1080p * -471.75 )
	self:addElement( GameBattlesTeam2Victories )
	self.GameBattlesTeam2Victories = GameBattlesTeam2Victories
	
	local GameBattlesTeam1Victories = nil
	
	GameBattlesTeam1Victories = LUI.UIText.new()
	GameBattlesTeam1Victories.id = "GameBattlesTeam1Victories"
	GameBattlesTeam1Victories:SetAlpha( 0, 0 )
	GameBattlesTeam1Victories:setText( ToUpperCase( "" ), 0 )
	GameBattlesTeam1Victories:SetFontSize( 22 * _1080p )
	GameBattlesTeam1Victories:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GameBattlesTeam1Victories:SetAlignment( LUI.Alignment.Left )
	GameBattlesTeam1Victories:SetOptOutRightToLeftAlignmentFlip( true )
	GameBattlesTeam1Victories:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 148, _1080p * -1094, _1080p * -528.5, _1080p * -505.5 )
	self:addElement( GameBattlesTeam1Victories )
	self.GameBattlesTeam1Victories = GameBattlesTeam1Victories
	
	local GameBattlesMatchID = nil
	
	GameBattlesMatchID = LUI.UIStyledText.new()
	GameBattlesMatchID.id = "GameBattlesMatchID"
	GameBattlesMatchID:SetAlpha( 0, 0 )
	GameBattlesMatchID:setText( ToUpperCase( "" ), 0 )
	GameBattlesMatchID:SetFontSize( 38 * _1080p )
	GameBattlesMatchID:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	GameBattlesMatchID:SetAlignment( LUI.Alignment.Left )
	GameBattlesMatchID:SetOptOutRightToLeftAlignmentFlip( true )
	GameBattlesMatchID:SetDecodeUseSystemTime( false )
	GameBattlesMatchID:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 148, _1080p * -1094, _1080p * -583.75, _1080p * -545.75 )
	self:addElement( GameBattlesMatchID )
	self.GameBattlesMatchID = GameBattlesMatchID
	
	local GameBattlesGamesProgress = nil
	
	GameBattlesGamesProgress = LUI.UIStyledText.new()
	GameBattlesGamesProgress.id = "GameBattlesGamesProgress"
	GameBattlesGamesProgress:SetAlpha( 0, 0 )
	GameBattlesGamesProgress:setText( "", 0 )
	GameBattlesGamesProgress:SetFontSize( 38 * _1080p )
	GameBattlesGamesProgress:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	GameBattlesGamesProgress:SetAlignment( LUI.Alignment.Left )
	GameBattlesGamesProgress:SetOptOutRightToLeftAlignmentFlip( true )
	GameBattlesGamesProgress:SetDecodeUseSystemTime( false )
	GameBattlesGamesProgress:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 148, _1080p * -1094, _1080p * -456.5, _1080p * -418.5 )
	self:addElement( GameBattlesGamesProgress )
	self.GameBattlesGamesProgress = GameBattlesGamesProgress
	
	local f4_local21 = nil
	if CONDITIONS.AreContractsEnabled( self ) then
		f4_local21 = MenuBuilder.BuildRegisteredType( "SmallContracts", {
			controllerIndex = f4_local1
		} )
		f4_local21.id = "SmallContracts"
		f4_local21:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1052, _1080p * 615, _1080p * 947 )
		self:addElement( f4_local21 )
		self.SmallContracts = f4_local21
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if CONDITIONS.IsPublicMatch( self ) then
			f4_local8:RegisterAnimationSequence( "Splittscreen", {
				{
					function ()
						return self.Intel:SetScale( 0, 0 )
					end
				},
				{
					function ()
						return self.Intel:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 69.63, _1080p * 194.63, 0 )
					end
				}
			} )
		end
		GameDetails:RegisterAnimationSequence( "Splittscreen", {
			{
				function ()
					return self.GameDetails:SetScale( -0.25, 0 )
				end
			},
			{
				function ()
					return self.GameDetails:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1019, _1080p * 31.6, _1080p * -20, _1080p * 635, 0 )
				end
			}
		} )
		if CONDITIONS.IsCorePublicMatch( self ) then
			f4_local10:RegisterAnimationSequence( "Splittscreen", {
				{
					function ()
						return self.DoubleXPNotifications:SetScale( -0.5, 0 )
					end
				},
				{
					function ()
						return self.DoubleXPNotifications:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 66, _1080p * 322, _1080p * 104, _1080p * 232, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsPublicMatch( self ) then
			f4_local11:RegisterAnimationSequence( "Splittscreen", {
				{
					function ()
						return self.RankProgression:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 280, _1080p * 390, _1080p * 540, 0 )
					end
				}
			} )
		end
		if CONDITIONS.AreContractsEnabled( self ) then
			f4_local21:RegisterAnimationSequence( "Splittscreen", {
				{
					function ()
						return self.SmallContracts:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 449, _1080p * 1371, _1080p * 390, _1080p * 722, 0 )
					end
				}
			} )
		end
		self._sequences.Splittscreen = function ()
			if CONDITIONS.IsPublicMatch( self ) then
				f4_local8:AnimateSequence( "Splittscreen" )
			end
			GameDetails:AnimateSequence( "Splittscreen" )
			if CONDITIONS.IsCorePublicMatch( self ) then
				f4_local10:AnimateSequence( "Splittscreen" )
			end
			if CONDITIONS.IsPublicMatch( self ) then
				f4_local11:AnimateSequence( "Splittscreen" )
			end
			if CONDITIONS.AreContractsEnabled( self ) then
				f4_local21:AnimateSequence( "Splittscreen" )
			end
		end
		
		GameBattlesNode:RegisterAnimationSequence( "GameBattles", {
			{
				function ()
					return self.GameBattlesNode:SetAlpha( 1, 0 )
				end
			}
		} )
		GameBattlesDarkBase:RegisterAnimationSequence( "GameBattles", {
			{
				function ()
					return self.GameBattlesDarkBase:SetAlpha( 0.25, 0 )
				end
			}
		} )
		GameBattlesDarkHeader:RegisterAnimationSequence( "GameBattles", {
			{
				function ()
					return self.GameBattlesDarkHeader:SetAlpha( 0.6, 0 )
				end
			}
		} )
		GameBattlesDarkFooter:RegisterAnimationSequence( "GameBattles", {
			{
				function ()
					return self.GameBattlesDarkFooter:SetAlpha( 0.6, 0 )
				end
			}
		} )
		GameBattlesDarkTab:RegisterAnimationSequence( "GameBattles", {
			{
				function ()
					return self.GameBattlesDarkTab:SetAlpha( 0.6, 0 )
				end
			}
		} )
		GameBattlesTeam2Victories:RegisterAnimationSequence( "GameBattles", {
			{
				function ()
					return self.GameBattlesTeam2Victories:SetAlpha( 1, 0 )
				end
			}
		} )
		GameBattlesTeam1Victories:RegisterAnimationSequence( "GameBattles", {
			{
				function ()
					return self.GameBattlesTeam1Victories:SetAlpha( 1, 0 )
				end
			}
		} )
		GameBattlesMatchID:RegisterAnimationSequence( "GameBattles", {
			{
				function ()
					return self.GameBattlesMatchID:SetAlpha( 1, 0 )
				end
			}
		} )
		GameBattlesGamesProgress:RegisterAnimationSequence( "GameBattles", {
			{
				function ()
					return self.GameBattlesGamesProgress:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.GameBattles = function ()
			GameBattlesNode:AnimateSequence( "GameBattles" )
			GameBattlesDarkBase:AnimateSequence( "GameBattles" )
			GameBattlesDarkHeader:AnimateSequence( "GameBattles" )
			GameBattlesDarkFooter:AnimateSequence( "GameBattles" )
			GameBattlesDarkTab:AnimateSequence( "GameBattles" )
			GameBattlesTeam2Victories:AnimateSequence( "GameBattles" )
			GameBattlesTeam1Victories:AnimateSequence( "GameBattles" )
			GameBattlesMatchID:AnimateSequence( "GameBattles" )
			GameBattlesGamesProgress:AnimateSequence( "GameBattles" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsPublicMatch( self ) then
		f4_local11:SetDataSource( DataSources.alwaysLoaded.MP.ranked.progression, f4_local1 )
	end
	self.addButtonHelperFunction = function ( f26_arg0, f26_arg1 )
		f26_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 2,
			clickable = true
		} )
		f26_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f27_arg0, f27_arg1 )
		local f27_local0 = f27_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
		return true
	end )
	self.bindButton:addEventHandler( "button_start", function ( f28_arg0, f28_arg1 )
		local f28_local0 = f28_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
		return true
	end )
	self.bindButton:addEventHandler( "button_select", function ( f29_arg0, f29_arg1 )
		local f29_local0 = f29_arg1.controller or f4_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.PlaySoundSetSound( self, "pauseMenuOpen", false )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splittscreen" )
	end
	return self
end

MenuBuilder.registerType( "MPPauseMenu", MPPauseMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "MPPauseMenu", PopFunc )
LockTable( _M )
