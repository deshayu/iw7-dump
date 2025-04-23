local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ThermalVisionEnemyVRScope( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 1000 * _1080p )
	self.id = "ThermalVisionEnemyVRScope"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local VertLine = nil
	
	VertLine = LUI.UIImage.new()
	VertLine.id = "VertLine"
	VertLine:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	VertLine:SetAlpha( 0.2, 0 )
	VertLine:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	VertLine:SetVMax( 0.5, 0 )
	VertLine:SetBlendMode( BLEND_MODE.addWithAlpha )
	VertLine:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -2, _1080p * 2, 0, _1080p * 477 )
	self:addElement( VertLine )
	self.VertLine = VertLine
	
	local VertBottom = nil
	
	VertBottom = LUI.UIImage.new()
	VertBottom.id = "VertBottom"
	VertBottom:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	VertBottom:SetAlpha( 0.2, 0 )
	VertBottom:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	VertBottom:SetVMin( 0.5, 0 )
	VertBottom:SetBlendMode( BLEND_MODE.addWithAlpha )
	VertBottom:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -2, _1080p * 2, _1080p * -479, _1080p * -1 )
	self:addElement( VertBottom )
	self.VertBottom = VertBottom
	
	local HorzLeft = nil
	
	HorzLeft = LUI.UIImage.new()
	HorzLeft.id = "HorzLeft"
	HorzLeft:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	HorzLeft:SetAlpha( 0.2, 0 )
	HorzLeft:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	HorzLeft:SetUMin( 0.5, 0 )
	HorzLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	HorzLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 477, 0, _1080p * -2, _1080p * 2 )
	self:addElement( HorzLeft )
	self.HorzLeft = HorzLeft
	
	local HorzRight = nil
	
	HorzRight = LUI.UIImage.new()
	HorzRight.id = "HorzRight"
	HorzRight:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	HorzRight:SetAlpha( 0.2, 0 )
	HorzRight:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	HorzRight:SetUMax( 0.5, 0 )
	HorzRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	HorzRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * -477, _1080p * -2, _1080p * 2 )
	self:addElement( HorzRight )
	self.HorzRight = HorzRight
	
	local DiamondOuter = nil
	
	DiamondOuter = LUI.UIImage.new()
	DiamondOuter.id = "DiamondOuter"
	DiamondOuter:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	DiamondOuter:SetAlpha( 0.6, 0 )
	DiamondOuter:SetZRotation( 180, 0 )
	DiamondOuter:setImage( RegisterMaterial( "hud_ss_lockon_default_diamond_scope" ), 0 )
	DiamondOuter:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -27, _1080p * 27, _1080p * -27, _1080p * 27 )
	self:addElement( DiamondOuter )
	self.DiamondOuter = DiamondOuter
	
	local Brackets = nil
	
	Brackets = LUI.UIImage.new()
	Brackets.id = "Brackets"
	Brackets:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	Brackets:SetAlpha( 0.7, 0 )
	Brackets:SetZRotation( 45, 0 )
	Brackets:setImage( RegisterMaterial( "hud_reticle_udm45epic_b" ), 0 )
	Brackets:SetBlendMode( BLEND_MODE.addWithAlpha )
	Brackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -21, _1080p * 21, _1080p * -21, _1080p * 21 )
	self:addElement( Brackets )
	self.Brackets = Brackets
	
	local DiamondInner = nil
	
	DiamondInner = LUI.UIImage.new()
	DiamondInner.id = "DiamondInner"
	DiamondInner:SetRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	DiamondInner:SetAlpha( 0.8, 0 )
	DiamondInner:SetZRotation( 45, 0 )
	DiamondInner:setImage( RegisterMaterial( "hud_reticle_sniper16b" ), 0 )
	DiamondInner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7 )
	self:addElement( DiamondInner )
	self.DiamondInner = DiamondInner
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DiamondOuter:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.DiamondOuter:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DiamondOuter:SetAlpha( 0.6, 500, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.DiamondOuter:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -101, _1080p * 101, _1080p * -101, _1080p * 101, 0 )
				end,
				function ()
					return self.DiamondOuter:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -27, _1080p * 27, _1080p * -27, _1080p * 27, 500, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Animate = function ()
			DiamondOuter:AnimateSequence( "Animate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Animate" )
	return self
end

MenuBuilder.registerType( "ThermalVisionEnemyVRScope", ThermalVisionEnemyVRScope )
LockTable( _M )
