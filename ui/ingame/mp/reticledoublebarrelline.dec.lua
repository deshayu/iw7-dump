local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleDoubleBarrelLine( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 150 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleDoubleBarrelLine"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Large = nil
	
	Large = LUI.UIImage.new()
	Large.id = "Large"
	Large:setImage( RegisterMaterial( "hud_reticle_doublebarrel_ring" ), 0 )
	Large:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 86, 0, 0, 0 )
	self:addElement( Large )
	self.Large = Large
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Large:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.Large:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Large:SetAlpha( 0.6, 30 )
				end,
				function ()
					return self.Large:SetAlpha( 0.2, 30 )
				end,
				function ()
					return self.Large:SetAlpha( 0.6, 30 )
				end,
				function ()
					return self.Large:SetAlpha( 1, 60, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Fire = function ()
			Large:AnimateSequence( "Fire" )
		end
		
		Large:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Large:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Large:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.Idle = function ()
			Large:AnimateSequence( "Idle" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ReticleDoubleBarrelLine", ReticleDoubleBarrelLine )
LockTable( _M )
