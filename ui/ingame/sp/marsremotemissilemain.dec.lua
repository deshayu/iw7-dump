local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MarsRemoteMissileMain( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "MarsRemoteMissileMain"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local MarsRemoteMissileTargetWindow0 = nil
	
	MarsRemoteMissileTargetWindow0 = MenuBuilder.BuildRegisteredType( "MarsRemoteMissileTargetWindow", {
		controllerIndex = f1_local1
	} )
	MarsRemoteMissileTargetWindow0.id = "MarsRemoteMissileTargetWindow0"
	MarsRemoteMissileTargetWindow0:SetAlpha( 0, 0 )
	MarsRemoteMissileTargetWindow0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( MarsRemoteMissileTargetWindow0 )
	self.MarsRemoteMissileTargetWindow0 = MarsRemoteMissileTargetWindow0
	
	local MarsRemoteMissileTransitionWindow0 = nil
	
	MarsRemoteMissileTransitionWindow0 = MenuBuilder.BuildRegisteredType( "MarsRemoteMissileTransitionWindow", {
		controllerIndex = f1_local1
	} )
	MarsRemoteMissileTransitionWindow0.id = "MarsRemoteMissileTransitionWindow0"
	MarsRemoteMissileTransitionWindow0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( MarsRemoteMissileTransitionWindow0 )
	self.MarsRemoteMissileTransitionWindow0 = MarsRemoteMissileTransitionWindow0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MarsRemoteMissileTargetWindow0:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.MarsRemoteMissileTargetWindow0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MarsRemoteMissileTargetWindow0:SetAlpha( 0, 850 )
				end,
				function ()
					return self.MarsRemoteMissileTargetWindow0:SetAlpha( 1, 10 )
				end
			}
		} )
		self._sequences.bootup = function ()
			MarsRemoteMissileTargetWindow0:AnimateSequence( "bootup" )
		end
		
		MarsRemoteMissileTargetWindow0:RegisterAnimationSequence( "shutdown", {
			{
				function ()
					return self.MarsRemoteMissileTargetWindow0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MarsRemoteMissileTargetWindow0:SetAlpha( 1, 200 )
				end,
				function ()
					return self.MarsRemoteMissileTargetWindow0:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.shutdown = function ()
			MarsRemoteMissileTargetWindow0:AnimateSequence( "shutdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.mars.marsRemoteMissileState:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "MarsRemoteMissileTransitionWindow0",
				sequenceName = "Bootup",
				elementPath = "MarsRemoteMissileTransitionWindow0"
			} )
			ACTIONS.AnimateSequence( self, "bootup" )
		end
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "shutdown" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "MarsRemoteMissileTransitionWindow0",
				sequenceName = "Shutdown",
				elementPath = "MarsRemoteMissileTransitionWindow0"
			} )
		end
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) == 5 then
			ACTIONS.AnimateSequence( self, "shutdown" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "MarsRemoteMissileTransitionWindow0",
				sequenceName = "Shutdown",
				elementPath = "MarsRemoteMissileTransitionWindow0"
			} )
		end
	end )
	return self
end

MenuBuilder.registerType( "MarsRemoteMissileMain", MarsRemoteMissileMain )
LockTable( _M )
