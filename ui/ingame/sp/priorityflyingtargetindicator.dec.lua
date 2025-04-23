local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PriorityFlyingTargetIndicator( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "PriorityFlyingTargetIndicator"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Indicator = nil
	
	Indicator = MenuBuilder.BuildRegisteredType( "JackalOffscreenIndicator", {
		controllerIndex = f1_local1
	} )
	Indicator.id = "Indicator"
	Indicator:SetAlpha( 0, 0 )
	Indicator:SetScale( -0.7, 0 )
	Indicator.ArrowLg:SetRGBFromTable( SWATCHES.jackal.target, 0 )
	Indicator.ArrowInit:SetRGBFromTable( SWATCHES.jackal.target, 0 )
	Indicator:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -44, _1080p * 44 )
	self:addElement( Indicator )
	self.Indicator = Indicator
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Indicator:RegisterAnimationSequence( "onscreen", {
			{
				function ()
					return self.Indicator:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.onscreen = function ()
			Indicator:AnimateSequence( "onscreen" )
		end
		
		Indicator:RegisterAnimationSequence( "offscreen", {
			{
				function ()
					return self.Indicator:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.offscreen = function ()
			Indicator:AnimateSequence( "offscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "anchor_on_screen", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "onscreen" )
	end )
	self:addEventHandler( "anchor_off_screen", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "offscreen" )
	end )
	return self
end

MenuBuilder.registerType( "PriorityFlyingTargetIndicator", PriorityFlyingTargetIndicator )
LockTable( _M )
