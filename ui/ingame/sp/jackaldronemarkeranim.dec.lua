local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalDroneMarkerAnim( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 180 * _1080p, 0, 180 * _1080p )
	self.id = "JackalDroneMarkerAnim"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RingAnime = nil
	
	RingAnime = LUI.UIImage.new()
	RingAnime.id = "RingAnime"
	RingAnime:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	RingAnime:setImage( RegisterMaterial( "hud_jackal_interior_main_map_circle" ), 0 )
	RingAnime:SetUseAA( true )
	RingAnime:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( RingAnime )
	self.RingAnime = RingAnime
	
	local Ring = nil
	
	Ring = LUI.UIImage.new()
	Ring.id = "Ring"
	Ring:SetRGBFromInt( 3897489, 0 )
	Ring:SetDepth( -2, 0 )
	Ring:setImage( RegisterMaterial( "hud_jackal_blur_accent" ), 0 )
	Ring:SetUseAA( true )
	Ring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -66, _1080p * 66, _1080p * -66, _1080p * 66 )
	self:addElement( Ring )
	self.Ring = Ring
	
	local ringInner = nil
	
	ringInner = LUI.UIImage.new()
	ringInner.id = "ringInner"
	ringInner:SetRGBFromTable( SWATCHES.jackal.incomingDrone, 0 )
	ringInner:setImage( RegisterMaterial( "hud_jackal_interior_main_map_circle" ), 0 )
	ringInner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( ringInner )
	self.ringInner = ringInner
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RingAnime:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.RingAnime:SetScale( 0, 0 )
				end,
				function ()
					return self.RingAnime:SetScale( -0.65, 780 )
				end,
				function ()
					return self.RingAnime:SetScale( -1, 320 )
				end
			},
			{
				function ()
					return self.RingAnime:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RingAnime:SetAlpha( 0, 780 )
				end,
				function ()
					return self.RingAnime:SetAlpha( 0, 320 )
				end
			},
			{
				function ()
					return self.RingAnime:SetDepth( 0, 0 )
				end,
				function ()
					return self.RingAnime:SetDepth( 65, 780 )
				end,
				function ()
					return self.RingAnime:SetDepth( 100, 320 )
				end
			},
			{
				function ()
					return self.RingAnime:SetRGBFromInt( 14411202, 0 )
				end,
				function ()
					return self.RingAnime:SetRGBFromTable( SWATCHES.jackal.stable, 370 )
				end,
				function ()
					return self.RingAnime:SetRGBFromTable( SWATCHES.jackal.stable, 410 )
				end,
				function ()
					return self.RingAnime:SetRGBFromTable( SWATCHES.jackal.stable, 320 )
				end
			}
		} )
		self._sequences.Loop = function ()
			RingAnime:AnimateLoop( "Loop" )
		end
		
		Ring:RegisterAnimationSequence( "spin", {
			{
				function ()
					return self.Ring:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Ring:SetZRotation( 360, 2000 )
				end
			}
		} )
		self._sequences.spin = function ()
			Ring:AnimateLoop( "spin" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Loop" )
	ACTIONS.AnimateSequence( self, "spin" )
	return self
end

MenuBuilder.registerType( "JackalDroneMarkerAnim", JackalDroneMarkerAnim )
LockTable( _M )
