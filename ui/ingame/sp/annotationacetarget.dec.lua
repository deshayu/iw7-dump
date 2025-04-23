local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AnnotationAceTarget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "AnnotationAceTarget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local diamond = nil
	
	diamond = LUI.UIImage.new()
	diamond.id = "diamond"
	diamond:SetScale( -0.71, 0 )
	diamond:setImage( RegisterMaterial( "hud_jackal_callout_node" ), 0 )
	diamond:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -15.5, _1080p * -15.5 )
	self:addElement( diamond )
	self.diamond = diamond
	
	local caret = nil
	
	caret = LUI.UIImage.new()
	caret.id = "caret"
	caret:SetAlpha( 0.85, 0 )
	caret:SetScale( -0.4, 0 )
	caret:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_ax_sm" ), 0 )
	caret:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -12, _1080p * -12 )
	self:addElement( caret )
	self.caret = caret
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		diamond:RegisterAnimationSequence( "onscreen", {
			{
				function ()
					return self.diamond:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.diamond:SetRGBFromTable( SWATCHES.jackal.caution, 400 )
				end,
				function ()
					return self.diamond:SetRGBFromInt( 16777215, 400 )
				end
			},
			{
				function ()
					return self.diamond:SetAlpha( 1, 0 )
				end
			}
		} )
		caret:RegisterAnimationSequence( "onscreen", {
			{
				function ()
					return self.caret:SetAlpha( 0.84, 0 )
				end
			},
			{
				function ()
					return self.caret:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_ax_sm" ), 0 )
				end
			},
			{
				function ()
					return self.caret:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.caret:SetScale( -0.4, 0 )
				end
			}
		} )
		self._sequences.onscreen = function ()
			diamond:AnimateLoop( "onscreen" )
			caret:AnimateLoop( "onscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "onscreen" )
	return self
end

MenuBuilder.registerType( "AnnotationAceTarget", AnnotationAceTarget )
LockTable( _M )
