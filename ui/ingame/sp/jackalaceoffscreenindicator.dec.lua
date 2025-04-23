local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalAceOffscreenIndicator( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "JackalAceOffscreenIndicator"
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
	ArrowMed:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_1_med" ), 0 )
	ArrowMed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -13, _1080p * 51 )
	self:addElement( ArrowMed )
	self.ArrowMed = ArrowMed
	
	local ArrowLg = nil
	
	ArrowLg = LUI.UIImage.new()
	ArrowLg.id = "ArrowLg"
	ArrowLg:SetAlpha( 0.85, 0 )
	ArrowLg:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_ax" ), 0 )
	ArrowLg:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -35, _1080p * 29 )
	self:addElement( ArrowLg )
	self.ArrowLg = ArrowLg
	
	local Diamond = nil
	
	Diamond = LUI.UIImage.new()
	Diamond.id = "Diamond"
	Diamond:SetScale( -0.18, 0 )
	Diamond:setImage( RegisterMaterial( "hud_jackal_callout_node_lg" ), 0 )
	Diamond:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -30.24, _1080p * 30.24, _1080p * -55.24, _1080p * 5.24 )
	self:addElement( Diamond )
	self.Diamond = Diamond
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ArrowMed:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.ArrowMed:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ArrowMed:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.ArrowMed:SetAlpha( 1, 400 )
				end
			}
		} )
		Diamond:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Diamond:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Diamond:SetRGBFromTable( SWATCHES.jackal.caution, 400 )
				end,
				function ()
					return self.Diamond:SetRGBFromInt( 16777215, 400 )
				end
			}
		} )
		self._sequences.Default = function ()
			ArrowMed:AnimateLoop( "Default" )
			Diamond:AnimateLoop( "Default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "JackalAceOffscreenIndicator", JackalAceOffscreenIndicator )
LockTable( _M )
