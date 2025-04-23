local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GenericSplashLightRays( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "GenericSplashLightRays"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ray1 = nil
	
	ray1 = LUI.UIImage.new()
	ray1.id = "ray1"
	ray1:SetAlpha( 0.5, 0 )
	ray1:setImage( RegisterMaterial( "cp_disco_skill_splash_rays" ), 0 )
	ray1:SetUseAA( true )
	ray1:SetBlendMode( BLEND_MODE.addWithAlpha )
	ray1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( ray1 )
	self.ray1 = ray1
	
	local ray2 = nil
	
	ray2 = LUI.UIImage.new()
	ray2.id = "ray2"
	ray2:SetZRotation( -30, 0 )
	ray2:SetScale( -0.35, 0 )
	ray2:setImage( RegisterMaterial( "cp_disco_skill_splash_rays" ), 0 )
	ray2:SetUseAA( true )
	ray2:SetBlendMode( BLEND_MODE.addWithAlpha )
	ray2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( ray2 )
	self.ray2 = ray2
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ray1:RegisterAnimationSequence( "ray1Loop", {
			{
				function ()
					return self.ray1:SetZRotation( 0, 0 )
				end,
				function ()
					return self.ray1:SetZRotation( -359, 10000 )
				end
			}
		} )
		self._sequences.ray1Loop = function ()
			ray1:AnimateLoop( "ray1Loop" )
		end
		
		ray2:RegisterAnimationSequence( "ray2Loop", {
			{
				function ()
					return self.ray2:SetZRotation( -30, 0 )
				end,
				function ()
					return self.ray2:SetZRotation( -389, 5000 )
				end
			}
		} )
		self._sequences.ray2Loop = function ()
			ray2:AnimateLoop( "ray2Loop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "ray1Loop" )
	ACTIONS.AnimateSequence( self, "ray2Loop" )
	return self
end

MenuBuilder.registerType( "GenericSplashLightRays", GenericSplashLightRays )
LockTable( _M )
