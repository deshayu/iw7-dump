local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.DamageFeedback )
	local f1_local0 = f1_arg0.DamageFeedback
	local f1_local1 = DataSources.inGame.SP.hackTargetingDamage:GetModel( f1_arg1 )
	f1_local0:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_local0:BindAlphaToModel( f1_local1 )
end

function HackTargetingOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HackTargetingOverlay"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local ReticleAccent = nil
	
	ReticleAccent = MenuBuilder.BuildRegisteredType( "HackTargetingReticleAccent", {
		controllerIndex = f2_local1
	} )
	ReticleAccent.id = "ReticleAccent"
	ReticleAccent:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 400, _1080p * -400, _1080p * -300, _1080p * 300 )
	self:addElement( ReticleAccent )
	self.ReticleAccent = ReticleAccent
	
	local Reticle = nil
	
	Reticle = MenuBuilder.BuildRegisteredType( "HackTargetingReticle", {
		controllerIndex = f2_local1
	} )
	Reticle.id = "Reticle"
	Reticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -215, _1080p * 215, _1080p * -160, _1080p * 160 )
	self:addElement( Reticle )
	self.Reticle = Reticle
	
	local DamageFeedback = nil
	
	DamageFeedback = MenuBuilder.BuildRegisteredType( "HackDamageFeedback", {
		controllerIndex = f2_local1
	} )
	DamageFeedback.id = "DamageFeedback"
	DamageFeedback:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( DamageFeedback )
	self.DamageFeedback = DamageFeedback
	
	local HackingDetailsPanel = nil
	
	HackingDetailsPanel = MenuBuilder.BuildRegisteredType( "HackingDetailsPanel", {
		controllerIndex = f2_local1
	} )
	HackingDetailsPanel.id = "HackingDetailsPanel"
	HackingDetailsPanel:SetAlpha( 0, 0 )
	HackingDetailsPanel:SetYRotation( 25, 0 )
	HackingDetailsPanel:SetGlitchEnabled( true )
	HackingDetailsPanel:SetGlitchAmount( 1, 0 )
	HackingDetailsPanel:SetGlitchBlockWidth( 50, 0 )
	HackingDetailsPanel:SetGlitchBlockHeight( 50, 0 )
	HackingDetailsPanel:SetGlitchDistortionRange( 16, 0 )
	HackingDetailsPanel:SetGlitchScanlinePitch( 1, 0 )
	HackingDetailsPanel:SetGlitchMaskPitch( 1, 0 )
	HackingDetailsPanel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 61, _1080p * 240, _1080p * 840 )
	self:addElement( HackingDetailsPanel )
	self.HackingDetailsPanel = HackingDetailsPanel
	
	local HackingC6Panel = nil
	
	HackingC6Panel = MenuBuilder.BuildRegisteredType( "HackingC6Panel", {
		controllerIndex = f2_local1
	} )
	HackingC6Panel.id = "HackingC6Panel"
	HackingC6Panel:SetAlpha( 0, 0 )
	HackingC6Panel:SetYRotation( -25, 0 )
	HackingC6Panel:SetGlitchEnabled( true )
	HackingC6Panel:SetGlitchAmount( 1, 0 )
	HackingC6Panel:SetGlitchBlockWidth( 50, 0 )
	HackingC6Panel:SetGlitchBlockHeight( 50, 0 )
	HackingC6Panel:SetGlitchDistortionRange( 16, 0 )
	HackingC6Panel:SetGlitchScanlinePitch( 1, 0 )
	HackingC6Panel:SetGlitchMaskPitch( 1, 0 )
	HackingC6Panel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -61, _1080p * -60, _1080p * 240, _1080p * 840 )
	self:addElement( HackingC6Panel )
	self.HackingC6Panel = HackingC6Panel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleAccent:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.ReticleAccent:SetAlpha( 0, 100 )
				end,
				function ()
					return self.ReticleAccent:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ReticleAccent:SetScale( -0.5, 100 )
				end,
				function ()
					return self.ReticleAccent:SetScale( 0, 300, LUI.EASING.outBack )
				end
			}
		} )
		Reticle:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Reticle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Reticle:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Reticle:SetScale( -0.5, 0 )
				end,
				function ()
					return self.Reticle:SetScale( 0, 300, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Intro = function ()
			ReticleAccent:AnimateSequence( "Intro" )
			Reticle:AnimateSequence( "Intro" )
		end
		
		ReticleAccent:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.ReticleAccent:SetAlpha( 1, 100 )
				end,
				function ()
					return self.ReticleAccent:SetAlpha( 0, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ReticleAccent:SetScale( 0, 100 )
				end,
				function ()
					return self.ReticleAccent:SetScale( -0.5, 200, LUI.EASING.outBack )
				end
			}
		} )
		Reticle:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Reticle:SetScale( 0, 100 )
				end,
				function ()
					return self.Reticle:SetScale( -0.5, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Reticle:SetAlpha( 1, 100 )
				end,
				function ()
					return self.Reticle:SetAlpha( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Outro = function ()
			ReticleAccent:AnimateSequence( "Outro" )
			Reticle:AnimateSequence( "Outro" )
		end
		
		HackingDetailsPanel:RegisterAnimationSequence( "Targeting", {
			{
				function ()
					return self.HackingDetailsPanel:SetYRotation( 60, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetYRotation( 25, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetAlpha( 1, 100 )
				end,
				function ()
					return self.HackingDetailsPanel:SetAlpha( 0.75, 100, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchAmount( 1, 100 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchAmount( 0, 60 )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchBlockWidth( 20, 160 )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchBlockHeight( 2, 160 )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchDistortionRange( 4, 160 )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetGlitchScanlinePitch( 55, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchScanlinePitch( 55, 160 )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetGlitchMaskPitch( 45, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchMaskPitch( 45, 160 )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 151, _1080p * 240, _1080p * 840, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 61, _1080p * 240, _1080p * 840, 200, LUI.EASING.outBack )
				end
			}
		} )
		HackingC6Panel:RegisterAnimationSequence( "Targeting", {
			{
				function ()
					return self.HackingC6Panel:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetAlpha( 1, 100 )
				end,
				function ()
					return self.HackingC6Panel:SetAlpha( 0.75, 100, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetYRotation( -60, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetYRotation( -25, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchAmount( 1, 100 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchAmount( 0, 60 )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetGlitchBlockWidth( 15, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchBlockWidth( 20, 160 )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetGlitchBlockHeight( 6, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchBlockHeight( 2, 160 )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetGlitchDistortionRange( 20, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchDistortionRange( 4, 160 )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetGlitchScanlinePitch( 45, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchScanlinePitch( 45, 160 )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetGlitchMaskPitch( 55, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchMaskPitch( 55, 160 )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -151, _1080p * -150, _1080p * 240, _1080p * 840, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -61, _1080p * -60, _1080p * 240, _1080p * 840, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Targeting = function ()
			HackingDetailsPanel:AnimateSequence( "Targeting" )
			HackingC6Panel:AnimateSequence( "Targeting" )
		end
		
		HackingDetailsPanel:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.HackingDetailsPanel:SetYRotation( 25, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetYRotation( 60, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchAmount( 1, 100 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchAmount( 1, 100, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetGlitchBlockWidth( 20, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchBlockWidth( 15, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetGlitchBlockHeight( 2, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchBlockHeight( 6, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetGlitchDistortionRange( 4, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchDistortionRange( 20, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetGlitchScanlinePitch( 55, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchScanlinePitch( 55, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetGlitchMaskPitch( 45, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetGlitchMaskPitch( 45, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetAlpha( 1, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.HackingDetailsPanel:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.HackingDetailsPanel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 61, _1080p * 240, _1080p * 840, 0 )
				end,
				function ()
					return self.HackingDetailsPanel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 151, _1080p * 240, _1080p * 840, 200, LUI.EASING.inBack )
				end
			}
		} )
		HackingC6Panel:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.HackingC6Panel:SetYRotation( -25, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetYRotation( -60, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchAmount( 1, 100 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchAmount( 1, 100, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetGlitchBlockWidth( 20, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchBlockWidth( 15, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetGlitchBlockHeight( 2, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchBlockHeight( 6, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetGlitchDistortionRange( 4, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchDistortionRange( 20, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetGlitchScanlinePitch( 45, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchScanlinePitch( 45, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetGlitchMaskPitch( 55, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetGlitchMaskPitch( 55, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetAlpha( 1, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.HackingC6Panel:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.HackingC6Panel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -61, _1080p * -60, _1080p * 240, _1080p * 840, 0 )
				end,
				function ()
					return self.HackingC6Panel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -151, _1080p * -150, _1080p * 240, _1080p * 840, 200, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.Searching = function ()
			HackingDetailsPanel:AnimateSequence( "Searching" )
			HackingC6Panel:AnimateSequence( "Searching" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.hackTargeting:GetModel( f2_local1 ), function ()
		if DataSources.inGame.SP.hackTargeting:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.hackTargeting:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Outro" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.SP.hackTargetingStatus:GetModel( f2_local1 ), function ()
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f2_local1 ) == "connecting" then
			ACTIONS.AnimateSequence( self, "Targeting" )
		end
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f2_local1 ) == "searching" then
			ACTIONS.AnimateSequence( self, "Searching" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "Intro" )
	return self
end

MenuBuilder.registerType( "HackTargetingOverlay", HackTargetingOverlay )
LockTable( _M )
