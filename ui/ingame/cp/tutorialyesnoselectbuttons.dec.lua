local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function tutorialYesNoSelectButtons( menu, controller )
	local self = LUI.UIVerticalList.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 479 * _1080p, 0, 60 * _1080p )
	self.id = "tutorialYesNoSelectButtons"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local tutorialYesButton = nil
	
	tutorialYesButton = MenuBuilder.BuildRegisteredType( "tutorialYesButton", {
		controllerIndex = f1_local1
	} )
	tutorialYesButton.id = "tutorialYesButton"
	tutorialYesButton.ButtonBacking:SetRGBFromInt( 16777215, 0 )
	tutorialYesButton.ButtonText:setText( Engine.Localize( "LUA_MENU_MP_YES" ), 0 )
	tutorialYesButton:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( tutorialYesButton )
	self.tutorialYesButton = tutorialYesButton
	
	local tutorialNoButton = nil
	
	tutorialNoButton = MenuBuilder.BuildRegisteredType( "tutorialYesButton", {
		controllerIndex = f1_local1
	} )
	tutorialNoButton.id = "tutorialNoButton"
	tutorialNoButton.ButtonText:setText( Engine.Localize( "LUA_MENU_MP_NO" ), 0 )
	tutorialNoButton:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 30, _1080p * 60 )
	self:addElement( tutorialNoButton )
	self.tutorialNoButton = tutorialNoButton
	
	tutorialYesButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		ACTIONS.TurnOnTutorial( self, f2_arg1.controller or f1_local1 )
		ACTIONS.ZombieTutorialResumeGame( self )
		ACTIONS.LeaveMenu( self )
	end )
	tutorialNoButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		ACTIONS.TurnOffTutorial( self, f3_arg1.controller or f1_local1 )
		ACTIONS.ZombieTutorialResumeGame( self )
		ACTIONS.LeaveMenu( self )
	end )
	return self
end

MenuBuilder.registerType( "tutorialYesNoSelectButtons", tutorialYesNoSelectButtons )
LockTable( _M )
