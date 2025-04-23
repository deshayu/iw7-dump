local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Game.GetCPNumScoreboardPlayers()
	f1_arg0.BroShotZomPlayer0.updateData( BroShotZomPlayer0, 0 )
	if f1_local0 > 1 then
		f1_arg0.BroShotZomPlayer1.updateData( BroShotZomPlayer1, 1 )
	end
	if f1_local0 > 2 then
		f1_arg0.BroShotZomPlayer2.updateData( BroShotZomPlayer2, 2 )
	end
	if f1_local0 > 3 then
		f1_arg0.BroShotZomPlayer3.updateData( BroShotZomPlayer3, 3 )
	end
	local f1_local1 = {
		{
			full = "QuickQuit",
			splitscreen = "QuickQuit"
		},
		{
			full = "OnePlayer",
			splitscreen = "OnePlayerSplit"
		},
		{
			full = "TwoPlayer",
			splitscreen = "TwoPlayerSplit"
		},
		{
			full = "ThreePlayer",
			splitscreen = "ThreePlayerSplit"
		},
		{
			full = "FourPlayer",
			splitscreen = "FourPlayerSplit"
		}
	}
	local f1_local2 = true
	for f1_local3 = 0, f1_local0 - 1, 1 do
		local f1_local6 = Game.GetCPScoreboardRowData( f1_local3 )
		local f1_local7 = ZombiesUtils.GetZombiesBigPhoto( DataSources.inGame.CP.playerCharacter:GetValue( f1_arg1 ), f1_local6.clientNum )
		if not f1_local7 or #f1_local7 == 0 then
			f1_local2 = false
		end
	end
	if f1_local2 then
		if CONDITIONS.IsSplitscreen( f1_arg0 ) then
			ACTIONS.AnimateSequence( f1_arg0, f1_local1[f1_local0 + 1].splitscreen )
		else
			ACTIONS.AnimateSequence( f1_arg0, f1_local1[f1_local0 + 1].full )
		end
	else
		ACTIONS.AnimateSequence( f1_arg0, "QuickQuit" )
	end
	if IsLanguageChinese() or IsLanguageJapanese() or IsLanguageKorean() then
		f1_arg0.Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1800.51, _1080p * 134, _1080p * 184 )
	end
	if not CONDITIONS.IsSplitscreen() then
		f1_arg0:setUseStencil( true )
	end
	local f1_local3 = LUI.DataSourceFromOmnvar.new( "zm_boss_id" )
	f1_arg0:SubscribeToModel( f1_local3:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 == 1 then
			f1_arg0.bossDescText:setText( Engine.Localize( "ZM_SPLASHES_BOSS_SPACELAND_DESC" ) )
		elseif f2_local0 == 2 then
			f1_arg0.bossDescText:setText( Engine.Localize( "ZM_SPLASHES_BOSS_RAVE_DESC" ) )
		elseif f2_local0 == 3 then
			f1_arg0.bossDescText:setText( Engine.Localize( "ZM_SPLASHES_BOSS_DISCO_DESC" ) )
		elseif f2_local0 == 4 then
			f1_arg0.bossDescText:setText( Engine.Localize( "ZM_SPLASHES_BOSS_TOWN_DESC" ) )
		elseif f2_local0 == 5 then
			f1_arg0.bossDescText:setText( Engine.Localize( "ZM_SPLASHES_BOSS_FINAL_DESC" ) )
		elseif f2_local0 == 6 then
			f1_arg0.bossDescText:setText( Engine.Localize( "ZM_SPLASHES_BOSS_DC_DESC" ) )
		end
	end )
end

function BroShotZomScreen( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "BroShotZomScreen"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self:playSound( "menu_open" )
	local f3_local2 = self
	local BlurBackground = nil
	
	BlurBackground = LUI.UIBlur.new()
	BlurBackground.id = "BlurBackground"
	BlurBackground:SetBlurStrength( 1, 0 )
	self:addElement( BlurBackground )
	self.BlurBackground = BlurBackground
	
	local EdgeDarken2 = nil
	
	EdgeDarken2 = LUI.UIImage.new()
	EdgeDarken2.id = "EdgeDarken2"
	EdgeDarken2:setImage( RegisterMaterial( "menu_title_darkener" ), 0 )
	EdgeDarken2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 860.29, 0, _1080p * 443 )
	self:addElement( EdgeDarken2 )
	self.EdgeDarken2 = EdgeDarken2
	
	local EdgeDarken = nil
	
	EdgeDarken = LUI.UIImage.new()
	EdgeDarken.id = "EdgeDarken"
	EdgeDarken:setImage( RegisterMaterial( "menu_title_darkener" ), 0 )
	EdgeDarken:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 860.29, 0, _1080p * 443 )
	self:addElement( EdgeDarken )
	self.EdgeDarken = EdgeDarken
	
	local OuterMaskBottom = nil
	
	OuterMaskBottom = MenuBuilder.BuildRegisteredType( "CPMenuOuterMask", {
		controllerIndex = f3_local1
	} )
	OuterMaskBottom.id = "OuterMaskBottom"
	OuterMaskBottom:SetAlpha( 0.7, 0 )
	OuterMaskBottom:SetZRotation( -168, 0 )
	OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * -302, _1080p * 270 )
	self:addElement( OuterMaskBottom )
	self.OuterMaskBottom = OuterMaskBottom
	
	local OuterMaskTop = nil
	
	OuterMaskTop = MenuBuilder.BuildRegisteredType( "CPMenuOuterMask", {
		controllerIndex = f3_local1
	} )
	OuterMaskTop.id = "OuterMaskTop"
	OuterMaskTop:SetAlpha( 0.7, 0 )
	OuterMaskTop:SetZRotation( -168, 0 )
	OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -265, _1080p * 195 )
	self:addElement( OuterMaskTop )
	self.OuterMaskTop = OuterMaskTop
	
	local Stripe = nil
	
	Stripe = LUI.UIImage.new()
	Stripe.id = "Stripe"
	Stripe:SetRGBFromInt( 5084853, 0 )
	Stripe:SetAlpha( 0.49, 0 )
	Stripe:SetZRotation( -168, 0 )
	Stripe:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -95, _1080p * 551, _1080p * 95, _1080p * 479.4 )
	self:addElement( Stripe )
	self.Stripe = Stripe
	
	local Spinner = nil
	
	Spinner = LUI.UIImage.new()
	Spinner.id = "Spinner"
	Spinner:SetScale( -0.28, 0 )
	Spinner:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1201, _1080p * 2105, _1080p * -116.5, _1080p * 787.5 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local RedGlow = nil
	
	RedGlow = LUI.UIImage.new()
	RedGlow.id = "RedGlow"
	RedGlow:SetAlpha( 0.8, 0 )
	RedGlow:SetScale( -0.28, 0 )
	RedGlow:setImage( RegisterMaterial( "cp_menu_pause_red_glow" ), 0 )
	RedGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1263, _1080p * 2043, _1080p * -45, _1080p * 735 )
	self:addElement( RedGlow )
	self.RedGlow = RedGlow
	
	local flames = nil
	
	flames = LUI.UIImage.new()
	flames.id = "flames"
	flames:setImage( RegisterMaterial( "zm_wc_fire_loop" ), 0 )
	flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1478, _1080p * 1843, _1080p * -116.5, _1080p * 350 )
	self:addElement( flames )
	self.flames = flames
	
	local CPTitleLineRed = nil
	
	CPTitleLineRed = LUI.UIImage.new()
	CPTitleLineRed.id = "CPTitleLineRed"
	CPTitleLineRed:SetRGBFromTable( SWATCHES.Zombies.fateCardLightBar, 0 )
	CPTitleLineRed:setImage( RegisterMaterial( "cp_menu_title_line_glow" ), 0 )
	CPTitleLineRed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -95, _1080p * 2000, _1080p * 157, _1080p * 221 )
	self:addElement( CPTitleLineRed )
	self.CPTitleLineRed = CPTitleLineRed
	
	local CPTitleLine = nil
	
	CPTitleLine = LUI.UIImage.new()
	CPTitleLine.id = "CPTitleLine"
	CPTitleLine:setImage( RegisterMaterial( "cp_menu_title_line_glow" ), 0 )
	CPTitleLine:SetBlendMode( BLEND_MODE.addWithAlpha )
	CPTitleLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -95, _1080p * 2000, _1080p * 157, _1080p * 221 )
	self:addElement( CPTitleLine )
	self.CPTitleLine = CPTitleLine
	
	local Logo = nil
	
	Logo = LUI.UIImage.new()
	Logo.id = "Logo"
	Logo:SetScale( 0.96, 0 )
	Logo:setImage( RegisterMaterial( "zm_spaceland_zombies" ), 0 )
	Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1401.48, _1080p * 1657.48, _1080p * 830.06, _1080p * 958.06 )
	self:addElement( Logo )
	self.Logo = Logo
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	Title:SetFontSize( 64 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetOptOutRightToLeftAlignmentFlip( true )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1800.51, _1080p * 126, _1080p * 190 )
	Title:SubscribeToModel( DataSources.inGame.CP.zombies.waveNumber:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.waveNumber:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Title:setText( LocalizeIntoString( f4_local0, "CP_ZOMBIE_ROUNDS_SURVIVED_CAPS" ), 0 )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local TimeSurvived = nil
	
	TimeSurvived = LUI.UIText.new()
	TimeSurvived.id = "TimeSurvived"
	TimeSurvived:SetFontSize( 50 * _1080p )
	TimeSurvived:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TimeSurvived:SetAlignment( LUI.Alignment.Left )
	TimeSurvived:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 135, _1080p * 554, _1080p * 190, _1080p * 240 )
	TimeSurvived:SubscribeToModel( DataSources.inGame.CP.zombies.timeSurvivedText:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.timeSurvivedText:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			TimeSurvived:setText( f5_local0, 0 )
		end
	end )
	self:addElement( TimeSurvived )
	self.TimeSurvived = TimeSurvived
	
	local BossTimer = nil
	
	BossTimer = MenuBuilder.BuildRegisteredType( "BossTimer", {
		controllerIndex = f3_local1
	} )
	BossTimer.id = "BossTimer"
	BossTimer:SetAlpha( 0, 0 )
	BossTimer:SetScale( 0.5, 0 )
	BossTimer.scoreBox:SetAlpha( 0, 0 )
	BossTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 330, _1080p * 185, _1080p * 235 )
	self:addElement( BossTimer )
	self.BossTimer = BossTimer
	
	local bossDescText = nil
	
	bossDescText = LUI.UIText.new()
	bossDescText.id = "bossDescText"
	bossDescText:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	bossDescText:SetAlpha( 0, 0 )
	bossDescText:setText( Engine.Localize( "ZM_SPLASHES_BOSS_SPACELAND_DESC" ), 0 )
	bossDescText:SetFontSize( 50 * _1080p )
	bossDescText:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	bossDescText:SetAlignment( LUI.Alignment.Left )
	bossDescText:SetOptOutRightToLeftAlignmentFlip( true )
	bossDescText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1261.16, _1080p * 132, _1080p * 182 )
	self:addElement( bossDescText )
	self.bossDescText = bossDescText
	
	local YouFailed = nil
	
	YouFailed = LUI.UIText.new()
	YouFailed.id = "YouFailed"
	YouFailed:SetAlpha( 0, 0 )
	YouFailed:setText( ToUpperCase( Engine.Localize( "ZM_SPLASHES_YOU_FAILED" ) ), 0 )
	YouFailed:SetFontSize( 80 * _1080p )
	YouFailed:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	YouFailed:SetAlignment( LUI.Alignment.Left )
	YouFailed:SetOptOutRightToLeftAlignmentFlip( true )
	YouFailed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 129.84, _1080p * 1261, _1080p * 57, _1080p * 137 )
	self:addElement( YouFailed )
	self.YouFailed = YouFailed
	
	local YouWon = nil
	
	YouWon = LUI.UIText.new()
	YouWon.id = "YouWon"
	YouWon:SetAlpha( 0, 0 )
	YouWon:setText( ToUpperCase( Engine.Localize( "ZM_SPLASHES_YOU_WON" ) ), 0 )
	YouWon:SetFontSize( 80 * _1080p )
	YouWon:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	YouWon:SetAlignment( LUI.Alignment.Left )
	YouWon:SetOptOutRightToLeftAlignmentFlip( true )
	YouWon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 129.84, _1080p * 1261, _1080p * 57, _1080p * 137 )
	self:addElement( YouWon )
	self.YouWon = YouWon
	
	local MatchEnded = nil
	
	MatchEnded = LUI.UIText.new()
	MatchEnded.id = "MatchEnded"
	MatchEnded:setText( Engine.Localize( "CP_ZOMBIE_MATCH_ENDED_CAPS" ), 0 )
	MatchEnded:SetFontSize( 80 * _1080p )
	MatchEnded:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	MatchEnded:SetAlignment( LUI.Alignment.Left )
	MatchEnded:SetOptOutRightToLeftAlignmentFlip( true )
	MatchEnded:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 129.84, _1080p * 1261, _1080p * 57, _1080p * 137 )
	self:addElement( MatchEnded )
	self.MatchEnded = MatchEnded
	
	local BroShotZomPlayer0 = nil
	
	BroShotZomPlayer0 = MenuBuilder.BuildRegisteredType( "BroShotZomPlayer", {
		controllerIndex = f3_local1
	} )
	BroShotZomPlayer0.id = "BroShotZomPlayer0"
	BroShotZomPlayer0:SetZRotation( -4, 0 )
	BroShotZomPlayer0.Score:SetLeft( _1080p * 0, 0 )
	BroShotZomPlayer0.Score:SetRight( _1080p * 0, 0 )
	BroShotZomPlayer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1427.5, _1080p * 1893.5, _1080p * 54, _1080p * 617 )
	self:addElement( BroShotZomPlayer0 )
	self.BroShotZomPlayer0 = BroShotZomPlayer0
	
	local BroShotZomPlayer1 = nil
	
	BroShotZomPlayer1 = MenuBuilder.BuildRegisteredType( "BroShotZomPlayer", {
		controllerIndex = f3_local1
	} )
	BroShotZomPlayer1.id = "BroShotZomPlayer1"
	BroShotZomPlayer1:SetZRotation( 8, 0 )
	BroShotZomPlayer1.Score:SetLeft( _1080p * 0, 0 )
	BroShotZomPlayer1.Score:SetRight( _1080p * 0, 0 )
	BroShotZomPlayer1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 935.48, _1080p * 1401.48, _1080p * 170, _1080p * 733 )
	self:addElement( BroShotZomPlayer1 )
	self.BroShotZomPlayer1 = BroShotZomPlayer1
	
	local BroShotZomPlayer2 = nil
	
	BroShotZomPlayer2 = MenuBuilder.BuildRegisteredType( "BroShotZomPlayer", {
		controllerIndex = f3_local1
	} )
	BroShotZomPlayer2.id = "BroShotZomPlayer2"
	BroShotZomPlayer2:SetZRotation( -8, 0 )
	BroShotZomPlayer2.Score:SetLeft( _1080p * 0, 0 )
	BroShotZomPlayer2.Score:SetRight( _1080p * 0, 0 )
	BroShotZomPlayer2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 524, _1080p * 990, _1080p * 337, _1080p * 900 )
	self:addElement( BroShotZomPlayer2 )
	self.BroShotZomPlayer2 = BroShotZomPlayer2
	
	local BroShotZomPlayer3 = nil
	
	BroShotZomPlayer3 = MenuBuilder.BuildRegisteredType( "BroShotZomPlayer", {
		controllerIndex = f3_local1
	} )
	BroShotZomPlayer3.id = "BroShotZomPlayer3"
	BroShotZomPlayer3:SetZRotation( 8, 0 )
	BroShotZomPlayer3.Score:SetLeft( _1080p * 0, 0 )
	BroShotZomPlayer3.Score:SetRight( _1080p * 0, 0 )
	BroShotZomPlayer3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 62, _1080p * 528, _1080p * 457, _1080p * 1020 )
	self:addElement( BroShotZomPlayer3 )
	self.BroShotZomPlayer3 = BroShotZomPlayer3
	
	local BlackFadeIn = nil
	
	BlackFadeIn = LUI.UIImage.new()
	BlackFadeIn.id = "BlackFadeIn"
	BlackFadeIn:SetRGBFromInt( 0, 0 )
	self:addElement( BlackFadeIn )
	self.BlackFadeIn = BlackFadeIn
	
	local DoubleXPNotifications = nil
	
	DoubleXPNotifications = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
		controllerIndex = f3_local1
	} )
	DoubleXPNotifications.id = "DoubleXPNotifications"
	DoubleXPNotifications:SetScale( -0.5, 0 )
	DoubleXPNotifications:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1349.25, _1080p * 1864.25, _1080p * 915, _1080p * 1043 )
	self:addElement( DoubleXPNotifications )
	self.DoubleXPNotifications = DoubleXPNotifications
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		OuterMaskBottom:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * -248, _1080p * 269, 0 )
				end
			}
		} )
		OuterMaskTop:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -265, _1080p * 250, 0 )
				end
			}
		} )
		Stripe:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.Stripe:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -209.5, _1080p * 2129.5, _1080p * 251.75, _1080p * 828.25, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( 360, 34000 )
				end
			},
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1098, _1080p * 2002, _1080p * -47.5, _1080p * 856.5, 0 )
				end
			}
		} )
		RedGlow:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1143, _1080p * 1923, 0, _1080p * 780, 0 )
				end
			}
		} )
		flames:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1438, _1080p * 1716, _1080p * -76.5, _1080p * 390, 0 )
				end,
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1433, _1080p * 1711, _1080p * -64.5, _1080p * 402, 34000 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1401.48, _1080p * 1657.48, _1080p * 830.06, _1080p * 958.06, 0 )
				end
			}
		} )
		BroShotZomPlayer0:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.BroShotZomPlayer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1315, _1080p * 1781, _1080p * 114.54, _1080p * 677.54, 0 )
				end
			}
		} )
		BroShotZomPlayer1:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.BroShotZomPlayer1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 882, _1080p * 1348, _1080p * 265.25, _1080p * 828.25, 0 )
				end
			}
		} )
		BroShotZomPlayer2:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.BroShotZomPlayer2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 486.5, _1080p * 952.5, _1080p * 365.5, _1080p * 928.5, 0 )
				end
			}
		} )
		BroShotZomPlayer3:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.BroShotZomPlayer3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40, _1080p * 506, _1080p * 456.5, _1080p * 1019.5, 0 )
				end
			}
		} )
		self._sequences.FourPlayer = function ()
			OuterMaskBottom:AnimateLoop( "FourPlayer" )
			OuterMaskTop:AnimateLoop( "FourPlayer" )
			Stripe:AnimateLoop( "FourPlayer" )
			Spinner:AnimateLoop( "FourPlayer" )
			RedGlow:AnimateLoop( "FourPlayer" )
			flames:AnimateLoop( "FourPlayer" )
			Logo:AnimateLoop( "FourPlayer" )
			BroShotZomPlayer0:AnimateLoop( "FourPlayer" )
			BroShotZomPlayer1:AnimateLoop( "FourPlayer" )
			BroShotZomPlayer2:AnimateLoop( "FourPlayer" )
			BroShotZomPlayer3:AnimateLoop( "FourPlayer" )
		end
		
		OuterMaskBottom:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * -248, _1080p * 270, 0 )
				end
			}
		} )
		OuterMaskTop:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -265, _1080p * 250, 0 )
				end
			}
		} )
		Stripe:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.Stripe:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -209.5, _1080p * 2129.5, _1080p * 251.75, _1080p * 828.25, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( 360, 34000 )
				end
			},
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 930, _1080p * 1834, _1080p * -49.56, _1080p * 854.44, 0 )
				end
			}
		} )
		RedGlow:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 972, _1080p * 1752, _1080p * 11.94, _1080p * 791.94, 0 )
				end
			}
		} )
		flames:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1241, _1080p * 1519, _1080p * -49.56, _1080p * 416.94, 0 )
				end,
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1269, _1080p * 1547, _1080p * -89.56, _1080p * 444.94, 34000 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1401.48, _1080p * 1657.48, _1080p * 830.06, _1080p * 958.06, 0 )
				end
			}
		} )
		BroShotZomPlayer0:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.BroShotZomPlayer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1156, _1080p * 1622, _1080p * 121.54, _1080p * 684.54, 0 )
				end
			}
		} )
		BroShotZomPlayer1:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.BroShotZomPlayer1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 664, _1080p * 1130, _1080p * 238.94, _1080p * 801.94, 0 )
				end
			}
		} )
		BroShotZomPlayer2:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.BroShotZomPlayer2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 209, _1080p * 675, _1080p * 416, _1080p * 979, 0 )
				end
			}
		} )
		BroShotZomPlayer3:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.BroShotZomPlayer3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ThreePlayer = function ()
			OuterMaskBottom:AnimateLoop( "ThreePlayer" )
			OuterMaskTop:AnimateLoop( "ThreePlayer" )
			Stripe:AnimateLoop( "ThreePlayer" )
			Spinner:AnimateLoop( "ThreePlayer" )
			RedGlow:AnimateLoop( "ThreePlayer" )
			flames:AnimateLoop( "ThreePlayer" )
			Logo:AnimateLoop( "ThreePlayer" )
			BroShotZomPlayer0:AnimateLoop( "ThreePlayer" )
			BroShotZomPlayer1:AnimateLoop( "ThreePlayer" )
			BroShotZomPlayer2:AnimateLoop( "ThreePlayer" )
			BroShotZomPlayer3:AnimateLoop( "ThreePlayer" )
		end
		
		OuterMaskBottom:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * -248, _1080p * 270, 0 )
				end
			}
		} )
		OuterMaskTop:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -265, _1080p * 250, 0 )
				end
			}
		} )
		Stripe:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.Stripe:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -209.5, _1080p * 2129.5, _1080p * 251.75, _1080p * 828.25, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( 360, 34000 )
				end
			},
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 709.48, _1080p * 1613.48, _1080p * 20.8, _1080p * 924.8, 0 )
				end
			}
		} )
		RedGlow:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 751.48, _1080p * 1531.48, _1080p * 92.3, _1080p * 872.3, 0 )
				end
			}
		} )
		flames:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1020.48, _1080p * 1298.48, _1080p * 20.8, _1080p * 487.3, 0 )
				end,
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1030.48, _1080p * 1308.48, _1080p * -51.2, _1080p * 543.3, 34000 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1401.48, _1080p * 1657.48, _1080p * 830.06, _1080p * 958.06, 0 )
				end
			}
		} )
		BroShotZomPlayer0:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.BroShotZomPlayer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 928.48, _1080p * 1394.48, _1080p * 191.3, _1080p * 754.3, 0 )
				end
			}
		} )
		BroShotZomPlayer1:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.BroShotZomPlayer1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 417.15, _1080p * 883.15, _1080p * 311.3, _1080p * 874.3, 0 )
				end
			}
		} )
		BroShotZomPlayer2:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.BroShotZomPlayer2:SetAlpha( 0, 0 )
				end
			}
		} )
		BroShotZomPlayer3:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.BroShotZomPlayer3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.TwoPlayer = function ()
			OuterMaskBottom:AnimateLoop( "TwoPlayer" )
			OuterMaskTop:AnimateLoop( "TwoPlayer" )
			Stripe:AnimateLoop( "TwoPlayer" )
			Spinner:AnimateLoop( "TwoPlayer" )
			RedGlow:AnimateLoop( "TwoPlayer" )
			flames:AnimateLoop( "TwoPlayer" )
			Logo:AnimateLoop( "TwoPlayer" )
			BroShotZomPlayer0:AnimateLoop( "TwoPlayer" )
			BroShotZomPlayer1:AnimateLoop( "TwoPlayer" )
			BroShotZomPlayer2:AnimateLoop( "TwoPlayer" )
			BroShotZomPlayer3:AnimateLoop( "TwoPlayer" )
		end
		
		OuterMaskBottom:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * -248, _1080p * 270, 0 )
				end
			}
		} )
		OuterMaskTop:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -265, _1080p * 250, 0 )
				end
			}
		} )
		Stripe:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.Stripe:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -209.5, _1080p * 2129.5, _1080p * 251.75, _1080p * 828.25, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( 360, 34000 )
				end
			},
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 508, _1080p * 1412, _1080p * 77, _1080p * 981, 0 )
				end
			}
		} )
		RedGlow:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 545, _1080p * 1325, _1080p * 142.5, _1080p * 922.5, 0 )
				end
			}
		} )
		flames:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 819, _1080p * 1097, _1080p * 77, _1080p * 543.5, 0 )
				end,
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 838, _1080p * 1116, _1080p * 3, _1080p * 607.5, 34000 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1401.48, _1080p * 1657.48, _1080p * 830.06, _1080p * 958.06, 0 )
				end
			}
		} )
		BroShotZomPlayer0:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.BroShotZomPlayer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 734, _1080p * 1200, _1080p * 247.5, _1080p * 810.5, 0 )
				end
			}
		} )
		BroShotZomPlayer1:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.BroShotZomPlayer1:SetAlpha( 0, 0 )
				end
			}
		} )
		BroShotZomPlayer2:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.BroShotZomPlayer2:SetAlpha( 0, 0 )
				end
			}
		} )
		BroShotZomPlayer3:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.BroShotZomPlayer3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.OnePlayer = function ()
			OuterMaskBottom:AnimateLoop( "OnePlayer" )
			OuterMaskTop:AnimateLoop( "OnePlayer" )
			Stripe:AnimateLoop( "OnePlayer" )
			Spinner:AnimateLoop( "OnePlayer" )
			RedGlow:AnimateLoop( "OnePlayer" )
			flames:AnimateLoop( "OnePlayer" )
			Logo:AnimateLoop( "OnePlayer" )
			BroShotZomPlayer0:AnimateLoop( "OnePlayer" )
			BroShotZomPlayer1:AnimateLoop( "OnePlayer" )
			BroShotZomPlayer2:AnimateLoop( "OnePlayer" )
			BroShotZomPlayer3:AnimateLoop( "OnePlayer" )
		end
		
		OuterMaskBottom:RegisterAnimationSequence( "TwoPlayerSplit", {
			{
				function ()
					return self.OuterMaskBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		OuterMaskTop:RegisterAnimationSequence( "TwoPlayerSplit", {
			{
				function ()
					return self.OuterMaskTop:SetAlpha( 0, 0 )
				end
			}
		} )
		Stripe:RegisterAnimationSequence( "TwoPlayerSplit", {
			{
				function ()
					return self.Stripe:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Stripe:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -95, _1080p * 2355, _1080p * 77, _1080p * 461.4, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "TwoPlayerSplit", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( 360, 34000 )
				end
			},
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetScale( -0.6, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 849.08, _1080p * 1753.08, _1080p * -206.9, _1080p * 697.1, 0 )
				end
			}
		} )
		RedGlow:RegisterAnimationSequence( "TwoPlayerSplit", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.RedGlow:SetScale( -0.6, 0 )
				end
			},
			{
				function ()
					return self.RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 908.08, _1080p * 1688.08, _1080p * -144.9, _1080p * 635.1, 0 )
				end
			}
		} )
		flames:RegisterAnimationSequence( "TwoPlayerSplit", {
			{
				function ()
					return self.flames:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1179.08, _1080p * 1457.08, _1080p * -151.15, _1080p * 315.35, 0 )
				end,
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1177.08, _1080p * 1455.08, _1080p * -136.15, _1080p * 330.35, 34000 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "TwoPlayerSplit", {
			{
				function ()
					return self.Logo:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1514, _1080p * 1770, _1080p * 360, _1080p * 488, 0 )
				end
			}
		} )
		BroShotZomPlayer0:RegisterAnimationSequence( "TwoPlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer0:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer0:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1075.08, _1080p * 1541.08, _1080p * -44.5, _1080p * 518.5, 0 )
				end
			}
		} )
		BroShotZomPlayer1:RegisterAnimationSequence( "TwoPlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer1:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 520.8, _1080p * 986.8, _1080p * 76.4, _1080p * 639.4, 0 )
				end
			}
		} )
		BroShotZomPlayer2:RegisterAnimationSequence( "TwoPlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer2:SetAlpha( 0, 0 )
				end
			}
		} )
		BroShotZomPlayer3:RegisterAnimationSequence( "TwoPlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.TwoPlayerSplit = function ()
			OuterMaskBottom:AnimateLoop( "TwoPlayerSplit" )
			OuterMaskTop:AnimateLoop( "TwoPlayerSplit" )
			Stripe:AnimateLoop( "TwoPlayerSplit" )
			Spinner:AnimateLoop( "TwoPlayerSplit" )
			RedGlow:AnimateLoop( "TwoPlayerSplit" )
			flames:AnimateLoop( "TwoPlayerSplit" )
			Logo:AnimateLoop( "TwoPlayerSplit" )
			BroShotZomPlayer0:AnimateLoop( "TwoPlayerSplit" )
			BroShotZomPlayer1:AnimateLoop( "TwoPlayerSplit" )
			BroShotZomPlayer2:AnimateLoop( "TwoPlayerSplit" )
			BroShotZomPlayer3:AnimateLoop( "TwoPlayerSplit" )
		end
		
		OuterMaskBottom:RegisterAnimationSequence( "ThreePlayerSplit", {
			{
				function ()
					return self.OuterMaskBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		OuterMaskTop:RegisterAnimationSequence( "ThreePlayerSplit", {
			{
				function ()
					return self.OuterMaskTop:SetAlpha( 0, 0 )
				end
			}
		} )
		Stripe:RegisterAnimationSequence( "ThreePlayerSplit", {
			{
				function ()
					return self.Stripe:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Stripe:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -95, _1080p * 2501, _1080p * 77, _1080p * 461.4, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "ThreePlayerSplit", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( 360, 34000 )
				end
			},
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetScale( -0.6, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 991.8, _1080p * 1895.8, _1080p * -225.9, _1080p * 678.1, 0 )
				end
			}
		} )
		RedGlow:RegisterAnimationSequence( "ThreePlayerSplit", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.RedGlow:SetScale( -0.6, 0 )
				end
			},
			{
				function ()
					return self.RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1050.8, _1080p * 1830.8, _1080p * -163.9, _1080p * 616.1, 0 )
				end
			}
		} )
		flames:RegisterAnimationSequence( "ThreePlayerSplit", {
			{
				function ()
					return self.flames:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1321.8, _1080p * 1599.8, _1080p * -170.15, _1080p * 296.35, 0 )
				end,
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1321.8, _1080p * 1599.8, _1080p * -154.15, _1080p * 312.35, 34000 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "ThreePlayerSplit", {
			{
				function ()
					return self.Logo:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1522, _1080p * 1778, _1080p * 390.4, _1080p * 518.4, 0 )
				end
			}
		} )
		TimeSurvived:RegisterAnimationSequence( "ThreePlayerSplit", {
			{
				function ()
					return self.TimeSurvived:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 172, _1080p * 466, _1080p * 199, _1080p * 237, 0 )
				end
			}
		} )
		BroShotZomPlayer0:RegisterAnimationSequence( "ThreePlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer0:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer0:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1217.8, _1080p * 1683.8, _1080p * -63.5, _1080p * 499.5, 0 )
				end
			}
		} )
		BroShotZomPlayer1:RegisterAnimationSequence( "ThreePlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer1:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 758.8, _1080p * 1224.8, _1080p * 20.63, _1080p * 583.63, 0 )
				end
			}
		} )
		BroShotZomPlayer2:RegisterAnimationSequence( "ThreePlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer2:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 287.8, _1080p * 753.8, _1080p * 108.9, _1080p * 671.9, 0 )
				end
			}
		} )
		BroShotZomPlayer3:RegisterAnimationSequence( "ThreePlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ThreePlayerSplit = function ()
			OuterMaskBottom:AnimateLoop( "ThreePlayerSplit" )
			OuterMaskTop:AnimateLoop( "ThreePlayerSplit" )
			Stripe:AnimateLoop( "ThreePlayerSplit" )
			Spinner:AnimateLoop( "ThreePlayerSplit" )
			RedGlow:AnimateLoop( "ThreePlayerSplit" )
			flames:AnimateLoop( "ThreePlayerSplit" )
			Logo:AnimateLoop( "ThreePlayerSplit" )
			TimeSurvived:AnimateLoop( "ThreePlayerSplit" )
			BroShotZomPlayer0:AnimateLoop( "ThreePlayerSplit" )
			BroShotZomPlayer1:AnimateLoop( "ThreePlayerSplit" )
			BroShotZomPlayer2:AnimateLoop( "ThreePlayerSplit" )
			BroShotZomPlayer3:AnimateLoop( "ThreePlayerSplit" )
		end
		
		OuterMaskBottom:RegisterAnimationSequence( "FourPlayerSplit", {
			{
				function ()
					return self.OuterMaskBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		OuterMaskTop:RegisterAnimationSequence( "FourPlayerSplit", {
			{
				function ()
					return self.OuterMaskTop:SetAlpha( 0, 0 )
				end
			}
		} )
		Stripe:RegisterAnimationSequence( "FourPlayerSplit", {
			{
				function ()
					return self.Stripe:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Stripe:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -95, _1080p * 2471, _1080p * 95, _1080p * 479.4, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "FourPlayerSplit", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( 360, 34000 )
				end
			},
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetScale( -0.6, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 991.8, _1080p * 1895.8, _1080p * -225.9, _1080p * 678.1, 0 )
				end
			}
		} )
		RedGlow:RegisterAnimationSequence( "FourPlayerSplit", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.RedGlow:SetScale( -0.6, 0 )
				end
			},
			{
				function ()
					return self.RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1050.8, _1080p * 1830.8, _1080p * -163.9, _1080p * 616.1, 0 )
				end
			}
		} )
		flames:RegisterAnimationSequence( "FourPlayerSplit", {
			{
				function ()
					return self.flames:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1321.8, _1080p * 1599.8, _1080p * -170.15, _1080p * 296.35, 0 )
				end,
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1322.8, _1080p * 1600.8, _1080p * -153.15, _1080p * 313.35, 34000 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "FourPlayerSplit", {
			{
				function ()
					return self.Logo:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1522, _1080p * 1778, _1080p * 390.4, _1080p * 518.4, 0 )
				end
			}
		} )
		TimeSurvived:RegisterAnimationSequence( "FourPlayerSplit", {
			{
				function ()
					return self.TimeSurvived:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 172, _1080p * 466, _1080p * 199, _1080p * 237, 0 )
				end
			}
		} )
		BroShotZomPlayer0:RegisterAnimationSequence( "FourPlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer0:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer0:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1217.8, _1080p * 1683.8, _1080p * -63.5, _1080p * 499.5, 0 )
				end
			}
		} )
		BroShotZomPlayer1:RegisterAnimationSequence( "FourPlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer1:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 843.5, _1080p * 1309.5, _1080p * -6.1, _1080p * 556.9, 0 )
				end
			}
		} )
		BroShotZomPlayer2:RegisterAnimationSequence( "FourPlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer2:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 487.49, _1080p * 953.49, _1080p * 79.4, _1080p * 642.4, 0 )
				end
			}
		} )
		BroShotZomPlayer3:RegisterAnimationSequence( "FourPlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer3:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer3:SetZRotation( 8, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 142, _1080p * 608, _1080p * 124.5, _1080p * 687.5, 0 )
				end
			}
		} )
		self._sequences.FourPlayerSplit = function ()
			OuterMaskBottom:AnimateLoop( "FourPlayerSplit" )
			OuterMaskTop:AnimateLoop( "FourPlayerSplit" )
			Stripe:AnimateLoop( "FourPlayerSplit" )
			Spinner:AnimateLoop( "FourPlayerSplit" )
			RedGlow:AnimateLoop( "FourPlayerSplit" )
			flames:AnimateLoop( "FourPlayerSplit" )
			Logo:AnimateLoop( "FourPlayerSplit" )
			TimeSurvived:AnimateLoop( "FourPlayerSplit" )
			BroShotZomPlayer0:AnimateLoop( "FourPlayerSplit" )
			BroShotZomPlayer1:AnimateLoop( "FourPlayerSplit" )
			BroShotZomPlayer2:AnimateLoop( "FourPlayerSplit" )
			BroShotZomPlayer3:AnimateLoop( "FourPlayerSplit" )
		end
		
		OuterMaskBottom:RegisterAnimationSequence( "OnePlayerSplit", {
			{
				function ()
					return self.OuterMaskBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		OuterMaskTop:RegisterAnimationSequence( "OnePlayerSplit", {
			{
				function ()
					return self.OuterMaskTop:SetAlpha( 0, 0 )
				end
			}
		} )
		Stripe:RegisterAnimationSequence( "OnePlayerSplit", {
			{
				function ()
					return self.Stripe:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Stripe:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -95, _1080p * 2390, _1080p * 77, _1080p * 461.4, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "OnePlayerSplit", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( 360, 34000 )
				end
			},
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetScale( -0.6, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 475.7, _1080p * 1379.7, _1080p * -144.8, _1080p * 759.2, 0 )
				end
			}
		} )
		RedGlow:RegisterAnimationSequence( "OnePlayerSplit", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.RedGlow:SetScale( -0.6, 0 )
				end
			},
			{
				function ()
					return self.RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 534.7, _1080p * 1314.7, _1080p * -82.8, _1080p * 697.2, 0 )
				end
			}
		} )
		flames:RegisterAnimationSequence( "OnePlayerSplit", {
			{
				function ()
					return self.flames:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 805.7, _1080p * 1083.7, _1080p * -89.05, _1080p * 377.45, 0 )
				end,
				function ()
					return self.flames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 803.7, _1080p * 1081.7, _1080p * -122.05, _1080p * 448.45, 34000 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "OnePlayerSplit", {
			{
				function ()
					return self.Logo:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1514, _1080p * 1770, _1080p * 360, _1080p * 488, 0 )
				end
			}
		} )
		BroShotZomPlayer0:RegisterAnimationSequence( "OnePlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer0:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer0:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 701.7, _1080p * 1167.7, _1080p * 17.6, _1080p * 580.6, 0 )
				end
			}
		} )
		BroShotZomPlayer1:RegisterAnimationSequence( "OnePlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer1:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer1:SetScale( -0.4, 0 )
				end
			},
			{
				function ()
					return self.BroShotZomPlayer1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 520.8, _1080p * 986.8, _1080p * 76.4, _1080p * 639.4, 0 )
				end
			}
		} )
		BroShotZomPlayer2:RegisterAnimationSequence( "OnePlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer2:SetAlpha( 0, 0 )
				end
			}
		} )
		BroShotZomPlayer3:RegisterAnimationSequence( "OnePlayerSplit", {
			{
				function ()
					return self.BroShotZomPlayer3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.OnePlayerSplit = function ()
			OuterMaskBottom:AnimateLoop( "OnePlayerSplit" )
			OuterMaskTop:AnimateLoop( "OnePlayerSplit" )
			Stripe:AnimateLoop( "OnePlayerSplit" )
			Spinner:AnimateLoop( "OnePlayerSplit" )
			RedGlow:AnimateLoop( "OnePlayerSplit" )
			flames:AnimateLoop( "OnePlayerSplit" )
			Logo:AnimateLoop( "OnePlayerSplit" )
			BroShotZomPlayer0:AnimateLoop( "OnePlayerSplit" )
			BroShotZomPlayer1:AnimateLoop( "OnePlayerSplit" )
			BroShotZomPlayer2:AnimateLoop( "OnePlayerSplit" )
			BroShotZomPlayer3:AnimateLoop( "OnePlayerSplit" )
		end
		
		OuterMaskBottom:RegisterAnimationSequence( "QuickQuit", {
			{
				function ()
					return self.OuterMaskBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		OuterMaskTop:RegisterAnimationSequence( "QuickQuit", {
			{
				function ()
					return self.OuterMaskTop:SetAlpha( 0, 0 )
				end
			}
		} )
		Stripe:RegisterAnimationSequence( "QuickQuit", {
			{
				function ()
					return self.Stripe:SetAlpha( 0, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "QuickQuit", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end
			}
		} )
		RedGlow:RegisterAnimationSequence( "QuickQuit", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		flames:RegisterAnimationSequence( "QuickQuit", {
			{
				function ()
					return self.flames:SetAlpha( 0, 0 )
				end
			}
		} )
		BroShotZomPlayer0:RegisterAnimationSequence( "QuickQuit", {
			{
				function ()
					return self.BroShotZomPlayer0:SetAlpha( 0, 0 )
				end
			}
		} )
		BroShotZomPlayer1:RegisterAnimationSequence( "QuickQuit", {
			{
				function ()
					return self.BroShotZomPlayer1:SetAlpha( 0, 0 )
				end
			}
		} )
		BroShotZomPlayer2:RegisterAnimationSequence( "QuickQuit", {
			{
				function ()
					return self.BroShotZomPlayer2:SetAlpha( 0, 0 )
				end
			}
		} )
		BroShotZomPlayer3:RegisterAnimationSequence( "QuickQuit", {
			{
				function ()
					return self.BroShotZomPlayer3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.QuickQuit = function ()
			OuterMaskBottom:AnimateSequence( "QuickQuit" )
			OuterMaskTop:AnimateSequence( "QuickQuit" )
			Stripe:AnimateSequence( "QuickQuit" )
			Spinner:AnimateSequence( "QuickQuit" )
			RedGlow:AnimateSequence( "QuickQuit" )
			flames:AnimateSequence( "QuickQuit" )
			BroShotZomPlayer0:AnimateSequence( "QuickQuit" )
			BroShotZomPlayer1:AnimateSequence( "QuickQuit" )
			BroShotZomPlayer2:AnimateSequence( "QuickQuit" )
			BroShotZomPlayer3:AnimateSequence( "QuickQuit" )
		end
		
		BlackFadeIn:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.BlackFadeIn:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BlackFadeIn:SetAlpha( 0, 500 )
				end
			}
		} )
		self._sequences.FadeIn = function ()
			BlackFadeIn:AnimateSequence( "FadeIn" )
		end
		
		Logo:RegisterAnimationSequence( "cpRaveLogo", {
			{
				function ()
					return self.Logo:setImage( RegisterMaterial( "zm_rave_logo" ), 0 )
				end
			},
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1421.63, _1080p * 1677.63, _1080p * 744.06, _1080p * 872.06, 0 )
				end
			}
		} )
		self._sequences.cpRaveLogo = function ()
			Logo:AnimateSequence( "cpRaveLogo" )
		end
		
		Logo:RegisterAnimationSequence( "cpDiscoLogo", {
			{
				function ()
					return self.Logo:setImage( RegisterMaterial( "zm_disco_logo" ), 0 )
				end
			},
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1464.12, _1080p * 1720.12, _1080p * 773.06, _1080p * 901.06, 0 )
				end
			}
		} )
		self._sequences.cpDiscoLogo = function ()
			Logo:AnimateSequence( "cpDiscoLogo" )
		end
		
		Logo:RegisterAnimationSequence( "cpTownLogo", {
			{
				function ()
					return self.Logo:setImage( RegisterMaterial( "cp_town_logo" ), 0 )
				end
			},
			{
				function ()
					return self.Logo:SetScale( 0.3, 0 )
				end
			},
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1295.93, _1080p * 1807.93, _1080p * 723.84, _1080p * 979.84, 0 )
				end
			}
		} )
		self._sequences.cpTownLogo = function ()
			Logo:AnimateSequence( "cpTownLogo" )
		end
		
		Logo:RegisterAnimationSequence( "cpFinalLogo", {
			{
				function ()
					return self.Logo:setImage( RegisterMaterial( "cp_final_logo" ), 0 )
				end
			},
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1445.12, _1080p * 1701.12, _1080p * 773.06, _1080p * 901.06, 0 )
				end
			}
		} )
		self._sequences.cpFinalLogo = function ()
			Logo:AnimateSequence( "cpFinalLogo" )
		end
		
		Title:RegisterAnimationSequence( "bossWin", {
			{
				function ()
					return self.Title:SetAlpha( 0, 0 )
				end
			}
		} )
		TimeSurvived:RegisterAnimationSequence( "bossWin", {
			{
				function ()
					return self.TimeSurvived:SetAlpha( 0, 0 )
				end
			}
		} )
		BossTimer:RegisterAnimationSequence( "bossWin", {
			{
				function ()
					return self.BossTimer:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BossTimer.Timer:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.BossTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 179.84, _1080p * 379.84, _1080p * 191, _1080p * 241, 0 )
				end
			}
		} )
		bossDescText:RegisterAnimationSequence( "bossWin", {
			{
				function ()
					return self.bossDescText:SetAlpha( 1, 0 )
				end
			}
		} )
		YouWon:RegisterAnimationSequence( "bossWin", {
			{
				function ()
					return self.YouWon:SetAlpha( 1, 0 )
				end
			}
		} )
		MatchEnded:RegisterAnimationSequence( "bossWin", {
			{
				function ()
					return self.MatchEnded:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.bossWin = function ()
			Title:AnimateSequence( "bossWin" )
			TimeSurvived:AnimateSequence( "bossWin" )
			BossTimer:AnimateSequence( "bossWin" )
			bossDescText:AnimateSequence( "bossWin" )
			YouWon:AnimateSequence( "bossWin" )
			MatchEnded:AnimateSequence( "bossWin" )
		end
		
		Title:RegisterAnimationSequence( "bossFailed", {
			{
				function ()
					return self.Title:SetAlpha( 0, 0 )
				end
			}
		} )
		TimeSurvived:RegisterAnimationSequence( "bossFailed", {
			{
				function ()
					return self.TimeSurvived:SetAlpha( 0, 0 )
				end
			}
		} )
		BossTimer:RegisterAnimationSequence( "bossFailed", {
			{
				function ()
					return self.BossTimer.Timer:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.BossTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 179.84, _1080p * 379.84, _1080p * 191, _1080p * 241, 0 )
				end
			}
		} )
		YouFailed:RegisterAnimationSequence( "bossFailed", {
			{
				function ()
					return self.YouFailed:SetAlpha( 1, 0 )
				end
			}
		} )
		MatchEnded:RegisterAnimationSequence( "bossFailed", {
			{
				function ()
					return self.MatchEnded:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.bossFailed = function ()
			Title:AnimateSequence( "bossFailed" )
			TimeSurvived:AnimateSequence( "bossFailed" )
			BossTimer:AnimateSequence( "bossFailed" )
			YouFailed:AnimateSequence( "bossFailed" )
			MatchEnded:AnimateSequence( "bossFailed" )
		end
		
		YouWon:RegisterAnimationSequence( "mephOnlyWin", {
			{
				function ()
					return self.YouWon:SetAlpha( 1, 0 )
				end
			}
		} )
		MatchEnded:RegisterAnimationSequence( "mephOnlyWin", {
			{
				function ()
					return self.MatchEnded:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.mephOnlyWin = function ()
			YouWon:AnimateSequence( "mephOnlyWin" )
			MatchEnded:AnimateSequence( "mephOnlyWin" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "FadeIn" )
	if CONDITIONS.IsRave( self ) then
		ACTIONS.AnimateSequence( self, "cpRaveLogo" )
	end
	if CONDITIONS.IsDLC2( self ) then
		ACTIONS.AnimateSequence( self, "cpDiscoLogo" )
	end
	if CONDITIONS.IsDLC3( self ) then
		ACTIONS.AnimateSequence( self, "cpTownLogo" )
	end
	if CONDITIONS.IsDLC4( self ) then
		ACTIONS.AnimateSequence( self, "cpFinalLogo" )
	end
	if DataSources.inGame.CP.zombies.bossSplash:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.bossSplash:GetValue( f3_local1 ) == 5 then
		ACTIONS.AnimateSequence( self, "bossWin" )
	end
	if DataSources.inGame.CP.zombies.bossSplash:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.bossSplash:GetValue( f3_local1 ) == 6 then
		ACTIONS.AnimateSequence( self, "bossFailed" )
	end
	if DataSources.inGame.CP.zombies.bossSplash:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.bossSplash:GetValue( f3_local1 ) == 7 then
		ACTIONS.AnimateSequence( self, "mephOnlyWin" )
	end
	return self
end

MenuBuilder.registerType( "BroShotZomScreen", BroShotZomScreen )
LockTable( _M )
