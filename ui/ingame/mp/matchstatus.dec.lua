local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FlashLowTimeRemaining( f1_arg0, f1_arg1 )
	if f1_arg1.name == "time30sec" then
		ACTIONS.AnimateSequence( f1_arg0:getParent(), "FlashLowTimeRemainingSlow" )
	elseif f1_arg1.name == "time10sec" then
		ACTIONS.AnimateSequence( f1_arg0:getParent(), "FlashLowTimeRemainingFast" )
	else
		ACTIONS.AnimateSequence( f1_arg0:getParent(), "DefaultSequence" )
	end
end

function SetLogoVisibility( f2_arg0, f2_arg1 )
	f2_arg0.FactionIcon:SetAlpha( f2_arg1 * 0.5 )
end

function UpdateCodcasterMatchStatus( f3_arg0 )
	if CODCASTER.IsCODCaster() then
		f3_arg0.FactionIcon:UnsubscribeFromAllModels()
		local f3_local0 = Game.GetPlayerTeam( Game.GetPlayerstateClientnum() )
		local f3_local1 = DataSources.inGame.MP.match.teamScoreFriendly:GetValue( f3_arg0:getRootController() )
		local f3_local2 = DataSources.inGame.MP.match.teamScoreEnemy:GetValue( f3_arg0:getRootController() )
		local f3_local3 = f3_local1
		local f3_local4 = f3_local2
		if f3_local0 == Teams.axis or f3_local0 == Teams.allies then
			f3_arg0.FactionIcon:setImage( RegisterMaterial( CODCASTER.GetTeamLogoMaterial( f3_arg0:getRootController(), Mirror( f3_local0, Teams.axis, Teams.allies ) ) ), 0 )
		end
		if f3_local0 == Teams.axis then
			f3_local3 = f3_local2
			f3_local4 = f3_local1
		end
		if f3_local3 ~= nil and f3_local4 ~= nil then
			f3_arg0.MatchStatusText:UpdateStatusFunc( f3_local3, f3_local4 )
		end
	else
		f3_arg0.FactionIcon:UnsubscribeFromAllModels()
		f3_arg0.FactionIcon:SubscribeToModel( DataSources.inGame.MP.match.teamIcon:GetModel( f3_arg0:getRootController() ), function ()
			local f4_local0 = DataSources.inGame.MP.match.teamIcon:GetValue( f3_arg0:getRootController() )
			if f4_local0 ~= nil then
				f3_arg0.FactionIcon:setImage( RegisterMaterial( f4_local0 ), 0 )
			end
		end )
	end
end

function PostLoadFunc( f5_arg0, f5_arg1, f5_arg2 )
	assert( f5_arg0.MatchTimer )
	assert( f5_arg0.EnemyScore )
	assert( f5_arg0.FriendlyScore )
	f5_arg0.SetLogoVisibility = SetLogoVisibility
	f5_arg0.UpdateCodcasterMatchStatus = UpdateCodcasterMatchStatus
	f5_arg0.EnemyScore:SetShadowUOffset( -0 )
	f5_arg0.EnemyScore:SetShadowVOffset( -0 )
	f5_arg0.EnemyScore:SetWordWrap( false )
	f5_arg0.FriendlyScore:SetShadowUOffset( -0 )
	f5_arg0.FriendlyScore:SetShadowVOffset( -0 )
	f5_arg0.FriendlyScore:SetWordWrap( false )
	f5_arg0.FriendlyScore:SubscribeToModel( DataSources.inGame.MP.match.teamScoreFriendly:GetModel( f5_arg1 ), function ( f6_arg0 )
		local f6_local0 = DataModel.GetModelValue( f6_arg0 )
		if f6_local0 ~= nil then
			f5_arg0.FriendlyScore:setText( f6_local0 )
		end
	end )
	f5_arg0.EnemyScore:SubscribeToModel( DataSources.inGame.MP.match.teamScoreEnemy:GetModel( f5_arg1 ), function ( f7_arg0 )
		local f7_local0 = DataModel.GetModelValue( f7_arg0 )
		if f7_local0 ~= nil then
			f5_arg0.EnemyScore:setText( f7_local0 )
		end
	end )
	if f5_arg0.Round then
		f5_arg0.Round:SetWordWrap( false )
		f5_arg0.Round:SetShadowUOffset( -0 )
		f5_arg0.Round:SetShadowVOffset( -0 )
	end
	f5_arg0.MatchTimer:registerEventHandler( "time30sec", FlashLowTimeRemaining )
	f5_arg0.MatchTimer:registerEventHandler( "time10sec", FlashLowTimeRemaining )
	f5_arg0.MatchTimer:registerEventHandler( "timeReset", FlashLowTimeRemaining )
	f5_arg0:SubscribeToModel( DataSources.inGame.MP.match.matchTimerStopped:GetModel( f5_arg1 ), function ()
		if DataSources.inGame.MP.match.matchTimerStopped:GetValue( f5_arg1 ) then
			f5_arg0.MatchTimer:freeze()
		else
			f5_arg0.MatchTimer:unfreeze()
		end
	end )
	f5_arg0:SubscribeToModel( DataSources.inGame.player.affectedByEMP:GetModel( f5_arg1 ), function ( f9_arg0 )
		if DataModel.GetModelValue( f9_arg0 ) then
			MP.StartEMPGlitch( f5_arg0 )
		else
			MP.StopEMPGlitch( f5_arg0 )
		end
	end )
	local f5_local0 = function ( f10_arg0 )
		assert( f5_arg0.Round )
		local f10_local0 = DataModel.GetModelValue( f10_arg0 )
		local f10_local1 = DataSources.inGame.MP.match.gameType:GetValue( f5_arg1 )
		local f10_local2 = Engine.GetDvarInt( "scr_" .. f10_local1 .. "_roundlimit" )
		local f10_local3 = Game.GetOmnvar( "ui_last_round" )
		if f10_local1 == "sd" or f10_local1 == "sr" or f10_local1 == "siege" or f10_local1 == "dd" then
			if f10_local3 == true then
				f5_arg0.Round:setText( Engine.Localize( "MPUI_FINALROUND" ) )
			else
				f5_arg0.Round:setText( Engine.Localize( "MPUI_ROUND_ONLY", f10_local0 ) )
			end
		elseif f10_local3 == true then
			f5_arg0.Round:setText( Engine.Localize( "MPUI_FINALROUND" ) )
		elseif f10_local2 > 0 and f10_local2 < f10_local0 then
			f5_arg0.Round:setText( Engine.Localize( "MPUI_OVERTIME" ) )
		else
			f5_arg0.Round:setText( Engine.Localize( "MPUI_ROUND", f10_local0, f10_local2 ) )
		end
	end
	
	if f5_arg0.Round then
		f5_arg0:SubscribeToModel( DataSources.inGame.MP.match.currentRound:GetModel( f5_arg1 ), f5_local0 )
	end
	if IsLanguageGerman() then
		f5_arg0.MatchStatusText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 75, _1080p * 280, _1080p * 17, _1080p * 42 )
	end
end

function MatchStatus( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 392 * _1080p, 0, 185 * _1080p )
	self.id = "MatchStatus"
	self._animationSets = {}
	self._sequences = {}
	local f11_local1 = controller and controller.controllerIndex
	if not f11_local1 and not Engine.InFrontend() then
		f11_local1 = self:getRootController()
	end
	assert( f11_local1 )
	local f11_local2 = self
	local BlurBG = nil
	
	BlurBG = LUI.UIBlur.new()
	BlurBG.id = "BlurBG"
	BlurBG:SetRGBFromInt( 11776947, 0 )
	BlurBG:setImage( RegisterMaterial( "hud_match_status_backer" ), 0 )
	BlurBG:SetBlurStrength( 1, 0 )
	BlurBG:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -277, _1080p * -21, _1080p * -64, _1080p * 64 )
	self:addElement( BlurBG )
	self.BlurBG = BlurBG
	
	local FactionIcon = nil
	
	FactionIcon = LUI.UIImage.new()
	FactionIcon.id = "FactionIcon"
	FactionIcon:SetAlpha( 0.5, 0 )
	FactionIcon:SetDepth( 20, 0 )
	FactionIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 128, _1080p * -64, _1080p * 64 )
	FactionIcon:SubscribeToModel( DataSources.inGame.MP.match.teamIcon:GetModel( f11_local1 ), function ()
		local f12_local0 = DataSources.inGame.MP.match.teamIcon:GetValue( f11_local1 )
		if f12_local0 ~= nil then
			FactionIcon:setImage( RegisterMaterial( f12_local0 ), 0 )
		end
	end )
	self:addElement( FactionIcon )
	self.FactionIcon = FactionIcon
	
	local MatchStatusText = nil
	
	MatchStatusText = MenuBuilder.BuildRegisteredType( "MatchStatusText", {
		controllerIndex = f11_local1
	} )
	MatchStatusText.id = "MatchStatusText"
	MatchStatusText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 126, _1080p * 266, _1080p * 17, _1080p * 42 )
	self:addElement( MatchStatusText )
	self.MatchStatusText = MatchStatusText
	
	local MatchTimer = nil
	
	MatchTimer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f11_local1
	} )
	MatchTimer.id = "MatchTimer"
	MatchTimer:SetFontSize( 32 * _1080p )
	MatchTimer:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MatchTimer:SetAlignment( LUI.Alignment.Center )
	MatchTimer:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -230, _1080p * -100, _1080p * -47, _1080p * -15 )
	MatchTimer:SubscribeToModel( DataSources.inGame.MP.match.endTime:GetModel( f11_local1 ), function ()
		local f13_local0 = DataSources.inGame.MP.match.endTime:GetValue( f11_local1 )
		if f13_local0 ~= nil then
			MatchTimer:setEndTime( f13_local0 )
		end
	end )
	self:addElement( MatchTimer )
	self.MatchTimer = MatchTimer
	
	local EnemyScore = nil
	
	EnemyScore = LUI.UIStyledText.new()
	EnemyScore.id = "EnemyScore"
	EnemyScore:setText( "8888", 0 )
	EnemyScore:SetFontSize( 32 * _1080p )
	EnemyScore:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	EnemyScore:SetAlignment( LUI.Alignment.Left )
	EnemyScore:SetOptOutRightToLeftAlignmentFlip( true )
	EnemyScore:SetShadowMinDistance( -0.2, 0 )
	EnemyScore:SetShadowMaxDistance( 0.2, 0 )
	EnemyScore:SetShadowRGBFromInt( 0, 0 )
	EnemyScore:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -104, _1080p * -24, _1080p * 10, _1080p * 42 )
	self:addElement( EnemyScore )
	self.EnemyScore = EnemyScore
	
	local FriendlyScore = nil
	
	FriendlyScore = LUI.UIStyledText.new()
	FriendlyScore.id = "FriendlyScore"
	FriendlyScore:SetRGBFromTable( SWATCHES.HUD.friendlyTeam, 0 )
	FriendlyScore:setText( "8888", 0 )
	FriendlyScore:SetFontSize( 38 * _1080p )
	FriendlyScore:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FriendlyScore:SetAlignment( LUI.Alignment.Left )
	FriendlyScore:SetOptOutRightToLeftAlignmentFlip( true )
	FriendlyScore:SetShadowMinDistance( -0.2, 0 )
	FriendlyScore:SetShadowMaxDistance( 0.2, 0 )
	FriendlyScore:SetShadowRGBFromInt( 0, 0 )
	FriendlyScore:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -104, _1080p * -24, _1080p * -44, _1080p * -6 )
	self:addElement( FriendlyScore )
	self.FriendlyScore = FriendlyScore
	
	local FriendlyScoreBar = nil
	
	FriendlyScoreBar = MenuBuilder.BuildRegisteredType( "MatchStatusFriendlyScoreBar", {
		controllerIndex = f11_local1
	} )
	FriendlyScoreBar.id = "FriendlyScoreBar"
	FriendlyScoreBar:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 80, _1080p * 280, _1080p * -8, 0 )
	self:addElement( FriendlyScoreBar )
	self.FriendlyScoreBar = FriendlyScoreBar
	
	local EnemyScoreBar = nil
	
	EnemyScoreBar = MenuBuilder.BuildRegisteredType( "MatchStatusEnemyScoreBar", {
		controllerIndex = f11_local1
	} )
	EnemyScoreBar.id = "EnemyScoreBar"
	EnemyScoreBar:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 80, _1080p * 280, _1080p * 5, _1080p * 13 )
	self:addElement( EnemyScoreBar )
	self.EnemyScoreBar = EnemyScoreBar
	
	local f11_local11 = nil
	if DataSources.inGame.MP.match.matchRoundHidden:GetValue( f11_local1 ) ~= nil and DataSources.inGame.MP.match.matchRoundHidden:GetValue( f11_local1 ) == false then
		f11_local11 = LUI.UIStyledText.new()
		f11_local11.id = "Round"
		f11_local11:setText( Engine.Localize( "MPUI_ROUND_ONLY" ), 0 )
		f11_local11:SetFontSize( 22 * _1080p )
		f11_local11:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f11_local11:SetAlignment( LUI.Alignment.Center )
		f11_local11:SetShadowMinDistance( -0.2, 0 )
		f11_local11:SetShadowMaxDistance( 0.2, 0 )
		f11_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 93, _1080p * 317, _1080p * 20.5, _1080p * 42.5 )
		self:addElement( f11_local11 )
		self.Round = f11_local11
	end
	self._animationSets.DefaultAnimationSet = function ()
		MatchTimer:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MatchTimer:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			MatchTimer:AnimateSequence( "DefaultSequence" )
		end
		
		MatchTimer:RegisterAnimationSequence( "ShowMatchTimer", {
			{
				function ()
					return self.MatchTimer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MatchTimer:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.ShowMatchTimer = function ()
			MatchTimer:AnimateSequence( "ShowMatchTimer" )
		end
		
		MatchTimer:RegisterAnimationSequence( "HideMatchTimer", {
			{
				function ()
					return self.MatchTimer:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideMatchTimer = function ()
			MatchTimer:AnimateSequence( "HideMatchTimer" )
		end
		
		MatchTimer:RegisterAnimationSequence( "FlashLowTimeRemainingSlow", {
			{
				function ()
					return self.MatchTimer:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.MatchTimer:SetRGBFromTable( SWATCHES.HUD.warning, 500, LUI.EASING.outCubic )
				end,
				function ()
					return self.MatchTimer:SetRGBFromInt( 0, 500, LUI.EASING.inCubic )
				end
			}
		} )
		self._sequences.FlashLowTimeRemainingSlow = function ()
			MatchTimer:AnimateLoop( "FlashLowTimeRemainingSlow" )
		end
		
		MatchTimer:RegisterAnimationSequence( "FlashLowTimeRemainingFast", {
			{
				function ()
					return self.MatchTimer:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.MatchTimer:SetRGBFromTable( SWATCHES.HUD.warning, 250, LUI.EASING.outCubic )
				end,
				function ()
					return self.MatchTimer:SetRGBFromInt( 0, 250, LUI.EASING.inCubic )
				end
			}
		} )
		self._sequences.FlashLowTimeRemainingFast = function ()
			MatchTimer:AnimateLoop( "FlashLowTimeRemainingFast" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.match.matchTimerHidden:GetModel( f11_local1 ), function ()
		if DataSources.inGame.MP.match.matchTimerHidden:GetValue( f11_local1 ) ~= nil and DataSources.inGame.MP.match.matchTimerHidden:GetValue( f11_local1 ) == true then
			ACTIONS.AnimateSequence( self, "HideMatchTimer" )
		end
		if DataSources.inGame.MP.match.matchTimerHidden:GetValue( f11_local1 ) ~= nil and DataSources.inGame.MP.match.matchTimerHidden:GetValue( f11_local1 ) == false then
			ACTIONS.AnimateSequence( self, "ShowMatchTimer" )
		end
	end )
	PostLoadFunc( self, f11_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "MatchStatus", MatchStatus )
LockTable( _M )
