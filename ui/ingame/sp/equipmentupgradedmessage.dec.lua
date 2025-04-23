local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EquipmentUpgradedMessage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 275 * _1080p, 0, 375 * _1080p )
	self.id = "EquipmentUpgradedMessage"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Background:SetUseAA( true )
	self:addElement( Background )
	self.Background = Background
	
	local CapRight = nil
	
	CapRight = LUI.UIImage.new()
	CapRight.id = "CapRight"
	CapRight:SetAlpha( 0.4, 0 )
	CapRight:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, 0 )
	self:addElement( CapRight )
	self.CapRight = CapRight
	
	local CapLeft = nil
	
	CapLeft = LUI.UIImage.new()
	CapLeft.id = "CapLeft"
	CapLeft:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, 0 )
	self:addElement( CapLeft )
	self.CapLeft = CapLeft
	
	local EquipTitle = nil
	
	EquipTitle = LUI.UIStyledText.new()
	EquipTitle.id = "EquipTitle"
	EquipTitle:setText( ToUpperCase( LocalizeLongString( "Title" ) ), 0 )
	EquipTitle:SetFontSize( 18 * _1080p )
	EquipTitle:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	EquipTitle:SetAlignment( LUI.Alignment.Left )
	EquipTitle:SetDecodeLetterLength( 25 )
	EquipTitle:SetDecodeMaxRandChars( 3 )
	EquipTitle:SetDecodeUpdatesPerLetter( 4 )
	EquipTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -52, _1080p * 193, _1080p * 211 )
	self:addElement( EquipTitle )
	self.EquipTitle = EquipTitle
	
	local EquipState = nil
	
	EquipState = LUI.UIStyledText.new()
	EquipState.id = "EquipState"
	EquipState:setText( "VII", 0 )
	EquipState:SetFontSize( 18 * _1080p )
	EquipState:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	EquipState:SetAlignment( LUI.Alignment.Right )
	EquipState:SetDecodeLetterLength( 25 )
	EquipState:SetDecodeMaxRandChars( 3 )
	EquipState:SetDecodeUpdatesPerLetter( 4 )
	EquipState:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 223, _1080p * -13, _1080p * 193, _1080p * 211 )
	self:addElement( EquipState )
	self.EquipState = EquipState
	
	local EquipDesc = nil
	
	EquipDesc = LUI.UIStyledText.new()
	EquipDesc.id = "EquipDesc"
	EquipDesc:SetAlpha( 0.7, 0 )
	EquipDesc:setText( LocalizeString( "Description" ), 0 )
	EquipDesc:SetFontSize( 19 * _1080p )
	EquipDesc:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	EquipDesc:SetAlignment( LUI.Alignment.Left )
	EquipDesc:SetDecodeLetterLength( 25 )
	EquipDesc:SetDecodeMaxRandChars( 3 )
	EquipDesc:SetDecodeUpdatesPerLetter( 4 )
	EquipDesc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -13, _1080p * 232, _1080p * 251 )
	self:addElement( EquipDesc )
	self.EquipDesc = EquipDesc
	
	local EquipmentUpgradedHeader = nil
	
	EquipmentUpgradedHeader = MenuBuilder.BuildRegisteredType( "EquipmentUpgradedHeader", {
		controllerIndex = f1_local1
	} )
	EquipmentUpgradedHeader.id = "EquipmentUpgradedHeader"
	EquipmentUpgradedHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 270, _1080p * 16, _1080p * 46 )
	self:addElement( EquipmentUpgradedHeader )
	self.EquipmentUpgradedHeader = EquipmentUpgradedHeader
	
	local EquipmentUpgradedImage = nil
	
	EquipmentUpgradedImage = MenuBuilder.BuildRegisteredType( "EquipmentUpgradedImage", {
		controllerIndex = f1_local1
	} )
	EquipmentUpgradedImage.id = "EquipmentUpgradedImage"
	EquipmentUpgradedImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32.5, _1080p * 242.5, _1080p * 69, _1080p * 179 )
	self:addElement( EquipmentUpgradedImage )
	self.EquipmentUpgradedImage = EquipmentUpgradedImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.CapRight:SetAlpha( 0, 0 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.CapLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		EquipTitle:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.EquipTitle:SetAlpha( 0, 0 )
				end
			}
		} )
		EquipState:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.EquipState:SetAlpha( 0, 0 )
				end
			}
		} )
		EquipDesc:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.EquipDesc:SetAlpha( 0, 0 )
				end
			}
		} )
		EquipmentUpgradedHeader:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.EquipmentUpgradedHeader:SetAlpha( 0, 0 )
				end
			}
		} )
		EquipmentUpgradedImage:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.EquipmentUpgradedImage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			Background:AnimateSequence( "Hidden" )
			CapRight:AnimateSequence( "Hidden" )
			CapLeft:AnimateSequence( "Hidden" )
			EquipTitle:AnimateSequence( "Hidden" )
			EquipState:AnimateSequence( "Hidden" )
			EquipDesc:AnimateSequence( "Hidden" )
			EquipmentUpgradedHeader:AnimateSequence( "Hidden" )
			EquipmentUpgradedImage:AnimateSequence( "Hidden" )
		end
		
		Background:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 600, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -275, 0, _1080p * -350, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -275, 0, _1080p * -350, 159 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 275, _1080p * -275, 0, _1080p * -350, 440, LUI.EASING.outBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 275, _1080p * -275, 0, 0, 179, LUI.EASING.outBack )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.CapRight:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 60 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0.4, 620, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -350, 0 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -350, 59 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -350, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -350, 49 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -350, 440, LUI.EASING.outBack )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, 0, 179, LUI.EASING.outBack )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.CapLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 60 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 440, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -350, 0 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -350, 59 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -350, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -350, 49 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -350, 440, LUI.EASING.outBack )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, 0, 179, LUI.EASING.outBack )
				end
			}
		} )
		EquipTitle:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.EquipTitle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EquipTitle:SetAlpha( 0, 740 )
				end,
				function ()
					return self.EquipTitle:SetAlpha( 0.7, 40 )
				end
			},
			{
				function ()
					return self.EquipTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -52, _1080p * 200, _1080p * 220, 0 )
				end
			}
		} )
		EquipState:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.EquipState:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EquipState:SetAlpha( 0, 740 )
				end,
				function ()
					return self.EquipState:SetAlpha( 0.7, 40 )
				end
			},
			{
				function ()
					return self.EquipState:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 223, _1080p * -13, _1080p * 200, _1080p * 220, 0 )
				end
			}
		} )
		EquipDesc:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.EquipDesc:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EquipDesc:SetAlpha( 0, 740 )
				end,
				function ()
					return self.EquipDesc:SetAlpha( 0.7, 40 )
				end
			},
			{
				function ()
					return self.EquipDesc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -13, _1080p * 229, _1080p * 249, 0 )
				end
			}
		} )
		EquipmentUpgradedHeader:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.EquipmentUpgradedHeader:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EquipmentUpgradedHeader:SetAlpha( 0, 740 )
				end,
				function ()
					return self.EquipmentUpgradedHeader:SetAlpha( 1, 40 )
				end
			},
			{
				function ()
					return self.EquipmentUpgradedHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 270, _1080p * 15, _1080p * 45, 0 )
				end
			}
		} )
		EquipmentUpgradedImage:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.EquipmentUpgradedImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EquipmentUpgradedImage:SetAlpha( 0, 740 )
				end,
				function ()
					return self.EquipmentUpgradedImage:SetAlpha( 1, 40 )
				end
			},
			{
				function ()
					return self.EquipmentUpgradedImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32.5, _1080p * 242.5, _1080p * 69, _1080p * 179, 0 )
				end
			}
		} )
		self._sequences.TextOn = function ()
			Background:AnimateSequence( "TextOn" )
			CapRight:AnimateSequence( "TextOn" )
			CapLeft:AnimateSequence( "TextOn" )
			EquipTitle:AnimateSequence( "TextOn" )
			EquipState:AnimateSequence( "TextOn" )
			EquipDesc:AnimateSequence( "TextOn" )
			EquipmentUpgradedHeader:AnimateSequence( "TextOn" )
			EquipmentUpgradedImage:AnimateSequence( "TextOn" )
		end
		
		Background:RegisterAnimationSequence( "TextOff", {
			{
				function ()
					return self.Background:SetAlpha( 0.5, 100 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 400, LUI.EASING.inBack )
				end,
				function ()
					return self.Background:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 100 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -350, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -275, 0, _1080p * -350, 199, LUI.EASING.inBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -275, 0, _1080p * -350, 100 )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "TextOff", {
			{
				function ()
					return self.CapRight:SetAlpha( 0.4, 100 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0.4, 500 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, 0, 100 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -350, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -350, 199, LUI.EASING.inBack )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "TextOff", {
			{
				function ()
					return self.CapLeft:SetAlpha( 1, 100 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 500 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, 0, 100 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -350, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -350, 199, LUI.EASING.inBack )
				end
			}
		} )
		EquipTitle:RegisterAnimationSequence( "TextOff", {
			{
				function ()
					return self.EquipTitle:SetAlpha( 0, 100 )
				end
			}
		} )
		EquipState:RegisterAnimationSequence( "TextOff", {
			{
				function ()
					return self.EquipState:SetAlpha( 0, 100 )
				end
			}
		} )
		EquipDesc:RegisterAnimationSequence( "TextOff", {
			{
				function ()
					return self.EquipDesc:SetAlpha( 0, 100 )
				end
			}
		} )
		EquipmentUpgradedHeader:RegisterAnimationSequence( "TextOff", {
			{
				function ()
					return self.EquipmentUpgradedHeader:SetAlpha( 0, 100 )
				end
			}
		} )
		EquipmentUpgradedImage:RegisterAnimationSequence( "TextOff", {
			{
				function ()
					return self.EquipmentUpgradedImage:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.TextOff = function ()
			Background:AnimateSequence( "TextOff" )
			CapRight:AnimateSequence( "TextOff" )
			CapLeft:AnimateSequence( "TextOff" )
			EquipTitle:AnimateSequence( "TextOff" )
			EquipState:AnimateSequence( "TextOff" )
			EquipDesc:AnimateSequence( "TextOff" )
			EquipmentUpgradedHeader:AnimateSequence( "TextOff" )
			EquipmentUpgradedImage:AnimateSequence( "TextOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "EquipmentUpgradedMessage", EquipmentUpgradedMessage )
LockTable( _M )
