local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	"MENU_RECRUIT",
	"MENU_REGULAR",
	"MENU_HARDENED",
	"MENU_VETERAN"
}
f0_local1 = "MENU_SPECIALIST_MODE"
f0_local2 = "MENU_YOLO_MODE"
local f0_local3 = function ()
	ACTIONS.ResumeGame()
	LUI.FlowManager.RequestCloseAllMenus()
end

local f0_local4 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0:Wait( 500 )
	f2_local0.onComplete = function ()
		f2_arg0:close()
	end
	
end

local f0_local5 = function ()
	Engine.SetDvarBool( "pendingMapRestartOrQuitToMainMenu", true )
	Engine.Unpause()
	LUI.FlowManager.RequestCloseAllMenus()
	local f4_local0 = Engine.GetLuiRoot()
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "white" )
	} )
	self:SetRGBFromInt( 0 )
	self.id = "blackQuad"
	f4_local0:addElement( self )
	self:addEventHandler( "post_restart", f0_local4 )
end

local f0_local6 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = Engine.GetDvarInt( "g_gameskill" )
	if f5_local0 > 0 then
		local f5_local1 = f5_local0 - 1
		Engine.ExecNow( "profile_difficultySave " .. f5_local1 )
		Engine.SetDvarInt( "g_gameskill", f5_local1 )
		Engine.Exec( "updategamerprofile" )
	end
	f0_local3()
end

local f0_local7 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = Engine.GetDvarInt( "g_gameskill" )
	local f6_local1 = Engine.Localize( "MENU_LOWER_DIFFICULTY_1_0" )
	local f6_local2 = Engine.Localize( "MENU_LOWER_DIFFICULTY_1_0_BUTTON" )
	if f6_local0 == 1 then
		f6_local1 = Engine.Localize( "MENU_LOWER_DIFFICULTY_1_0" )
		f6_local2 = Engine.Localize( "MENU_LOWER_DIFFICULTY_1_0_BUTTON" )
	elseif f6_local0 == 2 then
		f6_local1 = Engine.Localize( "MENU_LOWER_DIFFICULTY_2_1" )
		f6_local2 = Engine.Localize( "MENU_LOWER_DIFFICULTY_2_1_BUTTON" )
	elseif f6_local0 == 3 then
		f6_local1 = Engine.Localize( "MENU_LOWER_DIFFICULTY_3_2" )
		f6_local2 = Engine.Localize( "MENU_LOWER_DIFFICULTY_3_2_BUTTON" )
	end
	LUI.FlowManager.RequestPopupMenu( nil, "PopupYesNo", true, f6_arg1.controller, false, {
		title = Engine.Localize( "MENU_LOWER_DIFFICULTY" ),
		message = f6_local1,
		yesLabel = f6_local2,
		yesAction = f0_local6,
		noLabel = Engine.Localize( "LUA_MENU_CANCEL" )
	} )
end

local f0_local8 = function ( f7_arg0, f7_arg1 )
	Engine.SetDvarFloat( "ui_securing_progress", 0 )
	Engine.SetDvarString( "ui_securing", "" )
	Engine.Exec( "loadgame_continue_missionfailed" )
	f0_local5()
	PreGame.EndDuckAudio()
	Engine.StopAllSounds()
end

local f0_local9 = function ( f8_arg0, f8_arg1 )
	LUI.FlowManager.RequestPopupMenu( nil, "PopupYesNo", true, f8_arg1.controller, false, {
		title = Engine.Localize( "MENU_LAST_CHECKPOINT" ),
		message = Engine.Localize( "MENU_SP_LAST_CHECKPOINT_CONFIRMATION" ),
		yesLabel = Engine.Localize( "LUA_MENU_YES" ),
		yesAction = f0_local8,
		noLabel = Engine.Localize( "LUA_MENU_CANCEL" )
	} )
end

local f0_local10 = function ( f9_arg0, f9_arg1 )
	Engine.Exec( "stopControllerRumble" )
	Engine.NotifyServer( "restartMission", 1 )
	f0_local5()
	PreGame.EndDuckAudio()
	Engine.StopAllSounds()
end

local f0_local11 = function ( f10_arg0, f10_arg1 )
	LUI.FlowManager.RequestPopupMenu( nil, "PopupYesNo", true, f10_arg1.controller, false, {
		title = Engine.Localize( "MENU_RESTART_MISSION" ),
		message = Engine.Localize( "MENU_RESTART_TEXT" ),
		yesLabel = Engine.Localize( "MENU_RESTART_MISSION" ),
		yesAction = f0_local10,
		noLabel = Engine.Localize( "LUA_MENU_CANCEL" )
	} )
end

local f0_local12 = function ( f11_arg0, f11_arg1 )
	Engine.SetDvarBool( "pendingMapRestartOrQuitToMainMenu", true )
	Engine.AcceptInvite()
	Engine.Exec( "disconnect" )
	PreGame.EndDuckAudio()
	Engine.StopAllSounds()
end

local f0_local13 = function ( f12_arg0, f12_arg1 )
	LUI.FlowManager.RequestPopupMenu( nil, "PopupYesNo", true, f12_arg1.controller, false, {
		title = Engine.Localize( "MENU_QUIT_WARNING" ),
		message = Engine.Localize( "MENU_SAVEQUIT_TEXT" ),
		yesLabel = Engine.Localize( "MENU_QUIT_CAPS" ),
		yesAction = f0_local12,
		noLabel = Engine.Localize( "LUA_MENU_CANCEL" )
	} )
end

local f0_local14 = function ( f13_arg0, f13_arg1, f13_arg2 )
	assert( f13_arg0.ButtonDifficulty )
	assert( f13_arg0.ButtonCheckpoint )
	assert( f13_arg0.ButtonRestart )
	assert( f13_arg0.ButtonQuit )
	PreGame.RemoveDuckAudioTemporarily()
	local f13_local0 = Engine.GetDvarInt( "g_gameskill" )
	local f13_local1 = Engine.GetDvarBool( "g_specialistMode" )
	local f13_local2 = Engine.GetDvarBool( "g_yoloMode" )
	if f13_local0 == 0 or f13_local1 or f13_local2 then
		f13_arg0.ButtonDifficulty:SetButtonDisabled( true )
	end
	if f13_local2 then
		f13_arg0.ButtonCheckpoint:SetButtonDisabled( true )
		f13_arg0.ButtonRestart:SetButtonDisabled( true )
	end
	f13_arg0.ButtonDifficulty:addEventHandler( "button_action", f0_local7 )
	f13_arg0.ButtonCheckpoint:addEventHandler( "button_action", f0_local9 )
	f13_arg0.ButtonRestart:addEventHandler( "button_action", f0_local11 )
	f13_arg0.ButtonQuit:addEventHandler( "button_action", f0_local13 )
	if not CONDITIONS.IsInCredits() then
		assert( f13_arg0.DifficultyText )
		if f13_local2 then
			f13_arg0.DifficultyText:setText( Engine.Localize( f0_local2 ) )
		elseif f13_local1 then
			f13_arg0.DifficultyText:setText( Engine.Localize( f0_local1 ) )
		else
			f13_arg0.DifficultyText:setText( Engine.Localize( f0_local0[f13_local0 + 1] ) )
		end
		assert( f13_arg0.LastSaveDate )
		local self, f13_local4, f13_local5, f13_local6, f13_local7, f13_local8 = Engine.GetTimeOfLastSaveGame()
		local f13_local9 = ""
		local f13_local10 = nil
		if IsLanguageEnglish() then
			if f13_local5 > 11 then
				local f13_local11 = Engine.Localize( "LUA_MENU_TIME_PERIOD_PM" )
			end
			f13_local9 = f13_local11 or Engine.Localize( "LUA_MENU_TIME_PERIOD_AM" )
			f13_local10 = (f13_local5 + 11) % 12 + 1
		else
			f13_local10 = f13_local5
		end
		f13_arg0.LastSaveDate:setText( Engine.Localize( "LUA_MENU_LAST_SAVE_DATE", f13_local7, f13_local6, f13_local8, f13_local10, string.format( "%02d", f13_local4 ), f13_local9 ) )
		assert( f13_arg0.MissionTitle )
		local f13_local12 = Game.GetMapName()
		f13_arg0.MissionTitle:setText( Engine.Localize( Engine.TableLookup( CSV.levels.file, CSV.levels.cols.name, f13_local12, CSV.levels.cols.string ) ) )
		assert( f13_arg0.MissionObjectivesList )
		local f13_local13 = LUI.DataSourceInGlobalModel.new( "cg.SP.missionObjectives" )
		local f13_local14 = LUI.DataSourceFromList.new( f13_local13:GetDataSourceForSubmodel( "count" ) )
		f13_local14.MakeDataSourceAtIndex = function ( f14_arg0, f14_arg1, f14_arg2 )
			return {
				description = f13_local13:GetDataSourceForSubmodel( f14_arg1 .. ".description" ),
				isCompleted = f13_local13:GetDataSourceForSubmodel( f14_arg1 .. ".isCompleted" )
			}
		end
		
		f13_arg0.MissionObjectivesList:SetGridDataSource( f13_local14, f13_arg1 )
		assert( f13_arg0.Rewards )
		local f13_local15 = SPSharedUtils.GetLevelRewards( f13_local12 )
		for f13_local16 = 1, 4, 1 do
			local f13_local19 = f13_local15[f13_local16]
			local f13_local20 = f13_arg0.Rewards["Reward" .. f13_local16]
			assert( f13_local20 )
			if f13_local19 then
				assert( f13_local19.icon )
				assert( f13_local19.type )
				assert( f13_local19.value )
				assert( f13_local20.Icon )
				assert( f13_local20.Type )
				assert( f13_local20.Value )
				f13_local20.Icon:setImage( RegisterMaterial( f13_local19.icon ) )
				f13_local20.Type:setText( Engine.ToUpperCase( f13_local19.type ) )
				f13_local20.Value:setText( f13_local19.value )
				f13_local20:SetAlpha( 1 )
				f13_local20:SetTop( 0 )
				f13_local20:SetBottom( 24 * _1080p )
			else
				f13_local20:SetAlpha( 0 )
				f13_local20:SetTop( 0 )
				f13_local20:SetBottom( 0 )
			end
		end
		assert( f13_arg0.RewardsTitle )
		if #f13_local15 == 0 then
			f13_arg0.RewardsTitle:SetAlpha( 0 )
		end
	end
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f13_arg0:addElement( self )
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence( f13_arg0, "ReadsRightToLeft" )
	end
	if CONDITIONS.IsInCredits() then
		f13_arg0.ButtonDifficulty:SetButtonDisabled( true )
		f13_arg0.ButtonCheckpoint:SetButtonDisabled( true )
		f13_arg0.ButtonRestart:SetButtonDisabled( true )
	end
	local f13_local4 = Engine.GetLuiRoot()
	local f13_local5 = DataSources.inGame.SP.opsMap.active:GetValue( f13_arg1 )
	if not f13_local5 then
		f13_local5 = IsMenuInStack( f13_local4, "OpsMap" )
	end
	local f13_local6 = IsMenuInStack( f13_local4, "MostWantedCardsBoard" )
	local f13_local7 = IsMenuInStack( f13_local4, "CaptainsComputerMenu" )
	local f13_local8 = IsMenuInStack( f13_local4, "pre_game" )
	if f13_local8 or f13_local5 or f13_local6 or f13_local7 then
		f13_arg0.ButtonCheckpoint:SetButtonDisabled( true )
		f13_arg0.ButtonRestart:SetButtonDisabled( true )
	end
	if f13_local8 then
		f13_arg0.ButtonDifficulty:SetButtonDisabled( true )
	end
	if not Engine.CurrentMapHasSave() then
		f13_arg0.ButtonCheckpoint:SetButtonDisabled( true )
	end
end

function SPPauseMenu( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "SPPauseMenu"
	self._animationSets = {}
	self._sequences = {}
	local f15_local1 = controller and controller.controllerIndex
	if not f15_local1 and not Engine.InFrontend() then
		f15_local1 = self:getRootController()
	end
	assert( f15_local1 )
	self:playSound( "menu_open" )
	local f15_local2 = self
	local BackgroundMain = nil
	
	BackgroundMain = LUI.UIImage.new()
	BackgroundMain.id = "BackgroundMain"
	BackgroundMain:SetRGBFromInt( 0, 0 )
	BackgroundMain:SetAlpha( 0.4, 0 )
	BackgroundMain:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 5, _1080p * 5 )
	self:addElement( BackgroundMain )
	self.BackgroundMain = BackgroundMain
	
	local BackgroundBottomGradient = nil
	
	BackgroundBottomGradient = LUI.UIImage.new()
	BackgroundBottomGradient.id = "BackgroundBottomGradient"
	BackgroundBottomGradient:SetRGBFromInt( 0, 0 )
	BackgroundBottomGradient:SetAlpha( 0.8, 0 )
	BackgroundBottomGradient:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	BackgroundBottomGradient:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -285, _1080p * -85 )
	self:addElement( BackgroundBottomGradient )
	self.BackgroundBottomGradient = BackgroundBottomGradient
	
	local BackgroundTopGradient = nil
	
	BackgroundTopGradient = LUI.UIImage.new()
	BackgroundTopGradient.id = "BackgroundTopGradient"
	BackgroundTopGradient:SetRGBFromInt( 0, 0 )
	BackgroundTopGradient:SetAlpha( 0.8, 0 )
	BackgroundTopGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	BackgroundTopGradient:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 500 )
	self:addElement( BackgroundTopGradient )
	self.BackgroundTopGradient = BackgroundTopGradient
	
	local ButtonResume = nil
	
	ButtonResume = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f15_local1
	} )
	ButtonResume.id = "ButtonResume"
	ButtonResume.Text:setText( Engine.Localize( "LUA_MENU_RESUME_GAME" ), 0 )
	ButtonResume:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 271, _1080p * 301 )
	self:addElement( ButtonResume )
	self.ButtonResume = ButtonResume
	
	local ButtonOptions = nil
	
	ButtonOptions = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f15_local1
	} )
	ButtonOptions.id = "ButtonOptions"
	ButtonOptions.Text:setText( Engine.Localize( "LUA_MENU_OPTIONS" ), 0 )
	ButtonOptions:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 311, _1080p * 341 )
	self:addElement( ButtonOptions )
	self.ButtonOptions = ButtonOptions
	
	local ButtonDifficulty = nil
	
	ButtonDifficulty = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f15_local1
	} )
	ButtonDifficulty.id = "ButtonDifficulty"
	ButtonDifficulty.Text:setText( Engine.Localize( "LUA_MENU_LOWER_DIFFICULTY" ), 0 )
	ButtonDifficulty:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 351, _1080p * 381 )
	self:addElement( ButtonDifficulty )
	self.ButtonDifficulty = ButtonDifficulty
	
	local ButtonCheckpoint = nil
	
	ButtonCheckpoint = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f15_local1
	} )
	ButtonCheckpoint.id = "ButtonCheckpoint"
	ButtonCheckpoint.Text:setText( Engine.Localize( "LUA_MENU_LAST_CHECKPOINT" ), 0 )
	ButtonCheckpoint:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 391, _1080p * 421 )
	self:addElement( ButtonCheckpoint )
	self.ButtonCheckpoint = ButtonCheckpoint
	
	local ButtonRestart = nil
	
	ButtonRestart = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f15_local1
	} )
	ButtonRestart.id = "ButtonRestart"
	ButtonRestart.Text:setText( Engine.Localize( "LUA_MENU_RESTART_MISSION" ), 0 )
	ButtonRestart:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 431, _1080p * 461 )
	self:addElement( ButtonRestart )
	self.ButtonRestart = ButtonRestart
	
	local ButtonQuit = nil
	
	ButtonQuit = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f15_local1
	} )
	ButtonQuit.id = "ButtonQuit"
	ButtonQuit.Text:setText( Engine.Localize( "LUA_MENU_QUIT" ), 0 )
	ButtonQuit:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 471, _1080p * 501 )
	ButtonQuit:SubscribeToModel( DataSources.inGame.SP.savingCheckpoint:GetModel( f15_local1 ), function ()
		local f16_local0 = DataSources.inGame.SP.savingCheckpoint:GetValue( f15_local1 )
		if f16_local0 ~= nil then
			ButtonQuit:SetButtonDisabled( f16_local0 )
		end
	end )
	self:addElement( ButtonQuit )
	self.ButtonQuit = ButtonQuit
	
	local ButtonHelperBack = nil
	
	ButtonHelperBack = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f15_local1
	} )
	ButtonHelperBack.id = "ButtonHelperBack"
	ButtonHelperBack:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBack )
	self.ButtonHelperBack = ButtonHelperBack
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f15_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_PAUSED_CAPS" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_CAMPAIGN" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -10, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 80, 0 )
	MenuTitle.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local f15_local14 = nil
	if not CONDITIONS.IsInCredits( self ) then
		f15_local14 = LUI.UIImage.new()
		f15_local14.id = "DividerLeft"
		f15_local14:SetRGBFromInt( 10921638, 0 )
		f15_local14:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 639.5, _1080p * 640.5, _1080p * 154, _1080p * -122 )
		self:addElement( f15_local14 )
		self.DividerLeft = f15_local14
	end
	local f15_local15 = nil
	if not CONDITIONS.IsInCredits( self ) then
		f15_local15 = MenuBuilder.BuildRegisteredType( "PauseCurrentStats", {
			controllerIndex = f15_local1
		} )
		f15_local15.id = "PauseCurrentStats"
		f15_local15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 779, _1080p * 1849, _1080p * 23, _1080p * 154 )
		self:addElement( f15_local15 )
		self.PauseCurrentStats = f15_local15
	end
	local f15_local16 = nil
	if not CONDITIONS.IsInCredits( self ) then
		f15_local16 = LUI.UIStyledText.new()
		f15_local16.id = "LastSave"
		f15_local16:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
		f15_local16:setText( ToUpperCase( Engine.Localize( "LUA_MENU_LAST_SAVE_TEXT" ) ), 0 )
		f15_local16:SetFontSize( 24 * _1080p )
		f15_local16:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f15_local16:SetAlignment( LUI.Alignment.Left )
		f15_local16:SetOptOutRightToLeftAlignmentFlip( true )
		f15_local16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 480, _1080p * 854, _1080p * 878 )
		self:addElement( f15_local16 )
		self.LastSave = f15_local16
	end
	local f15_local17 = nil
	if not CONDITIONS.IsInCredits( self ) then
		f15_local17 = LUI.UIStyledText.new()
		f15_local17.id = "LastSaveDate"
		f15_local17:setText( "6/27/2016 3:33pm", 0 )
		f15_local17:SetFontSize( 24 * _1080p )
		f15_local17:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f15_local17:SetAlignment( LUI.Alignment.Left )
		f15_local17:SetOptOutRightToLeftAlignmentFlip( true )
		f15_local17:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 480, _1080p * 878, _1080p * 902 )
		self:addElement( f15_local17 )
		self.LastSaveDate = f15_local17
	end
	local f15_local18 = nil
	if not CONDITIONS.IsInCredits( self ) then
		f15_local18 = LUI.UIStyledText.new()
		f15_local18.id = "Difficulty"
		f15_local18:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
		f15_local18:setText( Engine.Localize( "LUA_MENU_PAUSE_DIFFICULTY" ), 0 )
		f15_local18:SetFontSize( 24 * _1080p )
		f15_local18:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f15_local18:SetAlignment( LUI.Alignment.Left )
		f15_local18:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 670.5, _1080p * 807.5, _1080p * 190, _1080p * 214 )
		self:addElement( f15_local18 )
		self.Difficulty = f15_local18
	end
	local f15_local19 = nil
	if not CONDITIONS.IsInCredits( self ) then
		f15_local19 = LUI.UIStyledText.new()
		f15_local19.id = "DifficultyText"
		f15_local19:setText( "Recruit", 0 )
		f15_local19:SetFontSize( 24 * _1080p )
		f15_local19:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f15_local19:SetAlignment( LUI.Alignment.Left )
		f15_local19:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 811, _1080p * 1130, _1080p * 190, _1080p * 214 )
		self:addElement( f15_local19 )
		self.DifficultyText = f15_local19
	end
	local f15_local20 = nil
	if not CONDITIONS.IsInCredits( self ) then
		f15_local20 = LUI.UIStyledText.new()
		f15_local20.id = "MissionTitle"
		f15_local20:setText( Engine.Localize( "MENU_NEW" ), 0 )
		f15_local20:SetFontSize( 28 * _1080p )
		f15_local20:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f15_local20:SetAlignment( LUI.Alignment.Left )
		f15_local20:SetStartupDelay( 2000 )
		f15_local20:SetLineHoldTime( 750 )
		f15_local20:SetAnimMoveTime( 1000 )
		f15_local20:SetEndDelay( 1500 )
		f15_local20:SetCrossfadeTime( 750 )
		f15_local20:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f15_local20:SetMaxVisibleLines( 1 )
		f15_local20:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 670.5, _1080p * 1249.5, _1080p * 155, _1080p * 183 )
		self:addElement( f15_local20 )
		self.MissionTitle = f15_local20
	end
	local f15_local21 = nil
	if not CONDITIONS.IsInCredits( self ) then
		f15_local21 = LUI.UIDataSourceGrid.new( nil, {
			maxVisibleColumns = 1,
			maxVisibleRows = 8,
			controllerIndex = f15_local1,
			buildChild = function ()
				return MenuBuilder.BuildRegisteredType( "SPPauseMissionObjective", {
					controllerIndex = f15_local1
				} )
			end,
			wrapX = true,
			wrapY = true,
			spacingX = _1080p * 30,
			spacingY = _1080p * 30,
			columnWidth = _1080p * 512,
			rowHeight = _1080p * 28,
			scrollingThresholdX = 1,
			scrollingThresholdY = 1,
			adjustSizeToContent = false,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top,
			springCoefficient = 400,
			maxVelocity = 5000
		} )
		f15_local21.id = "MissionObjectivesList"
		f15_local21:setUseStencil( true )
		f15_local21:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 700.5, _1080p * 1212.5, _1080p * 250, _1080p * 723 )
		self:addElement( f15_local21 )
		self.MissionObjectivesList = f15_local21
	end
	local f15_local22 = nil
	if not CONDITIONS.IsInCredits( self ) then
		f15_local22 = LUI.UIImage.new()
		f15_local22.id = "DividerRight"
		f15_local22:SetRGBFromInt( 10921638, 0 )
		f15_local22:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -640.5, _1080p * -639.5, _1080p * 154, _1080p * -122 )
		self:addElement( f15_local22 )
		self.DividerRight = f15_local22
	end
	local f15_local23 = nil
	if not CONDITIONS.IsInCredits( self ) then
		f15_local23 = MenuBuilder.BuildRegisteredType( "SPLoadoutPerkGrid", {
			controllerIndex = f15_local1
		} )
		f15_local23.id = "PerkGrid"
		f15_local23.ListBlur:SetAlpha( 0, 0 )
		f15_local23:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1309.5, _1080p * 1824, _1080p * 159, _1080p * 902 )
		self:addElement( f15_local23 )
		self.PerkGrid = f15_local23
	end
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f15_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f15_local25 = nil
	if not CONDITIONS.IsInCredits( self ) then
		f15_local25 = LUI.UIText.new()
		f15_local25.id = "RewardsTitle"
		f15_local25:SetRGBFromTable( SWATCHES.genericButton.textDisabled, 0 )
		f15_local25:setText( Engine.Localize( "LUA_MENU_REWARD_PLURAL" ), 0 )
		f15_local25:SetFontSize( 28 * _1080p )
		f15_local25:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f15_local25:SetAlignment( LUI.Alignment.Left )
		f15_local25:SetOptOutRightToLeftAlignmentFlip( true )
		f15_local25:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 700.5, _1080p * -700.5, _1080p * 734, _1080p * 762 )
		self:addElement( f15_local25 )
		self.RewardsTitle = f15_local25
	end
	local f15_local26 = nil
	if not CONDITIONS.IsInCredits( self ) then
		f15_local26 = MenuBuilder.BuildRegisteredType( "MissionPopupRewards", {
			controllerIndex = f15_local1
		} )
		f15_local26.id = "Rewards"
		f15_local26:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 700.5, _1080p * -700.5, _1080p * 770, _1080p * 902 )
		self:addElement( f15_local26 )
		self.Rewards = f15_local26
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if not CONDITIONS.IsInCredits( self ) then
			f15_local18:RegisterAnimationSequence( "ReadsRightToLeft", {
				{
					function ()
						return self.Difficulty:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1164.5, _1080p * 1249.5, _1080p * 190, _1080p * 214, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.IsInCredits( self ) then
			f15_local19:RegisterAnimationSequence( "ReadsRightToLeft", {
				{
					function ()
						return self.DifficultyText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 845.5, _1080p * 1164.5, _1080p * 190, _1080p * 214, 0 )
					end
				}
			} )
		end
		self._sequences.ReadsRightToLeft = function ()
			if not CONDITIONS.IsInCredits( self ) then
				f15_local18:AnimateSequence( "ReadsRightToLeft" )
			end
			if not CONDITIONS.IsInCredits( self ) then
				f15_local19:AnimateSequence( "ReadsRightToLeft" )
			end
		end
		
		BackgroundMain:RegisterAnimationSequence( "MenuOn", {
			{
				function ()
					return self.BackgroundMain:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BackgroundMain:SetAlpha( 0.3, 100, LUI.EASING.inSine )
				end
			}
		} )
		BackgroundBottomGradient:RegisterAnimationSequence( "MenuOn", {
			{
				function ()
					return self.BackgroundBottomGradient:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BackgroundBottomGradient:SetAlpha( 0.8, 300, LUI.EASING.inSine )
				end
			}
		} )
		BackgroundTopGradient:RegisterAnimationSequence( "MenuOn", {
			{
				function ()
					return self.BackgroundTopGradient:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BackgroundTopGradient:SetAlpha( 0.8, 300, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.MenuOn = function ()
			BackgroundMain:AnimateSequence( "MenuOn" )
			BackgroundBottomGradient:AnimateSequence( "MenuOn" )
			BackgroundTopGradient:AnimateSequence( "MenuOn" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ButtonResume:addEventHandler( "button_action", function ( f30_arg0, f30_arg1 )
		local f30_local0 = f30_arg1.controller or f15_local1
		ACTIONS.ResumeGame( self )
		ACTIONS.LeaveMenu( self )
	end )
	ButtonOptions:addEventHandler( "button_action", function ( f31_arg0, f31_arg1 )
		ACTIONS.OpenMenu( "OptionsMenu", true, f31_arg1.controller or f15_local1 )
	end )
	if not CONDITIONS.IsInCredits( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Reward1",
			sequenceName = "LevelSelect",
			elementPath = "Rewards.Reward1"
		} )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Reward2",
			sequenceName = "LevelSelect",
			elementPath = "Rewards.Reward2"
		} )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Reward3",
			sequenceName = "LevelSelect",
			elementPath = "Rewards.Reward3"
		} )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Reward4",
			sequenceName = "LevelSelect",
			elementPath = "Rewards.Reward4"
		} )
	end
	self.addButtonHelperFunction = function ( f32_arg0, f32_arg1 )
		f32_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f33_arg0, f33_arg1 )
		local f33_local0 = f33_arg1.controller or f15_local1
		ACTIONS.ResumeGame( self )
		ACTIONS.LeaveMenu( self )
		return true
	end )
	self.bindButton:addEventHandler( "button_start", function ( f34_arg0, f34_arg1 )
		local f34_local0 = f34_arg1.controller or f15_local1
		ACTIONS.ResumeGame( self )
		ACTIONS.LeaveMenu( self )
		return true
	end )
	f0_local14( self, f15_local1, controller )
	ACTIONS.AnimateSequence( self, "MenuOn" )
	return self
end

MenuBuilder.registerType( "SPPauseMenu", SPPauseMenu )
LockTable( _M )
