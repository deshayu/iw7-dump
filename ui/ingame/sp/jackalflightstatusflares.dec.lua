local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.Background
	if f1_local1 then
		f1_local1 = f1_arg0.Frame and f1_arg0.Textfield
	end
	f1_local0( f1_local1, "WARNING: Jackal Flight Status Flare Items Are Missing..." )
	f1_arg0.Background:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.Frame:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.Textfield:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.flaresRecharging:GetModel( f1_arg1 ), function ()
		if DataSources.inGame.jackal.flaresRecharging:GetValue( f1_arg1 ) then
			f1_arg0.Textfield:SetBlendMode( BLEND_MODE.disabled )
			ACTIONS.AnimateSequence( f1_arg0, "recharging" )
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.flaresReady:GetModel( f1_arg1 ), function ()
		if DataSources.inGame.jackal.flaresReady:GetValue( f1_arg1 ) then
			f1_arg0.Textfield:SetBlendMode( BLEND_MODE.addWithAlpha )
			ACTIONS.AnimateSequence( f1_arg0, "ready" )
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.specialistFlareEmpty:GetModel( f1_arg1 ), function ()
		if DataSources.inGame.jackal.specialistFlareEmpty:GetValue( f1_arg1 ) then
			f1_arg0.Textfield:SetBlendMode( BLEND_MODE.disabled )
			ACTIONS.AnimateSequence( f1_arg0, "recharging" )
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.specialistFlareRecharge:GetModel( f1_arg1 ), function ()
		if DataSources.inGame.jackal.specialistFlareRecharge:GetValue( f1_arg1 ) then
			f1_arg0.Textfield:SetBlendMode( BLEND_MODE.addWithAlpha )
			ACTIONS.AnimateSequence( f1_arg0, "rechargeSpecialist" )
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.specialistFlareUse:GetModel( f1_arg1 ), function ()
		if DataSources.inGame.jackal.specialistFlareUse:GetValue( f1_arg1 ) then
			f1_arg0.Textfield:SetBlendMode( BLEND_MODE.addWithAlpha )
			ACTIONS.AnimateSequence( f1_arg0, "useSpecialist" )
		end
	end )
	f1_arg0:registerEventHandler( "level_load", function ()
		ACTIONS.AnimateSequence( f1_arg0, "Default" )
	end )
end

function JackalFlightStatusFlares( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 80 * _1080p, 0, 24 * _1080p )
	self.id = "JackalFlightStatusFlares"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.jackal.FlareBG_Ready, 0 )
	Background:SetAlpha( 0, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 1, _1080p * -1 )
	self:addElement( Background )
	self.Background = Background
	
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Frame.id = "Frame"
	Frame:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Textfield = nil
	
	Textfield = LUI.UIStyledText.new()
	Textfield.id = "Textfield"
	Textfield:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	Textfield:setText( ToUpperCase( Engine.Localize( "JACKAL_FLARES" ) ), 0 )
	Textfield:SetFontSize( 18 * _1080p )
	Textfield:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Textfield:SetAlignment( LUI.Alignment.Center )
	Textfield:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -9, _1080p * 9 )
	self:addElement( Textfield )
	self.Textfield = Textfield
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "ready", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.jackal.FlareBG_Ready, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 100 )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "ready", {
			{
				function ()
					return self.Frame:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			},
			{
				function ()
					return self.Frame:SetAlpha( 1, 0 )
				end
			}
		} )
		Textfield:RegisterAnimationSequence( "ready", {
			{
				function ()
					return self.Textfield:SetRGBFromTable( SWATCHES.jackal.FlareText_Ready, 0 )
				end,
				function ()
					return self.Textfield:SetRGBFromTable( SWATCHES.jackal.FlareText_Ready, 500 )
				end,
				function ()
					return self.Textfield:SetRGBFromTable( SWATCHES.jackal.stable, 100 )
				end
			},
			{
				function ()
					return self.Textfield:setText( ToUpperCase( Engine.Localize( "JACKAL_FLARES" ) ), 0 )
				end
			}
		} )
		self._sequences.ready = function ()
			Background:AnimateSequence( "ready" )
			Frame:AnimateSequence( "ready" )
			Textfield:AnimateSequence( "ready" )
		end
		
		Background:RegisterAnimationSequence( "recharging", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.jackal.FlareBG_NotReady, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.75, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 50 )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "recharging", {
			{
				function ()
					return self.Frame:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.Frame:SetAlpha( 0.75, 50 )
				end,
				function ()
					return self.Frame:SetAlpha( 0.5, 50 )
				end
			},
			{
				function ()
					return self.Frame:SetRGBFromTable( SWATCHES.jackal.FlareBG_NotReady, 0 )
				end
			}
		} )
		Textfield:RegisterAnimationSequence( "recharging", {
			{
				function ()
					return self.Textfield:SetRGBFromTable( SWATCHES.jackal.FlareText_NotReady, 0 )
				end
			},
			{
				function ()
					return self.Textfield:setText( ToUpperCase( Engine.Localize( "JACKAL_NO_FLARES" ) ), 0 )
				end
			}
		} )
		self._sequences.recharging = function ()
			Background:AnimateLoop( "recharging" )
			Frame:AnimateLoop( "recharging" )
			Textfield:AnimateLoop( "recharging" )
		end
		
		Background:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.jackal.FlareBG_Ready, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Frame:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			},
			{
				function ()
					return self.Frame:SetAlpha( 1, 0 )
				end
			}
		} )
		Textfield:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Textfield:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			},
			{
				function ()
					return self.Textfield:setText( ToUpperCase( Engine.Localize( "JACKAL_FLARES" ) ), 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			Background:AnimateSequence( "Default" )
			Frame:AnimateSequence( "Default" )
			Textfield:AnimateSequence( "Default" )
		end
		
		Background:RegisterAnimationSequence( "rechargeSpecialist", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.jackal.FlareBG_Ready, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 100 )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "rechargeSpecialist", {
			{
				function ()
					return self.Frame:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			},
			{
				function ()
					return self.Frame:SetAlpha( 1, 0 )
				end
			}
		} )
		Textfield:RegisterAnimationSequence( "rechargeSpecialist", {
			{
				function ()
					return self.Textfield:SetRGBFromTable( SWATCHES.jackal.FlareText_Ready, 0 )
				end,
				function ()
					return self.Textfield:SetRGBFromTable( SWATCHES.jackal.stable, 200 )
				end,
				function ()
					return self.Textfield:SetRGBFromTable( SWATCHES.jackal.stable, 100 )
				end
			},
			{
				function ()
					return self.Textfield:setText( ToUpperCase( Engine.Localize( "JACKAL_FLARES" ) ), 0 )
				end
			}
		} )
		self._sequences.rechargeSpecialist = function ()
			Background:AnimateSequence( "rechargeSpecialist" )
			Frame:AnimateSequence( "rechargeSpecialist" )
			Textfield:AnimateSequence( "rechargeSpecialist" )
		end
		
		Background:RegisterAnimationSequence( "useSpecialist", {
			{
				function ()
					return self.Background:SetRGBFromInt( 13150787, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 90 )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "useSpecialist", {
			{
				function ()
					return self.Frame:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			},
			{
				function ()
					return self.Frame:SetAlpha( 1, 0 )
				end
			}
		} )
		Textfield:RegisterAnimationSequence( "useSpecialist", {
			{
				function ()
					return self.Textfield:SetRGBFromTable( SWATCHES.jackal.FlareText_Ready, 0 )
				end,
				function ()
					return self.Textfield:SetRGBFromTable( SWATCHES.jackal.stable, 100 )
				end,
				function ()
					return self.Textfield:SetRGBFromTable( SWATCHES.jackal.stable, 90 )
				end
			},
			{
				function ()
					return self.Textfield:setText( ToUpperCase( Engine.Localize( "JACKAL_FLARES" ) ), 0 )
				end
			}
		} )
		self._sequences.useSpecialist = function ()
			Background:AnimateSequence( "useSpecialist" )
			Frame:AnimateSequence( "useSpecialist" )
			Textfield:AnimateSequence( "useSpecialist" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalFlightStatusFlares", JackalFlightStatusFlares )
LockTable( _M )
