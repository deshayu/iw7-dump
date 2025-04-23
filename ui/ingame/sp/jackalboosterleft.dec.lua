local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.Highlight
	if f1_local1 then
		f1_local1 = f1_arg0.BackgroundGlow
		if f1_local1 then
			f1_local1 = f1_arg0.LabelText
			if f1_local1 then
				f1_local1 = f1_arg0.StaticChevrons and f1_arg0.Node
			end
		end
	end
	f1_local0( f1_local1, "WARNING: Booster specific items are missing..." )
	f1_local0 = FONTS.GetFont( FONTS.MainMedium.File )
	f1_local1 = 20 * _1080p
	f1_arg0.Highlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.BackgroundGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.LineBottom:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.LineTop:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.TechyDigitsText:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.DamageText:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.PercentageText:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.LabelText:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.Node:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local2 = function ( f2_arg0 )
		local f2_local0, f2_local1, f2_local2, f2_local3 = GetTextDimensions( f2_arg0, f1_local0, f1_local1 )
		local f2_local4 = f2_local2 - f2_local0
		local f2_local5 = 10 * _1080p
		local f2_local6 = 10 * _1080p
		local f2_local7 = (f2_local4 + f2_local5) * -1
		f1_arg0.LabelText:SetLeft( f2_local7, 0 )
		f1_arg0.Node:SetLeft( f2_local7 - f2_local6, 100 )
		f1_arg0.Node:SetRight( f2_local7, 100 )
	end
	
	local f1_local3 = DataSources.inGame.jackal.boosterState:GetModel( f1_arg1 )
	f1_arg0:SubscribeToModel( f1_local3, function ()
		local f3_local0 = DataModel.GetModelValue( f1_local3 )
		local f3_local1, f3_local2 = nil
		if f3_local0 == JackalBoosterStates.Ready then
			f3_local1 = ToUpperCase( Engine.Localize( "JACKAL_BOOSTERS_READY" ) )
			f3_local2 = "Idle"
		elseif f3_local0 == JackalBoosterStates.Priming then
			f3_local1 = ToUpperCase( Engine.Localize( "JACKAL_BOOSTERS_PRIMING" ) )
			f3_local2 = "Priming"
		elseif f3_local0 == JackalBoosterStates.Primed then
			f3_local1 = ToUpperCase( Engine.Localize( "JACKAL_BOOSTERS_PRIMED" ) )
			f3_local2 = "Primed"
		end
		if f3_local1 ~= nil then
			f1_local2( f3_local1 )
			f1_arg0.LabelText:setText( f3_local1 )
		end
		if f3_local2 ~= nil then
			ACTIONS.AnimateSequence( f1_arg0, f3_local2 )
		end
	end )
	local f1_local4 = DataSources.inGame.jackal.boosterCharge:GetModel( f1_arg1 )
	f1_arg0:SubscribeToModel( f1_local4, function ()
		local f4_local0 = 27
		if DataModel.GetModelValue( f1_local3 ) == JackalBoosterStates.Priming then
			local f4_local1 = math.floor( DataModel.GetModelValue( f1_local4 ) * f4_local0 ) / f4_local0
			f1_arg0.StaticChevrons:SetUMax( f4_local1 )
			f1_arg0.StaticChevrons:SetRightAnchor( 1 - f4_local1 )
		end
	end )
	local f1_local5 = DataSources.inGame.jackal.atmoLaunch:GetModel( f1_arg1 )
	f1_arg0:SubscribeToModel( f1_local5, function ()
		if DataModel.GetModelValue( f1_local5 ) then
			local f5_local0 = ToUpperCase( Engine.Localize( "JACKAL_BOOSTERS_ENGAGED" ) )
			f1_local2( f5_local0 )
			f1_arg0.LabelText:setText( f5_local0 )
			ACTIONS.AnimateSequence( f1_arg0, "Engaged" )
		end
	end )
end

function JackalBoosterLeft( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 75 * _1080p )
	self.id = "JackalBoosterLeft"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local BackgroundGlow = nil
	
	BackgroundGlow = LUI.UIImage.new()
	BackgroundGlow.id = "BackgroundGlow"
	BackgroundGlow:SetRGBFromTable( SWATCHES.jackal.hightlight, 0 )
	BackgroundGlow:SetAlpha( 0.1, 0 )
	BackgroundGlow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	BackgroundGlow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -200, _1080p * 200, _1080p * -15, _1080p * 30 )
	self:addElement( BackgroundGlow )
	self.BackgroundGlow = BackgroundGlow
	
	local Chevrons = nil
	
	Chevrons = MenuBuilder.BuildRegisteredType( "JackalBoosterChevronsLeft", {
		controllerIndex = f6_local1
	} )
	Chevrons.id = "Chevrons"
	Chevrons:SetRGBFromTable( SWATCHES.jackal.boosterEngaged, 0 )
	Chevrons:SetAlpha( 0.75, 0 )
	Chevrons:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -46, _1080p * -14 )
	self:addElement( Chevrons )
	self.Chevrons = Chevrons
	
	local StaticChevrons = nil
	
	StaticChevrons = LUI.UIImage.new()
	StaticChevrons.id = "StaticChevrons"
	StaticChevrons:SetRGBFromTable( SWATCHES.jackal.boosterEngaged, 0 )
	StaticChevrons:SetAlpha( 0, 0 )
	StaticChevrons:setImage( RegisterMaterial( "hud_jackal_chevron_strip" ), 0 )
	StaticChevrons:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -46, _1080p * -14 )
	self:addElement( StaticChevrons )
	self.StaticChevrons = StaticChevrons
	
	local Highlight = nil
	
	Highlight = MenuBuilder.BuildRegisteredType( "JackalBoosterHighlightLeft", {
		controllerIndex = f6_local1
	} )
	Highlight.id = "Highlight"
	Highlight:SetRGBFromTable( SWATCHES.jackal.boosterEngaged, 0 )
	Highlight:SetAlpha( 0.07, 0 )
	Highlight:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -50, _1080p * -9 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	local LineBottom = nil
	
	LineBottom = LUI.UIImage.new()
	LineBottom.id = "LineBottom"
	LineBottom:SetRGBFromTable( SWATCHES.jackal.boosterStable, 0 )
	LineBottom:SetAlpha( 0.4, 0 )
	LineBottom:setImage( RegisterMaterial( "hud_jackal_dashed_line" ), 0 )
	LineBottom:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -16, 0 )
	self:addElement( LineBottom )
	self.LineBottom = LineBottom
	
	local LineTop = nil
	
	LineTop = LUI.UIImage.new()
	LineTop.id = "LineTop"
	LineTop:SetRGBFromTable( SWATCHES.jackal.boosterStable, 0 )
	LineTop:SetAlpha( 0.4, 0 )
	LineTop:setImage( RegisterMaterial( "hud_jackal_dashed_line" ), 0 )
	LineTop:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -58, _1080p * -42 )
	self:addElement( LineTop )
	self.LineTop = LineTop
	
	local TechyDigitsText = nil
	
	TechyDigitsText = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 6,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f6_local1
	} )
	TechyDigitsText.id = "TechyDigitsText"
	TechyDigitsText:SetRGBFromTable( SWATCHES.jackal.boosterText, 0 )
	TechyDigitsText:SetAlpha( 0.4, 0 )
	TechyDigitsText:SetFontSize( 20 * _1080p )
	TechyDigitsText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TechyDigitsText:SetAlignment( LUI.Alignment.Left )
	TechyDigitsText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 125, 0, _1080p * 20 )
	self:addElement( TechyDigitsText )
	self.TechyDigitsText = TechyDigitsText
	
	local DamageText = nil
	
	DamageText = LUI.UIText.new()
	DamageText.id = "DamageText"
	DamageText:SetRGBFromTable( SWATCHES.jackal.boosterWarning, 0 )
	DamageText:SetAlpha( 0, 0 )
	DamageText:setText( ToUpperCase( Engine.Localize( "JACKAL_DAMAGED" ) ), 0 )
	DamageText:SetFontSize( 22 * _1080p )
	DamageText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DamageText:SetAlignment( LUI.Alignment.Left )
	DamageText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 125, 0, _1080p * 22 )
	self:addElement( DamageText )
	self.DamageText = DamageText
	
	local PercentageText = nil
	
	PercentageText = LUI.UIText.new()
	PercentageText.id = "PercentageText"
	PercentageText:SetRGBFromTable( SWATCHES.jackal.boosterText, 0 )
	PercentageText:SetAlpha( 0, 0 )
	PercentageText:SetFontSize( 22 * _1080p )
	PercentageText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PercentageText:SetAlignment( LUI.Alignment.Left )
	PercentageText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 125, 0, _1080p * 22 )
	PercentageText:SubscribeToModel( DataSources.inGame.jackal.boosterCharge:GetModel( f6_local1 ), function ()
		local f7_local0 = DataSources.inGame.jackal.boosterCharge:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			PercentageText:setText( f7_local0, 0 )
		end
	end )
	self:addElement( PercentageText )
	self.PercentageText = PercentageText
	
	local LabelText = nil
	
	LabelText = LUI.UIText.new()
	LabelText.id = "LabelText"
	LabelText:SetRGBFromTable( SWATCHES.jackal.boosterHeader, 0 )
	LabelText:SetAlpha( 0.5, 0 )
	LabelText:setText( ToUpperCase( Engine.Localize( "JACKAL_BOOSTERS_READY" ) ), 0 )
	LabelText:SetFontSize( 22 * _1080p )
	LabelText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LabelText:SetAlignment( LUI.Alignment.Right )
	LabelText:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -144, 0, 0, _1080p * 22 )
	self:addElement( LabelText )
	self.LabelText = LabelText
	
	local Node = nil
	
	Node = LUI.UIImage.new()
	Node.id = "Node"
	Node:SetRGBFromTable( SWATCHES.jackal.boosterEngaged, 0 )
	Node:SetAlpha( 0.75, 0 )
	Node:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Node:SetUseAA( true )
	Node:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -154, _1080p * -144, _1080p * 5, _1080p * 15 )
	self:addElement( Node )
	self.Node = Node
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BackgroundGlow:RegisterAnimationSequence( "Engaged", {
			{
				function ()
					return self.BackgroundGlow:SetAlpha( 0.1, 0 )
				end
			},
			{
				function ()
					return self.BackgroundGlow:SetRGBFromTable( SWATCHES.jackal.hightlight, 0 )
				end
			}
		} )
		Chevrons:RegisterAnimationSequence( "Engaged", {
			{
				function ()
					return self.Chevrons:SetAlpha( 0.75, 0 )
				end
			},
			{
				function ()
					return self.Chevrons:SetRGBFromTable( SWATCHES.jackal.boosterEngaged, 0 )
				end
			}
		} )
		StaticChevrons:RegisterAnimationSequence( "Engaged", {
			{
				function ()
					return self.StaticChevrons:SetAlpha( 0, 0 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "Engaged", {
			{
				function ()
					return self.Highlight:SetAlpha( 0.07, 0 )
				end
			}
		} )
		LineBottom:RegisterAnimationSequence( "Engaged", {
			{
				function ()
					return self.LineBottom:SetAlpha( 0.4, 0 )
				end
			}
		} )
		LineTop:RegisterAnimationSequence( "Engaged", {
			{
				function ()
					return self.LineTop:SetAlpha( 0.4, 0 )
				end
			}
		} )
		TechyDigitsText:RegisterAnimationSequence( "Engaged", {
			{
				function ()
					return self.TechyDigitsText:SetAlpha( 0.4, 0 )
				end
			}
		} )
		DamageText:RegisterAnimationSequence( "Engaged", {
			{
				function ()
					return self.DamageText:SetAlpha( 0, 0 )
				end
			}
		} )
		PercentageText:RegisterAnimationSequence( "Engaged", {
			{
				function ()
					return self.PercentageText:SetAlpha( 0, 0 )
				end
			}
		} )
		LabelText:RegisterAnimationSequence( "Engaged", {
			{
				function ()
					return self.LabelText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Node:RegisterAnimationSequence( "Engaged", {
			{
				function ()
					return self.Node:SetAlpha( 0.75, 0 )
				end
			}
		} )
		self._sequences.Engaged = function ()
			BackgroundGlow:AnimateSequence( "Engaged" )
			Chevrons:AnimateSequence( "Engaged" )
			StaticChevrons:AnimateSequence( "Engaged" )
			Highlight:AnimateSequence( "Engaged" )
			LineBottom:AnimateSequence( "Engaged" )
			LineTop:AnimateSequence( "Engaged" )
			TechyDigitsText:AnimateSequence( "Engaged" )
			DamageText:AnimateSequence( "Engaged" )
			PercentageText:AnimateSequence( "Engaged" )
			LabelText:AnimateSequence( "Engaged" )
			Node:AnimateSequence( "Engaged" )
		end
		
		BackgroundGlow:RegisterAnimationSequence( "Damaged", {
			{
				function ()
					return self.BackgroundGlow:SetRGBFromTable( SWATCHES.jackal.boosterWarning, 0 )
				end
			}
		} )
		Chevrons:RegisterAnimationSequence( "Damaged", {
			{
				function ()
					return self.Chevrons:SetRGBFromTable( SWATCHES.jackal.boosterWarning, 0 )
				end
			},
			{
				function ()
					return self.Chevrons:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.Chevrons:SetAlpha( 0.1, 100 )
				end,
				function ()
					return self.Chevrons:SetAlpha( 0.75, 100 )
				end
			}
		} )
		StaticChevrons:RegisterAnimationSequence( "Damaged", {
			{
				function ()
					return self.StaticChevrons:SetAlpha( 0, 0 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "Damaged", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		LineBottom:RegisterAnimationSequence( "Damaged", {
			{
				function ()
					return self.LineBottom:SetRGBFromTable( SWATCHES.jackal.boosterWarning, 0 )
				end
			}
		} )
		LineTop:RegisterAnimationSequence( "Damaged", {
			{
				function ()
					return self.LineTop:SetRGBFromTable( SWATCHES.jackal.boosterWarning, 0 )
				end
			}
		} )
		TechyDigitsText:RegisterAnimationSequence( "Damaged", {
			{
				function ()
					return self.TechyDigitsText:SetAlpha( 0, 0 )
				end
			}
		} )
		DamageText:RegisterAnimationSequence( "Damaged", {
			{
				function ()
					return self.DamageText:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.DamageText:SetAlpha( 0.1, 100 )
				end,
				function ()
					return self.DamageText:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.DamageText:SetRGBFromTable( SWATCHES.jackal.boosterWarning, 0 )
				end
			}
		} )
		PercentageText:RegisterAnimationSequence( "Damaged", {
			{
				function ()
					return self.PercentageText:SetAlpha( 0, 0 )
				end
			}
		} )
		LabelText:RegisterAnimationSequence( "Damaged", {
			{
				function ()
					return self.LabelText:SetAlpha( 0, 0 )
				end
			}
		} )
		Node:RegisterAnimationSequence( "Damaged", {
			{
				function ()
					return self.Node:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Damaged = function ()
			BackgroundGlow:AnimateLoop( "Damaged" )
			Chevrons:AnimateLoop( "Damaged" )
			StaticChevrons:AnimateLoop( "Damaged" )
			Highlight:AnimateLoop( "Damaged" )
			LineBottom:AnimateLoop( "Damaged" )
			LineTop:AnimateLoop( "Damaged" )
			TechyDigitsText:AnimateLoop( "Damaged" )
			DamageText:AnimateLoop( "Damaged" )
			PercentageText:AnimateLoop( "Damaged" )
			LabelText:AnimateLoop( "Damaged" )
			Node:AnimateLoop( "Damaged" )
		end
		
		BackgroundGlow:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.BackgroundGlow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.BackgroundGlow:SetRGBFromTable( SWATCHES.jackal.hightlight, 0 )
				end
			}
		} )
		Chevrons:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Chevrons:SetAlpha( 0, 0 )
				end
			}
		} )
		StaticChevrons:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.StaticChevrons:SetAlpha( 0, 0 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		LineBottom:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.LineBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		LineTop:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.LineTop:SetAlpha( 0.4, 0 )
				end
			}
		} )
		TechyDigitsText:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.TechyDigitsText:SetAlpha( 0, 0 )
				end
			}
		} )
		DamageText:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.DamageText:SetAlpha( 0, 0 )
				end
			}
		} )
		PercentageText:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.PercentageText:SetAlpha( 0, 0 )
				end
			}
		} )
		LabelText:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.LabelText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Node:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Node:SetAlpha( 0.75, 0 )
				end
			}
		} )
		self._sequences.Idle = function ()
			BackgroundGlow:AnimateSequence( "Idle" )
			Chevrons:AnimateSequence( "Idle" )
			StaticChevrons:AnimateSequence( "Idle" )
			Highlight:AnimateSequence( "Idle" )
			LineBottom:AnimateSequence( "Idle" )
			LineTop:AnimateSequence( "Idle" )
			TechyDigitsText:AnimateSequence( "Idle" )
			DamageText:AnimateSequence( "Idle" )
			PercentageText:AnimateSequence( "Idle" )
			LabelText:AnimateSequence( "Idle" )
			Node:AnimateSequence( "Idle" )
		end
		
		BackgroundGlow:RegisterAnimationSequence( "Priming", {
			{
				function ()
					return self.BackgroundGlow:SetAlpha( 0, 100 )
				end,
				function ()
					return self.BackgroundGlow:SetAlpha( 0.1, 200 )
				end
			}
		} )
		Chevrons:RegisterAnimationSequence( "Priming", {
			{
				function ()
					return self.Chevrons:SetAlpha( 0, 0 )
				end
			}
		} )
		StaticChevrons:RegisterAnimationSequence( "Priming", {
			{
				function ()
					return self.StaticChevrons:SetAlpha( 0, 100 )
				end,
				function ()
					return self.StaticChevrons:SetAlpha( 0.75, 200 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "Priming", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		LineBottom:RegisterAnimationSequence( "Priming", {
			{
				function ()
					return self.LineBottom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LineBottom:SetAlpha( 0.4, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.LineBottom:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -58, _1080p * -42, 0 )
				end,
				function ()
					return self.LineBottom:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -16, 0, 300, LUI.EASING.outBack )
				end
			}
		} )
		TechyDigitsText:RegisterAnimationSequence( "Priming", {
			{
				function ()
					return self.TechyDigitsText:SetAlpha( 0, 0 )
				end
			}
		} )
		DamageText:RegisterAnimationSequence( "Priming", {
			{
				function ()
					return self.DamageText:SetAlpha( 0, 0 )
				end
			}
		} )
		PercentageText:RegisterAnimationSequence( "Priming", {
			{
				function ()
					return self.PercentageText:SetAlpha( 0.4, 0 )
				end
			}
		} )
		LabelText:RegisterAnimationSequence( "Priming", {
			{
				function ()
					return self.LabelText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Priming = function ()
			BackgroundGlow:AnimateSequence( "Priming" )
			Chevrons:AnimateSequence( "Priming" )
			StaticChevrons:AnimateSequence( "Priming" )
			Highlight:AnimateSequence( "Priming" )
			LineBottom:AnimateSequence( "Priming" )
			TechyDigitsText:AnimateSequence( "Priming" )
			DamageText:AnimateSequence( "Priming" )
			PercentageText:AnimateSequence( "Priming" )
			LabelText:AnimateSequence( "Priming" )
		end
		
		BackgroundGlow:RegisterAnimationSequence( "Primed", {
			{
				function ()
					return self.BackgroundGlow:SetAlpha( 0.1, 0 )
				end
			}
		} )
		Chevrons:RegisterAnimationSequence( "Primed", {
			{
				function ()
					return self.Chevrons:SetAlpha( 0, 0 )
				end
			}
		} )
		StaticChevrons:RegisterAnimationSequence( "Primed", {
			{
				function ()
					return self.StaticChevrons:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.StaticChevrons:SetAlpha( 0.25, 100 )
				end,
				function ()
					return self.StaticChevrons:SetAlpha( 0.75, 100 )
				end
			},
			{
				function ()
					return self.StaticChevrons:SetRGBFromTable( SWATCHES.jackal.boosterEngaged, 0 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "Primed", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		TechyDigitsText:RegisterAnimationSequence( "Primed", {
			{
				function ()
					return self.TechyDigitsText:SetAlpha( 0.4, 0 )
				end
			}
		} )
		DamageText:RegisterAnimationSequence( "Primed", {
			{
				function ()
					return self.DamageText:SetAlpha( 0, 0 )
				end
			}
		} )
		PercentageText:RegisterAnimationSequence( "Primed", {
			{
				function ()
					return self.PercentageText:SetAlpha( 0, 0 )
				end
			}
		} )
		LabelText:RegisterAnimationSequence( "Primed", {
			{
				function ()
					return self.LabelText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Primed = function ()
			BackgroundGlow:AnimateLoop( "Primed" )
			Chevrons:AnimateLoop( "Primed" )
			StaticChevrons:AnimateLoop( "Primed" )
			Highlight:AnimateLoop( "Primed" )
			TechyDigitsText:AnimateLoop( "Primed" )
			DamageText:AnimateLoop( "Primed" )
			PercentageText:AnimateLoop( "Primed" )
			LabelText:AnimateLoop( "Primed" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f6_local1, controller )
	ACTIONS.AnimateSequence( self, "Idle" )
	return self
end

MenuBuilder.registerType( "JackalBoosterLeft", JackalBoosterLeft )
LockTable( _M )
