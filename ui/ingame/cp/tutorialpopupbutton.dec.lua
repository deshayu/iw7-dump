local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function TutorialPopupButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 324 * _1080p, 0, 32 * _1080p )
	self.id = "TutorialPopupButton"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self.soundSet = "cpMainMenuDefault"
	local f1_local2 = self
	local Accept = nil
	
	Accept = LUI.UIText.new()
	Accept.id = "Accept"
	Accept:SetRGBFromInt( 0, 0 )
	Accept:setText( Engine.Localize( "ZM_TUTORIALS_ACCEPT" ), 0 )
	Accept:SetFontSize( 32 * _1080p )
	Accept:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Accept:SetAlignment( LUI.Alignment.Center )
	Accept:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 324, 0, _1080p * 32 )
	self:addElement( Accept )
	self.Accept = Accept
	
	return self
end

MenuBuilder.registerType( "TutorialPopupButton", TutorialPopupButton )
LockTable( _M )
