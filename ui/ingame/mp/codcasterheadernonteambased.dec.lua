local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = "%02d"
	f1_arg0.codcasterScoreLogoWidgetTop1.PlayerScore:SetRGBFromTable( SWATCHES.Scoreboard.firstPlace, 0 )
	f1_arg0.codcasterScoreLogoWidgetTop1.PlayerName:SetRGBFromTable( SWATCHES.Scoreboard.firstPlace, 0 )
	f1_arg0.codcasterScoreLogoWidgetTop1.TeamColor:SetRGBFromTable( SWATCHES.Scoreboard.firstPlace, 0 )
	f1_arg0.codcasterScoreLogoWidgetTop2.PlayerScore:SetRGBFromTable( SWATCHES.Scoreboard.secondPlace, 0 )
	f1_arg0.codcasterScoreLogoWidgetTop2.PlayerName:SetRGBFromTable( SWATCHES.Scoreboard.secondPlace, 0 )
	f1_arg0.codcasterScoreLogoWidgetTop2.TeamColor:SetRGBFromTable( SWATCHES.Scoreboard.secondPlace, 0 )
	f1_arg0.codcasterScoreLogoWidgetTop3.PlayerScore:SetRGBFromTable( SWATCHES.Scoreboard.thirdPlace, 0 )
	f1_arg0.codcasterScoreLogoWidgetTop3.PlayerName:SetRGBFromTable( SWATCHES.Scoreboard.thirdPlace, 0 )
	f1_arg0.codcasterScoreLogoWidgetTop3.TeamColor:SetRGBFromTable( SWATCHES.Scoreboard.thirdPlace, 0 )
	f1_arg0:registerEventHandler( "timer_update_top3", function ( element, event )
		local f2_local0 = GameX.GetPlayerScoreInfoAtRankForGameMode( Teams.free, 1, GameX.GetGameMode(), false )
		if f2_local0 then
			element.codcasterScoreLogoWidgetTop1.PlayerScore:setText( string.format( f1_local0, f2_local0.score ) )
			element.codcasterScoreLogoWidgetTop1.PlayerName:setText( f2_local0.name )
		end
		local f2_local1 = GameX.GetPlayerScoreInfoAtRankForGameMode( Teams.free, 2, GameX.GetGameMode(), false )
		if f2_local1 then
			element.codcasterScoreLogoWidgetTop2.PlayerScore:setText( string.format( f1_local0, f2_local1.score ) )
			element.codcasterScoreLogoWidgetTop2.PlayerName:setText( f2_local1.name )
		end
		local f2_local2 = GameX.GetPlayerScoreInfoAtRankForGameMode( Teams.free, 3, GameX.GetGameMode(), false )
		if f2_local2 then
			element.codcasterScoreLogoWidgetTop3.PlayerScore:setText( string.format( f1_local0, f2_local2.score ) )
			element.codcasterScoreLogoWidgetTop3.PlayerName:setText( f2_local2.name )
		end
	end )
	local self = LUI.UITimer.new( nil, {
		interval = 60,
		event = {
			name = "timer_update_top3",
			dispatchChildren = true
		},
		disposable = false,
		eventTarget = f1_arg0,
		broadcastToRoot = false
	} )
	self.id = "timer_update_top3"
	f1_arg0:addElement( self )
end

function CodCasterHeaderNonTeamBased( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 591 * _1080p, 0, 131 * _1080p )
	self.id = "CodCasterHeaderNonTeamBased"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local codcasterScoreLogoWidgetTop3 = nil
	
	codcasterScoreLogoWidgetTop3 = MenuBuilder.BuildRegisteredType( "codcaster_ScoreLogoWidget_FFA", {
		controllerIndex = f3_local1
	} )
	codcasterScoreLogoWidgetTop3.id = "codcasterScoreLogoWidgetTop3"
	codcasterScoreLogoWidgetTop3.PlayerName:setText( "", 0 )
	codcasterScoreLogoWidgetTop3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 430.5, _1080p * 700.5, _1080p * -38, _1080p * 152 )
	self:addElement( codcasterScoreLogoWidgetTop3 )
	self.codcasterScoreLogoWidgetTop3 = codcasterScoreLogoWidgetTop3
	
	local codcasterScoreLogoWidgetTop2 = nil
	
	codcasterScoreLogoWidgetTop2 = MenuBuilder.BuildRegisteredType( "codcaster_ScoreLogoWidget_FFA", {
		controllerIndex = f3_local1
	} )
	codcasterScoreLogoWidgetTop2.id = "codcasterScoreLogoWidgetTop2"
	codcasterScoreLogoWidgetTop2.PlayerName:setText( "", 0 )
	codcasterScoreLogoWidgetTop2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -109.5, _1080p * 160.5, _1080p * -38, _1080p * 152 )
	self:addElement( codcasterScoreLogoWidgetTop2 )
	self.codcasterScoreLogoWidgetTop2 = codcasterScoreLogoWidgetTop2
	
	local codcasterScoreLogoWidgetTop1 = nil
	
	codcasterScoreLogoWidgetTop1 = MenuBuilder.BuildRegisteredType( "codcaster_ScoreLogoWidget_FFA", {
		controllerIndex = f3_local1
	} )
	codcasterScoreLogoWidgetTop1.id = "codcasterScoreLogoWidgetTop1"
	codcasterScoreLogoWidgetTop1.PlayerName:setText( "", 0 )
	codcasterScoreLogoWidgetTop1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 160.5, _1080p * 430.5, _1080p * -38, _1080p * 167 )
	self:addElement( codcasterScoreLogoWidgetTop1 )
	self.codcasterScoreLogoWidgetTop1 = codcasterScoreLogoWidgetTop1
	
	local GameModeBackground = nil
	
	GameModeBackground = LUI.UIImage.new()
	GameModeBackground.id = "GameModeBackground"
	GameModeBackground:setImage( RegisterMaterial( "codcaster_scoreboard_header" ), 0 )
	GameModeBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -110.5, _1080p * 703.5, _1080p * -25.5, _1080p * 70.5 )
	self:addElement( GameModeBackground )
	self.GameModeBackground = GameModeBackground
	
	local CodCasterTimer = nil
	
	CodCasterTimer = MenuBuilder.BuildRegisteredType( "CodCasterTimer", {
		controllerIndex = f3_local1
	} )
	CodCasterTimer.id = "CodCasterTimer"
	CodCasterTimer:SetScale( -0.15, 0 )
	CodCasterTimer.GameTimerWarningLeft:SetLeft( _1080p * -12, 0 )
	CodCasterTimer.GameTimerWarningLeft:SetRight( _1080p * 62, 0 )
	CodCasterTimer.GameTimerWarningRight:SetLeft( _1080p * 87, 0 )
	CodCasterTimer.GameTimerWarningRight:SetRight( _1080p * 162, 0 )
	CodCasterTimer.NoTimeLimit:SetRGBFromInt( 2434341, 0 )
	CodCasterTimer.GameTimer:SetRGBFromInt( 2434341, 0 )
	CodCasterTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 220, _1080p * 371, _1080p * 23, _1080p * 60.15 )
	self:addElement( CodCasterTimer )
	self.CodCasterTimer = CodCasterTimer
	
	local GameMode = nil
	
	GameMode = LUI.UIText.new()
	GameMode.id = "GameMode"
	GameMode:SetRGBFromInt( 4079166, 0 )
	GameMode:SetFontSize( 30 * _1080p )
	GameMode:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	GameMode:SetAlignment( LUI.Alignment.Center )
	GameMode:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 545.5, _1080p * 4.5, _1080p * 34 )
	GameMode:SubscribeToModel( DataSources.inGame.MP.match.gameMode:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.MP.match.gameMode:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			GameMode:setText( f4_local0, 0 )
		end
	end )
	self:addElement( GameMode )
	self.GameMode = GameMode
	
	local PositionNumber1 = nil
	
	PositionNumber1 = LUI.UIText.new()
	PositionNumber1.id = "PositionNumber1"
	PositionNumber1:setText( "1", 0 )
	PositionNumber1:SetFontSize( 24 * _1080p )
	PositionNumber1:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	PositionNumber1:SetAlignment( LUI.Alignment.Left )
	PositionNumber1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -418, _1080p * -385, _1080p * 46.5, _1080p * 70.5 )
	self:addElement( PositionNumber1 )
	self.PositionNumber1 = PositionNumber1
	
	local PositionNumber2 = nil
	
	PositionNumber2 = LUI.UIText.new()
	PositionNumber2.id = "PositionNumber2"
	PositionNumber2:setText( "2", 0 )
	PositionNumber2:SetFontSize( 24 * _1080p )
	PositionNumber2:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	PositionNumber2:SetAlignment( LUI.Alignment.Left )
	PositionNumber2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -688, _1080p * -655, _1080p * 46.5, _1080p * 70.5 )
	self:addElement( PositionNumber2 )
	self.PositionNumber2 = PositionNumber2
	
	local PositionNumber3 = nil
	
	PositionNumber3 = LUI.UIText.new()
	PositionNumber3.id = "PositionNumber3"
	PositionNumber3:setText( "3", 0 )
	PositionNumber3:SetFontSize( 24 * _1080p )
	PositionNumber3:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	PositionNumber3:SetAlignment( LUI.Alignment.Left )
	PositionNumber3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -146, _1080p * -113, _1080p * 46.5, _1080p * 70.5 )
	self:addElement( PositionNumber3 )
	self.PositionNumber3 = PositionNumber3
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		codcasterScoreLogoWidgetTop3:RegisterAnimationSequence( "TwoPlayers", {
			{
				function ()
					return self.codcasterScoreLogoWidgetTop3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop3:SetScale( 0.28, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 394.1, _1080p * 664.1, _1080p * -50, _1080p * 140.5, 0 )
				end
			}
		} )
		codcasterScoreLogoWidgetTop2:RegisterAnimationSequence( "TwoPlayers", {
			{
				function ()
					return self.codcasterScoreLogoWidgetTop2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop2:SetScale( 0.28, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -70, _1080p * 200, _1080p * -49, _1080p * 141, 0 )
				end
			}
		} )
		codcasterScoreLogoWidgetTop1:RegisterAnimationSequence( "TwoPlayers", {
			{
				function ()
					return self.codcasterScoreLogoWidgetTop1:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop1:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 160.5, _1080p * 430.5, _1080p * -40, _1080p * 169, 0 )
				end
			}
		} )
		PositionNumber1:RegisterAnimationSequence( "TwoPlayers", {
			{
				function ()
					return self.PositionNumber1:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.PositionNumber1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -417, _1080p * -384, _1080p * 46.5, _1080p * 70.5, 0 )
				end
			}
		} )
		PositionNumber2:RegisterAnimationSequence( "TwoPlayers", {
			{
				function ()
					return self.PositionNumber2:setText( "1", 0 )
				end
			},
			{
				function ()
					return self.PositionNumber2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.PositionNumber2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -683.75, _1080p * -650.75, _1080p * 46, _1080p * 70, 0 )
				end
			}
		} )
		PositionNumber3:RegisterAnimationSequence( "TwoPlayers", {
			{
				function ()
					return self.PositionNumber3:setText( "2", 0 )
				end
			},
			{
				function ()
					return self.PositionNumber3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.PositionNumber3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -220, _1080p * -187, _1080p * 46, _1080p * 70, 0 )
				end
			}
		} )
		self._sequences.TwoPlayers = function ()
			codcasterScoreLogoWidgetTop3:AnimateSequence( "TwoPlayers" )
			codcasterScoreLogoWidgetTop2:AnimateSequence( "TwoPlayers" )
			codcasterScoreLogoWidgetTop1:AnimateSequence( "TwoPlayers" )
			PositionNumber1:AnimateSequence( "TwoPlayers" )
			PositionNumber2:AnimateSequence( "TwoPlayers" )
			PositionNumber3:AnimateSequence( "TwoPlayers" )
		end
		
		codcasterScoreLogoWidgetTop3:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.codcasterScoreLogoWidgetTop3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop3:SetScale( 0, 0 )
				end
			}
		} )
		codcasterScoreLogoWidgetTop2:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.codcasterScoreLogoWidgetTop2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop2:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -66, _1080p * 204, _1080p * -49, _1080p * 141, 0 )
				end
			}
		} )
		codcasterScoreLogoWidgetTop1:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.codcasterScoreLogoWidgetTop1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop1:SetScale( 0.1, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 160.5, _1080p * 430.5, _1080p * -40, _1080p * 169, 0 )
				end
			}
		} )
		PositionNumber1:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.PositionNumber1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.PositionNumber1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -431, _1080p * -398, _1080p * 46.5, _1080p * 70.5, 0 )
				end
			}
		} )
		PositionNumber2:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.PositionNumber2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.PositionNumber2:setText( "2", 0 )
				end
			}
		} )
		PositionNumber3:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.PositionNumber3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.PositionNumber3:setText( "3", 0 )
				end
			}
		} )
		self._sequences.OnePlayer = function ()
			codcasterScoreLogoWidgetTop3:AnimateSequence( "OnePlayer" )
			codcasterScoreLogoWidgetTop2:AnimateSequence( "OnePlayer" )
			codcasterScoreLogoWidgetTop1:AnimateSequence( "OnePlayer" )
			PositionNumber1:AnimateSequence( "OnePlayer" )
			PositionNumber2:AnimateSequence( "OnePlayer" )
			PositionNumber3:AnimateSequence( "OnePlayer" )
		end
		
		codcasterScoreLogoWidgetTop3:RegisterAnimationSequence( "ThreePlayers", {
			{
				function ()
					return self.codcasterScoreLogoWidgetTop3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop3:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 430.5, _1080p * 700.5, _1080p * -38, _1080p * 152, 0 )
				end
			}
		} )
		codcasterScoreLogoWidgetTop2:RegisterAnimationSequence( "ThreePlayers", {
			{
				function ()
					return self.codcasterScoreLogoWidgetTop2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop2:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -109.5, _1080p * 160.5, _1080p * -38, _1080p * 152, 0 )
				end
			}
		} )
		codcasterScoreLogoWidgetTop1:RegisterAnimationSequence( "ThreePlayers", {
			{
				function ()
					return self.codcasterScoreLogoWidgetTop1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop1:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.codcasterScoreLogoWidgetTop1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 160.5, _1080p * 430.5, _1080p * -40, _1080p * 169, 0 )
				end
			}
		} )
		PositionNumber1:RegisterAnimationSequence( "ThreePlayers", {
			{
				function ()
					return self.PositionNumber1:setText( "1", 0 )
				end
			},
			{
				function ()
					return self.PositionNumber1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.PositionNumber1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -418, _1080p * -385, _1080p * 46.5, _1080p * 70.5, 0 )
				end
			}
		} )
		PositionNumber2:RegisterAnimationSequence( "ThreePlayers", {
			{
				function ()
					return self.PositionNumber2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.PositionNumber2:setText( "2", 0 )
				end
			},
			{
				function ()
					return self.PositionNumber2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -688, _1080p * -655, _1080p * 46.5, _1080p * 70.5, 0 )
				end
			}
		} )
		PositionNumber3:RegisterAnimationSequence( "ThreePlayers", {
			{
				function ()
					return self.PositionNumber3:setText( "3", 0 )
				end
			},
			{
				function ()
					return self.PositionNumber3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.PositionNumber3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -146, _1080p * -113, _1080p * 46.5, _1080p * 70.5, 0 )
				end
			}
		} )
		self._sequences.ThreePlayers = function ()
			codcasterScoreLogoWidgetTop3:AnimateSequence( "ThreePlayers" )
			codcasterScoreLogoWidgetTop2:AnimateSequence( "ThreePlayers" )
			codcasterScoreLogoWidgetTop1:AnimateSequence( "ThreePlayers" )
			PositionNumber1:AnimateSequence( "ThreePlayers" )
			PositionNumber2:AnimateSequence( "ThreePlayers" )
			PositionNumber3:AnimateSequence( "ThreePlayers" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterHeaderNonTeamBased", CodCasterHeaderNonTeamBased )
LockTable( _M )
