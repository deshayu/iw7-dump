local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
end

function HackControlConnectionStatus( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 30 * _1080p )
	self.id = "HackControlConnectionStatus"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 15864081, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local MessageText = nil
	
	MessageText = LUI.UIStyledText.new()
	MessageText.id = "MessageText"
	MessageText:setText( ToUpperCase( Engine.Localize( "HUD_HACK_OPENINING_CONNECTION" ) ), 0 )
	MessageText:SetFontSize( 36 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetDecodeUseSystemTime( false )
	MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -18, _1080p * 18 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.Background:SetAlpha( 0.7, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.4, 300, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.Background:SetAlpha( 0.7, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MessageText:setText( ToUpperCase( Engine.Localize( "HUD_HACK_OPENINING_CONNECTION" ) ), 0 )
				end
			}
		} )
		self._sequences.Loop = function ()
			Background:AnimateLoop( "Loop" )
			MessageText:AnimateLoop( "Loop" )
		end
		
		MessageText:RegisterAnimationSequence( "Lost", {
			{
				function ()
					return self.MessageText:setText( ToUpperCase( Engine.Localize( "HUD_HACK_CONNECTION_LOST" ) ), 0 )
				end
			}
		} )
		self._sequences.Lost = function ()
			MessageText:AnimateSequence( "Lost" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "HackControlConnectionStatus", HackControlConnectionStatus )
LockTable( _M )
