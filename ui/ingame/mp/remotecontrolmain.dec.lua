local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.MP.scorestreakHuds.remoteControlSequence:GetModel( f1_arg1 )
	f1_arg0:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.remoteControlConnect:GetModel( f1_arg1 ), function ()
		if DataModel.GetModelValue( f1_local0 ) == 1 then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "RemoteControlPanels",
				sequenceName = "ConnectingSequence",
				elementPath = "RemoteControlPanels"
			} )
		end
	end )
	f1_arg0:SubscribeToModel( f1_local0, function ()
		if DataModel.GetModelValue( f1_local0 ) == 2 then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "RemoteControlPanels",
				sequenceName = "ShutdownSequence",
				elementPath = "RemoteControlPanels"
			} )
		end
	end )
end

function RemoteControlMain( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "RemoteControlMain"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local RemoteControlPanels = nil
	
	RemoteControlPanels = MenuBuilder.BuildRegisteredType( "RemoteControlPanels", {
		controllerIndex = f4_local1
	} )
	RemoteControlPanels.id = "RemoteControlPanels"
	RemoteControlPanels:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( RemoteControlPanels )
	self.RemoteControlPanels = RemoteControlPanels
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "RemoteControlMain", RemoteControlMain )
LockTable( _M )
