local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleBlackhole( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p )
	self.id = "ReticleBlackhole"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Thinring = nil
	
	Thinring = LUI.UIImage.new()
	Thinring.id = "Thinring"
	Thinring:setImage( RegisterMaterial( "hud_reticle_hip_thinring" ), 0 )
	Thinring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -69, _1080p * 69, _1080p * -69, _1080p * 69 )
	Thinring:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( Thinring )
	self.Thinring = Thinring
	
	local ReticleBlackholeParts = nil
	
	ReticleBlackholeParts = MenuBuilder.BuildRegisteredType( "ReticleBlackholeParts", {
		controllerIndex = f1_local1
	} )
	ReticleBlackholeParts.id = "ReticleBlackholeParts"
	ReticleBlackholeParts:SetScale( 0.01, 0 )
	ReticleBlackholeParts.Crosshair:SetScale( 0, 0 )
	ReticleBlackholeParts.DoubleHalfThick:SetScale( 0.07, 0 )
	ReticleBlackholeParts:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	ReticleBlackholeParts:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( ReticleBlackholeParts )
	self.ReticleBlackholeParts = ReticleBlackholeParts
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleBlackholeParts:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.ReticleBlackholeParts.Crosshair:SetScale( 0.01, 0 )
				end,
				function ()
					return self.ReticleBlackholeParts.Crosshair:SetScale( 0.53, 150 )
				end,
				function ()
					return self.ReticleBlackholeParts.Crosshair:SetScale( 0, 550, LUI.EASING.inQuintic )
				end
			},
			{
				function ()
					return self.ReticleBlackholeParts.DoubleHalfThick:SetScale( 0.07, 0 )
				end,
				function ()
					return self.ReticleBlackholeParts.DoubleHalfThick:SetScale( 0.8, 150 )
				end,
				function ()
					return self.ReticleBlackholeParts.DoubleHalfThick:SetScale( 0.07, 550, LUI.EASING.inQuintic )
				end
			},
			{
				function ()
					return self.ReticleBlackholeParts.DoubleHalf:SetScale( 0, 0 )
				end,
				function ()
					return self.ReticleBlackholeParts.DoubleHalf:SetScale( 0.27, 150 )
				end,
				function ()
					return self.ReticleBlackholeParts.DoubleHalf:SetScale( 0, 550, LUI.EASING.inQuintic )
				end
			},
			{
				function ()
					return self.ReticleBlackholeParts.Dots:SetScale( 0, 0 )
				end,
				function ()
					return self.ReticleBlackholeParts.Dots:SetScale( 0.25, 150 )
				end,
				function ()
					return self.ReticleBlackholeParts.Dots:SetScale( 0, 550, LUI.EASING.inQuintic )
				end
			},
			{
				function ()
					return self.ReticleBlackholeParts.Crosshair:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ReticleBlackholeParts.Crosshair:SetAlpha( 1, 50 )
				end,
				function ()
					return self.ReticleBlackholeParts.Crosshair:SetAlpha( 1, 600 )
				end,
				function ()
					return self.ReticleBlackholeParts.Crosshair:SetAlpha( 0, 50, LUI.EASING.inQuintic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			ReticleBlackholeParts:AnimateSequence( "OnFire" )
		end
		
		ReticleBlackholeParts:RegisterAnimationSequence( "OnFirePart2", {
			{
				function ()
					return self.ReticleBlackholeParts:SetZRotation( 0, 0 )
				end,
				function ()
					return self.ReticleBlackholeParts:SetZRotation( -180, 300, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReticleBlackholeParts:SetZRotation( -360, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.OnFirePart2 = function ()
			ReticleBlackholeParts:AnimateSequence( "OnFirePart2" )
		end
		
		Thinring:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Thinring:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.Thinring:SetScale( -0.5, 30 )
				end
			}
		} )
		ReticleBlackholeParts:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ReticleBlackholeParts:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.ReticleBlackholeParts:SetScale( -0.5, 30 )
				end
			}
		} )
		self._sequences.Hide = function ()
			Thinring:AnimateSequence( "Hide" )
			ReticleBlackholeParts:AnimateSequence( "Hide" )
		end
		
		Thinring:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Thinring:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.Thinring:SetScale( 0, 60 )
				end
			}
		} )
		ReticleBlackholeParts:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.ReticleBlackholeParts:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.ReticleBlackholeParts:SetScale( 0.01, 60 )
				end
			}
		} )
		self._sequences.Show = function ()
			Thinring:AnimateSequence( "Show" )
			ReticleBlackholeParts:AnimateSequence( "Show" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
		ACTIONS.AnimateSequence( self, "OnFirePart2" )
	end )
	self:SubscribeToModel( DataSources.inGame.player.inADS:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Hide" )
		end
		if DataSources.inGame.player.inADS:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.inADS:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Show" )
		end
	end )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ReticleBlackholeParts",
		sequenceName = "RotatingParts",
		elementPath = "ReticleBlackholeParts"
	} )
	return self
end

MenuBuilder.registerType( "ReticleBlackhole", ReticleBlackhole )
LockTable( _M )
