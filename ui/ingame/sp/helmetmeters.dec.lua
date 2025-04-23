local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HelmetMeters( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 175 * _1080p, 0, 50 * _1080p )
	self.id = "HelmetMeters"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TemperatureMeter = nil
	
	TemperatureMeter = MenuBuilder.BuildRegisteredType( "HelmetMeterBase", {
		controllerIndex = f1_local1
	} )
	TemperatureMeter.id = "TemperatureMeter"
	TemperatureMeter:SetAlpha( 0.7, 0 )
	TemperatureMeter.GaugeName:setText( "TMP", 0 )
	TemperatureMeter:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -87.5, _1080p * -37.5, _1080p * -25, _1080p * 25 )
	TemperatureMeter:SubscribeToModel( DataSources.inGame.SP.helmetMeterTemperatureFill:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.SP.helmetMeterTemperatureFill:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			TemperatureMeter.MeterFill:SetRight( _1080p * Multiply( f2_local0, 50 ), 0 )
		end
	end )
	TemperatureMeter:SubscribeToModel( DataSources.inGame.SP.helmetMeterTemperature:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.SP.helmetMeterTemperature:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			TemperatureMeter.GaugeData:setText( LocalizeIntoString( f3_local0, "HUD_DEGREES" ), 0 )
		end
	end )
	self:addElement( TemperatureMeter )
	self.TemperatureMeter = TemperatureMeter
	
	local OxygenMeter = nil
	
	OxygenMeter = MenuBuilder.BuildRegisteredType( "HelmetMeterBase", {
		controllerIndex = f1_local1
	} )
	OxygenMeter.id = "OxygenMeter"
	OxygenMeter:SetAlpha( 0.7, 0 )
	OxygenMeter.GaugeName:setText( "O2", 0 )
	OxygenMeter:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * 25, _1080p * -25, _1080p * 25 )
	OxygenMeter:SubscribeToModel( DataSources.inGame.SP.helmetMeterOxygen:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.SP.helmetMeterOxygen:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			OxygenMeter.MeterFill:SetRight( _1080p * Multiply( Divide( f4_local0, 100 ), 50 ), 0 )
		end
	end )
	OxygenMeter:SubscribeToModel( DataSources.inGame.SP.helmetMeterOxygen:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.SP.helmetMeterOxygen:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			OxygenMeter.GaugeData:setText( LocalizeIntoString( f5_local0, "HUD_PERCENTAGE" ), 0 )
		end
	end )
	self:addElement( OxygenMeter )
	self.OxygenMeter = OxygenMeter
	
	local PressureMeter = nil
	
	PressureMeter = MenuBuilder.BuildRegisteredType( "HelmetMeterBase", {
		controllerIndex = f1_local1
	} )
	PressureMeter.id = "PressureMeter"
	PressureMeter:SetAlpha( 0.7, 0 )
	PressureMeter.GaugeName:setText( "PRS", 0 )
	PressureMeter:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 37.5, _1080p * 87.5, _1080p * -25, _1080p * 25 )
	PressureMeter:SubscribeToModel( DataSources.inGame.SP.helmetMeterPressureFill:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.SP.helmetMeterPressureFill:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			PressureMeter.MeterFill:SetRight( _1080p * Multiply( Divide( f6_local0, 10 ), 50 ), 0 )
		end
	end )
	PressureMeter:SubscribeToModel( DataSources.inGame.SP.helmetMeterPressure:GetModel( f1_local1 ), function ()
		local f7_local0 = DataSources.inGame.SP.helmetMeterPressure:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			PressureMeter.GaugeData:setText( f7_local0, 0 )
		end
	end )
	self:addElement( PressureMeter )
	self.PressureMeter = PressureMeter
	
	self._animationSets.DefaultAnimationSet = function ()
		TemperatureMeter:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TemperatureMeter:SetAlpha( 0, 0 )
				end
			}
		} )
		OxygenMeter:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.OxygenMeter:SetAlpha( 0, 0 )
				end
			}
		} )
		PressureMeter:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.PressureMeter:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			TemperatureMeter:AnimateSequence( "DefaultSequence" )
			OxygenMeter:AnimateSequence( "DefaultSequence" )
			PressureMeter:AnimateSequence( "DefaultSequence" )
		end
		
		TemperatureMeter:RegisterAnimationSequence( "MetersWarning", {
			{
				function ()
					return self.TemperatureMeter:SetAlpha( 0.7, 100 )
				end
			}
		} )
		OxygenMeter:RegisterAnimationSequence( "MetersWarning", {
			{
				function ()
					return self.OxygenMeter:SetAlpha( 0.7, 100 )
				end
			}
		} )
		PressureMeter:RegisterAnimationSequence( "MetersWarning", {
			{
				function ()
					return self.PressureMeter:SetAlpha( 0.7, 100 )
				end
			}
		} )
		self._sequences.MetersWarning = function ()
			TemperatureMeter:AnimateSequence( "MetersWarning" )
			OxygenMeter:AnimateSequence( "MetersWarning" )
			PressureMeter:AnimateSequence( "MetersWarning" )
		end
		
		TemperatureMeter:RegisterAnimationSequence( "MetersStable", {
			{
				function ()
					return self.TemperatureMeter:SetAlpha( 0.7, 100 )
				end,
				function ()
					return self.TemperatureMeter:SetAlpha( 0.7, 4900 )
				end,
				function ()
					return self.TemperatureMeter:SetAlpha( 0, 200 )
				end
			}
		} )
		OxygenMeter:RegisterAnimationSequence( "MetersStable", {
			{
				function ()
					return self.OxygenMeter:SetAlpha( 0.7, 100 )
				end,
				function ()
					return self.OxygenMeter:SetAlpha( 0.7, 4900 )
				end,
				function ()
					return self.OxygenMeter:SetAlpha( 0, 200 )
				end
			}
		} )
		PressureMeter:RegisterAnimationSequence( "MetersStable", {
			{
				function ()
					return self.PressureMeter:SetAlpha( 0.7, 100 )
				end,
				function ()
					return self.PressureMeter:SetAlpha( 0.7, 4900 )
				end,
				function ()
					return self.PressureMeter:SetAlpha( 0, 200 )
				end
			}
		} )
		self._sequences.MetersStable = function ()
			TemperatureMeter:AnimateSequence( "MetersStable" )
			OxygenMeter:AnimateSequence( "MetersStable" )
			PressureMeter:AnimateSequence( "MetersStable" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	TemperatureMeter:SubscribeToModel( DataSources.inGame.SP.helmetMeterTemperature:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.helmetMeterTemperature:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.helmetMeterTemperature:GetValue( f1_local1 ) >= 250 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "TemperatureMeter",
				sequenceName = "Warning",
				elementPath = "TemperatureMeter"
			} )
		end
		if DataSources.inGame.SP.helmetMeterTemperature:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.helmetMeterTemperature:GetValue( f1_local1 ) <= -250 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "TemperatureMeter",
				sequenceName = "Warning",
				elementPath = "TemperatureMeter"
			} )
		end
		if DataSources.inGame.SP.helmetMeterTemperature:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.helmetMeterTemperature:GetValue( f1_local1 ) < 250 and DataSources.inGame.SP.helmetMeterTemperature:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.helmetMeterTemperature:GetValue( f1_local1 ) > -250 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "TemperatureMeter",
				sequenceName = "Stable",
				elementPath = "TemperatureMeter"
			} )
		end
	end )
	OxygenMeter:SubscribeToModel( DataSources.inGame.SP.helmetMeterOxygen:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.helmetMeterOxygen:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.helmetMeterOxygen:GetValue( f1_local1 ) <= 30 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "OxygenMeter",
				sequenceName = "Warning",
				elementPath = "OxygenMeter"
			} )
		end
		if DataSources.inGame.SP.helmetMeterOxygen:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.helmetMeterOxygen:GetValue( f1_local1 ) > 30 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "OxygenMeter",
				sequenceName = "Stable",
				elementPath = "OxygenMeter"
			} )
		end
	end )
	PressureMeter:SubscribeToModel( DataSources.inGame.SP.helmetMeterPressure:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.helmetMeterPressure:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.helmetMeterPressure:GetValue( f1_local1 ) < 5 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "PressureMeter",
				sequenceName = "Warning",
				elementPath = "PressureMeter"
			} )
		end
		if DataSources.inGame.SP.helmetMeterPressure:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.helmetMeterPressure:GetValue( f1_local1 ) >= 5 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "PressureMeter",
				sequenceName = "Stable",
				elementPath = "PressureMeter"
			} )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.SP.helmetMetersAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.helmetMetersAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.helmetMetersAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "MetersWarning" )
		end
		if DataSources.inGame.SP.helmetMetersAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.helmetMetersAlpha:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "MetersStable" )
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "HelmetMeters", HelmetMeters )
LockTable( _M )
