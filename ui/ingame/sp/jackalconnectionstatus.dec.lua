local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalConnectionStatus( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 340 * _1080p, 0, 28 * _1080p )
	self.id = "JackalConnectionStatus"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "jackal_hack_accent_connection" ), 0 )
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 340, _1080p * -14, _1080p * 14 )
	self:addElement( Background )
	self.Background = Background
	
	local ConnectionText = nil
	
	ConnectionText = LUI.UIStyledText.new()
	ConnectionText.id = "ConnectionText"
	ConnectionText:SetRGBFromInt( 0, 0 )
	ConnectionText:setText( ToUpperCase( Engine.Localize( "HUD_CONNECTED" ) ), 0 )
	ConnectionText:SetFontSize( 22 * _1080p )
	ConnectionText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ConnectionText:SetAlignment( LUI.Alignment.Center )
	ConnectionText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 138, _1080p * 340, _1080p * -11, _1080p * 11 )
	self:addElement( ConnectionText )
	self.ConnectionText = ConnectionText
	
	local JackalText = nil
	
	JackalText = LUI.UIStyledText.new()
	JackalText.id = "JackalText"
	JackalText:setText( ToUpperCase( Engine.Localize( "HUD_JACKAL" ) ), 0 )
	JackalText:SetFontSize( 22 * _1080p )
	JackalText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	JackalText:SetAlignment( LUI.Alignment.Center )
	JackalText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 2, _1080p * 138, _1080p * -11, _1080p * 11 )
	self:addElement( JackalText )
	self.JackalText = JackalText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 100 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * -14, _1080p * 14, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * -14, _1080p * 14, 100 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 340, _1080p * -14, _1080p * 14, 200, LUI.EASING.outBack )
				end
			}
		} )
		ConnectionText:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.ConnectionText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ConnectionText:SetAlpha( 0, 100 )
				end,
				function ()
					return self.ConnectionText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.ConnectionText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ConnectionText:SetAlpha( 0, 40 )
				end,
				function ()
					return self.ConnectionText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ConnectionText:SetAlpha( 1, 40 )
				end,
				function ()
					return self.ConnectionText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ConnectionText:SetAlpha( 0, 40 )
				end,
				function ()
					return self.ConnectionText:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.ConnectionText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -32, _1080p * 170, _1080p * -10, _1080p * 10, 0 )
				end,
				function ()
					return self.ConnectionText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -32, _1080p * 170, _1080p * -10, _1080p * 10, 100 )
				end,
				function ()
					return self.ConnectionText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 138, _1080p * 340, _1080p * -10, _1080p * 10, 200, LUI.EASING.outBack )
				end
			}
		} )
		JackalText:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.JackalText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.JackalText:SetAlpha( 0, 100 )
				end,
				function ()
					return self.JackalText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.JackalText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -168, _1080p * -32, _1080p * -10, _1080p * 10, 0 )
				end,
				function ()
					return self.JackalText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -168, _1080p * -32, _1080p * -10, _1080p * 10, 100 )
				end,
				function ()
					return self.JackalText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 2, _1080p * 138, _1080p * -10, _1080p * 10, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Background:AnimateSequence( "Bootup" )
			ConnectionText:AnimateSequence( "Bootup" )
			JackalText:AnimateSequence( "Bootup" )
		end
		
		Background:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 340, _1080p * -14, _1080p * 14, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * -14, _1080p * 14, 200, LUI.EASING.inBack )
				end
			}
		} )
		ConnectionText:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.ConnectionText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ConnectionText:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.ConnectionText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 138, _1080p * 340, _1080p * -10, _1080p * 10, 0 )
				end,
				function ()
					return self.ConnectionText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -32, _1080p * 170, _1080p * -10, _1080p * 10, 200, LUI.EASING.inBack )
				end
			}
		} )
		JackalText:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.JackalText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.JackalText:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.JackalText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 2, _1080p * 138, _1080p * -10, _1080p * 10, 0 )
				end,
				function ()
					return self.JackalText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -168, _1080p * -32, _1080p * -10, _1080p * 10, 200, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			Background:AnimateSequence( "Shutdown" )
			ConnectionText:AnimateSequence( "Shutdown" )
			JackalText:AnimateSequence( "Shutdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "hud_anim_shutdown_off", function ( f43_arg0, f43_arg1 )
		local f43_local0 = f43_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Shutdown" )
	end )
	ACTIONS.AnimateSequence( self, "Bootup" )
	return self
end

MenuBuilder.registerType( "JackalConnectionStatus", JackalConnectionStatus )
LockTable( _M )
