local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LevelTransition( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "LevelTransition"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local FrameCornerUL = nil
	
	FrameCornerUL = MenuBuilder.BuildRegisteredType( "FrameCorner", {
		controllerIndex = f1_local1
	} )
	FrameCornerUL.id = "FrameCornerUL"
	FrameCornerUL:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameCornerUL:SetAlpha( 0, 0 )
	FrameCornerUL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 234.69, _1080p * 254.69, _1080p * -486, _1080p * -409 )
	self:addElement( FrameCornerUL )
	self.FrameCornerUL = FrameCornerUL
	
	local FrameCornerBR = nil
	
	FrameCornerBR = MenuBuilder.BuildRegisteredType( "FrameCorner", {
		controllerIndex = f1_local1
	} )
	FrameCornerBR.id = "FrameCornerBR"
	FrameCornerBR:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameCornerBR:SetAlpha( 0, 0 )
	FrameCornerBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 864, _1080p * 844, _1080p * -74.84, _1080p * -151.84 )
	self:addElement( FrameCornerBR )
	self.FrameCornerBR = FrameCornerBR
	
	local FrameCornerUR = nil
	
	FrameCornerUR = MenuBuilder.BuildRegisteredType( "FrameCorner", {
		controllerIndex = f1_local1
	} )
	FrameCornerUR.id = "FrameCornerUR"
	FrameCornerUR:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameCornerUR:SetAlpha( 0, 0 )
	FrameCornerUR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 864, _1080p * 844, _1080p * -486, _1080p * -409 )
	self:addElement( FrameCornerUR )
	self.FrameCornerUR = FrameCornerUR
	
	local FrameCornerBL = nil
	
	FrameCornerBL = MenuBuilder.BuildRegisteredType( "FrameCorner", {
		controllerIndex = f1_local1
	} )
	FrameCornerBL.id = "FrameCornerBL"
	FrameCornerBL:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameCornerBL:SetAlpha( 0, 0 )
	FrameCornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 234.69, _1080p * 254.69, _1080p * -74.84, _1080p * -151.84 )
	self:addElement( FrameCornerBL )
	self.FrameCornerBL = FrameCornerBL
	
	local FrameCornerAnchor = nil
	
	FrameCornerAnchor = MenuBuilder.BuildRegisteredType( "FrameCorner", {
		controllerIndex = f1_local1
	} )
	FrameCornerAnchor.id = "FrameCornerAnchor"
	FrameCornerAnchor:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameCornerAnchor:SetAlpha( 0, 0 )
	FrameCornerAnchor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 864, _1080p * 844, _1080p * -460, _1080p * -87.84 )
	self:addElement( FrameCornerAnchor )
	self.FrameCornerAnchor = FrameCornerAnchor
	
	local AnchorDetail1 = nil
	
	AnchorDetail1 = LUI.UIImage.new()
	AnchorDetail1.id = "AnchorDetail1"
	AnchorDetail1:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	AnchorDetail1:SetAlpha( 0, 0 )
	AnchorDetail1:setImage( RegisterMaterial( "hud_pip_rt_fluff2" ), 0 )
	AnchorDetail1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 847, _1080p * 861, _1080p * -408, _1080p * -342 )
	self:addElement( AnchorDetail1 )
	self.AnchorDetail1 = AnchorDetail1
	
	local AnchorDetail3 = nil
	
	AnchorDetail3 = LUI.UIImage.new()
	AnchorDetail3.id = "AnchorDetail3"
	AnchorDetail3:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	AnchorDetail3:SetAlpha( 0, 0 )
	AnchorDetail3:setImage( RegisterMaterial( "hud_pip_lt_fluff" ), 0 )
	AnchorDetail3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 228, _1080p * 242, _1080p * -458, _1080p * -100 )
	self:addElement( AnchorDetail3 )
	self.AnchorDetail3 = AnchorDetail3
	
	local AnchorDetail2 = nil
	
	AnchorDetail2 = LUI.UIImage.new()
	AnchorDetail2.id = "AnchorDetail2"
	AnchorDetail2:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	AnchorDetail2:SetAlpha( 0, 0 )
	AnchorDetail2:setImage( RegisterMaterial( "hud_pip_rt_fluff1" ), 0 )
	AnchorDetail2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 847.94, _1080p * 860.06, _1080p * -452.69, _1080p * -406.57 )
	self:addElement( AnchorDetail2 )
	self.AnchorDetail2 = AnchorDetail2
	
	local usnaBG = nil
	
	usnaBG = LUI.UIImage.new()
	usnaBG.id = "usnaBG"
	usnaBG:SetRGBFromInt( 0, 0 )
	usnaBG:SetAlpha( 0, 0 )
	usnaBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 248.69, _1080p * 849, _1080p * -460, _1080p * -100.84 )
	self:addElement( usnaBG )
	self.usnaBG = usnaBG
	
	local usnaLogo = nil
	
	usnaLogo = LUI.UIImage.new()
	usnaLogo.id = "usnaLogo"
	usnaLogo:SetAlpha( 0, 0 )
	usnaLogo:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
	usnaLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 448.85, _1080p * 648.85, _1080p * -380.42, _1080p * -180.42 )
	self:addElement( usnaLogo )
	self.usnaLogo = usnaLogo
	
	local IncomingTransmissionText = nil
	
	IncomingTransmissionText = LUI.UIStyledText.new()
	IncomingTransmissionText.id = "IncomingTransmissionText"
	IncomingTransmissionText:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	IncomingTransmissionText:SetAlpha( 0, 0 )
	IncomingTransmissionText:setText( "Incoming Transmission", 0 )
	IncomingTransmissionText:SetFontSize( 22 * _1080p )
	IncomingTransmissionText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	IncomingTransmissionText:SetAlignment( LUI.Alignment.Left )
	IncomingTransmissionText:SetDecodeLetterLength( 120 )
	IncomingTransmissionText:SetDecodeMaxRandChars( 3 )
	IncomingTransmissionText:SetDecodeUpdatesPerLetter( 8 )
	IncomingTransmissionText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 257.8, _1080p * 757.8, _1080p * -484, _1080p * -462 )
	self:addElement( IncomingTransmissionText )
	self.IncomingTransmissionText = IncomingTransmissionText
	
	local WindowBorder = nil
	
	WindowBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	WindowBorder.id = "WindowBorder"
	WindowBorder:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	WindowBorder:SetAlpha( 0, 0 )
	WindowBorder:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -640, _1080p * 640, _1080p * -375, _1080p * 345 )
	self:addElement( WindowBorder )
	self.WindowBorder = WindowBorder
	
	local DigiText1 = nil
	
	DigiText1 = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 20,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	DigiText1.id = "DigiText1"
	DigiText1:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	DigiText1:SetAlpha( 0, 0 )
	DigiText1:SetFontSize( 12 * _1080p )
	DigiText1:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DigiText1:SetAlignment( LUI.Alignment.Right )
	DigiText1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 391.7, _1080p * 630.7, _1080p * -403.57, _1080p * -391.57 )
	self:addElement( DigiText1 )
	self.DigiText1 = DigiText1
	
	local DigiText2 = nil
	
	DigiText2 = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 8,
		minValue = 0,
		maxValue = 100000000,
		longWait = 300,
		shortWaitMin = 15,
		shortWaitMax = 40,
		pulsesMin = 2,
		pulsesMax = 11,
		controllerIndex = f1_local1
	} )
	DigiText2.id = "DigiText2"
	DigiText2:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	DigiText2:SetAlpha( 0, 0 )
	DigiText2:SetFontSize( 12 * _1080p )
	DigiText2:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DigiText2:SetAlignment( LUI.Alignment.Right )
	DigiText2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 391.7, _1080p * 630.7, _1080p * 355, _1080p * 367 )
	self:addElement( DigiText2 )
	self.DigiText2 = DigiText2
	
	local FrameDetail1 = nil
	
	FrameDetail1 = LUI.UIImage.new()
	FrameDetail1.id = "FrameDetail1"
	FrameDetail1:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameDetail1:SetAlpha( 0, 0 )
	FrameDetail1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -640, _1080p * -636, _1080p * -399.57, _1080p * -395.57 )
	self:addElement( FrameDetail1 )
	self.FrameDetail1 = FrameDetail1
	
	local FrameDetail2 = nil
	
	FrameDetail2 = LUI.UIImage.new()
	FrameDetail2.id = "FrameDetail2"
	FrameDetail2:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameDetail2:SetAlpha( 0, 0 )
	FrameDetail2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 636, _1080p * 640, _1080p * -399.57, _1080p * -395.57 )
	self:addElement( FrameDetail2 )
	self.FrameDetail2 = FrameDetail2
	
	local FrameDetail3 = nil
	
	FrameDetail3 = LUI.UIImage.new()
	FrameDetail3.id = "FrameDetail3"
	FrameDetail3:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameDetail3:SetAlpha( 0, 0 )
	FrameDetail3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -640, _1080p * -636, _1080p * 359, _1080p * 363 )
	self:addElement( FrameDetail3 )
	self.FrameDetail3 = FrameDetail3
	
	local FrameDetail4 = nil
	
	FrameDetail4 = LUI.UIImage.new()
	FrameDetail4.id = "FrameDetail4"
	FrameDetail4:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameDetail4:SetAlpha( 0, 0 )
	FrameDetail4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 636, _1080p * 640, _1080p * 364, _1080p * 368 )
	self:addElement( FrameDetail4 )
	self.FrameDetail4 = FrameDetail4
	
	local ContentLabel = nil
	
	ContentLabel = LUI.UIText.new()
	ContentLabel.id = "ContentLabel"
	ContentLabel:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	ContentLabel:SetAlpha( 0, 0 )
	ContentLabel:setText( "UNN CONFIDENTIAL CONTENT", 0 )
	ContentLabel:SetFontSize( 12 * _1080p )
	ContentLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ContentLabel:SetAlignment( LUI.Alignment.Left )
	ContentLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 332, _1080p * 453.5, _1080p * 896, _1080p * 908 )
	self:addElement( ContentLabel )
	self.ContentLabel = ContentLabel
	
	local JackalPipGlitch = nil
	
	JackalPipGlitch = MenuBuilder.BuildRegisteredType( "JackalPipGlitch", {
		controllerIndex = f1_local1
	} )
	JackalPipGlitch.id = "JackalPipGlitch"
	JackalPipGlitch:SetAlpha( 0, 0 )
	JackalPipGlitch:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -540, _1080p * 540 )
	self:addElement( JackalPipGlitch )
	self.JackalPipGlitch = JackalPipGlitch
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FrameCornerUL:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.FrameCornerUL:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.FrameCornerUL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 824, _1080p * 844, _1080p * -486, _1080p * -409, 0 )
				end,
				function ()
					return self.FrameCornerUL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 233.8, _1080p * 253.8, _1080p * -486, _1080p * -409, 140 )
				end,
				function ()
					return self.FrameCornerUL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 233.8, _1080p * 253.8, _1080p * -486, _1080p * -409, 359 )
				end,
				function ()
					return self.FrameCornerUL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -660, _1080p * -640, _1080p * -418, _1080p * -341, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		FrameCornerBR:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.FrameCornerBR:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.FrameCornerBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 864, _1080p * 844, _1080p * -74.84, _1080p * -151.84, 500 )
				end,
				function ()
					return self.FrameCornerBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 660, _1080p * 640, _1080p * 383, _1080p * 306, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		FrameCornerUR:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.FrameCornerUR:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.FrameCornerUR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 864, _1080p * 844, _1080p * -486, _1080p * -409, 500 )
				end,
				function ()
					return self.FrameCornerUR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 660, _1080p * 640, _1080p * -418, _1080p * -341, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		FrameCornerBL:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.FrameCornerBL:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.FrameCornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 824, _1080p * 844, _1080p * -74.84, _1080p * -151.84, 0 )
				end,
				function ()
					return self.FrameCornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 233.8, _1080p * 253.8, _1080p * -74.84, _1080p * -151.84, 140 )
				end,
				function ()
					return self.FrameCornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 233.8, _1080p * 253.8, _1080p * -74.84, _1080p * -151.84, 359 )
				end,
				function ()
					return self.FrameCornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -660, _1080p * -640, _1080p * 383, _1080p * 306, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		FrameCornerAnchor:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.FrameCornerAnchor:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.FrameCornerAnchor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 864, _1080p * 844, _1080p * -460, _1080p * -87.84, 0 )
				end,
				function ()
					return self.FrameCornerAnchor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 889, _1080p * 869, _1080p * -460, _1080p * -87.84, 140, LUI.EASING.outBack )
				end
			}
		} )
		AnchorDetail1:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.AnchorDetail1:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.AnchorDetail1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 847, _1080p * 861, _1080p * -408, _1080p * -342, 0 )
				end,
				function ()
					return self.AnchorDetail1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 872, _1080p * 886, _1080p * -408, _1080p * -342, 140, LUI.EASING.outBack )
				end
			}
		} )
		AnchorDetail3:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.AnchorDetail3:SetAlpha( 0, 140 )
				end,
				function ()
					return self.AnchorDetail3:SetAlpha( 0.6, 10 )
				end
			},
			{
				function ()
					return self.AnchorDetail3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 234, _1080p * 248, _1080p * -458, _1080p * -100, 140 )
				end,
				function ()
					return self.AnchorDetail3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 220, _1080p * 234, _1080p * -458, _1080p * -100, 109 )
				end,
				function ()
					return self.AnchorDetail3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 220, _1080p * 234, _1080p * -458, _1080p * -100, 250 )
				end,
				function ()
					return self.AnchorDetail3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -674, _1080p * -660, _1080p * -194, _1080p * 164, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		AnchorDetail2:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.AnchorDetail2:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.AnchorDetail2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 847.94, _1080p * 860.06, _1080p * -453.69, _1080p * -407.57, 0 )
				end,
				function ()
					return self.AnchorDetail2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 872.94, _1080p * 885.06, _1080p * -453.69, _1080p * -407.57, 140, LUI.EASING.outBack )
				end
			}
		} )
		usnaBG:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.usnaBG:SetScale( -0.5, 0 )
				end,
				function ()
					return self.usnaBG:SetScale( 0, 350 )
				end
			},
			{
				function ()
					return self.usnaBG:SetAlpha( 0, 0 )
				end,
				function ()
					return self.usnaBG:SetAlpha( 0.6, 180 )
				end,
				function ()
					return self.usnaBG:SetAlpha( 0.6, 300 )
				end,
				function ()
					return self.usnaBG:SetAlpha( 0, 520, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.usnaBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 248.69, _1080p * 849, _1080p * -460, _1080p * -100.84, 479 )
				end,
				function ()
					return self.usnaBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -660, _1080p * 638, _1080p * -375, _1080p * 344.5, 520, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		usnaLogo:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.usnaLogo:SetScale( -0.5, 0 )
				end,
				function ()
					return self.usnaLogo:SetScale( 0, 350 )
				end
			},
			{
				function ()
					return self.usnaLogo:SetAlpha( 0, 80 )
				end,
				function ()
					return self.usnaLogo:SetAlpha( 0.6, 70 )
				end,
				function ()
					return self.usnaLogo:SetAlpha( 0.6, 330 )
				end,
				function ()
					return self.usnaLogo:SetAlpha( 0, 280, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.usnaLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 447.85, _1080p * 647.85, _1080p * -380.42, _1080p * -180.42, 0 )
				end,
				function ()
					return self.usnaLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 447.85, _1080p * 647.85, _1080p * -380.42, _1080p * -180.42, 479 )
				end,
				function ()
					return self.usnaLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 185.03, _1080p * 385.03, _1080p * -236.65, _1080p * -36.65, 280, LUI.EASING.inQuadratic )
				end
			}
		} )
		IncomingTransmissionText:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.IncomingTransmissionText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.IncomingTransmissionText:SetAlpha( 0, 190 )
				end,
				function ()
					return self.IncomingTransmissionText:SetAlpha( 0.8, 10 )
				end,
				function ()
					return self.IncomingTransmissionText:SetAlpha( 0.8, 800, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.IncomingTransmissionText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 257.8, _1080p * 757.8, _1080p * -483, _1080p * -463, 500 )
				end,
				function ()
					return self.IncomingTransmissionText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -619, _1080p * -119, _1080p * -407.57, _1080p * -387.57, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		WindowBorder:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.WindowBorder:SetAlpha( 0, 990 )
				end,
				function ()
					return self.WindowBorder:SetAlpha( 0.8, 10 )
				end
			},
			{
				function ()
					return self.WindowBorder:SetBorderThicknessRight( _1080p * 1.5, 1000 )
				end
			},
			{
				function ()
					return self.WindowBorder:SetBorderThicknessTop( _1080p * 1.5, 1000 )
				end
			},
			{
				function ()
					return self.WindowBorder:SetBorderThicknessLeft( _1080p * 1.5, 1000 )
				end
			},
			{
				function ()
					return self.WindowBorder:SetBorderThicknessBottom( _1080p * 1.5, 1000 )
				end
			}
		} )
		DigiText1:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.DigiText1:SetAlpha( 0, 990 )
				end,
				function ()
					return self.DigiText1:SetAlpha( 0.8, 10 )
				end
			}
		} )
		DigiText2:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.DigiText2:SetAlpha( 0, 990 )
				end,
				function ()
					return self.DigiText2:SetAlpha( 0.8, 10 )
				end
			}
		} )
		FrameDetail1:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.FrameDetail1:SetAlpha( 0, 990 )
				end,
				function ()
					return self.FrameDetail1:SetAlpha( 0.8, 10 )
				end
			}
		} )
		FrameDetail2:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.FrameDetail2:SetAlpha( 0, 990 )
				end,
				function ()
					return self.FrameDetail2:SetAlpha( 0.8, 10 )
				end
			}
		} )
		FrameDetail3:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.FrameDetail3:SetAlpha( 0, 990 )
				end,
				function ()
					return self.FrameDetail3:SetAlpha( 0.8, 10 )
				end
			}
		} )
		FrameDetail4:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.FrameDetail4:SetAlpha( 0, 990 )
				end
			},
			{
				function ()
					return self.FrameDetail4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 636, _1080p * 640, _1080p * 359, _1080p * 363, 1000 )
				end
			}
		} )
		ContentLabel:RegisterAnimationSequence( "TransitionBegin", {
			{
				function ()
					return self.ContentLabel:SetAlpha( 0, 990 )
				end,
				function ()
					return self.ContentLabel:SetAlpha( 0.8, 10 )
				end
			}
		} )
		self._sequences.TransitionBegin = function ()
			FrameCornerUL:AnimateSequence( "TransitionBegin" )
			FrameCornerBR:AnimateSequence( "TransitionBegin" )
			FrameCornerUR:AnimateSequence( "TransitionBegin" )
			FrameCornerBL:AnimateSequence( "TransitionBegin" )
			FrameCornerAnchor:AnimateSequence( "TransitionBegin" )
			AnchorDetail1:AnimateSequence( "TransitionBegin" )
			AnchorDetail3:AnimateSequence( "TransitionBegin" )
			AnchorDetail2:AnimateSequence( "TransitionBegin" )
			usnaBG:AnimateSequence( "TransitionBegin" )
			usnaLogo:AnimateSequence( "TransitionBegin" )
			IncomingTransmissionText:AnimateSequence( "TransitionBegin" )
			WindowBorder:AnimateSequence( "TransitionBegin" )
			DigiText1:AnimateSequence( "TransitionBegin" )
			DigiText2:AnimateSequence( "TransitionBegin" )
			FrameDetail1:AnimateSequence( "TransitionBegin" )
			FrameDetail2:AnimateSequence( "TransitionBegin" )
			FrameDetail3:AnimateSequence( "TransitionBegin" )
			FrameDetail4:AnimateSequence( "TransitionBegin" )
			ContentLabel:AnimateSequence( "TransitionBegin" )
		end
		
		FrameCornerUL:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.FrameCornerUL:SetAlpha( 0.8, 350 )
				end,
				function ()
					return self.FrameCornerUL:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.FrameCornerUL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -660, _1080p * -640, _1080p * -418, _1080p * -341, 0 )
				end,
				function ()
					return self.FrameCornerUL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 233.8, _1080p * 253.8, _1080p * -486, _1080p * -409, 100 )
				end,
				function ()
					return self.FrameCornerUL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 233.8, _1080p * 253.8, _1080p * -486, _1080p * -409, 149 )
				end,
				function ()
					return self.FrameCornerUL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 824, _1080p * 844, _1080p * -486, _1080p * -409, 99 )
				end
			}
		} )
		FrameCornerBR:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.FrameCornerBR:SetAlpha( 0.8, 350 )
				end,
				function ()
					return self.FrameCornerBR:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.FrameCornerBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 660, _1080p * 640, _1080p * 383, _1080p * 306, 0 )
				end,
				function ()
					return self.FrameCornerBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 864, _1080p * 844, _1080p * -74.84, _1080p * -151.84, 100 )
				end
			}
		} )
		FrameCornerUR:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.FrameCornerUR:SetAlpha( 0.8, 350 )
				end,
				function ()
					return self.FrameCornerUR:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.FrameCornerUR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 660, _1080p * 640, _1080p * -418, _1080p * -341, 0 )
				end,
				function ()
					return self.FrameCornerUR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 864, _1080p * 844, _1080p * -486, _1080p * -409, 100 )
				end
			}
		} )
		FrameCornerBL:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.FrameCornerBL:SetAlpha( 0.8, 350 )
				end,
				function ()
					return self.FrameCornerBL:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.FrameCornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -660, _1080p * -640, _1080p * 383, _1080p * 306, 0 )
				end,
				function ()
					return self.FrameCornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 233.8, _1080p * 253.8, _1080p * -74.84, _1080p * -151.84, 100 )
				end,
				function ()
					return self.FrameCornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 233.8, _1080p * 253.8, _1080p * -74.84, _1080p * -151.84, 149 )
				end,
				function ()
					return self.FrameCornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 824, _1080p * 844, _1080p * -74.84, _1080p * -151.84, 99 )
				end
			}
		} )
		FrameCornerAnchor:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.FrameCornerAnchor:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.FrameCornerAnchor:SetAlpha( 0.6, 290 )
				end,
				function ()
					return self.FrameCornerAnchor:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.FrameCornerAnchor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 889, _1080p * 869, _1080p * -460, _1080p * -87.84, 250 )
				end,
				function ()
					return self.FrameCornerAnchor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 864, _1080p * 844, _1080p * -460, _1080p * -87.84, 50 )
				end
			}
		} )
		AnchorDetail1:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.AnchorDetail1:SetAlpha( 0.4, 290 )
				end,
				function ()
					return self.AnchorDetail1:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.AnchorDetail1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 872, _1080p * 886, _1080p * -408, _1080p * -342, 250 )
				end,
				function ()
					return self.AnchorDetail1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 847, _1080p * 861, _1080p * -408, _1080p * -342, 39 )
				end
			}
		} )
		AnchorDetail3:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.AnchorDetail3:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.AnchorDetail3:SetAlpha( 0.6, 250 )
				end,
				function ()
					return self.AnchorDetail3:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.AnchorDetail3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -674, _1080p * -660, _1080p * -194, _1080p * 164, 0 )
				end,
				function ()
					return self.AnchorDetail3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 220, _1080p * 234, _1080p * -458, _1080p * -100, 100 )
				end,
				function ()
					return self.AnchorDetail3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 220, _1080p * 234, _1080p * -458, _1080p * -100, 100 )
				end,
				function ()
					return self.AnchorDetail3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 220, _1080p * 234, _1080p * -458, _1080p * -100, 49 )
				end
			}
		} )
		AnchorDetail2:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.AnchorDetail2:SetAlpha( 0.6, 290 )
				end,
				function ()
					return self.AnchorDetail2:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.AnchorDetail2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 872.94, _1080p * 885.06, _1080p * -453.69, _1080p * -407.57, 250 )
				end,
				function ()
					return self.AnchorDetail2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 847.94, _1080p * 860.06, _1080p * -453.69, _1080p * -407.57, 39 )
				end
			}
		} )
		usnaBG:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.usnaBG:SetAlpha( 0, 0 )
				end,
				function ()
					return self.usnaBG:SetAlpha( 0.6, 100 )
				end,
				function ()
					return self.usnaBG:SetAlpha( 0.6, 100 )
				end,
				function ()
					return self.usnaBG:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.usnaBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -650, _1080p * 636, _1080p * -375, _1080p * 344.5, 0 )
				end,
				function ()
					return self.usnaBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 248.69, _1080p * 849, _1080p * -460, _1080p * -100.84, 100 )
				end
			}
		} )
		usnaLogo:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.usnaLogo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.usnaLogo:SetAlpha( 0.6, 100 )
				end,
				function ()
					return self.usnaLogo:SetAlpha( 0.6, 140 )
				end,
				function ()
					return self.usnaLogo:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.usnaLogo:SetScale( 0.5, 0 )
				end,
				function ()
					return self.usnaLogo:SetScale( 0, 100 )
				end,
				function ()
					return self.usnaLogo:SetScale( 0, 100 )
				end,
				function ()
					return self.usnaLogo:SetScale( -0.5, 50 )
				end
			},
			{
				function ()
					return self.usnaLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -146, _1080p * 54, 0 )
				end,
				function ()
					return self.usnaLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 448.85, _1080p * 648.85, _1080p * -380.42, _1080p * -180.42, 100 )
				end
			}
		} )
		IncomingTransmissionText:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.IncomingTransmissionText:SetAlpha( 0.8, 250 )
				end,
				function ()
					return self.IncomingTransmissionText:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.IncomingTransmissionText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -619, _1080p * -119, _1080p * -407.57, _1080p * -387.57, 0 )
				end,
				function ()
					return self.IncomingTransmissionText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 257.85, _1080p * 757.85, _1080p * -483, _1080p * -463, 100 )
				end,
				function ()
					return self.IncomingTransmissionText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 257.85, _1080p * 757.85, _1080p * -483, _1080p * -463, 899 )
				end
			}
		} )
		WindowBorder:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.WindowBorder:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.WindowBorder:SetAlpha( 0, 10 )
				end
			}
		} )
		DigiText1:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.DigiText1:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.DigiText1:SetAlpha( 0, 10 )
				end
			}
		} )
		DigiText2:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.DigiText2:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.DigiText2:SetAlpha( 0, 10 )
				end
			}
		} )
		FrameDetail1:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.FrameDetail1:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.FrameDetail1:SetAlpha( 0, 10 )
				end
			}
		} )
		FrameDetail2:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.FrameDetail2:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.FrameDetail2:SetAlpha( 0, 10 )
				end
			}
		} )
		FrameDetail3:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.FrameDetail3:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.FrameDetail3:SetAlpha( 0, 10 )
				end
			}
		} )
		FrameDetail4:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.FrameDetail4:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.FrameDetail4:SetAlpha( 0, 10 )
				end
			}
		} )
		ContentLabel:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.ContentLabel:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.ContentLabel:SetAlpha( 0, 10 )
				end
			}
		} )
		JackalPipGlitch:RegisterAnimationSequence( "TransitionEnd", {
			{
				function ()
					return self.JackalPipGlitch:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.TransitionEnd = function ()
			FrameCornerUL:AnimateSequence( "TransitionEnd" )
			FrameCornerBR:AnimateSequence( "TransitionEnd" )
			FrameCornerUR:AnimateSequence( "TransitionEnd" )
			FrameCornerBL:AnimateSequence( "TransitionEnd" )
			FrameCornerAnchor:AnimateSequence( "TransitionEnd" )
			AnchorDetail1:AnimateSequence( "TransitionEnd" )
			AnchorDetail3:AnimateSequence( "TransitionEnd" )
			AnchorDetail2:AnimateSequence( "TransitionEnd" )
			usnaBG:AnimateSequence( "TransitionEnd" )
			usnaLogo:AnimateSequence( "TransitionEnd" )
			IncomingTransmissionText:AnimateSequence( "TransitionEnd" )
			WindowBorder:AnimateSequence( "TransitionEnd" )
			DigiText1:AnimateSequence( "TransitionEnd" )
			DigiText2:AnimateSequence( "TransitionEnd" )
			FrameDetail1:AnimateSequence( "TransitionEnd" )
			FrameDetail2:AnimateSequence( "TransitionEnd" )
			FrameDetail3:AnimateSequence( "TransitionEnd" )
			FrameDetail4:AnimateSequence( "TransitionEnd" )
			ContentLabel:AnimateSequence( "TransitionEnd" )
			JackalPipGlitch:AnimateSequence( "TransitionEnd" )
		end
		
		FrameCornerUL:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.FrameCornerUL:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FrameCornerUL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -660, _1080p * -640, _1080p * -418, _1080p * -341, 0 )
				end
			}
		} )
		FrameCornerBR:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.FrameCornerBR:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FrameCornerBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 660, _1080p * 640, _1080p * 383, _1080p * 306, 0 )
				end
			}
		} )
		FrameCornerUR:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.FrameCornerUR:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.FrameCornerUR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 660, _1080p * 640, _1080p * -418, _1080p * -341, 0 )
				end
			}
		} )
		FrameCornerBL:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.FrameCornerBL:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.FrameCornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -660, _1080p * -640, _1080p * 383, _1080p * 306, 0 )
				end
			}
		} )
		FrameCornerAnchor:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.FrameCornerAnchor:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.FrameCornerAnchor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 889, _1080p * 869, _1080p * -460, _1080p * -87.84, 0 )
				end
			}
		} )
		AnchorDetail1:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.AnchorDetail1:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.AnchorDetail1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 872, _1080p * 886, _1080p * -408, _1080p * -342, 0 )
				end
			}
		} )
		AnchorDetail3:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.AnchorDetail3:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.AnchorDetail3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -674, _1080p * -660, _1080p * -194, _1080p * 164, 0 )
				end
			}
		} )
		AnchorDetail2:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.AnchorDetail2:SetAlpha( 0.6, 0 )
				end
			}
		} )
		usnaBG:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.usnaBG:SetAlpha( 0, 0 )
				end
			}
		} )
		usnaLogo:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.usnaLogo:SetAlpha( 0, 0 )
				end
			}
		} )
		IncomingTransmissionText:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.IncomingTransmissionText:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.IncomingTransmissionText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -619, _1080p * -119, _1080p * -407, _1080p * -387, 0 )
				end
			}
		} )
		WindowBorder:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.WindowBorder:SetAlpha( 0.8, 0 )
				end
			}
		} )
		DigiText1:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.DigiText1:SetAlpha( 0.8, 0 )
				end
			}
		} )
		DigiText2:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.DigiText2:SetAlpha( 0.8, 0 )
				end
			}
		} )
		FrameDetail1:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.FrameDetail1:SetAlpha( 0.8, 0 )
				end
			}
		} )
		FrameDetail2:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.FrameDetail2:SetAlpha( 0.8, 0 )
				end
			}
		} )
		FrameDetail3:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.FrameDetail3:SetAlpha( 0.8, 0 )
				end
			}
		} )
		FrameDetail4:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.FrameDetail4:SetAlpha( 0.8, 0 )
				end
			}
		} )
		ContentLabel:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.ContentLabel:SetAlpha( 0.8, 0 )
				end
			}
		} )
		JackalPipGlitch:RegisterAnimationSequence( "Transitioning", {
			{
				function ()
					return self.JackalPipGlitch:SetAlpha( 1, 0 )
				end,
				function ()
					return self.JackalPipGlitch:SetAlpha( 1, 2500 )
				end,
				function ()
					return self.JackalPipGlitch:SetAlpha( 0, 500 )
				end
			}
		} )
		self._sequences.Transitioning = function ()
			FrameCornerUL:AnimateSequence( "Transitioning" )
			FrameCornerBR:AnimateSequence( "Transitioning" )
			FrameCornerUR:AnimateSequence( "Transitioning" )
			FrameCornerBL:AnimateSequence( "Transitioning" )
			FrameCornerAnchor:AnimateSequence( "Transitioning" )
			AnchorDetail1:AnimateSequence( "Transitioning" )
			AnchorDetail3:AnimateSequence( "Transitioning" )
			AnchorDetail2:AnimateSequence( "Transitioning" )
			usnaBG:AnimateSequence( "Transitioning" )
			usnaLogo:AnimateSequence( "Transitioning" )
			IncomingTransmissionText:AnimateSequence( "Transitioning" )
			WindowBorder:AnimateSequence( "Transitioning" )
			DigiText1:AnimateSequence( "Transitioning" )
			DigiText2:AnimateSequence( "Transitioning" )
			FrameDetail1:AnimateSequence( "Transitioning" )
			FrameDetail2:AnimateSequence( "Transitioning" )
			FrameDetail3:AnimateSequence( "Transitioning" )
			FrameDetail4:AnimateSequence( "Transitioning" )
			ContentLabel:AnimateSequence( "Transitioning" )
			JackalPipGlitch:AnimateSequence( "Transitioning" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.levelTransition:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.levelTransition:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.levelTransition:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "TransitionBegin" )
		end
		if DataSources.inGame.SP.levelTransition:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.levelTransition:GetValue( f1_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Transitioning" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "JackalPipGlitch",
				sequenceName = "PlayGlitch",
				elementPath = "JackalPipGlitch"
			} )
		end
		if DataSources.inGame.SP.levelTransition:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.levelTransition:GetValue( f1_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "TransitionEnd" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "JackalPipGlitch",
				sequenceName = "DefaultSequence",
				elementPath = "JackalPipGlitch"
			} )
		end
	end )
	return self
end

MenuBuilder.registerType( "LevelTransition", LevelTransition )
LockTable( _M )
