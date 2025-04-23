local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	if DataSources.inGame.SP.europa.haloDropState:GetValue( f1_arg1 ) >= 4 then
		ACTIONS.AnimateSequence( f1_arg0, "StartDropRespawn" )
	else
		ACTIONS.AnimateSequence( f1_arg0, "Bootup" )
	end
end

function HaloDropOverlayMain( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HaloDropOverlayMain"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local BottomRight = nil
	
	BottomRight = LUI.UIImage.new()
	BottomRight.id = "BottomRight"
	BottomRight:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	BottomRight:SetAlpha( 0.25, 0 )
	BottomRight:setImage( RegisterMaterial( "hud_sp_frame_bottom_right" ), 0 )
	BottomRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -512, 0, _1080p * -256, 0 )
	self:addElement( BottomRight )
	self.BottomRight = BottomRight
	
	local BottomLeft = nil
	
	BottomLeft = LUI.UIImage.new()
	BottomLeft.id = "BottomLeft"
	BottomLeft:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	BottomLeft:SetAlpha( 0.25, 0 )
	BottomLeft:setImage( RegisterMaterial( "hud_sp_frame_bottom_right" ), 0 )
	BottomLeft:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 512, 0, _1080p * -256, 0 )
	self:addElement( BottomLeft )
	self.BottomLeft = BottomLeft
	
	local BottomCenter = nil
	
	BottomCenter = LUI.UIImage.new()
	BottomCenter.id = "BottomCenter"
	BottomCenter:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	BottomCenter:SetAlpha( 0.25, 0 )
	BottomCenter:setImage( RegisterMaterial( "hud_sp_frame_bottom_center" ), 0 )
	BottomCenter:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -256, _1080p * 256, _1080p * -148, _1080p * -20 )
	self:addElement( BottomCenter )
	self.BottomCenter = BottomCenter
	
	local TopCenter = nil
	
	TopCenter = LUI.UIImage.new()
	TopCenter.id = "TopCenter"
	TopCenter:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	TopCenter:SetAlpha( 0.25, 0 )
	TopCenter:setImage( RegisterMaterial( "hud_sp_frame_top_center" ), 0 )
	TopCenter:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * -40, _1080p * 88 )
	self:addElement( TopCenter )
	self.TopCenter = TopCenter
	
	local DistanceRing = nil
	
	DistanceRing = LUI.UIImage.new()
	DistanceRing.id = "DistanceRing"
	DistanceRing:setImage( RegisterMaterial( "halo_center_circle" ), 0 )
	DistanceRing:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -152, _1080p * 152, _1080p * -152, _1080p * 152 )
	DistanceRing:SubscribeToModel( DataSources.inGame.SP.europa.haloDropAltitude:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.SP.europa.haloDropAltitude:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			DistanceRing:SetScale( Subtract( Divide( f3_local0, 5400 ), 1 ), 0 )
		end
	end )
	self:addElement( DistanceRing )
	self.DistanceRing = DistanceRing
	
	local Crosshair = nil
	
	Crosshair = LUI.UIImage.new()
	Crosshair.id = "Crosshair"
	Crosshair:setImage( RegisterMaterial( "halo_center_reticle" ), 0 )
	Crosshair:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -194, _1080p * 194, _1080p * -194, _1080p * 194 )
	self:addElement( Crosshair )
	self.Crosshair = Crosshair
	
	local HaloDropSideMetersBottom = nil
	
	HaloDropSideMetersBottom = MenuBuilder.BuildRegisteredType( "HaloDropSideMeters", {
		controllerIndex = f2_local1
	} )
	HaloDropSideMetersBottom.id = "HaloDropSideMetersBottom"
	HaloDropSideMetersBottom:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( HaloDropSideMetersBottom )
	self.HaloDropSideMetersBottom = HaloDropSideMetersBottom
	
	local HaloDropHorizon = nil
	
	HaloDropHorizon = MenuBuilder.BuildRegisteredType( "HaloDropHorizon", {
		controllerIndex = f2_local1
	} )
	HaloDropHorizon.id = "HaloDropHorizon"
	HaloDropHorizon:SetAlpha( 0.6, 0 )
	HaloDropHorizon:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( HaloDropHorizon )
	self.HaloDropHorizon = HaloDropHorizon
	
	local HaloDropPrepareSteps = nil
	
	HaloDropPrepareSteps = MenuBuilder.BuildRegisteredType( "HaloDropPrepareSteps", {
		controllerIndex = f2_local1
	} )
	HaloDropPrepareSteps.id = "HaloDropPrepareSteps"
	HaloDropPrepareSteps:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -400, _1080p * 400, _1080p * -371, _1080p * -231 )
	self:addElement( HaloDropPrepareSteps )
	self.HaloDropPrepareSteps = HaloDropPrepareSteps
	
	local HaloDropSideMetersTop = nil
	
	HaloDropSideMetersTop = MenuBuilder.BuildRegisteredType( "HaloDropSideMeters", {
		controllerIndex = f2_local1
	} )
	HaloDropSideMetersTop.id = "HaloDropSideMetersTop"
	HaloDropSideMetersTop:SetZRotation( 180, 0 )
	HaloDropSideMetersTop:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( HaloDropSideMetersTop )
	self.HaloDropSideMetersTop = HaloDropSideMetersTop
	
	local CompassElement = nil
	
	CompassElement = MenuBuilder.BuildRegisteredType( "Compass", {
		stretch = 0.85,
		controllerIndex = f2_local1
	} )
	CompassElement.id = "CompassElement"
	CompassElement:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	CompassElement:SetAlpha( 0, 0 )
	CompassElement:setImage( RegisterMaterial( "compass_tickertape_space" ), 0 )
	CompassElement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -225, _1080p * 225, _1080p * 24, _1080p * 38 )
	self:addElement( CompassElement )
	self.CompassElement = CompassElement
	
	local Accent = nil
	
	Accent = LUI.UIImage.new()
	Accent.id = "Accent"
	Accent:SetAlpha( 0.7, 0 )
	Accent:setImage( RegisterMaterial( "hud_sp_compass_accent" ), 0 )
	Accent:SetUseAA( true )
	Accent:SetBlendMode( BLEND_MODE.addWithAlpha )
	Accent:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -178, _1080p * 178, _1080p * 10, _1080p * 18 )
	self:addElement( Accent )
	self.Accent = Accent
	
	local TemperatureMeter = nil
	
	TemperatureMeter = MenuBuilder.BuildRegisteredType( "SPTemperatureMeter", {
		controllerIndex = f2_local1
	} )
	TemperatureMeter.id = "TemperatureMeter"
	TemperatureMeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 100, _1080p * 228, _1080p * -212, _1080p * 212 )
	self:addElement( TemperatureMeter )
	self.TemperatureMeter = TemperatureMeter
	
	local OxygenMeter = nil
	
	OxygenMeter = MenuBuilder.BuildRegisteredType( "SPOxygenMeter", {
		controllerIndex = f2_local1
	} )
	OxygenMeter.id = "OxygenMeter"
	OxygenMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -228, _1080p * -100, _1080p * -212, _1080p * 212 )
	self:addElement( OxygenMeter )
	self.OxygenMeter = OxygenMeter
	
	local HaloDropObjective = nil
	
	HaloDropObjective = MenuBuilder.BuildRegisteredType( "HaloDropObjective", {
		controllerIndex = f2_local1
	} )
	HaloDropObjective.id = "HaloDropObjective"
	HaloDropObjective:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( HaloDropObjective )
	self.HaloDropObjective = HaloDropObjective
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BottomRight:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.BottomRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BottomRight:SetAlpha( 0.25, 200 )
				end
			}
		} )
		BottomLeft:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.BottomLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BottomLeft:SetAlpha( 0.25, 200 )
				end
			}
		} )
		BottomCenter:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.BottomCenter:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BottomCenter:SetAlpha( 0.25, 200 )
				end
			}
		} )
		TopCenter:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.TopCenter:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TopCenter:SetAlpha( 0.25, 200 )
				end
			}
		} )
		DistanceRing:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.DistanceRing:SetAlpha( 0, 0 )
				end
			}
		} )
		Crosshair:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Crosshair:SetAlpha( 0, 0 )
				end
			}
		} )
		HaloDropSideMetersBottom:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		HaloDropHorizon:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.HaloDropHorizon:SetAlpha( 0, 0 )
				end
			}
		} )
		HaloDropPrepareSteps:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 0, 700 )
				end,
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 1, 30 )
				end,
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 0, 30 )
				end,
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 1, 30 )
				end,
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 0, 30 )
				end,
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 1, 30 )
				end
			}
		} )
		HaloDropSideMetersTop:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0, 0 )
				end
			}
		} )
		CompassElement:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.CompassElement:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CompassElement:SetAlpha( 0, 200 )
				end,
				function ()
					return self.CompassElement:SetAlpha( 0.05, 200 )
				end
			}
		} )
		Accent:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Accent:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Accent:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Accent:SetAlpha( 0.7, 200 )
				end
			}
		} )
		TemperatureMeter:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.TemperatureMeter:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TemperatureMeter:SetAlpha( 0, 300 )
				end,
				function ()
					return self.TemperatureMeter:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.TemperatureMeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -128, 0, _1080p * -212, _1080p * 212, 0 )
				end,
				function ()
					return self.TemperatureMeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -128, 0, _1080p * -212, _1080p * 212, 300 )
				end,
				function ()
					return self.TemperatureMeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 100, _1080p * 228, _1080p * -212, _1080p * 212, 300, LUI.EASING.outBack )
				end
			}
		} )
		OxygenMeter:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.OxygenMeter:SetAlpha( 0, 0 )
				end,
				function ()
					return self.OxygenMeter:SetAlpha( 0, 300 )
				end,
				function ()
					return self.OxygenMeter:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.OxygenMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 128, _1080p * -212, _1080p * 212, 0 )
				end,
				function ()
					return self.OxygenMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 128, _1080p * -212, _1080p * 212, 300 )
				end,
				function ()
					return self.OxygenMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -228, _1080p * -100, _1080p * -212, _1080p * 212, 300, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Bootup = function ()
			BottomRight:AnimateSequence( "Bootup" )
			BottomLeft:AnimateSequence( "Bootup" )
			BottomCenter:AnimateSequence( "Bootup" )
			TopCenter:AnimateSequence( "Bootup" )
			DistanceRing:AnimateSequence( "Bootup" )
			Crosshair:AnimateSequence( "Bootup" )
			HaloDropSideMetersBottom:AnimateSequence( "Bootup" )
			HaloDropHorizon:AnimateSequence( "Bootup" )
			HaloDropPrepareSteps:AnimateSequence( "Bootup" )
			HaloDropSideMetersTop:AnimateSequence( "Bootup" )
			CompassElement:AnimateSequence( "Bootup" )
			Accent:AnimateSequence( "Bootup" )
			TemperatureMeter:AnimateSequence( "Bootup" )
			OxygenMeter:AnimateSequence( "Bootup" )
		end
		
		DistanceRing:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.DistanceRing:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DistanceRing:SetAlpha( 0, 1390 )
				end,
				function ()
					return self.DistanceRing:SetAlpha( 0.05, 10 )
				end
			}
		} )
		Crosshair:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.Crosshair:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0, 910 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0, 330, LUI.EASING.outBack )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0, 10 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0.15, 30 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0.15, 30 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0.1, 30 )
				end
			},
			{
				function ()
					return self.Crosshair:SetScale( -0.2, 910 )
				end,
				function ()
					return self.Crosshair:SetScale( 0, 340 )
				end
			}
		} )
		HaloDropSideMetersBottom:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0, 700 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0.25, 90 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0.2, 400, LUI.EASING.outBack )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0.1, 210 )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersBottom:SetScale( -0.2, 700 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetScale( 0, 490, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersBottom:SetXRotation( -30, 700 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetXRotation( -10, 490, LUI.EASING.outBack )
				end
			}
		} )
		HaloDropHorizon:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.HaloDropHorizon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HaloDropHorizon:SetAlpha( 0, 580 )
				end,
				function ()
					return self.HaloDropHorizon:SetAlpha( 0.25, 210 )
				end,
				function ()
					return self.HaloDropHorizon:SetAlpha( 0.1, 490 )
				end
			}
		} )
		HaloDropPrepareSteps:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 0, 200 )
				end
			}
		} )
		HaloDropSideMetersTop:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0, 700 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0.25, 90 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0.25, 400, LUI.EASING.outBack )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0.1, 210 )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersTop:SetScale( -0.2, 700 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetScale( 0, 490, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersTop:SetXRotation( 30, 700 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetXRotation( 10, 490, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.StartDrop = function ()
			DistanceRing:AnimateSequence( "StartDrop" )
			Crosshair:AnimateSequence( "StartDrop" )
			HaloDropSideMetersBottom:AnimateSequence( "StartDrop" )
			HaloDropHorizon:AnimateSequence( "StartDrop" )
			HaloDropPrepareSteps:AnimateSequence( "StartDrop" )
			HaloDropSideMetersTop:AnimateSequence( "StartDrop" )
		end
		
		BottomRight:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.BottomRight:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.BottomRight:SetAlpha( 0.25, 800 )
				end,
				function ()
					return self.BottomRight:SetAlpha( 0, 200 )
				end
			}
		} )
		BottomLeft:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.BottomLeft:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.BottomLeft:SetAlpha( 0.25, 800 )
				end,
				function ()
					return self.BottomLeft:SetAlpha( 0, 200 )
				end
			}
		} )
		BottomCenter:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.BottomCenter:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.BottomCenter:SetAlpha( 0.25, 800 )
				end,
				function ()
					return self.BottomCenter:SetAlpha( 0, 200 )
				end
			}
		} )
		TopCenter:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.TopCenter:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.TopCenter:SetAlpha( 0.25, 800 )
				end,
				function ()
					return self.TopCenter:SetAlpha( 0, 200 )
				end
			}
		} )
		DistanceRing:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.DistanceRing:SetAlpha( 0.05, 0 )
				end,
				function ()
					return self.DistanceRing:SetAlpha( 0.05, 800 )
				end,
				function ()
					return self.DistanceRing:SetAlpha( 0, 200 )
				end
			}
		} )
		Crosshair:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.Crosshair:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0.1, 800 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0, 200 )
				end
			}
		} )
		HaloDropSideMetersBottom:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0.1, 600 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0, 400 )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersBottom:SetXRotation( 0, 0 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetXRotation( 0, 600 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetXRotation( -30, 400 )
				end
			}
		} )
		HaloDropHorizon:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.HaloDropHorizon:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.HaloDropHorizon:SetAlpha( 0.1, 600 )
				end,
				function ()
					return self.HaloDropHorizon:SetAlpha( 0, 400 )
				end
			},
			{
				function ()
					return self.HaloDropHorizon:SetScale( 0, 0 )
				end,
				function ()
					return self.HaloDropHorizon:SetScale( 0, 600 )
				end
			}
		} )
		HaloDropPrepareSteps:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 0, 0 )
				end
			}
		} )
		HaloDropSideMetersTop:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0.1, 600 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0, 400 )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersTop:SetXRotation( 0, 0 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetXRotation( 0, 600 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetXRotation( 30, 400 )
				end
			}
		} )
		CompassElement:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.CompassElement:SetAlpha( 0.05, 0 )
				end,
				function ()
					return self.CompassElement:SetAlpha( 0.05, 800 )
				end,
				function ()
					return self.CompassElement:SetAlpha( 0, 200 )
				end
			}
		} )
		Accent:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.Accent:SetAlpha( 0.7, 0 )
				end,
				function ()
					return self.Accent:SetAlpha( 0.7, 800 )
				end,
				function ()
					return self.Accent:SetAlpha( 0, 200 )
				end
			}
		} )
		TemperatureMeter:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.TemperatureMeter:SetAlpha( 1, 600 )
				end,
				function ()
					return self.TemperatureMeter:SetAlpha( 0, 300, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.TemperatureMeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 100, _1080p * 228, _1080p * -212, _1080p * 212, 600 )
				end,
				function ()
					return self.TemperatureMeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -128, 0, _1080p * -212, _1080p * 212, 299, LUI.EASING.inBack )
				end
			}
		} )
		OxygenMeter:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.OxygenMeter:SetAlpha( 1, 600 )
				end,
				function ()
					return self.OxygenMeter:SetAlpha( 0, 300, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.OxygenMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -228, _1080p * -100, _1080p * -212, _1080p * 212, 600 )
				end,
				function ()
					return self.OxygenMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 128, _1080p * -212, _1080p * 212, 299, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.LandingDone = function ()
			BottomRight:AnimateSequence( "LandingDone" )
			BottomLeft:AnimateSequence( "LandingDone" )
			BottomCenter:AnimateSequence( "LandingDone" )
			TopCenter:AnimateSequence( "LandingDone" )
			DistanceRing:AnimateSequence( "LandingDone" )
			Crosshair:AnimateSequence( "LandingDone" )
			HaloDropSideMetersBottom:AnimateSequence( "LandingDone" )
			HaloDropHorizon:AnimateSequence( "LandingDone" )
			HaloDropPrepareSteps:AnimateSequence( "LandingDone" )
			HaloDropSideMetersTop:AnimateSequence( "LandingDone" )
			CompassElement:AnimateSequence( "LandingDone" )
			Accent:AnimateSequence( "LandingDone" )
			TemperatureMeter:AnimateSequence( "LandingDone" )
			OxygenMeter:AnimateSequence( "LandingDone" )
		end
		
		DistanceRing:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.DistanceRing:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Warning = function ()
			DistanceRing:AnimateSequence( "Warning" )
		end
		
		BottomRight:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.BottomRight:SetAlpha( 0.25, 0 )
				end
			}
		} )
		BottomLeft:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.BottomLeft:SetAlpha( 0.25, 0 )
				end
			}
		} )
		BottomCenter:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.BottomCenter:SetAlpha( 0.25, 0 )
				end
			}
		} )
		TopCenter:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.TopCenter:SetAlpha( 0.25, 0 )
				end
			}
		} )
		DistanceRing:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.DistanceRing:SetAlpha( 0, 1490 )
				end,
				function ()
					return self.DistanceRing:SetAlpha( 0.05, 10 )
				end
			}
		} )
		Crosshair:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.Crosshair:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0.05, 10 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0.05, 330, LUI.EASING.outBack )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0, 10 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0.15, 30 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0.15, 30 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0.05, 30 )
				end
			},
			{
				function ()
					return self.Crosshair:SetScale( -0.2, 1010 )
				end,
				function ()
					return self.Crosshair:SetScale( 0, 340 )
				end
			}
		} )
		HaloDropSideMetersBottom:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0, 800 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0.25, 90 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0.2, 400, LUI.EASING.outBack )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0.05, 210 )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersBottom:SetScale( -0.2, 0 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetScale( -0.2, 800 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetScale( 0, 490, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersBottom:SetXRotation( -30, 800 )
				end,
				function ()
					return self.HaloDropSideMetersBottom:SetXRotation( -10, 490, LUI.EASING.outBack )
				end
			}
		} )
		HaloDropHorizon:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.HaloDropHorizon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HaloDropHorizon:SetAlpha( 0, 680 )
				end,
				function ()
					return self.HaloDropHorizon:SetAlpha( 0.25, 210 )
				end,
				function ()
					return self.HaloDropHorizon:SetAlpha( 0.05, 490 )
				end
			}
		} )
		HaloDropPrepareSteps:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 0, 0 )
				end
			}
		} )
		HaloDropSideMetersTop:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0, 800 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0.25, 90 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0.25, 400, LUI.EASING.outBack )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0.1, 210 )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersTop:SetScale( -0.2, 0 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetScale( -0.2, 800 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetScale( 0, 490, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersTop:SetXRotation( 30, 800 )
				end,
				function ()
					return self.HaloDropSideMetersTop:SetXRotation( 10, 490, LUI.EASING.outBack )
				end
			}
		} )
		CompassElement:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.CompassElement:SetAlpha( 0.05, 0 )
				end
			}
		} )
		Accent:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.Accent:SetAlpha( 0.7, 0 )
				end
			}
		} )
		TemperatureMeter:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.TemperatureMeter:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TemperatureMeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 100, _1080p * 228, _1080p * -212, _1080p * 212, 0 )
				end
			}
		} )
		OxygenMeter:RegisterAnimationSequence( "StartDropRespawn", {
			{
				function ()
					return self.OxygenMeter:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.OxygenMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -228, _1080p * -100, _1080p * -212, _1080p * 212, 0 )
				end
			}
		} )
		self._sequences.StartDropRespawn = function ()
			BottomRight:AnimateSequence( "StartDropRespawn" )
			BottomLeft:AnimateSequence( "StartDropRespawn" )
			BottomCenter:AnimateSequence( "StartDropRespawn" )
			TopCenter:AnimateSequence( "StartDropRespawn" )
			DistanceRing:AnimateSequence( "StartDropRespawn" )
			Crosshair:AnimateSequence( "StartDropRespawn" )
			HaloDropSideMetersBottom:AnimateSequence( "StartDropRespawn" )
			HaloDropHorizon:AnimateSequence( "StartDropRespawn" )
			HaloDropPrepareSteps:AnimateSequence( "StartDropRespawn" )
			HaloDropSideMetersTop:AnimateSequence( "StartDropRespawn" )
			CompassElement:AnimateSequence( "StartDropRespawn" )
			Accent:AnimateSequence( "StartDropRespawn" )
			TemperatureMeter:AnimateSequence( "StartDropRespawn" )
			OxygenMeter:AnimateSequence( "StartDropRespawn" )
		end
		
		BottomRight:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.BottomRight:SetAlpha( 0, 0 )
				end
			}
		} )
		BottomLeft:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.BottomLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		BottomCenter:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.BottomCenter:SetAlpha( 0, 0 )
				end
			}
		} )
		TopCenter:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.TopCenter:SetAlpha( 0, 0 )
				end
			}
		} )
		DistanceRing:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.DistanceRing:SetAlpha( 0, 0 )
				end
			}
		} )
		Crosshair:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Crosshair:SetAlpha( 0, 0 )
				end
			}
		} )
		HaloDropSideMetersBottom:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		HaloDropHorizon:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.HaloDropHorizon:SetAlpha( 0, 0 )
				end
			}
		} )
		HaloDropPrepareSteps:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 0, 0 )
				end
			}
		} )
		HaloDropSideMetersTop:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0, 0 )
				end
			}
		} )
		CompassElement:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.CompassElement:SetAlpha( 0, 0 )
				end
			}
		} )
		Accent:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Accent:SetAlpha( 0, 0 )
				end
			}
		} )
		TemperatureMeter:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.TemperatureMeter:SetAlpha( 0, 0 )
				end
			}
		} )
		OxygenMeter:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.OxygenMeter:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			BottomRight:AnimateSequence( "Default" )
			BottomLeft:AnimateSequence( "Default" )
			BottomCenter:AnimateSequence( "Default" )
			TopCenter:AnimateSequence( "Default" )
			DistanceRing:AnimateSequence( "Default" )
			Crosshair:AnimateSequence( "Default" )
			HaloDropSideMetersBottom:AnimateSequence( "Default" )
			HaloDropHorizon:AnimateSequence( "Default" )
			HaloDropPrepareSteps:AnimateSequence( "Default" )
			HaloDropSideMetersTop:AnimateSequence( "Default" )
			CompassElement:AnimateSequence( "Default" )
			Accent:AnimateSequence( "Default" )
			TemperatureMeter:AnimateSequence( "Default" )
			OxygenMeter:AnimateSequence( "Default" )
		end
		
		BottomRight:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.BottomRight:SetAlpha( 0.25, 0 )
				end
			}
		} )
		BottomLeft:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.BottomLeft:SetAlpha( 0.25, 0 )
				end
			}
		} )
		BottomCenter:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.BottomCenter:SetAlpha( 0.25, 0 )
				end
			}
		} )
		TopCenter:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.TopCenter:SetAlpha( 0.25, 0 )
				end
			}
		} )
		DistanceRing:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.DistanceRing:SetAlpha( 0, 0 )
				end
			}
		} )
		Crosshair:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.Crosshair:SetAlpha( 0, 0 )
				end
			}
		} )
		HaloDropSideMetersBottom:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		HaloDropHorizon:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.HaloDropHorizon:SetAlpha( 0, 0 )
				end
			}
		} )
		HaloDropPrepareSteps:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 1, 0 )
				end
			}
		} )
		HaloDropSideMetersTop:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0, 0 )
				end
			}
		} )
		CompassElement:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.CompassElement:SetAlpha( 0.05, 0 )
				end
			}
		} )
		Accent:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.Accent:SetAlpha( 0.7, 0 )
				end
			}
		} )
		TemperatureMeter:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.TemperatureMeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 100, _1080p * 228, _1080p * -212, _1080p * 212, 0 )
				end
			}
		} )
		OxygenMeter:RegisterAnimationSequence( "BootupInstance", {
			{
				function ()
					return self.OxygenMeter:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.OxygenMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -228, _1080p * -100, _1080p * -212, _1080p * 212, 0 )
				end
			}
		} )
		self._sequences.BootupInstance = function ()
			BottomRight:AnimateSequence( "BootupInstance" )
			BottomLeft:AnimateSequence( "BootupInstance" )
			BottomCenter:AnimateSequence( "BootupInstance" )
			TopCenter:AnimateSequence( "BootupInstance" )
			DistanceRing:AnimateSequence( "BootupInstance" )
			Crosshair:AnimateSequence( "BootupInstance" )
			HaloDropSideMetersBottom:AnimateSequence( "BootupInstance" )
			HaloDropHorizon:AnimateSequence( "BootupInstance" )
			HaloDropPrepareSteps:AnimateSequence( "BootupInstance" )
			HaloDropSideMetersTop:AnimateSequence( "BootupInstance" )
			CompassElement:AnimateSequence( "BootupInstance" )
			Accent:AnimateSequence( "BootupInstance" )
			TemperatureMeter:AnimateSequence( "BootupInstance" )
			OxygenMeter:AnimateSequence( "BootupInstance" )
		end
		
		BottomRight:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.BottomRight:SetAlpha( 0.25, 0 )
				end
			}
		} )
		BottomLeft:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.BottomLeft:SetAlpha( 0.25, 0 )
				end
			}
		} )
		BottomCenter:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.BottomCenter:SetAlpha( 0.25, 0 )
				end
			}
		} )
		TopCenter:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.TopCenter:SetAlpha( 0.25, 0 )
				end
			}
		} )
		DistanceRing:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.DistanceRing:SetAlpha( 0.05, 0 )
				end
			}
		} )
		Crosshair:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.Crosshair:SetAlpha( 0.1, 0 )
				end
			},
			{
				function ()
					return self.Crosshair:SetScale( 0, 0 )
				end
			}
		} )
		HaloDropSideMetersBottom:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.HaloDropSideMetersBottom:SetAlpha( 0.1, 0 )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersBottom:SetXRotation( -10, 0 )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersBottom:SetScale( 0, 0 )
				end
			}
		} )
		HaloDropHorizon:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.HaloDropHorizon:SetAlpha( 0.1, 0 )
				end
			}
		} )
		HaloDropPrepareSteps:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.HaloDropPrepareSteps:SetAlpha( 0, 0 )
				end
			}
		} )
		HaloDropSideMetersTop:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.HaloDropSideMetersTop:SetAlpha( 0.1, 0 )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersTop:SetXRotation( 10, 0 )
				end
			},
			{
				function ()
					return self.HaloDropSideMetersTop:SetScale( 0, 0 )
				end
			}
		} )
		CompassElement:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.CompassElement:SetAlpha( 0.05, 0 )
				end
			}
		} )
		Accent:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.Accent:SetAlpha( 0.7, 0 )
				end
			}
		} )
		TemperatureMeter:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.TemperatureMeter:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TemperatureMeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 100, _1080p * 228, _1080p * -212, _1080p * 212, 0 )
				end
			}
		} )
		OxygenMeter:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.OxygenMeter:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.OxygenMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -228, _1080p * -100, _1080p * -212, _1080p * 212, 0 )
				end
			}
		} )
		self._sequences.StartDropInstant = function ()
			BottomRight:AnimateSequence( "StartDropInstant" )
			BottomLeft:AnimateSequence( "StartDropInstant" )
			BottomCenter:AnimateSequence( "StartDropInstant" )
			TopCenter:AnimateSequence( "StartDropInstant" )
			DistanceRing:AnimateSequence( "StartDropInstant" )
			Crosshair:AnimateSequence( "StartDropInstant" )
			HaloDropSideMetersBottom:AnimateSequence( "StartDropInstant" )
			HaloDropHorizon:AnimateSequence( "StartDropInstant" )
			HaloDropPrepareSteps:AnimateSequence( "StartDropInstant" )
			HaloDropSideMetersTop:AnimateSequence( "StartDropInstant" )
			CompassElement:AnimateSequence( "StartDropInstant" )
			Accent:AnimateSequence( "StartDropInstant" )
			TemperatureMeter:AnimateSequence( "StartDropInstant" )
			OxygenMeter:AnimateSequence( "StartDropInstant" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.europa.haloDropState:GetModel( f2_local1 ), function ()
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "StartDrop" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) == 9 then
			ACTIONS.AnimateSequence( self, "LandingDone" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) == 7 then
			ACTIONS.AnimateSequence( self, "Warning" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) >= 2 and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) <= 3 then
			ACTIONS.AnimateSequence( self, "BootupInstance" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) >= 5 and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) <= 8 then
			ACTIONS.AnimateSequence( self, "StartDropInstant" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "HaloDropOverlayMain", HaloDropOverlayMain )
LockTable( _M )
