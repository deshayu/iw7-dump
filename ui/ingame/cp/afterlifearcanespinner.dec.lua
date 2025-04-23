local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = function ( f2_arg0 )
		local f2_local0 = nil
		local f2_local1 = function ()
			f2_arg0:SetZRotation( 0, 0 )
			local f3_local0 = f2_arg0:SetZRotation( 360, 50000 )
			f3_local0.onComplete = f2_local0
		end
		
		f2_local1()
	end
	
end

function AfterLifeArcaneSpinner( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "AfterLifeArcaneSpinner"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local ArcaneCircle = nil
	
	ArcaneCircle = LUI.UIImage.new()
	ArcaneCircle.id = "ArcaneCircle"
	ArcaneCircle:setImage( RegisterMaterial( "zm_powerup_arcane_spinner_alt" ), 0 )
	ArcaneCircle:SetUseAA( true )
	ArcaneCircle:SetBlendMode( BLEND_MODE.addWithAlpha )
	ArcaneCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( ArcaneCircle )
	self.ArcaneCircle = ArcaneCircle
	
	local BlueGlow = nil
	
	BlueGlow = LUI.UIImage.new()
	BlueGlow.id = "BlueGlow"
	BlueGlow:SetScale( 0.25, 0 )
	BlueGlow:setImage( RegisterMaterial( "zm_powerup_glow_element" ), 0 )
	BlueGlow:SetUseAA( true )
	BlueGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	BlueGlow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( BlueGlow )
	self.BlueGlow = BlueGlow
	
	local f4_local5 = nil
	if CONDITIONS.IsRave( self ) then
		f4_local5 = LUI.UIImage.new()
		f4_local5.id = "Ghost"
		f4_local5:setImage( RegisterMaterial( "zm_hud_pixel_skull" ), 0 )
		f4_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 128, _1080p * 384, _1080p * 128, _1080p * 384 )
		f4_local5:BindAlphaToModel( DataSources.inGame.CP.zombies.ghost.ghostAfterLifeIconAlpha:GetModel( f4_local1 ) )
		self:addElement( f4_local5 )
		self.Ghost = f4_local5
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BlueGlow:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.BlueGlow:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BlueGlow:SetAlpha( 0.8, 1500, LUI.EASING.outBack )
				end,
				function ()
					return self.BlueGlow:SetAlpha( 1, 1500, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.BlueGlow:SetScale( 0.25, 0 )
				end,
				function ()
					return self.BlueGlow:SetScale( 0.22, 1500, LUI.EASING.outBack )
				end,
				function ()
					return self.BlueGlow:SetScale( 0.25, 1500, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Loop = function ()
			BlueGlow:AnimateLoop( "Loop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "AfterLifeArcaneSpinner", AfterLifeArcaneSpinner )
LockTable( _M )
