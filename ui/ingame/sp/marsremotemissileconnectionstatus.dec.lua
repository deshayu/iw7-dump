local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MarsRemoteMissileConnectionStatus( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 525 * _1080p, 0, 28 * _1080p )
	self.id = "MarsRemoteMissileConnectionStatus"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RemoteMissleLabel = nil
	
	RemoteMissleLabel = MenuBuilder.BuildRegisteredType( "GenericTextBoxAnchoredLabel", {
		controllerIndex = f1_local1
	} )
	RemoteMissleLabel.id = "RemoteMissleLabel"
	RemoteMissleLabel.Box.Fill:SetAlpha( 0.2, 0 )
	RemoteMissleLabel.Text:setText( ToUpperCase( Engine.Localize( "HUD_REMOTE_MISSILE" ) ), 0 )
	RemoteMissleLabel.Text:SetFontSize( 22 * _1080p )
	RemoteMissleLabel.Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RemoteMissleLabel.Text:SetAlignment( LUI.Alignment.Center )
	RemoteMissleLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 300, 0, _1080p * 28 )
	self:addElement( RemoteMissleLabel )
	self.RemoteMissleLabel = RemoteMissleLabel
	
	local ConnectedLabel = nil
	
	ConnectedLabel = MenuBuilder.BuildRegisteredType( "GenericTextBoxAnchoredLabel", {
		controllerIndex = f1_local1
	} )
	ConnectedLabel.id = "ConnectedLabel"
	ConnectedLabel.Box.Fill:SetAlpha( 0.9, 0 )
	ConnectedLabel.Text:SetRGBFromInt( 0, 0 )
	ConnectedLabel.Text:setText( ToUpperCase( Engine.Localize( "HUD_CONNECTED" ) ), 0 )
	ConnectedLabel.Text:SetFontSize( 22 * _1080p )
	ConnectedLabel.Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ConnectedLabel.Text:SetAlignment( LUI.Alignment.Center )
	ConnectedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 300, _1080p * 525, 0, _1080p * 28 )
	self:addElement( ConnectedLabel )
	self.ConnectedLabel = ConnectedLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RemoteMissleLabel:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.RemoteMissleLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RemoteMissleLabel:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.RemoteMissleLabel:SetAlpha( 1, 30 )
				end,
				function ()
					return self.RemoteMissleLabel:SetAlpha( 0, 70 )
				end,
				function ()
					return self.RemoteMissleLabel:SetAlpha( 1, 40 )
				end
			}
		} )
		ConnectedLabel:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.ConnectedLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ConnectedLabel:SetAlpha( 0, 1640 )
				end,
				function ()
					return self.ConnectedLabel:SetAlpha( 1, 40 )
				end,
				function ()
					return self.ConnectedLabel:SetAlpha( 0, 70 )
				end,
				function ()
					return self.ConnectedLabel:SetAlpha( 1, 40 )
				end
			},
			{
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 1640 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 1, 40 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 220 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 1, 20 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 1, 100 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 20 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 110 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 1, 20 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 1, 100 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 20 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 0, 100 )
				end,
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 1, 20 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			RemoteMissleLabel:AnimateSequence( "Bootup" )
			ConnectedLabel:AnimateSequence( "Bootup" )
		end
		
		RemoteMissleLabel:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.RemoteMissleLabel:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RemoteMissleLabel:SetAlpha( 1, 260, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RemoteMissleLabel:SetAlpha( 0.2, 150, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RemoteMissleLabel:SetAlpha( 1, 30, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RemoteMissleLabel:SetAlpha( 0, 50, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RemoteMissleLabel:SetAlpha( 0.8, 20, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RemoteMissleLabel:SetAlpha( 0, 40, LUI.EASING.outQuadratic )
				end
			}
		} )
		ConnectedLabel:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.ConnectedLabel:SetAlpha( 1, 0, LUI.EASING.inBack )
				end,
				function ()
					return self.ConnectedLabel:SetAlpha( 0.2, 160, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.ConnectedLabel:SetAlpha( 1, 30, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.ConnectedLabel:SetAlpha( 0, 50, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.ConnectedLabel:SetAlpha( 0.8, 20, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.ConnectedLabel:SetAlpha( 0, 40, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ConnectedLabel.Text:SetAlpha( 1, 0, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			RemoteMissleLabel:AnimateSequence( "Shutdown" )
			ConnectedLabel:AnimateSequence( "Shutdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.mars.marsRemoteMissileState:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
	end )
	return self
end

MenuBuilder.registerType( "MarsRemoteMissileConnectionStatus", MarsRemoteMissileConnectionStatus )
LockTable( _M )
