local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetDotPitchX( 0 )
	f1_arg0:SetDotPitchY( 0 )
	f1_arg0:SetDotPitchContrast( 0 )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.showIntelMessage:GetModel( f1_arg1 ), function ()
		local f2_local0 = DataSources.inGame.SP.showIntelMessage:GetValue( f1_arg1 )
		if f2_local0 ~= nil and f2_local0 and DataSources.inGame.SP.SPMessageImageIndex:GetValue( f1_arg1 ) == 21 then
			f1_arg0:SetAlpha( 0, 0 )
		elseif f2_local0 then
			f1_arg0:SetAlpha( 1, 0 )
		end
	end )
end

function IntelMessage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 275 * _1080p, 0, 275 * _1080p )
	self.id = "IntelMessage"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Background:SetUseAA( true )
	self:addElement( Background )
	self.Background = Background
	
	local IntelImage = nil
	
	IntelImage = MenuBuilder.BuildRegisteredType( "IntelMessageImage", {
		controllerIndex = f3_local1
	} )
	IntelImage.id = "IntelImage"
	IntelImage:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -105, _1080p * 105, _1080p * 69, _1080p * 179 )
	self:addElement( IntelImage )
	self.IntelImage = IntelImage
	
	local IntelHeader = nil
	
	IntelHeader = MenuBuilder.BuildRegisteredType( "IntelMessageHeader", {
		controllerIndex = f3_local1
	} )
	IntelHeader.id = "IntelHeader"
	IntelHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 15, _1080p * 45 )
	self:addElement( IntelHeader )
	self.IntelHeader = IntelHeader
	
	local IntelDesc = nil
	
	IntelDesc = LUI.UIStyledText.new()
	IntelDesc.id = "IntelDesc"
	IntelDesc:SetAlpha( 0.7, 0 )
	IntelDesc:SetFontSize( 20 * _1080p )
	IntelDesc:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	IntelDesc:SetAlignment( LUI.Alignment.Left )
	IntelDesc:SetDecodeLetterLength( 25 )
	IntelDesc:SetDecodeMaxRandChars( 3 )
	IntelDesc:SetDecodeUpdatesPerLetter( 4 )
	IntelDesc:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -10, _1080p * 200, _1080p * 220 )
	IntelDesc:SubscribeToModel( DataSources.inGame.SP.SPMessageBodyText:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.SP.SPMessageBodyText:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			IntelDesc:setText( ToUpperCase( LocalizeLongString( f4_local0 ) ), 0 )
		end
	end )
	self:addElement( IntelDesc )
	self.IntelDesc = IntelDesc
	
	local IntelWaypointHint = nil
	
	IntelWaypointHint = MenuBuilder.BuildRegisteredType( "IntelMessageHint", {
		controllerIndex = f3_local1
	} )
	IntelWaypointHint.id = "IntelWaypointHint"
	IntelWaypointHint:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 15, _1080p * -15, _1080p * -32, 0 )
	self:addElement( IntelWaypointHint )
	self.IntelWaypointHint = IntelWaypointHint
	
	local CapLeft = nil
	
	CapLeft = LUI.UIImage.new()
	CapLeft.id = "CapLeft"
	CapLeft:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, 0 )
	self:addElement( CapLeft )
	self.CapLeft = CapLeft
	
	local CapRight = nil
	
	CapRight = LUI.UIImage.new()
	CapRight.id = "CapRight"
	CapRight:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	CapRight:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, 0 )
	self:addElement( CapRight )
	self.CapRight = CapRight
	
	local CapRightGlow = nil
	
	CapRightGlow = LUI.UIImage.new()
	CapRightGlow.id = "CapRightGlow"
	CapRightGlow:SetRGBFromTable( SWATCHES.HUD.glow, 0 )
	CapRightGlow:SetAlpha( 0, 0 )
	CapRightGlow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	CapRightGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	CapRightGlow:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, 0 )
	self:addElement( CapRightGlow )
	self.CapRightGlow = CapRightGlow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		IntelImage:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.IntelImage:SetAlpha( 0, 0 )
				end
			}
		} )
		IntelHeader:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.IntelHeader:SetAlpha( 0, 0 )
				end
			}
		} )
		IntelDesc:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.IntelDesc:SetAlpha( 0, 0 )
				end
			}
		} )
		IntelWaypointHint:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.IntelWaypointHint:SetAlpha( 0, 0 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.CapLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.CapRight:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			Background:AnimateSequence( "Default" )
			IntelImage:AnimateSequence( "Default" )
			IntelHeader:AnimateSequence( "Default" )
			IntelDesc:AnimateSequence( "Default" )
			IntelWaypointHint:AnimateSequence( "Default" )
			CapLeft:AnimateSequence( "Default" )
			CapRight:AnimateSequence( "Default" )
		end
		
		Background:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -275, 0, _1080p * -350, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -275, 0, _1080p * -300, 400 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -300, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 199, LUI.EASING.outBack )
				end
			}
		} )
		IntelImage:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.IntelImage:SetAlpha( 0, 750 )
				end,
				function ()
					return self.IntelImage:SetAlpha( 1, 50 )
				end
			}
		} )
		IntelHeader:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.IntelHeader:SetAlpha( 0, 750 )
				end,
				function ()
					return self.IntelHeader:SetAlpha( 1, 50 )
				end
			}
		} )
		IntelDesc:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.IntelDesc:SetAlpha( 0, 750 )
				end,
				function ()
					return self.IntelDesc:SetAlpha( 0.7, 50 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.CapLeft:SetAlpha( 1, 0 )
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
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -4, 0, 0, _1080p * -300, 0 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 49 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 49 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 99 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 200 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, 0, 199, LUI.EASING.outBack )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.CapRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -275, _1080p * -271, 0, _1080p * -300, 0 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 49 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 49 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 99 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -300, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, 0, 199, LUI.EASING.outBack )
				end
			}
		} )
		CapRightGlow:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.CapRightGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Background:AnimateSequence( "Bootup" )
			IntelImage:AnimateSequence( "Bootup" )
			IntelHeader:AnimateSequence( "Bootup" )
			IntelDesc:AnimateSequence( "Bootup" )
			CapLeft:AnimateSequence( "Bootup" )
			CapRight:AnimateSequence( "Bootup" )
			CapRightGlow:AnimateSequence( "Bootup" )
		end
		
		Background:RegisterAnimationSequence( "Shutdown", {
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
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -300, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -275, 0, _1080p * -300, 199, LUI.EASING.inBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -275, 0, _1080p * -300, 100 )
				end
			}
		} )
		IntelImage:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.IntelImage:SetAlpha( 0, 100 )
				end
			}
		} )
		IntelHeader:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.IntelHeader:SetAlpha( 0, 100 )
				end
			}
		} )
		IntelDesc:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.IntelDesc:SetAlpha( 0, 100 )
				end
			}
		} )
		IntelWaypointHint:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.IntelWaypointHint:SetAlpha( 0, 100 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Shutdown", {
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
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 199, LUI.EASING.inBack )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.CapRight:SetAlpha( 1, 100 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 500 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
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
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -300, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 199, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			Background:AnimateSequence( "Shutdown" )
			IntelImage:AnimateSequence( "Shutdown" )
			IntelHeader:AnimateSequence( "Shutdown" )
			IntelDesc:AnimateSequence( "Shutdown" )
			IntelWaypointHint:AnimateSequence( "Shutdown" )
			CapLeft:AnimateSequence( "Shutdown" )
			CapRight:AnimateSequence( "Shutdown" )
		end
		
		self._sequences.BootupMissionIntel = function ()
			
		end
		
		IntelWaypointHint:RegisterAnimationSequence( "WaypointBoot", {
			{
				function ()
					return self.IntelWaypointHint:SetAlpha( 0, 750 )
				end,
				function ()
					return self.IntelWaypointHint:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.WaypointBoot = function ()
			IntelWaypointHint:AnimateSequence( "WaypointBoot" )
		end
		
		Background:RegisterAnimationSequence( "BootupPC", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -275, 0, _1080p * -350, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -275, 0, _1080p * -300, 400 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -300, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * 20, 199, LUI.EASING.outBack )
				end
			}
		} )
		IntelImage:RegisterAnimationSequence( "BootupPC", {
			{
				function ()
					return self.IntelImage:SetAlpha( 0, 750 )
				end,
				function ()
					return self.IntelImage:SetAlpha( 1, 50 )
				end
			}
		} )
		IntelHeader:RegisterAnimationSequence( "BootupPC", {
			{
				function ()
					return self.IntelHeader:SetAlpha( 0, 750 )
				end,
				function ()
					return self.IntelHeader:SetAlpha( 1, 50 )
				end
			}
		} )
		IntelDesc:RegisterAnimationSequence( "BootupPC", {
			{
				function ()
					return self.IntelDesc:SetAlpha( 0, 750 )
				end,
				function ()
					return self.IntelDesc:SetAlpha( 0.7, 50 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "BootupPC", {
			{
				function ()
					return self.CapLeft:SetAlpha( 1, 0 )
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
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -4, 0, 0, _1080p * -300, 0 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 49 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 49 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 99 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * -300, 200 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, _1080p * 20, 199, LUI.EASING.outBack )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "BootupPC", {
			{
				function ()
					return self.CapRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -275, _1080p * -271, 0, _1080p * -300, 0 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 49 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 49 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -274, _1080p * -271, 0, _1080p * -300, 99 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * -300, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * 20, 199, LUI.EASING.outBack )
				end
			}
		} )
		CapRightGlow:RegisterAnimationSequence( "BootupPC", {
			{
				function ()
					return self.CapRightGlow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.CapRightGlow:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, _1080p * 20, 800 )
				end
			}
		} )
		self._sequences.BootupPC = function ()
			Background:AnimateSequence( "BootupPC" )
			IntelImage:AnimateSequence( "BootupPC" )
			IntelHeader:AnimateSequence( "BootupPC" )
			IntelDesc:AnimateSequence( "BootupPC" )
			CapLeft:AnimateSequence( "BootupPC" )
			CapRight:AnimateSequence( "BootupPC" )
			CapRightGlow:AnimateSequence( "BootupPC" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:SubscribeToModel( DataSources.inGame.SP.showIntelMessage:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.showIntelMessage:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.showIntelMessage:GetValue( f3_local1 ) == true and not CONDITIONS.IsPC( self ) then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
		if DataSources.inGame.SP.showIntelWaypoint:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.showIntelWaypoint:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "WaypointBoot" )
		end
		if DataSources.inGame.SP.showIntelMessage:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.showIntelMessage:GetValue( f3_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Shutdown" )
		end
		if DataSources.inGame.SP.showIntelMessage:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.showIntelMessage:GetValue( f3_local1 ) == true and CONDITIONS.IsPC( self ) then
			ACTIONS.AnimateSequence( self, "BootupPC" )
		end
	end )
	self.bindButton:addEventHandler( "button_alt2", function ( f157_arg0, f157_arg1 )
		local f157_local0 = f157_arg1.controller or f3_local1
		ACTIONS.ScriptNotify( "intel_loc_request", 1 )
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "IntelMessage", IntelMessage )
LockTable( _M )
