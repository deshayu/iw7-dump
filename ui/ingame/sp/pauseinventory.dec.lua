local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PauseInventory( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1700 * _1080p, 0, 370 * _1080p )
	self.id = "PauseInventory"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 5075326, 0 )
	Background:SetAlpha( 0.7, 0 )
	Background:setImage( RegisterMaterial( "hud_pip_mask" ), 0 )
	Background:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -850, _1080p * 850, 0, _1080p * 370 )
	self:addElement( Background )
	self.Background = Background
	
	local CurrentTitle = nil
	
	CurrentTitle = LUI.UIText.new()
	CurrentTitle.id = "CurrentTitle"
	CurrentTitle:SetAlpha( 0.7, 0 )
	CurrentTitle:setText( "ARMORY AND INVENTORY", 0 )
	CurrentTitle:SetFontSize( 38 * _1080p )
	CurrentTitle:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CurrentTitle:setTextStyle( CoD.TextStyle.Outlined )
	CurrentTitle:SetAlignment( LUI.Alignment.Left )
	CurrentTitle:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -825.81, _1080p * 904.31, _1080p * 11.69, _1080p * 49.69 )
	self:addElement( CurrentTitle )
	self.CurrentTitle = CurrentTitle
	
	local SuitBox = nil
	
	SuitBox = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	SuitBox.id = "SuitBox"
	SuitBox:SetRGBFromInt( 1342099, 0 )
	SuitBox:SetAlpha( 0.4, 0 )
	SuitBox:SetBorderThicknessLeft( _1080p * 2, 0 )
	SuitBox:SetBorderThicknessRight( _1080p * 2, 0 )
	SuitBox:SetBorderThicknessTop( _1080p * 2, 0 )
	SuitBox:SetBorderThicknessBottom( _1080p * 2, 0 )
	SuitBox:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 461, _1080p * 850, _1080p * 56.69, _1080p * 370 )
	self:addElement( SuitBox )
	self.SuitBox = SuitBox
	
	local FirmwareBox = nil
	
	FirmwareBox = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	FirmwareBox.id = "FirmwareBox"
	FirmwareBox:SetRGBFromInt( 1342099, 0 )
	FirmwareBox:SetAlpha( 0.4, 0 )
	FirmwareBox:SetBorderThicknessLeft( _1080p * 2, 0 )
	FirmwareBox:SetBorderThicknessRight( _1080p * 2, 0 )
	FirmwareBox:SetBorderThicknessTop( _1080p * 2, 0 )
	FirmwareBox:SetBorderThicknessBottom( _1080p * 2, 0 )
	FirmwareBox:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 72, _1080p * 461, _1080p * 56.69, _1080p * 370 )
	self:addElement( FirmwareBox )
	self.FirmwareBox = FirmwareBox
	
	local WeaponsBox = nil
	
	WeaponsBox = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	WeaponsBox.id = "WeaponsBox"
	WeaponsBox:SetRGBFromInt( 1342099, 0 )
	WeaponsBox:SetAlpha( 0.4, 0 )
	WeaponsBox:SetBorderThicknessLeft( _1080p * 2, 0 )
	WeaponsBox:SetBorderThicknessRight( _1080p * 2, 0 )
	WeaponsBox:SetBorderThicknessTop( _1080p * 2, 0 )
	WeaponsBox:SetBorderThicknessBottom( _1080p * 2, 0 )
	WeaponsBox:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -850, _1080p * 72, _1080p * 56.69, _1080p * 370 )
	self:addElement( WeaponsBox )
	self.WeaponsBox = WeaponsBox
	
	local CurrentSuit = nil
	
	CurrentSuit = LUI.UIText.new()
	CurrentSuit.id = "CurrentSuit"
	CurrentSuit:SetRGBFromInt( 14737632, 0 )
	CurrentSuit:SetAlpha( 0.8, 0 )
	CurrentSuit:setText( "SUIT 3", 0 )
	CurrentSuit:SetFontSize( 36 * _1080p )
	CurrentSuit:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CurrentSuit:setTextStyle( CoD.TextStyle.Outlined )
	CurrentSuit:SetAlignment( LUI.Alignment.Right )
	CurrentSuit:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 466, _1080p * 835, _1080p * 75.38, _1080p * 111.38 )
	self:addElement( CurrentSuit )
	self.CurrentSuit = CurrentSuit
	
	local FirmwareVersion = nil
	
	FirmwareVersion = LUI.UIText.new()
	FirmwareVersion.id = "FirmwareVersion"
	FirmwareVersion:SetRGBFromInt( 14737632, 0 )
	FirmwareVersion:SetAlpha( 0.8, 0 )
	FirmwareVersion:setText( "FIRMWARE v2.0", 0 )
	FirmwareVersion:SetFontSize( 36 * _1080p )
	FirmwareVersion:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FirmwareVersion:setTextStyle( CoD.TextStyle.Outlined )
	FirmwareVersion:SetAlignment( LUI.Alignment.Right )
	FirmwareVersion:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 39.25, _1080p * 434.25, _1080p * 75.38, _1080p * 111.38 )
	self:addElement( FirmwareVersion )
	self.FirmwareVersion = FirmwareVersion
	
	local WeaponsTitle = nil
	
	WeaponsTitle = LUI.UIText.new()
	WeaponsTitle.id = "WeaponsTitle"
	WeaponsTitle:SetRGBFromInt( 14737632, 0 )
	WeaponsTitle:SetAlpha( 0.8, 0 )
	WeaponsTitle:setText( "ARMORY WEAPONS", 0 )
	WeaponsTitle:SetFontSize( 36 * _1080p )
	WeaponsTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WeaponsTitle:setTextStyle( CoD.TextStyle.Outlined )
	WeaponsTitle:SetAlignment( LUI.Alignment.Right )
	WeaponsTitle:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -824.5, _1080p * 46.5, _1080p * 75.38, _1080p * 111.38 )
	self:addElement( WeaponsTitle )
	self.WeaponsTitle = WeaponsTitle
	
	local TitleBox = nil
	
	TitleBox = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	TitleBox.id = "TitleBox"
	TitleBox:SetRGBFromInt( 1342099, 0 )
	TitleBox:SetAlpha( 0.4, 0 )
	TitleBox:SetBorderThicknessLeft( _1080p * 2, 0 )
	TitleBox:SetBorderThicknessRight( _1080p * 2, 0 )
	TitleBox:SetBorderThicknessTop( _1080p * 2, 0 )
	TitleBox:SetBorderThicknessBottom( _1080p * 2, 0 )
	TitleBox:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1700, 0, 0, _1080p * 56.69 )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	return self
end

MenuBuilder.registerType( "PauseInventory", PauseInventory )
LockTable( _M )
