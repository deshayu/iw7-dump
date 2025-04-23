local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ThermalVisionFriendlyVRScope( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ThermalVisionFriendlyVRScope"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BG = nil
	
	BG = LUI.UIImage.new()
	BG.id = "BG"
	BG:SetRGBFromInt( 4255910, 0 )
	BG:setImage( RegisterMaterial( "hud_reticle_bluedot" ), 0 )
	BG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 928, _1080p * 992, _1080p * 508, _1080p * 572 )
	self:addElement( BG )
	self.BG = BG
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BG:RegisterAnimationSequence( "Init", {
			{
				function ()
					return self.BG:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Init = function ()
			BG:AnimateSequence( "Init" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Init" )
	return self
end

MenuBuilder.registerType( "ThermalVisionFriendlyVRScope", ThermalVisionFriendlyVRScope )
LockTable( _M )
