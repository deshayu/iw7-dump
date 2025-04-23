local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EdgeGlow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 640 * _1080p, 0, 360 * _1080p )
	self.id = "EdgeGlow"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:SetRGBFromTable( SWATCHES.HUD.sixthSense, 0 )
	Image0:SetAlpha( 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self._animationSets.DefaultAnimationSet = function ()
		Image0:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Image0:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Image0:AnimateSequence( "DefaultSequence" )
		end
		
		Image0:RegisterAnimationSequence( "PerkPulse", {
			{
				function ()
					return self.Image0:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.Image0:SetAlpha( 0, 250 )
				end,
				function ()
					return self.Image0:SetAlpha( 0.5, 250 )
				end
			},
			{
				function ()
					return self.Image0:SetRGBFromTable( SWATCHES.HUD.sixthSense, 0 )
				end
			}
		} )
		self._sequences.PerkPulse = function ()
			Image0:AnimateLoop( "PerkPulse" )
		end
		
		Image0:RegisterAnimationSequence( "DamageFlash", {
			{
				function ()
					return self.Image0:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.Image0:SetRGBFromInt( 0, 50 )
				end,
				function ()
					return self.Image0:SetRGBFromInt( 0, 130, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Image0:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.Image0:SetAlpha( 0.8, 50 )
				end,
				function ()
					return self.Image0:SetAlpha( 0, 130, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.DamageFlash = function ()
			Image0:AnimateSequence( "DamageFlash" )
		end
		
		Image0:RegisterAnimationSequence( "DoubleDamageFlash", {
			{
				function ()
					return self.Image0:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Image0:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.Image0:SetAlpha( 0.8, 30 )
				end,
				function ()
					return self.Image0:SetAlpha( 0, 10 )
				end,
				function ()
					return self.Image0:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Image0:SetAlpha( 0.8, 30 )
				end,
				function ()
					return self.Image0:SetAlpha( 0, 80 )
				end
			}
		} )
		self._sequences.DoubleDamageFlash = function ()
			Image0:AnimateSequence( "DoubleDamageFlash" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "EdgeGlow", EdgeGlow )
LockTable( _M )
