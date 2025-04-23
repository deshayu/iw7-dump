local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	local f1_local0 = MenuBuilder.BuildRegisteredType( "ThermalVisionEnemyDefault" )
	f1_local0.id = "thermalVisionEnemyDefault"
	return f1_local0
end

f0_local1 = function ()
	local f2_local0 = MenuBuilder.BuildRegisteredType( "ThermalVisionEnemyLinked" )
	f2_local0.id = "thermalVisionEnemyLinked"
	return f2_local0
end

f0_local2 = function ()
	local f3_local0 = MenuBuilder.BuildRegisteredType( "ThermalVisionEnemyApex" )
	f3_local0.id = "thermalVisionEnemyApex"
	return f3_local0
end

local f0_local3 = function ()
	local f4_local0 = MenuBuilder.BuildRegisteredType( "ThermalVisionEnemyVenom" )
	f4_local0.id = "thermalVisionEnemyVenom"
	return f4_local0
end

local f0_local4 = function ()
	local f5_local0 = MenuBuilder.BuildRegisteredType( "ThermalVisionEnemyVRScope" )
	f5_local0.id = "thermalVisionEnemyVRScope"
	return f5_local0
end

local f0_local5 = function ()
	local f6_local0 = MenuBuilder.BuildRegisteredType( "ThermalVisionFriendlyDefault" )
	f6_local0.id = "thermalVisionFriendlyDefault"
	return f6_local0
end

local f0_local6 = function ()
	local f7_local0 = MenuBuilder.BuildRegisteredType( "ThermalVisionFriendlyLinked" )
	f7_local0.id = "thermalVisionFriendlyLinked"
	return f7_local0
end

local f0_local7 = function ()
	local f8_local0 = MenuBuilder.BuildRegisteredType( "ThermalVisionFriendlyApex" )
	f8_local0.id = "thermalVisionFriendlyApex"
	return f8_local0
end

local f0_local8 = function ()
	local f9_local0 = MenuBuilder.BuildRegisteredType( "ThermalVisionFriendlyVenom" )
	f9_local0.id = "thermalVisionFriendlyVenom"
	return f9_local0
end

local f0_local9 = function ()
	local f10_local0 = MenuBuilder.BuildRegisteredType( "ThermalVisionFriendlyVRScope" )
	f10_local0.id = "thermalVisionFriendlyVRScope"
	return f10_local0
end

local f0_local10 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4, f11_arg5 )
	local self = LUI.UIElementOnEntitySpawner.new( {
		buildChild = f11_arg2,
		spawnDistance = 0,
		spawnAngle = 180,
		maxVisibleElements = 18,
		targetEntities = f11_arg1,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = {
			entityTag = "j_spine4",
			onObstruction = f11_arg4,
			minScale = 0.5,
			maxScale = 1.5,
			naturalDistance = 750
		}
	} )
	self.id = f11_arg3
	self:SetUseScopeStencil( f11_arg5 )
	f11_arg0:addElement( self )
end

function ThermalVision( menu, controller )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "ThermalVision"
	f0_local10( self, LUI.UIElementOnEntitySpawner.FILTER.thermalVisionDefault + LUI.UIElementOnEntitySpawner.FILTER.enemies, f0_local0, "entityThermalVisionEnemyDefault", LUI.UIAnchoredElement.ON_OBSTRUCTION.hide, false )
	f0_local10( self, LUI.UIElementOnEntitySpawner.FILTER.thermalVisionLinked + LUI.UIElementOnEntitySpawner.FILTER.enemies, f0_local1, "entityThermalVisionEnemyLinked", LUI.UIAnchoredElement.ON_OBSTRUCTION.ignore, false )
	f0_local10( self, LUI.UIElementOnEntitySpawner.FILTER.thermalVisionApex + LUI.UIElementOnEntitySpawner.FILTER.enemies, f0_local2, "entityThermalVisionEnemyApex", LUI.UIAnchoredElement.ON_OBSTRUCTION.hide, false )
	f0_local10( self, LUI.UIElementOnEntitySpawner.FILTER.thermalVisionVenom + LUI.UIElementOnEntitySpawner.FILTER.enemies, f0_local3, "entityThermalVisionEnemyVenom", LUI.UIAnchoredElement.ON_OBSTRUCTION.hide, false )
	f0_local10( self, LUI.UIElementOnEntitySpawner.FILTER.largeFlyingTarget + LUI.UIElementOnEntitySpawner.FILTER.enemies, f0_local4, "entityThermalVisionEnemyVRScope", LUI.UIAnchoredElement.ON_OBSTRUCTION.hide, true )
	f0_local10( self, LUI.UIElementOnEntitySpawner.FILTER.thermalVisionDefault + LUI.UIElementOnEntitySpawner.FILTER.self, f0_local5, "entityThermalVisionFriendlyDefault", LUI.UIAnchoredElement.ON_OBSTRUCTION.ignore, false )
	f0_local10( self, LUI.UIElementOnEntitySpawner.FILTER.thermalVisionLinked + LUI.UIElementOnEntitySpawner.FILTER.friendlies, f0_local6, "entityThermalVisionFriendlyLinked", LUI.UIAnchoredElement.ON_OBSTRUCTION.ignore, false )
	f0_local10( self, LUI.UIElementOnEntitySpawner.FILTER.thermalVisionLinked + LUI.UIElementOnEntitySpawner.FILTER.self, f0_local6, "entityThermalVisionFriendlyLinked", LUI.UIAnchoredElement.ON_OBSTRUCTION.ignore, false )
	f0_local10( self, LUI.UIElementOnEntitySpawner.FILTER.thermalVisionApex + LUI.UIElementOnEntitySpawner.FILTER.self, f0_local7, "entityThermalVisionFriendlyApex", LUI.UIAnchoredElement.ON_OBSTRUCTION.ignore, false )
	f0_local10( self, LUI.UIElementOnEntitySpawner.FILTER.thermalVisionVenom + LUI.UIElementOnEntitySpawner.FILTER.self, f0_local8, "entityThermalVisionFriendlyVenom", LUI.UIAnchoredElement.ON_OBSTRUCTION.ignore, false )
	f0_local10( self, LUI.UIElementOnEntitySpawner.FILTER.largeFlyingTarget + LUI.UIElementOnEntitySpawner.FILTER.friendlies, f0_local9, "entityThermalVisionFriendlyVRScope", LUI.UIAnchoredElement.ON_OBSTRUCTION.hide, true )
	return self
end

MenuBuilder.registerType( "ThermalVision", ThermalVision )
LockTable( _M )
