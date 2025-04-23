local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HackingDetailsPanel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 600 * _1080p )
	self.id = "HackingDetailsPanel"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HackingOnlineDots = nil
	
	HackingOnlineDots = LUI.UIImage.new()
	HackingOnlineDots.id = "HackingOnlineDots"
	HackingOnlineDots:SetAlpha( 0.2, 0 )
	HackingOnlineDots:setImage( RegisterMaterial( "widg_hack_box_title_dotted" ), 0 )
	HackingOnlineDots:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 23, _1080p * 279, _1080p * 32.25, _1080p * 96.25 )
	self:addElement( HackingOnlineDots )
	self.HackingOnlineDots = HackingOnlineDots
	
	local Hacking = nil
	
	Hacking = MenuBuilder.BuildRegisteredType( "GenericTextBox", {
		controllerIndex = f1_local1
	} )
	Hacking.id = "Hacking"
	Hacking.Box.Fill:SetAlpha( 0.9, 0 )
	Hacking.Text:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	Hacking.Text:SetRGBFromInt( 0, 0 )
	Hacking.Text:SetScale( 0.5, 0 )
	Hacking.Text:setText( Engine.Localize( "HUD_HACK_HACKING" ), 0 )
	Hacking.Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Hacking.Text:SetAlignment( LUI.Alignment.Center )
	Hacking:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 15, _1080p * 150.5, _1080p * 52.6, _1080p * 76.6 )
	self:addElement( Hacking )
	self.Hacking = Hacking
	
	local Online = nil
	
	Online = MenuBuilder.BuildRegisteredType( "GenericTextBox", {
		controllerIndex = f1_local1
	} )
	Online.id = "Online"
	Online.Text:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	Online.Text:SetScale( 0.5, 0 )
	Online.Text:setText( Engine.Localize( "HUD_HACK_ONLINE" ), 0 )
	Online.Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Online.Text:SetAlignment( LUI.Alignment.Center )
	Online:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 149.5, _1080p * 285, _1080p * 52.6, _1080p * 76.6 )
	self:addElement( Online )
	self.Online = Online
	
	local Box1 = nil
	
	Box1 = MenuBuilder.BuildRegisteredType( "GenericTextBox", {
		controllerIndex = f1_local1
	} )
	Box1.id = "Box1"
	Box1.Box.Fill:SetAlpha( 0.9, 0 )
	Box1.Text:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	Box1.Text:SetRGBFromInt( 0, 0 )
	Box1.Text:setText( "1", 0 )
	Box1.Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Box1.Text:SetAlignment( LUI.Alignment.Center )
	Box1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 29, _1080p * 49, _1080p * 13, _1080p * 33 )
	self:addElement( Box1 )
	self.Box1 = Box1
	
	local Box2 = nil
	
	Box2 = MenuBuilder.BuildRegisteredType( "GenericTextBox", {
		controllerIndex = f1_local1
	} )
	Box2.id = "Box2"
	Box2.Box.Fill:SetAlpha( 0.9, 0 )
	Box2.Text:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	Box2.Text:SetRGBFromInt( 0, 0 )
	Box2.Text:setText( "2", 0 )
	Box2.Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Box2.Text:SetAlignment( LUI.Alignment.Center )
	Box2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 48, _1080p * 68, _1080p * 13, _1080p * 33 )
	self:addElement( Box2 )
	self.Box2 = Box2
	
	local Box3 = nil
	
	Box3 = MenuBuilder.BuildRegisteredType( "GenericTextBox", {
		controllerIndex = f1_local1
	} )
	Box3.id = "Box3"
	Box3.Box.Fill:SetAlpha( 0.9, 0 )
	Box3.Text:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	Box3.Text:SetRGBFromInt( 0, 0 )
	Box3.Text:setText( "3", 0 )
	Box3.Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Box3.Text:SetAlignment( LUI.Alignment.Center )
	Box3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 67, _1080p * 87, _1080p * 13, _1080p * 33 )
	self:addElement( Box3 )
	self.Box3 = Box3
	
	local SearchingFrame = nil
	
	SearchingFrame = LUI.UIImage.new()
	SearchingFrame.id = "SearchingFrame"
	SearchingFrame:setImage( RegisterMaterial( "widg_hack_lt_subtitle_frame" ), 0 )
	SearchingFrame:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 23, _1080p * 279, _1080p * 78.6, _1080p * 142.6 )
	self:addElement( SearchingFrame )
	self.SearchingFrame = SearchingFrame
	
	local LockedBacker = nil
	
	LockedBacker = LUI.UIImage.new()
	LockedBacker.id = "LockedBacker"
	LockedBacker:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	LockedBacker:SetAlpha( 0, 0 )
	LockedBacker:SetUseAA( true )
	LockedBacker:SetBlendMode( BLEND_MODE.add )
	LockedBacker:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 23.5, _1080p * 278.5, _1080p * 99, _1080p * 121 )
	self:addElement( LockedBacker )
	self.LockedBacker = LockedBacker
	
	local SearchingTextLarge = nil
	
	SearchingTextLarge = LUI.UIText.new()
	SearchingTextLarge.id = "SearchingTextLarge"
	SearchingTextLarge:setText( ToUpperCase( Engine.Localize( "EQUIPMENT_HACK_HUD_SEARCHING" ) ), 0 )
	SearchingTextLarge:SetFontSize( 22 * _1080p )
	SearchingTextLarge:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SearchingTextLarge:SetAlignment( LUI.Alignment.Center )
	SearchingTextLarge:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 15, _1080p * 285, _1080p * 99.25, _1080p * 121.25 )
	self:addElement( SearchingTextLarge )
	self.SearchingTextLarge = SearchingTextLarge
	
	local TopBorder = nil
	
	TopBorder = LUI.UIImage.new()
	TopBorder.id = "TopBorder"
	TopBorder:SetUseAA( true )
	TopBorder:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, 0, _1080p * 300, 0, _1080p * 2 )
	self:addElement( TopBorder )
	self.TopBorder = TopBorder
	
	local BottomBorder = nil
	
	BottomBorder = LUI.UIImage.new()
	BottomBorder.id = "BottomBorder"
	BottomBorder:SetUseAA( true )
	BottomBorder:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, 0, _1080p * 300, _1080p * -2, 0 )
	self:addElement( BottomBorder )
	self.BottomBorder = BottomBorder
	
	local SearchingBox = nil
	
	SearchingBox = MenuBuilder.BuildRegisteredType( "GenericBoxFillAndStroke", {
		controllerIndex = f1_local1
	} )
	SearchingBox.id = "SearchingBox"
	SearchingBox:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	SearchingBox.Fill:SetBlendMode( BLEND_MODE.addWithAlpha )
	SearchingBox:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 38, _1080p * 58, _1080p * 160, _1080p * 180 )
	self:addElement( SearchingBox )
	self.SearchingBox = SearchingBox
	
	local ConnectingBox = nil
	
	ConnectingBox = MenuBuilder.BuildRegisteredType( "GenericBoxFillAndStroke", {
		controllerIndex = f1_local1
	} )
	ConnectingBox.id = "ConnectingBox"
	ConnectingBox.Fill:SetAlpha( 0, 0 )
	ConnectingBox.Fill:SetBlendMode( BLEND_MODE.addWithAlpha )
	ConnectingBox:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 38, _1080p * 58, _1080p * 195, _1080p * 215 )
	self:addElement( ConnectingBox )
	self.ConnectingBox = ConnectingBox
	
	local LockedBox = nil
	
	LockedBox = MenuBuilder.BuildRegisteredType( "GenericBoxFillAndStroke", {
		controllerIndex = f1_local1
	} )
	LockedBox.id = "LockedBox"
	LockedBox.Fill:SetAlpha( 0, 0 )
	LockedBox.Fill:SetBlendMode( BLEND_MODE.addWithAlpha )
	LockedBox:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 38, _1080p * 58, _1080p * 230, _1080p * 250 )
	self:addElement( LockedBox )
	self.LockedBox = LockedBox
	
	local Initiated = nil
	
	Initiated = LUI.UIText.new()
	Initiated.id = "Initiated"
	Initiated:setText( ToUpperCase( Engine.Localize( "HUD_HACK_INITIATED" ) ), 0 )
	Initiated:SetFontSize( 16 * _1080p )
	Initiated:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Initiated:SetAlignment( LUI.Alignment.Left )
	Initiated:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 38, _1080p * 285, _1080p * 134.25, _1080p * 150.25 )
	self:addElement( Initiated )
	self.Initiated = Initiated
	
	local PrintoutWindow = nil
	
	PrintoutWindow = MenuBuilder.BuildRegisteredType( "C12PrintoutWindow", {
		controllerIndex = f1_local1
	} )
	PrintoutWindow.id = "PrintoutWindow"
	PrintoutWindow:SetScale( -0.3, 0 )
	PrintoutWindow:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 300, _1080p * 369.58, _1080p * 552.58 )
	self:addElement( PrintoutWindow )
	self.PrintoutWindow = PrintoutWindow
	
	local SearchingBorder = nil
	
	SearchingBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	SearchingBorder.id = "SearchingBorder"
	SearchingBorder:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 69, _1080p * 285, _1080p * -140, _1080p * -120 )
	self:addElement( SearchingBorder )
	self.SearchingBorder = SearchingBorder
	
	local ConnectingBorder = nil
	
	ConnectingBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	ConnectingBorder.id = "ConnectingBorder"
	ConnectingBorder:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 69, _1080p * 285, _1080p * -105, _1080p * -85 )
	self:addElement( ConnectingBorder )
	self.ConnectingBorder = ConnectingBorder
	
	local LockedBorder = nil
	
	LockedBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	LockedBorder.id = "LockedBorder"
	LockedBorder:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 69, _1080p * 285, _1080p * -70, _1080p * -50 )
	self:addElement( LockedBorder )
	self.LockedBorder = LockedBorder
	
	local SearchingText = nil
	
	SearchingText = LUI.UIText.new()
	SearchingText.id = "SearchingText"
	SearchingText:setText( ToUpperCase( Engine.Localize( "HUD_SEARCHING_TARGET" ) ), 0 )
	SearchingText:SetFontSize( 16 * _1080p )
	SearchingText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SearchingText:SetAlignment( LUI.Alignment.Left )
	SearchingText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 74, _1080p * 278, _1080p * -138, _1080p * -122 )
	self:addElement( SearchingText )
	self.SearchingText = SearchingText
	
	local ConnectingText = nil
	
	ConnectingText = LUI.UIText.new()
	ConnectingText.id = "ConnectingText"
	ConnectingText:setText( ToUpperCase( Engine.Localize( "HUD_HACK_CONNECT_TARGET" ) ), 0 )
	ConnectingText:SetFontSize( 16 * _1080p )
	ConnectingText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ConnectingText:SetAlignment( LUI.Alignment.Left )
	ConnectingText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 74, _1080p * 278, _1080p * -103, _1080p * -87 )
	self:addElement( ConnectingText )
	self.ConnectingText = ConnectingText
	
	local LockedText = nil
	
	LockedText = LUI.UIText.new()
	LockedText.id = "LockedText"
	LockedText:setText( ToUpperCase( Engine.Localize( "EQUIPMENT_SEEKER_LOCKED" ) ), 0 )
	LockedText:SetFontSize( 16 * _1080p )
	LockedText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LockedText:SetAlignment( LUI.Alignment.Left )
	LockedText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 74, _1080p * 278, _1080p * -68, _1080p * -52 )
	self:addElement( LockedText )
	self.LockedText = LockedText
	
	local Grid = nil
	
	Grid = LUI.UIImage.new()
	Grid.id = "Grid"
	Grid:setImage( RegisterMaterial( "widg_hack_grid" ), 0 )
	Grid:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 66, _1080p * 233, _1080p * -67, _1080p * 100 )
	self:addElement( Grid )
	self.Grid = Grid
	
	local PrintFrameTop = nil
	
	PrintFrameTop = LUI.UIImage.new()
	PrintFrameTop.id = "PrintFrameTop"
	PrintFrameTop:SetZRotation( 180, 0 )
	PrintFrameTop:setImage( RegisterMaterial( "widg_hack_rt_does_frame" ), 0 )
	PrintFrameTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 56, _1080p * 244, _1080p * 81, _1080p * 89 )
	self:addElement( PrintFrameTop )
	self.PrintFrameTop = PrintFrameTop
	
	local PrintFrameBottom = nil
	
	PrintFrameBottom = LUI.UIImage.new()
	PrintFrameBottom.id = "PrintFrameBottom"
	PrintFrameBottom:setImage( RegisterMaterial( "widg_hack_rt_does_frame" ), 0 )
	PrintFrameBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 56, _1080p * 244, _1080p * 232, _1080p * 240 )
	self:addElement( PrintFrameBottom )
	self.PrintFrameBottom = PrintFrameBottom
	
	local GridDot = nil
	
	GridDot = LUI.UIImage.new()
	GridDot.id = "GridDot"
	GridDot:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	GridDot:SetAlpha( 0.8, 0 )
	GridDot:setImage( RegisterMaterial( "widg_glow_circle" ), 0 )
	GridDot:SetBlendMode( BLEND_MODE.addWithAlpha )
	GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133.5, _1080p * 144.5, _1080p * 300, _1080p * 311 )
	self:addElement( GridDot )
	self.GridDot = GridDot
	
	local VersionNo = nil
	
	VersionNo = LUI.UIText.new()
	VersionNo.id = "VersionNo"
	VersionNo:setText( ToUpperCase( Engine.Localize( "HUD_HACK_VERSION" ) ), 0 )
	VersionNo:SetFontSize( 12 * _1080p )
	VersionNo:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	VersionNo:SetAlignment( LUI.Alignment.Left )
	VersionNo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15.5, _1080p * 128.5, _1080p * 578.22, _1080p * 590.22 )
	self:addElement( VersionNo )
	self.VersionNo = VersionNo
	
	local SystemReadout = nil
	
	SystemReadout = LUI.UIText.new()
	SystemReadout.id = "SystemReadout"
	SystemReadout:setText( ToUpperCase( Engine.Localize( "HUD_HACK_SYSTEM_READOUT" ) ), 0 )
	SystemReadout:SetFontSize( 12 * _1080p )
	SystemReadout:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	SystemReadout:SetAlignment( LUI.Alignment.Left )
	SystemReadout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15.5, _1080p * 128.5, _1080p * 541.58, _1080p * 553.58 )
	self:addElement( SystemReadout )
	self.SystemReadout = SystemReadout
	
	local Barcode = nil
	
	Barcode = LUI.UIImage.new()
	Barcode.id = "Barcode"
	Barcode:setImage( RegisterMaterial( "widg_hack_barcode" ), 0 )
	Barcode:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 221.5, _1080p * 285.5, _1080p * 581.22, _1080p * 589.22 )
	self:addElement( Barcode )
	self.Barcode = Barcode
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Box1:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.Box1.Text:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.Box1.Text:SetRGBFromInt( 16777215, 500 )
				end,
				function ()
					return self.Box1.Text:SetRGBFromInt( 0, 500 )
				end
			},
			{
				function ()
					return self.Box1.Box.Fill:SetAlpha( 0.9, 0 )
				end,
				function ()
					return self.Box1.Box.Fill:SetAlpha( 0, 500 )
				end,
				function ()
					return self.Box1.Box.Fill:SetAlpha( 0.9, 500 )
				end
			}
		} )
		Box2:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.Box2.Text:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Box2.Box.Fill:SetAlpha( 0, 0 )
				end
			}
		} )
		Box3:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.Box3.Box.Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Box3.Text:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		LockedBacker:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.LockedBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		SearchingTextLarge:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.SearchingTextLarge:setText( ToUpperCase( Engine.Localize( "EQUIPMENT_HACK_HUD_SEARCHING" ) ), 0 )
				end
			},
			{
				function ()
					return self.SearchingTextLarge:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SearchingTextLarge:SetAlpha( 0.2, 500 )
				end,
				function ()
					return self.SearchingTextLarge:SetAlpha( 1, 500 )
				end
			},
			{
				function ()
					return self.SearchingTextLarge:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		SearchingBox:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.SearchingBox:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		ConnectingBox:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.ConnectingBox.Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.ConnectingBox:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		LockedBox:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.LockedBox.Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.LockedBox:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		SearchingText:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.SearchingText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SearchingText:SetAlpha( 0.2, 500 )
				end,
				function ()
					return self.SearchingText:SetAlpha( 1, 500 )
				end
			}
		} )
		ConnectingText:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.ConnectingText:SetAlpha( 0.2, 0 )
				end
			}
		} )
		LockedText:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.LockedText:SetAlpha( 0.2, 0 )
				end
			},
			{
				function ()
					return self.LockedText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Searching = function ()
			Box1:AnimateLoop( "Searching" )
			Box2:AnimateLoop( "Searching" )
			Box3:AnimateLoop( "Searching" )
			LockedBacker:AnimateLoop( "Searching" )
			SearchingTextLarge:AnimateLoop( "Searching" )
			SearchingBox:AnimateLoop( "Searching" )
			ConnectingBox:AnimateLoop( "Searching" )
			LockedBox:AnimateLoop( "Searching" )
			SearchingText:AnimateLoop( "Searching" )
			ConnectingText:AnimateLoop( "Searching" )
			LockedText:AnimateLoop( "Searching" )
		end
		
		Box1:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.Box1.Text:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Box1.Box.Fill:SetAlpha( 0.9, 0 )
				end
			}
		} )
		Box2:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.Box2.Text:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.Box2.Text:SetRGBFromInt( 16777215, 500 )
				end,
				function ()
					return self.Box2.Text:SetRGBFromInt( 0, 500 )
				end
			},
			{
				function ()
					return self.Box2.Box.Fill:SetAlpha( 0.9, 0 )
				end,
				function ()
					return self.Box2.Box.Fill:SetAlpha( 0, 500 )
				end,
				function ()
					return self.Box2.Box.Fill:SetAlpha( 0.9, 500 )
				end
			}
		} )
		Box3:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.Box3.Box.Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Box3.Text:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		LockedBacker:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.LockedBacker:SetAlpha( 0, 0 )
				end
			}
		} )
		SearchingTextLarge:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.SearchingTextLarge:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SearchingTextLarge:SetAlpha( 0.2, 500 )
				end,
				function ()
					return self.SearchingTextLarge:SetAlpha( 1, 500 )
				end
			},
			{
				function ()
					return self.SearchingTextLarge:setText( ToUpperCase( Engine.Localize( "HUD_HACK_CONNECTING" ) ), 0 )
				end
			},
			{
				function ()
					return self.SearchingTextLarge:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		ConnectingBox:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.ConnectingBox.Fill:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ConnectingBox:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		LockedBox:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.LockedBox.Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.LockedBox:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		SearchingText:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.SearchingText:SetAlpha( 1, 0 )
				end
			}
		} )
		ConnectingText:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.ConnectingText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ConnectingText:SetAlpha( 0.2, 500 )
				end,
				function ()
					return self.ConnectingText:SetAlpha( 1, 500 )
				end
			}
		} )
		LockedText:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.LockedText:SetAlpha( 0.2, 0 )
				end
			},
			{
				function ()
					return self.LockedText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Connecting = function ()
			Box1:AnimateLoop( "Connecting" )
			Box2:AnimateLoop( "Connecting" )
			Box3:AnimateLoop( "Connecting" )
			LockedBacker:AnimateLoop( "Connecting" )
			SearchingTextLarge:AnimateLoop( "Connecting" )
			ConnectingBox:AnimateLoop( "Connecting" )
			LockedBox:AnimateLoop( "Connecting" )
			SearchingText:AnimateLoop( "Connecting" )
			ConnectingText:AnimateLoop( "Connecting" )
			LockedText:AnimateLoop( "Connecting" )
		end
		
		Box1:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Box1.Text:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Box1.Box.Fill:SetAlpha( 0.9, 0 )
				end
			}
		} )
		Box2:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Box2.Box.Fill:SetAlpha( 0.9, 0 )
				end
			},
			{
				function ()
					return self.Box2.Text:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Box3:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Box3.Box.Fill:SetAlpha( 0.9, 0 )
				end
			},
			{
				function ()
					return self.Box3.Text:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Box3.Text:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		LockedBacker:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.LockedBacker:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.LockedBacker:SetAlpha( 0, 30 )
				end,
				function ()
					return self.LockedBacker:SetAlpha( 0.8, 30 )
				end,
				function ()
					return self.LockedBacker:SetAlpha( 0, 30 )
				end,
				function ()
					return self.LockedBacker:SetAlpha( 0.8, 30 )
				end,
				function ()
					return self.LockedBacker:SetAlpha( 0, 30 )
				end,
				function ()
					return self.LockedBacker:SetAlpha( 0.8, 30 )
				end
			}
		} )
		SearchingTextLarge:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.SearchingTextLarge:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.SearchingTextLarge:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.SearchingTextLarge:SetRGBFromTable( SWATCHES.HUD.warning, 30 )
				end,
				function ()
					return self.SearchingTextLarge:SetRGBFromInt( 16777215, 30 )
				end,
				function ()
					return self.SearchingTextLarge:SetRGBFromTable( SWATCHES.HUD.warning, 30 )
				end,
				function ()
					return self.SearchingTextLarge:SetRGBFromInt( 16777215, 30 )
				end,
				function ()
					return self.SearchingTextLarge:SetRGBFromTable( SWATCHES.HUD.warning, 30 )
				end,
				function ()
					return self.SearchingTextLarge:SetRGBFromInt( 16777215, 30 )
				end
			},
			{
				function ()
					return self.SearchingTextLarge:setText( ToUpperCase( Engine.Localize( "EQUIPMENT_HACK_HUD_LOCKED" ) ), 0 )
				end
			}
		} )
		ConnectingBox:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.ConnectingBox.Fill:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ConnectingBox:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		LockedBox:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.LockedBox.Fill:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.LockedBox:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		SearchingText:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.SearchingText:SetAlpha( 1, 0 )
				end
			}
		} )
		ConnectingText:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.ConnectingText:SetAlpha( 1, 0 )
				end
			}
		} )
		LockedText:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.LockedText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.LockedText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Box1:AnimateSequence( "Locked" )
			Box2:AnimateSequence( "Locked" )
			Box3:AnimateSequence( "Locked" )
			LockedBacker:AnimateSequence( "Locked" )
			SearchingTextLarge:AnimateSequence( "Locked" )
			ConnectingBox:AnimateSequence( "Locked" )
			LockedBox:AnimateSequence( "Locked" )
			SearchingText:AnimateSequence( "Locked" )
			ConnectingText:AnimateSequence( "Locked" )
			LockedText:AnimateSequence( "Locked" )
		end
		
		GridDot:RegisterAnimationSequence( "GridDotsSearching", {
			{
				function ()
					return self.GridDot:SetScale( -0.5, 0 )
				end,
				function ()
					return self.GridDot:SetScale( 0, 200 )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetScale( 0, 200 )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetScale( 0, 200 )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetScale( 0, 200 )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetScale( 0, 200 )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetScale( 0, 200 )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 200 )
				end,
				function ()
					return self.GridDot:SetScale( 0, 200 )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 200 )
				end,
				function ()
					return self.GridDot:SetScale( 0, 200 )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 200 )
				end,
				function ()
					return self.GridDot:SetScale( 0, 200 )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 200 )
				end,
				function ()
					return self.GridDot:SetScale( 0, 200 )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 200 )
				end
			},
			{
				function ()
					return self.GridDot:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133.5, _1080p * 144.5, _1080p * 300, _1080p * 311, 0 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133.5, _1080p * 144.5, _1080p * 300, _1080p * 311, 400, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 174, _1080p * 185, _1080p * 280, _1080p * 291, 9 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 174, _1080p * 185, _1080p * 280, _1080p * 291, 390, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 174, _1080p * 185, _1080p * 319.5, _1080p * 330.5, 9 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 174, _1080p * 185, _1080p * 319.5, _1080p * 330.5, 390, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133.5, _1080p * 144.5, _1080p * 280, _1080p * 291, 9 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133.5, _1080p * 144.5, _1080p * 280, _1080p * 291, 389, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154.5, _1080p * 165.5, _1080p * 339, _1080p * 350, 9 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154.5, _1080p * 165.5, _1080p * 339, _1080p * 350, 389, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114, _1080p * 125, _1080p * 280, _1080p * 291, 9 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114, _1080p * 125, _1080p * 280, _1080p * 291, 390 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133.5, _1080p * 144.5, _1080p * 300, _1080p * 311, 9 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133.5, _1080p * 144.5, _1080p * 300, _1080p * 311, 389 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114, _1080p * 125, _1080p * 339, _1080p * 350, 9 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114, _1080p * 125, _1080p * 339, _1080p * 350, 390 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 174, _1080p * 185, _1080p * 339, _1080p * 350, 9 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 174, _1080p * 185, _1080p * 339, _1080p * 350, 389 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114, _1080p * 125, _1080p * 319.5, _1080p * 330.5, 9 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114, _1080p * 125, _1080p * 319.5, _1080p * 330.5, 390 )
				end
			}
		} )
		self._sequences.GridDotsSearching = function ()
			GridDot:AnimateLoop( "GridDotsSearching" )
		end
		
		GridDot:RegisterAnimationSequence( "GridDotsLocked", {
			{
				function ()
					return self.GridDot:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 100, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 100, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 100 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 100, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 100 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 100, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAlpha( 0.8, 100 )
				end,
				function ()
					return self.GridDot:SetAlpha( 0, 100, LUI.EASING.outSine )
				end
			},
			{
				function ()
					return self.GridDot:SetScale( -0.5, 0 )
				end,
				function ()
					return self.GridDot:SetScale( 0, 100, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 100, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetScale( 0, 100 )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 100, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetScale( 0, 100 )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 100, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetScale( 0, 100 )
				end,
				function ()
					return self.GridDot:SetScale( -0.5, 100, LUI.EASING.outSine )
				end
			},
			{
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133.5, _1080p * 144.5, _1080p * 300, _1080p * 311, 0 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133.5, _1080p * 144.5, _1080p * 300, _1080p * 311, 200, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154.5, _1080p * 165.5, _1080p * 300, _1080p * 311, 9 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154.5, _1080p * 165.5, _1080p * 300, _1080p * 311, 190, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154.5, _1080p * 165.5, _1080p * 319.5, _1080p * 330.5, 9 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154.5, _1080p * 165.5, _1080p * 319.5, _1080p * 330.5, 190, LUI.EASING.outSine )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133.5, _1080p * 144.5, _1080p * 319.5, _1080p * 330.5, 9 )
				end,
				function ()
					return self.GridDot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133.5, _1080p * 144.5, _1080p * 319.5, _1080p * 330.5, 189, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.GridDotsLocked = function ()
			GridDot:AnimateLoop( "GridDotsLocked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.hackTargetingStatus:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f1_local1 ) == "searching" then
			ACTIONS.AnimateSequence( self, "Searching" )
			ACTIONS.AnimateSequence( self, "GridDotsSearching" )
		end
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f1_local1 ) == "connecting" then
			ACTIONS.AnimateSequence( self, "Connecting" )
		end
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f1_local1 ) == "locked" then
			ACTIONS.AnimateSequence( self, "Locked" )
		end
	end )
	return self
end

MenuBuilder.registerType( "HackingDetailsPanel", HackingDetailsPanel )
LockTable( _M )
