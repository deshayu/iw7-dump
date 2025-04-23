local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MostWantedCardsBoardPopup( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "MostWantedCardsBoardPopup"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self:playSound( "menu_open" )
	local f1_local2 = self
	local Image1 = nil
	
	Image1 = LUI.UIImage.new()
	Image1.id = "Image1"
	Image1:SetRGBFromInt( 4868682, 0 )
	Image1:SetAlpha( 0.4, 0 )
	Image1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 863, _1080p * 1750, _1080p * 109.5, _1080p * 975.5 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:SetAlpha( 0.75, 0 )
	Image0:setImage( RegisterMaterial( "vf_photo_18_02" ), 0 )
	Image0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 890, _1080p * 1370, _1080p * 300, _1080p * 780 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Label0 = nil
	
	Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:setText( "CAPTAIN", 0 )
	Label0:SetFontSize( 36 * _1080p )
	Label0:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Label0:setTextStyle( CoD.TextStyle.OutlinedMore )
	Label0:SetAlignment( LUI.Alignment.Center )
	Label0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1396, _1080p * 1750, _1080p * 129.5, _1080p * 165.5 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Label0Copy0 = nil
	
	Label0Copy0 = LUI.UIText.new()
	Label0Copy0.id = "Label0Copy0"
	Label0Copy0:setText( "DAMIAN GORKSY", 0 )
	Label0Copy0:SetFontSize( 36 * _1080p )
	Label0Copy0:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Label0Copy0:setTextStyle( CoD.TextStyle.OutlinedMore )
	Label0Copy0:SetAlignment( LUI.Alignment.Center )
	Label0Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1396, _1080p * 1750, _1080p * 177.5, _1080p * 213.5 )
	self:addElement( Label0Copy0 )
	self.Label0Copy0 = Label0Copy0
	
	local Label0Copy2 = nil
	
	Label0Copy2 = LUI.UIText.new()
	Label0Copy2.id = "Label0Copy2"
	Label0Copy2:setText( "AGE: 41", 0 )
	Label0Copy2:SetFontSize( 32 * _1080p )
	Label0Copy2:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label0Copy2:setTextStyle( CoD.TextStyle.OutlinedMore )
	Label0Copy2:SetAlignment( LUI.Alignment.Left )
	Label0Copy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1396, _1080p * 1750, _1080p * 300, _1080p * 332 )
	self:addElement( Label0Copy2 )
	self.Label0Copy2 = Label0Copy2
	
	local Label0Copy3 = nil
	
	Label0Copy3 = LUI.UIText.new()
	Label0Copy3.id = "Label0Copy3"
	Label0Copy3:setText( "BATTLES: Charon Hill", 0 )
	Label0Copy3:SetFontSize( 32 * _1080p )
	Label0Copy3:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label0Copy3:setTextStyle( CoD.TextStyle.OutlinedMore )
	Label0Copy3:SetAlignment( LUI.Alignment.Left )
	Label0Copy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1396, _1080p * 1750, _1080p * 358.5, _1080p * 390.5 )
	self:addElement( Label0Copy3 )
	self.Label0Copy3 = Label0Copy3
	
	local Label0Copy4 = nil
	
	Label0Copy4 = LUI.UIText.new()
	Label0Copy4.id = "Label0Copy4"
	Label0Copy4:setText( "AWARDS: Bronze Star", 0 )
	Label0Copy4:SetFontSize( 32 * _1080p )
	Label0Copy4:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label0Copy4:setTextStyle( CoD.TextStyle.OutlinedMore )
	Label0Copy4:SetAlignment( LUI.Alignment.Left )
	Label0Copy4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1396, _1080p * 1750, _1080p * 426.5, _1080p * 458.5 )
	self:addElement( Label0Copy4 )
	self.Label0Copy4 = Label0Copy4
	
	local Label0Copy5 = nil
	
	Label0Copy5 = LUI.UIText.new()
	Label0Copy5.id = "Label0Copy5"
	Label0Copy5:setText( "BIO: Blah blah blah", 0 )
	Label0Copy5:SetFontSize( 32 * _1080p )
	Label0Copy5:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label0Copy5:setTextStyle( CoD.TextStyle.OutlinedMore )
	Label0Copy5:SetAlignment( LUI.Alignment.Left )
	Label0Copy5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1396, _1080p * 1730, _1080p * 500.5, _1080p * 532.5 )
	self:addElement( Label0Copy5 )
	self.Label0Copy5 = Label0Copy5
	
	local Label0Copy1 = nil
	
	Label0Copy1 = LUI.UIText.new()
	Label0Copy1.id = "Label0Copy1"
	Label0Copy1:setText( "SDS CHARON", 0 )
	Label0Copy1:SetFontSize( 36 * _1080p )
	Label0Copy1:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Label0Copy1:setTextStyle( CoD.TextStyle.OutlinedMore )
	Label0Copy1:SetAlignment( LUI.Alignment.Center )
	Label0Copy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1396, _1080p * 1750, _1080p * 225.5, _1080p * 261.5 )
	self:addElement( Label0Copy1 )
	self.Label0Copy1 = Label0Copy1
	
	self.addButtonHelperFunction = function ( f2_arg0, f2_arg1 )
		f2_arg0:AddButtonHelperText( {
			helper_text = "exit popup",
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
		ACTIONS.ScriptNotify( "deactivate", 1 )
		ACTIONS.LeaveMenuByName( "MostWantedCardsBoardPopup" )
	end )
	return self
end

MenuBuilder.registerType( "MostWantedCardsBoardPopup", MostWantedCardsBoardPopup )
LockTable( _M )
