local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.ReticleBlackHoleADS:SetBlendMode( BLEND_MODE.addWithAlpha )
end

function ReticleBlackholeADSWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ReticleBlackholeADSWrapper"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Halo = nil
	
	Halo = LUI.UIImage.new()
	Halo.id = "Halo"
	Halo:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	Halo:SetAlpha( 0.6, 0 )
	Halo:setImage( RegisterMaterial( "hud_reticle_hip_gradient_halo" ), 0 )
	Halo:SetBlendMode( BLEND_MODE.addWithAlpha )
	Halo:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 12, _1080p * -12 )
	self:addElement( Halo )
	self.Halo = Halo
	
	local Ring = nil
	
	Ring = LUI.UIImage.new()
	Ring.id = "Ring"
	Ring:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	Ring:SetAlpha( 0.6, 0 )
	Ring:SetScale( -0.04, 0 )
	Ring:setImage( RegisterMaterial( "hud_reticle_hip_thinring" ), 0 )
	Ring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -27, _1080p * 27, _1080p * -27, _1080p * 27 )
	self:addElement( Ring )
	self.Ring = Ring
	
	local RingHighlight = nil
	
	RingHighlight = LUI.UIImage.new()
	RingHighlight.id = "RingHighlight"
	RingHighlight:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	RingHighlight:SetAlpha( 0.6, 0 )
	RingHighlight:SetScale( -0.02, 0 )
	RingHighlight:setImage( RegisterMaterial( "hud_reticle_hip_thinring" ), 0 )
	RingHighlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	RingHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -27, _1080p * 27, _1080p * -27, _1080p * 27 )
	self:addElement( RingHighlight )
	self.RingHighlight = RingHighlight
	
	local ReticleBlackHoleADS = nil
	
	ReticleBlackHoleADS = MenuBuilder.BuildRegisteredType( "ReticleBlackholeADS", {
		controllerIndex = f2_local1
	} )
	ReticleBlackHoleADS.id = "ReticleBlackHoleADS"
	ReticleBlackHoleADS:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	ReticleBlackHoleADS:SetAlpha( 0.6, 0 )
	ReticleBlackHoleADS:SetScale( -0.01, 0 )
	ReticleBlackHoleADS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -31, _1080p * 31, _1080p * -31, _1080p * 31 )
	self:addElement( ReticleBlackHoleADS )
	self.ReticleBlackHoleADS = ReticleBlackHoleADS
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Ring:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.Ring:SetAlpha( 0.3, 60 )
				end
			}
		} )
		RingHighlight:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.RingHighlight:SetAlpha( 0.8, 60 )
				end
			}
		} )
		ReticleBlackHoleADS:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.ReticleBlackHoleADS:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.ReticleBlackHoleADS:SetAlpha( 1, 60 )
				end
			}
		} )
		self._sequences.Flicker = function ()
			Ring:AnimateLoop( "Flicker" )
			RingHighlight:AnimateLoop( "Flicker" )
			ReticleBlackHoleADS:AnimateLoop( "Flicker" )
		end
		
		Ring:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Ring:SetAlpha( 0, 60 )
				end
			}
		} )
		RingHighlight:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.RingHighlight:SetAlpha( 0, 60 )
				end
			}
		} )
		ReticleBlackHoleADS:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ReticleBlackHoleADS:SetAlpha( 0, 60 )
				end
			}
		} )
		self._sequences.Hide = function ()
			Ring:AnimateSequence( "Hide" )
			RingHighlight:AnimateSequence( "Hide" )
			ReticleBlackHoleADS:AnimateSequence( "Hide" )
		end
		
		Halo:RegisterAnimationSequence( "OnFire3", {
			{
				function ()
					return self.Halo:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.Halo:SetAlpha( 1, 300 )
				end,
				function ()
					return self.Halo:SetAlpha( 0.6, 510 )
				end
			}
		} )
		ReticleBlackHoleADS:RegisterAnimationSequence( "OnFire3", {
			{
				function ()
					return self.ReticleBlackHoleADS:SetZRotation( 0, 0 )
				end,
				function ()
					return self.ReticleBlackHoleADS:SetZRotation( -90, 300 )
				end,
				function ()
					return self.ReticleBlackHoleADS:SetZRotation( -180, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.OnFire3 = function ()
			Halo:AnimateSequence( "OnFire3" )
			ReticleBlackHoleADS:AnimateSequence( "OnFire3" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f2_local1 ), function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "ReticleBlackHoleADS",
			sequenceName = "OnFire",
			elementPath = "ReticleBlackHoleADS"
		} )
		ACTIONS.AnimateSequence( self, "OnFire3" )
	end )
	self:SubscribeToModel( DataSources.inGame.player.inADS:GetModel( f2_local1 ), function ()
		if DataSources.inGame.player.inADS:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Flicker" )
		end
		if DataSources.inGame.player.inADS:GetValue( f2_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f2_local1 ) ~= true then
			ACTIONS.AnimateSequence( self, "Hide" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ReticleBlackHoleADS",
		sequenceName = "Rotate",
		elementPath = "ReticleBlackHoleADS"
	} )
	return self
end

MenuBuilder.registerType( "ReticleBlackholeADSWrapper", ReticleBlackholeADSWrapper )
LockTable( _M )
