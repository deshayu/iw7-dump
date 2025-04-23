local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleHipArms( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ReticleHipArms"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local DottedCircle = nil
	
	DottedCircle = LUI.UIImage.new()
	DottedCircle.id = "DottedCircle"
	DottedCircle:setImage( RegisterMaterial( "hud_reticle_steeldragon_r" ), 0 )
	DottedCircle:SetUseAA( true )
	DottedCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -73, _1080p * 73, _1080p * -73, _1080p * 73 )
	DottedCircle:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( DottedCircle )
	self.DottedCircle = DottedCircle
	
	local ReticleHipArmCrosshairBase = nil
	
	ReticleHipArmCrosshairBase = MenuBuilder.BuildRegisteredType( "ReticleHipArmCrosshairBase", {
		controllerIndex = f1_local1
	} )
	ReticleHipArmCrosshairBase.id = "ReticleHipArmCrosshairBase"
	ReticleHipArmCrosshairBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -70, _1080p * 70, _1080p * -70, _1080p * 70 )
	ReticleHipArmCrosshairBase:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( ReticleHipArmCrosshairBase )
	self.ReticleHipArmCrosshairBase = ReticleHipArmCrosshairBase
	
	local ReticleSpinningDottedCirclePart = nil
	
	ReticleSpinningDottedCirclePart = MenuBuilder.BuildRegisteredType( "ReticleSpinningDottedCirclePart", {
		controllerIndex = f1_local1
	} )
	ReticleSpinningDottedCirclePart.id = "ReticleSpinningDottedCirclePart"
	ReticleSpinningDottedCirclePart.Ring:setImage( RegisterMaterial( "hud_reticle_hip_doublehalfcircle" ), 0 )
	ReticleSpinningDottedCirclePart:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -66, _1080p * 66, _1080p * -66, _1080p * 66 )
	ReticleSpinningDottedCirclePart:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( ReticleSpinningDottedCirclePart )
	self.ReticleSpinningDottedCirclePart = ReticleSpinningDottedCirclePart
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DottedCircle:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.DottedCircle:SetScale( 0.07, 0 )
				end,
				function ()
					return self.DottedCircle:SetScale( 0, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.DottedCircle:SetZRotation( 0, 0 )
				end,
				function ()
					return self.DottedCircle:SetZRotation( -51, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		ReticleHipArmCrosshairBase:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.ReticleHipArmCrosshairBase:SetScale( 0.25, 20 )
				end,
				function ()
					return self.ReticleHipArmCrosshairBase:SetScale( 0, 480, LUI.EASING.outQuartic )
				end
			},
			{
				function ()
					return self.ReticleHipArmCrosshairBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -73, _1080p * 73, _1080p * -73, _1080p * 73, 0 )
				end,
				function ()
					return self.ReticleHipArmCrosshairBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -70, _1080p * 70, _1080p * -70, _1080p * 70, 500, LUI.EASING.outQuartic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			DottedCircle:AnimateSequence( "OnFire" )
			ReticleHipArmCrosshairBase:AnimateSequence( "OnFire" )
		end
		
		ReticleSpinningDottedCirclePart:RegisterAnimationSequence( "OnFireRotate", {
			{
				function ()
					return self.ReticleSpinningDottedCirclePart:SetZRotation( 0, 0 )
				end,
				function ()
					return self.ReticleSpinningDottedCirclePart:SetZRotation( -90, 40, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleSpinningDottedCirclePart:SetZRotation( -180, 960, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.OnFireRotate = function ()
			ReticleSpinningDottedCirclePart:AnimateSequence( "OnFireRotate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
		ACTIONS.AnimateSequence( self, "OnFireRotate" )
	end )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ReticleSpinningDottedCirclePart",
		sequenceName = "Whirlygig",
		elementPath = "ReticleSpinningDottedCirclePart"
	} )
	return self
end

MenuBuilder.registerType( "ReticleHipArms", ReticleHipArms )
LockTable( _M )
