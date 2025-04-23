local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	return MenuBuilder.BuildRegisteredType( "JackalTargetIndicator" )
end

f0_local1 = function ()
	return MenuBuilder.BuildRegisteredType( "JackalTargetIndicator" )
end

f0_local2 = function ()
	return MenuBuilder.BuildRegisteredType( "JackalTargetIndicator" )
end

local f0_local3 = function ()
	return MenuBuilder.BuildRegisteredType( "AnnotationAllyObjective" )
end

local f0_local4 = function ()
	return MenuBuilder.BuildRegisteredType( "AnnotationEnemyObjective" )
end

local f0_local5 = function ()
	return MenuBuilder.BuildRegisteredType( "PriorityFlyingTargetAceIndicator" )
end

local f0_local6 = function ()
	return MenuBuilder.BuildRegisteredType( "PriorityFlyingTargetIndicator" )
end

local f0_local7 = function ()
	return MenuBuilder.BuildRegisteredType( "AnnotationSmallTarget" )
end

local f0_local8 = function ()
	return MenuBuilder.BuildRegisteredType( "AnnotationMediumTarget" )
end

local f0_local9 = function ()
	return MenuBuilder.BuildRegisteredType( "AnnotationLargeTarget" )
end

local f0_local10 = function ()
	return MenuBuilder.BuildRegisteredType( "AnnotationSpecialTarget" )
end

local f0_local11 = function ()
	return MenuBuilder.BuildRegisteredType( "JackalDroneMarker" )
end

local f0_local12 = function ()
	return MenuBuilder.BuildRegisteredType( "AnnotationOffscreenAllyIndicator" )
end

local f0_local13 = function ()
	return MenuBuilder.BuildRegisteredType( "AnnotationOffscreenEnemyIndicator" )
end

local f0_local14 = function ()
	return MenuBuilder.BuildRegisteredType( "AnnotationOffscreenIncomingMissile" )
end

local f0_local15 = function ()
	return MenuBuilder.BuildRegisteredType( "AnnotationAceTarget" )
end

local f0_local16 = function ()
	return MenuBuilder.BuildRegisteredType( "AnnotationFlyingAllyTarget" )
end

function EntityAnnotations( menu, controller )
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
	self.id = "EntityAnnotations"
	local f18_local1 = function ( f19_arg0 )
		local f19_local0, f19_local1, f19_local2 = Engine.GetEntityAnnotationOffset( f19_arg0 )
		return {
			minScale = 2,
			maxScale = 2,
			onObstruction = LUI.UIAnchoredElement.ON_OBSTRUCTION.hide,
			roundScreenPosition = true,
			entityOffsetX = f19_local0,
			entityOffsetY = f19_local1,
			entityOffsetZ = f19_local2
		}
	end
	
	local f18_local2 = function ( f20_arg0 )
		local f20_local0, f20_local1, f20_local2 = Engine.GetEntityAnnotationOffset( f20_arg0 )
		return {
			minScale = 1,
			maxScale = 1,
			onObstruction = LUI.UIAnchoredElement.ON_OBSTRUCTION.hide,
			roundScreenPosition = true,
			entityOffsetX = f20_local0,
			entityOffsetY = f20_local1,
			entityOffsetZ = f20_local2
		}
	end
	
	local f18_local3 = function ( f21_arg0 )
		local f21_local0, f21_local1, f21_local2 = Engine.GetEntityAnnotationOffset( f21_arg0 )
		return {
			minScale = 2,
			maxScale = 2,
			roundScreenPosition = true,
			snapToScreenEdges = true,
			snapSmoothing = 1,
			sendVisibilityEvents = true,
			rotateElementStrings = {
				"Indicator"
			},
			entityOffsetX = f21_local0,
			entityOffsetY = f21_local1,
			entityOffsetZ = f21_local2
		}
	end
	
	local f18_local4 = LUI.UIElementOnEntitySpawner.new( {
		id = "FlyingTarget",
		buildChild = f0_local0,
		initialPoolSize = 10,
		maxVisibleElements = 10,
		maxPoolSize = 15,
		spawnDistance = 0,
		spawnAngle = 90,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.flyingTarget,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local1
	} )
	f18_local4.id = "entityFlyingTarget"
	self:addElement( f18_local4 )
	local f18_local5 = LUI.UIElementOnEntitySpawner.new( {
		id = "PriorityFlyingTarget",
		buildChild = f0_local6,
		initialPoolSize = 1,
		spawnDistance = 0,
		spawnAngle = 180,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.priorityFlyingTarget,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local3
	} )
	f18_local5.id = "priorityFlyingTarget"
	self:addElement( f18_local5 )
	local f18_local6 = LUI.UIElementOnEntitySpawner.new( {
		id = "PriorityFlyingTargetAce",
		buildChild = f0_local5,
		initialPoolSize = 1,
		maxPoolSize = 5,
		maxVisibleElements = 5,
		spawnDistance = 0,
		spawnAngle = 360,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.priorityFlyingTargetAce,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local3
	} )
	f18_local6.id = "priorityFlyingTargetAce"
	self:addElement( f18_local6 )
	local f18_local7 = LUI.UIElementOnEntitySpawner.new( {
		id = "SmallTarget",
		buildChild = f0_local7,
		initialPoolSize = 20,
		maxVisibleElements = 30,
		maxPoolSize = 30,
		spawnDistance = 0,
		spawnAngle = 90,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.smallTarget,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local1
	} )
	f18_local7:SetSpawnAngle( 150 )
	f18_local7.id = "smallTarget"
	self:addElement( f18_local7 )
	local f18_local8 = LUI.UIElementOnEntitySpawner.new( {
		id = "MediumTarget",
		buildChild = f0_local8,
		initialPoolSize = 1,
		maxVisibleElements = 10,
		spawnDistance = 0,
		spawnAngle = 90,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.mediumTarget,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local1
	} )
	f18_local8.id = "mediumTarget"
	self:addElement( f18_local8 )
	local f18_local9 = {
		id = "LargeTarget",
		buildChild = f0_local9,
		initialPoolSize = 10,
		maxVisibleElements = 5,
		spawnDistance = 0,
		spawnAngle = 90,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.largeTarget,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local1
	}
	local f18_local10 = LUI.UIElementOnEntitySpawner.new( f18_local9 )
	f18_local10.id = "largeTarget"
	self:addElement( f18_local10 )
	local f18_local11 = {
		id = "SpecialTarget",
		buildChild = f0_local10,
		initialPoolSize = 1,
		spawnDistance = 0,
		spawnAngle = 180,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.specialTarget,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local1
	}
	local f18_local12 = LUI.UIElementOnEntitySpawner.new( f18_local9 )
	f18_local12.id = "specialTarget"
	self:addElement( f18_local12 )
	local f18_local13 = LUI.UIElementOnEntitySpawner.new( {
		id = "OffscreenAllyIndicator",
		buildChild = f0_local12,
		initialPoolSize = 1,
		spawnDistance = 0,
		spawnAngle = 360,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.offscreenAllyIndicator,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local3
	} )
	f18_local13.id = "offscreenAllyIndicator"
	self:addElement( f18_local13 )
	local f18_local14 = LUI.UIElementOnEntitySpawner.new( {
		id = "OffscreenEnemyIndicator",
		buildChild = f0_local13,
		initialPoolSize = 1,
		spawnDistance = 0,
		spawnAngle = 360,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.offscreenEnemyIndicator,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local3
	} )
	f18_local14.id = "offscreenEnemyIndicator"
	self:addElement( f18_local14 )
	local f18_local15 = LUI.UIElementOnEntitySpawner.new( {
		id = "OffscreenHazardIndicator",
		buildChild = f0_local14,
		initialPoolSize = 1,
		maxVisibleElements = 5,
		spawnDistance = 0,
		spawnAngle = 360,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.offscreenHazardIndicator,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local3
	} )
	f18_local15.id = "offscreenHazardIndicator"
	self:addElement( f18_local15 )
	local f18_local16 = LUI.UIElementOnEntitySpawner.new( {
		id = "AceTargetIndicator",
		buildChild = f0_local15,
		initialPoolSize = 1,
		spawnDistance = 0,
		spawnAngle = 110,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.aceTargetIndicator,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local1
	} )
	f18_local16.id = "aceTargetIndicator"
	self:addElement( f18_local16 )
	local f18_local17 = LUI.UIElementOnEntitySpawner.new( {
		id = "FlyingAllyTarget",
		buildChild = f0_local16,
		initialPoolSize = 1,
		spawnDistance = 0,
		spawnAngle = 110,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.flyingAllyTarget,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local1
	} )
	f18_local17.id = "flyingAllyTarget"
	self:addElement( f18_local17 )
	local f18_local18 = LUI.UIElementOnEntitySpawner.new( {
		id = "LargeFlyingAllyTarget",
		buildChild = f0_local1,
		initialPoolSize = 1,
		spawnDistance = 0,
		spawnAngle = 180,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.largeFlyingTarget + LUI.UIElementOnEntitySpawner.FILTER.friendlies,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local1
	} )
	f18_local18.id = "largeFlyingAllyTarget"
	self:addElement( f18_local18 )
	local f18_local19 = LUI.UIElementOnEntitySpawner.new( {
		id = "LargeFlyingEnemyTarget",
		buildChild = f0_local2,
		initialPoolSize = 1,
		spawnDistance = 0,
		spawnAngle = 180,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.largeFlyingTarget + LUI.UIElementOnEntitySpawner.FILTER.enemies,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local1
	} )
	f18_local19.id = "largeFlyingEnemyTarget"
	self:addElement( f18_local19 )
	local f18_local20 = LUI.UIElementOnEntitySpawner.new( {
		id = "AllyObjective",
		buildChild = f0_local3,
		initialPoolSize = 1,
		spawnDistance = 0,
		spawnAngle = 360,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.allyObjective,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local3
	} )
	f18_local20.id = "allyObjectives"
	self:addElement( f18_local20 )
	local f18_local21 = LUI.UIElementOnEntitySpawner.new( {
		id = "EnemyObjective",
		buildChild = f0_local4,
		initialPoolSize = 1,
		spawnDistance = 0,
		spawnAngle = 360,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.enemyObjective,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local3
	} )
	f18_local21.id = "enemyObjectives"
	self:addElement( f18_local21 )
	local f18_local22 = LUI.UIElementOnEntitySpawner.new( {
		id = "LargeWeakspot",
		buildChild = f0_local11,
		initialPoolSize = 1,
		spawnDistance = 0,
		spawnAngle = 180,
		targetEntities = LUI.UIElementOnEntitySpawner.FILTER.largeWeakspot,
		renderMode = LUI.UIElementOnEntitySpawner.RENDER_MODES.anchored,
		renderingOptions = f18_local2
	} )
	f18_local22.id = "largeWeakspot"
	self:addElement( f18_local22 )
	return self
end

MenuBuilder.registerType( "EntityAnnotations", EntityAnnotations )
LockTable( _M )
