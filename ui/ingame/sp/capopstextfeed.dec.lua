local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CapOpsTextFeed( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 859 * _1080p, 0, 211 * _1080p )
	self.id = "CapOpsTextFeed"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ButtonHolderCopy0 = nil
	
	ButtonHolderCopy0 = LUI.UIImage.new()
	ButtonHolderCopy0.id = "ButtonHolderCopy0"
	ButtonHolderCopy0:SetRGBFromInt( 1776411, 0 )
	ButtonHolderCopy0:SetAlpha( 0.85, 0 )
	ButtonHolderCopy0:SetDotPitchEnabled( true )
	ButtonHolderCopy0:SetDotPitchX( 0, 0 )
	ButtonHolderCopy0:SetDotPitchY( 0, 0 )
	ButtonHolderCopy0:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy0:SetDotPitchMode( 0 )
	ButtonHolderCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 859, 0, _1080p * 211 )
	self:addElement( ButtonHolderCopy0 )
	self.ButtonHolderCopy0 = ButtonHolderCopy0
	
	local ButtonHolderCopy5 = nil
	
	ButtonHolderCopy5 = LUI.UIImage.new()
	ButtonHolderCopy5.id = "ButtonHolderCopy5"
	ButtonHolderCopy5:SetRGBFromInt( 2171169, 0 )
	ButtonHolderCopy5:SetDotPitchEnabled( true )
	ButtonHolderCopy5:SetDotPitchX( 0, 0 )
	ButtonHolderCopy5:SetDotPitchY( 0, 0 )
	ButtonHolderCopy5:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy5:SetDotPitchMode( 0 )
	ButtonHolderCopy5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 839, _1080p * 859, 0, _1080p * 211 )
	self:addElement( ButtonHolderCopy5 )
	self.ButtonHolderCopy5 = ButtonHolderCopy5
	
	local ButtonHolderCopy6 = nil
	
	ButtonHolderCopy6 = LUI.UIImage.new()
	ButtonHolderCopy6.id = "ButtonHolderCopy6"
	ButtonHolderCopy6:SetRGBFromInt( 3947581, 0 )
	ButtonHolderCopy6:SetDotPitchEnabled( true )
	ButtonHolderCopy6:SetDotPitchX( 0, 0 )
	ButtonHolderCopy6:SetDotPitchY( 0, 0 )
	ButtonHolderCopy6:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy6:SetDotPitchMode( 0 )
	ButtonHolderCopy6:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 859, 0, _1080p * 30 )
	self:addElement( ButtonHolderCopy6 )
	self.ButtonHolderCopy6 = ButtonHolderCopy6
	
	local ButtonHolderCopy7 = nil
	
	ButtonHolderCopy7 = LUI.UIImage.new()
	ButtonHolderCopy7.id = "ButtonHolderCopy7"
	ButtonHolderCopy7:SetRGBFromInt( 5526870, 0 )
	ButtonHolderCopy7:SetDotPitchEnabled( true )
	ButtonHolderCopy7:SetDotPitchX( 0, 0 )
	ButtonHolderCopy7:SetDotPitchY( 0, 0 )
	ButtonHolderCopy7:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy7:SetDotPitchMode( 0 )
	ButtonHolderCopy7:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 17, 0, _1080p * 30 )
	self:addElement( ButtonHolderCopy7 )
	self.ButtonHolderCopy7 = ButtonHolderCopy7
	
	local ArchiveBarCopy1 = nil
	
	ArchiveBarCopy1 = LUI.UIText.new()
	ArchiveBarCopy1.id = "ArchiveBarCopy1"
	ArchiveBarCopy1:SetRGBFromInt( 8421504, 0 )
	ArchiveBarCopy1:SetDotPitchEnabled( true )
	ArchiveBarCopy1:SetDotPitchX( 0, 0 )
	ArchiveBarCopy1:SetDotPitchY( 0, 0 )
	ArchiveBarCopy1:SetDotPitchContrast( 0, 0 )
	ArchiveBarCopy1:SetDotPitchMode( 0 )
	ArchiveBarCopy1:setText( Engine.Localize( "CAPCOMP_DECRYPTION" ), 0 )
	ArchiveBarCopy1:SetFontSize( 20 * _1080p )
	ArchiveBarCopy1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ArchiveBarCopy1:SetAlignment( LUI.Alignment.Left )
	ArchiveBarCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 504, _1080p * 5, _1080p * 25 )
	self:addElement( ArchiveBarCopy1 )
	self.ArchiveBarCopy1 = ArchiveBarCopy1
	
	local ButtonHolderCopy1 = nil
	
	ButtonHolderCopy1 = LUI.UIImage.new()
	ButtonHolderCopy1.id = "ButtonHolderCopy1"
	ButtonHolderCopy1:SetAlpha( 0.75, 0 )
	ButtonHolderCopy1:SetDotPitchEnabled( true )
	ButtonHolderCopy1:SetDotPitchX( 0, 0 )
	ButtonHolderCopy1:SetDotPitchY( 0, 0 )
	ButtonHolderCopy1:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy1:SetDotPitchMode( 0 )
	ButtonHolderCopy1:setImage( RegisterMaterial( "hud_captain_computer_textblock" ), 0 )
	ButtonHolderCopy1:SetVMin( 0.8, 0 )
	ButtonHolderCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 685.78, _1080p * 835, _1080p * 34, _1080p * 208 )
	self:addElement( ButtonHolderCopy1 )
	self.ButtonHolderCopy1 = ButtonHolderCopy1
	
	local TechyDigitsElement0 = nil
	
	TechyDigitsElement0 = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 5,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	TechyDigitsElement0.id = "TechyDigitsElement0"
	TechyDigitsElement0:SetRGBFromInt( 2500134, 0 )
	TechyDigitsElement0:SetFontSize( 16 * _1080p )
	TechyDigitsElement0:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TechyDigitsElement0:SetAlignment( LUI.Alignment.Left )
	TechyDigitsElement0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 462, _1080p * 562, _1080p * 72.5, _1080p * 88.5 )
	self:addElement( TechyDigitsElement0 )
	self.TechyDigitsElement0 = TechyDigitsElement0
	
	local StyledLabel0Copy0 = nil
	
	StyledLabel0Copy0 = LUI.UIStyledText.new()
	StyledLabel0Copy0.id = "StyledLabel0Copy0"
	StyledLabel0Copy0:SetRGBFromInt( 2500134, 0 )
	StyledLabel0Copy0:setText( ToUpperCase( Engine.Localize( "CAPCOMP_DECRYPTION_SMALL" ) ), 0 )
	StyledLabel0Copy0:SetFontSize( 22 * _1080p )
	StyledLabel0Copy0:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StyledLabel0Copy0:SetAlignment( LUI.Alignment.Left )
	StyledLabel0Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 517, _1080p * 34, _1080p * 56 )
	self:addElement( StyledLabel0Copy0 )
	self.StyledLabel0Copy0 = StyledLabel0Copy0
	
	local TechyDigitsElementCopy0 = nil
	
	TechyDigitsElementCopy0 = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 10,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	TechyDigitsElementCopy0.id = "TechyDigitsElementCopy0"
	TechyDigitsElementCopy0:SetRGBFromInt( 3349018, 0 )
	TechyDigitsElementCopy0:SetFontSize( 16 * _1080p )
	TechyDigitsElementCopy0:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TechyDigitsElementCopy0:SetAlignment( LUI.Alignment.Left )
	TechyDigitsElementCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 462, _1080p * 562, _1080p * 88.5, _1080p * 104.5 )
	self:addElement( TechyDigitsElementCopy0 )
	self.TechyDigitsElementCopy0 = TechyDigitsElementCopy0
	
	local TechyDigitsElementCopy1 = nil
	
	TechyDigitsElementCopy1 = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 5,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	TechyDigitsElementCopy1.id = "TechyDigitsElementCopy1"
	TechyDigitsElementCopy1:SetRGBFromInt( 3355423, 0 )
	TechyDigitsElementCopy1:SetFontSize( 16 * _1080p )
	TechyDigitsElementCopy1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TechyDigitsElementCopy1:SetAlignment( LUI.Alignment.Left )
	TechyDigitsElementCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 462, _1080p * 562, _1080p * 104.5, _1080p * 120.5 )
	self:addElement( TechyDigitsElementCopy1 )
	self.TechyDigitsElementCopy1 = TechyDigitsElementCopy1
	
	local ButtonHolderCopy8 = nil
	
	ButtonHolderCopy8 = LUI.UIImage.new()
	ButtonHolderCopy8.id = "ButtonHolderCopy8"
	ButtonHolderCopy8:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy8:SetDotPitchEnabled( true )
	ButtonHolderCopy8:SetDotPitchX( 0, 0 )
	ButtonHolderCopy8:SetDotPitchY( 0, 0 )
	ButtonHolderCopy8:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy8:SetDotPitchMode( 0 )
	ButtonHolderCopy8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 685, _1080p * 691, _1080p * 33, _1080p * 34 )
	self:addElement( ButtonHolderCopy8 )
	self.ButtonHolderCopy8 = ButtonHolderCopy8
	
	local ButtonHolderCopy9 = nil
	
	ButtonHolderCopy9 = LUI.UIImage.new()
	ButtonHolderCopy9.id = "ButtonHolderCopy9"
	ButtonHolderCopy9:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy9:SetDotPitchEnabled( true )
	ButtonHolderCopy9:SetDotPitchX( 0, 0 )
	ButtonHolderCopy9:SetDotPitchY( 0, 0 )
	ButtonHolderCopy9:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy9:SetDotPitchMode( 0 )
	ButtonHolderCopy9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 685, _1080p * 686, _1080p * 34, _1080p * 39 )
	self:addElement( ButtonHolderCopy9 )
	self.ButtonHolderCopy9 = ButtonHolderCopy9
	
	local ButtonHolderCopy10 = nil
	
	ButtonHolderCopy10 = LUI.UIImage.new()
	ButtonHolderCopy10.id = "ButtonHolderCopy10"
	ButtonHolderCopy10:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy10:SetDotPitchEnabled( true )
	ButtonHolderCopy10:SetDotPitchX( 0, 0 )
	ButtonHolderCopy10:SetDotPitchY( 0, 0 )
	ButtonHolderCopy10:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy10:SetDotPitchMode( 0 )
	ButtonHolderCopy10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 830, _1080p * 836, _1080p * 33, _1080p * 34 )
	self:addElement( ButtonHolderCopy10 )
	self.ButtonHolderCopy10 = ButtonHolderCopy10
	
	local ButtonHolderCopy11 = nil
	
	ButtonHolderCopy11 = LUI.UIImage.new()
	ButtonHolderCopy11.id = "ButtonHolderCopy11"
	ButtonHolderCopy11:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy11:SetDotPitchEnabled( true )
	ButtonHolderCopy11:SetDotPitchX( 0, 0 )
	ButtonHolderCopy11:SetDotPitchY( 0, 0 )
	ButtonHolderCopy11:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy11:SetDotPitchMode( 0 )
	ButtonHolderCopy11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 835, _1080p * 836, _1080p * 34, _1080p * 39 )
	self:addElement( ButtonHolderCopy11 )
	self.ButtonHolderCopy11 = ButtonHolderCopy11
	
	local ButtonHolderCopy2 = nil
	
	ButtonHolderCopy2 = LUI.UIImage.new()
	ButtonHolderCopy2.id = "ButtonHolderCopy2"
	ButtonHolderCopy2:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy2:SetDotPitchEnabled( true )
	ButtonHolderCopy2:SetDotPitchX( 0, 0 )
	ButtonHolderCopy2:SetDotPitchY( 0, 0 )
	ButtonHolderCopy2:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy2:SetDotPitchMode( 0 )
	ButtonHolderCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 830, _1080p * 836, _1080p * 208, _1080p * 209 )
	self:addElement( ButtonHolderCopy2 )
	self.ButtonHolderCopy2 = ButtonHolderCopy2
	
	local ButtonHolderCopy3 = nil
	
	ButtonHolderCopy3 = LUI.UIImage.new()
	ButtonHolderCopy3.id = "ButtonHolderCopy3"
	ButtonHolderCopy3:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy3:SetDotPitchEnabled( true )
	ButtonHolderCopy3:SetDotPitchX( 0, 0 )
	ButtonHolderCopy3:SetDotPitchY( 0, 0 )
	ButtonHolderCopy3:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy3:SetDotPitchMode( 0 )
	ButtonHolderCopy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 835, _1080p * 836, _1080p * 203, _1080p * 208 )
	self:addElement( ButtonHolderCopy3 )
	self.ButtonHolderCopy3 = ButtonHolderCopy3
	
	local ButtonHolderCopy4 = nil
	
	ButtonHolderCopy4 = LUI.UIImage.new()
	ButtonHolderCopy4.id = "ButtonHolderCopy4"
	ButtonHolderCopy4:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy4:SetDotPitchEnabled( true )
	ButtonHolderCopy4:SetDotPitchX( 0, 0 )
	ButtonHolderCopy4:SetDotPitchY( 0, 0 )
	ButtonHolderCopy4:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy4:SetDotPitchMode( 0 )
	ButtonHolderCopy4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 685, _1080p * 691, _1080p * 208, _1080p * 209 )
	self:addElement( ButtonHolderCopy4 )
	self.ButtonHolderCopy4 = ButtonHolderCopy4
	
	local ButtonHolderCopy12 = nil
	
	ButtonHolderCopy12 = LUI.UIImage.new()
	ButtonHolderCopy12.id = "ButtonHolderCopy12"
	ButtonHolderCopy12:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy12:SetDotPitchEnabled( true )
	ButtonHolderCopy12:SetDotPitchX( 0, 0 )
	ButtonHolderCopy12:SetDotPitchY( 0, 0 )
	ButtonHolderCopy12:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy12:SetDotPitchMode( 0 )
	ButtonHolderCopy12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 685, _1080p * 686, _1080p * 203, _1080p * 208 )
	self:addElement( ButtonHolderCopy12 )
	self.ButtonHolderCopy12 = ButtonHolderCopy12
	
	local StyledLabel0Copy1 = nil
	
	StyledLabel0Copy1 = LUI.UIStyledText.new()
	StyledLabel0Copy1.id = "StyledLabel0Copy1"
	StyledLabel0Copy1:SetRGBFromInt( 8224128, 0 )
	StyledLabel0Copy1:setText( Engine.Localize( "CAPCOMP_DECRYPTION_BUFFER" ), 0 )
	StyledLabel0Copy1:SetFontSize( 16 * _1080p )
	StyledLabel0Copy1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StyledLabel0Copy1:SetAlignment( LUI.Alignment.Left )
	StyledLabel0Copy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 462, _1080p * 613, _1080p * 41.5, _1080p * 57.5 )
	self:addElement( StyledLabel0Copy1 )
	self.StyledLabel0Copy1 = StyledLabel0Copy1
	
	local StyledLabel0Copy2 = nil
	
	StyledLabel0Copy2 = LUI.UIStyledText.new()
	StyledLabel0Copy2.id = "StyledLabel0Copy2"
	StyledLabel0Copy2:SetRGBFromInt( 8224128, 0 )
	StyledLabel0Copy2:setText( Engine.Localize( "CAPCOMP_DECRYPTION_OVERFLOW" ), 0 )
	StyledLabel0Copy2:SetFontSize( 16 * _1080p )
	StyledLabel0Copy2:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StyledLabel0Copy2:SetAlignment( LUI.Alignment.Left )
	StyledLabel0Copy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 300.75, _1080p * 64.5, _1080p * 80.5 )
	self:addElement( StyledLabel0Copy2 )
	self.StyledLabel0Copy2 = StyledLabel0Copy2
	
	local ButtonHolderCopy13 = nil
	
	ButtonHolderCopy13 = LUI.UIImage.new()
	ButtonHolderCopy13.id = "ButtonHolderCopy13"
	ButtonHolderCopy13:SetAlpha( 0.75, 0 )
	ButtonHolderCopy13:SetDotPitchEnabled( true )
	ButtonHolderCopy13:SetDotPitchX( 0, 0 )
	ButtonHolderCopy13:SetDotPitchY( 0, 0 )
	ButtonHolderCopy13:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy13:SetDotPitchMode( 0 )
	ButtonHolderCopy13:setImage( RegisterMaterial( "hud_captain_computer_textblock" ), 0 )
	ButtonHolderCopy13:SetVMin( 0.92, 0 )
	ButtonHolderCopy13:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 462.78, _1080p * 675, _1080p * 129, _1080p * 208 )
	self:addElement( ButtonHolderCopy13 )
	self.ButtonHolderCopy13 = ButtonHolderCopy13
	
	local ButtonHolderCopy14 = nil
	
	ButtonHolderCopy14 = LUI.UIImage.new()
	ButtonHolderCopy14.id = "ButtonHolderCopy14"
	ButtonHolderCopy14:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy14:SetDotPitchEnabled( true )
	ButtonHolderCopy14:SetDotPitchX( 0, 0 )
	ButtonHolderCopy14:SetDotPitchY( 0, 0 )
	ButtonHolderCopy14:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy14:SetDotPitchMode( 0 )
	ButtonHolderCopy14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 462, _1080p * 468, _1080p * 128, _1080p * 129 )
	self:addElement( ButtonHolderCopy14 )
	self.ButtonHolderCopy14 = ButtonHolderCopy14
	
	local ButtonHolderCopy15 = nil
	
	ButtonHolderCopy15 = LUI.UIImage.new()
	ButtonHolderCopy15.id = "ButtonHolderCopy15"
	ButtonHolderCopy15:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy15:SetDotPitchEnabled( true )
	ButtonHolderCopy15:SetDotPitchX( 0, 0 )
	ButtonHolderCopy15:SetDotPitchY( 0, 0 )
	ButtonHolderCopy15:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy15:SetDotPitchMode( 0 )
	ButtonHolderCopy15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 462, _1080p * 463, _1080p * 129, _1080p * 134 )
	self:addElement( ButtonHolderCopy15 )
	self.ButtonHolderCopy15 = ButtonHolderCopy15
	
	local ButtonHolderCopy16 = nil
	
	ButtonHolderCopy16 = LUI.UIImage.new()
	ButtonHolderCopy16.id = "ButtonHolderCopy16"
	ButtonHolderCopy16:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy16:SetDotPitchEnabled( true )
	ButtonHolderCopy16:SetDotPitchX( 0, 0 )
	ButtonHolderCopy16:SetDotPitchY( 0, 0 )
	ButtonHolderCopy16:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy16:SetDotPitchMode( 0 )
	ButtonHolderCopy16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 670, _1080p * 676, _1080p * 128, _1080p * 129 )
	self:addElement( ButtonHolderCopy16 )
	self.ButtonHolderCopy16 = ButtonHolderCopy16
	
	local ButtonHolderCopy17 = nil
	
	ButtonHolderCopy17 = LUI.UIImage.new()
	ButtonHolderCopy17.id = "ButtonHolderCopy17"
	ButtonHolderCopy17:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy17:SetDotPitchEnabled( true )
	ButtonHolderCopy17:SetDotPitchX( 0, 0 )
	ButtonHolderCopy17:SetDotPitchY( 0, 0 )
	ButtonHolderCopy17:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy17:SetDotPitchMode( 0 )
	ButtonHolderCopy17:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 675, _1080p * 676, _1080p * 129, _1080p * 134 )
	self:addElement( ButtonHolderCopy17 )
	self.ButtonHolderCopy17 = ButtonHolderCopy17
	
	local ButtonHolderCopy18 = nil
	
	ButtonHolderCopy18 = LUI.UIImage.new()
	ButtonHolderCopy18.id = "ButtonHolderCopy18"
	ButtonHolderCopy18:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy18:SetDotPitchEnabled( true )
	ButtonHolderCopy18:SetDotPitchX( 0, 0 )
	ButtonHolderCopy18:SetDotPitchY( 0, 0 )
	ButtonHolderCopy18:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy18:SetDotPitchMode( 0 )
	ButtonHolderCopy18:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 670, _1080p * 676, _1080p * 208, _1080p * 209 )
	self:addElement( ButtonHolderCopy18 )
	self.ButtonHolderCopy18 = ButtonHolderCopy18
	
	local ButtonHolderCopy19 = nil
	
	ButtonHolderCopy19 = LUI.UIImage.new()
	ButtonHolderCopy19.id = "ButtonHolderCopy19"
	ButtonHolderCopy19:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy19:SetDotPitchEnabled( true )
	ButtonHolderCopy19:SetDotPitchX( 0, 0 )
	ButtonHolderCopy19:SetDotPitchY( 0, 0 )
	ButtonHolderCopy19:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy19:SetDotPitchMode( 0 )
	ButtonHolderCopy19:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 675, _1080p * 676, _1080p * 203, _1080p * 208 )
	self:addElement( ButtonHolderCopy19 )
	self.ButtonHolderCopy19 = ButtonHolderCopy19
	
	local ButtonHolderCopy20 = nil
	
	ButtonHolderCopy20 = LUI.UIImage.new()
	ButtonHolderCopy20.id = "ButtonHolderCopy20"
	ButtonHolderCopy20:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy20:SetDotPitchEnabled( true )
	ButtonHolderCopy20:SetDotPitchX( 0, 0 )
	ButtonHolderCopy20:SetDotPitchY( 0, 0 )
	ButtonHolderCopy20:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy20:SetDotPitchMode( 0 )
	ButtonHolderCopy20:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 462, _1080p * 468, _1080p * 208, _1080p * 209 )
	self:addElement( ButtonHolderCopy20 )
	self.ButtonHolderCopy20 = ButtonHolderCopy20
	
	local ButtonHolderCopy21 = nil
	
	ButtonHolderCopy21 = LUI.UIImage.new()
	ButtonHolderCopy21.id = "ButtonHolderCopy21"
	ButtonHolderCopy21:SetRGBFromInt( 7763575, 0 )
	ButtonHolderCopy21:SetDotPitchEnabled( true )
	ButtonHolderCopy21:SetDotPitchX( 0, 0 )
	ButtonHolderCopy21:SetDotPitchY( 0, 0 )
	ButtonHolderCopy21:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy21:SetDotPitchMode( 0 )
	ButtonHolderCopy21:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 462, _1080p * 463, _1080p * 203, _1080p * 208 )
	self:addElement( ButtonHolderCopy21 )
	self.ButtonHolderCopy21 = ButtonHolderCopy21
	
	local WaveForm = nil
	
	WaveForm = LUI.UIImage.new()
	WaveForm.id = "WaveForm"
	WaveForm:setImage( RegisterMaterial( "hud_captain_computer_waveform" ), 0 )
	WaveForm:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -60.5, _1080p * 412.5, _1080p * 5, _1080p * 254.55 )
	self:addElement( WaveForm )
	self.WaveForm = WaveForm
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ButtonHolderCopy1:RegisterAnimationSequence( "ScrollText", {
			{
				function ()
					return self.ButtonHolderCopy1:SetVMin( 0.8, 0 )
				end,
				function ()
					return self.ButtonHolderCopy1:SetVMin( 2.8, 5000 )
				end
			},
			{
				function ()
					return self.ButtonHolderCopy1:SetVMax( 1, 0 )
				end,
				function ()
					return self.ButtonHolderCopy1:SetVMax( 3, 5000 )
				end
			}
		} )
		ButtonHolderCopy13:RegisterAnimationSequence( "ScrollText", {
			{
				function ()
					return self.ButtonHolderCopy13:SetVMin( 0.1, 0 )
				end,
				function ()
					return self.ButtonHolderCopy13:SetVMin( -0.92, 5000 )
				end
			},
			{
				function ()
					return self.ButtonHolderCopy13:SetVMax( 0, 0 )
				end,
				function ()
					return self.ButtonHolderCopy13:SetVMax( -1, 5000 )
				end
			}
		} )
		self._sequences.ScrollText = function ()
			ButtonHolderCopy1:AnimateLoop( "ScrollText" )
			ButtonHolderCopy13:AnimateLoop( "ScrollText" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "ScrollText" )
	return self
end

MenuBuilder.registerType( "CapOpsTextFeed", CapOpsTextFeed )
LockTable( _M )
