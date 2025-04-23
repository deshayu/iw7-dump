local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ThermalVisionEnemyLinked( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ThermalVisionEnemyLinked"
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
	Diamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -85, _1080p * 85, _1080p * -85, _1080p * 85 )
	self:addElement( Diamond )
	self.Diamond = Diamond
	
	local Square = nil
	
	Square = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Square.id = "Square"
	Square:SetRGBFromTable( SWATCHES.HUD.enemyTeam, 0 )
	Square:SetBorderThicknessLeft( _1080p * 2, 0 )
	Square:SetBorderThicknessRight( _1080p * 2, 0 )
	Square:SetBorderThicknessTop( _1080p * 2, 0 )
	Square:SetBorderThicknessBottom( _1080p * 2, 0 )
	Square:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( Square )
	self.Square = Square
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Diamond:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.Diamond:SetZRotation( 180, 0 )
				end,
				function ()
					return self.Diamond:SetZRotation( 0, 350, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Diamond:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Diamond:SetAlpha( 1, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Diamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -285, _1080p * 285, _1080p * -285, _1080p * 285, 0 )
				end,
				function ()
					return self.Diamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -45, _1080p * 45, _1080p * -45, _1080p * 45, 349, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.Diamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -85, _1080p * 85, _1080p * -85, _1080p * 85, 150, LUI.EASING.outQuadratic )
				end
			}
		} )
		Square:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.Square:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Square:SetAlpha( 0, 120 )
				end,
				function ()
					return self.Square:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.Square:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2, 129 )
				end,
				function ()
					return self.Square:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 330, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.Animate = function ()
			Diamond:AnimateSequence( "Animate" )
			Square:AnimateSequence( "Animate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Animate" )
	return self
end

MenuBuilder.registerType( "ThermalVisionEnemyLinked", ThermalVisionEnemyLinked )
LockTable( _M )
