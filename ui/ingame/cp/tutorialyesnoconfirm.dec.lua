local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function tutorialYesNoConfirm( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "tutorialYesNoConfirm"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self:playSound( "menu_open" )
	local f1_local2 = self
	local sign = nil
	
	sign = LUI.UIImage.new()
	sign.id = "sign"
	sign:setImage( RegisterMaterial( "zm_tutorial_guided_yes_no" ), 0 )
	sign:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 704, _1080p * 1216, _1080p * 206.5, _1080p * 718.5 )
	self:addElement( sign )
	self.sign = sign
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( Engine.Localize( "ZM_TUTORIALS_CONFIRM" ), 0 )
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -126.5, _1080p * 165.5, _1080p * 440.5, _1080p * 462.5 )
	self:addElement( Text )
	self.Text = Text
	
	local Accept = nil
	
	Accept = LUI.UIText.new()
	Accept.id = "Accept"
	Accept:setText( Engine.Localize( "ZM_TUTORIALS_ACCEPT" ), 0 )
	Accept:SetFontSize( 22 * _1080p )
	Accept:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Accept:SetAlignment( LUI.Alignment.Center )
	Accept:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -147.5, _1080p * 147.5, _1080p * 575.5, _1080p * 597.5 )
	self:addElement( Accept )
	self.Accept = Accept
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_primary", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.controller or f1_local1
		ACTIONS.ZombieTutorialResumeGame( self )
		ACTIONS.CloseAllMenus( self )
	end )
	return self
end

MenuBuilder.registerType( "tutorialYesNoConfirm", tutorialYesNoConfirm )
LockTable( _M )
