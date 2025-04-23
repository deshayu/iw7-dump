local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function tutorialYesNo( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "tutorialYesNo"
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
	Text:setText( Engine.Localize( "ZM_TUTORIALS_GUIDED_TOUR" ), 0 )
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 852, _1080p * 1109, _1080p * 440.5, _1080p * 462.5 )
	self:addElement( Text )
	self.Text = Text
	
	local tutorialYesNoSelectButtons = nil
	
	tutorialYesNoSelectButtons = MenuBuilder.BuildRegisteredType( "tutorialYesNoSelectButtons", {
		controllerIndex = f1_local1
	} )
	tutorialYesNoSelectButtons.id = "tutorialYesNoSelectButtons"
	tutorialYesNoSelectButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 778, _1080p * 1167, _1080p * 510, _1080p * 570 )
	self:addElement( tutorialYesNoSelectButtons )
	self.tutorialYesNoSelectButtons = tutorialYesNoSelectButtons
	
	return self
end

MenuBuilder.registerType( "tutorialYesNo", tutorialYesNo )
LockTable( _M )
