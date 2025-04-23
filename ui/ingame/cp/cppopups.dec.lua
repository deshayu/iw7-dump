local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function RetryGamePopup()
	local self = LUI.UIElement.new()
	self.id = "retry_game_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = -50,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	MenuBuilder.BuildAddChild( self, {
		type = "generic_yesno_popup",
		id = "publicGame_options_list_id",
		properties = {
			message_text_alignment = LUI.Alignment.Center,
			message_text = Engine.Localize( "@CP_GENERAL_RETRY_GAME_DESC" ),
			default_focus_index = 1,
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			padding_top = 12,
			yes_action = function ( f2_arg0, f2_arg1 )
				Engine.NotifyServer( "retry_level", 1 )
			end,
			no_action = function ( f3_arg0, f3_arg1 )
				local f3_local0 = 10
				local f3_local1 = 300
				for f3_local2 = 0, Engine.GetMaxControllerCount() - 1, 1 do
					if Engine.HasActiveLocalClient( f3_local2 ) then
						Rewards.EndZombies( f3_local2, f3_local0, f3_local1 )
					end
				end
				Engine.NotifyServer( "quit_level", 1 )
			end
		}
	} )
	local f1_local1 = LUI.UIBindButton.new()
	f1_local1.id = "leaveBackToGameStartButton"
	f1_local1:registerEventHandler( "button_start", CloseThisMenu )
	self:addElement( f1_local1 )
	return self
end

function menu_reset_tutorial_warning( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "popup_reset_tutorial_id"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = -50,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	MenuBuilder.BuildAddChild( self, {
		type = "generic_yesno_popup",
		id = "reset_tutorial_list_id",
		properties = {
			message_text_alignment = LUI.Alignment.Center,
			message_text = Engine.Localize( "@ZM_TUTORIALS_RESET_TUTORIAL_TEXT" ),
			default_focus_index = 1,
			popup_title = Engine.Localize( "@ZM_TUTORIALS_RESET_TUTORIALS" ),
			padding_top = 12,
			yes_text = Engine.Localize( "@LUA_MENU_YES" ),
			no_text = Engine.Localize( "@LUA_MENU_NO" ),
			yes_action = function ( f5_arg0, f5_arg1 )
				ACTIONS.ZombieResetTutorial( f5_arg0, controller.controllerIndex )
			end,
			no_action = function ( f6_arg0, f6_arg1 )
				LUI.FlowManager.RequestLeaveMenu( f6_arg0 )
			end
		}
	} )
	local f4_local1 = LUI.UIBindButton.new()
	f4_local1.id = "resetTutorial"
	f4_local1:registerEventHandler( "button_start", CloseThisMenu )
	self:addElement( f4_local1 )
	return self
end

function ResetTutorialConfirm( f7_arg0, f7_arg1 )
	ACTIONS.ZombieResetTutorial( f7_arg0, controllerIndex )
end

MenuBuilder.registerType( "RetryGamePopup", RetryGamePopup )
MenuBuilder.registerType( "menu_reset_tutorial_warning", menu_reset_tutorial_warning )
LockTable( _M )
