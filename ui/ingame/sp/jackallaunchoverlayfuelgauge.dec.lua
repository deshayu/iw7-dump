local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.FuelGaugeFill:SetMask( f1_arg0.FuelGaugeMask )
	local f1_local0 = DataSources.inGame.jackal.launchFuel:GetModel( f1_arg1 )
	local f1_local1 = DataSources.inGame.jackal.boostersCharging:GetModel( f1_arg1 )
	local f1_local2 = function ( f2_arg0 )
		local f2_local0 = nil
		local f2_local1 = DataModel.GetModelValue( f1_local0 )
		if f2_local1 > 0 and not DataModel.GetModelValue( f1_local1 ) then
			f2_local0 = "Show"
			f1_arg0.FuelPercent:setText( math.ceil( f2_local1 ) )
		else
			f2_local0 = "Default"
		end
		if f2_local0 ~= nil then
			ACTIONS.AnimateSequence( f1_arg0, f2_local0 )
		end
	end
	
	f1_local2()
	f1_arg0:SubscribeToModel( f1_local0, f1_local2, true )
	f1_arg0:SubscribeToModel( f1_local1, f1_local2, true )
end

function JackalLaunchOverlayFuelGauge( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 286 * _1080p, 0, 428 * _1080p )
	self.id = "JackalLaunchOverlayFuelGauge"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local FuelGaugeShadow = nil
	
	FuelGaugeShadow = LUI.UIImage.new()
	FuelGaugeShadow.id = "FuelGaugeShadow"
	FuelGaugeShadow:setImage( RegisterMaterial( "hud_jackal_launch_fuel_gauge_shadow" ), 0 )
	FuelGaugeShadow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 43, _1080p * 107, _1080p * -214, _1080p * 206 )
	self:addElement( FuelGaugeShadow )
	self.FuelGaugeShadow = FuelGaugeShadow
	
	local FuelGaugeRedBars = nil
	
	FuelGaugeRedBars = LUI.UIImage.new()
	FuelGaugeRedBars.id = "FuelGaugeRedBars"
	FuelGaugeRedBars:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	FuelGaugeRedBars:SetAlpha( 0.8, 0 )
	FuelGaugeRedBars:setImage( RegisterMaterial( "hud_jackal_launch_fuel_gauge_red_bars" ), 0 )
	FuelGaugeRedBars:SetBlendMode( BLEND_MODE.addWithAlpha )
	FuelGaugeRedBars:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 43, _1080p * 107, _1080p * -214, _1080p * 206 )
	self:addElement( FuelGaugeRedBars )
	self.FuelGaugeRedBars = FuelGaugeRedBars
	
	local FuelGaugeFill = nil
	
	FuelGaugeFill = LUI.UIImage.new()
	FuelGaugeFill.id = "FuelGaugeFill"
	FuelGaugeFill:SetAnchors( 0, 1, 0.5, 0.5, 0 )
	FuelGaugeFill:SetLeft( _1080p * 43, 0 )
	FuelGaugeFill:SetRight( _1080p * 107, 0 )
	FuelGaugeFill:SetAlpha( 0.95, 0 )
	FuelGaugeFill:setImage( RegisterMaterial( "hud_jackal_launch_fuel_gauge_fill" ), 0 )
	FuelGaugeFill:SetBlendMode( BLEND_MODE.addWithAlpha )
	FuelGaugeFill:SubscribeToModel( DataSources.inGame.jackal.launchFuel:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.jackal.launchFuel:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			FuelGaugeFill:SetTop( _1080p * Subtract( Multiply( Subtract( f4_local0, 100 ), -4.2 ), 240 ), 0 )
		end
	end )
	FuelGaugeFill:SubscribeToModel( DataSources.inGame.jackal.launchFuel:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.jackal.launchFuel:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			FuelGaugeFill:SetBottom( _1080p * Add( Multiply( Subtract( f5_local0, 100 ), -4.2 ), 210 ), 0 )
		end
	end )
	self:addElement( FuelGaugeFill )
	self.FuelGaugeFill = FuelGaugeFill
	
	local FuelGaugeMask = nil
	
	FuelGaugeMask = LUI.UIImage.new()
	FuelGaugeMask.id = "FuelGaugeMask"
	FuelGaugeMask:setImage( RegisterMaterial( "hud_jackal_launch_fuel_gauge_mask" ), 0 )
	FuelGaugeMask:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 43, _1080p * 107, _1080p * -214, _1080p * 206 )
	self:addElement( FuelGaugeMask )
	self.FuelGaugeMask = FuelGaugeMask
	
	local FuelLabel = nil
	
	FuelLabel = LUI.UIText.new()
	FuelLabel.id = "FuelLabel"
	FuelLabel:setText( ToUpperCase( Engine.Localize( "JACKAL_BOOSTER_FUEL" ) ), 0 )
	FuelLabel:SetFontSize( 16 * _1080p )
	FuelLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FuelLabel:SetAlignment( LUI.Alignment.Left )
	FuelLabel:SetOptOutRightToLeftAlignmentFlip( true )
	FuelLabel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 107, _1080p * 345, _1080p * -200, _1080p * -184 )
	self:addElement( FuelLabel )
	self.FuelLabel = FuelLabel
	
	local FuelPercent = nil
	
	FuelPercent = LUI.UIText.new()
	FuelPercent.id = "FuelPercent"
	FuelPercent:setText( "50", 0 )
	FuelPercent:SetFontSize( 38 * _1080p )
	FuelPercent:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FuelPercent:SetAlignment( LUI.Alignment.Right )
	FuelPercent:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 92, _1080p * 143, _1080p * 190, _1080p * 228 )
	self:addElement( FuelPercent )
	self.FuelPercent = FuelPercent
	
	local FuelPercentSymbol = nil
	
	FuelPercentSymbol = LUI.UIText.new()
	FuelPercentSymbol.id = "FuelPercentSymbol"
	FuelPercentSymbol:setText( "%", 0 )
	FuelPercentSymbol:SetFontSize( 38 * _1080p )
	FuelPercentSymbol:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FuelPercentSymbol:SetAlignment( LUI.Alignment.Left )
	FuelPercentSymbol:SetOptOutRightToLeftAlignmentFlip( true )
	FuelPercentSymbol:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 143, _1080p * 284, _1080p * 190, _1080p * 228 )
	self:addElement( FuelPercentSymbol )
	self.FuelPercentSymbol = FuelPercentSymbol
	
	local AltitudeReadOut = nil
	
	AltitudeReadOut = MenuBuilder.BuildRegisteredType( "JackalLaunchOverlayAltitude", {
		controllerIndex = f3_local1
	} )
	AltitudeReadOut.id = "AltitudeReadOut"
	AltitudeReadOut:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 177, _1080p * 327, _1080p * -32.5, _1080p * 32.5 )
	self:addElement( AltitudeReadOut )
	self.AltitudeReadOut = AltitudeReadOut
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FuelGaugeFill:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.FuelGaugeFill:SetAnchors( 0, 1, 0.5, 0.5, 0 )
				end,
				function ()
					return self.FuelGaugeFill:SetAnchors( 0, 1, 0.5, 0.5, 2000 )
				end,
				function ()
					return self.FuelGaugeFill:SetAnchors( 0, 1, 0.5, 0.5, 1000 )
				end,
				function ()
					return self.FuelGaugeFill:SetAnchors( 0, 1, 0.5, 0.5, 2000 )
				end
			},
			{
				function ()
					return self.FuelGaugeFill:SetLeft( _1080p * 119, 0 )
				end,
				function ()
					return self.FuelGaugeFill:SetLeft( _1080p * 119, 2000 )
				end,
				function ()
					return self.FuelGaugeFill:SetLeft( _1080p * 120, 1000 )
				end,
				function ()
					return self.FuelGaugeFill:SetLeft( _1080p * 119, 2000 )
				end
			},
			{
				function ()
					return self.FuelGaugeFill:SetRight( _1080p * 183, 0 )
				end,
				function ()
					return self.FuelGaugeFill:SetRight( _1080p * 183, 2000 )
				end,
				function ()
					return self.FuelGaugeFill:SetRight( _1080p * 183, 1000 )
				end,
				function ()
					return self.FuelGaugeFill:SetRight( _1080p * 182, 2000 )
				end
			}
		} )
		self._sequences.Animate = function ()
			FuelGaugeFill:AnimateLoop( "Animate" )
		end
		
		FuelGaugeShadow:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.FuelGaugeShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		FuelGaugeRedBars:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.FuelGaugeRedBars:SetAlpha( 0, 0 )
				end
			}
		} )
		FuelGaugeFill:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.FuelGaugeFill:SetAlpha( 0, 0 )
				end
			}
		} )
		FuelGaugeMask:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.FuelGaugeMask:SetAlpha( 0, 0 )
				end
			}
		} )
		FuelLabel:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.FuelLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		FuelPercent:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.FuelPercent:SetAlpha( 0, 0 )
				end
			}
		} )
		FuelPercentSymbol:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.FuelPercentSymbol:SetAlpha( 0, 0 )
				end
			}
		} )
		AltitudeReadOut:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.AltitudeReadOut:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			FuelGaugeShadow:AnimateSequence( "Default" )
			FuelGaugeRedBars:AnimateSequence( "Default" )
			FuelGaugeFill:AnimateSequence( "Default" )
			FuelGaugeMask:AnimateSequence( "Default" )
			FuelLabel:AnimateSequence( "Default" )
			FuelPercent:AnimateSequence( "Default" )
			FuelPercentSymbol:AnimateSequence( "Default" )
			AltitudeReadOut:AnimateSequence( "Default" )
		end
		
		FuelGaugeShadow:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.FuelGaugeShadow:SetAlpha( 1, 100 )
				end
			}
		} )
		FuelGaugeRedBars:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.FuelGaugeRedBars:SetAlpha( 0.8, 100 )
				end
			}
		} )
		FuelGaugeFill:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.FuelGaugeFill:SetAlpha( 0.95, 100 )
				end
			}
		} )
		FuelGaugeMask:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.FuelGaugeMask:SetAlpha( 1, 100 )
				end
			}
		} )
		FuelLabel:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.FuelLabel:SetAlpha( 0.6, 100 )
				end
			}
		} )
		FuelPercent:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.FuelPercent:SetAlpha( 0.6, 100 )
				end
			}
		} )
		FuelPercentSymbol:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.FuelPercentSymbol:SetAlpha( 0.6, 100 )
				end
			}
		} )
		AltitudeReadOut:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.AltitudeReadOut:SetAlpha( 0.6, 100 )
				end
			}
		} )
		self._sequences.Show = function ()
			FuelGaugeShadow:AnimateSequence( "Show" )
			FuelGaugeRedBars:AnimateSequence( "Show" )
			FuelGaugeFill:AnimateSequence( "Show" )
			FuelGaugeMask:AnimateSequence( "Show" )
			FuelLabel:AnimateSequence( "Show" )
			FuelPercent:AnimateSequence( "Show" )
			FuelPercentSymbol:AnimateSequence( "Show" )
			AltitudeReadOut:AnimateSequence( "Show" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalLaunchOverlayFuelGauge", JackalLaunchOverlayFuelGauge )
LockTable( _M )
