local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleBlackholeParts( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ReticleBlackholeParts"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Crosshair = nil
	
	Crosshair = LUI.UIImage.new()
	Crosshair.id = "Crosshair"
	Crosshair:SetAlpha( 0, 0 )
	Crosshair:SetScale( 0.07, 0 )
	Crosshair:setImage( RegisterMaterial( "hud_reticle_steeldragon" ), 0 )
	Crosshair:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( Crosshair )
	self.Crosshair = Crosshair
	
	local DoubleHalfThick = nil
	
	DoubleHalfThick = LUI.UIImage.new()
	DoubleHalfThick.id = "DoubleHalfThick"
	DoubleHalfThick:SetZRotation( -179, 0 )
	DoubleHalfThick:SetScale( 0.08, 0 )
	DoubleHalfThick:setImage( RegisterMaterial( "hud_reticle_hip_doublehalfcircle_thick" ), 0 )
	DoubleHalfThick:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -19, _1080p * 19, _1080p * -19, _1080p * 19 )
	self:addElement( DoubleHalfThick )
	self.DoubleHalfThick = DoubleHalfThick
	
	local DoubleHalf = nil
	
	DoubleHalf = LUI.UIImage.new()
	DoubleHalf.id = "DoubleHalf"
	DoubleHalf:setImage( RegisterMaterial( "hud_reticle_hip_doublehalfcircle" ), 0 )
	DoubleHalf:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -6, _1080p * 6, _1080p * -6, _1080p * 6 )
	self:addElement( DoubleHalf )
	self.DoubleHalf = DoubleHalf
	
	local Dots = nil
	
	Dots = LUI.UIImage.new()
	Dots.id = "Dots"
	Dots:setImage( RegisterMaterial( "hud_reticle_steeldragon_r" ), 0 )
	Dots:SetUseAA( true )
	Dots:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3 )
	self:addElement( Dots )
	self.Dots = Dots
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Crosshair:RegisterAnimationSequence( "RotatingParts", {
			{
				function ()
					return self.Crosshair:SetZRotation( 22, 0 )
				end,
				function ()
					return self.Crosshair:SetZRotation( -157, 4000 )
				end
			}
		} )
		DoubleHalfThick:RegisterAnimationSequence( "RotatingParts", {
			{
				function ()
					return self.DoubleHalfThick:SetZRotation( 0, 0 )
				end,
				function ()
					return self.DoubleHalfThick:SetZRotation( -179, 8000 )
				end
			}
		} )
		DoubleHalf:RegisterAnimationSequence( "RotatingParts", {
			{
				function ()
					return self.DoubleHalf:SetZRotation( 0, 0 )
				end,
				function ()
					return self.DoubleHalf:SetZRotation( -179, 2000 )
				end
			}
		} )
		Dots:RegisterAnimationSequence( "RotatingParts", {
			{
				function ()
					return self.Dots:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Dots:SetZRotation( 6, 500 )
				end
			}
		} )
		self._sequences.RotatingParts = function ()
			Crosshair:AnimateLoop( "RotatingParts" )
			DoubleHalfThick:AnimateLoop( "RotatingParts" )
			DoubleHalf:AnimateLoop( "RotatingParts" )
			Dots:AnimateLoop( "RotatingParts" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ReticleBlackholeParts", ReticleBlackholeParts )
LockTable( _M )
