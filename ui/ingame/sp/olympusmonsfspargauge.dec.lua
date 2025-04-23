local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
MIN_EXPONENT = 0.25
MAX_EXPONENT = 2
MIN_STEP = 0.1
MAX_STEP = 0.25
MAX_HEIGHT_PCT = 0.85
MAX_PIPS = 23
NUM_PIP_ELEMENTS = 3
function InitializeFSparGaugeSettings( f1_arg0 )
	for f1_local0 = 1, NUM_PIP_ELEMENTS, 1 do
		f1_arg0.fsparGaugeSettings[f1_local0] = {
			exponent = MIN_EXPONENT + (MAX_EXPONENT - MIN_EXPONENT) * math.random(),
			lastStep = 0,
			currentStep = MIN_STEP + (MAX_STEP - MIN_STEP) * math.random()
		}
		if f1_local0 == 1 then
			f1_arg0.fsparGaugeSettings[f1_local0].element = f1_arg0.LeftPip
		end
		if f1_local0 == 2 then
			f1_arg0.fsparGaugeSettings[f1_local0].element = f1_arg0.CenterPip
		else
			f1_arg0.fsparGaugeSettings[f1_local0].element = f1_arg0.RightPip
		end
	end
end

function ResetFSparGaugeSettings( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.fsparGaugeSettings[f2_arg1].exponent = MIN_EXPONENT + (MAX_EXPONENT - MIN_EXPONENT) * math.random()
	f2_arg0.fsparGaugeSettings[f2_arg1].lastStep = LUI.clamp( f2_arg0.fsparGaugeSettings[f2_arg1].currentStep, 0, 1 )
	if f2_arg2 then
		f2_arg0.fsparGaugeSettings[f2_arg1].currentStep = math.min( f2_arg0.fsparGaugeSettings[f2_arg1].lastStep + MIN_STEP + (MAX_STEP - MIN_STEP) * math.random(), 1 )
	else
		f2_arg0.fsparGaugeSettings[f2_arg1].currentStep = math.max( f2_arg0.fsparGaugeSettings[f2_arg1].lastStep - MIN_STEP + (MAX_STEP - MIN_STEP) * math.random(), 0 )
	end
end

function UpdateFSparGauge( f3_arg0, f3_arg1 )
	local f3_local0, f3_local1, f3_local2, f3_local3 = f3_arg0:getLocalRect()
	local f3_local4 = (f3_local3 - f3_local1) * MAX_HEIGHT_PCT / MAX_PIPS
	f3_local0, f3_local1, f3_local2, f3_local3 = f3_arg0.LeftPip:getLocalRect()
	local f3_local5 = f3_arg0.fsparLastReloadState < f3_arg1
	for f3_local6 = 1, NUM_PIP_ELEMENTS, 1 do
		if not (not f3_local5 or f3_arg0.fsparGaugeSettings[f3_local6].currentStep >= f3_arg1 and f3_arg1 >= f3_arg0.fsparGaugeSettings[f3_local6].lastStep) or not f3_local5 and (f3_arg1 < f3_arg0.fsparGaugeSettings[f3_local6].currentStep or f3_arg0.fsparGaugeSettings[f3_local6].lastStep < f3_arg1) then
			ResetFSparGaugeSettings( f3_arg0, f3_local6, f3_local5 )
		end
		local f3_local9 = f3_arg0.fsparGaugeSettings[f3_local6].currentStep - f3_arg0.fsparGaugeSettings[f3_local6].lastStep
		local f3_local10 = math.floor( MAX_PIPS * (f3_arg0.fsparGaugeSettings[f3_local6].lastStep + f3_local9 * math.pow( (f3_arg1 - f3_arg0.fsparGaugeSettings[f3_local6].lastStep) / f3_local9, f3_arg0.fsparGaugeSettings[f3_local6].exponent )) )
		if f3_arg1 >= 1 then
			f3_local10 = MAX_PIPS
			f3_arg0.fsparGaugeSettings[f3_local6].lastStep = 1
			f3_arg0.fsparGaugeSettings[f3_local6].currentStep = 1
		elseif f3_arg1 <= 0 then
			f3_local10 = 0
			f3_arg0.fsparGaugeSettings[f3_local6].lastStep = 0
			f3_arg0.fsparGaugeSettings[f3_local6].currentStep = 0
		end
		f3_arg0.fsparGaugeSettings[f3_local6].element:SetTop( f3_local3 - f3_local4 * f3_local10, 0 )
	end
	f3_arg0.fsparLastReloadState = f3_arg1
end

function PostLoadFunc( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0.fsparGaugeSettings = {}
	f4_arg0.fsparLastReloadState = 0
	InitializeFSparGaugeSettings( f4_arg0 )
	local f4_local0 = DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetModel( f4_arg1 )
	f4_arg0:SubscribeToModel( f4_local0, function ()
		UpdateFSparGauge( f4_arg0, DataModel.GetModelValue( f4_local0 ) )
	end, true )
end

function OlympusMonsFSparGauge( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 304 * _1080p, 0, 798 * _1080p )
	self.id = "OlympusMonsFSparGauge"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local LeftPip = nil
	
	LeftPip = LUI.UIImage.new()
	LeftPip.id = "LeftPip"
	LeftPip:SetRGBFromInt( 16749824, 0 )
	LeftPip:SetUseAA( true )
	LeftPip:SetBlendMode( BLEND_MODE.add )
	LeftPip:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 61.5, _1080p * -171.25, _1080p * -57.5, _1080p * -34.5 )
	self:addElement( LeftPip )
	self.LeftPip = LeftPip
	
	local CenterPip = nil
	
	CenterPip = LUI.UIImage.new()
	CenterPip.id = "CenterPip"
	CenterPip:SetRGBFromInt( 16749824, 0 )
	CenterPip:SetUseAA( true )
	CenterPip:SetBlendMode( BLEND_MODE.add )
	CenterPip:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 112.38, _1080p * -116.38, _1080p * -57.5, _1080p * -34.5 )
	self:addElement( CenterPip )
	self.CenterPip = CenterPip
	
	local RightPip = nil
	
	RightPip = LUI.UIImage.new()
	RightPip.id = "RightPip"
	RightPip:SetRGBFromInt( 16749824, 0 )
	RightPip:SetUseAA( true )
	RightPip:SetBlendMode( BLEND_MODE.add )
	RightPip:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 170.38, _1080p * -62.38, _1080p * -57.5, _1080p * -34.5 )
	self:addElement( RightPip )
	self.RightPip = RightPip
	
	local GaugeMask = nil
	
	GaugeMask = LUI.UIImage.new()
	GaugeMask.id = "GaugeMask"
	GaugeMask:setImage( RegisterMaterial( "radar_targeting_fspar_gauge_mask" ), 0 )
	GaugeMask:SetUseAA( true )
	GaugeMask:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GaugeMask )
	self.GaugeMask = GaugeMask
	
	local Gauge = nil
	
	Gauge = LUI.UIImage.new()
	Gauge.id = "Gauge"
	Gauge:setImage( RegisterMaterial( "radar_targeting_fspar_gauge" ), 0 )
	Gauge:SetUseAA( true )
	self:addElement( Gauge )
	self.Gauge = Gauge
	
	local Primed = nil
	
	Primed = LUI.UIText.new()
	Primed.id = "Primed"
	Primed:SetRGBFromInt( 16711680, 0 )
	Primed:setText( Engine.Localize( "HEIST_PRIMED" ), 0 )
	Primed:SetFontSize( 60 * _1080p )
	Primed:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Primed:SetAlignment( LUI.Alignment.Center )
	Primed:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 6, 0, 0, _1080p * -734.67 )
	self:addElement( Primed )
	self.Primed = Primed
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LeftPip:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.LeftPip:SetRGBFromInt( 8407552, 0 )
				end,
				function ()
					return self.LeftPip:SetRGBFromInt( 16749824, 500, LUI.EASING.inOutSine )
				end,
				function ()
					return self.LeftPip:SetRGBFromInt( 8407552, 500, LUI.EASING.inOutSine )
				end
			}
		} )
		CenterPip:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.CenterPip:SetRGBFromInt( 8407552, 0 )
				end,
				function ()
					return self.CenterPip:SetRGBFromInt( 16749824, 500, LUI.EASING.inOutSine )
				end,
				function ()
					return self.CenterPip:SetRGBFromInt( 8407552, 500, LUI.EASING.inOutSine )
				end
			}
		} )
		RightPip:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.RightPip:SetRGBFromInt( 8407808, 0 )
				end,
				function ()
					return self.RightPip:SetRGBFromInt( 16749824, 500, LUI.EASING.inOutSine )
				end,
				function ()
					return self.RightPip:SetRGBFromInt( 8407552, 500, LUI.EASING.inOutSine )
				end
			}
		} )
		Primed:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.Primed:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Primed:SetAlpha( 1, 330, LUI.EASING.inSine )
				end,
				function ()
					return self.Primed:SetAlpha( 0, 10, LUI.EASING.outQuintic )
				end,
				function ()
					return self.Primed:SetAlpha( 1, 320, LUI.EASING.inSine )
				end,
				function ()
					return self.Primed:SetAlpha( 0, 10, LUI.EASING.outQuintic )
				end,
				function ()
					return self.Primed:SetAlpha( 1, 330, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.Ready = function ()
			LeftPip:AnimateLoop( "Ready" )
			CenterPip:AnimateLoop( "Ready" )
			RightPip:AnimateLoop( "Ready" )
			Primed:AnimateLoop( "Ready" )
		end
		
		LeftPip:RegisterAnimationSequence( "Charging", {
			{
				function ()
					return self.LeftPip:SetRGBFromInt( 8407552, 0 )
				end
			}
		} )
		CenterPip:RegisterAnimationSequence( "Charging", {
			{
				function ()
					return self.CenterPip:SetRGBFromInt( 8407552, 0 )
				end
			}
		} )
		RightPip:RegisterAnimationSequence( "Charging", {
			{
				function ()
					return self.RightPip:SetRGBFromInt( 8407552, 0 )
				end
			}
		} )
		Primed:RegisterAnimationSequence( "Charging", {
			{
				function ()
					return self.Primed:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Charging = function ()
			LeftPip:AnimateSequence( "Charging" )
			CenterPip:AnimateSequence( "Charging" )
			RightPip:AnimateSequence( "Charging" )
			Primed:AnimateSequence( "Charging" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetModel( f6_local1 ), function ()
		if DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetValue( f6_local1 ) ~= nil and DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetValue( f6_local1 ) < 1 then
			ACTIONS.AnimateSequence( self, "Charging" )
		end
		if DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetValue( f6_local1 ) ~= nil and DataSources.inGame.SP.heistSpace.olympusMonsWeaponStatus:GetValue( f6_local1 ) >= 1 then
			ACTIONS.AnimateSequence( self, "Ready" )
		end
	end )
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "OlympusMonsFSparGauge", OlympusMonsFSparGauge )
LockTable( _M )
