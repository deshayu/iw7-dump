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
	f1_local0( f1_local1, "WARNING: SP Temperature Meter Items Are Missing..." )
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
	f1_local0 = DataSources.inGame.SP.helmetMeterTemperature
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		f1_arg0.ValueText:setText( f2_local0 .. "??", 0 )
		f1_arg0.Mask:SetTopAnchor( 1 - (f2_local0 + 400) / 800, 100 )
		local f2_local1 = nil
		if f2_local0 < -250 then
			f2_local1 = "WarningOnCold"
			if f1_arg0.currentState ~= f2_local1 then
				f1_arg0.currentState = f2_local1
				f1_arg0.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_cold, 0 )
				ACTIONS.AnimateSequence( f1_arg0, f2_local1 )
			end
		elseif f2_local0 > 250 then
			f2_local1 = "WarningOnHot"
			if f1_arg0.currentState ~= f2_local1 then
				f1_arg0.currentState = f2_local1
				f1_arg0.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 0 )
				ACTIONS.AnimateSequence( f1_arg0, f2_local1 )
			end
		else
			f2_local1 = "WarningOff"
			f1_arg0.currentState = f2_local1
			f1_arg0.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp, 0 )
			ACTIONS.AnimateSequence( f1_arg0, f2_local1 )
			ACTIONS.AnimateSequence( f1_arg0, "LoopGlow" )
		end
	end )
end

function SPTemperatureMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 424 * _1080p )
	self.id = "SPTemperatureMeter"
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
	Frame:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 128, _1080p * -18, _1080p * 18 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp, 0 )
	Glow:setImage( RegisterMaterial( "hud_sp_meter_fill_glow" ), 0 )
	Glow:SetBlendMode( BLEND_MODE.addWithAlpha )
	Glow:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 42, _1080p * 90, _1080p * -18, _1080p * 18 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetAlpha( 0.5, 0 )
	Fill:setImage( RegisterMaterial( "hud_sp_meter_fill" ), 0 )
	Fill:SetUseAA( true )
	Fill:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 48, _1080p * 84, _1080p * -18, _1080p * 18 )
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
	TitleText:setText( Engine.Localize( "HUD_METER_TEMP" ), 0 )
	TitleText:SetFontSize( 18 * _1080p )
	TitleText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TitleText:SetAlignment( LUI.Alignment.Right )
	TitleText:SetShadowRGBFromInt( 0, 0 )
	TitleText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -31, _1080p * 19, _1080p * -9, _1080p * 9 )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local ValueText = nil
	
	ValueText = LUI.UIStyledText.new()
	ValueText.id = "ValueText"
	ValueText:SetRGBFromTable( SWATCHES.HUDMeters.value, 0 )
	ValueText:setText( "", 0 )
	ValueText:SetFontSize( 18 * _1080p )
	ValueText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ValueText:SetAlignment( LUI.Alignment.Left )
	ValueText:SetShadowRGBFromInt( 0, 0 )
	ValueText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 64, _1080p * 114, _1080p * -9, _1080p * 9 )
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
		
		Frame:RegisterAnimationSequence( "WarningOnHot", {
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
					return self.Frame:SetAlpha( 1, 400 )
				end,
				function ()
					return self.Frame:SetAlpha( 0.5, 200 )
				end,
				function ()
					return self.Frame:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.Frame:SetAlpha( 1, 200 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "WarningOnHot", {
			{
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 0 )
				end,
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 400 )
				end,
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp, 200 )
				end,
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp, 400 )
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
					return self.Glow:SetAlpha( 1, 400 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.5, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 200 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "WarningOnHot", {
			{
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 0 )
				end,
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 400 )
				end,
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp, 200 )
				end,
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp, 400 )
				end,
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 200 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "WarningOnHot", {
			{
				function ()
					return self.TitleText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TitleText:SetAlpha( 1, 400 )
				end,
				function ()
					return self.TitleText:SetAlpha( 0.5, 200 )
				end,
				function ()
					return self.TitleText:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.TitleText:SetAlpha( 1, 200 )
				end
			}
		} )
		ValueText:RegisterAnimationSequence( "WarningOnHot", {
			{
				function ()
					return self.ValueText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ValueText:SetAlpha( 1, 400 )
				end,
				function ()
					return self.ValueText:SetAlpha( 0.5, 200 )
				end,
				function ()
					return self.ValueText:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.ValueText:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.WarningOnHot = function ()
			Frame:AnimateLoop( "WarningOnHot" )
			Glow:AnimateLoop( "WarningOnHot" )
			Fill:AnimateLoop( "WarningOnHot" )
			TitleText:AnimateLoop( "WarningOnHot" )
			ValueText:AnimateLoop( "WarningOnHot" )
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
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp, 0 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "WarningOff", {
			{
				function ()
					return self.Fill:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetAlpha( 0.5, 0 )
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
		
		Frame:RegisterAnimationSequence( "WarningOnCold", {
			{
				function ()
					return self.Frame:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Frame:SetAlpha( 1, 400 )
				end,
				function ()
					return self.Frame:SetAlpha( 0.5, 200 )
				end,
				function ()
					return self.Frame:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.Frame:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.Frame:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 0 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "WarningOnCold", {
			{
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 0 )
				end,
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 400 )
				end,
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_cold, 200 )
				end,
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_cold, 400 )
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
					return self.Glow:SetAlpha( 1, 400 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.5, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 200 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "WarningOnCold", {
			{
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 0 )
				end,
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 400 )
				end,
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_cold, 200 )
				end,
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_cold, 400 )
				end,
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.HUDMeters.fill_temp_hot, 200 )
				end
			}
		} )
		TitleText:RegisterAnimationSequence( "WarningOnCold", {
			{
				function ()
					return self.TitleText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TitleText:SetAlpha( 1, 400 )
				end,
				function ()
					return self.TitleText:SetAlpha( 0.5, 200 )
				end,
				function ()
					return self.TitleText:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.TitleText:SetAlpha( 1, 200 )
				end
			}
		} )
		ValueText:RegisterAnimationSequence( "WarningOnCold", {
			{
				function ()
					return self.ValueText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ValueText:SetAlpha( 1, 400 )
				end,
				function ()
					return self.ValueText:SetAlpha( 0.5, 200 )
				end,
				function ()
					return self.ValueText:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.ValueText:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.WarningOnCold = function ()
			Frame:AnimateLoop( "WarningOnCold" )
			Glow:AnimateLoop( "WarningOnCold" )
			Fill:AnimateLoop( "WarningOnCold" )
			TitleText:AnimateLoop( "WarningOnCold" )
			ValueText:AnimateLoop( "WarningOnCold" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "SPTemperatureMeter", SPTemperatureMeter )
LockTable( _M )
