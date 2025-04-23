local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleBlackholeADS( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleBlackholeADS"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ThickHalf = nil
	
	ThickHalf = LUI.UIImage.new()
	ThickHalf.id = "ThickHalf"
	ThickHalf:setImage( RegisterMaterial( "hud_reticle_steeldragon" ), 0 )
	ThickHalf:SetUseAA( true )
	self:addElement( ThickHalf )
	self.ThickHalf = ThickHalf
	
	local DoubleHalf = nil
	
	DoubleHalf = LUI.UIImage.new()
	DoubleHalf.id = "DoubleHalf"
	DoubleHalf:setImage( RegisterMaterial( "hud_reticle_hip_doublehalfcircle" ), 0 )
	DoubleHalf:SetUseAA( true )
	DoubleHalf:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3 )
	self:addElement( DoubleHalf )
	self.DoubleHalf = DoubleHalf
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ThickHalf:RegisterAnimationSequence( "Rotate", {
			{
				function ()
					return self.ThickHalf:SetZRotation( 0, 0 )
				end,
				function ()
					return self.ThickHalf:SetZRotation( -180, 3000 )
				end
			}
		} )
		DoubleHalf:RegisterAnimationSequence( "Rotate", {
			{
				function ()
					return self.DoubleHalf:SetZRotation( 0, 0 )
				end,
				function ()
					return self.DoubleHalf:SetZRotation( -179, 3000 )
				end
			}
		} )
		self._sequences.Rotate = function ()
			ThickHalf:AnimateLoop( "Rotate" )
			DoubleHalf:AnimateLoop( "Rotate" )
		end
		
		ThickHalf:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.ThickHalf:SetScale( 0, 0 )
				end,
				function ()
					return self.ThickHalf:SetScale( 0.82, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.ThickHalf:SetScale( 0, 400, LUI.EASING.inQuartic )
				end
			}
		} )
		DoubleHalf:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.DoubleHalf:SetScale( -0.01, 0 )
				end,
				function ()
					return self.DoubleHalf:SetScale( 0.5, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.DoubleHalf:SetScale( 0, 400, LUI.EASING.inQuartic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			ThickHalf:AnimateSequence( "OnFire" )
			DoubleHalf:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ReticleBlackholeADS", ReticleBlackholeADS )
LockTable( _M )
