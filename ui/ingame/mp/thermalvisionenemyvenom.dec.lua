local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ThermalVisionEnemyVenom( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ThermalVisionEnemyVenom"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Diamond = nil
	
	Diamond = LUI.UIImage.new()
	Diamond.id = "Diamond"
	Diamond:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	Diamond:setImage( RegisterMaterial( "hud_ss_lockon_default_diamond" ), 0 )
	Diamond:SetBlendMode( BLEND_MODE.addWithAlpha )
	Diamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 53, _1080p * -53, _1080p * 53 )
	self:addElement( Diamond )
	self.Diamond = Diamond
	
	local OuterDiamond = nil
	
	OuterDiamond = LUI.UIImage.new()
	OuterDiamond.id = "OuterDiamond"
	OuterDiamond:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	OuterDiamond:setImage( RegisterMaterial( "hud_ss_lockon_default_diamond" ), 0 )
	OuterDiamond:SetBlendMode( BLEND_MODE.addWithAlpha )
	OuterDiamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -80, _1080p * 80, _1080p * -80, _1080p * 80 )
	self:addElement( OuterDiamond )
	self.OuterDiamond = OuterDiamond
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Diamond:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.Diamond:SetAlpha( 1, 0 )
				end
			}
		} )
		OuterDiamond:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.OuterDiamond:SetAlpha( 0, 0 )
				end,
				function ()
					return self.OuterDiamond:SetAlpha( 1, 250, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.OuterDiamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -253, _1080p * 253, _1080p * -253, _1080p * 253, 0 )
				end,
				function ()
					return self.OuterDiamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 53, _1080p * -53, _1080p * 53, 250, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.OuterDiamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -80, _1080p * 80, _1080p * -80, _1080p * 80, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Animate = function ()
			Diamond:AnimateSequence( "Animate" )
			OuterDiamond:AnimateSequence( "Animate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Animate" )
	return self
end

MenuBuilder.registerType( "ThermalVisionEnemyVenom", ThermalVisionEnemyVenom )
LockTable( _M )
