local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0:SetScale( -0.5 )
end

function JackalDroneMarker( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 270 * _1080p, 0, 270 * _1080p )
	self.id = "JackalDroneMarker"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Message = nil
	
	Message = MenuBuilder.BuildRegisteredType( "JackalDroneMarkerText", {
		controllerIndex = f2_local1
	} )
	Message.id = "Message"
	Message:SetScale( 0.5, 0 )
	Message:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 20 )
	self:addElement( Message )
	self.Message = Message
	
	local MarkerAnim = nil
	
	MarkerAnim = MenuBuilder.BuildRegisteredType( "JackalDroneMarkerAnim", {
		controllerIndex = f2_local1
	} )
	MarkerAnim.id = "MarkerAnim"
	MarkerAnim:SetXRotation( -70, 0 )
	MarkerAnim:SetScale( 0.5, 0 )
	MarkerAnim:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -90, _1080p * 90, _1080p * -64, _1080p * 64 )
	self:addElement( MarkerAnim )
	self.MarkerAnim = MarkerAnim
	
	local ArrowAnime = nil
	
	ArrowAnime = LUI.UIImage.new()
	ArrowAnime.id = "ArrowAnime"
	ArrowAnime:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	ArrowAnime:SetScale( 0.3, 0 )
	ArrowAnime:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_1" ), 0 )
	ArrowAnime:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, _1080p * 31, _1080p * 95 )
	self:addElement( ArrowAnime )
	self.ArrowAnime = ArrowAnime
	
	local Arrow = nil
	
	Arrow = LUI.UIImage.new()
	Arrow.id = "Arrow"
	Arrow:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	Arrow:SetScale( 0.3, 0 )
	Arrow:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_1" ), 0 )
	Arrow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, _1080p * 32, _1080p * 96 )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ArrowAnime:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.ArrowAnime:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ArrowAnime:SetAlpha( 0, 500, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.ArrowAnime:SetAlpha( 0, 600 )
				end
			},
			{
				function ()
					return self.ArrowAnime:SetScale( 0.3, 0 )
				end,
				function ()
					return self.ArrowAnime:SetScale( 0, 500, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.ArrowAnime:SetScale( 0, 600 )
				end
			},
			{
				function ()
					return self.ArrowAnime:SetRGBFromInt( 14411202, 0 )
				end,
				function ()
					return self.ArrowAnime:SetRGBFromTable( SWATCHES.jackal.stable, 320 )
				end,
				function ()
					return self.ArrowAnime:SetRGBFromInt( 16777215, 180, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.ArrowAnime:SetRGBFromInt( 16777215, 600 )
				end
			},
			{
				function ()
					return self.ArrowAnime:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -27, _1080p * 27, _1080p * 39, _1080p * 87, 0 )
				end,
				function ()
					return self.ArrowAnime:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -24, _1080p * 24, _1080p * 235, _1080p * 283, 500, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.ArrowAnime:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -24, _1080p * 24, _1080p * 173, _1080p * 221, 50 )
				end,
				function ()
					return self.ArrowAnime:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -24, _1080p * 24, _1080p * 173, _1080p * 221, 550 )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.Arrow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -27, _1080p * 27, _1080p * 39, _1080p * 87, 0 )
				end,
				function ()
					return self.Arrow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -27, _1080p * 27, _1080p * 27, _1080p * 75, 270, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Arrow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -27, _1080p * 27, _1080p * 39, _1080p * 87, 280, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.Arrow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -27, _1080p * 26, _1080p * 27, _1080p * 75, 269, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Arrow:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -27, _1080p * 27, _1080p * 39, _1080p * 87, 280, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.Loop = function ()
			ArrowAnime:AnimateLoop( "Loop" )
			Arrow:AnimateLoop( "Loop" )
		end
		
		Message:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.Message:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Message:SetAlpha( 0.75, 50 )
				end,
				function ()
					return self.Message:SetAlpha( 1, 50 )
				end
			}
		} )
		MarkerAnim:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.MarkerAnim:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MarkerAnim:SetAlpha( 0.75, 50 )
				end,
				function ()
					return self.MarkerAnim:SetAlpha( 1, 50 )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "Flicker", {
			{
				function ()
					return self.Arrow:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Arrow:SetAlpha( 0.65, 50 )
				end,
				function ()
					return self.Arrow:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.Flicker = function ()
			Message:AnimateLoop( "Flicker" )
			MarkerAnim:AnimateLoop( "Flicker" )
			Arrow:AnimateLoop( "Flicker" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "Loop" )
	ACTIONS.AnimateSequence( self, "Flicker" )
	return self
end

MenuBuilder.registerType( "JackalDroneMarker", JackalDroneMarker )
LockTable( _M )
