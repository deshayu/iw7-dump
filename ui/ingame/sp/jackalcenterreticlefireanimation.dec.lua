local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.isFiring:GetModel( f1_arg1 ), function ()
		local f2_local0 = function ( f3_arg0, f3_arg1 )
			local f3_local0 = f3_arg1.controller or controller
			if DataSources.inGame.jackal.isFiring:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.isFiring:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequence( f1_arg0, "isFiring" )
			end
			if DataSources.inGame.jackal.isFiring:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.isFiring:GetValue( f1_arg1 ) == false then
				ACTIONS.AnimateSequence( f1_arg0, "isNotFiring" )
			end
		end
		
		f2_local0( f1_arg0, {
			name = "datasource_event"
		} )
	end, true )
end

function JackalCenterReticleFireAnimation( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 188 * _1080p, 0, 188 * _1080p )
	self.id = "JackalCenterReticleFireAnimation"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local CenterReticle = nil
	
	CenterReticle = MenuBuilder.BuildRegisteredType( "JackalCenterReticle", {
		controllerIndex = f4_local1
	} )
	CenterReticle.id = "CenterReticle"
	CenterReticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -94, _1080p * 94, _1080p * -94, _1080p * 94 )
	self:addElement( CenterReticle )
	self.CenterReticle = CenterReticle
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CenterReticle:RegisterAnimationSequence( "isFiring", {
			{
				function ()
					return self.CenterReticle:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.CenterReticle:SetAlpha( 0.5, 230, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.CenterReticle:SetScale( 0, 0 )
				end,
				function ()
					return self.CenterReticle:SetScale( 0.25, 230, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.isFiring = function ()
			CenterReticle:AnimateSequence( "isFiring" )
		end
		
		CenterReticle:RegisterAnimationSequence( "isNotFiring", {
			{
				function ()
					return self.CenterReticle:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.CenterReticle:SetAlpha( 0.75, 280, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.CenterReticle:SetScale( 0.2, 0 )
				end,
				function ()
					return self.CenterReticle:SetScale( 0, 280, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.isNotFiring = function ()
			CenterReticle:AnimateSequence( "isNotFiring" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalCenterReticleFireAnimation", JackalCenterReticleFireAnimation )
LockTable( _M )
