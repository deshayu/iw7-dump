local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ChooseTeam( f1_arg0 )
	return function ( f2_arg0, f2_arg1 )
		Engine.NotifyServer( "team_select", f2_arg0.TeamSelection )
		if f1_arg0.CodcasterButton ~= nil then
			if f2_arg0.TeamSelection == f1_arg0.CodcasterButton.TeamSelection then
				LobbyMember.SelectedMember_SetLocalMemberMLGSpectator( true, f1_arg0.controllerIndex )
			else
				LobbyMember.SelectedMember_SetLocalMemberMLGSpectator( false, f1_arg0.controllerIndex )
			end
		end
		local f2_local0 = f2_arg0.TeamSelection <= 2
		if f2_local0 then
			local f2_local1 = Game.GetOmnvar( "ui_skip_loadout" )
			local f2_local2 = Engine.GetDvarString( "ui_gametype" )
			assert( f2_local2 and f2_local2 ~= "" )
			local f2_local3 = Engine.TableLookup( CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, f2_local2, CSV.gameTypesTable.cols.classChoice )
			assert( f2_local3 and f2_local3 ~= "" )
			f2_local3 = tonumber( f2_local3 ) == 1
			if not f2_local1 then
				f2_local0 = f2_local3
			else
				f2_local0 = false
			end
		end
		if f2_local0 then
			LUI.FlowManager.RequestAddMenu( "InGameLoadoutSelect", true, f1_arg0.controllerIndex, false, false, true )
		else
			LUI.FlowManager.RequestCloseAllMenus()
		end
	end
	
end

function PostLoadFunc( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.AutoAssignButton )
	assert( f3_arg0.UNSAButton )
	assert( f3_arg0.SDFButton )
	f3_arg0.controllerIndex = f3_arg1
	f3_arg0.AutoAssignButton.TeamSelection = 2
	f3_arg0.AutoAssignButton:addEventHandler( "button_action", ChooseTeam( f3_arg0 ) )
	if CONDITIONS.IsTeamChoiceAllowed() then
		f3_arg0.UNSAButton.TeamSelection = 1
		f3_arg0.UNSAButton:addEventHandler( "button_action", ChooseTeam( f3_arg0 ) )
		f3_arg0.SDFButton.TeamSelection = 0
		f3_arg0.SDFButton:addEventHandler( "button_action", ChooseTeam( f3_arg0 ) )
	else
		f3_arg0.UNSAButton:close()
		f3_arg0.SDFButton:close()
	end
	if f3_arg0.SpectateButton ~= nil then
		f3_arg0.SpectateButton.TeamSelection = 3
		f3_arg0.SpectateButton:addEventHandler( "button_action", ChooseTeam( f3_arg0 ) )
	end
	if CODCASTER.CanCODCast() then
		f3_arg0.CodcasterButton.TeamSelection = 4
		f3_arg0.CodcasterButton:addEventHandler( "button_action", ChooseTeam( f3_arg0 ) )
	elseif f3_arg0.CodcasterButton then
		f3_arg0.CodcasterButton:close()
		f3_arg0.CodcasterButton = nil
	end
	local f3_local0 = Game.GetPlayerTeam()
	if f3_local0 == Teams.allies then
		f3_arg0.UNSAButton.listDefaultFocus = 0
		f3_arg0.UNSAButton:processEvent( {
			name = "become_current_team_button"
		} )
	elseif f3_local0 == Teams.axis then
		f3_arg0.SDFButton.listDefaultFocus = 0
		f3_arg0.SDFButton:processEvent( {
			name = "become_current_team_button"
		} )
	elseif CODCASTER.IsCODCaster() then
		if f3_arg0.CodcasterButton ~= nil then
			f3_arg0.CodcasterButton.listDefaultFocus = 0
		end
	elseif 1 == Game.GetOmnvar( "ui_spectator_selected" ) and f3_arg0.SpectateButton ~= nil then
		f3_arg0.SpectateButton.listDefaultFocus = 0
	end
	if GameX.gameModeIsFFA() then
		f3_arg0.SpectateButton:close()
	end
end

function TeamSelectMenuButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 280 * _1080p )
	self.id = "TeamSelectMenuButtons"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	self:SetSpacing( 10 * _1080p )
	local f4_local3 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f4_local3 = MenuBuilder.BuildRegisteredType( "TeamSelectButton", {
			controllerIndex = f4_local1
		} )
		f4_local3.id = "AutoAssignButton"
		f4_local3.Button.Text:setText( ToUpperCase( Engine.Localize( "LUA_MENU_AUTOASSIGN_CAPS" ) ), 0 )
		f4_local3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 30 )
		self:addElement( f4_local3 )
		self.AutoAssignButton = f4_local3
	end
	local UNSAButton = nil
	
	UNSAButton = MenuBuilder.BuildRegisteredType( "TeamSelectButton", {
		controllerIndex = f4_local1
	} )
	UNSAButton.id = "UNSAButton"
	UNSAButton.Button.Text:setText( ToUpperCase( Engine.Localize( "MENU_FACTION_UNSA_SHORT" ) ), 0 )
	UNSAButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 40, _1080p * 70 )
	self:addElement( UNSAButton )
	self.UNSAButton = UNSAButton
	
	local SDFButton = nil
	
	SDFButton = MenuBuilder.BuildRegisteredType( "TeamSelectButton", {
		controllerIndex = f4_local1
	} )
	SDFButton.id = "SDFButton"
	SDFButton.Button.Text:setText( ToUpperCase( Engine.Localize( "MENU_FACTION_SDF_SHORT" ) ), 0 )
	SDFButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 80, _1080p * 110 )
	self:addElement( SDFButton )
	self.SDFButton = SDFButton
	
	local f4_local6 = nil
	if CONDITIONS.IsAllowedToSpectate( self, f4_local1 ) then
		f4_local6 = MenuBuilder.BuildRegisteredType( "TeamSelectButton", {
			controllerIndex = f4_local1
		} )
		f4_local6.id = "SpectateButton"
		f4_local6.Button.Text:setText( ToUpperCase( Engine.Localize( "MENU_SPECTATE_CAPS" ) ), 0 )
		f4_local6:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 120, _1080p * 150 )
		self:addElement( f4_local6 )
		self.SpectateButton = f4_local6
	end
	local f4_local7 = nil
	if CONDITIONS.IsTeamOrCodcasterChoiceAllowed( self ) then
		f4_local7 = MenuBuilder.BuildRegisteredType( "TeamSelectButton", {
			controllerIndex = f4_local1
		} )
		f4_local7.id = "CodcasterButton"
		f4_local7.Button.Text:setText( ToUpperCase( Engine.Localize( "CODCASTER_CAPS" ) ), 0 )
		f4_local7:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 160, _1080p * 190 )
		self:addElement( f4_local7 )
		self.CodcasterButton = f4_local7
	end
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "TeamSelectMenuButtons", TeamSelectMenuButtons )
LockTable( _M )
