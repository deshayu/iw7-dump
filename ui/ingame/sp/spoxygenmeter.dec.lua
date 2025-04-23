local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.TitleText
	if f1_local1 then
		f1_local1 = f1_arg0.ValueText
		if f1_local1 then
			f1_local1 = f1_arg0.Fill
			if f1_local1 then
				f1_local1 = f1_arg0.Glow and f1_arg0.Mask
			end
		end
	end
	f1_local0( f1_local1, "WARNING: SP Oxygen Meter Items Are Missing..." )
	f1_arg0.Fill:SetMask( f1_arg0.Mask )
	f1_arg0.Glow:SetMask( f1_arg0.Mask )
	f1_arg0:SetDotPitchEnabled( true )
	f1_arg0:SetDotPitchX( 6, 0 )
	f1_arg0:SetDotPitchY( 3, 0 )
	f1_arg0:SetDotPitchContrast( 0.15, 0 )
	f1_arg0.TitleText:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.ValueText:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.currentState = "WarningOff"
	ACTIONS.AnimateSequence( f1_arg0, "LoopGlow" )
	f1_local0 = DataSources.inGame.SP.helmetMeterOxygen
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		local f2_local1 = Divide( f2_local0, 100 )
		local f2_local2 = nil
		f1_arg0.Mask:SetTopAnchor( 1 - f2_local1, 100 )
		f1_arg0.ValueText:setText( f2_local0 .. "%", 0 )
		if f2_local0 < 25 then
			f2_local2 = "WarningOn"
			if f1_arg0.currentState ~= f2_local2 then
				f1_arg0.currentState = f2_local2
				f1_arg0.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 0 )
				ACTIONS.AnimateSequence( f1_arg0, f2_local2 )
			end
		else
			f2_local2 = "WarningOff"
			if f1_arg0.currentState ~= f2_local2 then
				f1_arg0.currentState = f2_local2
				f1_arg0.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_oxg, 0 )
				ACTIONS.AnimateSequence( f1_arg0, f2_local2 )
				ACTIONS.AnimateSequence( f1_arg0, "LoopGlow" )
			end
		end
	end )
end

function SPOxygenMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 424 * _1080p )
	self.id = "SPOxygenMeter"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetAlpha( 0.5, 0 )
	Frame:setImage( RegisterMaterial( "hud_sp_meter_frame" ), 0 )
	Frame:SetUseAA( true )
	Frame:SetBlendMode( BLEND_MODE.addWithAlpha )
	Frame:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * -128, _1080p * -18, _1080p * 18 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_oxg, 0 )
	Glow:setImage( RegisterMaterial( "hud_sp_meter_fill_glow" ), 0 )
	Glow:SetBlendMode( BLEND_MODE.addWithAlpha )
	Glow:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -42, _1080p * -90, _1080p * -18, _1080p * 18 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetAlpha( 0.5, 0 )
	Fill:setImage( RegisterMaterial( "hud_sp_meter_fill" ), 0 )
	Fill:SetUseAA( true )
	Fill:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -48, _1080p * -84, _1080p * -18, _1080p * 18 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:SetAlpha( 0, 0 )
	Mask:setImage( RegisterMaterial( "white_2d_mask" ), 0 )
	self:addElement( Mask )
	self.Mask = Mask
	
	local TitleText = nil
	
	TitleText = LUI.UIStyledText.new()
	TitleText.id = "TitleText"
	TitleText:SetRGBFromTable( SWATCHES.HUDMeters.text, 0 )
	TitleText:setText( Engine.Localize( "HUD_METER_OXG" ), 0 )
	TitleText:SetFontSize( 18 * _1080p )
	TitleText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TitleText:SetAlignment( LUI.Alignment.Left )
	TitleText:SetShadowRGBFromInt( 0, 0 )
	TitleText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -18, _1080p * 32, _1080p * -9, _1080p * 9 )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local ValueText = nil
	
	ValueText = LUI.UIStyledText.new()
	ValueText.id = "ValueText"
	ValueText:SetRGBFromTable( SWATCHES.HUDMeters.value, 0 )
	ValueText:setText( "", 0 )
	ValueText:SetFontSize( 18 * _1080p )
	ValueText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ValueText:SetAlignment( LUI.Alignment.Right )
	ValueText:SetShadowRGBFromInt( 0, 0 )
	ValueText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -114, _1080p * -64, _1080p * -9, _1080p * 9 )
	self:addElement( ValueText )
	self.ValueText = ValueText
	
	self._animationSets.DefaultAnimationSet = function ()
		Mask:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Mask:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Mask:AnimateSequence( "DefaultSequence" )
		end
		
		Frame:RegisterAnimationSequence( "WarningOn", {
			{
				function ()
					return self.Frame:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 0 )
				end
			},
			{
				function ()
					return self.Frame:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Frame:SetAlpha( 1, 390 )
				end,
				function ()
					return self.Frame:SetAlpha( 0.5, 210 )
				end,
				function ()
					return self.Frame:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.Frame:SetAlpha( 1, 200 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "WarningOn", {
			{
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 0 )
				end,
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 390 )
				end,
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_oxg, 210 )
				end,
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_oxg, 400 )
				end,
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 200 )
				end
			},
			{
				function ()
					return self.Glow:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 390 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.5, 210 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 200 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "WarningOn", {
			{
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 0 )
				end,
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 390 )
				end,
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_oxg, 210 )
				end,
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_oxg, 400 )
				end,
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 200 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "WarningOn", {
			{
				function ()
					return self.TitleText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TitleText:SetAlpha( 1, 390 )
				end,
				function ()
					return self.TitleText:SetAlpha( 0.5, 210 )
				end,
				function ()
					return self.TitleText:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.TitleText:SetAlpha( 1, 200 )
				end
			}
		} )
		ValueText:RegisterAnimationSequence( "WarningOn", {
			{
				function ()
					return self.ValueText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ValueText:SetAlpha( 1, 390 )
				end,
				function ()
					return self.ValueText:SetAlpha( 0.5, 210 )
				end,
				function ()
					return self.ValueText:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.ValueText:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.WarningOn = function ()
			Frame:AnimateLoop( "WarningOn" )
			Glow:AnimateLoop( "WarningOn" )
			Fill:AnimateLoop( "WarningOn" )
			TitleText:AnimateLoop( "WarningOn" )
			ValueText:AnimateLoop( "WarningOn" )
		end
		
		Frame:RegisterAnimationSequence( "WarningOff", {
			{
				function ()
					return self.Frame:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Frame:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "WarningOff", {
			{
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_oxg, 0 )
				end
			},
			{
				function ()
					return self.Glow:SetAlpha( 1, 0 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "WarningOff", {
			{
				function ()
					return self.Fill:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "WarningOff", {
			{
				function ()
					return self.TitleText:SetRGBFromTable( SWATCHES.HUDMeters.text, 0 )
				end
			},
			{
				function ()
					return self.TitleText:SetAlpha( 1, 0 )
				end
			}
		} )
		ValueText:RegisterAnimationSequence( "WarningOff", {
			{
				function ()
					return self.ValueText:SetRGBFromTable( SWATCHES.HUDMeters.value, 0 )
				end
			},
			{
				function ()
					return self.ValueText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.WarningOff = function ()
			Frame:AnimateSequence( "WarningOff" )
			Glow:AnimateSequence( "WarningOff" )
			Fill:AnimateSequence( "WarningOff" )
			TitleText:AnimateSequence( "WarningOff" )
			ValueText:AnimateSequence( "WarningOff" )
		end
		
		Glow:RegisterAnimationSequence( "LoopGlow", {
			{
				function ()
					return self.Glow:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.5, 1000 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 1000 )
				end
			}
		} )
		self._sequences.LoopGlow = function ()
			Glow:AnimateLoop( "LoopGlow" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "SPOxygenMeter", SPOxygenMeter )
LockTable( _M )
