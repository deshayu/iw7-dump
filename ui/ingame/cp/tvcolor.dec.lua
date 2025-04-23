local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.Text:SetGlitchEnabled( true )
	f1_arg0.Text:SetGlitchEnabled( false )
end

function tvColor( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 58 * _1080p )
	self.id = "tvColor"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local blue = nil
	
	blue = LUI.UIImage.new()
	blue.id = "blue"
	blue:SetRGBFromInt( 2176511, 0 )
	blue:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 200, 0, _1080p * 58 )
	self:addElement( blue )
	self.blue = blue
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Text:SetFontSize( 36 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 200, _1080p * 11, _1080p * 47 )
	self:addElement( Text )
	self.Text = Text
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		blue:RegisterAnimationSequence( "redSlot1", {
			{
				function ()
					return self.blue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301.64, _1080p * 335.64, _1080p * 200, _1080p * 258, 0 )
				end
			}
		} )
		self._sequences.redSlot1 = function ()
			blue:AnimateSequence( "redSlot1" )
		end
		
		blue:RegisterAnimationSequence( "blueSlot1", {
			{
				function ()
					return self.blue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301.64, _1080p * 335.64, _1080p * 123, _1080p * 181, 0 )
				end
			}
		} )
		self._sequences.blueSlot1 = function ()
			blue:AnimateSequence( "blueSlot1" )
		end
		
		blue:RegisterAnimationSequence( "greenSlot1", {
			{
				function ()
					return self.blue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301.64, _1080p * 335.64, _1080p * 199.86, _1080p * 257.86, 0 )
				end
			}
		} )
		self._sequences.greenSlot1 = function ()
			blue:AnimateSequence( "greenSlot1" )
		end
		
		blue:RegisterAnimationSequence( "redSlot2", {
			{
				function ()
					return self.blue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301.64, _1080p * 335.64, _1080p * 272.86, _1080p * 330.86, 0 )
				end
			}
		} )
		self._sequences.redSlot2 = function ()
			blue:AnimateSequence( "redSlot2" )
		end
		
		blue:RegisterAnimationSequence( "blueSlot2", {
			{
				function ()
					return self.blue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301.64, _1080p * 335.64, _1080p * 200, _1080p * 258, 0 )
				end
			}
		} )
		self._sequences.blueSlot2 = function ()
			blue:AnimateSequence( "blueSlot2" )
		end
		
		blue:RegisterAnimationSequence( "greenSlot2", {
			{
				function ()
					return self.blue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301.64, _1080p * 335.64, _1080p * 272.86, _1080p * 330.86, 0 )
				end
			}
		} )
		self._sequences.greenSlot2 = function ()
			blue:AnimateSequence( "greenSlot2" )
		end
		
		blue:RegisterAnimationSequence( "redSlot3", {
			{
				function ()
					return self.blue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301.64, _1080p * 335.64, _1080p * 122.86, _1080p * 180.86, 0 )
				end
			}
		} )
		self._sequences.redSlot3 = function ()
			blue:AnimateSequence( "redSlot3" )
		end
		
		blue:RegisterAnimationSequence( "blueSlot3", {
			{
				function ()
					return self.blue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301.64, _1080p * 335.64, _1080p * 272.86, _1080p * 330.86, 0 )
				end
			}
		} )
		self._sequences.blueSlot3 = function ()
			blue:AnimateSequence( "blueSlot3" )
		end
		
		blue:RegisterAnimationSequence( "greenSlot3", {
			{
				function ()
					return self.blue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301.64, _1080p * 335.64, _1080p * 200, _1080p * 258, 0 )
				end
			}
		} )
		self._sequences.greenSlot3 = function ()
			blue:AnimateSequence( "greenSlot3" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "tvColor", tvColor )
LockTable( _M )
