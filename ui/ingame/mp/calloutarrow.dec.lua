local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CalloutArrow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 20 * _1080p )
	self.id = "CalloutArrow"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BaseArrow = nil
	
	BaseArrow = LUI.UIImage.new()
	BaseArrow.id = "BaseArrow"
	BaseArrow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	BaseArrow:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 10, 0, _1080p * 10 )
	self:addElement( BaseArrow )
	self.BaseArrow = BaseArrow
	
	local AnimatedArrow = nil
	
	AnimatedArrow = LUI.UIImage.new()
	AnimatedArrow.id = "AnimatedArrow"
	AnimatedArrow:SetAlpha( 0, 0 )
	AnimatedArrow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	AnimatedArrow:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 10, 0, _1080p * 10 )
	self:addElement( AnimatedArrow )
	self.AnimatedArrow = AnimatedArrow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AnimatedArrow:RegisterAnimationSequence( "Flash", {
			{
				function ()
					return self.AnimatedArrow:SetAlpha( 1, 0 )
				end,
				function ()
					return self.AnimatedArrow:SetAlpha( 0, 230 )
				end
			},
			{
				function ()
					return self.AnimatedArrow:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 10, 0, _1080p * 10, 0 )
				end,
				function ()
					return self.AnimatedArrow:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 10, _1080p * 10, _1080p * 20, 230 )
				end
			}
		} )
		self._sequences.Flash = function ()
			AnimatedArrow:AnimateLoop( "Flash" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.AlwaysTrue( self ) then
		ACTIONS.AnimateSequence( self, "Flash" )
	end
	return self
end

MenuBuilder.registerType( "CalloutArrow", CalloutArrow )
LockTable( _M )
