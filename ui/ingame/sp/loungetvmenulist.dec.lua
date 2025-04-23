local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LoungeTVMenuList( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 360 * _1080p, 0, 198 * _1080p )
	self.id = "LoungeTVMenuList"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:setUseStencil( true )
	local SwapViewButton = nil
	
	SwapViewButton = MenuBuilder.BuildRegisteredType( "LoungeTVMenuButton", {
		controllerIndex = f1_local1
	} )
	SwapViewButton.id = "SwapViewButton"
	SwapViewButton.Text:setText( LocalizeString( ToUpperCase( Engine.Localize( "SHIPCRIB_REMOTE_CHANGEVIDEO" ) ) ), 0 )
	SwapViewButton:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 60 )
	self:addElement( SwapViewButton )
	self.SwapViewButton = SwapViewButton
	
	local BroadcastButton = nil
	
	BroadcastButton = MenuBuilder.BuildRegisteredType( "LoungeTVMenuButton", {
		controllerIndex = f1_local1
	} )
	BroadcastButton.id = "BroadcastButton"
	BroadcastButton.Text:setText( LocalizeString( ToUpperCase( Engine.Localize( "SHIPCRIB_REMOTE_RECENTBROADCAST" ) ) ), 0 )
	BroadcastButton:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -30, _1080p * 30 )
	self:addElement( BroadcastButton )
	self.BroadcastButton = BroadcastButton
	
	local ExitButton = nil
	
	ExitButton = MenuBuilder.BuildRegisteredType( "LoungeTVMenuButton", {
		controllerIndex = f1_local1
	} )
	ExitButton.id = "ExitButton"
	ExitButton.Text:setText( LocalizeString( ToUpperCase( Engine.Localize( "SHIPCRIB_REMOTE_EXITVIEWER" ) ) ), 0 )
	ExitButton:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -60, 0 )
	self:addElement( ExitButton )
	self.ExitButton = ExitButton
	
	SwapViewButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.controller or f1_local1
		ACTIONS.ScriptNotify( "change_view", 1 )
	end )
	BroadcastButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f1_local1
		ACTIONS.ScriptNotify( "play_broadcast", 1 )
	end )
	ExitButton:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or f1_local1
		ACTIONS.ScriptNotify( "lounge_viewer_exit", 1 )
		ACTIONS.CloseAllMenus( self )
	end )
	return self
end

MenuBuilder.registerType( "LoungeTVMenuList", LoungeTVMenuList )
LockTable( _M )
