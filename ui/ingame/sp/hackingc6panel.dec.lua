local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = DataSources.inGame.SP.hackControlRobotType
	local f1_local1 = function ()
		if f1_local0:GetValue( f1_arg1 ) == 1 then
			ACTIONS.AnimateSequence( f1_arg0, "C8" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "C6" )
		end
	end
	
	f1_local1()
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local1 )
end

function HackingC6Panel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 600 * _1080p )
	self.id = "HackingC6Panel"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local TopBorder = nil
	
	TopBorder = LUI.UIImage.new()
	TopBorder.id = "TopBorder"
	TopBorder:SetUseAA( true )
	TopBorder:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -299.5, _1080p * 0.5, 0, _1080p * 2 )
	self:addElement( TopBorder )
	self.TopBorder = TopBorder
	
	local BottomBorder = nil
	
	BottomBorder = LUI.UIImage.new()
	BottomBorder.id = "BottomBorder"
	BottomBorder:SetUseAA( true )
	BottomBorder:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -299.5, _1080p * 0.5, _1080p * -2, 0 )
	self:addElement( BottomBorder )
	self.BottomBorder = BottomBorder
	
	local PrintFrameTop = nil
	
	PrintFrameTop = LUI.UIImage.new()
	PrintFrameTop.id = "PrintFrameTop"
	PrintFrameTop:SetZRotation( 180, 0 )
	PrintFrameTop:setImage( RegisterMaterial( "widg_hack_rt_does_frame" ), 0 )
	PrintFrameTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -243.5, _1080p * -55.5, _1080p * -242, _1080p * -234 )
	self:addElement( PrintFrameTop )
	self.PrintFrameTop = PrintFrameTop
	
	local PrintFrameBottom = nil
	
	PrintFrameBottom = LUI.UIImage.new()
	PrintFrameBottom.id = "PrintFrameBottom"
	PrintFrameBottom:setImage( RegisterMaterial( "widg_hack_rt_does_frame" ), 0 )
	PrintFrameBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -243.5, _1080p * -55.5, _1080p * -200, _1080p * -192 )
	self:addElement( PrintFrameBottom )
	self.PrintFrameBottom = PrintFrameBottom
	
	local Box1 = nil
	
	Box1 = MenuBuilder.BuildRegisteredType( "GenericBoxFillAndStroke", {
		controllerIndex = f3_local1
	} )
	Box1.id = "Box1"
	Box1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -263.5, _1080p * -213.5, _1080p * -259, _1080p * -249 )
	self:addElement( Box1 )
	self.Box1 = Box1
	
	local Box2 = nil
	
	Box2 = MenuBuilder.BuildRegisteredType( "GenericBoxFillAndStroke", {
		controllerIndex = f3_local1
	} )
	Box2.id = "Box2"
	Box2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -203.5, _1080p * -153.5, _1080p * -259, _1080p * -249 )
	self:addElement( Box2 )
	self.Box2 = Box2
	
	local Box3 = nil
	
	Box3 = MenuBuilder.BuildRegisteredType( "GenericBoxFillAndStroke", {
		controllerIndex = f3_local1
	} )
	Box3.id = "Box3"
	Box3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -143.5, _1080p * -93.5, _1080p * -259, _1080p * -249 )
	self:addElement( Box3 )
	self.Box3 = Box3
	
	local Box4 = nil
	
	Box4 = MenuBuilder.BuildRegisteredType( "GenericBoxFillAndStroke", {
		controllerIndex = f3_local1
	} )
	Box4.id = "Box4"
	Box4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -83.5, _1080p * -33.5, _1080p * -259, _1080p * -249 )
	self:addElement( Box4 )
	self.Box4 = Box4
	
	local C6Logo = nil
	
	C6Logo = LUI.UIImage.new()
	C6Logo.id = "C6Logo"
	C6Logo:setImage( RegisterMaterial( "widg_hack_c6_dots" ), 0 )
	C6Logo:SetBlendMode( BLEND_MODE.addWithAlpha )
	C6Logo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -65.5, _1080p * -33.5, _1080p * -284.79, _1080p * -268.79 )
	self:addElement( C6Logo )
	self.C6Logo = C6Logo
	
	local Tracking = nil
	
	Tracking = LUI.UIText.new()
	Tracking.id = "Tracking"
	Tracking:setText( ToUpperCase( Engine.Localize( "HUD_TRACKING" ) ), 0 )
	Tracking:SetFontSize( 16 * _1080p )
	Tracking:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Tracking:SetAlignment( LUI.Alignment.Left )
	Tracking:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -263.5, _1080p * -93.5, _1080p * -283.79, _1080p * -267.79 )
	self:addElement( Tracking )
	self.Tracking = Tracking
	
	local RobotTypeName = nil
	
	RobotTypeName = LUI.UIStyledText.new()
	RobotTypeName.id = "RobotTypeName"
	RobotTypeName:setText( Engine.Localize( "HUD_HACK_C6_ROBOT" ), 0 )
	RobotTypeName:SetFontSize( 32 * _1080p )
	RobotTypeName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RobotTypeName:SetAlignment( LUI.Alignment.Center )
	RobotTypeName:SetOptOutRightToLeftAlignmentFlip( true )
	RobotTypeName:SetDecodeLetterLength( 60 )
	RobotTypeName:SetDecodeMaxRandChars( 10 )
	RobotTypeName:SetDecodeUpdatesPerLetter( 3 )
	RobotTypeName:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, 0, _1080p * 253.21, _1080p * 285.21 )
	self:addElement( RobotTypeName )
	self.RobotTypeName = RobotTypeName
	
	local RobotTypeBaseFront = nil
	
	RobotTypeBaseFront = LUI.UIImage.new()
	RobotTypeBaseFront.id = "RobotTypeBaseFront"
	RobotTypeBaseFront:setImage( RegisterMaterial( "widg_hack_c6_image_front" ), 0 )
	RobotTypeBaseFront:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -297.5, _1080p * -109.5, _1080p * -157.79, _1080p * 218.21 )
	self:addElement( RobotTypeBaseFront )
	self.RobotTypeBaseFront = RobotTypeBaseFront
	
	local RobotTypeBaseSide = nil
	
	RobotTypeBaseSide = LUI.UIImage.new()
	RobotTypeBaseSide.id = "RobotTypeBaseSide"
	RobotTypeBaseSide:setImage( RegisterMaterial( "widg_hack_c6_image_side" ), 0 )
	RobotTypeBaseSide:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -109.5, _1080p * -15.5, _1080p * -157.79, _1080p * 218.21 )
	self:addElement( RobotTypeBaseSide )
	self.RobotTypeBaseSide = RobotTypeBaseSide
	
	local RobotTypeBaseFrontHighlight = nil
	
	RobotTypeBaseFrontHighlight = LUI.UIImage.new()
	RobotTypeBaseFrontHighlight.id = "RobotTypeBaseFrontHighlight"
	RobotTypeBaseFrontHighlight:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	RobotTypeBaseFrontHighlight:SetAlpha( 0, 0 )
	RobotTypeBaseFrontHighlight:SetGlitchEnabled( true )
	RobotTypeBaseFrontHighlight:SetGlitchAmount( 1, 0 )
	RobotTypeBaseFrontHighlight:SetGlitchBlockWidth( 50, 0 )
	RobotTypeBaseFrontHighlight:SetGlitchBlockHeight( 50, 0 )
	RobotTypeBaseFrontHighlight:SetGlitchDistortionRange( 16, 0 )
	RobotTypeBaseFrontHighlight:SetGlitchScanlinePitch( 1, 0 )
	RobotTypeBaseFrontHighlight:SetGlitchMaskPitch( 1, 0 )
	RobotTypeBaseFrontHighlight:setImage( RegisterMaterial( "widg_hack_c6_highlight_front" ), 0 )
	RobotTypeBaseFrontHighlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	RobotTypeBaseFrontHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -310.05, _1080p * -96.95, _1080p * -131.79, _1080p * 226.21 )
	self:addElement( RobotTypeBaseFrontHighlight )
	self.RobotTypeBaseFrontHighlight = RobotTypeBaseFrontHighlight
	
	local RobotTypeBaseSideHighlight = nil
	
	RobotTypeBaseSideHighlight = LUI.UIImage.new()
	RobotTypeBaseSideHighlight.id = "RobotTypeBaseSideHighlight"
	RobotTypeBaseSideHighlight:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	RobotTypeBaseSideHighlight:SetAlpha( 0, 0 )
	RobotTypeBaseSideHighlight:SetGlitchEnabled( true )
	RobotTypeBaseSideHighlight:SetGlitchAmount( 1, 0 )
	RobotTypeBaseSideHighlight:SetGlitchBlockWidth( 50, 0 )
	RobotTypeBaseSideHighlight:SetGlitchBlockHeight( 50, 0 )
	RobotTypeBaseSideHighlight:SetGlitchDistortionRange( 16, 0 )
	RobotTypeBaseSideHighlight:SetGlitchScanlinePitch( 1, 0 )
	RobotTypeBaseSideHighlight:SetGlitchMaskPitch( 1, 0 )
	RobotTypeBaseSideHighlight:setImage( RegisterMaterial( "widg_hack_c6_highlight_side" ), 0 )
	RobotTypeBaseSideHighlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	RobotTypeBaseSideHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -110.74, _1080p * -23.84, _1080p * -164.79, _1080p * 195.21 )
	self:addElement( RobotTypeBaseSideHighlight )
	self.RobotTypeBaseSideHighlight = RobotTypeBaseSideHighlight
	
	local ChyronBlockElement = nil
	
	ChyronBlockElement = MenuBuilder.BuildRegisteredType( "ChyronBlock", {
		sourceFile = "sp/output_chyron_text.csv",
		linesPerBlock = 2,
		textLineDelay = 350,
		textFont = FONTS.GetFont( FONTS.MainBold.File ),
		textHeight = 12,
		chyronLetterSpeed = 10,
		chyronRandDhars = 5,
		chyronUpdatesPerLetter = 8,
		maxCharsPerLine = 20,
		controllerIndex = f3_local1
	} )
	ChyronBlockElement.id = "ChyronBlockElement"
	ChyronBlockElement:SetScale( -0.15, 0 )
	ChyronBlockElement:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ChyronBlockElement:SetFontSize( 12 * _1080p )
	ChyronBlockElement:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -237, _1080p * -58, _1080p * 66, _1080p * 100 )
	self:addElement( ChyronBlockElement )
	self.ChyronBlockElement = ChyronBlockElement
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RobotTypeName:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.RobotTypeName:SetAlpha( 0, 0 )
				end
			}
		} )
		RobotTypeBaseFrontHighlight:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.RobotTypeBaseFrontHighlight:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchAmount( 0, 0 )
				end
			}
		} )
		RobotTypeBaseSideHighlight:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.RobotTypeBaseSideHighlight:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchAmount( 0, 0 )
				end
			}
		} )
		self._sequences.Searching = function ()
			RobotTypeName:AnimateSequence( "Searching" )
			RobotTypeBaseFrontHighlight:AnimateSequence( "Searching" )
			RobotTypeBaseSideHighlight:AnimateSequence( "Searching" )
		end
		
		Box1:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.Box1.Fill:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Box1.Fill:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Box1.Fill:SetAlpha( 0.25, 190 )
				end
			}
		} )
		Box2:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.Box2.Fill:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Box2.Fill:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Box2.Fill:SetAlpha( 0.25, 190 )
				end
			}
		} )
		Box3:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.Box3.Fill:SetAlpha( 0, 400 )
				end,
				function ()
					return self.Box3.Fill:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Box3.Fill:SetAlpha( 0.25, 190 )
				end
			}
		} )
		Box4:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.Box4.Fill:SetAlpha( 0, 600 )
				end,
				function ()
					return self.Box4.Fill:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Box4.Fill:SetAlpha( 0.25, 190 )
				end
			}
		} )
		RobotTypeName:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.RobotTypeName:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Connecting = function ()
			Box1:AnimateSequence( "Connecting" )
			Box2:AnimateSequence( "Connecting" )
			Box3:AnimateSequence( "Connecting" )
			Box4:AnimateSequence( "Connecting" )
			RobotTypeName:AnimateSequence( "Connecting" )
		end
		
		RobotTypeBaseFrontHighlight:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchAmount( 0.08, 0 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchAmount( 0.22, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchAmount( 0.08, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchAmount( 0.22, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchAmount( 0.08, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchAmount( 0.22, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchAmount( 0.08, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchAmount( 0.22, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchAmount( 0, 30 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockWidth( 5, 0 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockWidth( 12, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockWidth( 5, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockWidth( 12, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockWidth( 5, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockWidth( 12, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockWidth( 5, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockWidth( 12, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockWidth( 15, 30 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockHeight( 2, 0 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockHeight( 5, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockHeight( 2, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockHeight( 5, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockHeight( 2, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockHeight( 5, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockHeight( 2, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockHeight( 5, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchBlockHeight( 6, 30 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchDistortionRange( 25, 0 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchDistortionRange( 40, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchDistortionRange( 25, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchDistortionRange( 40, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchDistortionRange( 25, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchDistortionRange( 40, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchDistortionRange( 25, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchDistortionRange( 40, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchDistortionRange( 20, 30 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchScanlinePitch( 1, 0 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchScanlinePitch( 21, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchScanlinePitch( 1, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchScanlinePitch( 21, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchScanlinePitch( 1, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchScanlinePitch( 21, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchScanlinePitch( 1, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchScanlinePitch( 21, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchScanlinePitch( 55, 30 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchMaskPitch( 1, 0 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchMaskPitch( 30, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchMaskPitch( 1, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchMaskPitch( 30, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchMaskPitch( 1, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchMaskPitch( 30, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchMaskPitch( 1, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchMaskPitch( 30, 30 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetGlitchMaskPitch( 45, 30 )
				end
			}
		} )
		RobotTypeBaseSideHighlight:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockWidth( 12, 120 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockWidth( 20, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockWidth( 5, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockWidth( 12, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockWidth( 5, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockWidth( 12, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockWidth( 5, 30 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockHeight( 5, 120 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockHeight( 2, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockHeight( 2, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockHeight( 5, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockHeight( 2, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockHeight( 5, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchBlockHeight( 2, 30 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchDistortionRange( 40, 120 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchDistortionRange( 4, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchDistortionRange( 25, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchDistortionRange( 40, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchDistortionRange( 25, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchDistortionRange( 40, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchDistortionRange( 25, 30 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchScanlinePitch( 21, 120 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchScanlinePitch( 55, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchScanlinePitch( 1, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchScanlinePitch( 21, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchScanlinePitch( 1, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchScanlinePitch( 21, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchScanlinePitch( 1, 30 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchMaskPitch( 30, 120 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchMaskPitch( 45, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchMaskPitch( 1, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchMaskPitch( 30, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchMaskPitch( 1, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchMaskPitch( 30, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchMaskPitch( 1, 30 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchAmount( 0.22, 120 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchAmount( 0, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchAmount( 0.08, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchAmount( 0.22, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchAmount( 0.08, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchAmount( 0.22, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchAmount( 0.08, 30 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetGlitchAmount( 0, 30 )
				end
			}
		} )
		self._sequences.Locked = function ()
			RobotTypeBaseFrontHighlight:AnimateSequence( "Locked" )
			RobotTypeBaseSideHighlight:AnimateSequence( "Locked" )
		end
		
		RobotTypeBaseFrontHighlight:RegisterAnimationSequence( "LockedLoop", {
			{
				function ()
					return self.RobotTypeBaseFrontHighlight:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetAlpha( 0.6, 960, LUI.EASING.outSine )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetAlpha( 0.9, 430, LUI.EASING.outSine )
				end,
				function ()
					return self.RobotTypeBaseFrontHighlight:SetAlpha( 0.8, 610, LUI.EASING.inSine )
				end
			}
		} )
		RobotTypeBaseSideHighlight:RegisterAnimationSequence( "LockedLoop", {
			{
				function ()
					return self.RobotTypeBaseSideHighlight:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetAlpha( 0.6, 960, LUI.EASING.outSine )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetAlpha( 0.9, 430, LUI.EASING.outSine )
				end,
				function ()
					return self.RobotTypeBaseSideHighlight:SetAlpha( 0.8, 610, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.LockedLoop = function ()
			RobotTypeBaseFrontHighlight:AnimateLoop( "LockedLoop" )
			RobotTypeBaseSideHighlight:AnimateLoop( "LockedLoop" )
		end
		
		RobotTypeName:RegisterAnimationSequence( "C6", {
			{
				function ()
					return self.RobotTypeName:setText( Engine.Localize( "HUD_HACK_C6_ROBOT" ), 0 )
				end
			}
		} )
		RobotTypeBaseFront:RegisterAnimationSequence( "C6", {
			{
				function ()
					return self.RobotTypeBaseFront:setImage( RegisterMaterial( "widg_hack_c6_image_front" ), 0 )
				end
			}
		} )
		RobotTypeBaseSide:RegisterAnimationSequence( "C6", {
			{
				function ()
					return self.RobotTypeBaseSide:setImage( RegisterMaterial( "widg_hack_c6_image_side" ), 0 )
				end
			}
		} )
		RobotTypeBaseFrontHighlight:RegisterAnimationSequence( "C6", {
			{
				function ()
					return self.RobotTypeBaseFrontHighlight:setImage( RegisterMaterial( "widg_hack_c6_highlight_front" ), 0 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseFrontHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -310.05, _1080p * -96.95, _1080p * -131.79, _1080p * 226.21, 0 )
				end
			}
		} )
		RobotTypeBaseSideHighlight:RegisterAnimationSequence( "C6", {
			{
				function ()
					return self.RobotTypeBaseSideHighlight:setImage( RegisterMaterial( "widg_hack_c6_highlight_side" ), 0 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseSideHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -110.74, _1080p * -23.84, _1080p * -164.79, _1080p * 195.21, 0 )
				end
			}
		} )
		self._sequences.C6 = function ()
			RobotTypeName:AnimateSequence( "C6" )
			RobotTypeBaseFront:AnimateSequence( "C6" )
			RobotTypeBaseSide:AnimateSequence( "C6" )
			RobotTypeBaseFrontHighlight:AnimateSequence( "C6" )
			RobotTypeBaseSideHighlight:AnimateSequence( "C6" )
		end
		
		RobotTypeName:RegisterAnimationSequence( "C8", {
			{
				function ()
					return self.RobotTypeName:setText( Engine.Localize( "HUD_HACK_C8_ROBOT" ), 0 )
				end
			}
		} )
		RobotTypeBaseFront:RegisterAnimationSequence( "C8", {
			{
				function ()
					return self.RobotTypeBaseFront:setImage( RegisterMaterial( "widg_hack_c8_image_front" ), 0 )
				end
			}
		} )
		RobotTypeBaseSide:RegisterAnimationSequence( "C8", {
			{
				function ()
					return self.RobotTypeBaseSide:setImage( RegisterMaterial( "widg_hack_c8_image_side" ), 0 )
				end
			}
		} )
		RobotTypeBaseFrontHighlight:RegisterAnimationSequence( "C8", {
			{
				function ()
					return self.RobotTypeBaseFrontHighlight:setImage( RegisterMaterial( "widg_hack_c8_highlight_front" ), 0 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseFrontHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -318.05, _1080p * -104.95, _1080p * -131.79, _1080p * 226.21, 0 )
				end
			}
		} )
		RobotTypeBaseSideHighlight:RegisterAnimationSequence( "C8", {
			{
				function ()
					return self.RobotTypeBaseSideHighlight:setImage( RegisterMaterial( "widg_hack_c8_highlight_side" ), 0 )
				end
			},
			{
				function ()
					return self.RobotTypeBaseSideHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -114.74, _1080p * -27.84, _1080p * -161.79, _1080p * 198.21, 0 )
				end
			}
		} )
		self._sequences.C8 = function ()
			RobotTypeName:AnimateSequence( "C8" )
			RobotTypeBaseFront:AnimateSequence( "C8" )
			RobotTypeBaseSide:AnimateSequence( "C8" )
			RobotTypeBaseFrontHighlight:AnimateSequence( "C8" )
			RobotTypeBaseSideHighlight:AnimateSequence( "C8" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.hackTargetingStatus:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f3_local1 ) == "searching" then
			ACTIONS.AnimateSequence( self, "Searching" )
		end
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f3_local1 ) == "connecting" then
			
		else
			
		end
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f3_local1 ) == "locked" then
			ACTIONS.AnimateSequence( self, "Locked" )
			ACTIONS.AnimateSequence( self, "LockedLoop" )
		end
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f3_local1 ) == "connecting" then
			ACTIONS.AnimateSequence( self, "Connecting" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "HackingC6Panel", HackingC6Panel )
LockTable( _M )
