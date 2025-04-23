local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPPauseMenuButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 504 * _1080p, 0, 117 * _1080p )
	self.id = "CPPauseMenuButtons"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:SetSpacing( 10 * _1080p )
	local PublicMatch = nil
	
	PublicMatch = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f1_local1
	} )
	PublicMatch.id = "PublicMatch"
	PublicMatch.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ) ), 0 )
	PublicMatch:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, 0, _1080p * 30 )
	self:addElement( PublicMatch )
	self.PublicMatch = PublicMatch
	
	local f1_local4 = nil
	if CONDITIONS.ShouldShowTips( self ) then
		f1_local4 = MenuBuilder.BuildRegisteredType( "MenuButton", {
			controllerIndex = f1_local1
		} )
		f1_local4.id = "Tips"
		if CONDITIONS.ShouldShowTips( self ) then
			
		else
			
		end
		if CONDITIONS.ShouldShowTips( self ) then
			
		else
			
		end
		f1_local4.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ZOMBIES_TUTORIAL" ) ), 0 )
		f1_local4:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 40, _1080p * 70 )
		self:addElement( f1_local4 )
		self.Tips = f1_local4
	end
	local LeaveGame = nil
	
	LeaveGame = MenuBuilder.BuildRegisteredType( "MenuButton", {
		controllerIndex = f1_local1
	} )
	LeaveGame.id = "LeaveGame"
	LeaveGame.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_END_GAME_CAPS" ) ), 0 )
	LeaveGame:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, _1080p * 80, _1080p * 110 )
	self:addElement( LeaveGame )
	self.LeaveGame = LeaveGame
	
	PublicMatch:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		ACTIONS.OpenMenu( "OptionsMenu", true, f2_arg1.controller or f1_local1 )
	end )
	if CONDITIONS.ShouldShowTips( self ) then
		f1_local4:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
			ACTIONS.OpenMenu( "TutorialMenu", true, f3_arg1.controller or f1_local1 )
		end )
	end
	LeaveGame:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or f1_local1
		if CONDITIONS.IsMatchMakingGame( self ) then
			ACTIONS.OpenPopupMenu( self, "popup_leave_game", true, f4_local0 )
		end
		if not CONDITIONS.IsMatchMakingGame( self ) then
			ACTIONS.OpenPopupMenu( self, "popup_end_game", true, f4_local0 )
		end
	end )
	return self
end

MenuBuilder.registerType( "CPPauseMenuButtons", CPPauseMenuButtons )
LockTable( _M )
