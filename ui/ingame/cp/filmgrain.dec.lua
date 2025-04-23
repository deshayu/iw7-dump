local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:registerOmnvarHandler( "zm_ui_dialpad_9", function ( f2_arg0, f2_arg1 )
		if f2_arg1.value == 2 then
			f2_arg0.filmGrain:AnimateSequence( "hide" )
		end
	end )
end

function filmGrain( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "filmGrain"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local filmGrain = nil
	
	filmGrain = LUI.UIImage.new()
	filmGrain.id = "filmGrain"
	filmGrain:SetAlpha( 0.35, 0 )
	filmGrain:setImage( RegisterMaterial( "cp_town_film_grain" ), 0 )
	filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( filmGrain )
	self.filmGrain = filmGrain
	
	self._animationSets.DefaultAnimationSet = function ()
		filmGrain:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080, 19 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080, 569 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1124, _1080p * 796, 0, _1080p * 1080, 80 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1124, _1080p * 796, 0, _1080p * 1080, 300 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1449, _1080p * 3369, 0, _1080p * 1080, 69 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1449, _1080p * 3369, 0, _1080p * 1080, 470 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 698, _1080p * 2618, 0, _1080p * 1080, 60 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 698, _1080p * 2618, 0, _1080p * 1080, 429 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 698, _1080p * 2618, 0, _1080p * 1080, 519 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1124, _1080p * 796, 0, _1080p * 1080, 110 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1124, _1080p * 796, 0, _1080p * 1080, 369 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1124, _1080p * 796, 0, _1080p * 1080, 470 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080, 190 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080, 329 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 177, _1080p * 2097, _1080p * 486, _1080p * 1566, 40 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 177, _1080p * 2097, _1080p * 486, _1080p * 1566, 269 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -634, _1080p * 1286, _1080p * -155, _1080p * 925, 49 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -634, _1080p * 1286, _1080p * -155, _1080p * 925, 250 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1058, _1080p * 2978, _1080p * 326, _1080p * 1406, 59 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1058, _1080p * 2978, _1080p * 326, _1080p * 1406, 320 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1058, _1080p * 2978, _1080p * 326, _1080p * 1406, 289 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -795, _1080p * 1125, _1080p * 404, _1080p * 1484, 19 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -795, _1080p * 1125, _1080p * 404, _1080p * 1484, 179 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -795, _1080p * 1125, _1080p * 404, _1080p * 1484, 180 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -255, _1080p * 1665, _1080p * -296, _1080p * 784, 29 )
				end,
				function ()
					return self.filmGrain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -255, _1080p * 1665, _1080p * -296, _1080p * 784, 250 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			filmGrain:AnimateLoop( "DefaultSequence" )
		end
		
		filmGrain:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.filmGrain:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hide = function ()
			filmGrain:AnimateSequence( "hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "filmGrain", filmGrain )
LockTable( _M )
