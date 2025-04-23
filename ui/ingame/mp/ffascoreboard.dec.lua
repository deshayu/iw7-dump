local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "inGame.MP.scoreboard"
f0_local1 = 38
f0_local2 = 32
function GetTextWidth( f1_arg0 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = GetTextDimensions( f1_arg0, FONTS.GetFont( FONTS.MainCondensed.File ), f0_local1 )
	return f1_local2
end

local f0_local3 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = 32
	local f2_local1 = CONDITIONS.IsSplitscreen( f2_arg0 ) and 24 or 279
	local f2_local2 = CONDITIONS.IsSplitscreen( f2_arg0 ) and -26 or 229
	local f2_local3 = -429
	local f2_local4 = 429
	local f2_local5 = f2_arg1 * f2_local0 + f2_local1 + 22
	if f2_arg0.BackgroundBlur then
		f2_arg0.BackgroundBlur:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * f2_local3, _1080p * f2_local4, _1080p * f2_local2, _1080p * f2_local5 )
	end
end

function AdjustHeaderTextHorizontalPosition( f3_arg0 )
	f0_local3( f3_arg0, 0 )
	assert( f3_arg0.GameType )
	assert( f3_arg0.MapName )
	assert( f3_arg0.MatchTimer )
	local f3_local0 = GetTextWidth( f3_arg0.GameType:getText() )
	local f3_local1 = GetTextWidth( f3_arg0.MapName:getText() )
	local f3_local2 = GetTextWidth( "0:00.0" )
	local f3_local3, f3_local4, f3_local5, f3_local6 = f3_arg0.Scores:getLocalRect()
	local f3_local7 = math.abs( f3_local3 - f3_local5 )
	local f3_local8 = f3_local0 + f3_local1 + f3_local2
	local f3_local9 = CONDITIONS.IsSplitscreen( f3_arg0 ) and _1080p * 45 or _1080p * 30
	local f3_local10 = 20
	local f3_local11 = (f0_local1 - f0_local2) / 2
	local f3_local12 = CONDITIONS.IsSplitscreen( f3_arg0 ) and -345 or -308
	local f3_local13 = f3_local12 + f3_local11
	local f3_local14 = -f3_local0 / 2 - f3_local10
	f3_arg0.GameType:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * f3_local14, _1080p * (f3_local14 + f3_local0 + f3_local10), _1080p * f3_local12, _1080p * (f3_local12 + f0_local1), 0 )
	local f3_local15 = -f3_local7 / 2 + f3_local9
	f3_arg0.MapName:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, f3_local15, f3_local15 + f3_local1, _1080p * f3_local13, _1080p * (f3_local13 + f0_local2), 0 )
	local f3_local16 = f3_local7 / 2 - f3_local9
	f3_arg0.MatchTimer:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, f3_local16 - f3_local2, f3_local16, _1080p * f3_local13, _1080p * (f3_local13 + f0_local2), 0 )
end

function PostLoadFunc( f4_arg0, f4_arg1, f4_arg2 )
	assert( f4_arg0.MatchTimer )
	f0_local3( f4_arg0, 0 )
	f4_arg0:addEventHandler( "open_scoreboard", function ( f5_arg0, f5_arg1 )
		AdjustHeaderTextHorizontalPosition( f4_arg0 )
		f4_arg0:processEvent( {
			name = "refreshScores"
		} )
		ACTIONS.GainFocus( f4_arg0, "Scores", f4_arg1 )
	end )
	f4_arg0:addEventHandler( "close_scoreboard", function ( f6_arg0, f6_arg1 )
		ACTIONS.LoseFocus( f4_arg0, "Scores", f4_arg1 )
	end )
	local f4_local0 = function ( f7_arg0 )
		return function ()
			local f8_local0 = f7_arg0:GetMyRowIndex()
			if f8_local0 then
				return {
					x = 0,
					y = f8_local0
				}
			else
				
			end
		end
		
	end
	
	f4_arg0.Scores:SetDefaultFocusFunction( f4_local0( f4_arg0.Scores ) )
	f4_arg0:addEventHandler( "gamepad_button", function ( f9_arg0, f9_arg1 )
		assert( f4_arg0.Scores.Players )
		return f4_arg0.Scores.Players:ProcessEventToChildInFocus( f9_arg1 )
	end )
	local self = LUI.UITimer.new( nil, {
		interval = 1000,
		event = "refreshScores"
	} )
	self.id = "TeamScoresTimer"
	f4_arg0:addElement( self )
	f4_arg0:registerEventHandler( "refreshScores", function ( element, event )
		element.Scores:RefreshRows()
		local f10_local0 = math.max( 4, element.Scores:GetNumPlayers() )
		element.Scores:SetBackgroundRowCount( f10_local0 )
		f0_local3( element, f10_local0 )
	end )
	if not CONDITIONS.IsSplitscreen() then
		local f4_local2 = DataSources.inGame.MP.match.endTime
		f4_arg0:SubscribeToModel( f4_local2:GetModel( f4_arg1 ), function ()
			local f11_local0 = f4_local2:GetValue( f4_arg1 )
			if f11_local0 ~= nil and f11_local0 <= 0 then
				f4_arg0.MatchTimer:SetAlpha( 0 )
			else
				f4_arg0.MatchTimer:SetAlpha( 1 )
			end
		end )
	end
	if CONDITIONS.IsSplitscreen() then
		assert( f4_arg0.ButtonHelperBar )
		assert( f4_arg0.ButtonHelperBar.Background )
		f4_arg0:SetScale( -0.15, 0 )
		f4_arg0.ButtonHelperBar:SetScale( 0.15, 0 )
		f4_arg0.ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -20, _1080p * 54 )
		f4_arg0.ButtonHelperBar.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -100, _1080p * 100, 0, 0 )
	end
end

function FFAScoreboard( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "FFAScoreboard"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	self:playSound( "menu_open" )
	local f12_local2 = self
	local BackgroundBlur = nil
	
	BackgroundBlur = MenuBuilder.BuildRegisteredType( "ScoreboardHeaderBG", {
		controllerIndex = f12_local1
	} )
	BackgroundBlur.id = "BackgroundBlur"
	BackgroundBlur:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -429, _1080p * 429, _1080p * 229, _1080p * 601 )
	self:addElement( BackgroundBlur )
	self.BackgroundBlur = BackgroundBlur
	
	local Scores = nil
	
	Scores = MenuBuilder.BuildRegisteredType( "FFATeamScores", {
		controllerIndex = f12_local1
	} )
	Scores.id = "Scores"
	Scores:SetDataSource( DataSources.inGame.scoreboard.teamFFA, f12_local1 )
	Scores.BackgroundColorTop:SetLeft( _1080p * 37, 0 )
	Scores.BackgroundColorTop:SetRight( _1080p * 895, 0 )
	Scores.BackgroundColorTop:SetTop( _1080p * 0, 0 )
	Scores.BackgroundColorTop:SetAlpha( 0, 0 )
	Scores.BackgroundBacking:SetLeft( _1080p * 37, 0 )
	Scores.BackgroundBacking:SetAlpha( 0, 0 )
	Scores.BackgroundColor:SetLeft( _1080p * 37, 0 )
	Scores.BackgroundColor:SetAlpha( 0, 0 )
	Scores.TeamInfo:SetLeft( _1080p * 0, 0 )
	Scores.TeamInfo:SetRight( _1080p * 0, 0 )
	Scores.TeamInfo:SetAlpha( 0, 0 )
	Scores.TeamInfo.Score:setText( "", 0 )
	Scores:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -466, _1080p * 418, _1080p * 4, _1080p * 714 )
	self:addElement( Scores )
	self.Scores = Scores
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f12_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -70, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local GameType = nil
	
	GameType = LUI.UIText.new()
	GameType.id = "GameType"
	GameType:SetFontSize( 38 * _1080p )
	GameType:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GameType:SetAlignment( LUI.Alignment.Center )
	GameType:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -255, _1080p * 267, _1080p * -21, _1080p * 17 )
	GameType:SubscribeToModel( DataSources.inGame.MP.match.gameMode:GetModel( f12_local1 ), function ()
		local f13_local0 = DataSources.inGame.MP.match.gameMode:GetValue( f12_local1 )
		if f13_local0 ~= nil then
			GameType:setText( ToUpperCase( f13_local0 ), 0 )
		end
	end )
	self:addElement( GameType )
	self.GameType = GameType
	
	local MapName = nil
	
	MapName = LUI.UIText.new()
	MapName.id = "MapName"
	MapName:SetFontSize( 32 * _1080p )
	MapName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MapName:SetAlignment( LUI.Alignment.Left )
	MapName:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -424, _1080p * -232, _1080p * 238, _1080p * 270 )
	MapName:SubscribeToModel( DataSources.inGame.mapName:GetModel( f12_local1 ), function ()
		local f14_local0 = DataSources.inGame.mapName:GetValue( f12_local1 )
		if f14_local0 ~= nil then
			MapName:setText( ToUpperCase( f14_local0 ), 0 )
		end
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	local MatchTimer = nil
	
	MatchTimer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f12_local1
	} )
	MatchTimer.id = "MatchTimer"
	MatchTimer:SetFontSize( 32 * _1080p )
	MatchTimer:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MatchTimer:SetAlignment( LUI.Alignment.Right )
	MatchTimer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 262, _1080p * 424, _1080p * 238, _1080p * 270 )
	MatchTimer:SubscribeToModel( DataSources.inGame.MP.match.endTime:GetModel( f12_local1 ), function ()
		local f15_local0 = DataSources.inGame.MP.match.endTime:GetValue( f12_local1 )
		if f15_local0 ~= nil then
			MatchTimer:setEndTime( f15_local0 )
		end
	end )
	self:addElement( MatchTimer )
	self.MatchTimer = MatchTimer
	
	local f12_local9 = nil
	if CONDITIONS.IsCorePublicMatch( self ) then
		f12_local9 = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
			controllerIndex = f12_local1
		} )
		f12_local9.id = "DoubleXPNotifications"
		f12_local9:SetScale( -0.5, 0 )
		f12_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32, _1080p * 288, _1080p * 22, _1080p * 150 )
		self:addElement( f12_local9 )
		self.DoubleXPNotifications = f12_local9
	end
	self._animationSets.DefaultAnimationSet = function ()
		BackgroundBlur:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BackgroundBlur:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -429, _1080p * 429, _1080p * 229, _1080p * 601, 0 )
				end
			}
		} )
		Scores:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Scores:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -466, _1080p * 418, _1080p * 4, _1080p * 714, 0 )
				end
			}
		} )
		GameType:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GameType:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -260, _1080p * 262, _1080p * 235, _1080p * 273, 0 )
				end
			}
		} )
		MapName:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MapName:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -424, _1080p * -232, _1080p * 238, _1080p * 270, 0 )
				end
			}
		} )
		MatchTimer:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MatchTimer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 262, _1080p * 424, _1080p * 238, _1080p * 270, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			BackgroundBlur:AnimateSequence( "DefaultSequence" )
			Scores:AnimateSequence( "DefaultSequence" )
			GameType:AnimateSequence( "DefaultSequence" )
			MapName:AnimateSequence( "DefaultSequence" )
			MatchTimer:AnimateSequence( "DefaultSequence" )
		end
		
		BackgroundBlur:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.BackgroundBlur:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -429, _1080p * 429, _1080p * -26, _1080p * 311, 0 )
				end
			}
		} )
		Scores:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Scores.BackgroundColorTop:SetLeft( _1080p * 37, 0 )
				end
			},
			{
				function ()
					return self.Scores.TeamInfo:SetLeft( _1080p * 0, 0 )
				end
			},
			{
				function ()
					return self.Scores:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -466, _1080p * 450, _1080p * -251, _1080p * 459, 0 )
				end
			}
		} )
		GameType:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.GameType:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.GameType:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -255, _1080p * 267, _1080p * -561, _1080p * -523, 0 )
				end
			}
		} )
		MapName:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.MapName:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MapName:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -424, _1080p * -232, _1080p * -17, _1080p * 15, 0 )
				end
			}
		} )
		MatchTimer:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.MatchTimer:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MatchTimer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 262, _1080p * 424, _1080p * -17, _1080p * 15, 0 )
				end
			}
		} )
		if CONDITIONS.IsCorePublicMatch( self ) then
			f12_local9:RegisterAnimationSequence( "Splitscreen", {
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
			Scores:AnimateSequence( "Splitscreen" )
			GameType:AnimateSequence( "Splitscreen" )
			MapName:AnimateSequence( "Splitscreen" )
			MatchTimer:AnimateSequence( "Splitscreen" )
			if CONDITIONS.IsCorePublicMatch( self ) then
				f12_local9:AnimateSequence( "Splitscreen" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Scores:SetDataSource( DataSources.inGame.scoreboard.teamFFA, f12_local1 )
	PostLoadFunc( self, f12_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "FFAScoreboard", FFAScoreboard )
LockTable( _M )
