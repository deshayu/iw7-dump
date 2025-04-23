local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalOffscreenIndicatorUrgent( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "JackalOffscreenIndicatorUrgent"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Arrow = nil
	
	Arrow = LUI.UIImage.new()
	Arrow.id = "Arrow"
	Arrow:SetScale( -0.44, 0 )
	Arrow:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_ax" ), 0 )
	Arrow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -17, _1080p * 47 )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local init = nil
	
	init = LUI.UIImage.new()
	init.id = "init"
	init:SetAlpha( 0, 0 )
	init:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_ax" ), 0 )
	init:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -96, _1080p * -32 )
	self:addElement( init )
	self.init = init
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.Default = function ()
			
		end
		
		init:RegisterAnimationSequence( "initArrow", {
			{
				function ()
					return self.init:SetAlpha( 0, 0 )
				end,
				function ()
					return self.init:SetAlpha( 1, 100 )
				end,
				function ()
					return self.init:SetAlpha( 1, 70 )
				end,
				function ()
					return self.init:SetAlpha( 0, 30 )
				end,
				function ()
					return self.init:SetAlpha( 0, 10 )
				end,
				function ()
					return self.init:SetAlpha( 1, 90 )
				end,
				function ()
					return self.init:SetAlpha( 1, 70 )
				end,
				function ()
					return self.init:SetAlpha( 0, 30 )
				end,
				function ()
					return self.init:SetAlpha( 0, 10 )
				end,
				function ()
					return self.init:SetAlpha( 1, 90 )
				end,
				function ()
					return self.init:SetAlpha( 1, 70 )
				end,
				function ()
					return self.init:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.init:SetScale( -0.3, 0 )
				end,
				function ()
					return self.init:SetScale( -0.55, 200 )
				end,
				function ()
					return self.init:SetScale( -0.3, 10 )
				end,
				function ()
					return self.init:SetScale( -0.55, 190 )
				end,
				function ()
					return self.init:SetScale( -0.3, 10 )
				end,
				function ()
					return self.init:SetScale( -0.55, 190 )
				end
			},
			{
				function ()
					return self.init:SetRGBFromInt( 16712451, 0 )
				end,
				function ()
					return self.init:SetRGBFromTable( SWATCHES.jackal.target, 120 )
				end,
				function ()
					return self.init:SetRGBFromInt( 16777215, 80 )
				end,
				function ()
					return self.init:SetRGBFromInt( 16712451, 10 )
				end,
				function ()
					return self.init:SetRGBFromTable( SWATCHES.jackal.target, 110 )
				end,
				function ()
					return self.init:SetRGBFromInt( 16777215, 80 )
				end,
				function ()
					return self.init:SetRGBFromInt( 16712451, 10 )
				end,
				function ()
					return self.init:SetRGBFromTable( SWATCHES.jackal.target, 110 )
				end,
				function ()
					return self.init:SetRGBFromInt( 16777215, 80 )
				end
			},
			{
				function ()
					return self.init:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -300, _1080p * -236, 0 )
				end,
				function ()
					return self.init:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 200 )
				end,
				function ()
					return self.init:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -300, _1080p * -236, 9 )
				end,
				function ()
					return self.init:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 190 )
				end,
				function ()
					return self.init:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -300, _1080p * -236, 9 )
				end,
				function ()
					return self.init:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 190 )
				end
			}
		} )
		self._sequences.initArrow = function ()
			init:AnimateSequence( "initArrow" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "pooled_on_allocate", function ( f39_arg0, f39_arg1 )
		local f39_local0 = f39_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "initArrow" )
	end )
	return self
end

MenuBuilder.registerType( "JackalOffscreenIndicatorUrgent", JackalOffscreenIndicatorUrgent )
LockTable( _M )
