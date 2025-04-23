local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PopFunc()
	Engine.Unpause()
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f2_arg0:addElement( self )
	if not CONDITIONS.IsSplitscreen() and Game.GetNumPlayersOnTeam( Teams.allies ) > 1 then
		Engine.NotifyServer( "arcade_off", 1 )
	end
	if not CONDITIONS.IsSplitscreen() then
		f2_arg0:setupLetterboxElement()
	end
	if CONDITIONS.IsDirectorsCutOn( f2_arg1 ) and Game.GetOmnvar( "zm_boss_timer" ) > 0 then
		f2_arg0.directorsCut:SetAlpha( 0, 0 )
	end
end

function CPPauseMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CPPauseMenu"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self:playSound( "menu_open" )
	local f3_local2 = self
	local CPPauseMenuBG = nil
	
	CPPauseMenuBG = MenuBuilder.BuildRegisteredType( "CPPauseMenuBG", {
		controllerIndex = f3_local1
	} )
	CPPauseMenuBG.id = "CPPauseMenuBG"
	CPPauseMenuBG:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( CPPauseMenuBG )
	self.CPPauseMenuBG = CPPauseMenuBG
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f3_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local CPPauseMenuButtons = nil
	
	CPPauseMenuButtons = MenuBuilder.BuildRegisteredType( "CPPauseMenuButtons", {
		controllerIndex = f3_local1
	} )
	CPPauseMenuButtons.id = "CPPauseMenuButtons"
	CPPauseMenuButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 285, _1080p * 785, _1080p * 423, _1080p * 540 )
	self:addElement( CPPauseMenuButtons )
	self.CPPauseMenuButtons = CPPauseMenuButtons
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f3_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle:SetAlpha( 0, 0 )
	CPMenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_ZOMBIES_PAUSE_CAPS" ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1090, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local CPPauseMenuFAFCardDeck = nil
	
	CPPauseMenuFAFCardDeck = MenuBuilder.BuildRegisteredType( "CPPauseMenuFAFCardDeck", {
		controllerIndex = f3_local1
	} )
	CPPauseMenuFAFCardDeck.id = "CPPauseMenuFAFCardDeck"
	CPPauseMenuFAFCardDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 865, _1080p * 1660, _1080p * 105, _1080p * 805 )
	self:addElement( CPPauseMenuFAFCardDeck )
	self.CPPauseMenuFAFCardDeck = CPPauseMenuFAFCardDeck
	
	local ZombiesLogo = nil
	
	ZombiesLogo = LUI.UIImage.new()
	ZombiesLogo.id = "ZombiesLogo"
	ZombiesLogo:setImage( RegisterMaterial( "cp_menu_zombies_logo" ), 0 )
	ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 780, _1080p * 34, _1080p * 434 )
	self:addElement( ZombiesLogo )
	self.ZombiesLogo = ZombiesLogo
	
	local f3_local9 = nil
	if CONDITIONS.IsFriendsButtonAccessible( self, f3_local1 ) then
		f3_local9 = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
			controllerIndex = f3_local1
		} )
		f3_local9.id = "FriendsElement"
		f3_local9:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
		f3_local9:SetAlignment( LUI.Alignment.Left )
		f3_local9:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 45 )
		self:addElement( f3_local9 )
		self.FriendsElement = f3_local9
	end
	local PausedTextShadow = nil
	
	PausedTextShadow = LUI.UIText.new()
	PausedTextShadow.id = "PausedTextShadow"
	PausedTextShadow:SetRGBFromInt( 0, 0 )
	PausedTextShadow:setText( Engine.Localize( "LUA_MENU_PAUSED_CAPS" ), 0 )
	PausedTextShadow:SetFontSize( 105 * _1080p )
	PausedTextShadow:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	PausedTextShadow:SetAlignment( LUI.Alignment.Left )
	PausedTextShadow:SetOptOutRightToLeftAlignmentFlip( true )
	PausedTextShadow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 289, _1080p * 929, _1080p * 320, _1080p * 425 )
	self:addElement( PausedTextShadow )
	self.PausedTextShadow = PausedTextShadow
	
	local PausedText = nil
	
	PausedText = LUI.UIText.new()
	PausedText.id = "PausedText"
	PausedText:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	PausedText:setText( Engine.Localize( "LUA_MENU_PAUSED_CAPS" ), 0 )
	PausedText:SetFontSize( 105 * _1080p )
	PausedText:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	PausedText:SetAlignment( LUI.Alignment.Left )
	PausedText:SetOptOutRightToLeftAlignmentFlip( true )
	PausedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 284, _1080p * 924, _1080p * 315, _1080p * 420 )
	self:addElement( PausedText )
	self.PausedText = PausedText
	
	local f3_local12 = nil
	if CONDITIONS.IsLocalServerPaused( self ) then
		f3_local12 = LUI.UIText.new()
		f3_local12.id = "PauseJoinWarning"
		f3_local12:setText( Engine.Localize( "LUA_MENU_ZM_PAUSE_JOIN_WARNING" ), 0 )
		f3_local12:SetFontSize( 19 * _1080p )
		f3_local12:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
		f3_local12:SetAlignment( LUI.Alignment.Left )
		f3_local12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1220.24, _1080p * 1790, _1080p * 938, _1080p * 957 )
		self:addElement( f3_local12 )
		self.PauseJoinWarning = f3_local12
	end
	local DoubleXPNotifications = nil
	
	DoubleXPNotifications = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
		controllerIndex = f3_local1
	} )
	DoubleXPNotifications.id = "DoubleXPNotifications"
	DoubleXPNotifications:SetScale( -0.5, 0 )
	DoubleXPNotifications:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1276, _1080p * 1791, _1080p * 37, _1080p * 165 )
	self:addElement( DoubleXPNotifications )
	self.DoubleXPNotifications = DoubleXPNotifications
	
	local f3_local14 = nil
	if CONDITIONS.IsAliensOnline( self ) then
		f3_local14 = MenuBuilder.BuildRegisteredType( "RankProgression", {
			controllerIndex = f3_local1
		} )
		f3_local14.id = "RankProgression"
		if CONDITIONS.IsAliensOnline( self ) then
			f3_local14:SetDataSource( DataSources.alwaysLoaded.CP.ranked.progression, f3_local1 )
		end
		f3_local14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 290, _1080p * 440, _1080p * 540, _1080p * 690 )
		self:addElement( f3_local14 )
		self.RankProgression = f3_local14
	end
	local f3_local15 = nil
	if not CONDITIONS.IsSystemLink( self ) then
		f3_local15 = MenuBuilder.BuildRegisteredType( "SmallContractsCP", {
			controllerIndex = f3_local1
		} )
		f3_local15.id = "SmallContractsCP"
		f3_local15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 163, _1080p * 624, _1080p * 699, _1080p * 1031 )
		self:addElement( f3_local15 )
		self.SmallContractsCP = f3_local15
	end
	local f3_local16 = nil
	if CONDITIONS.IsDirectorsCutOn( f3_local1 ) then
		f3_local16 = MenuBuilder.BuildRegisteredType( "directorsCut", {
			controllerIndex = f3_local1
		} )
		f3_local16.id = "directorsCut"
		f3_local16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 535, _1080p * 835, _1080p * 185, _1080p * 335 )
		self:addElement( f3_local16 )
		self.directorsCut = f3_local16
	end
	self._animationSets.DefaultAnimationSet = function ()
		ZombiesLogo:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ZombiesLogo:SetZRotation( -20, 0 )
				end,
				function ()
					return self.ZombiesLogo:SetZRotation( 0, 250, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.ZombiesLogo:SetScale( 2, 0 )
				end,
				function ()
					return self.ZombiesLogo:SetScale( 0, 250, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.ZombiesLogo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ZombiesLogo:SetAlpha( 1, 250, LUI.EASING.inQuadratic )
				end
			}
		} )
		PausedTextShadow:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.PausedTextShadow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PausedTextShadow:SetAlpha( 0, 350 )
				end,
				function ()
					return self.PausedTextShadow:SetAlpha( 1, 650 )
				end
			}
		} )
		PausedText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.PausedText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PausedText:SetAlpha( 0, 150 )
				end,
				function ()
					return self.PausedText:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.PausedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 724, _1080p * 1364, _1080p * 315, _1080p * 420, 0 )
				end,
				function ()
					return self.PausedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 724, _1080p * 1364, _1080p * 315, _1080p * 420, 150 )
				end,
				function ()
					return self.PausedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 284, _1080p * 924, _1080p * 315, _1080p * 420, 199, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			ZombiesLogo:AnimateSequence( "DefaultSequence" )
			PausedTextShadow:AnimateSequence( "DefaultSequence" )
			PausedText:AnimateSequence( "DefaultSequence" )
		end
		
		CPPauseMenuFAFCardDeck:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.CPPauseMenuFAFCardDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 865, _1080p * 1660, _1080p * -46, _1080p * 654, 0 )
				end
			}
		} )
		if CONDITIONS.IsLocalServerPaused( self ) then
			f3_local12:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.PauseJoinWarning:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 785, _1080p * 521, _1080p * 540, 0 )
					end
				}
			} )
		end
		DoubleXPNotifications:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.DoubleXPNotifications:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1695.25, _1080p * 2210.25, _1080p * 38, _1080p * 166, 0 )
				end
			}
		} )
		if CONDITIONS.IsAliensOnline( self ) then
			f3_local14:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.RankProgression:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 635, _1080p * 785, _1080p * 406.5, _1080p * 556.5, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.IsSystemLink( self ) then
			f3_local15:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.SmallContractsCP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1831, _1080p * 2292, _1080p * 138, _1080p * 470, 0 )
					end
				}
			} )
		end
		self._sequences.Splitscreen = function ()
			CPPauseMenuFAFCardDeck:AnimateSequence( "Splitscreen" )
			if CONDITIONS.IsLocalServerPaused( self ) then
				f3_local12:AnimateSequence( "Splitscreen" )
			end
			DoubleXPNotifications:AnimateSequence( "Splitscreen" )
			if CONDITIONS.IsAliensOnline( self ) then
				f3_local14:AnimateSequence( "Splitscreen" )
			end
			if not CONDITIONS.IsSystemLink( self ) then
				f3_local15:AnimateSequence( "Splitscreen" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsAliensOnline( self ) then
		f3_local14:SetDataSource( DataSources.alwaysLoaded.CP.ranked.progression, f3_local1 )
	end
	self.addButtonHelperFunction = function ( f27_arg0, f27_arg1 )
		f27_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 2,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f28_arg0, f28_arg1 )
		local f28_local0 = f28_arg1.controller or f3_local1
		ACTIONS.LeaveMenu( self )
		return true
	end )
	self.bindButton:addEventHandler( "button_start", function ( f29_arg0, f29_arg1 )
		local f29_local0 = f29_arg1.controller or f3_local1
		ACTIONS.LeaveMenu( self )
		return true
	end )
	self:addEventHandler( "menu_create", function ( f30_arg0, f30_arg1 )
		local f30_local0 = f30_arg1.controller or f3_local1
		if CONDITIONS.IsSplitscreen( self ) then
			ACTIONS.AnimateSequence( self, "Splitscreen" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "CPPauseMenuBG",
				sequenceName = "Splitscreen",
				elementPath = "CPPauseMenuBG"
			} )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CPPauseMenu", CPPauseMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "CPPauseMenu", PopFunc )
LockTable( _M )
