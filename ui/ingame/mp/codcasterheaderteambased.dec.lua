local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.codcasterScoreLogoWidgetBlackOps.logo:SetAlpha( f1_arg1 )
	f1_arg0.codcasterScoreLogoWidgetDarkOps.logo:SetAlpha( f1_arg1 )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0.teamNameDarkOps:SetAlpha( f2_arg1 )
	f2_arg0.teamNameBlackOps:SetAlpha( f2_arg1 )
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = DataSources.inGame.MP.match.gameType:GetValue( f3_arg1 )
	if f3_local0 == "sd" or f3_local0 == "sr" then
		ACTIONS.AnimateSequence( f3_arg0, "ShowSnD" )
		f3_arg0.team01ObjectiveBacker:SetRGBFromInt( CODCASTER.GetTeam1Color( f3_arg1 ), 0 )
		f3_arg0.team02ObjectiveBacker:SetRGBFromInt( CODCASTER.GetTeam2Color( f3_arg1 ), 0 )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	ACTIONS.AnimateSequence( f4_arg0, "ShowCTF" )
	f4_arg0.team01ObjectiveBacker:SetRGBFromInt( CODCASTER.GetTeam1Color( f4_arg1 ), 0 )
	f4_arg0.team02ObjectiveBacker:SetRGBFromInt( CODCASTER.GetTeam2Color( f4_arg1 ), 0 )
	f4_arg0.team01FlagIcon:SetRGBFromInt( CODCASTER.GetTeam1Color( f4_arg1 ), 0 )
	f4_arg0.team02FlagIcon:SetRGBFromInt( CODCASTER.GetTeam2Color( f4_arg1 ), 0 )
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	ACTIONS.AnimateSequence( f5_arg0, "ShowHardpoint" )
	f5_arg0.SingleObjectiveBacker:BindColorToModel( DataSources.inGame.MP.hardpointStatusColor:GetModel( f5_arg1 ) )
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	ACTIONS.AnimateSequence( f6_arg0, "ShowUplink" )
	f6_arg0.SingleObjectiveBacker:BindColorToModel( DataSources.inGame.HUD.uplinkBallStatusColor:GetModel( f6_arg1 ) )
end

local f0_local6 = function ( f7_arg0, f7_arg1, f7_arg2 )
	if 100 <= f7_arg2 and f7_arg1.lastScore < 100 then
		ACTIONS.AnimateSequence( f7_arg1, "ThreeDigitScore" )
	elseif f7_arg2 >= 1000 and f7_arg1.lastScore < 1000 then
		ACTIONS.AnimateSequence( f7_arg1, "FourDigitScore" )
	elseif f7_arg2 < 100 and 100 <= f7_arg1.lastScore then
		ACTIONS.AnimateSequence( f7_arg1, "DefaultSequence" )
	end
end

local f0_local7 = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0
	if f8_arg2 == 1 then
		f8_local0 = f8_arg0.codcasterScoreLogoWidgetBlackOps
		if not f8_local0 then
		
		else
			local f8_local1
			if f8_arg2 == 1 then
				f8_local1 = f8_arg0.codcasterScoreLogoWidgetDarkOps
				if not f8_local1 then
				
				else
					f8_local0._sequences.Selected()
					f8_local0.SelectionTeam:SetRGBFromInt( CODCASTER.GetTeamColor( f8_arg1, f8_arg2 ), 0 )
					if f8_local1.previouslySelected then
						f8_local1._sequences.DeSelected()
					end
					f8_local0.previouslySelected = true
				end
			end
			f8_local1 = f8_arg0.codcasterScoreLogoWidgetBlackOps
		end
	end
	f8_local0 = f8_arg0.codcasterScoreLogoWidgetDarkOps
end

local f0_local8 = function ( f9_arg0, f9_arg1 )
	local f9_local0 = DataSources.inGame.MP.match.gameMode:GetValue( f9_arg1 )
	local f9_local1 = 100
	local f9_local2, f9_local3, f9_local4, f9_local5 = GetTextDimensions( f9_local0, f9_arg0.GameMode:GetCurrentFont(), 14 * _1080p )
	if f9_local1 < f9_local4 then
		f9_arg0.GameMode:SetTop( _1080p * 8.5, 0 )
	end
end

local f0_local9 = function ( f10_arg0 )
	local f10_local0 = Engine.GetDvarString( "ui_gametype" )
	if CONDITIONS.IsBombGametype( f10_arg0 ) then
		ACTIONS.AnimateSequence( f10_arg0, "HideSnD" )
	elseif f10_local0 == "ctf" then
		ACTIONS.AnimateSequence( f10_arg0, "HideCTF" )
	elseif f10_local0 == "koth" then
		ACTIONS.AnimateSequence( f10_arg0, "HideHardpoint" )
	elseif f10_local0 == "ball" then
		ACTIONS.AnimateSequence( f10_arg0, "HideUplink" )
	end
end

local f0_local10 = function ( f11_arg0 )
	local f11_local0 = Engine.GetDvarString( "ui_gametype" )
	if CONDITIONS.IsBombGametype( f11_arg0 ) then
		ACTIONS.AnimateSequence( f11_arg0, "ShowSnD" )
	elseif f11_local0 == "ctf" then
		ACTIONS.AnimateSequence( f11_arg0, "ShowCTF" )
	elseif f11_local0 == "koth" then
		ACTIONS.AnimateSequence( f11_arg0, "ShowHardpoint" )
	elseif f11_local0 == "ball" then
		ACTIONS.AnimateSequence( f11_arg0, "ShowUplink" )
	end
end

local f0_local11 = function ( f12_arg0, f12_arg1, f12_arg2 )
	f12_arg0.teamNameBlackOps:setText( CODCASTER.GetTeam1Name( f12_arg1 ), 0 )
	f12_arg0.teamNameDarkOps:setText( CODCASTER.GetTeam2Name( f12_arg1 ), 0 )
	f12_arg0.codcasterScoreLogoWidgetBlackOps.logo:setImage( RegisterMaterial( CODCASTER.GetTeam1LogoMaterial( f12_arg1 ) ), 0 )
	f12_arg0.codcasterScoreLogoWidgetDarkOps.logo:setImage( RegisterMaterial( CODCASTER.GetTeam2LogoMaterial( f12_arg1 ) ), 0 )
	f12_arg0.codcasterScoreLogoWidgetBlackOps.teamcolor:SetRGBFromInt( CODCASTER.GetTeam1Color( f12_arg1 ), 0 )
	f12_arg0.codcasterScoreLogoWidgetDarkOps.teamcolor:SetRGBFromInt( CODCASTER.GetTeam2Color( f12_arg1 ), 0 )
	f12_arg0.codcasterScoreLogoWidgetBlackOps.TeamScore:SetShadowRGBFromInt( CODCASTER.GetTeam1Color( f12_arg1 ), 0 )
	f12_arg0.codcasterScoreLogoWidgetDarkOps.TeamScore:SetShadowRGBFromInt( CODCASTER.GetTeam2Color( f12_arg1 ), 0 )
	f12_arg0.SetTeamLogosVisibility = f0_local0
	f12_arg0.SetTeamNamesVisibility = f0_local1
	f12_arg0.SetAliveTextVisibility = f0_local2
	f12_arg0.PlayHeaderHighlightAnimation = f0_local7
	f0_local8( f12_arg0, f12_arg1 )
	local f12_local0, f12_local1, f12_local2, f12_local3 = f12_arg0.codcasterScoreLogoWidgetBlackOps.teamcolor:getCurrentRGBA()
	Engine.SetDvarColor( "cg_hud_outline_colors_10", f12_local0, f12_local1, f12_local2, f12_local3 )
	local f12_local4, f12_local5, f12_local6, f12_local7 = f12_arg0.codcasterScoreLogoWidgetDarkOps.teamcolor:getCurrentRGBA()
	Engine.SetDvarColor( "cg_hud_outline_colors_11", f12_local4, f12_local5, f12_local6, f12_local7 )
	local f12_local8 = function ( f13_arg0 )
		assert( f12_arg0.Round )
		local f13_local0 = DataSources.inGame.MP.match.gameType:GetValue( f12_arg1 )
		if f13_local0 ~= nil then
			local f13_local1 = DataModel.GetModelValue( f13_arg0 )
			local f13_local2 = Engine.GetDvarInt( "scr_" .. f13_local0 .. "_roundlimit" )
			local f13_local3 = Game.GetOmnvar( "ui_last_round" )
			if f13_local0 == "sd" or f13_local0 == "sr" or f13_local0 == "siege" or f13_local0 == "dd" then
				if f13_local3 == true then
					f12_arg0.Round:setText( Engine.Localize( "MPUI_FINALROUND" ) )
				else
					f12_arg0.Round:setText( Engine.Localize( "MPUI_ROUND_ONLY", f13_local1 ) )
				end
			elseif f13_local0 == "war" or f13_local0 == "conf" or f13_local0 == "koth" or f13_local0 == "tdef" or f13_local0 == "grind" or f13_local0 == "grnd" or f13_local0 == "tdm" then
				f12_arg0.Round:SetAlpha( 0, 0 )
			elseif f13_local3 == true then
				f12_arg0.Round:setText( Engine.Localize( "MPUI_FINALROUND" ) )
			elseif f13_local2 > 0 and f13_local2 < f13_local1 then
				f12_arg0.Round:setText( Engine.Localize( "MPUI_OVERTIME" ) )
			else
				f12_arg0.Round:setText( Engine.Localize( "MPUI_ROUND", f13_local1, f13_local2 ) )
			end
		end
	end
	
	if f12_arg0.Round then
		f12_arg0:SubscribeToModel( DataSources.inGame.MP.match.currentRound:GetModel( f12_arg1 ), f12_local8 )
	end
	f12_arg0.codcasterScoreLogoWidgetDarkOps.lastScore = 0
	f12_arg0.codcasterScoreLogoWidgetBlackOps.lastScore = 0
	f12_arg0.codcasterScoreLogoWidgetBlackOps:SubscribeToModel( DataSources.inGame.MP.match.teamScoreFriendly:GetModel( f12_arg1 ), function ()
		local f14_local0 = DataSources.inGame.MP.match.teamScoreFriendly:GetValue( f12_arg1 )
		if f14_local0 ~= nil then
			f0_local6( f12_arg0, f12_arg0.codcasterScoreLogoWidgetBlackOps, f14_local0 )
			f12_arg0.codcasterScoreLogoWidgetBlackOps.TeamScore:setText( f14_local0, 0 )
			f12_arg0.codcasterScoreLogoWidgetBlackOps.lastScore = f14_local0
		end
	end )
	f12_arg0.codcasterScoreLogoWidgetDarkOps:SubscribeToModel( DataSources.inGame.MP.match.teamScoreEnemy:GetModel( f12_arg1 ), function ()
		local f15_local0 = DataSources.inGame.MP.match.teamScoreEnemy:GetValue( f12_arg1 )
		if f15_local0 ~= nil then
			f0_local6( f12_arg0, f12_arg0.codcasterScoreLogoWidgetDarkOps, f15_local0 )
			f12_arg0.codcasterScoreLogoWidgetDarkOps.TeamScore:setText( f15_local0, 0 )
			f12_arg0.codcasterScoreLogoWidgetDarkOps.lastScore = f15_local0
		end
	end )
	f12_arg0:SetAliveTextVisibility( f12_arg1 )
	if CONDITIONS.IsBombGametype( f12_arg0 ) then
		f12_arg0.team01AliveText:SubscribeToModel( DataSources.inGame.HUD.friendlyTeamAlive:GetModel( f12_arg1 ), function ()
			local f16_local0 = DataSources.inGame.HUD.friendlyTeamAlive:GetValue( f12_arg1 )
			if f16_local0 ~= nil then
				f12_arg0.team01AliveText:setText( f16_local0 .. " " .. Engine.Localize( "LUA_MENU_MP_ALIVE" ) )
			end
		end )
		f12_arg0.team02AliveText:SubscribeToModel( DataSources.inGame.HUD.enemyTeamAlive:GetModel( f12_arg1 ), function ()
			local f17_local0 = DataSources.inGame.HUD.enemyTeamAlive:GetValue( f12_arg1 )
			if f17_local0 ~= nil then
				f12_arg0.team02AliveText:setText( f17_local0 .. " " .. Engine.Localize( "LUA_MENU_MP_ALIVE" ) )
			end
		end )
	end
	local f12_local9 = Engine.GetDvarString( "ui_gametype" )
	if f12_local9 == "ctf" then
		f0_local3( f12_arg0, f12_arg1 )
	elseif f12_local9 == "koth" then
		f0_local4( f12_arg0, f12_arg1 )
	elseif f12_local9 == "ball" then
		f0_local5( f12_arg0, f12_arg1 )
	end
	f12_arg0.ShowObjectiveInfo = f0_local10
	f12_arg0.HideObjectiveInfo = f0_local9
end

function CodCasterHeaderTeamBased( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 591 * _1080p, 0, 131 * _1080p )
	self.id = "CodCasterHeaderTeamBased"
	self._animationSets = {}
	self._sequences = {}
	local f18_local1 = controller and controller.controllerIndex
	if not f18_local1 and not Engine.InFrontend() then
		f18_local1 = self:getRootController()
	end
	assert( f18_local1 )
	local f18_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetUMin( 1, 0 )
	Blur:SetUMax( 0, 0 )
	Blur:SetBlendMode( BLEND_MODE.blend )
	Blur:SetBlurStrength( 0.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 216, _1080p * 376, _1080p * 2, _1080p * 138 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local TimerBG = nil
	
	TimerBG = LUI.UIImage.new()
	TimerBG.id = "TimerBG"
	TimerBG:setImage( RegisterMaterial( "codcaster_scoreboard_timer_bg" ), 0 )
	TimerBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 217, _1080p * 376, _1080p * 38.1, _1080p * 138 )
	self:addElement( TimerBG )
	self.TimerBG = TimerBG
	
	local SingleObjectiveBlur = nil
	
	SingleObjectiveBlur = LUI.UIBlur.new()
	SingleObjectiveBlur.id = "SingleObjectiveBlur"
	SingleObjectiveBlur:SetAlpha( 0, 0 )
	SingleObjectiveBlur:SetDotPitchEnabled( true )
	SingleObjectiveBlur:SetDotPitchX( 6, 0 )
	SingleObjectiveBlur:SetDotPitchY( 3, 0 )
	SingleObjectiveBlur:SetDotPitchContrast( 0.15, 0 )
	SingleObjectiveBlur:SetDotPitchMode( 0 )
	SingleObjectiveBlur:setImage( RegisterMaterial( "codcaster_announcement_mask" ), 0 )
	SingleObjectiveBlur:SetBlendMode( BLEND_MODE.blend )
	SingleObjectiveBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 84.5, _1080p * 507.5, _1080p * 136.5, _1080p * 175.5 )
	self:addElement( SingleObjectiveBlur )
	self.SingleObjectiveBlur = SingleObjectiveBlur
	
	local SingleObjectiveBacker = nil
	
	SingleObjectiveBacker = LUI.UIImage.new()
	SingleObjectiveBacker.id = "SingleObjectiveBacker"
	SingleObjectiveBacker:SetAlpha( 0, 0 )
	SingleObjectiveBacker:SetDotPitchEnabled( true )
	SingleObjectiveBacker:SetDotPitchX( 6, 0 )
	SingleObjectiveBacker:SetDotPitchY( 3, 0 )
	SingleObjectiveBacker:SetDotPitchContrast( 0.15, 0 )
	SingleObjectiveBacker:SetDotPitchMode( 0 )
	SingleObjectiveBacker:setImage( RegisterMaterial( "codcaster_announcement_mask" ), 0 )
	SingleObjectiveBacker:SetBlendMode( BLEND_MODE.blend )
	SingleObjectiveBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 84.5, _1080p * 507.5, _1080p * 137.5, _1080p * 176.5 )
	self:addElement( SingleObjectiveBacker )
	self.SingleObjectiveBacker = SingleObjectiveBacker
	
	local team01ObjectiveBlur = nil
	
	team01ObjectiveBlur = LUI.UIBlur.new()
	team01ObjectiveBlur.id = "team01ObjectiveBlur"
	team01ObjectiveBlur:SetAlpha( 0, 0 )
	team01ObjectiveBlur:setImage( RegisterMaterial( "codcaster_announcement_mask" ), 0 )
	team01ObjectiveBlur:SetBlendMode( BLEND_MODE.blend )
	team01ObjectiveBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -86.75, _1080p * 222, _1080p * 138, _1080p * 174 )
	self:addElement( team01ObjectiveBlur )
	self.team01ObjectiveBlur = team01ObjectiveBlur
	
	local team01ObjectiveBacker = nil
	
	team01ObjectiveBacker = LUI.UIImage.new()
	team01ObjectiveBacker.id = "team01ObjectiveBacker"
	team01ObjectiveBacker:SetAlpha( 0, 0 )
	team01ObjectiveBacker:SetDotPitchEnabled( true )
	team01ObjectiveBacker:SetDotPitchX( 6, 0 )
	team01ObjectiveBacker:SetDotPitchY( 3, 0 )
	team01ObjectiveBacker:SetDotPitchContrast( 0.15, 0 )
	team01ObjectiveBacker:SetDotPitchMode( 0 )
	team01ObjectiveBacker:setImage( RegisterMaterial( "codcaster_announcement_bg" ), 0 )
	team01ObjectiveBacker:SetBlendMode( BLEND_MODE.blend )
	team01ObjectiveBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -86.75, _1080p * 222, _1080p * 138, _1080p * 174 )
	self:addElement( team01ObjectiveBacker )
	self.team01ObjectiveBacker = team01ObjectiveBacker
	
	local team02ObjectiveBlur = nil
	
	team02ObjectiveBlur = LUI.UIBlur.new()
	team02ObjectiveBlur.id = "team02ObjectiveBlur"
	team02ObjectiveBlur:SetAlpha( 0, 0 )
	team02ObjectiveBlur:SetYRotation( 180, 0 )
	team02ObjectiveBlur:setImage( RegisterMaterial( "codcaster_announcement_mask" ), 0 )
	team02ObjectiveBlur:SetBlendMode( BLEND_MODE.blend )
	team02ObjectiveBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 372, _1080p * 680.75, _1080p * 138, _1080p * 174 )
	self:addElement( team02ObjectiveBlur )
	self.team02ObjectiveBlur = team02ObjectiveBlur
	
	local team02ObjectiveBacker = nil
	
	team02ObjectiveBacker = LUI.UIImage.new()
	team02ObjectiveBacker.id = "team02ObjectiveBacker"
	team02ObjectiveBacker:SetAlpha( 0, 0 )
	team02ObjectiveBacker:SetYRotation( 180, 0 )
	team02ObjectiveBacker:SetDotPitchEnabled( true )
	team02ObjectiveBacker:SetDotPitchX( 6, 0 )
	team02ObjectiveBacker:SetDotPitchY( 3, 0 )
	team02ObjectiveBacker:SetDotPitchContrast( 0.15, 0 )
	team02ObjectiveBacker:SetDotPitchMode( 0 )
	team02ObjectiveBacker:setImage( RegisterMaterial( "codcaster_announcement_bg" ), 0 )
	team02ObjectiveBacker:SetBlendMode( BLEND_MODE.blend )
	team02ObjectiveBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 372, _1080p * 680.75, _1080p * 138, _1080p * 174 )
	self:addElement( team02ObjectiveBacker )
	self.team02ObjectiveBacker = team02ObjectiveBacker
	
	local codcasterScoreLogoWidgetDarkOps = nil
	
	codcasterScoreLogoWidgetDarkOps = MenuBuilder.BuildRegisteredType( "codcaster_ScoreLogoWidget", {
		controllerIndex = f18_local1
	} )
	codcasterScoreLogoWidgetDarkOps.id = "codcasterScoreLogoWidgetDarkOps"
	codcasterScoreLogoWidgetDarkOps.TeamScore:setText( Engine.Localize( "MENU_NEW" ), 0 )
	codcasterScoreLogoWidgetDarkOps:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 296.5, _1080p * 703.5, _1080p * -25.5, _1080p * 139.5 )
	self:addElement( codcasterScoreLogoWidgetDarkOps )
	self.codcasterScoreLogoWidgetDarkOps = codcasterScoreLogoWidgetDarkOps
	
	local codcasterScoreLogoWidgetBlackOps = nil
	
	codcasterScoreLogoWidgetBlackOps = MenuBuilder.BuildRegisteredType( "codcaster_ScoreLogoWidget", {
		controllerIndex = f18_local1
	} )
	codcasterScoreLogoWidgetBlackOps.id = "codcasterScoreLogoWidgetBlackOps"
	codcasterScoreLogoWidgetBlackOps:SetYRotation( 180, 0 )
	codcasterScoreLogoWidgetBlackOps.logo:SetYRotation( 180, 0 )
	codcasterScoreLogoWidgetBlackOps.logo:setImage( RegisterMaterial( "icon_faction_unsa_color" ), 0 )
	codcasterScoreLogoWidgetBlackOps.SelectionTeam:SetYRotation( 180, 0 )
	codcasterScoreLogoWidgetBlackOps.SelectionTeam:SetUMin( 0.99, 0 )
	codcasterScoreLogoWidgetBlackOps.SelectionTeam:SetUMax( 0.01, 0 )
	codcasterScoreLogoWidgetBlackOps.Highlight:SetYRotation( 180, 0 )
	codcasterScoreLogoWidgetBlackOps.TeamScore:SetYRotation( 180, 0 )
	codcasterScoreLogoWidgetBlackOps.TeamScore:setText( Engine.Localize( "MENU_NEW" ), 0 )
	codcasterScoreLogoWidgetBlackOps:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -110, _1080p * 296.5, _1080p * -25.5, _1080p * 139.5 )
	self:addElement( codcasterScoreLogoWidgetBlackOps )
	self.codcasterScoreLogoWidgetBlackOps = codcasterScoreLogoWidgetBlackOps
	
	local GameModeBackground = nil
	
	GameModeBackground = LUI.UIImage.new()
	GameModeBackground.id = "GameModeBackground"
	GameModeBackground:setImage( RegisterMaterial( "codcaster_scoreboard_header" ), 0 )
	GameModeBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -110, _1080p * 703.5, _1080p * -25.5, _1080p * 70.5 )
	self:addElement( GameModeBackground )
	self.GameModeBackground = GameModeBackground
	
	local HardpointTimerBackerTop = nil
	
	HardpointTimerBackerTop = LUI.UIImage.new()
	HardpointTimerBackerTop.id = "HardpointTimerBackerTop"
	HardpointTimerBackerTop:SetAlpha( 0, 0 )
	HardpointTimerBackerTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 220, _1080p * 372, _1080p * 95, _1080p * 97 )
	HardpointTimerBackerTop:BindColorToModel( DataSources.inGame.MP.hardpointStatusColor:GetModel( f18_local1 ) )
	self:addElement( HardpointTimerBackerTop )
	self.HardpointTimerBackerTop = HardpointTimerBackerTop
	
	local CodCasterTimer = nil
	
	CodCasterTimer = MenuBuilder.BuildRegisteredType( "CodCasterTimer", {
		controllerIndex = f18_local1
	} )
	CodCasterTimer.id = "CodCasterTimer"
	CodCasterTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 221, _1080p * 372, _1080p * 56.1, _1080p * 92.1 )
	self:addElement( CodCasterTimer )
	self.CodCasterTimer = CodCasterTimer
	
	local GameMode = nil
	
	GameMode = LUI.UIText.new()
	GameMode.id = "GameMode"
	GameMode:SetRGBFromInt( 4079166, 0 )
	GameMode:SetFontSize( 30 * _1080p )
	GameMode:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	GameMode:SetAlignment( LUI.Alignment.Center )
	GameMode:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 545.5, _1080p * 4.5, _1080p * 34.5 )
	GameMode:SubscribeToModel( DataSources.inGame.MP.match.gameMode:GetModel( f18_local1 ), function ()
		local f19_local0 = DataSources.inGame.MP.match.gameMode:GetValue( f18_local1 )
		if f19_local0 ~= nil then
			GameMode:setText( f19_local0, 0 )
		end
	end )
	self:addElement( GameMode )
	self.GameMode = GameMode
	
	local teamNameDarkOps = nil
	
	teamNameDarkOps = LUI.UIText.new()
	teamNameDarkOps.id = "teamNameDarkOps"
	teamNameDarkOps:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	teamNameDarkOps:setText( Engine.Localize( "CODCASTER_TEAM2" ), 0 )
	teamNameDarkOps:SetFontSize( 24 * _1080p )
	teamNameDarkOps:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	teamNameDarkOps:SetAlignment( LUI.Alignment.Right )
	teamNameDarkOps:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 471.5, _1080p * 693, _1080p * 10, _1080p * 34 )
	self:addElement( teamNameDarkOps )
	self.teamNameDarkOps = teamNameDarkOps
	
	local teamNameBlackOps = nil
	
	teamNameBlackOps = LUI.UIText.new()
	teamNameBlackOps.id = "teamNameBlackOps"
	teamNameBlackOps:setText( Engine.Localize( "CODCASTER_TEAM1" ), 0 )
	teamNameBlackOps:SetFontSize( 24 * _1080p )
	teamNameBlackOps:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	teamNameBlackOps:SetAlignment( LUI.Alignment.Left )
	teamNameBlackOps:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -97, _1080p * 121.5, _1080p * 10, _1080p * 34 )
	self:addElement( teamNameBlackOps )
	self.teamNameBlackOps = teamNameBlackOps
	
	local Round = nil
	
	Round = LUI.UIText.new()
	Round.id = "Round"
	Round:SetRGBFromInt( 1776411, 0 )
	Round:setText( Engine.Localize( "MPUI_ROUND" ), 0 )
	Round:SetFontSize( 16 * _1080p )
	Round:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Round:SetAlignment( LUI.Alignment.Center )
	Round:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 236.5, _1080p * 356.5, _1080p * 35, _1080p * 51 )
	self:addElement( Round )
	self.Round = Round
	
	local team01AliveText = nil
	
	team01AliveText = LUI.UIText.new()
	team01AliveText.id = "team01AliveText"
	team01AliveText:SetAlpha( 0, 0 )
	team01AliveText:setText( Engine.Localize( "LUA_MENU_MP_ALIVE" ), 0 )
	team01AliveText:SetFontSize( 22 * _1080p )
	team01AliveText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	team01AliveText:SetAlignment( LUI.Alignment.Left )
	team01AliveText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -33, _1080p * 177, _1080p * 145, _1080p * 167 )
	self:addElement( team01AliveText )
	self.team01AliveText = team01AliveText
	
	local team02AliveText = nil
	
	team02AliveText = LUI.UIText.new()
	team02AliveText.id = "team02AliveText"
	team02AliveText:SetAlpha( 0, 0 )
	team02AliveText:setText( Engine.Localize( "LUA_MENU_MP_ALIVE" ), 0 )
	team02AliveText:SetFontSize( 22 * _1080p )
	team02AliveText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	team02AliveText:SetAlignment( LUI.Alignment.Right )
	team02AliveText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 410, _1080p * 628, _1080p * 145, _1080p * 167 )
	self:addElement( team02AliveText )
	self.team02AliveText = team02AliveText
	
	local CodCasterBombPlanterTimer = nil
	
	CodCasterBombPlanterTimer = MenuBuilder.BuildRegisteredType( "CodCasterBombPlanterTimer", {
		controllerIndex = f18_local1
	} )
	CodCasterBombPlanterTimer.id = "CodCasterBombPlanterTimer"
	CodCasterBombPlanterTimer:SetAlpha( 0, 0 )
	CodCasterBombPlanterTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 259.5, _1080p * 334.5, _1080p * 98, _1080p * 135 )
	self:addElement( CodCasterBombPlanterTimer )
	self.CodCasterBombPlanterTimer = CodCasterBombPlanterTimer
	
	local team01FlagLocation = nil
	
	team01FlagLocation = LUI.UIText.new()
	team01FlagLocation.id = "team01FlagLocation"
	team01FlagLocation:SetAlpha( 0, 0 )
	team01FlagLocation:SetFontSize( 22 * _1080p )
	team01FlagLocation:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	team01FlagLocation:SetAlignment( LUI.Alignment.Left )
	team01FlagLocation:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -10, _1080p * 181, _1080p * 145, _1080p * 167 )
	team01FlagLocation:SubscribeToModel( DataSources.inGame.HUD.ctfAlliesFlagStatus:GetModel( f18_local1 ), function ()
		local f20_local0 = DataSources.inGame.HUD.ctfAlliesFlagStatus:GetValue( f18_local1 )
		if f20_local0 ~= nil then
			team01FlagLocation:setText( f20_local0, 0 )
		end
	end )
	self:addElement( team01FlagLocation )
	self.team01FlagLocation = team01FlagLocation
	
	local team01FlagIcon = nil
	
	team01FlagIcon = LUI.UIImage.new()
	team01FlagIcon.id = "team01FlagIcon"
	team01FlagIcon:SetAlpha( 0, 0 )
	team01FlagIcon:setImage( RegisterMaterial( "hud_icon_ctf_flag" ), 0 )
	team01FlagIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -43, _1080p * -17, _1080p * 143, _1080p * 169 )
	self:addElement( team01FlagIcon )
	self.team01FlagIcon = team01FlagIcon
	
	local team02FlagIcon = nil
	
	team02FlagIcon = LUI.UIImage.new()
	team02FlagIcon.id = "team02FlagIcon"
	team02FlagIcon:SetAlpha( 0, 0 )
	team02FlagIcon:setImage( RegisterMaterial( "hud_icon_ctf_flag" ), 0 )
	team02FlagIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 615, _1080p * 641, _1080p * 143, _1080p * 169 )
	self:addElement( team02FlagIcon )
	self.team02FlagIcon = team02FlagIcon
	
	local team02FlagLocation = nil
	
	team02FlagLocation = LUI.UIText.new()
	team02FlagLocation.id = "team02FlagLocation"
	team02FlagLocation:SetAlpha( 0, 0 )
	team02FlagLocation:SetFontSize( 22 * _1080p )
	team02FlagLocation:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	team02FlagLocation:SetAlignment( LUI.Alignment.Right )
	team02FlagLocation:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 418.5, _1080p * 609.5, _1080p * 145, _1080p * 167 )
	team02FlagLocation:SubscribeToModel( DataSources.inGame.HUD.ctfAxisFlagStatus:GetModel( f18_local1 ), function ()
		local f21_local0 = DataSources.inGame.HUD.ctfAxisFlagStatus:GetValue( f18_local1 )
		if f21_local0 ~= nil then
			team02FlagLocation:setText( f21_local0, 0 )
		end
	end )
	self:addElement( team02FlagLocation )
	self.team02FlagLocation = team02FlagLocation
	
	local HardpointIcon = nil
	
	HardpointIcon = LUI.UIImage.new()
	HardpointIcon.id = "HardpointIcon"
	HardpointIcon:SetAlpha( 0, 0 )
	HardpointIcon:setImage( RegisterMaterial( "hud_icon_hardpoint_diamond" ), 0 )
	HardpointIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 227.56, _1080p * 259.56, _1080p * 100.5, _1080p * 132.5 )
	HardpointIcon:BindColorToModel( DataSources.inGame.MP.hardpointStatusColor:GetModel( f18_local1 ) )
	self:addElement( HardpointIcon )
	self.HardpointIcon = HardpointIcon
	
	local HardpointTimer = nil
	
	HardpointTimer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f18_local1
	} )
	HardpointTimer.id = "HardpointTimer"
	HardpointTimer:SetAlpha( 0, 0 )
	HardpointTimer:SetFontSize( 22 * _1080p )
	HardpointTimer:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HardpointTimer:SetAlignment( LUI.Alignment.Center )
	HardpointTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 222, _1080p * 372, _1080p * 104.55, _1080p * 126.55 )
	HardpointTimer:SubscribeToModel( DataSources.inGame.MP.hardpointTimer:GetModel( f18_local1 ), function ()
		local f22_local0 = DataSources.inGame.MP.hardpointTimer:GetValue( f18_local1 )
		if f22_local0 ~= nil then
			HardpointTimer:setEndTime( f22_local0 )
		end
	end )
	self:addElement( HardpointTimer )
	self.HardpointTimer = HardpointTimer
	
	local HardpointStatus = nil
	
	HardpointStatus = LUI.UIText.new()
	HardpointStatus.id = "HardpointStatus"
	HardpointStatus:SetAlpha( 0, 0 )
	HardpointStatus:SetFontSize( 22 * _1080p )
	HardpointStatus:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HardpointStatus:setTextStyle( CoD.TextStyle.Shadowed )
	HardpointStatus:SetAlignment( LUI.Alignment.Center )
	HardpointStatus:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 137.74, _1080p * 456.26, _1080p * 147, _1080p * 169 )
	HardpointStatus:SubscribeToModel( DataSources.inGame.MP.hardpointCalloutAreaString:GetModel( f18_local1 ), function ()
		local f23_local0 = DataSources.inGame.MP.hardpointCalloutAreaString:GetValue( f18_local1 )
		if f23_local0 ~= nil then
			HardpointStatus:setText( ToUpperCase( f23_local0 ), 0 )
		end
	end )
	self:addElement( HardpointStatus )
	self.HardpointStatus = HardpointStatus
	
	local UplinkStatus = nil
	
	UplinkStatus = LUI.UIText.new()
	UplinkStatus.id = "UplinkStatus"
	UplinkStatus:SetAlpha( 0, 0 )
	UplinkStatus:SetFontSize( 22 * _1080p )
	UplinkStatus:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	UplinkStatus:setTextStyle( CoD.TextStyle.Shadowed )
	UplinkStatus:SetAlignment( LUI.Alignment.Center )
	UplinkStatus:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 137.74, _1080p * 456.26, _1080p * 146, _1080p * 168 )
	UplinkStatus:SubscribeToModel( DataSources.inGame.HUD.uplinkBallStatus:GetModel( f18_local1 ), function ()
		local f24_local0 = DataSources.inGame.HUD.uplinkBallStatus:GetValue( f18_local1 )
		if f24_local0 ~= nil then
			UplinkStatus:setText( ToUpperCase( f24_local0 ), 0 )
		end
	end )
	self:addElement( UplinkStatus )
	self.UplinkStatus = UplinkStatus
	
	local UplinkIcon = nil
	
	UplinkIcon = LUI.UIImage.new()
	UplinkIcon.id = "UplinkIcon"
	UplinkIcon:SetAlpha( 0, 0 )
	UplinkIcon:setImage( RegisterMaterial( "icon_obit_uplink_ball" ), 0 )
	UplinkIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 277.5, _1080p * 313.5, _1080p * 97, _1080p * 133 )
	UplinkIcon:BindColorToModel( DataSources.inGame.HUD.uplinkBallStatusColor:GetModel( f18_local1 ) )
	self:addElement( UplinkIcon )
	self.UplinkIcon = UplinkIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		team01ObjectiveBlur:RegisterAnimationSequence( "ShowSnD", {
			{
				function ()
					return self.team01ObjectiveBlur:SetAlpha( 0, 0 )
				end,
				function ()
					return self.team01ObjectiveBlur:SetAlpha( 1, 200 )
				end
			}
		} )
		team01ObjectiveBacker:RegisterAnimationSequence( "ShowSnD", {
			{
				function ()
					return self.team01ObjectiveBacker:SetAlpha( 0, 0 )
				end,
				function ()
					return self.team01ObjectiveBacker:SetAlpha( 0.8, 200 )
				end
			},
			{
				function ()
					return self.team01ObjectiveBacker:SetBlendMode( BLEND_MODE.disabled )
				end
			}
		} )
		team02ObjectiveBlur:RegisterAnimationSequence( "ShowSnD", {
			{
				function ()
					return self.team02ObjectiveBlur:SetAlpha( 0, 0 )
				end,
				function ()
					return self.team02ObjectiveBlur:SetAlpha( 1, 200 )
				end
			}
		} )
		team02ObjectiveBacker:RegisterAnimationSequence( "ShowSnD", {
			{
				function ()
					return self.team02ObjectiveBacker:SetAlpha( 0, 0 )
				end,
				function ()
					return self.team02ObjectiveBacker:SetAlpha( 0.8, 200 )
				end
			}
		} )
		team01AliveText:RegisterAnimationSequence( "ShowSnD", {
			{
				function ()
					return self.team01AliveText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.team01AliveText:SetAlpha( 1, 200 )
				end
			}
		} )
		team02AliveText:RegisterAnimationSequence( "ShowSnD", {
			{
				function ()
					return self.team02AliveText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.team02AliveText:SetAlpha( 1, 200 )
				end
			}
		} )
		CodCasterBombPlanterTimer:RegisterAnimationSequence( "ShowSnD", {
			{
				function ()
					return self.CodCasterBombPlanterTimer:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowSnD = function ()
			team01ObjectiveBlur:AnimateSequence( "ShowSnD" )
			team01ObjectiveBacker:AnimateSequence( "ShowSnD" )
			team02ObjectiveBlur:AnimateSequence( "ShowSnD" )
			team02ObjectiveBacker:AnimateSequence( "ShowSnD" )
			team01AliveText:AnimateSequence( "ShowSnD" )
			team02AliveText:AnimateSequence( "ShowSnD" )
			CodCasterBombPlanterTimer:AnimateSequence( "ShowSnD" )
		end
		
		team01ObjectiveBlur:RegisterAnimationSequence( "HideSnD", {
			{
				function ()
					return self.team01ObjectiveBlur:SetAlpha( 0, 0 )
				end
			}
		} )
		team01ObjectiveBacker:RegisterAnimationSequence( "HideSnD", {
			{
				function ()
					return self.team01ObjectiveBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		team02ObjectiveBlur:RegisterAnimationSequence( "HideSnD", {
			{
				function ()
					return self.team02ObjectiveBlur:SetAlpha( 0, 0 )
				end
			}
		} )
		team02ObjectiveBacker:RegisterAnimationSequence( "HideSnD", {
			{
				function ()
					return self.team02ObjectiveBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		team01AliveText:RegisterAnimationSequence( "HideSnD", {
			{
				function ()
					return self.team01AliveText:SetAlpha( 0, 0 )
				end
			}
		} )
		team02AliveText:RegisterAnimationSequence( "HideSnD", {
			{
				function ()
					return self.team02AliveText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideSnD = function ()
			team01ObjectiveBlur:AnimateSequence( "HideSnD" )
			team01ObjectiveBacker:AnimateSequence( "HideSnD" )
			team02ObjectiveBlur:AnimateSequence( "HideSnD" )
			team02ObjectiveBacker:AnimateSequence( "HideSnD" )
			team01AliveText:AnimateSequence( "HideSnD" )
			team02AliveText:AnimateSequence( "HideSnD" )
		end
		
		team01ObjectiveBlur:RegisterAnimationSequence( "ShowCTF", {
			{
				function ()
					return self.team01ObjectiveBlur:SetAlpha( 1, 0 )
				end,
				function ()
					return self.team01ObjectiveBlur:SetAlpha( 1, 200 )
				end
			}
		} )
		team01ObjectiveBacker:RegisterAnimationSequence( "ShowCTF", {
			{
				function ()
					return self.team01ObjectiveBacker:SetAlpha( 0, 0 )
				end,
				function ()
					return self.team01ObjectiveBacker:SetAlpha( 0.8, 200 )
				end
			}
		} )
		team02ObjectiveBlur:RegisterAnimationSequence( "ShowCTF", {
			{
				function ()
					return self.team02ObjectiveBlur:SetAlpha( 1, 0 )
				end,
				function ()
					return self.team02ObjectiveBlur:SetAlpha( 1, 200 )
				end
			}
		} )
		team02ObjectiveBacker:RegisterAnimationSequence( "ShowCTF", {
			{
				function ()
					return self.team02ObjectiveBacker:SetAlpha( 0, 0 )
				end,
				function ()
					return self.team02ObjectiveBacker:SetAlpha( 0.8, 200 )
				end
			}
		} )
		team01FlagLocation:RegisterAnimationSequence( "ShowCTF", {
			{
				function ()
					return self.team01FlagLocation:SetAlpha( 0, 0 )
				end,
				function ()
					return self.team01FlagLocation:SetAlpha( 1, 200 )
				end
			}
		} )
		team01FlagIcon:RegisterAnimationSequence( "ShowCTF", {
			{
				function ()
					return self.team01FlagIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.team01FlagIcon:SetAlpha( 1, 200 )
				end
			}
		} )
		team02FlagIcon:RegisterAnimationSequence( "ShowCTF", {
			{
				function ()
					return self.team02FlagIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.team02FlagIcon:SetAlpha( 1, 200 )
				end
			}
		} )
		team02FlagLocation:RegisterAnimationSequence( "ShowCTF", {
			{
				function ()
					return self.team02FlagLocation:SetAlpha( 0, 0 )
				end,
				function ()
					return self.team02FlagLocation:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.ShowCTF = function ()
			team01ObjectiveBlur:AnimateSequence( "ShowCTF" )
			team01ObjectiveBacker:AnimateSequence( "ShowCTF" )
			team02ObjectiveBlur:AnimateSequence( "ShowCTF" )
			team02ObjectiveBacker:AnimateSequence( "ShowCTF" )
			team01FlagLocation:AnimateSequence( "ShowCTF" )
			team01FlagIcon:AnimateSequence( "ShowCTF" )
			team02FlagIcon:AnimateSequence( "ShowCTF" )
			team02FlagLocation:AnimateSequence( "ShowCTF" )
		end
		
		team01ObjectiveBlur:RegisterAnimationSequence( "HideCTF", {
			{
				function ()
					return self.team01ObjectiveBlur:SetAlpha( 0, 0 )
				end
			}
		} )
		team01ObjectiveBacker:RegisterAnimationSequence( "HideCTF", {
			{
				function ()
					return self.team01ObjectiveBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		team02ObjectiveBlur:RegisterAnimationSequence( "HideCTF", {
			{
				function ()
					return self.team02ObjectiveBlur:SetAlpha( 0, 0 )
				end
			}
		} )
		team02ObjectiveBacker:RegisterAnimationSequence( "HideCTF", {
			{
				function ()
					return self.team02ObjectiveBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		team01FlagLocation:RegisterAnimationSequence( "HideCTF", {
			{
				function ()
					return self.team01FlagLocation:SetAlpha( 0, 0 )
				end
			}
		} )
		team01FlagIcon:RegisterAnimationSequence( "HideCTF", {
			{
				function ()
					return self.team01FlagIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		team02FlagIcon:RegisterAnimationSequence( "HideCTF", {
			{
				function ()
					return self.team02FlagIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		team02FlagLocation:RegisterAnimationSequence( "HideCTF", {
			{
				function ()
					return self.team02FlagLocation:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideCTF = function ()
			team01ObjectiveBlur:AnimateSequence( "HideCTF" )
			team01ObjectiveBacker:AnimateSequence( "HideCTF" )
			team02ObjectiveBlur:AnimateSequence( "HideCTF" )
			team02ObjectiveBacker:AnimateSequence( "HideCTF" )
			team01FlagLocation:AnimateSequence( "HideCTF" )
			team01FlagIcon:AnimateSequence( "HideCTF" )
			team02FlagIcon:AnimateSequence( "HideCTF" )
			team02FlagLocation:AnimateSequence( "HideCTF" )
		end
		
		SingleObjectiveBlur:RegisterAnimationSequence( "ShowHardpoint", {
			{
				function ()
					return self.SingleObjectiveBlur:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SingleObjectiveBlur:SetAlpha( 1, 200 )
				end
			}
		} )
		SingleObjectiveBacker:RegisterAnimationSequence( "ShowHardpoint", {
			{
				function ()
					return self.SingleObjectiveBacker:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SingleObjectiveBacker:SetAlpha( 0.5, 200 )
				end
			}
		} )
		HardpointIcon:RegisterAnimationSequence( "ShowHardpoint", {
			{
				function ()
					return self.HardpointIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		HardpointTimer:RegisterAnimationSequence( "ShowHardpoint", {
			{
				function ()
					return self.HardpointTimer:SetAlpha( 1, 0 )
				end
			}
		} )
		HardpointStatus:RegisterAnimationSequence( "ShowHardpoint", {
			{
				function ()
					return self.HardpointStatus:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HardpointStatus:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.ShowHardpoint = function ()
			SingleObjectiveBlur:AnimateSequence( "ShowHardpoint" )
			SingleObjectiveBacker:AnimateSequence( "ShowHardpoint" )
			HardpointIcon:AnimateSequence( "ShowHardpoint" )
			HardpointTimer:AnimateSequence( "ShowHardpoint" )
			HardpointStatus:AnimateSequence( "ShowHardpoint" )
		end
		
		SingleObjectiveBlur:RegisterAnimationSequence( "HideHardpoint", {
			{
				function ()
					return self.SingleObjectiveBlur:SetAlpha( 0, 0 )
				end
			}
		} )
		SingleObjectiveBacker:RegisterAnimationSequence( "HideHardpoint", {
			{
				function ()
					return self.SingleObjectiveBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		HardpointStatus:RegisterAnimationSequence( "HideHardpoint", {
			{
				function ()
					return self.HardpointStatus:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideHardpoint = function ()
			SingleObjectiveBlur:AnimateSequence( "HideHardpoint" )
			SingleObjectiveBacker:AnimateSequence( "HideHardpoint" )
			HardpointStatus:AnimateSequence( "HideHardpoint" )
		end
		
		SingleObjectiveBlur:RegisterAnimationSequence( "ShowUplink", {
			{
				function ()
					return self.SingleObjectiveBlur:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SingleObjectiveBlur:SetAlpha( 1, 200 )
				end
			}
		} )
		SingleObjectiveBacker:RegisterAnimationSequence( "ShowUplink", {
			{
				function ()
					return self.SingleObjectiveBacker:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SingleObjectiveBacker:SetAlpha( 0.5, 200 )
				end
			}
		} )
		UplinkStatus:RegisterAnimationSequence( "ShowUplink", {
			{
				function ()
					return self.UplinkStatus:SetAlpha( 0, 0 )
				end,
				function ()
					return self.UplinkStatus:SetAlpha( 1, 200 )
				end
			}
		} )
		UplinkIcon:RegisterAnimationSequence( "ShowUplink", {
			{
				function ()
					return self.UplinkIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowUplink = function ()
			SingleObjectiveBlur:AnimateSequence( "ShowUplink" )
			SingleObjectiveBacker:AnimateSequence( "ShowUplink" )
			UplinkStatus:AnimateSequence( "ShowUplink" )
			UplinkIcon:AnimateSequence( "ShowUplink" )
		end
		
		SingleObjectiveBlur:RegisterAnimationSequence( "HideUplink", {
			{
				function ()
					return self.SingleObjectiveBlur:SetAlpha( 0, 0 )
				end
			}
		} )
		SingleObjectiveBacker:RegisterAnimationSequence( "HideUplink", {
			{
				function ()
					return self.SingleObjectiveBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		UplinkStatus:RegisterAnimationSequence( "HideUplink", {
			{
				function ()
					return self.UplinkStatus:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideUplink = function ()
			SingleObjectiveBlur:AnimateSequence( "HideUplink" )
			SingleObjectiveBacker:AnimateSequence( "HideUplink" )
			UplinkStatus:AnimateSequence( "HideUplink" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local11( self, f18_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterHeaderTeamBased", CodCasterHeaderTeamBased )
LockTable( _M )
