local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MarsRemoteMissleHintText( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 40 * _1080p )
	self.id = "MarsRemoteMissleHintText"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local hint = nil
	
	hint = LUI.UIText.new()
	hint.id = "hint"
	hint:setText( Engine.Localize( "MARSBASE_KILLSTREAK_HINT_TARGET1" ), 0 )
	hint:SetFontSize( 38 * _1080p )
	hint:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	hint:SetAlignment( LUI.Alignment.Center )
	hint:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -19, _1080p * 19 )
	self:addElement( hint )
	self.hint = hint
	
	self._animationSets.DefaultAnimationSet = function ()
		hint:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.hint:SetAlpha( 1, 0 )
				end,
				function ()
					return self.hint:SetAlpha( 0.4, 250 )
				end,
				function ()
					return self.hint:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			hint:AnimateLoop( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "MarsRemoteMissleHintText", MarsRemoteMissleHintText )
LockTable( _M )
