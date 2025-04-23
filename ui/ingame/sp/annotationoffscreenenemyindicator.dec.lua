local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AnnotationOffscreenEnemyIndicator( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "AnnotationOffscreenEnemyIndicator"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Indicator = nil
	
	Indicator = MenuBuilder.BuildRegisteredType( "JackalOffscreenIndicatorUrgent", {
		controllerIndex = f1_local1
	} )
	Indicator.id = "Indicator"
	Indicator:SetAlpha( 0, 0 )
	Indicator:SetScale( -0.5, 0 )
	Indicator:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( Indicator )
	self.Indicator = Indicator
	
	local warning = nil
	
	warning = LUI.UIImage.new()
	warning.id = "warning"
	warning:SetAlpha( 0, 0 )
	warning:setImage( RegisterMaterial( "hud_jackal_incoming_missile" ), 0 )
	warning:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -11, _1080p * 11, _1080p * -11, _1080p * 11 )
	self:addElement( warning )
	self.warning = warning
	
	local arrowMed = nil
	
	arrowMed = LUI.UIImage.new()
	arrowMed.id = "arrowMed"
	arrowMed:SetRGBFromTable( SWATCHES.jackal.target, 0 )
	arrowMed:SetAlpha( 0, 0 )
	arrowMed:SetScale( 0.5, 0 )
	arrowMed:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_sm" ), 0 )
	arrowMed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -24, _1080p * -10 )
	self:addElement( arrowMed )
	self.arrowMed = arrowMed
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Indicator:RegisterAnimationSequence( "OffScreen", {
			{
				function ()
					return self.Indicator:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Indicator:SetAlpha( 0.75, 260 )
				end,
				function ()
					return self.Indicator:SetAlpha( 1, 260 )
				end
			},
			{
				function ()
					return self.Indicator:SetScale( 0, 0 )
				end
			}
		} )
		warning:RegisterAnimationSequence( "OffScreen", {
			{
				function ()
					return self.warning:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.warning:SetRGBFromTable( SWATCHES.jackal.target, 130 )
				end,
				function ()
					return self.warning:SetRGBFromInt( 16777215, 130 )
				end,
				function ()
					return self.warning:SetRGBFromTable( SWATCHES.jackal.target, 130 )
				end,
				function ()
					return self.warning:SetRGBFromInt( 16777215, 130 )
				end
			},
			{
				function ()
					return self.warning:SetAlpha( 1, 0 )
				end,
				function ()
					return self.warning:SetAlpha( 1, 130 )
				end,
				function ()
					return self.warning:SetAlpha( 0.75, 130 )
				end
			},
			{
				function ()
					return self.warning:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -11, _1080p * 11, _1080p * -11, _1080p * 11, 0 )
				end
			}
		} )
		arrowMed:RegisterAnimationSequence( "OffScreen", {
			{
				function ()
					return self.arrowMed:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.arrowMed:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_ax_med" ), 0 )
				end
			}
		} )
		self._sequences.OffScreen = function ()
			Indicator:AnimateLoop( "OffScreen" )
			warning:AnimateLoop( "OffScreen" )
			arrowMed:AnimateLoop( "OffScreen" )
		end
		
		Indicator:RegisterAnimationSequence( "OnScreen", {
			{
				function ()
					return self.Indicator:SetAlpha( 0, 0 )
				end
			}
		} )
		warning:RegisterAnimationSequence( "OnScreen", {
			{
				function ()
					return self.warning:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.warning:SetRGBFromTable( SWATCHES.jackal.target, 130 )
				end,
				function ()
					return self.warning:SetRGBFromInt( 16777215, 130 )
				end,
				function ()
					return self.warning:SetRGBFromTable( SWATCHES.jackal.target, 130 )
				end,
				function ()
					return self.warning:SetRGBFromInt( 16777215, 130 )
				end
			},
			{
				function ()
					return self.warning:SetAlpha( 0.75, 0 )
				end
			},
			{
				function ()
					return self.warning:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -38, _1080p * -19, 0 )
				end
			}
		} )
		arrowMed:RegisterAnimationSequence( "OnScreen", {
			{
				function ()
					return self.arrowMed:SetAlpha( 0.85, 0 )
				end,
				function ()
					return self.arrowMed:SetAlpha( 0.6, 260 )
				end,
				function ()
					return self.arrowMed:SetAlpha( 0.85, 260 )
				end
			},
			{
				function ()
					return self.arrowMed:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.arrowMed:SetScale( 0.62, 0 )
				end
			},
			{
				function ()
					return self.arrowMed:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_ax_med" ), 0 )
				end
			}
		} )
		self._sequences.OnScreen = function ()
			Indicator:AnimateLoop( "OnScreen" )
			warning:AnimateLoop( "OnScreen" )
			arrowMed:AnimateLoop( "OnScreen" )
		end
		
		warning:RegisterAnimationSequence( "init", {
			{
				function ()
					return self.warning:SetScale( 0, 0 )
				end,
				function ()
					return self.warning:SetScale( 0.75, 130 )
				end,
				function ()
					return self.warning:SetScale( 0, 130 )
				end
			}
		} )
		self._sequences.init = function ()
			warning:AnimateSequence( "init" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "anchor_on_screen", function ( f39_arg0, f39_arg1 )
		local f39_local0 = f39_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "OnScreen" )
	end )
	self:addEventHandler( "anchor_off_screen", function ( f40_arg0, f40_arg1 )
		local f40_local0 = f40_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "OffScreen" )
	end )
	self:addEventHandler( "pooled_on_allocate", function ( f41_arg0, f41_arg1 )
		local f41_local0 = f41_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "init" )
	end )
	return self
end

MenuBuilder.registerType( "AnnotationOffscreenEnemyIndicator", AnnotationOffscreenEnemyIndicator )
LockTable( _M )
