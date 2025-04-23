local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ThermalVisionEnemyApex( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ThermalVisionEnemyApex"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Brackets = nil
	
	Brackets = LUI.UIImage.new()
	Brackets.id = "Brackets"
	Brackets:setImage( RegisterMaterial( "hud_ss_lockon_apex_brackets" ), 0 )
	Brackets:SetBlendMode( BLEND_MODE.addWithAlpha )
	Brackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( Brackets )
	self.Brackets = Brackets
	
	local Diamond = nil
	
	Diamond = LUI.UIImage.new()
	Diamond.id = "Diamond"
	Diamond:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	Diamond:setImage( RegisterMaterial( "hud_ss_lockon_default_diamond" ), 0 )
	Diamond:SetBlendMode( BLEND_MODE.addWithAlpha )
	Diamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( Diamond )
	self.Diamond = Diamond
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Brackets:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.Brackets:SetZRotation( 90, 0 )
				end,
				function ()
					return self.Brackets:SetZRotation( 0, 500, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Brackets:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Brackets:SetAlpha( 1, 500, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Brackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -268, _1080p * 268, _1080p * -268, _1080p * 268, 0 )
				end,
				function ()
					return self.Brackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		Diamond:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.Diamond:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Animate = function ()
			Brackets:AnimateSequence( "Animate" )
			Diamond:AnimateSequence( "Animate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Animate" )
	return self
end

MenuBuilder.registerType( "ThermalVisionEnemyApex", ThermalVisionEnemyApex )
LockTable( _M )
