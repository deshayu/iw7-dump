local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.JackalOuterReticle
	if f1_local1 then
		f1_local1 = f1_arg0.JackalArtificalHorizon
		if f1_local1 then
			f1_local1 = f1_arg0.JackalCenterReticle and f1_arg0.JackalAltimeters
		end
	end
	f1_local0( f1_local1, "WARNING: Jackal reticle items are missing..." )
	f1_local0 = DataSources.inGame.jackal.showHorizon
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		if f1_local0:GetValue( f1_arg1 ) then
			ACTIONS.AnimateSequence( f1_arg0, "HorizonVisible" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "HorizonHidden" )
		end
	end )
	f1_arg0:addEventHandler( "hud_anim_shutdown_off", function ( f3_arg0, f3_arg1 )
		f1_arg0:SetAlpha( 0, 500 )
	end )
	f1_arg0:addEventHandler( "hud_anim_immediate_on", function ( f4_arg0, f4_arg1 )
		f1_arg0:SetAlpha( 1 )
	end )
end

function JackalReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1440 * _1080p, 0, 1080 * _1080p )
	self.id = "JackalReticle"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local JackalOuterReticle = nil
	
	JackalOuterReticle = MenuBuilder.BuildRegisteredType( "JackalOuterReticle", {
		controllerIndex = f5_local1
	} )
	JackalOuterReticle.id = "JackalOuterReticle"
	JackalOuterReticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -640, _1080p * 640, _1080p * -275, _1080p * 275 )
	self:addElement( JackalOuterReticle )
	self.JackalOuterReticle = JackalOuterReticle
	
	local JackalCenterReticle = nil
	
	JackalCenterReticle = MenuBuilder.BuildRegisteredType( "JackalCenterReticleFireAlphaTesting", {
		controllerIndex = f5_local1
	} )
	JackalCenterReticle.id = "JackalCenterReticle"
	JackalCenterReticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -94, _1080p * 94, _1080p * -94, _1080p * 94 )
	self:addElement( JackalCenterReticle )
	self.JackalCenterReticle = JackalCenterReticle
	
	local JackalAltimeters = nil
	
	JackalAltimeters = MenuBuilder.BuildRegisteredType( "JackalAltimeters", {
		controllerIndex = f5_local1
	} )
	JackalAltimeters.id = "JackalAltimeters"
	JackalAltimeters:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -510, _1080p * 510, _1080p * -141, _1080p * 159 )
	self:addElement( JackalAltimeters )
	self.JackalAltimeters = JackalAltimeters
	
	local JackalArtificalHorizon = nil
	
	JackalArtificalHorizon = MenuBuilder.BuildRegisteredType( "JackalArtificalHorizon", {
		controllerIndex = f5_local1
	} )
	JackalArtificalHorizon.id = "JackalArtificalHorizon"
	JackalArtificalHorizon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -560, _1080p * 560, _1080p * -8, _1080p * 8 )
	JackalArtificalHorizon:BindZRotationToModel( DataSources.inGame.jackal.roll:GetModel( f5_local1 ) )
	self:addElement( JackalArtificalHorizon )
	self.JackalArtificalHorizon = JackalArtificalHorizon
	
	local JackalLockBroke = nil
	
	JackalLockBroke = MenuBuilder.BuildRegisteredType( "JackalLockBroke", {
		controllerIndex = f5_local1
	} )
	JackalLockBroke.id = "JackalLockBroke"
	JackalLockBroke:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * 75, _1080p * 110, _1080p * 130 )
	self:addElement( JackalLockBroke )
	self.JackalLockBroke = JackalLockBroke
	
	local LockonLost = nil
	
	LockonLost = MenuBuilder.BuildRegisteredType( "JackalTargetLockonLost", {
		controllerIndex = f5_local1
	} )
	LockonLost.id = "LockonLost"
	LockonLost:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	self:addElement( LockonLost )
	self.LockonLost = LockonLost
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		JackalAltimeters:RegisterAnimationSequence( "HorizonVisible", {
			{
				function ()
					return self.JackalAltimeters:SetAlpha( 1, 300 )
				end
			}
		} )
		JackalArtificalHorizon:RegisterAnimationSequence( "HorizonVisible", {
			{
				function ()
					return self.JackalArtificalHorizon:SetAlpha( 1, 300 )
				end
			}
		} )
		self._sequences.HorizonVisible = function ()
			JackalAltimeters:AnimateSequence( "HorizonVisible" )
			JackalArtificalHorizon:AnimateSequence( "HorizonVisible" )
		end
		
		JackalAltimeters:RegisterAnimationSequence( "HorizonHidden", {
			{
				function ()
					return self.JackalAltimeters:SetAlpha( 0, 300 )
				end
			}
		} )
		JackalArtificalHorizon:RegisterAnimationSequence( "HorizonHidden", {
			{
				function ()
					return self.JackalArtificalHorizon:SetAlpha( 0, 300 )
				end
			}
		} )
		self._sequences.HorizonHidden = function ()
			JackalAltimeters:AnimateSequence( "HorizonHidden" )
			JackalArtificalHorizon:AnimateSequence( "HorizonHidden" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalReticle", JackalReticle )
LockTable( _M )
