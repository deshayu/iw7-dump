local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RemoteControlPanels( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "RemoteControlPanels"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HackVideoFeed = nil
	
	HackVideoFeed = MenuBuilder.BuildRegisteredType( "HackVideoFeed", {
		controllerIndex = f1_local1
	} )
	HackVideoFeed.id = "HackVideoFeed"
	HackVideoFeed:SetAlpha( 0, 0 )
	HackVideoFeed:SetCurvedRenderingX( 0.4 )
	HackVideoFeed:SetCurvedRenderingY( -0.2 )
	HackVideoFeed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 54, _1080p * 304 )
	self:addElement( HackVideoFeed )
	self.HackVideoFeed = HackVideoFeed
	
	local BootUpExpand = nil
	
	BootUpExpand = LUI.UIImage.new()
	BootUpExpand.id = "BootUpExpand"
	BootUpExpand:SetAlpha( 0, 0 )
	BootUpExpand:SetCurvedRenderingX( 0.4 )
	BootUpExpand:SetCurvedRenderingY( -0.2 )
	BootUpExpand:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 960, _1080p * 960, _1080p * 532, _1080p * 548 )
	self:addElement( BootUpExpand )
	self.BootUpExpand = BootUpExpand
	
	local RemoteControlConnectionStatus = nil
	
	RemoteControlConnectionStatus = MenuBuilder.BuildRegisteredType( "RemoteControlConnectionStatus", {
		controllerIndex = f1_local1
	} )
	RemoteControlConnectionStatus.id = "RemoteControlConnectionStatus"
	RemoteControlConnectionStatus:SetAlpha( 0, 0 )
	RemoteControlConnectionStatus.MessageText:setText( Engine.Localize( "MPUI_OPENING_CONNECTION_CAPS" ), 0 )
	RemoteControlConnectionStatus:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 460, _1080p * 1460, _1080p * 274, _1080p * 304 )
	self:addElement( RemoteControlConnectionStatus )
	self.RemoteControlConnectionStatus = RemoteControlConnectionStatus
	
	local RemoteControlFrame = nil
	
	RemoteControlFrame = MenuBuilder.BuildRegisteredType( "RemoteControlFrame", {
		controllerIndex = f1_local1
	} )
	RemoteControlFrame.id = "RemoteControlFrame"
	RemoteControlFrame:SetAlpha( 0, 0 )
	RemoteControlFrame:SetCurvedRenderingX( 0.4 )
	RemoteControlFrame:SetCurvedRenderingY( -0.2 )
	RemoteControlFrame:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -8, _1080p * -8 )
	self:addElement( RemoteControlFrame )
	self.RemoteControlFrame = RemoteControlFrame
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HackVideoFeed:RegisterAnimationSequence( "ShutdownSequence", {
			{
				function ()
					return self.HackVideoFeed:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 1, 320 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 1, 560 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 0, 70 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 1, 50 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 0, 50 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 1, 50 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.HackVideoFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080, 0 )
				end,
				function ()
					return self.HackVideoFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080, 319 )
				end,
				function ()
					return self.HackVideoFeed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 505.8, _1080p * 1414.2, _1080p * 287.67, _1080p * 792.33, 110 )
				end,
				function ()
					return self.HackVideoFeed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 724.8, _1080p * 1195.2, _1080p * 409.33, _1080p * 670.67, 120 )
				end
			}
		} )
		BootUpExpand:RegisterAnimationSequence( "ShutdownSequence", {
			{
				function ()
					return self.BootUpExpand:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.BootUpExpand:SetAlpha( 0, 550 )
				end,
				function ()
					return self.BootUpExpand:SetAlpha( 0.8, 330 )
				end,
				function ()
					return self.BootUpExpand:SetAlpha( 0, 70 )
				end
			},
			{
				function ()
					return self.BootUpExpand:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1026, 0 )
				end,
				function ()
					return self.BootUpExpand:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1026, 280 )
				end,
				function ()
					return self.BootUpExpand:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 532, _1080p * 548, 109 )
				end,
				function ()
					return self.BootUpExpand:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 960, _1080p * 960, _1080p * 532, _1080p * 548, 160 )
				end
			}
		} )
		RemoteControlConnectionStatus:RegisterAnimationSequence( "ShutdownSequence", {
			{
				function ()
					return self.RemoteControlConnectionStatus.MessageText:setText( Engine.Localize( "MPUI_CLOSING_CONNECTION_CAPS" ), 0 )
				end
			},
			{
				function ()
					return self.RemoteControlConnectionStatus:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.RemoteControlConnectionStatus:SetAlpha( 1, 80 )
				end,
				function ()
					return self.RemoteControlConnectionStatus:SetAlpha( 1, 800 )
				end,
				function ()
					return self.RemoteControlConnectionStatus:SetAlpha( 0, 70 )
				end
			}
		} )
		RemoteControlFrame:RegisterAnimationSequence( "ShutdownSequence", {
			{
				function ()
					return self.RemoteControlFrame:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RemoteControlFrame:SetAlpha( 1, 400 )
				end,
				function ()
					return self.RemoteControlFrame:SetAlpha( 0, 160, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.RemoteControlFrame:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -8, _1080p * -8, 0 )
				end,
				function ()
					return self.RemoteControlFrame:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -8, _1080p * -8, 400 )
				end
			}
		} )
		self._sequences.ShutdownSequence = function ()
			HackVideoFeed:AnimateSequence( "ShutdownSequence" )
			BootUpExpand:AnimateSequence( "ShutdownSequence" )
			RemoteControlConnectionStatus:AnimateSequence( "ShutdownSequence" )
			RemoteControlFrame:AnimateSequence( "ShutdownSequence" )
		end
		
		HackVideoFeed:RegisterAnimationSequence( "ConnectingSequence", {
			{
				function ()
					return self.HackVideoFeed:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 0, 250 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 1, 10 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 1, 100 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 1, 10 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 1, 80 )
				end,
				function ()
					return self.HackVideoFeed:SetAlpha( 0, 750 )
				end
			},
			{
				function ()
					return self.HackVideoFeed:SetCurvedRenderingX( 0.4 )
				end
			},
			{
				function ()
					return self.HackVideoFeed:SetCurvedRenderingY( -0.2 )
				end
			},
			{
				function ()
					return self.HackVideoFeed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -465, _1080p * -15, _1080p * 54, _1080p * 304, 259 )
				end,
				function ()
					return self.HackVideoFeed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -465, _1080p * -15, _1080p * 54, _1080p * 304, 100 )
				end,
				function ()
					return self.HackVideoFeed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 54, _1080p * 304, 129 )
				end,
				function ()
					return self.HackVideoFeed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 735, _1080p * 1185, _1080p * 415, _1080p * 665, 99 )
				end,
				function ()
					return self.HackVideoFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080, 410 )
				end
			}
		} )
		BootUpExpand:RegisterAnimationSequence( "ConnectingSequence", {
			{
				function ()
					return self.BootUpExpand:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BootUpExpand:SetAlpha( 0, 490 )
				end,
				function ()
					return self.BootUpExpand:SetAlpha( 0, 220 )
				end,
				function ()
					return self.BootUpExpand:SetAlpha( 0.8, 10 )
				end,
				function ()
					return self.BootUpExpand:SetAlpha( 0, 80 )
				end,
				function ()
					return self.BootUpExpand:SetAlpha( 0.8, 370 )
				end,
				function ()
					return self.BootUpExpand:SetAlpha( 0, 1030 )
				end
			},
			{
				function ()
					return self.BootUpExpand:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 960, _1080p * 960, _1080p * 532, _1080p * 548, 0 )
				end,
				function ()
					return self.BootUpExpand:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 960, _1080p * 960, _1080p * 532, _1080p * 548, 1000 )
				end,
				function ()
					return self.BootUpExpand:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 532, _1080p * 548, 59 )
				end,
				function ()
					return self.BootUpExpand:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1026, 110 )
				end
			}
		} )
		RemoteControlConnectionStatus:RegisterAnimationSequence( "ConnectingSequence", {
			{
				function ()
					return self.RemoteControlConnectionStatus:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RemoteControlConnectionStatus:SetAlpha( 0, 50 )
				end,
				function ()
					return self.RemoteControlConnectionStatus:SetAlpha( 1, 120 )
				end,
				function ()
					return self.RemoteControlConnectionStatus:SetAlpha( 1, 890 )
				end,
				function ()
					return self.RemoteControlConnectionStatus:SetAlpha( 0, 110 )
				end
			},
			{
				function ()
					return self.RemoteControlConnectionStatus.MessageText:setText( Engine.Localize( "MPUI_OPENING_CONNECTION_CAPS" ), 0 )
				end
			},
			{
				function ()
					return self.RemoteControlConnectionStatus:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 960, _1080p * 960, _1080p * 274, _1080p * 304, 730 )
				end,
				function ()
					return self.RemoteControlConnectionStatus:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 457, _1080p * 1463, _1080p * 274, _1080p * 304, 120 )
				end
			}
		} )
		RemoteControlFrame:RegisterAnimationSequence( "ConnectingSequence", {
			{
				function ()
					return self.RemoteControlFrame:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RemoteControlFrame:SetAlpha( 0, 260 )
				end,
				function ()
					return self.RemoteControlFrame:SetAlpha( 1, 240 )
				end,
				function ()
					return self.RemoteControlFrame:SetAlpha( 1, 900 )
				end,
				function ()
					return self.RemoteControlFrame:SetAlpha( 0, 790 )
				end
			},
			{
				function ()
					return self.RemoteControlFrame:SetCurvedRenderingY( -0.2 )
				end
			},
			{
				function ()
					return self.RemoteControlFrame:SetCurvedRenderingX( 0.4 )
				end
			},
			{
				function ()
					return self.RemoteControlFrame:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -8, _1080p * -8, 1399 )
				end
			}
		} )
		self._sequences.ConnectingSequence = function ()
			HackVideoFeed:AnimateSequence( "ConnectingSequence" )
			BootUpExpand:AnimateSequence( "ConnectingSequence" )
			RemoteControlConnectionStatus:AnimateSequence( "ConnectingSequence" )
			RemoteControlFrame:AnimateSequence( "ConnectingSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "RemoteControlPanels", RemoteControlPanels )
LockTable( _M )
