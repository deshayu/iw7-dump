MenuBuilder.registerType( "VRPauseMenu", function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1.controllerIndex
	local f1_local1 = function ()
		Engine.Unpause()
		LUI.FlowManager.RequestCloseAllMenus()
	end
	
	LUI.UIRoot.BlockButtonInput( Engine.GetLuiRoot(), false, "VRPauseMenu" )
	local f1_local2 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", {
		title = Engine.Localize( "MENU_VR_COMBAT_SIM" ),
		width = 400,
		message = "",
		defaultFocusIndex = 1,
		controllerIndex = f1_arg1.controllerIndex,
		cancelAction = f1_local1,
		consumeCancelInput = true,
		buttonsClosePopup = false,
		buttons = {
			{
				label = Engine.Localize( "MENU_RESUME" ),
				action = f1_local1
			},
			{
				label = Engine.Localize( "MENU_RESTART_VR" ),
				action = function ( f3_arg0, f3_arg1 )
					Engine.Unpause()
					Engine.NotifyServer( "player_vr_reset_request", 1 )
					LUI.UIRoot.BlockButtonInput( Engine.GetLuiRoot(), true, "VRPauseMenu" )
				end
			},
			{
				label = Engine.Localize( "MENU_QUIT_CAPS" ),
				action = function ( f4_arg0, f4_arg1 )
					Engine.Unpause()
					Engine.NotifyServer( "player_vr_exit_request", 1 )
					LUI.UIRoot.BlockButtonInput( Engine.GetLuiRoot(), true, "VRPauseMenu" )
				end
			}
		}
	} )
	f1_local2.id = "VRPauseMenu"
	f1_local2:registerOmnvarHandler( "ui_close_vr_pause_menu", function ( f5_arg0, f5_arg1 )
		if f5_arg1.value then
			LUI.FlowManager.RequestLeaveMenu( f5_arg0, true )
		end
	end )
	local self = LUI.UIBindButton.new()
	self.id = "bindButton"
	self:addEventHandler( "button_start", function ( f6_arg0, f6_arg1 )
		f1_local1()
	end )
	f1_local2.bindButton = self
	f1_local2:addElement( self )
	return f1_local2
end )
