local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalOffscreenIndicatorAlly( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 96 * _1080p, 0, 96 * _1080p )
	self.id = "JackalOffscreenIndicatorAlly"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ArrowMed = nil
	
	ArrowMed = LUI.UIImage.new()
	ArrowMed.id = "ArrowMed"
	ArrowMed:SetScale( 0.5, 0 )
	ArrowMed:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_1_med" ), 0 )
	ArrowMed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -8, _1080p * 56 )
	self:addElement( ArrowMed )
	self.ArrowMed = ArrowMed
	
	local ArrowLg = nil
	
	ArrowLg = LUI.UIImage.new()
	ArrowLg.id = "ArrowLg"
	ArrowLg:SetAlpha( 0.85, 0 )
	ArrowLg:SetScale( 0.75, 0 )
	ArrowLg:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_al" ), 0 )
	ArrowLg:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -43, _1080p * 21 )
	self:addElement( ArrowLg )
	self.ArrowLg = ArrowLg
	
	local ArrowInit = nil
	
	ArrowInit = LUI.UIImage.new()
	ArrowInit.id = "ArrowInit"
	ArrowInit:SetAlpha( 0, 0 )
	ArrowInit:SetScale( 0.75, 0 )
	ArrowInit:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_1" ), 0 )
	ArrowInit:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -44, _1080p * 20 )
	self:addElement( ArrowInit )
	self.ArrowInit = ArrowInit
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ArrowMed:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.ArrowMed:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.ArrowMed:SetAlpha( 1, 420 )
				end,
				function ()
					return self.ArrowMed:SetAlpha( 0.5, 450 )
				end
			},
			{
				function ()
					return self.ArrowMed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -8, _1080p * 56, 0 )
				end
			}
		} )
		ArrowLg:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.ArrowLg:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ArrowLg:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -43, _1080p * 21, 0 )
				end,
				function ()
					return self.ArrowLg:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -58, _1080p * 6, 119 )
				end,
				function ()
					return self.ArrowLg:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -83, _1080p * -19, 399, LUI.EASING.outCubic )
				end,
				function ()
					return self.ArrowLg:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -43, _1080p * 21, 350, LUI.EASING.inCubic )
				end
			}
		} )
		self._sequences.Default = function ()
			ArrowMed:AnimateLoop( "Default" )
			ArrowLg:AnimateLoop( "Default" )
		end
		
		ArrowInit:RegisterAnimationSequence( "InitArrow", {
			{
				function ()
					return self.ArrowInit:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ArrowInit:SetAlpha( 0.85, 80 )
				end,
				function ()
					return self.ArrowInit:SetAlpha( 0.85, 80 )
				end,
				function ()
					return self.ArrowInit:SetAlpha( 0, 30 )
				end,
				function ()
					return self.ArrowInit:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ArrowInit:SetAlpha( 0.85, 80 )
				end,
				function ()
					return self.ArrowInit:SetAlpha( 0.85, 80 )
				end,
				function ()
					return self.ArrowInit:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.ArrowInit:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.ArrowInit:SetRGBFromInt( 16777215, 40 )
				end,
				function ()
					return self.ArrowInit:SetRGBFromTable( SWATCHES.jackal.notification, 120 )
				end,
				function ()
					return self.ArrowInit:SetRGBFromTable( SWATCHES.jackal.notification, 30 )
				end,
				function ()
					return self.ArrowInit:SetRGBFromInt( 16777215, 10 )
				end,
				function ()
					return self.ArrowInit:SetRGBFromInt( 16777215, 50 )
				end,
				function ()
					return self.ArrowInit:SetRGBFromTable( SWATCHES.jackal.notification, 110 )
				end,
				function ()
					return self.ArrowInit:SetRGBFromTable( SWATCHES.jackal.notification, 30 )
				end
			},
			{
				function ()
					return self.ArrowInit:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -448, _1080p * -384, 0 )
				end,
				function ()
					return self.ArrowInit:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -107.79, _1080p * -43.79, 159 )
				end,
				function ()
					return self.ArrowInit:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -44, _1080p * 20, 30 )
				end,
				function ()
					return self.ArrowInit:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -448, _1080p * -384, 10 )
				end,
				function ()
					return self.ArrowInit:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -44, _1080p * 20, 189 )
				end
			}
		} )
		self._sequences.InitArrow = function ()
			ArrowInit:AnimateSequence( "InitArrow" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "pooled_on_allocate", function ( f36_arg0, f36_arg1 )
		local f36_local0 = f36_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "InitArrow" )
	end )
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "JackalOffscreenIndicatorAlly", JackalOffscreenIndicatorAlly )
LockTable( _M )
