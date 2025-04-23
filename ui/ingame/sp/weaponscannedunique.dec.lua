local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WeaponScannedUnique( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "WeaponScannedUnique"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self:playSound( "menu_open" )
	local f1_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 701.5, _1080p * 1218.5, _1080p * 216, _1080p * 341 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local WeaponScannedUniqueWidget = nil
	
	WeaponScannedUniqueWidget = MenuBuilder.BuildRegisteredType( "WeaponScannedUniqueWidget", {
		controllerIndex = f1_local1
	} )
	WeaponScannedUniqueWidget.id = "WeaponScannedUniqueWidget"
	WeaponScannedUniqueWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 701.5, _1080p * 1218.5, _1080p * 216, _1080p * 341 )
	self:addElement( WeaponScannedUniqueWidget )
	self.WeaponScannedUniqueWidget = WeaponScannedUniqueWidget
	
	self.addButtonHelperFunction = function ( f2_arg0, f2_arg1 )
		f2_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_RESUMEGAME" ),
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f1_local1
		ACTIONS.LeaveMenu( self )
		ACTIONS.ResumeGame( self )
	end )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "WeaponScannedUniqueWidget",
		sequenceName = "TextOn",
		elementPath = "WeaponScannedUniqueWidget"
	} )
	ACTIONS.PauseGame( self, "false" )
	return self
end

MenuBuilder.registerType( "WeaponScannedUnique", WeaponScannedUnique )
LockTable( _M )
