local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = function ()
		table.insert( MP.LoadoutSelectAttempts, Engine.GetMilliseconds() )
		if #MP.LoadoutSelectAttempts > 3 then
			table.remove( MP.LoadoutSelectAttempts, 1 )
		end
		local f2_local0 = Engine.GetMilliseconds() - 1000
		local f2_local1 = 0
		for f2_local2 = 1, 3, 1 do
			if f2_local0 < MP.LoadoutSelectAttempts[f2_local2] then
				f2_local1 = f2_local1 + 1
			end
		end
		if f2_local1 > 3 then
			return false
		else
			return true
		end
	end
	
	if CONDITIONS.IsClassChoiceAllowed( f1_arg0 ) then
		assert( f1_arg0.ChangeLoadoutButton )
		f1_arg0.ChangeLoadoutButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
			if f1_local0() then
				ACTIONS.OpenMenu( "InGameLoadoutSelect", true, f1_arg1 )
			end
		end )
		if CONDITIONS.IsCODCaster() then
			f1_arg0.ChangeLoadoutButton:close()
		end
	end
	if CONDITIONS.IsSplitscreen() and GameX.gameModeIsFFA() then
		f1_arg0.OptionsButton:close()
		f1_arg0.LeaveGameButton:close()
		local ChangeTeamButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f1_arg1
		} )
		ChangeTeamButton.id = "ChangeTeamButton"
		ChangeTeamButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CHANGE_TEAM_CAPS" ) ), 0 )
		ChangeTeamButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 40, _1080p * 70 )
		f1_arg0:addElement( ChangeTeamButton )
		f1_arg0.ChangeTeamButton = ChangeTeamButton
		
		f1_arg0.ChangeTeamButton:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
			ACTIONS.OpenMenu( "TeamSelectMenu", true, f4_arg1.controller or f1_arg1 )
		end )
		f1_arg0:addElement( f1_arg0.OptionsButton )
		f1_arg0:addElement( f1_arg0.LeaveGameButton )
	end
	if CONDITIONS.IsTeamOrCodcasterChoiceAllowed( f1_arg0 ) then
		assert( f1_arg0.ChangeTeamButton )
		local ChangeTeamButton = Engine.GetDvarString( "ui_gametype" )
		if MatchRules.IsUsingMatchRulesData() then
			ChangeTeamButton = MatchRules.GetData( "gametype" )
		end
		if MLG.AreMLGRulesEnabled() or ChangeTeamButton == MP.GameMode.InfectGameType then
			f1_arg0.ChangeTeamButton:close()
		end
	end
end

function PauseMenuButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 278 * _1080p )
	self.id = "PauseMenuButtons"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	self:SetSpacing( 10 * _1080p )
	local f5_local3 = nil
	if CONDITIONS.IsClassChoiceAllowed( self ) then
		f5_local3 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f5_local1
		} )
		f5_local3.id = "ChangeLoadoutButton"
		if CONDITIONS.IsClassChoiceAllowed( self ) then
			
		else
			
		end
		if CONDITIONS.IsClassChoiceAllowed( self ) then
			
		else
			
		end
		f5_local3.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CHOOSE_CLASS_CAPS" ) ), 0 )
		f5_local3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 30 )
		self:addElement( f5_local3 )
		self.ChangeLoadoutButton = f5_local3
	end
	local f5_local4 = nil
	if CONDITIONS.IsTeamOrCodcasterChoiceAllowed( self ) then
		f5_local4 = MenuBuilder.BuildRegisteredType( "GenericButton", {
			controllerIndex = f5_local1
		} )
		f5_local4.id = "ChangeTeamButton"
		if CONDITIONS.IsTeamOrCodcasterChoiceAllowed( self ) then
			
		else
			
		end
		if CONDITIONS.IsTeamOrCodcasterChoiceAllowed( self ) then
			
		else
			
		end
		f5_local4.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CHANGE_TEAM_CAPS" ) ), 0 )
		f5_local4:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 40, _1080p * 70 )
		self:addElement( f5_local4 )
		self.ChangeTeamButton = f5_local4
	end
	local OptionsButton = nil
	
	OptionsButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f5_local1
	} )
	OptionsButton.id = "OptionsButton"
	OptionsButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ) ), 0 )
	OptionsButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 80, _1080p * 110 )
	self:addElement( OptionsButton )
	self.OptionsButton = OptionsButton
	
	local LeaveGameButton = nil
	
	LeaveGameButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f5_local1
	} )
	LeaveGameButton.id = "LeaveGameButton"
	LeaveGameButton.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_END_GAME_CAPS" ) ), 0 )
	LeaveGameButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 120, _1080p * 150 )
	self:addElement( LeaveGameButton )
	self.LeaveGameButton = LeaveGameButton
	
	if CONDITIONS.IsTeamOrCodcasterChoiceAllowed( self ) then
		f5_local4:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
			ACTIONS.OpenMenu( "TeamSelectMenu", true, f6_arg1.controller or f5_local1 )
		end )
	end
	OptionsButton:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		ACTIONS.OpenMenu( "OptionsMenu", true, f7_arg1.controller or f5_local1 )
	end )
	LeaveGameButton:addEventHandler( "button_action", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f5_local1
		if CONDITIONS.IsMatchMakingGame( self ) then
			ACTIONS.OpenPopupMenu( self, "popup_leave_game", true, f8_local0 )
		end
		if not CONDITIONS.IsMatchMakingGame( self ) then
			ACTIONS.OpenPopupMenu( self, "popup_end_game", true, f8_local0 )
		end
	end )
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "PauseMenuButtons", PauseMenuButtons )
LockTable( _M )
