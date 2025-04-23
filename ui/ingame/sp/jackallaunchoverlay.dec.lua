local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	ACTIONS.AnimateSequence( f1_arg0, "HideAll" )
	local f1_local0 = DataSources.inGame.jackal.atmoLaunch
	local f1_local1 = function ()
		if f1_local0:GetValue( f1_arg1 ) then
			ACTIONS.AnimateSequence( f1_arg0, "ShowAll" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "HideAll" )
		end
	end
	
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local1, true )
	f1_local1()
end

function JackalLaunchOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "JackalLaunchOverlay"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local CurveRight = nil
	
	CurveRight = MenuBuilder.BuildRegisteredType( "JackalLaunchOverlayCurveRight", {
		controllerIndex = f3_local1
	} )
	CurveRight.id = "CurveRight"
	CurveRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -228, _1080p * -100, _1080p * -374, _1080p * 374 )
	self:addElement( CurveRight )
	self.CurveRight = CurveRight
	
	local CurveLeft = nil
	
	CurveLeft = MenuBuilder.BuildRegisteredType( "JackalLaunchOverlayCurveLeft", {
		controllerIndex = f3_local1
	} )
	CurveLeft.id = "CurveLeft"
	CurveLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 100, _1080p * 228, _1080p * -374, _1080p * 374 )
	self:addElement( CurveLeft )
	self.CurveLeft = CurveLeft
	
	local FuelGauge = nil
	
	FuelGauge = MenuBuilder.BuildRegisteredType( "JackalLaunchOverlayFuelGauge", {
		controllerIndex = f3_local1
	} )
	FuelGauge.id = "FuelGauge"
	FuelGauge:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 76, _1080p * 362, _1080p * 330, _1080p * 758 )
	self:addElement( FuelGauge )
	self.FuelGauge = FuelGauge
	
	local Diagram = nil
	
	Diagram = MenuBuilder.BuildRegisteredType( "JackalLaunchOverlayDiagram", {
		controllerIndex = f3_local1
	} )
	Diagram.id = "Diagram"
	Diagram:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -387, _1080p * -131, _1080p * -256, _1080p * 256 )
	self:addElement( Diagram )
	self.Diagram = Diagram
	
	local Pitch = nil
	
	Pitch = MenuBuilder.BuildRegisteredType( "JackalPitch", {
		controllerIndex = f3_local1
	} )
	Pitch.id = "Pitch"
	Pitch:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -440, _1080p * -380, _1080p * -150, _1080p * 150 )
	self:addElement( Pitch )
	self.Pitch = Pitch
	
	local Altimeter = nil
	
	Altimeter = MenuBuilder.BuildRegisteredType( "JackalAltimeter", {
		controllerIndex = f3_local1
	} )
	Altimeter.id = "Altimeter"
	Altimeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 416, _1080p * 484, _1080p * -256, _1080p * 256 )
	self:addElement( Altimeter )
	self.Altimeter = Altimeter
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CurveRight:RegisterAnimationSequence( "ShowAll", {
			{
				function ()
					return self.CurveRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CurveRight:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.CurveRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 128, _1080p * -374, _1080p * 374, 0 )
				end,
				function ()
					return self.CurveRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -228, _1080p * -100, _1080p * -374, _1080p * 374, 200, LUI.EASING.outBack )
				end
			}
		} )
		CurveLeft:RegisterAnimationSequence( "ShowAll", {
			{
				function ()
					return self.CurveLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CurveLeft:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.CurveLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -128, 0, _1080p * -374, _1080p * 374, 0 )
				end,
				function ()
					return self.CurveLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 100, _1080p * 228, _1080p * -374, _1080p * 374, 200, LUI.EASING.outBack )
				end
			}
		} )
		FuelGauge:RegisterAnimationSequence( "ShowAll", {
			{
				function ()
					return self.FuelGauge:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FuelGauge:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 76, _1080p * 362, _1080p * 330, _1080p * 758, 0 )
				end
			}
		} )
		Diagram:RegisterAnimationSequence( "ShowAll", {
			{
				function ()
					return self.Diagram:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Diagram:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -390, _1080p * -134, _1080p * -256, _1080p * 256, 0 )
				end
			}
		} )
		Pitch:RegisterAnimationSequence( "ShowAll", {
			{
				function ()
					return self.Pitch:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Pitch:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.Pitch:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -390, _1080p * -330, _1080p * -150, _1080p * 150, 0 )
				end,
				function ()
					return self.Pitch:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -440, _1080p * -380, _1080p * -150, _1080p * 150, 100 )
				end
			}
		} )
		Altimeter:RegisterAnimationSequence( "ShowAll", {
			{
				function ()
					return self.Altimeter:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Altimeter:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.Altimeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 366, _1080p * 434, _1080p * -256, _1080p * 256, 0 )
				end,
				function ()
					return self.Altimeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 416, _1080p * 484, _1080p * -256, _1080p * 256, 100 )
				end
			}
		} )
		self._sequences.ShowAll = function ()
			CurveRight:AnimateSequence( "ShowAll" )
			CurveLeft:AnimateSequence( "ShowAll" )
			FuelGauge:AnimateSequence( "ShowAll" )
			Diagram:AnimateSequence( "ShowAll" )
			Pitch:AnimateSequence( "ShowAll" )
			Altimeter:AnimateSequence( "ShowAll" )
		end
		
		CurveRight:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.CurveRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CurveRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CurveRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CurveRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CurveRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CurveRight:SetAlpha( 0, 50, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.CurveRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -228, _1080p * -100, _1080p * -374, _1080p * 374, 0 )
				end
			}
		} )
		CurveLeft:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.CurveLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CurveLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CurveLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CurveLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CurveLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CurveLeft:SetAlpha( 0, 50, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.CurveLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 100, _1080p * 228, _1080p * -374, _1080p * 374, 0 )
				end
			}
		} )
		FuelGauge:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.FuelGauge:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.FuelGauge:SetAlpha( 0, 50 )
				end,
				function ()
					return self.FuelGauge:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.FuelGauge:SetAlpha( 0, 50 )
				end,
				function ()
					return self.FuelGauge:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.FuelGauge:SetAlpha( 0, 50, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.FuelGauge:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 76, _1080p * 362, _1080p * 330, _1080p * 758, 0 )
				end
			}
		} )
		Diagram:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.Diagram:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Diagram:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Diagram:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.Diagram:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Diagram:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.Diagram:SetAlpha( 0, 50, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Diagram:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -410, _1080p * -154, _1080p * -256, _1080p * 256, 0 )
				end
			}
		} )
		Pitch:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.Pitch:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Pitch:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Pitch:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Pitch:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Pitch:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Pitch:SetAlpha( 0, 50, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Pitch:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -440, _1080p * -380, _1080p * -150, _1080p * 150, 0 )
				end
			}
		} )
		Altimeter:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.Altimeter:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Altimeter:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Altimeter:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Altimeter:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Altimeter:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Altimeter:SetAlpha( 0, 50, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Altimeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 416, _1080p * 484, _1080p * -256, _1080p * 256, 0 )
				end
			}
		} )
		self._sequences.HideAll = function ()
			CurveRight:AnimateSequence( "HideAll" )
			CurveLeft:AnimateSequence( "HideAll" )
			FuelGauge:AnimateSequence( "HideAll" )
			Diagram:AnimateSequence( "HideAll" )
			Pitch:AnimateSequence( "HideAll" )
			Altimeter:AnimateSequence( "HideAll" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalLaunchOverlay", JackalLaunchOverlay )
LockTable( _M )
