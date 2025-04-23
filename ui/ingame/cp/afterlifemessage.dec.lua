local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	
end

function AfterLifeMessage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1200 * _1080p, 0, 30 * _1080p )
	self.id = "AfterLifeMessage"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local MessageText = nil
	
	MessageText = LUI.UIStyledText.new()
	MessageText.id = "MessageText"
	MessageText:setText( "Hello World.", 0 )
	MessageText:SetFontSize( 30 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetShadowMinDistance( -0.2, 0 )
	MessageText:SetShadowMaxDistance( 0.2, 0 )
	MessageText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 30 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MessageText:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.MessageText:SetShadowRGBFromTable( SWATCHES.ZombiesAfterLife.FillColor, 0 )
				end
			},
			{
				function ()
					return self.MessageText:SetShadowMinDistance( -0.2, 0 )
				end,
				function ()
					return self.MessageText:SetShadowMinDistance( -1, 1000 )
				end,
				function ()
					return self.MessageText:SetShadowMinDistance( -0.2, 1000 )
				end
			},
			{
				function ()
					return self.MessageText:SetShadowMaxDistance( 0.2, 0 )
				end,
				function ()
					return self.MessageText:SetShadowMaxDistance( 0.5, 1000 )
				end,
				function ()
					return self.MessageText:SetShadowMaxDistance( 0.2, 1000 )
				end
			}
		} )
		self._sequences.Pulse = function ()
			MessageText:AnimateLoop( "Pulse" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "Pulse" )
	return self
end

MenuBuilder.registerType( "AfterLifeMessage", AfterLifeMessage )
LockTable( _M )
