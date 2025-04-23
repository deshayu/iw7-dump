local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissileIncomingWarning( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1024 * _1080p, 0, 256 * _1080p )
	self.id = "MissileIncomingWarning"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local MissileIncomingWarningText = nil
	
	MissileIncomingWarningText = MenuBuilder.BuildRegisteredType( "MissileIncomingWarningText", {
		controllerIndex = f1_local1
	} )
	MissileIncomingWarningText.id = "MissileIncomingWarningText"
	MissileIncomingWarningText:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 256 )
	self:addElement( MissileIncomingWarningText )
	self.MissileIncomingWarningText = MissileIncomingWarningText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MissileIncomingWarningText:RegisterAnimationSequence( "ShowWarning", {
			{
				function ()
					return self.MissileIncomingWarningText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MissileIncomingWarningText:SetAlpha( 0.3, 500, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.MissileIncomingWarningText:SetAlpha( 1, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ShowWarning = function ()
			MissileIncomingWarningText:AnimateLoop( "ShowWarning" )
		end
		
		MissileIncomingWarningText:RegisterAnimationSequence( "HideWarning", {
			{
				function ()
					return self.MissileIncomingWarningText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideWarning = function ()
			MissileIncomingWarningText:AnimateSequence( "HideWarning" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.missileWarningVisible:GetModel( f1_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.missileWarningVisible:GetValue( f1_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.missileWarningVisible:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "MissileIncomingWarningText",
				sequenceName = "BlinkText",
				elementPath = "MissileIncomingWarningText"
			} )
			ACTIONS.AnimateSequence( self, "ShowWarning" )
		end
		if DataSources.inGame.MP.scorestreakHuds.missileWarningVisible:GetValue( f1_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.missileWarningVisible:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "MissileIncomingWarningText",
				sequenceName = "EndBlinkText",
				elementPath = "MissileIncomingWarningText"
			} )
			ACTIONS.AnimateSequence( self, "HideWarning" )
		end
	end )
	return self
end

MenuBuilder.registerType( "MissileIncomingWarning", MissileIncomingWarning )
LockTable( _M )
