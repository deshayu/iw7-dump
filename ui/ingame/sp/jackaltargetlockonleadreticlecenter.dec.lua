local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalTargetLockonLeadReticleCenter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 48 * _1080p, 0, 48 * _1080p )
	self.id = "JackalTargetLockonLeadReticleCenter"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self.soundSet = "jackal"
	local f1_local2 = self
	local innerWhite = nil
	
	innerWhite = LUI.UIImage.new()
	innerWhite.id = "innerWhite"
	innerWhite:SetScale( -0.14, 0 )
	innerWhite:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_square_med" ), 0 )
	innerWhite:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( innerWhite )
	self.innerWhite = innerWhite
	
	local inner = nil
	
	inner = LUI.UIImage.new()
	inner.id = "inner"
	inner:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	inner:SetScale( -0.05, 0 )
	inner:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_square_med" ), 0 )
	inner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( inner )
	self.inner = inner
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		innerWhite:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.innerWhite:SetAlpha( 1, 0 )
				end,
				function ()
					return self.innerWhite:SetAlpha( 0.3, 190 )
				end,
				function ()
					return self.innerWhite:SetAlpha( 1, 190 )
				end
			}
		} )
		inner:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.inner:SetAlpha( 1, 0 )
				end,
				function ()
					return self.inner:SetAlpha( 0.3, 190 )
				end,
				function ()
					return self.inner:SetAlpha( 1, 190 )
				end
			}
		} )
		self._sequences.Default = function ()
			innerWhite:AnimateLoop( "Default" )
			inner:AnimateLoop( "Default" )
		end
		
		self._sequences.Dogfight = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "JackalTargetLockonLeadReticleCenter", JackalTargetLockonLeadReticleCenter )
LockTable( _M )
