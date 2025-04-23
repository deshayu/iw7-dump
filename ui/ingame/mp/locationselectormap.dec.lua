local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LocationSelectorMap( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1024 * _1080p, 0, 1024 * _1080p )
	self.id = "LocationSelectorMap"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Map = nil
	
	Map = MenuBuilder.BuildRegisteredType( "MinimapContent", {
		mapAlpha = 0.5,
		drawLocationSelectionCursor = true,
		compassType = CoD.CompassType.Full,
		controllerIndex = f1_local1
	} )
	Map.id = "Map"
	self:addElement( Map )
	self.Map = Map
	
	self._animationSets.DefaultAnimationSet = function ()
		Map:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Map:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Map:SetAlpha( 0, 300 )
				end,
				function ()
					return self.Map:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Map:AnimateSequence( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "LocationSelectorMap", LocationSelectorMap )
LockTable( _M )
