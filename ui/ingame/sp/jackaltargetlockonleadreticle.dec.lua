local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.jackal.specialistAdsMask
	local f1_local1 = DataSources.inGame.jackal.aimTrackPercent
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local1:GetValue( f1_arg1 ) * f1_local0:GetValue( f1_arg1 )
		f1_arg0.JackalLockOnFrame0:SetAlpha( 1 * f2_local0 * f2_local0, 0 )
		f1_arg0.JackalLockOnFrame0:SetScale( 0.75 * (1 - f2_local0) + 0.28 + -1, 0 )
	end )
end

function JackalTargetLockonLeadReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 48 * _1080p, 0, 48 * _1080p )
	self.id = "JackalTargetLockonLeadReticle"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self.soundSet = "jackal"
	local f3_local2 = self
	local outer = nil
	
	outer = LUI.UIImage.new()
	outer.id = "outer"
	outer:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	outer:SetZRotation( 45, 0 )
	outer:SetScale( 0.46, 0 )
	outer:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_square_med" ), 0 )
	outer:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	outer:BindAlphaToModel( DataSources.inGame.jackal.missileLockTargetLeadAlpha:GetModel( f3_local1 ) )
	self:addElement( outer )
	self.outer = outer
	
	local JackalLockOnFrame0 = nil
	
	JackalLockOnFrame0 = MenuBuilder.BuildRegisteredType( "JackalLockOnFrame", {
		controllerIndex = f3_local1
	} )
	JackalLockOnFrame0.id = "JackalLockOnFrame0"
	JackalLockOnFrame0:SetZRotation( 45, 0 )
	JackalLockOnFrame0:SetScale( -0.72, 0 )
	JackalLockOnFrame0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	self:addElement( JackalLockOnFrame0 )
	self.JackalLockOnFrame0 = JackalLockOnFrame0
	
	local JackalTargetLockonLeadReticleCenter = nil
	
	JackalTargetLockonLeadReticleCenter = MenuBuilder.BuildRegisteredType( "JackalTargetLockonLeadReticleCenter", {
		controllerIndex = f3_local1
	} )
	JackalTargetLockonLeadReticleCenter.id = "JackalTargetLockonLeadReticleCenter"
	JackalTargetLockonLeadReticleCenter:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 24, _1080p * -24, _1080p * 24 )
	JackalTargetLockonLeadReticleCenter:BindAlphaToModel( DataSources.inGame.jackal.missileLockTargetLeadAlpha:GetModel( f3_local1 ) )
	self:addElement( JackalTargetLockonLeadReticleCenter )
	self.JackalTargetLockonLeadReticleCenter = JackalTargetLockonLeadReticleCenter
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		JackalLockOnFrame0:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.JackalLockOnFrame0:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			JackalLockOnFrame0:AnimateSequence( "Default" )
		end
		
		JackalLockOnFrame0:RegisterAnimationSequence( "Dogfight", {
			{
				function ()
					return self.JackalLockOnFrame0:SetScale( 9, 0 )
				end,
				function ()
					return self.JackalLockOnFrame0:SetScale( -0.72, 250, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.JackalLockOnFrame0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.JackalLockOnFrame0:SetAlpha( 1, 250, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.JackalLockOnFrame0:SetZRotation( 180, 0 )
				end,
				function ()
					return self.JackalLockOnFrame0:SetZRotation( 45, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Dogfight = function ()
			JackalLockOnFrame0:AnimateSequence( "Dogfight" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalTargetLockonLeadReticle", JackalTargetLockonLeadReticle )
LockTable( _M )
