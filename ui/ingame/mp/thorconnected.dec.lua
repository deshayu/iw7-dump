local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ThorConnected( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 340 * _1080p, 0, 28 * _1080p )
	self.id = "ThorConnected"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ThorLabel = nil
	
	ThorLabel = MenuBuilder.BuildRegisteredType( "GenericTextBox", {
		controllerIndex = f1_local1
	} )
	ThorLabel.id = "ThorLabel"
	ThorLabel:SetAlpha( 0, 0 )
	ThorLabel.Box.Fill:SetAlpha( 0.2, 0 )
	ThorLabel.Text:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	ThorLabel.Text:SetScale( 0.7, 0 )
	ThorLabel.Text:setText( ToUpperCase( Engine.Localize( "KILLSTREAKS_THOR" ) ), 0 )
	ThorLabel.Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ThorLabel.Text:SetAlignment( LUI.Alignment.Center )
	ThorLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 115, 0, _1080p * 28 )
	self:addElement( ThorLabel )
	self.ThorLabel = ThorLabel
	
	local ConnectedLabel = nil
	
	ConnectedLabel = MenuBuilder.BuildRegisteredType( "GenericTextBox", {
		controllerIndex = f1_local1
	} )
	ConnectedLabel.id = "ConnectedLabel"
	ConnectedLabel:SetAlpha( 0, 0 )
	ConnectedLabel.Box.Fill:SetAlpha( 0.9, 0 )
	ConnectedLabel.Text:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	ConnectedLabel.Text:SetRGBFromInt( 0, 0 )
	ConnectedLabel.Text:SetScale( 0.7, 0 )
	ConnectedLabel.Text:setText( ToUpperCase( Engine.Localize( "HUD_CONNECTED" ) ), 0 )
	ConnectedLabel.Text:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	ConnectedLabel.Text:SetAlignment( LUI.Alignment.Center )
	ConnectedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 115, _1080p * 340, 0, _1080p * 28 )
	self:addElement( ConnectedLabel )
	self.ConnectedLabel = ConnectedLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ThorLabel:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.ThorLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ThorLabel:SetAlpha( 0, 290 )
				end,
				function ()
					return self.ThorLabel:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.ThorLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -115, 0, 0, _1080p * 28, 0 )
				end,
				function ()
					return self.ThorLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -115, 0, 0, _1080p * 28, 300 )
				end,
				function ()
					return self.ThorLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 115, 0, _1080p * 28, 149 )
				end
			}
		} )
		ConnectedLabel:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 1, 440 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 90 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 1, 90 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 90 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 1, 90 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 90 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.ConnectedLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ConnectedLabel:SetAlpha( 0, 290 )
				end,
				function ()
					return self.ConnectedLabel:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.ConnectedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 225, 0, _1080p * 28, 0 )
				end,
				function ()
					return self.ConnectedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 225, 0, _1080p * 28, 300 )
				end,
				function ()
					return self.ConnectedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 115, _1080p * 340, 0, _1080p * 28, 149 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			ThorLabel:AnimateSequence( "Bootup" )
			ConnectedLabel:AnimateSequence( "Bootup" )
		end
		
		ThorLabel:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.ThorLabel:SetAlpha( 1, 100, LUI.EASING.inBack )
				end,
				function ()
					return self.ThorLabel:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.ThorLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 115, 0, _1080p * 28, 0 )
				end,
				function ()
					return self.ThorLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -340, _1080p * -225, 0, _1080p * 28, 100, LUI.EASING.inBack )
				end
			}
		} )
		ConnectedLabel:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.ConnectedLabel:SetAlpha( 1, 100, LUI.EASING.inBack )
				end,
				function ()
					return self.ConnectedLabel:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.ConnectedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 115, _1080p * 340, 0, _1080p * 28, 0 )
				end,
				function ()
					return self.ConnectedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -225, 0, 0, _1080p * 28, 100, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			ThorLabel:AnimateSequence( "Shutdown" )
			ConnectedLabel:AnimateSequence( "Shutdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "hud_anim_shutdown_off", function ( f39_arg0, f39_arg1 )
		local f39_local0 = f39_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Shutdown" )
	end )
	ACTIONS.AnimateSequence( self, "Bootup" )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ConnectedLabel",
		sequenceName = "Blink_Medium",
		elementPath = ""
	} )
	return self
end

MenuBuilder.registerType( "ThorConnected", ThorConnected )
LockTable( _M )
