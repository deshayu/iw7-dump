local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalOffscreenIndicatorPoint( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "JackalOffscreenIndicatorPoint"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ArrowSm = nil
	
	ArrowSm = LUI.UIImage.new()
	ArrowSm.id = "ArrowSm"
	ArrowSm:SetAlpha( 0.7, 0 )
	ArrowSm:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_sm" ), 0 )
	ArrowSm:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -14, _1080p * 50 )
	self:addElement( ArrowSm )
	self.ArrowSm = ArrowSm
	
	local ArrowLg = nil
	
	ArrowLg = LUI.UIImage.new()
	ArrowLg.id = "ArrowLg"
	ArrowLg:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot" ), 0 )
	ArrowLg:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -53, _1080p * 11 )
	self:addElement( ArrowLg )
	self.ArrowLg = ArrowLg
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ArrowLg:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.ArrowLg:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -53, _1080p * 11, 0 )
				end,
				function ()
					return self.ArrowLg:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -38, _1080p * 26, 349, LUI.EASING.inCubic )
				end,
				function ()
					return self.ArrowLg:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -41.3, _1080p * 22.7, 50 )
				end,
				function ()
					return self.ArrowLg:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -53, _1080p * 11, 349, LUI.EASING.outCubic )
				end,
				function ()
					return self.ArrowLg:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -53, _1080p * 11, 50 )
				end
			}
		} )
		self._sequences.Default = function ()
			ArrowLg:AnimateLoop( "Default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "JackalOffscreenIndicatorPoint", JackalOffscreenIndicatorPoint )
LockTable( _M )
