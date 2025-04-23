local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RefreshRowContent( f1_arg0 )
	assert( f1_arg0._row )
	assert( f1_arg0.Player )
	assert( f1_arg0.Score )
	assert( f1_arg0.Headshots )
	assert( f1_arg0.Kills )
	assert( f1_arg0.Revives )
	assert( f1_arg0.Downs )
	assert( f1_arg0.Image )
	assert( f1_arg0._controllerIndex )
	local f1_local0 = Game.GetCPScoreboardRowData( f1_arg0._row )
	assert( f1_local0 )
	assert( f1_local0.clientNum )
	assert( f1_local0.score )
	assert( f1_local0.name )
	assert( f1_local0.headShots )
	assert( f1_local0.kills )
	assert( f1_local0.revives )
	assert( f1_local0.downs )
	assert( f1_local0.isMicOn ~= nil )
	assert( f1_local0.isMuted ~= nil )
	f1_arg0._clientNum = f1_local0.clientNum
	assert( DataSources.inGame.CP.playerCharacter )
	assert( DataSources.inGame.CP.playerStatus )
	local f1_local1 = ZombiesUtils.GetZombiesPlayerPhoto( DataSources.inGame.CP.playerCharacter:GetValue( f1_arg0._controllerIndex ), DataSources.inGame.CP.playerStatus:GetValue( f1_arg0._controllerIndex ), f1_arg0._clientNum )
	if f1_arg0._clientNum then
		assert( f1_arg0.RankIcon )
		assert( f1_arg0.RankDisplay )
		local f1_local2 = ""
		local f1_local3 = ""
		if f1_arg0._clientNum >= 0 then
			f1_local2 = Game.GetPlayerDisplayRank( f1_arg0._clientNum )
			f1_local3 = Game.GetPlayerRankIcon( f1_arg0._clientNum )
		end
		if not CONDITIONS.IsSystemLink( f1_arg0 ) then
			local f1_local4 = f1_local2
			local f1_local5 = f1_local3
			local f1_local6
			if f1_local2 == "" or f1_local3 == "" then
				f1_local6 = false
			else
				f1_local6 = f1_local5 and f1_local4 and true
			end
			if f1_local6 then
				f1_arg0.RankIcon:setImage( RegisterMaterial( f1_local3 ), 0 )
				f1_arg0.RankDisplay:setText( f1_local2 )
			end
			ACTIONS.AnimateSequence( f1_arg0, "ShowRank" )
			if not f1_local6 then
				f1_arg0.RankIcon:SetAlpha( 0, 0 )
				f1_arg0.RankDisplay:SetAlpha( 0, 0 )
			end
		else
			ACTIONS.AnimateSequence( f1_arg0, "HideRank" )
		end
	end
	f1_arg0.Player:setText( f1_local0.name )
	f1_arg0.Score:setText( f1_local0.score )
	f1_arg0.Headshots:setText( f1_local0.headShots )
	f1_arg0.Kills:setText( f1_local0.kills )
	f1_arg0.Revives:setText( f1_local0.revives )
	f1_arg0.Downs:setText( f1_local0.downs )
	if f1_local1 and f1_local1 ~= "" and CONDITIONS.CharacterImagesAreLoaded( f1_arg0._controllerIndex ) then
		if not f1_arg0.currentImage or f1_arg0.currentImage ~= f1_local1 then
			f1_arg0.Image:setImage( RegisterMaterial( f1_local1 ) )
			f1_arg0.currentImage = f1_local1
		end
		f1_arg0.Image:SetAlpha( 1, 0 )
	else
		f1_arg0.Image:SetAlpha( 0, 0 )
	end
	f1_arg0._isCurrentPlayer = f1_arg0._clientNum == Game.GetPlayerClientnum()
	f1_arg0.Speaker:setImage( RegisterMaterial( f1_local0.isMuted and "scoreboard_mic_mute" or "scoreboard_mic_talk" ), 0 )
	assert( f1_local0.isMicOn ~= nil )
	assert( f1_local0.isMuted ~= nil )
	local f1_local6 = nil
	if f1_local0.isMicOn or f1_local0.isMuted then
		f1_local6 = "MicOn"
	else
		f1_local6 = "MicOff"
	end
	if f1_arg0._micAnim ~= f1_local6 then
		ACTIONS.AnimateSequence( f1_arg0, f1_local6 )
		f1_arg0._micAnim = f1_local6
	end
end

function SetPlayer( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0._team = f2_arg1
	f2_arg0._row = f2_arg2
end

function GetClientNum( f3_arg0 )
	return f3_arg0._clientNum
end

function IsMyRow( f4_arg0 )
	return f4_arg0._isCurrentPlayer
end

f0_local0 = function ( f5_arg0, f5_arg1, f5_arg2 )
	assert( f5_arg0.Image )
	f5_arg0._controllerIndex = f5_arg1
	f5_arg0.RefreshRowContent = RefreshRowContent
	f5_arg0.SetPlayer = SetPlayer
	f5_arg0.GetClientNum = GetClientNum
	f5_arg0.IsMyRow = IsMyRow
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "bindButton"
	f5_arg0:addElement( bindButton )
	f5_arg0.bindButton = bindButton
	
	f5_arg0.bindButton:addEventHandler( "button_start", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f6_arg0:getParent()
		if #f6_local0:getAllFocusedChildren() <= 0 then
			f6_local0 = f6_arg0:getParent()
			if f6_local0:isInFocus() then
				if (Engine.IsConsoleGame() or Engine.IsPCApp()) and not CONDITIONS.IsSystemLink( f5_arg0 ) and f5_arg0._clientNum then
					Game.ShowGamerCard( f5_arg0._clientNum )
				end
				return true
			end
		end
		if (Engine.IsConsoleGame() or Engine.IsPCApp()) and not CONDITIONS.IsSystemLink( f5_arg0 ) and f5_arg0._clientNum then
			Game.ShowGamerCard( f5_arg0._clientNum )
		end
		return true
	end )
	local f5_local1 = "button_action"
	if Engine.IsPC() then
		f5_local1 = "button_alt1"
	end
	f5_arg0.bindButton:addEventHandler( f5_local1, function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg0:getParent()
		if #f7_local0:getAllFocusedChildren() <= 0 then
			f7_local0 = f7_arg0:getParent()
			if f7_local0:isInFocus() then
			
			else
				
			end
		end
		Game.TogglePlayerMute( f5_arg0._clientNum )
		return true
	end )
	local f5_local2 = function ()
		if f5_arg0._clientNum then
			assert( DataSources.inGame.CP.playerCharacter )
			assert( DataSources.inGame.CP.playerStatus )
			f5_arg0.Image:setImage( RegisterMaterial( ZombiesUtils.GetZombiesPlayerPhoto( DataSources.inGame.CP.playerCharacter:GetValue( f5_arg0._controllerIndex ), DataSources.inGame.CP.playerStatus:GetValue( f5_arg0._controllerIndex ), f5_arg0._clientNum ) ) )
		end
	end
	
	f5_arg0.Image:SubscribeToModel( DataSources.inGame.CP.playerCharacter:GetModel( f5_arg1 ), f5_local2 )
	f5_arg0.Image:SubscribeToModel( DataSources.inGame.CP.playerStatus:GetModel( f5_arg1 ), f5_local2 )
end

function ZMPlayersScoreboard( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1746 * _1080p, 0, 103 * _1080p )
	self.id = "ZMPlayersScoreboard"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1745, 0, _1080p * 102 )
	self:addElement( Background )
	self.Background = Background
	
	local Player = nil
	
	Player = LUI.UIText.new()
	Player.id = "Player"
	Player:setText( "", 0 )
	Player:SetFontSize( 38 * _1080p )
	Player:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Player:SetAlignment( LUI.Alignment.Left )
	Player:SetOptOutRightToLeftAlignmentFlip( true )
	Player:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 350.5, _1080p * 900, _1080p * 34.5, _1080p * 72.5 )
	self:addElement( Player )
	self.Player = Player
	
	local Headshots = nil
	
	Headshots = LUI.UIText.new()
	Headshots.id = "Headshots"
	Headshots:setText( "", 0 )
	Headshots:SetFontSize( 38 * _1080p )
	Headshots:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Headshots:SetAlignment( LUI.Alignment.Center )
	Headshots:SetOptOutRightToLeftAlignmentFlip( true )
	Headshots:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1261, _1080p * 1444, _1080p * 32, _1080p * 70 )
	self:addElement( Headshots )
	self.Headshots = Headshots
	
	local Score = nil
	
	Score = LUI.UIText.new()
	Score.id = "Score"
	Score:setText( "", 0 )
	Score:SetFontSize( 38 * _1080p )
	Score:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Score:SetAlignment( LUI.Alignment.Center )
	Score:SetOptOutRightToLeftAlignmentFlip( true )
	Score:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 830.5, _1080p * 1020.5, _1080p * 32.5, _1080p * 70.5 )
	self:addElement( Score )
	self.Score = Score
	
	local Kills = nil
	
	Kills = LUI.UIText.new()
	Kills.id = "Kills"
	Kills:setText( "", 0 )
	Kills:SetFontSize( 38 * _1080p )
	Kills:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Kills:SetAlignment( LUI.Alignment.Center )
	Kills:SetOptOutRightToLeftAlignmentFlip( true )
	Kills:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1036.5, _1080p * 1238.5, _1080p * 32, _1080p * 70 )
	self:addElement( Kills )
	self.Kills = Kills
	
	local Revives = nil
	
	Revives = LUI.UIText.new()
	Revives.id = "Revives"
	Revives:setText( "", 0 )
	Revives:SetFontSize( 38 * _1080p )
	Revives:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Revives:SetAlignment( LUI.Alignment.Center )
	Revives:SetOptOutRightToLeftAlignmentFlip( true )
	Revives:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1472, _1080p * 1592, _1080p * 32.5, _1080p * 70.5 )
	self:addElement( Revives )
	self.Revives = Revives
	
	local Downs = nil
	
	Downs = LUI.UIText.new()
	Downs.id = "Downs"
	Downs:setText( "", 0 )
	Downs:SetFontSize( 38 * _1080p )
	Downs:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Downs:SetAlignment( LUI.Alignment.Center )
	Downs:SetOptOutRightToLeftAlignmentFlip( true )
	Downs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1616, _1080p * 1745, _1080p * 32.5, _1080p * 70.5 )
	self:addElement( Downs )
	self.Downs = Downs
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 37.36, _1080p * 165.36, _1080p * -14, _1080p * 114 )
	self:addElement( Image )
	self.Image = Image
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Border.id = "Border"
	Border:SetRGBFromInt( 9342606, 0 )
	Border:SetBorderThicknessLeft( _1080p * 2, 0 )
	Border:SetBorderThicknessRight( _1080p * 2, 0 )
	Border:SetBorderThicknessTop( _1080p * 2, 0 )
	Border:SetBorderThicknessBottom( _1080p * 2, 0 )
	Border:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1745, 0, _1080p * 102 )
	self:addElement( Border )
	self.Border = Border
	
	local Speaker = nil
	
	Speaker = LUI.UIImage.new()
	Speaker.id = "Speaker"
	Speaker:SetAlpha( 0, 0 )
	Speaker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -73, _1080p * -17, _1080p * 22, _1080p * 78 )
	self:addElement( Speaker )
	self.Speaker = Speaker
	
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -707.64, _1080p * -638.64, _1080p * 16.5, _1080p * -17.5 )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local RankDisplay = nil
	
	RankDisplay = LUI.UIText.new()
	RankDisplay.id = "RankDisplay"
	RankDisplay:setText( "---", 0 )
	RankDisplay:SetFontSize( 38 * _1080p )
	RankDisplay:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RankDisplay:SetAlignment( LUI.Alignment.Left )
	RankDisplay:SetOptOutRightToLeftAlignmentFlip( true )
	RankDisplay:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 234.36, _1080p * 310.86, _1080p * 32.5, _1080p * 70.5 )
	self:addElement( RankDisplay )
	self.RankDisplay = RankDisplay
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "ButtonOverSpaceland", {
			{
				function ()
					return self.Background:SetRGBFromInt( 9932173, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonOverSpaceland", {
			{
				function ()
					return self.Border:SetRGBFromInt( 14951294, 0 )
				end
			}
		} )
		self._sequences.ButtonOverSpaceland = function ()
			Background:AnimateSequence( "ButtonOverSpaceland" )
			Border:AnimateSequence( "ButtonOverSpaceland" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Background:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Border:SetRGBFromInt( 9342606, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Background:AnimateSequence( "ButtonUp" )
			Border:AnimateSequence( "ButtonUp" )
		end
		
		Speaker:RegisterAnimationSequence( "MicOn", {
			{
				function ()
					return self.Speaker:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.MicOn = function ()
			Speaker:AnimateSequence( "MicOn" )
		end
		
		Speaker:RegisterAnimationSequence( "MicOff", {
			{
				function ()
					return self.Speaker:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.MicOff = function ()
			Speaker:AnimateSequence( "MicOff" )
		end
		
		Player:RegisterAnimationSequence( "ShowRank", {
			{
				function ()
					return self.Player:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 350.5, _1080p * 900, _1080p * 34.5, _1080p * 72.5, 0 )
				end
			}
		} )
		RankIcon:RegisterAnimationSequence( "ShowRank", {
			{
				function ()
					return self.RankIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		RankDisplay:RegisterAnimationSequence( "ShowRank", {
			{
				function ()
					return self.RankDisplay:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowRank = function ()
			Player:AnimateSequence( "ShowRank" )
			RankIcon:AnimateSequence( "ShowRank" )
			RankDisplay:AnimateSequence( "ShowRank" )
		end
		
		Player:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.Player:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 196.5, _1080p * 547.5, _1080p * 34.5, _1080p * 72.5, 0 )
				end
			}
		} )
		RankIcon:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.RankIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		RankDisplay:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.RankDisplay:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.RankDisplay:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 234.36, _1080p * 900, _1080p * 32.5, _1080p * 70.5, 0 )
				end
			}
		} )
		self._sequences.HideRank = function ()
			Player:AnimateSequence( "HideRank" )
			RankIcon:AnimateSequence( "HideRank" )
			RankDisplay:AnimateSequence( "HideRank" )
		end
		
		Background:RegisterAnimationSequence( "ButtonOverRave", {
			{
				function ()
					return self.Background:SetAlpha( 0.7, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonOverRave", {
			{
				function ()
					return self.Border:SetRGBFromInt( 13004282, 0 )
				end
			},
			{
				function ()
					return self.Border:SetAlpha( 0.85, 0 )
				end
			}
		} )
		self._sequences.ButtonOverRave = function ()
			Background:AnimateSequence( "ButtonOverRave" )
			Border:AnimateSequence( "ButtonOverRave" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUpRave", {
			{
				function ()
					return self.Background:SetAlpha( 0.7, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonUpRave", {
			{
				function ()
					return self.Border:SetRGBFromInt( 9342606, 0 )
				end
			},
			{
				function ()
					return self.Border:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUpRave = function ()
			Background:AnimateSequence( "ButtonUpRave" )
			Border:AnimateSequence( "ButtonUpRave" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUpSpaceland", {
			{
				function ()
					return self.Background:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonUpSpaceland", {
			{
				function ()
					return self.Border:SetRGBFromInt( 9342606, 0 )
				end
			}
		} )
		self._sequences.ButtonUpSpaceland = function ()
			Background:AnimateSequence( "ButtonUpSpaceland" )
			Border:AnimateSequence( "ButtonUpSpaceland" )
		end
		
		Background:RegisterAnimationSequence( "backgroundRave", {
			{
				function ()
					return self.Background:setImage( RegisterMaterial( "zm_dlc1_score_player_bar" ), 0 )
				end
			},
			{
				function ()
					return self.Background:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1745, 0, _1080p * 102, 0 )
				end
			}
		} )
		self._sequences.backgroundRave = function ()
			Background:AnimateSequence( "backgroundRave" )
		end
		
		Background:RegisterAnimationSequence( "ButtonOverDisco", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonOverDisco", {
			{
				function ()
					return self.Border:SetRGBFromInt( 13569835, 0 )
				end
			},
			{
				function ()
					return self.Border:SetAlpha( 0.85, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisco = function ()
			Background:AnimateSequence( "ButtonOverDisco" )
			Border:AnimateSequence( "ButtonOverDisco" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUpDisco", {
			{
				function ()
					return self.Background:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonUpDisco", {
			{
				function ()
					return self.Border:SetRGBFromInt( 9342606, 0 )
				end
			},
			{
				function ()
					return self.Border:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisco = function ()
			Background:AnimateSequence( "ButtonUpDisco" )
			Border:AnimateSequence( "ButtonUpDisco" )
		end
		
		Background:RegisterAnimationSequence( "backgroundDisco", {
			{
				function ()
					return self.Background:setImage( RegisterMaterial( "zm_dlc2_score_player_bar" ), 0 )
				end
			},
			{
				function ()
					return self.Background:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1745, 0, _1080p * 102, 0 )
				end
			}
		} )
		self._sequences.backgroundDisco = function ()
			Background:AnimateSequence( "backgroundDisco" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUpTown", {
			{
				function ()
					return self.Background:SetAlpha( 0.7, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonUpTown", {
			{
				function ()
					return self.Border:SetRGBFromInt( 9342606, 0 )
				end
			},
			{
				function ()
					return self.Border:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUpTown = function ()
			Background:AnimateSequence( "ButtonUpTown" )
			Border:AnimateSequence( "ButtonUpTown" )
		end
		
		Background:RegisterAnimationSequence( "ButtonOverTown", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonOverTown", {
			{
				function ()
					return self.Border:SetRGBFromInt( 13569835, 0 )
				end
			},
			{
				function ()
					return self.Border:SetAlpha( 0.85, 0 )
				end
			}
		} )
		self._sequences.ButtonOverTown = function ()
			Background:AnimateSequence( "ButtonOverTown" )
			Border:AnimateSequence( "ButtonOverTown" )
		end
		
		Background:RegisterAnimationSequence( "ButtonOverFinal", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonOverFinal", {
			{
				function ()
					return self.Border:SetRGBFromInt( 3316021, 0 )
				end
			},
			{
				function ()
					return self.Border:SetAlpha( 0.85, 0 )
				end
			}
		} )
		self._sequences.ButtonOverFinal = function ()
			Background:AnimateSequence( "ButtonOverFinal" )
			Border:AnimateSequence( "ButtonOverFinal" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUpFinal", {
			{
				function ()
					return self.Background:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "ButtonUpFinal", {
			{
				function ()
					return self.Border:SetRGBFromInt( 9342606, 0 )
				end
			},
			{
				function ()
					return self.Border:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonUpFinal = function ()
			Background:AnimateSequence( "ButtonUpFinal" )
			Border:AnimateSequence( "ButtonUpFinal" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f74_arg0, f74_arg1 )
		local f74_local0 = f74_arg1.controller or f9_local1
		if CONDITIONS.IsSpaceland( self ) then
			ACTIONS.AnimateSequence( self, "ButtonOverSpaceland" )
		end
		if CONDITIONS.IsRave( self ) then
			ACTIONS.AnimateSequence( self, "ButtonOverRave" )
		end
		if CONDITIONS.IsDLC2( self ) then
			ACTIONS.AnimateSequence( self, "ButtonOverDisco" )
		end
		if CONDITIONS.IsDLC3( self ) then
			ACTIONS.AnimateSequence( self, "ButtonOverTown" )
		end
		if CONDITIONS.IsDLC4( self ) then
			ACTIONS.AnimateSequence( self, "ButtonOverFinal" )
		end
	end )
	self:addEventHandler( "button_up", function ( f75_arg0, f75_arg1 )
		local f75_local0 = f75_arg1.controller or f9_local1
		if CONDITIONS.IsSpaceland( self ) then
			ACTIONS.AnimateSequence( self, "ButtonUpSpaceland" )
		end
		if CONDITIONS.IsRave( self ) then
			ACTIONS.AnimateSequence( self, "ButtonUpRave" )
		end
		if CONDITIONS.IsDLC2( self ) then
			ACTIONS.AnimateSequence( self, "ButtonUpDisco" )
		end
		if CONDITIONS.IsDLC3( self ) then
			ACTIONS.AnimateSequence( self, "ButtonUpTown" )
		end
		if CONDITIONS.IsDLC4( self ) then
			ACTIONS.AnimateSequence( self, "ButtonUpFinal" )
		end
	end )
	f0_local0( self, f9_local1, controller )
	if CONDITIONS.IsRave( self ) then
		ACTIONS.AnimateSequence( self, "backgroundRave" )
	end
	if CONDITIONS.IsDLC2( self ) then
		ACTIONS.AnimateSequence( self, "backgroundDisco" )
	end
	return self
end

MenuBuilder.registerType( "ZMPlayersScoreboard", ZMPlayersScoreboard )
LockTable( _M )
