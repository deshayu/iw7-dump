local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0, f1_local1 = nil
	if Engine.IsMultiplayer() then
		f1_local0 = DataSources.inGame.player.inADS
		f1_arg0.TextLeft:setText( Engine.Localize( "JACKAL_MODE_GUNS" ) )
		f1_arg0.TextRight:setText( Engine.Localize( "JACKAL_MODE_MISSILES" ) )
		f1_local1 = function ( f2_arg0 )
			local f2_local0 = f1_local0:GetValue( f1_arg1 )
			local f2_local1 = ACTIONS.AnimateSequence
			local f2_local2 = f1_arg0
			local f2_local3
			if f2_local0 then
				f2_local3 = "rightMode"
				if not f2_local3 then
				
				else
					f2_local1( f2_local2, f2_local3 )
				end
			end
			f2_local3 = "leftMode"
		end
		
	else
		f1_local0 = DataSources.inGame.jackal.mode
		f1_local1 = function ( f3_arg0 )
			local f3_local0 = 2
			local f3_local1 = 1
			local f3_local2 = f1_local0:GetValue( f1_arg1 )
			if f3_local2 == f3_local0 then
				ACTIONS.AnimateSequence( f1_arg0, "rightMode" )
			elseif f3_local2 == f3_local1 then
				ACTIONS.AnimateSequence( f1_arg0, "leftMode" )
			else
				ACTIONS.AnimateSequence( f1_arg0, "noMode" )
			end
		end
		
	end
	if IsLanguageItalian() then
		f1_arg0.TextLeft:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -24, _1080p * 101, _1080p * -22, 0 )
	end
	f1_arg0.VertLineLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.TextLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.TextRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.Hightlight:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local1, true )
end

function JackalFlightStatusMode( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 207 * _1080p, 0, 27 * _1080p )
	self.id = "JackalFlightStatusMode"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Hightlight = nil
	
	Hightlight = LUI.UIImage.new()
	Hightlight.id = "Hightlight"
	Hightlight:SetRGBFromTable( SWATCHES.jackal.flightModeHighlight, 0 )
	Hightlight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -94, _1080p * -34, 0, _1080p * 5 )
	self:addElement( Hightlight )
	self.Hightlight = Hightlight
	
	local VertLineLeft = nil
	
	VertLineLeft = LUI.UIImage.new()
	VertLineLeft.id = "VertLineLeft"
	VertLineLeft:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	VertLineLeft:SetAlpha( 0.5, 0 )
	VertLineLeft:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -0.5, _1080p * 0.5, _1080p * -23, _1080p * -1 )
	self:addElement( VertLineLeft )
	self.VertLineLeft = VertLineLeft
	
	local TextLeft = nil
	
	TextLeft = LUI.UIText.new()
	TextLeft.id = "TextLeft"
	TextLeft:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	TextLeft:setText( ToUpperCase( Engine.Localize( "JACKAL_MODE_ASSAULT" ) ), 0 )
	TextLeft:SetFontSize( 22 * _1080p )
	TextLeft:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextLeft:SetAlignment( LUI.Alignment.Center )
	TextLeft:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -15, _1080p * 101, _1080p * -22, 0 )
	self:addElement( TextLeft )
	self.TextLeft = TextLeft
	
	local TextRight = nil
	
	TextRight = LUI.UIText.new()
	TextRight.id = "TextRight"
	TextRight:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	TextRight:setText( ToUpperCase( Engine.Localize( "JACKAL_MODE_STRIKE" ) ), 0 )
	TextRight:SetFontSize( 22 * _1080p )
	TextRight:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextRight:SetAlignment( LUI.Alignment.Center )
	TextRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -101, _1080p * 15, _1080p * -22, 0 )
	self:addElement( TextRight )
	self.TextRight = TextRight
	
	local HighlightGlow = nil
	
	HighlightGlow = LUI.UIImage.new()
	HighlightGlow.id = "HighlightGlow"
	HighlightGlow:SetRGBFromTable( SWATCHES.jackal.hightlight, 0 )
	HighlightGlow:SetAlpha( 0.6, 0 )
	HighlightGlow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	HighlightGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	HighlightGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -164, _1080p * 36, _1080p * -61, _1080p * 39 )
	self:addElement( HighlightGlow )
	self.HighlightGlow = HighlightGlow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Hightlight:RegisterAnimationSequence( "leftMode", {
			{
				function ()
					return self.Hightlight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.Hightlight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -92, _1080p * -32, 0, _1080p * 5, 0 )
				end
			}
		} )
		TextLeft:RegisterAnimationSequence( "leftMode", {
			{
				function ()
					return self.TextLeft:SetRGBFromTable( SWATCHES.jackal.normal, 0 )
				end
			},
			{
				function ()
					return self.TextLeft:SetAlpha( 1, 0 )
				end
			}
		} )
		TextRight:RegisterAnimationSequence( "leftMode", {
			{
				function ()
					return self.TextRight:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			},
			{
				function ()
					return self.TextRight:SetAlpha( 0.5, 0 )
				end
			}
		} )
		HighlightGlow:RegisterAnimationSequence( "leftMode", {
			{
				function ()
					return self.HighlightGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0.6, 50 )
				end
			},
			{
				function ()
					return self.HighlightGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -162, _1080p * 38, _1080p * -61, _1080p * 39, 0 )
				end
			}
		} )
		self._sequences.leftMode = function ()
			Hightlight:AnimateSequence( "leftMode" )
			TextLeft:AnimateSequence( "leftMode" )
			TextRight:AnimateSequence( "leftMode" )
			HighlightGlow:AnimateSequence( "leftMode" )
		end
		
		Hightlight:RegisterAnimationSequence( "rightMode", {
			{
				function ()
					return self.Hightlight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Hightlight:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.Hightlight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 29, _1080p * 89, 0, _1080p * 5, 0 )
				end
			}
		} )
		TextLeft:RegisterAnimationSequence( "rightMode", {
			{
				function ()
					return self.TextLeft:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			},
			{
				function ()
					return self.TextLeft:SetAlpha( 0.5, 0 )
				end
			}
		} )
		TextRight:RegisterAnimationSequence( "rightMode", {
			{
				function ()
					return self.TextRight:SetRGBFromTable( SWATCHES.jackal.normal, 0 )
				end
			},
			{
				function ()
					return self.TextRight:SetAlpha( 1, 0 )
				end
			}
		} )
		HighlightGlow:RegisterAnimationSequence( "rightMode", {
			{
				function ()
					return self.HighlightGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.HighlightGlow:SetAlpha( 0.6, 50 )
				end
			},
			{
				function ()
					return self.HighlightGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -41, _1080p * 159, _1080p * -61, _1080p * 39, 0 )
				end
			}
		} )
		self._sequences.rightMode = function ()
			Hightlight:AnimateSequence( "rightMode" )
			TextLeft:AnimateSequence( "rightMode" )
			TextRight:AnimateSequence( "rightMode" )
			HighlightGlow:AnimateSequence( "rightMode" )
		end
		
		Hightlight:RegisterAnimationSequence( "noMode", {
			{
				function ()
					return self.Hightlight:SetAlpha( 0, 0 )
				end
			}
		} )
		TextLeft:RegisterAnimationSequence( "noMode", {
			{
				function ()
					return self.TextLeft:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			},
			{
				function ()
					return self.TextLeft:SetAlpha( 0.5, 0 )
				end
			}
		} )
		TextRight:RegisterAnimationSequence( "noMode", {
			{
				function ()
					return self.TextRight:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			},
			{
				function ()
					return self.TextRight:SetAlpha( 0.5, 0 )
				end
			}
		} )
		HighlightGlow:RegisterAnimationSequence( "noMode", {
			{
				function ()
					return self.HighlightGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.noMode = function ()
			Hightlight:AnimateSequence( "noMode" )
			TextLeft:AnimateSequence( "noMode" )
			TextRight:AnimateSequence( "noMode" )
			HighlightGlow:AnimateSequence( "noMode" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.atmoLaunch:GetModel( f4_local1 ), function ()
		if DataSources.inGame.jackal.atmoLaunch:GetValue( f4_local1 ) ~= nil and DataSources.inGame.jackal.atmoLaunch:GetValue( f4_local1 ) == true then
			ACTIONS.AnimateSequence( self, "noMode" )
		end
	end )
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "rightMode" )
	return self
end

MenuBuilder.registerType( "JackalFlightStatusMode", JackalFlightStatusMode )
LockTable( _M )
