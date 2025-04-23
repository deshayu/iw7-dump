local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.TemperatureMeter and f1_arg0.OxygenMeter, "WARNING: Contextual Helmet Meters Items Are Missing..." )
	f1_arg0.TemperatureMeter:SetAlpha( 0, 0 )
	f1_arg0.OxygenMeter:SetAlpha( 0, 0 )
	f1_arg0.currentState = "Hide"
	local f1_local0 = DataSources.inGame.SP.showTemperatureGauge
	local f1_local1 = DataSources.inGame.SP.helmetMetersAlpha
	local f1_local2 = function ()
		local f2_local0 = f1_local0:GetValue( f1_arg1 ) or f1_local1:GetValue( f1_arg1 ) == 1
		local f2_local1 = nil
		if f2_local0 then
			if f1_arg0.currentState ~= "Show" then
				f1_arg0.currentState = "Show"
				ACTIONS.AnimateSequence( f1_arg0, "Show" )
			end
		elseif f1_arg0.currentState ~= "Hide" then
			f1_arg0.currentState = "Hide"
			ACTIONS.AnimateSequence( f1_arg0, "Hide" )
		end
	end
	
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local2 )
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), f1_local2 )
end

function ContextualHelmetMeters( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ContextualHelmetMeters"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local TemperatureMeter = nil
	
	TemperatureMeter = MenuBuilder.BuildRegisteredType( "SPTemperatureMeter", {
		controllerIndex = f3_local1
	} )
	TemperatureMeter.id = "TemperatureMeter"
	TemperatureMeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 100, _1080p * 228, _1080p * -212, _1080p * 212 )
	self:addElement( TemperatureMeter )
	self.TemperatureMeter = TemperatureMeter
	
	local OxygenMeter = nil
	
	OxygenMeter = MenuBuilder.BuildRegisteredType( "SPOxygenMeter", {
		controllerIndex = f3_local1
	} )
	OxygenMeter.id = "OxygenMeter"
	OxygenMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -228, _1080p * -100, _1080p * -212, _1080p * 212 )
	self:addElement( OxygenMeter )
	self.OxygenMeter = OxygenMeter
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TemperatureMeter:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.TemperatureMeter:SetAlpha( 0, 0 )
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
					return self.TemperatureMeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 100, _1080p * 228, _1080p * -212, _1080p * 212, 300, LUI.EASING.outBack )
				end
			}
		} )
		OxygenMeter:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.OxygenMeter:SetAlpha( 0, 0 )
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
					return self.OxygenMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -228, _1080p * -100, _1080p * -212, _1080p * 212, 300, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Show = function ()
			TemperatureMeter:AnimateSequence( "Show" )
			OxygenMeter:AnimateSequence( "Show" )
		end
		
		TemperatureMeter:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.TemperatureMeter:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TemperatureMeter:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.TemperatureMeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 100, _1080p * 228, _1080p * -212, _1080p * 212, 0 )
				end,
				function ()
					return self.TemperatureMeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -128, 0, _1080p * -212, _1080p * 212, 200, LUI.EASING.inBack )
				end
			}
		} )
		OxygenMeter:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.OxygenMeter:SetAlpha( 1, 0 )
				end,
				function ()
					return self.OxygenMeter:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.OxygenMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -228, _1080p * -100, _1080p * -212, _1080p * 212, 0 )
				end,
				function ()
					return self.OxygenMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 128, _1080p * -212, _1080p * 212, 200, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.Hide = function ()
			TemperatureMeter:AnimateSequence( "Hide" )
			OxygenMeter:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ContextualHelmetMeters", ContextualHelmetMeters )
LockTable( _M )
