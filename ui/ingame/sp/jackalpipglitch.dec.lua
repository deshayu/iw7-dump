local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalPipGlitch( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "JackalPipGlitch"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PipGlitchImage = nil
	
	PipGlitchImage = LUI.UIImage.new()
	PipGlitchImage.id = "PipGlitchImage"
	PipGlitchImage:setImage( RegisterMaterial( "hud_jackal_pip_glitch_00" ), 0 )
	PipGlitchImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -710, _1080p * 710, _1080p * -420, _1080p * 385 )
	self:addElement( PipGlitchImage )
	self.PipGlitchImage = PipGlitchImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PipGlitchImage:RegisterAnimationSequence( "PlayGlitch", {
			{
				function ()
					return self.PipGlitchImage:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.PipGlitchImage:setImage( RegisterMaterial( "hud_jackal_pip_glitch_01" ), 50 )
				end,
				function ()
					return self.PipGlitchImage:setImage( RegisterMaterial( "hud_jackal_pip_glitch_02" ), 50 )
				end,
				function ()
					return self.PipGlitchImage:setImage( RegisterMaterial( "hud_jackal_pip_glitch_03" ), 50 )
				end,
				function ()
					return self.PipGlitchImage:setImage( RegisterMaterial( "hud_jackal_pip_glitch_04" ), 50 )
				end,
				function ()
					return self.PipGlitchImage:setImage( RegisterMaterial( "hud_jackal_pip_glitch_05" ), 50 )
				end,
				function ()
					return self.PipGlitchImage:setImage( RegisterMaterial( "hud_jackal_pip_glitch_06" ), 50 )
				end
			}
		} )
		self._sequences.PlayGlitch = function ()
			PipGlitchImage:AnimateLoop( "PlayGlitch" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "JackalPipGlitch", JackalPipGlitch )
LockTable( _M )
