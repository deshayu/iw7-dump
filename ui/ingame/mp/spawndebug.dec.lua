local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SpawnDebug( menu, controller )
	local self = LUI.UIElement.new( {
		left = 0,
		right = 288,
		top = 0,
		bottom = 60,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false
	} )
	self.id = "SpawnDebug"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller or {}
	local f1_local2 = nil
	if Engine.InFrontend() then
		f1_local2 = f1_local1.controllerIndex
		if not f1_local2 then
			local f1_local3 = LUI.FlowManager.GetScopedData( self )
			assert( f1_local3 )
			f1_local2 = f1_local3.controllerIndex
		end
	else
		f1_local2 = self:getRootController()
	end
	if PreLoadFunc then
		PreLoadFunc( self, f1_local2 )
	end
	local f1_local3 = self
	
	local LocationText = LUI.UIText.new()
	LocationText.id = "LocationText"
	LocationText:SetAnchors( true, false, true, false )
	LocationText:SetLeft( 22 )
	LocationText:SetRight( 283.89 )
	LocationText:SetTop( 32 )
	LocationText:SetBottom( 52 )
	LocationText:SetRGBFromTable( SWATCHES.spawnDebug.noNearbyNodes )
	LocationText:setText( Engine.Localize( "No Nearby Path Nodes!" ) )
	LocationText:SetFont( FONTS.GetFontAtSize( FONTS.Dev.File, 20 ) )
	LocationText:SetAlignment( LUI.Alignment.Left )
	self:addElement( LocationText )
	self.LocationText = LocationText
	
	local LocationIcon = LUI.UIImage.new()
	LocationIcon.id = "LocationIcon"
	LocationIcon:SetAnchors( true, false, true, false )
	LocationIcon:SetLeft( 0 )
	LocationIcon:SetRight( 22 )
	LocationIcon:SetTop( 32 )
	LocationIcon:SetBottom( 54 )
	LocationIcon:SetRGBFromTable( SWATCHES.spawnDebug.noNearbyNodes )
	LocationIcon:SetZRotation( 90 )
	LocationIcon:setImage( RegisterMaterial( "hud_arrow" ) )
	self:addElement( LocationIcon )
	self.LocationIcon = LocationIcon
	
	local SystemIcon = LUI.UIImage.new()
	SystemIcon.id = "SystemIcon"
	SystemIcon:SetAnchors( true, false, true, false )
	SystemIcon:SetLeft( 0 )
	SystemIcon:SetRight( 22 )
	SystemIcon:SetTop( 8.67 )
	SystemIcon:SetBottom( 30.67 )
	SystemIcon:SetRGBFromInt( 16777215 )
	SystemIcon:SetZRotation( 90 )
	SystemIcon:setImage( RegisterMaterial( "hud_arrow" ) )
	self:addElement( SystemIcon )
	self.SystemIcon = SystemIcon
	
	local SystemText = LUI.UIText.new()
	SystemText.id = "SystemText"
	SystemText:SetAnchors( true, false, true, false )
	SystemText:SetLeft( 22 )
	SystemText:SetRight( 235.22 )
	SystemText:SetTop( 8.67 )
	SystemText:SetBottom( 28.67 )
	SystemText:SetRGBFromInt( 16777215 )
	SystemText:setText( Engine.Localize( "Using TTLOS System" ) )
	SystemText:SetFont( FONTS.GetFontAtSize( FONTS.Dev.File, 20 ) )
	SystemText:SetAlignment( LUI.Alignment.Left )
	self:addElement( SystemText )
	self.SystemText = SystemText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		local f2_local0 = {}
		LocationText:registerAnimationState( "HideAllFrame1", {
			alpha = 0
		} )
		table.insert( f2_local0, {
			"HideAllFrame1",
			0,
			false,
			false
		} )
		LocationText:RegisterAnimationSequence( "HideAll", f2_local0 )
		local f2_local1 = {}
		LocationIcon:registerAnimationState( "HideAllFrame1", {
			alpha = 0
		} )
		table.insert( f2_local1, {
			"HideAllFrame1",
			0,
			false,
			false
		} )
		LocationIcon:RegisterAnimationSequence( "HideAll", f2_local1 )
		local f2_local2 = {}
		SystemIcon:registerAnimationState( "HideAllFrame1", {
			alpha = 0
		} )
		table.insert( f2_local2, {
			"HideAllFrame1",
			0,
			false,
			false
		} )
		SystemIcon:RegisterAnimationSequence( "HideAll", f2_local2 )
		local f2_local3 = {}
		SystemText:registerAnimationState( "HideAllFrame1", {
			alpha = 0
		} )
		table.insert( f2_local3, {
			"HideAllFrame1",
			0,
			false,
			false
		} )
		SystemText:RegisterAnimationSequence( "HideAll", f2_local3 )
		self._sequences.HideAll = function ()
			LocationText:AnimateSequence( "HideAll" )
			LocationIcon:AnimateSequence( "HideAll" )
			SystemIcon:AnimateSequence( "HideAll" )
			SystemText:AnimateSequence( "HideAll" )
		end
		
		local f2_local4 = {}
		SystemIcon:registerAnimationState( "System_UsingCornerTracesFrame1", {
			color = SWATCHES.spawnDebug.usingBadSystem,
			alpha = 1
		} )
		table.insert( f2_local4, {
			"System_UsingCornerTracesFrame1",
			0,
			false,
			false
		} )
		SystemIcon:RegisterAnimationSequence( "System_UsingCornerTraces", f2_local4 )
		local f2_local5 = {}
		SystemText:registerAnimationState( "System_UsingCornerTracesFrame1", {
			color = SWATCHES.spawnDebug.usingBadSystem,
			alpha = 1
		} )
		table.insert( f2_local5, {
			"System_UsingCornerTracesFrame1",
			0,
			false,
			false
		} )
		SystemText:RegisterAnimationSequence( "System_UsingCornerTraces", f2_local5 )
		self._sequences.System_UsingCornerTraces = function ()
			SystemIcon:AnimateSequence( "System_UsingCornerTraces" )
			SystemText:AnimateSequence( "System_UsingCornerTraces" )
		end
		
		local f2_local6 = {}
		SystemIcon:registerAnimationState( "System_UsingTTLOSFrame1", {
			color = SWATCHES.spawnDebug.usingGoodSystem,
			alpha = 1
		} )
		table.insert( f2_local6, {
			"System_UsingTTLOSFrame1",
			0,
			false,
			false
		} )
		SystemIcon:RegisterAnimationSequence( "System_UsingTTLOS", f2_local6 )
		local f2_local7 = {}
		SystemText:registerAnimationState( "System_UsingTTLOSFrame1", {
			color = SWATCHES.spawnDebug.usingGoodSystem,
			alpha = 1
		} )
		table.insert( f2_local7, {
			"System_UsingTTLOSFrame1",
			0,
			false,
			false
		} )
		SystemText:RegisterAnimationSequence( "System_UsingTTLOS", f2_local7 )
		self._sequences.System_UsingTTLOS = function ()
			SystemIcon:AnimateSequence( "System_UsingTTLOS" )
			SystemText:AnimateSequence( "System_UsingTTLOS" )
		end
		
		local f2_local8 = {}
		LocationText:registerAnimationState( "NoNearbyNodesFrame1", {
			color = SWATCHES.spawnDebug.noNearbyNodes,
			alpha = 1
		} )
		table.insert( f2_local8, {
			"NoNearbyNodesFrame1",
			0,
			false,
			false
		} )
		LocationText:RegisterAnimationSequence( "NoNearbyNodes", f2_local8 )
		local f2_local9 = {}
		LocationIcon:registerAnimationState( "NoNearbyNodesFrame1", {
			color = SWATCHES.spawnDebug.noNearbyNodes,
			alpha = 1
		} )
		table.insert( f2_local9, {
			"NoNearbyNodesFrame1",
			0,
			false,
			false
		} )
		LocationIcon:RegisterAnimationSequence( "NoNearbyNodes", f2_local9 )
		self._sequences.NoNearbyNodes = function ()
			LocationText:AnimateSequence( "NoNearbyNodes" )
			LocationIcon:AnimateSequence( "NoNearbyNodes" )
		end
		
		local f2_local10 = {}
		LocationText:registerAnimationState( "HideNearbyNodesFrame1", {
			alpha = 0
		} )
		table.insert( f2_local10, {
			"HideNearbyNodesFrame1",
			0,
			false,
			false
		} )
		LocationText:RegisterAnimationSequence( "HideNearbyNodes", f2_local10 )
		local f2_local11 = {}
		LocationIcon:registerAnimationState( "HideNearbyNodesFrame1", {
			alpha = 0
		} )
		table.insert( f2_local11, {
			"HideNearbyNodesFrame1",
			0,
			false,
			false
		} )
		LocationIcon:RegisterAnimationSequence( "HideNearbyNodes", f2_local11 )
		self._sequences.HideNearbyNodes = function ()
			LocationText:AnimateSequence( "HideNearbyNodes" )
			LocationIcon:AnimateSequence( "HideNearbyNodes" )
		end
		
		local f2_local12 = {}
		SystemIcon:registerAnimationState( "HideSystemFrame1", {
			alpha = 0
		} )
		table.insert( f2_local12, {
			"HideSystemFrame1",
			0,
			false,
			false
		} )
		SystemIcon:RegisterAnimationSequence( "HideSystem", f2_local12 )
		local f2_local13 = {}
		SystemText:registerAnimationState( "HideSystemFrame1", {
			alpha = 0
		} )
		table.insert( f2_local13, {
			"HideSystemFrame1",
			0,
			false,
			false
		} )
		SystemText:RegisterAnimationSequence( "HideSystem", f2_local13 )
		self._sequences.HideSystem = function ()
			SystemIcon:AnimateSequence( "HideSystem" )
			SystemText:AnimateSequence( "HideSystem" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	SystemText:SubscribeToModel( DataSources.debug.usingTTLOSSystem:GetModel( f1_local2 ), function ()
		local f10_local0 = function ( f11_arg0, f11_arg1 )
			local f11_local0 = f11_arg1.controller or controller
			if DataSources.debug.usingTTLOSSystem:GetValue( f1_local2 ) ~= nil and DataSources.debug.usingTTLOSSystem:GetValue( f1_local2 ) == 1 then
				ACTIONS.SetText( f11_arg0, "Using Corner-Traces" )
			elseif DataSources.debug.usingTTLOSSystem:GetValue( f1_local2 ) ~= nil and DataSources.debug.usingTTLOSSystem:GetValue( f1_local2 ) == 2 then
				ACTIONS.SetText( f11_arg0, "Using TTLOS System" )
			end
		end
		
		f10_local0( SystemText, {
			name = "datasource_event"
		} )
	end )
	self:SubscribeToModel( DataSources.debug.playerInBadPlace:GetModel( f1_local2 ), function ()
		local f12_local0 = function ( f13_arg0, f13_arg1 )
			local f13_local0 = f13_arg1.controller or controller
			if DataSources.debug.playerInBadPlace:GetValue( f1_local2 ) ~= nil and DataSources.debug.playerInBadPlace:GetValue( f1_local2 ) == true then
				ACTIONS.AnimateSequence( self, "NoNearbyNodes" )
			elseif DataSources.debug.playerInBadPlace:GetValue( f1_local2 ) ~= nil and DataSources.debug.playerInBadPlace:GetValue( f1_local2 ) == false then
				ACTIONS.AnimateSequence( self, "HideNearbyNodes" )
			end
		end
		
		f12_local0( self, {
			name = "datasource_event"
		} )
	end )
	self:SubscribeToModel( DataSources.debug.usingTTLOSSystem:GetModel( f1_local2 ), function ()
		local f14_local0 = function ( f15_arg0, f15_arg1 )
			local f15_local0 = f15_arg1.controller or controller
			if DataSources.debug.usingTTLOSSystem:GetValue( f1_local2 ) ~= nil and DataSources.debug.usingTTLOSSystem:GetValue( f1_local2 ) == 1 then
				ACTIONS.AnimateSequence( self, "System_UsingCornerTraces" )
			elseif DataSources.debug.usingTTLOSSystem:GetValue( f1_local2 ) ~= nil and DataSources.debug.usingTTLOSSystem:GetValue( f1_local2 ) == 2 then
				ACTIONS.AnimateSequence( self, "System_UsingTTLOS" )
			elseif DataSources.debug.usingTTLOSSystem:GetValue( f1_local2 ) ~= nil and DataSources.debug.usingTTLOSSystem:GetValue( f1_local2 ) == 0 then
				ACTIONS.AnimateSequence( self, "HideSystem" )
			end
		end
		
		f14_local0( self, {
			name = "datasource_event"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, f1_local2, f1_local3 )
	end
	return self
end

MenuBuilder.registerType( "SpawnDebug", SpawnDebug )
LockTable( _M )
