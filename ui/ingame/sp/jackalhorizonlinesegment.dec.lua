local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalHorizonLineSegment( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 280 * _1080p, 0, 16 * _1080p )
	self.id = "JackalHorizonLineSegment"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	Image:setImage( RegisterMaterial( "hud_jackal_artifical_horizon_lines" ), 0 )
	self:addElement( Image )
	self.Image = Image
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.Image:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 600, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 128, _1080p * 128, 0, 0, 0 )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 600, LUI.EASING.inOutBack )
				end
			}
		} )
		self._sequences.bootup = function ()
			Image:AnimateSequence( "bootup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "JackalHorizonLineSegment", JackalHorizonLineSegment )
LockTable( _M )
