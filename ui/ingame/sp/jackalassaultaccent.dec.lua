local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalAssaultAccent( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 36 * _1080p )
	self.id = "JackalAssaultAccent"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local assaultAccentTop = nil
	
	assaultAccentTop = LUI.UIImage.new()
	assaultAccentTop.id = "assaultAccentTop"
	assaultAccentTop:SetAlpha( 0.4, 0 )
	assaultAccentTop:setImage( RegisterMaterial( "hud_jackal_assault_reticule_center_top_accent" ), 0 )
	assaultAccentTop:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -4 )
	self:addElement( assaultAccentTop )
	self.assaultAccentTop = assaultAccentTop
	
	local assaultAccentArrow = nil
	
	assaultAccentArrow = LUI.UIImage.new()
	assaultAccentArrow.id = "assaultAccentArrow"
	assaultAccentArrow:SetAlpha( 0.4, 0 )
	assaultAccentArrow:setImage( RegisterMaterial( "hud_jackal_assault_reticule_arrow" ), 0 )
	assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -8, _1080p * 8, _1080p * -13, _1080p * -5 )
	self:addElement( assaultAccentArrow )
	self.assaultAccentArrow = assaultAccentArrow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		assaultAccentArrow:RegisterAnimationSequence( "loop", {
			{
				function ()
					return self.assaultAccentArrow:SetZRotation( 14, 0 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( 0, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( 6.07, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( 0, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( -14, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( 0, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( 7, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( 0, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( -12, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( 0, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( 6, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( 0, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( -6, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( 0, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetZRotation( 14, 1000 )
				end
			},
			{
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -76, _1080p * -60, _1080p * -3, _1080p * 5, 0 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -8, _1080p * 8, _1080p * -13, _1080p * -5, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -37.47, _1080p * -21.47, _1080p * -8.67, _1080p * -0.67, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -8, _1080p * 8, _1080p * -13, _1080p * -5, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 60, _1080p * 76, _1080p * -3, _1080p * 5, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -8, _1080p * 8, _1080p * -13, _1080p * -5, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -49, _1080p * -33, _1080p * -10, _1080p * -2, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -8, _1080p * 8, _1080p * -13, _1080p * -5, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 32, _1080p * 48, _1080p * -11, _1080p * -3, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -8, _1080p * 8, _1080p * -13, _1080p * -5, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -28, _1080p * -12, _1080p * -12, _1080p * -4, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -8, _1080p * 8, _1080p * -13, _1080p * -5, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 12, _1080p * 28, _1080p * -12, _1080p * -4, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -8, _1080p * 8, _1080p * -13, _1080p * -5, 1000 )
				end,
				function ()
					return self.assaultAccentArrow:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -76, _1080p * -60, _1080p * -3, _1080p * 5, 1000 )
				end
			}
		} )
		self._sequences.loop = function ()
			assaultAccentArrow:AnimateLoop( "loop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "menu_create", function ( f35_arg0, f35_arg1 )
		local f35_local0 = f35_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "loop" )
	end )
	return self
end

MenuBuilder.registerType( "JackalAssaultAccent", JackalAssaultAccent )
LockTable( _M )
