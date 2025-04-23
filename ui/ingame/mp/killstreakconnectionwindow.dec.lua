local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function KillstreakConnectionWindow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 320 * _1080p, 0, 240 * _1080p )
	self.id = "KillstreakConnectionWindow"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:SetRGBFromInt( 10737478, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Label0 = nil
	
	Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:setText( "inactive", 0 )
	Label0:SetFontSize( 45 * _1080p )
	Label0:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Label0:SetAlignment( LUI.Alignment.Center )
	Label0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -160, _1080p * 160, _1080p * -22.5, _1080p * 22.5 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Label0:RegisterAnimationSequence( "Inactive", {
			{
				function ()
					return self.Label0:setText( "inactive", 0 )
				end
			}
		} )
		self._sequences.Inactive = function ()
			Label0:AnimateSequence( "Inactive" )
		end
		
		Label0:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.Label0:setText( "ready", 0 )
				end
			}
		} )
		self._sequences.Ready = function ()
			Label0:AnimateSequence( "Ready" )
		end
		
		Label0:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.Label0:setText( "connecting", 0 )
				end
			}
		} )
		self._sequences.Connecting = function ()
			Label0:AnimateSequence( "Connecting" )
		end
		
		Label0:RegisterAnimationSequence( "Connected", {
			{
				function ()
					return self.Label0:setText( "connected", 0 )
				end
			}
		} )
		self._sequences.Connected = function ()
			Label0:AnimateSequence( "Connected" )
		end
		
		Label0:RegisterAnimationSequence( "Disconnecting", {
			{
				function ()
					return self.Label0:setText( "disconnecting", 0 )
				end
			}
		} )
		self._sequences.Disconnecting = function ()
			Label0:AnimateSequence( "Disconnecting" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "killstreak_connection_inactive", function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Inactive" )
	end )
	self:addEventHandler( "killstreak_connection_ready", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Ready" )
	end )
	self:addEventHandler( "killstreak_connection_connecting", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Connecting" )
	end )
	self:addEventHandler( "killstreak_connection_connected", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Connected" )
	end )
	self:addEventHandler( "killstreak_connection_disconnecting", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Disconnecting" )
	end )
	return self
end

MenuBuilder.registerType( "KillstreakConnectionWindow", KillstreakConnectionWindow )
LockTable( _M )
