local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DroneReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 300 * _1080p )
	self.id = "DroneReticle"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Center = nil
	
	Center = LUI.UIImage.new()
	Center.id = "Center"
	Center:SetZRotation( 45, 0 )
	Center:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( Center )
	self.Center = Center
	
	local PipTop = nil
	
	PipTop = LUI.UIImage.new()
	PipTop.id = "PipTop"
	PipTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * -23, _1080p * -35 )
	self:addElement( PipTop )
	self.PipTop = PipTop
	
	local PipBottom = nil
	
	PipBottom = LUI.UIImage.new()
	PipBottom.id = "PipBottom"
	PipBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * 23, _1080p * 35 )
	self:addElement( PipBottom )
	self.PipBottom = PipBottom
	
	local PipRight = nil
	
	PipRight = LUI.UIImage.new()
	PipRight.id = "PipRight"
	PipRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 23, _1080p * 35, _1080p * -1, _1080p * 1 )
	self:addElement( PipRight )
	self.PipRight = PipRight
	
	local PipLeft = nil
	
	PipLeft = LUI.UIImage.new()
	PipLeft.id = "PipLeft"
	PipLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * -35, _1080p * -1, _1080p * 1 )
	self:addElement( PipLeft )
	self.PipLeft = PipLeft
	
	local CornerBL = nil
	
	CornerBL = MenuBuilder.BuildRegisteredType( "DroneReticleCorner", {
		controllerIndex = f1_local1
	} )
	CornerBL.id = "CornerBL"
	CornerBL:SetZRotation( 180, 0 )
	CornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * -3, _1080p * 3, _1080p * 25 )
	self:addElement( CornerBL )
	self.CornerBL = CornerBL
	
	local CornerTR = nil
	
	CornerTR = MenuBuilder.BuildRegisteredType( "DroneReticleCorner", {
		controllerIndex = f1_local1
	} )
	CornerTR.id = "CornerTR"
	CornerTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 3, _1080p * 25, _1080p * -25, _1080p * -3 )
	self:addElement( CornerTR )
	self.CornerTR = CornerTR
	
	local CornerTL = nil
	
	CornerTL = MenuBuilder.BuildRegisteredType( "DroneReticleCorner", {
		controllerIndex = f1_local1
	} )
	CornerTL.id = "CornerTL"
	CornerTL:SetZRotation( 90, 0 )
	CornerTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * -3, _1080p * -25, _1080p * -3 )
	self:addElement( CornerTL )
	self.CornerTL = CornerTL
	
	local CornerBR = nil
	
	CornerBR = MenuBuilder.BuildRegisteredType( "DroneReticleCorner", {
		controllerIndex = f1_local1
	} )
	CornerBR.id = "CornerBR"
	CornerBR:SetZRotation( 270, 0 )
	CornerBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 3, _1080p * 25, _1080p * 3, _1080p * 25 )
	self:addElement( CornerBR )
	self.CornerBR = CornerBR
	
	local SPARCalloutFrame0 = nil
	
	SPARCalloutFrame0 = MenuBuilder.BuildRegisteredType( "SPARCalloutFrame", {
		controllerIndex = f1_local1
	} )
	SPARCalloutFrame0.id = "SPARCalloutFrame0"
	SPARCalloutFrame0:SetAlpha( 0, 0 )
	SPARCalloutFrame0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173, _1080p * 318, _1080p * 119, _1080p * 144 )
	self:addElement( SPARCalloutFrame0 )
	self.SPARCalloutFrame0 = SPARCalloutFrame0
	
	local KillConfirmedText = nil
	
	KillConfirmedText = LUI.UIText.new()
	KillConfirmedText.id = "KillConfirmedText"
	KillConfirmedText:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	KillConfirmedText:SetAlpha( 0, 0 )
	KillConfirmedText:setText( Engine.Localize( "HUD_KILL" ), 0 )
	KillConfirmedText:SetFontSize( 22 * _1080p )
	KillConfirmedText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	KillConfirmedText:SetAlignment( LUI.Alignment.Left )
	KillConfirmedText:SetOptOutRightToLeftAlignmentFlip( true )
	KillConfirmedText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 52.97, _1080p * 222.97, _1080p * -30.5, _1080p * -8.5 )
	self:addElement( KillConfirmedText )
	self.KillConfirmedText = KillConfirmedText
	
	local X2 = nil
	
	X2 = LUI.UIImage.new()
	X2.id = "X2"
	X2:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	X2:SetAlpha( 0, 0 )
	X2:SetZRotation( 45, 0 )
	X2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 187, _1080p * 190.94, _1080p * 120.33, _1080p * 142.67 )
	self:addElement( X2 )
	self.X2 = X2
	
	local X1 = nil
	
	X1 = LUI.UIImage.new()
	X1.id = "X1"
	X1:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	X1:SetAlpha( 0, 0 )
	X1:SetZRotation( -45, 0 )
	X1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 186.94, _1080p * 191, _1080p * 120, _1080p * 143 )
	self:addElement( X1 )
	self.X1 = X1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Center:RegisterAnimationSequence( "lockon", {
			{
				function ()
					return self.Center:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Center:SetAlpha( 0, 220 )
				end,
				function ()
					return self.Center:SetAlpha( 1, 20 )
				end,
				function ()
					return self.Center:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Center:SetAlpha( 1, 20 )
				end,
				function ()
					return self.Center:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Center:SetAlpha( 1, 20 )
				end
			}
		} )
		PipTop:RegisterAnimationSequence( "lockon", {
			{
				function ()
					return self.PipTop:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PipTop:SetAlpha( 0, 50 )
				end,
				function ()
					return self.PipTop:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.PipTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * -105, _1080p * -120, 0 )
				end,
				function ()
					return self.PipTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * -105, _1080p * -120, 100 )
				end,
				function ()
					return self.PipTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * -23, _1080p * -35, 149, LUI.EASING.outQuadratic )
				end
			}
		} )
		PipBottom:RegisterAnimationSequence( "lockon", {
			{
				function ()
					return self.PipBottom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PipBottom:SetAlpha( 0, 50 )
				end,
				function ()
					return self.PipBottom:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.PipBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * 105, _1080p * 120, 0 )
				end,
				function ()
					return self.PipBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * 105, _1080p * 120, 100 )
				end,
				function ()
					return self.PipBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * 23, _1080p * 35, 149, LUI.EASING.outQuadratic )
				end
			}
		} )
		PipRight:RegisterAnimationSequence( "lockon", {
			{
				function ()
					return self.PipRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PipRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.PipRight:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.PipRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 105, _1080p * 120, _1080p * -1, _1080p * 1, 0 )
				end,
				function ()
					return self.PipRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 105, _1080p * 120, _1080p * -1, _1080p * 1, 100 )
				end,
				function ()
					return self.PipRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 23, _1080p * 35, _1080p * -1, _1080p * 1, 149, LUI.EASING.outQuadratic )
				end
			}
		} )
		PipLeft:RegisterAnimationSequence( "lockon", {
			{
				function ()
					return self.PipLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PipLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.PipLeft:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.PipLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * -120, _1080p * -1, _1080p * 1, 0 )
				end,
				function ()
					return self.PipLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * -120, _1080p * -1, _1080p * 1, 100 )
				end,
				function ()
					return self.PipLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23, _1080p * -35, _1080p * -1, _1080p * 1, 149, LUI.EASING.outQuadratic )
				end
			}
		} )
		CornerBL:RegisterAnimationSequence( "lockon", {
			{
				function ()
					return self.CornerBL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CornerBL:SetAlpha( 0, 20 )
				end,
				function ()
					return self.CornerBL:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.CornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * -10, _1080p * 10, _1080p * 32, 0 )
				end,
				function ()
					return self.CornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * -10, _1080p * 10, _1080p * 32, 50 )
				end,
				function ()
					return self.CornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * -3, _1080p * 3, _1080p * 25, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		CornerTR:RegisterAnimationSequence( "lockon", {
			{
				function ()
					return self.CornerTR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CornerTR:SetAlpha( 0, 20 )
				end,
				function ()
					return self.CornerTR:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.CornerTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 10, _1080p * 32, _1080p * -32, _1080p * -10, 0 )
				end,
				function ()
					return self.CornerTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 10, _1080p * 32, _1080p * -32, _1080p * -10, 50 )
				end,
				function ()
					return self.CornerTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 3, _1080p * 25, _1080p * -25, _1080p * -3, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		CornerTL:RegisterAnimationSequence( "lockon", {
			{
				function ()
					return self.CornerTL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CornerTL:SetAlpha( 0, 20 )
				end,
				function ()
					return self.CornerTL:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.CornerTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * -10, _1080p * -32, _1080p * -10, 0 )
				end,
				function ()
					return self.CornerTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * -10, _1080p * -32, _1080p * -10, 50 )
				end,
				function ()
					return self.CornerTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * -3, _1080p * -25, _1080p * -3, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		CornerBR:RegisterAnimationSequence( "lockon", {
			{
				function ()
					return self.CornerBR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CornerBR:SetAlpha( 0, 20 )
				end,
				function ()
					return self.CornerBR:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.CornerBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 10, _1080p * 32, _1080p * 10, _1080p * 32, 0 )
				end,
				function ()
					return self.CornerBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 10, _1080p * 32, _1080p * 10, _1080p * 32, 50 )
				end,
				function ()
					return self.CornerBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 3, _1080p * 25, _1080p * 3, _1080p * 25, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.lockon = function ()
			Center:AnimateSequence( "lockon" )
			PipTop:AnimateSequence( "lockon" )
			PipBottom:AnimateSequence( "lockon" )
			PipRight:AnimateSequence( "lockon" )
			PipLeft:AnimateSequence( "lockon" )
			CornerBL:AnimateSequence( "lockon" )
			CornerTR:AnimateSequence( "lockon" )
			CornerTL:AnimateSequence( "lockon" )
			CornerBR:AnimateSequence( "lockon" )
		end
		
		Center:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.Center:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Center:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.Center:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.Center:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		PipTop:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.PipTop:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.PipTop:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.PipTop:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.PipTop:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		PipBottom:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.PipBottom:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.PipBottom:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.PipBottom:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.PipBottom:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		PipRight:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.PipRight:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.PipRight:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.PipRight:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.PipRight:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		PipLeft:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.PipLeft:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.PipLeft:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.PipLeft:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.PipLeft:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		CornerBL:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.CornerBL:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.CornerBL:SetRGBFromTable( SWATCHES.HUD.warning, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CornerBL:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.CornerBL:SetRGBFromInt( 16777215, 100, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.CornerBL:SetScale( 0, 0 )
				end,
				function ()
					return self.CornerBL:SetScale( -0.3, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CornerBL:SetScale( 0, 200, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.CornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * -3, _1080p * 3, _1080p * 25, 0 )
				end,
				function ()
					return self.CornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19.7, _1080p * 2.3, _1080p * -2.3, _1080p * 19.7, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CornerBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * -3, _1080p * 3, _1080p * 25, 200, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		CornerTR:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.CornerTR:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.CornerTR:SetRGBFromTable( SWATCHES.HUD.warning, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CornerTR:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.CornerTR:SetRGBFromInt( 16777215, 100, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.CornerTR:SetScale( 0, 0 )
				end,
				function ()
					return self.CornerTR:SetScale( -0.3, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CornerTR:SetScale( 0, 200, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.CornerTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 3, _1080p * 25, _1080p * -25, _1080p * -3, 0 )
				end,
				function ()
					return self.CornerTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2.3, _1080p * 19.7, _1080p * -19.7, _1080p * 2.3, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CornerTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 3, _1080p * 25, _1080p * -25, _1080p * -3, 200, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		CornerTL:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.CornerTL:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.CornerTL:SetRGBFromTable( SWATCHES.HUD.warning, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CornerTL:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.CornerTL:SetRGBFromInt( 16777215, 100, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.CornerTL:SetScale( 0, 0 )
				end,
				function ()
					return self.CornerTL:SetScale( -0.3, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CornerTL:SetScale( 0, 200, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.CornerTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * -3, _1080p * -25, _1080p * -3, 0 )
				end,
				function ()
					return self.CornerTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19.7, _1080p * 2.3, _1080p * -19.7, _1080p * 2.3, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CornerTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * -3, _1080p * -25, _1080p * -3, 200, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		CornerBR:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.CornerBR:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.CornerBR:SetRGBFromTable( SWATCHES.HUD.warning, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CornerBR:SetRGBFromTable( SWATCHES.HUD.warning, 100 )
				end,
				function ()
					return self.CornerBR:SetRGBFromInt( 16777215, 100, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.CornerBR:SetScale( 0, 0 )
				end,
				function ()
					return self.CornerBR:SetScale( -0.3, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CornerBR:SetScale( 0, 200, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.CornerBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 3, _1080p * 25, _1080p * 3, _1080p * 25, 0 )
				end,
				function ()
					return self.CornerBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2.3, _1080p * 19.7, _1080p * -2.3, _1080p * 19.7, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CornerBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 3, _1080p * 25, _1080p * 3, _1080p * 25, 200, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		self._sequences.Fire = function ()
			Center:AnimateSequence( "Fire" )
			PipTop:AnimateSequence( "Fire" )
			PipBottom:AnimateSequence( "Fire" )
			PipRight:AnimateSequence( "Fire" )
			PipLeft:AnimateSequence( "Fire" )
			CornerBL:AnimateSequence( "Fire" )
			CornerTR:AnimateSequence( "Fire" )
			CornerTL:AnimateSequence( "Fire" )
			CornerBR:AnimateSequence( "Fire" )
		end
		
		PipTop:RegisterAnimationSequence( "Kill", {
			{
				function ()
					return self.PipTop:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PipTop:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.PipTop:SetAlpha( 0.3, 1400 )
				end,
				function ()
					return self.PipTop:SetAlpha( 1, 100 )
				end
			}
		} )
		PipBottom:RegisterAnimationSequence( "Kill", {
			{
				function ()
					return self.PipBottom:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PipBottom:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.PipBottom:SetAlpha( 0.3, 1400 )
				end,
				function ()
					return self.PipBottom:SetAlpha( 1, 100 )
				end
			}
		} )
		PipRight:RegisterAnimationSequence( "Kill", {
			{
				function ()
					return self.PipRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PipRight:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.PipRight:SetAlpha( 0.3, 1400 )
				end,
				function ()
					return self.PipRight:SetAlpha( 1, 100 )
				end
			}
		} )
		PipLeft:RegisterAnimationSequence( "Kill", {
			{
				function ()
					return self.PipLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PipLeft:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.PipLeft:SetAlpha( 0.3, 1400 )
				end,
				function ()
					return self.PipLeft:SetAlpha( 1, 100 )
				end
			}
		} )
		CornerBL:RegisterAnimationSequence( "Kill", {
			{
				function ()
					return self.CornerBL:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CornerBL:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.CornerBL:SetAlpha( 0.3, 1400 )
				end,
				function ()
					return self.CornerBL:SetAlpha( 1, 100 )
				end
			}
		} )
		CornerTR:RegisterAnimationSequence( "Kill", {
			{
				function ()
					return self.CornerTR:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CornerTR:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.CornerTR:SetAlpha( 0.3, 1400 )
				end,
				function ()
					return self.CornerTR:SetAlpha( 1, 100 )
				end
			}
		} )
		CornerTL:RegisterAnimationSequence( "Kill", {
			{
				function ()
					return self.CornerTL:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CornerTL:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.CornerTL:SetAlpha( 0.3, 1400 )
				end,
				function ()
					return self.CornerTL:SetAlpha( 1, 100 )
				end
			}
		} )
		CornerBR:RegisterAnimationSequence( "Kill", {
			{
				function ()
					return self.CornerBR:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CornerBR:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.CornerBR:SetAlpha( 0.3, 1400 )
				end,
				function ()
					return self.CornerBR:SetAlpha( 1, 100 )
				end
			}
		} )
		SPARCalloutFrame0:RegisterAnimationSequence( "Kill", {
			{
				function ()
					return self.SPARCalloutFrame0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SPARCalloutFrame0:SetAlpha( 1, 1590 )
				end,
				function ()
					return self.SPARCalloutFrame0:SetAlpha( 0, 10, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.SPARCalloutFrame0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173, _1080p * 173, _1080p * 119, _1080p * 144, 0 )
				end,
				function ()
					return self.SPARCalloutFrame0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173, _1080p * 318, _1080p * 119, _1080p * 144, 100, LUI.EASING.outBack )
				end,
				function ()
					return self.SPARCalloutFrame0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173, _1080p * 318, _1080p * 119, _1080p * 144, 1399 )
				end,
				function ()
					return self.SPARCalloutFrame0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173, _1080p * 173, _1080p * 119, _1080p * 144, 100, LUI.EASING.inBack )
				end
			}
		} )
		KillConfirmedText:RegisterAnimationSequence( "Kill", {
			{
				function ()
					return self.KillConfirmedText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.KillConfirmedText:SetAlpha( 0, 140 )
				end,
				function ()
					return self.KillConfirmedText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.KillConfirmedText:SetAlpha( 1, 1290 )
				end,
				function ()
					return self.KillConfirmedText:SetAlpha( 0, 10 )
				end
			}
		} )
		X2:RegisterAnimationSequence( "Kill", {
			{
				function ()
					return self.X2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.X2:SetAlpha( 0, 90 )
				end,
				function ()
					return self.X2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.X2:SetAlpha( 1, 1350 )
				end,
				function ()
					return self.X2:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.X2:SetScale( 0, 100 )
				end,
				function ()
					return self.X2:SetScale( 0.25, 50 )
				end,
				function ()
					return self.X2:SetScale( 0, 50 )
				end,
				function ()
					return self.X2:SetScale( 0, 1200 )
				end,
				function ()
					return self.X2:SetScale( 0.25, 50 )
				end,
				function ()
					return self.X2:SetScale( -0.9, 50 )
				end
			}
		} )
		X1:RegisterAnimationSequence( "Kill", {
			{
				function ()
					return self.X1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.X1:SetAlpha( 0, 90 )
				end,
				function ()
					return self.X1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.X1:SetAlpha( 1, 1350 )
				end,
				function ()
					return self.X1:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.X1:SetScale( 0, 100 )
				end,
				function ()
					return self.X1:SetScale( 0.25, 50 )
				end,
				function ()
					return self.X1:SetScale( 0, 50 )
				end,
				function ()
					return self.X1:SetScale( 0, 1200 )
				end,
				function ()
					return self.X1:SetScale( 0.25, 50 )
				end,
				function ()
					return self.X1:SetScale( -0.9, 50 )
				end
			}
		} )
		self._sequences.Kill = function ()
			PipTop:AnimateSequence( "Kill" )
			PipBottom:AnimateSequence( "Kill" )
			PipRight:AnimateSequence( "Kill" )
			PipLeft:AnimateSequence( "Kill" )
			CornerBL:AnimateSequence( "Kill" )
			CornerTR:AnimateSequence( "Kill" )
			CornerTL:AnimateSequence( "Kill" )
			CornerBR:AnimateSequence( "Kill" )
			SPARCalloutFrame0:AnimateSequence( "Kill" )
			KillConfirmedText:AnimateSequence( "Kill" )
			X2:AnimateSequence( "Kill" )
			X1:AnimateSequence( "Kill" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "lockState", function ()
		local f188_local0 = self:GetDataSource()
		if f188_local0.lockState:GetValue( f1_local1 ) ~= nil then
			f188_local0 = self:GetDataSource()
			if f188_local0.lockState:GetValue( f1_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "lockon" )
			end
		end
		f188_local0 = self:GetDataSource()
		if f188_local0.lockState:GetValue( f1_local1 ) ~= nil then
			f188_local0 = self:GetDataSource()
			if f188_local0.lockState:GetValue( f1_local1 ) == 2 then
				ACTIONS.AnimateSequence( self, "Fire" )
			end
		end
		f188_local0 = self:GetDataSource()
		if f188_local0.lockState:GetValue( f1_local1 ) ~= nil then
			f188_local0 = self:GetDataSource()
			if f188_local0.lockState:GetValue( f1_local1 ) == 3 then
				ACTIONS.AnimateSequence( self, "Kill" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "DroneReticle", DroneReticle )
LockTable( _M )
