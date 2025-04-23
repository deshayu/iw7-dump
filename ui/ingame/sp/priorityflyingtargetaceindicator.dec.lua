local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PriorityFlyingTargetAceIndicator( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "PriorityFlyingTargetAceIndicator"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Caret = nil
	
	Caret = LUI.UIImage.new()
	Caret.id = "Caret"
	Caret:SetAlpha( 0, 0 )
	Caret:SetScale( -0.5, 0 )
	Caret:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_sm" ), 0 )
	Caret:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -12, _1080p * -12 )
	self:addElement( Caret )
	self.Caret = Caret
	
	local diamond = nil
	
	diamond = LUI.UIImage.new()
	diamond.id = "diamond"
	diamond:SetAlpha( 0, 0 )
	diamond:SetScale( -0.65, 0 )
	diamond:setImage( RegisterMaterial( "hud_jackal_callout_node" ), 0 )
	diamond:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -16, _1080p * -16 )
	self:addElement( diamond )
	self.diamond = diamond
	
	local Indicator = nil
	
	Indicator = MenuBuilder.BuildRegisteredType( "JackalAceOffscreenIndicator", {
		controllerIndex = f1_local1
	} )
	Indicator.id = "Indicator"
	Indicator:SetAlpha( 0, 0 )
	Indicator:SetScale( -0.7, 0 )
	Indicator.ArrowLg:SetRGBFromTable( SWATCHES.jackal.target, 0 )
	Indicator:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -44, _1080p * 44 )
	self:addElement( Indicator )
	self.Indicator = Indicator
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Caret:RegisterAnimationSequence( "onscreen", {
			{
				function ()
					return self.Caret:SetAlpha( 0.85, 0 )
				end
			},
			{
				function ()
					return self.Caret:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_ax_sm" ), 0 )
				end
			},
			{
				function ()
					return self.Caret:SetScale( -0.21, 0 )
				end
			}
		} )
		diamond:RegisterAnimationSequence( "onscreen", {
			{
				function ()
					return self.diamond:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.diamond:SetRGBFromTable( SWATCHES.jackal.caution, 400 )
				end,
				function ()
					return self.diamond:SetRGBFromInt( 16777215, 400 )
				end
			},
			{
				function ()
					return self.diamond:SetAlpha( 1, 0 )
				end
			}
		} )
		Indicator:RegisterAnimationSequence( "onscreen", {
			{
				function ()
					return self.Indicator:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.onscreen = function ()
			Caret:AnimateLoop( "onscreen" )
			diamond:AnimateLoop( "onscreen" )
			Indicator:AnimateLoop( "onscreen" )
		end
		
		Caret:RegisterAnimationSequence( "offscreen", {
			{
				function ()
					return self.Caret:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Caret:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		diamond:RegisterAnimationSequence( "offscreen", {
			{
				function ()
					return self.diamond:SetAlpha( 0, 0 )
				end
			}
		} )
		Indicator:RegisterAnimationSequence( "offscreen", {
			{
				function ()
					return self.Indicator:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Indicator.ArrowLg:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.offscreen = function ()
			Caret:AnimateSequence( "offscreen" )
			diamond:AnimateSequence( "offscreen" )
			Indicator:AnimateSequence( "offscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "anchor_on_screen", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "onscreen" )
	end )
	self:addEventHandler( "anchor_off_screen", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "offscreen" )
	end )
	return self
end

MenuBuilder.registerType( "PriorityFlyingTargetAceIndicator", PriorityFlyingTargetAceIndicator )
LockTable( _M )
