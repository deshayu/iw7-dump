local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function VRChallengeMain( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "VRChallengeMain"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self:playSound( "menu_open" )
	local f1_local2 = self
	self:setUseStencil( true )
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( Border )
	self.Border = Border
	
	local BGImage = nil
	
	BGImage = LUI.UIImage.new()
	BGImage.id = "BGImage"
	BGImage:SetRGBFromInt( 9508, 0 )
	BGImage:SetAlpha( 0.75, 0 )
	BGImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( BGImage )
	self.BGImage = BGImage
	
	local VRChallengeLabel = nil
	
	VRChallengeLabel = LUI.UIText.new()
	VRChallengeLabel.id = "VRChallengeLabel"
	VRChallengeLabel:SetScale( 0.25, 0 )
	VRChallengeLabel:setText( "VR Challenge Menu", 0 )
	VRChallengeLabel:SetFontSize( 45 * _1080p )
	VRChallengeLabel:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	VRChallengeLabel:SetAlignment( LUI.Alignment.Left )
	VRChallengeLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 158.5, _1080p * 658.5, _1080p * 111.16, _1080p * 156.16 )
	self:addElement( VRChallengeLabel )
	self.VRChallengeLabel = VRChallengeLabel
	
	local EMPScriptButton = nil
	
	EMPScriptButton = MenuBuilder.BuildRegisteredType( "SimpleScriptButton", {
		controllerIndex = f1_local1
	} )
	EMPScriptButton.id = "EMPScriptButton"
	EMPScriptButton.ButtonText:setText( "EMP Mode", 0 )
	EMPScriptButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 291.72, _1080p * 336.72 )
	self:addElement( EMPScriptButton )
	self.EMPScriptButton = EMPScriptButton
	
	local ViperScriptButton = nil
	
	ViperScriptButton = MenuBuilder.BuildRegisteredType( "SimpleScriptButton", {
		controllerIndex = f1_local1
	} )
	ViperScriptButton.id = "ViperScriptButton"
	ViperScriptButton.ButtonText:setText( "Jackal Mode", 0 )
	ViperScriptButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 474.72, _1080p * 519.72 )
	self:addElement( ViperScriptButton )
	self.ViperScriptButton = ViperScriptButton
	
	local WallRunScriptButton = nil
	
	WallRunScriptButton = MenuBuilder.BuildRegisteredType( "SimpleScriptButton", {
		controllerIndex = f1_local1
	} )
	WallRunScriptButton.id = "WallRunScriptButton"
	WallRunScriptButton.ButtonText:setText( "Combat Mode", 0 )
	WallRunScriptButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 379.72, _1080p * 424.72 )
	self:addElement( WallRunScriptButton )
	self.WallRunScriptButton = WallRunScriptButton
	
	local LeaveButton = nil
	
	LeaveButton = MenuBuilder.BuildRegisteredType( "SimpleScriptButton", {
		controllerIndex = f1_local1
	} )
	LeaveButton.id = "LeaveButton"
	LeaveButton.ButtonText:setText( "Leave VR", 0 )
	LeaveButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 943.72, _1080p * 988.72 )
	self:addElement( LeaveButton )
	self.LeaveButton = LeaveButton
	
	local LoadoutButton = nil
	
	LoadoutButton = MenuBuilder.BuildRegisteredType( "SimpleScriptButton", {
		controllerIndex = f1_local1
	} )
	LoadoutButton.id = "LoadoutButton"
	LoadoutButton.ButtonText:setText( "Change Loadout", 0 )
	LoadoutButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 868.72, _1080p * 913.72 )
	self:addElement( LoadoutButton )
	self.LoadoutButton = LoadoutButton
	
	local LoadoutButton0 = nil
	
	LoadoutButton0 = MenuBuilder.BuildRegisteredType( "SimpleScriptButton", {
		controllerIndex = f1_local1
	} )
	LoadoutButton0.id = "LoadoutButton0"
	LoadoutButton0.ButtonText:setText( "Rerun", 0 )
	LoadoutButton0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 790.22, _1080p * 835.22 )
	self:addElement( LoadoutButton0 )
	self.LoadoutButton0 = LoadoutButton0
	
	EMPScriptButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.controller or f1_local1
		ACTIONS.ScriptNotify( "emp_selected", 1 )
		ACTIONS.CloseAllMenus( self )
	end )
	ViperScriptButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f1_local1
		ACTIONS.CloseAllMenus( self )
		ACTIONS.ScriptNotify( "jackal_accepted", 1 )
	end )
	WallRunScriptButton:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or f1_local1
		ACTIONS.CloseAllMenus( self )
		ACTIONS.ScriptNotify( "combat_accepted", 1 )
	end )
	LeaveButton:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or f1_local1
		ACTIONS.CloseAllMenus( self )
		ACTIONS.ScriptNotify( "leave_vr_requested", 1 )
	end )
	LoadoutButton:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f6_arg1.controller or f1_local1
		ACTIONS.CloseAllMenus( self )
		ACTIONS.ScriptNotify( "change_requested", 1 )
	end )
	LoadoutButton0:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg1.controller or f1_local1
		ACTIONS.CloseAllMenus( self )
		ACTIONS.ScriptNotify( "rerun_requested", 1 )
	end )
	EMPScriptButton.navigation = {
		down = WallRunScriptButton
	}
	ViperScriptButton.navigation = {
		up = WallRunScriptButton,
		down = LoadoutButton0
	}
	WallRunScriptButton.navigation = {
		up = EMPScriptButton,
		down = ViperScriptButton
	}
	LeaveButton.navigation = {
		up = LoadoutButton
	}
	LoadoutButton.navigation = {
		up = LoadoutButton0,
		down = LeaveButton
	}
	LoadoutButton0.navigation = {
		up = ViperScriptButton,
		down = LoadoutButton
	}
	return self
end

MenuBuilder.registerType( "VRChallengeMain", VRChallengeMain )
LockTable( _M )
