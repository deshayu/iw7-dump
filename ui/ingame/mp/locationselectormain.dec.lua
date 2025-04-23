local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LocationSelectorMain( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "LocationSelectorMain"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LocationSelectorOverlay = nil
	
	LocationSelectorOverlay = MenuBuilder.BuildRegisteredType( "LocationSelectorGridOverlay", {
		controllerIndex = f1_local1
	} )
	LocationSelectorOverlay.id = "LocationSelectorOverlay"
	LocationSelectorOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( LocationSelectorOverlay )
	self.LocationSelectorOverlay = LocationSelectorOverlay
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LocationSelectorOverlay:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.LocationSelectorOverlay:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LocationSelectorOverlay:SetAlpha( 0, 290 )
				end,
				function ()
					return self.LocationSelectorOverlay:SetAlpha( 1, 50 )
				end,
				function ()
					return self.LocationSelectorOverlay:SetAlpha( 1, 410, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.LocationSelectorOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -2241, _1080p * -2241, 0, 0, 0 )
				end,
				function ()
					return self.LocationSelectorOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -2241, _1080p * -2241, 0, 0, 289 )
				end,
				function ()
					return self.LocationSelectorOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 460, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.bootup = function ()
			LocationSelectorOverlay:AnimateSequence( "bootup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "bootup" )
	return self
end

MenuBuilder.registerType( "LocationSelectorMain", LocationSelectorMain )
LockTable( _M )
