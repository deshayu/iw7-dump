local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HaloDropSideMeters( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HaloDropSideMeters"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HaloDropSideMeter0 = nil
	
	HaloDropSideMeter0 = MenuBuilder.BuildRegisteredType( "HaloDropSideMeter", {
		controllerIndex = f1_local1
	} )
	HaloDropSideMeter0.id = "HaloDropSideMeter0"
	HaloDropSideMeter0:SetXRotation( -72, 0 )
	HaloDropSideMeter0:SetZRotation( 5, 0 )
	HaloDropSideMeter0:SetDepth( 300, 0 )
	HaloDropSideMeter0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 620, _1080p * 704, _1080p * -218, _1080p * 678 )
	self:addElement( HaloDropSideMeter0 )
	self.HaloDropSideMeter0 = HaloDropSideMeter0
	
	local HaloDropSideMeterLeft0 = nil
	
	HaloDropSideMeterLeft0 = MenuBuilder.BuildRegisteredType( "HaloDropSideMeterLeft", {
		controllerIndex = f1_local1
	} )
	HaloDropSideMeterLeft0.id = "HaloDropSideMeterLeft0"
	HaloDropSideMeterLeft0:SetXRotation( -72, 0 )
	HaloDropSideMeterLeft0:SetZRotation( -5, 0 )
	HaloDropSideMeterLeft0:SetDepth( 300, 0 )
	HaloDropSideMeterLeft0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -704, _1080p * -620, _1080p * -218, _1080p * 678 )
	self:addElement( HaloDropSideMeterLeft0 )
	self.HaloDropSideMeterLeft0 = HaloDropSideMeterLeft0
	
	self:SubscribeToModel( DataSources.inGame.SP.europa.haloDropState:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) == 4 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HaloDropSideMeter0",
				sequenceName = "StartDrop",
				elementPath = "HaloDropSideMeter0"
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HaloDropSideMeterLeft0",
				sequenceName = "StartDrop",
				elementPath = "HaloDropSideMeterLeft0"
			} )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) == 5 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HaloDropSideMeter0",
				sequenceName = "LevelOut",
				elementPath = "HaloDropSideMeter0"
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HaloDropSideMeterLeft0",
				sequenceName = "LevelOut",
				elementPath = "HaloDropSideMeterLeft0"
			} )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) == 6 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HaloDropSideMeter0",
				sequenceName = "StartDrop",
				elementPath = "HaloDropSideMeter0"
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HaloDropSideMeterLeft0",
				sequenceName = "StartDrop",
				elementPath = "HaloDropSideMeterLeft0"
			} )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) == 8 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HaloDropSideMeter0",
				sequenceName = "Landing",
				elementPath = "HaloDropSideMeter0"
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HaloDropSideMeterLeft0",
				sequenceName = "Landing",
				elementPath = "HaloDropSideMeterLeft0"
			} )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) == 9 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HaloDropSideMeter0",
				sequenceName = "LandingDone",
				elementPath = "HaloDropSideMeter0"
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HaloDropSideMeterLeft0",
				sequenceName = "LandingDone",
				elementPath = "HaloDropSideMeterLeft0"
			} )
		end
	end )
	return self
end

MenuBuilder.registerType( "HaloDropSideMeters", HaloDropSideMeters )
LockTable( _M )
