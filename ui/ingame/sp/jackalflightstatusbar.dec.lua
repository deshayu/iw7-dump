local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.bottomHorzLineRight
	if f1_local1 then
		f1_local1 = f1_arg0.bottomHorzLineLeft
		if f1_local1 then
			f1_local1 = f1_arg0.topHorzLineRight
			if f1_local1 then
				f1_local1 = f1_arg0.topHorzLineLeft and f1_arg0.ECM
			end
		end
	end
	f1_local0( f1_local1, "WARNING: Jackal Flight Status Bar Items Are Missing..." )
	f1_arg0.bottomHorzLineRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.bottomHorzLineLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.topHorzLineRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.topHorzLineLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.ECM:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0:RegisterAnimationSequence( "shutdown", {
		{
			function ()
				return f1_arg0:SetAlpha( 0 )
			end,
			function ()
				return f1_arg0:SetAlpha( 1, 50 )
			end,
			function ()
				return f1_arg0:SetAlpha( 0, 50 )
			end,
			function ()
				return f1_arg0:SetAlpha( 1, 50 )
			end,
			function ()
				return f1_arg0:SetAlpha( 0, 50 )
			end
		}
	} )
	f1_arg0:addEventHandler( "hud_anim_shutdown_off", function ( f7_arg0, f7_arg1 )
		f1_arg0:AnimateSequence( "shutdown" )
	end )
	f1_arg0:addEventHandler( "hud_anim_immediate_on", function ( f8_arg0, f8_arg1 )
		f1_arg0:SetAlpha( 1 )
	end )
	if IsLanguageGerman() then
		f1_arg0.Flares:SetRight( -43 * _1080p, 0 )
		f1_arg0.Flares:SetLeft( -177 * _1080p, 0 )
	end
end

function JackalFlightStatusBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1056 * _1080p, 0, 72 * _1080p )
	self.id = "JackalFlightStatusBar"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "JackalFlightStatusBarBackground", {
		controllerIndex = f9_local1
	} )
	Background.id = "Background"
	Background:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -500, _1080p * 500, 0, _1080p * 122 )
	self:addElement( Background )
	self.Background = Background
	
	local bottomHorzLineRight = nil
	
	bottomHorzLineRight = LUI.UIImage.new()
	bottomHorzLineRight.id = "bottomHorzLineRight"
	bottomHorzLineRight:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	bottomHorzLineRight:SetAlpha( 0.5, 0 )
	bottomHorzLineRight:setImage( RegisterMaterial( "hud_jackal_flight_status_horz_line_alt" ), 0 )
	bottomHorzLineRight:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 176, _1080p * 432, _1080p * -8, 0 )
	self:addElement( bottomHorzLineRight )
	self.bottomHorzLineRight = bottomHorzLineRight
	
	local bottomHorzLineLeft = nil
	
	bottomHorzLineLeft = LUI.UIImage.new()
	bottomHorzLineLeft.id = "bottomHorzLineLeft"
	bottomHorzLineLeft:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	bottomHorzLineLeft:SetAlpha( 0.5, 0 )
	bottomHorzLineLeft:setImage( RegisterMaterial( "hud_jackal_flight_status_horz_line_alt" ), 0 )
	bottomHorzLineLeft:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -176, _1080p * -432, _1080p * -8, 0 )
	self:addElement( bottomHorzLineLeft )
	self.bottomHorzLineLeft = bottomHorzLineLeft
	
	local topHorzLineRight = nil
	
	topHorzLineRight = LUI.UIImage.new()
	topHorzLineRight.id = "topHorzLineRight"
	topHorzLineRight:SetAlpha( 0.5, 0 )
	topHorzLineRight:setImage( RegisterMaterial( "hud_jackal_flight_status_horz_line" ), 0 )
	topHorzLineRight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 528, _1080p * 16, _1080p * 26, _1080p * 30 )
	self:addElement( topHorzLineRight )
	self.topHorzLineRight = topHorzLineRight
	
	local topHorzLineLeft = nil
	
	topHorzLineLeft = LUI.UIImage.new()
	topHorzLineLeft.id = "topHorzLineLeft"
	topHorzLineLeft:SetAlpha( 0.5, 0 )
	topHorzLineLeft:setImage( RegisterMaterial( "hud_jackal_flight_status_horz_line" ), 0 )
	topHorzLineLeft:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -528, _1080p * -16, _1080p * 26.03, _1080p * 30.03 )
	self:addElement( topHorzLineLeft )
	self.topHorzLineLeft = topHorzLineLeft
	
	local flightMode = nil
	
	flightMode = MenuBuilder.BuildRegisteredType( "JackalFlightStatusMode", {
		controllerIndex = f9_local1
	} )
	flightMode.id = "flightMode"
	flightMode:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -342, _1080p * -135, _1080p * 33, _1080p * 60 )
	self:addElement( flightMode )
	self.flightMode = flightMode
	
	local flightAutopilot = nil
	
	flightAutopilot = MenuBuilder.BuildRegisteredType( "JackalFlightStatusAutopilot", {
		controllerIndex = f9_local1
	} )
	flightAutopilot.id = "flightAutopilot"
	flightAutopilot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 145, _1080p * 338, _1080p * 33, _1080p * 60 )
	self:addElement( flightAutopilot )
	self.flightAutopilot = flightAutopilot
	
	local JackalMissiles = nil
	
	JackalMissiles = MenuBuilder.BuildRegisteredType( "JackalMissiles", {
		controllerIndex = f9_local1
	} )
	JackalMissiles.id = "JackalMissiles"
	JackalMissiles:SetAlpha( 0.75, 0 )
	JackalMissiles:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 67, _1080p * 147, _1080p * 74, _1080p * 114 )
	self:addElement( JackalMissiles )
	self.JackalMissiles = JackalMissiles
	
	local JackalCompass = nil
	
	JackalCompass = MenuBuilder.BuildRegisteredType( "JackalCompass", {
		controllerIndex = f9_local1
	} )
	JackalCompass.id = "JackalCompass"
	JackalCompass:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	JackalCompass:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -130, _1080p * 130, _1080p * -2, _1080p * 60 )
	self:addElement( JackalCompass )
	self.JackalCompass = JackalCompass
	
	local ECM = nil
	
	ECM = LUI.UIImage.new()
	ECM.id = "ECM"
	ECM:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	ECM:setImage( RegisterMaterial( "hud_jackal_ecm" ), 0 )
	ECM:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -31, _1080p * 33, _1080p * 68, _1080p * 100 )
	self:addElement( ECM )
	self.ECM = ECM
	
	local Flares = nil
	
	Flares = MenuBuilder.BuildRegisteredType( "JackalFlightStatusFlares", {
		controllerIndex = f9_local1
	} )
	Flares.id = "Flares"
	Flares:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -160, _1080p * -60, _1080p * 81, _1080p * 107 )
	self:addElement( Flares )
	self.Flares = Flares
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		bottomHorzLineRight:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.bottomHorzLineRight:SetAlpha( 0, 100 )
				end,
				function ()
					return self.bottomHorzLineRight:SetAlpha( 0.5, 600, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.bottomHorzLineRight:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, 0, _1080p * 256, _1080p * -8, 0, 100 )
				end,
				function ()
					return self.bottomHorzLineRight:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 176, _1080p * 432, _1080p * -8, 0, 599, LUI.EASING.inOutBack )
				end
			}
		} )
		bottomHorzLineLeft:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.bottomHorzLineLeft:SetAlpha( 0, 100 )
				end,
				function ()
					return self.bottomHorzLineLeft:SetAlpha( 0.5, 600, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.bottomHorzLineLeft:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, 0, _1080p * -256, _1080p * -8, 0, 100 )
				end,
				function ()
					return self.bottomHorzLineLeft:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -176, _1080p * -432, _1080p * -8, 0, 599, LUI.EASING.inOutBack )
				end
			}
		} )
		topHorzLineRight:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.topHorzLineRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.topHorzLineRight:SetAlpha( 0.5, 600, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.topHorzLineRight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 278, _1080p * -234, _1080p * 26, _1080p * 30, 0 )
				end,
				function ()
					return self.topHorzLineRight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 528, _1080p * 16, _1080p * 26, _1080p * 30, 600, LUI.EASING.inOutBack )
				end
			}
		} )
		topHorzLineLeft:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.topHorzLineLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.topHorzLineLeft:SetAlpha( 0.5, 600, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.topHorzLineLeft:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -278, _1080p * 234, _1080p * 26, _1080p * 30, 0 )
				end,
				function ()
					return self.topHorzLineLeft:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -528, _1080p * -16, _1080p * 26, _1080p * 30, 600, LUI.EASING.inOutBack )
				end
			}
		} )
		flightMode:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.flightMode:SetAlpha( 0, 0 )
				end,
				function ()
					return self.flightMode:SetAlpha( 0, 450 )
				end,
				function ()
					return self.flightMode:SetAlpha( 1, 200 )
				end
			}
		} )
		flightAutopilot:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.flightAutopilot:SetAlpha( 0, 0 )
				end,
				function ()
					return self.flightAutopilot:SetAlpha( 0, 450 )
				end,
				function ()
					return self.flightAutopilot:SetAlpha( 1, 200 )
				end
			}
		} )
		JackalMissiles:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.JackalMissiles:SetAlpha( 0, 350 )
				end,
				function ()
					return self.JackalMissiles:SetAlpha( 0.75, 200 )
				end
			}
		} )
		JackalCompass:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.JackalCompass:SetAlpha( 0, 350 )
				end,
				function ()
					return self.JackalCompass:SetAlpha( 1, 200 )
				end
			}
		} )
		ECM:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.ECM:SetAlpha( 0, 350 )
				end,
				function ()
					return self.ECM:SetAlpha( 1, 200 )
				end
			}
		} )
		Flares:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.Flares:SetAlpha( 0, 350 )
				end,
				function ()
					return self.Flares:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.bootup = function ()
			bottomHorzLineRight:AnimateSequence( "bootup" )
			bottomHorzLineLeft:AnimateSequence( "bootup" )
			topHorzLineRight:AnimateSequence( "bootup" )
			topHorzLineLeft:AnimateSequence( "bootup" )
			flightMode:AnimateSequence( "bootup" )
			flightAutopilot:AnimateSequence( "bootup" )
			JackalMissiles:AnimateSequence( "bootup" )
			JackalCompass:AnimateSequence( "bootup" )
			ECM:AnimateSequence( "bootup" )
			Flares:AnimateSequence( "bootup" )
		end
		
		bottomHorzLineRight:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.bottomHorzLineRight:SetAlpha( 0, 0 )
				end
			}
		} )
		bottomHorzLineLeft:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.bottomHorzLineLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		topHorzLineRight:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.topHorzLineRight:SetAlpha( 0, 0 )
				end
			}
		} )
		topHorzLineLeft:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.topHorzLineLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		flightMode:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.flightMode:SetAlpha( 0, 0 )
				end
			}
		} )
		flightAutopilot:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.flightAutopilot:SetAlpha( 0, 0 )
				end
			}
		} )
		JackalMissiles:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.JackalMissiles:SetAlpha( 0, 0 )
				end
			}
		} )
		JackalCompass:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.JackalCompass:SetAlpha( 0, 0 )
				end
			}
		} )
		ECM:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.ECM:SetAlpha( 0, 0 )
				end
			}
		} )
		Flares:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.Flares:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.default = function ()
			bottomHorzLineRight:AnimateSequence( "default" )
			bottomHorzLineLeft:AnimateSequence( "default" )
			topHorzLineRight:AnimateSequence( "default" )
			topHorzLineLeft:AnimateSequence( "default" )
			flightMode:AnimateSequence( "default" )
			flightAutopilot:AnimateSequence( "default" )
			JackalMissiles:AnimateSequence( "default" )
			JackalCompass:AnimateSequence( "default" )
			ECM:AnimateSequence( "default" )
			Flares:AnimateSequence( "default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.bootup:GetModel( f9_local1 ), function ()
		if DataSources.inGame.jackal.bootup:GetValue( f9_local1 ) ~= nil and DataSources.inGame.jackal.bootup:GetValue( f9_local1 ) == true then
			ACTIONS.AnimateSequence( self, "bootup" )
		end
	end )
	PostLoadFunc( self, f9_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalFlightStatusBar", JackalFlightStatusBar )
LockTable( _M )
