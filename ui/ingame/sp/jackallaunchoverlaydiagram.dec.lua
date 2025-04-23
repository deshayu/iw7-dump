local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.launchGForce:GetModel( f1_arg1 ), function ()
		f1_arg0.GForceNumberLabel:setText( math.ceil( DataSources.inGame.jackal.launchGForce:GetValue( f1_arg1 ) ) )
	end, false )
end

function JackalLaunchOverlayDiagram( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 512 * _1080p )
	self.id = "JackalLaunchOverlayDiagram"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local DiagramAtmos = nil
	
	DiagramAtmos = LUI.UIImage.new()
	DiagramAtmos.id = "DiagramAtmos"
	DiagramAtmos:SetAlpha( 0.4, 0 )
	DiagramAtmos:setImage( RegisterMaterial( "hud_jackal_launch_diagram_atmos" ), 0 )
	DiagramAtmos:SetBlendMode( BLEND_MODE.addWithAlpha )
	DiagramAtmos:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 256, 0, _1080p * 512 )
	self:addElement( DiagramAtmos )
	self.DiagramAtmos = DiagramAtmos
	
	local DiagramLaunch = nil
	
	DiagramLaunch = LUI.UIImage.new()
	DiagramLaunch.id = "DiagramLaunch"
	DiagramLaunch:SetAlpha( 0.4, 0 )
	DiagramLaunch:setImage( RegisterMaterial( "hud_jackal_launch_diagram_launch" ), 0 )
	DiagramLaunch:SetBlendMode( BLEND_MODE.addWithAlpha )
	DiagramLaunch:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 256, 0, _1080p * 512 )
	self:addElement( DiagramLaunch )
	self.DiagramLaunch = DiagramLaunch
	
	local DiagramSpace = nil
	
	DiagramSpace = LUI.UIImage.new()
	DiagramSpace.id = "DiagramSpace"
	DiagramSpace:SetAlpha( 0.4, 0 )
	DiagramSpace:setImage( RegisterMaterial( "hud_jackal_launch_diagram_space" ), 0 )
	DiagramSpace:SetBlendMode( BLEND_MODE.addWithAlpha )
	DiagramSpace:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 256, 0, _1080p * 512 )
	self:addElement( DiagramSpace )
	self.DiagramSpace = DiagramSpace
	
	local DiagramAtmosFlash = nil
	
	DiagramAtmosFlash = LUI.UIImage.new()
	DiagramAtmosFlash.id = "DiagramAtmosFlash"
	DiagramAtmosFlash:SetAlpha( 0.6, 0 )
	DiagramAtmosFlash:setImage( RegisterMaterial( "hud_jackal_launch_diagram_atmos_flash" ), 0 )
	DiagramAtmosFlash:SetBlendMode( BLEND_MODE.addWithAlpha )
	DiagramAtmosFlash:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 256, _1080p * 194, _1080p * 450 )
	self:addElement( DiagramAtmosFlash )
	self.DiagramAtmosFlash = DiagramAtmosFlash
	
	local DiagramLaunchFlash = nil
	
	DiagramLaunchFlash = LUI.UIImage.new()
	DiagramLaunchFlash.id = "DiagramLaunchFlash"
	DiagramLaunchFlash:SetAlpha( 0.6, 0 )
	DiagramLaunchFlash:setImage( RegisterMaterial( "hud_jackal_launch_diagram_launch_flash" ), 0 )
	DiagramLaunchFlash:SetBlendMode( BLEND_MODE.addWithAlpha )
	DiagramLaunchFlash:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 256, _1080p * 256, _1080p * 512 )
	self:addElement( DiagramLaunchFlash )
	self.DiagramLaunchFlash = DiagramLaunchFlash
	
	local DiagramSpaceFlash = nil
	
	DiagramSpaceFlash = LUI.UIImage.new()
	DiagramSpaceFlash.id = "DiagramSpaceFlash"
	DiagramSpaceFlash:SetAlpha( 0.6, 0 )
	DiagramSpaceFlash:setImage( RegisterMaterial( "hud_jackal_launch_diagram_space_flash" ), 0 )
	DiagramSpaceFlash:SetBlendMode( BLEND_MODE.addWithAlpha )
	DiagramSpaceFlash:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 256, _1080p * 256, _1080p * 512 )
	self:addElement( DiagramSpaceFlash )
	self.DiagramSpaceFlash = DiagramSpaceFlash
	
	local KMhNumberLabel = nil
	
	KMhNumberLabel = LUI.UIText.new()
	KMhNumberLabel.id = "KMhNumberLabel"
	KMhNumberLabel:SetAlpha( 0.6, 0 )
	KMhNumberLabel:SetFontSize( 38 * _1080p )
	KMhNumberLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KMhNumberLabel:SetAlignment( LUI.Alignment.Right )
	KMhNumberLabel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -63.26, _1080p * -86.26, _1080p * -16.73, _1080p * 21.27 )
	KMhNumberLabel:SubscribeToModel( DataSources.inGame.jackal.launchSpeed:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.jackal.launchSpeed:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			KMhNumberLabel:setText( f4_local0, 0 )
		end
	end )
	self:addElement( KMhNumberLabel )
	self.KMhNumberLabel = KMhNumberLabel
	
	local KMhLabel = nil
	
	KMhLabel = LUI.UIText.new()
	KMhLabel.id = "KMhLabel"
	KMhLabel:SetAlpha( 0.6, 0 )
	KMhLabel:setText( Engine.Localize( "JACKAL_KM_H" ), 0 )
	KMhLabel:SetFontSize( 22 * _1080p )
	KMhLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KMhLabel:SetAlignment( LUI.Alignment.Left )
	KMhLabel:SetOptOutRightToLeftAlignmentFlip( true )
	KMhLabel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 175.74, _1080p * 152.74, _1080p * -6.73, _1080p * 15.27 )
	self:addElement( KMhLabel )
	self.KMhLabel = KMhLabel
	
	local GForceNumberLabel = nil
	
	GForceNumberLabel = LUI.UIText.new()
	GForceNumberLabel.id = "GForceNumberLabel"
	GForceNumberLabel:SetAlpha( 0.6, 0 )
	GForceNumberLabel:setText( "3065", 0 )
	GForceNumberLabel:SetFontSize( 38 * _1080p )
	GForceNumberLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GForceNumberLabel:SetAlignment( LUI.Alignment.Right )
	GForceNumberLabel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -123.26, _1080p * -146.26, _1080p * 191, _1080p * 229 )
	self:addElement( GForceNumberLabel )
	self.GForceNumberLabel = GForceNumberLabel
	
	local GForceLabel = nil
	
	GForceLabel = LUI.UIText.new()
	GForceLabel.id = "GForceLabel"
	GForceLabel:SetAlpha( 0.6, 0 )
	GForceLabel:setText( Engine.Localize( "JACKAL_GS" ), 0 )
	GForceLabel:SetFontSize( 22 * _1080p )
	GForceLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GForceLabel:SetAlignment( LUI.Alignment.Left )
	GForceLabel:SetOptOutRightToLeftAlignmentFlip( true )
	GForceLabel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 116.74, _1080p * 93.74, _1080p * 203, _1080p * 225 )
	self:addElement( GForceLabel )
	self.GForceLabel = GForceLabel
	
	local StateLabel = nil
	
	StateLabel = LUI.UIText.new()
	StateLabel.id = "StateLabel"
	StateLabel:SetAlpha( 0.6, 0 )
	StateLabel:SetFontSize( 16 * _1080p )
	StateLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StateLabel:SetAlignment( LUI.Alignment.Center )
	StateLabel:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -16, 0 )
	StateLabel:SubscribeToModel( DataSources.inGame.jackal.launchStateModeText:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.jackal.launchStateModeText:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			StateLabel:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( StateLabel )
	self.StateLabel = StateLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DiagramAtmos:RegisterAnimationSequence( "HideDiagram", {
			{
				function ()
					return self.DiagramAtmos:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramLaunch:RegisterAnimationSequence( "HideDiagram", {
			{
				function ()
					return self.DiagramLaunch:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramSpace:RegisterAnimationSequence( "HideDiagram", {
			{
				function ()
					return self.DiagramSpace:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramAtmosFlash:RegisterAnimationSequence( "HideDiagram", {
			{
				function ()
					return self.DiagramAtmosFlash:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramLaunchFlash:RegisterAnimationSequence( "HideDiagram", {
			{
				function ()
					return self.DiagramLaunchFlash:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramSpaceFlash:RegisterAnimationSequence( "HideDiagram", {
			{
				function ()
					return self.DiagramSpaceFlash:SetAlpha( 0, 100 )
				end
			}
		} )
		StateLabel:RegisterAnimationSequence( "HideDiagram", {
			{
				function ()
					return self.StateLabel:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.HideDiagram = function ()
			DiagramAtmos:AnimateSequence( "HideDiagram" )
			DiagramLaunch:AnimateSequence( "HideDiagram" )
			DiagramSpace:AnimateSequence( "HideDiagram" )
			DiagramAtmosFlash:AnimateSequence( "HideDiagram" )
			DiagramLaunchFlash:AnimateSequence( "HideDiagram" )
			DiagramSpaceFlash:AnimateSequence( "HideDiagram" )
			StateLabel:AnimateSequence( "HideDiagram" )
		end
		
		DiagramAtmos:RegisterAnimationSequence( "AtmosDiagram", {
			{
				function ()
					return self.DiagramAtmos:SetAlpha( 0.4, 100 )
				end
			}
		} )
		DiagramLaunch:RegisterAnimationSequence( "AtmosDiagram", {
			{
				function ()
					return self.DiagramLaunch:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramSpace:RegisterAnimationSequence( "AtmosDiagram", {
			{
				function ()
					return self.DiagramSpace:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramAtmosFlash:RegisterAnimationSequence( "AtmosDiagram", {
			{
				function ()
					return self.DiagramAtmosFlash:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramLaunchFlash:RegisterAnimationSequence( "AtmosDiagram", {
			{
				function ()
					return self.DiagramLaunchFlash:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramSpaceFlash:RegisterAnimationSequence( "AtmosDiagram", {
			{
				function ()
					return self.DiagramSpaceFlash:SetAlpha( 0, 100 )
				end
			}
		} )
		StateLabel:RegisterAnimationSequence( "AtmosDiagram", {
			{
				function ()
					return self.StateLabel:SetAlpha( 0.6, 100 )
				end
			}
		} )
		self._sequences.AtmosDiagram = function ()
			DiagramAtmos:AnimateSequence( "AtmosDiagram" )
			DiagramLaunch:AnimateSequence( "AtmosDiagram" )
			DiagramSpace:AnimateSequence( "AtmosDiagram" )
			DiagramAtmosFlash:AnimateSequence( "AtmosDiagram" )
			DiagramLaunchFlash:AnimateSequence( "AtmosDiagram" )
			DiagramSpaceFlash:AnimateSequence( "AtmosDiagram" )
			StateLabel:AnimateSequence( "AtmosDiagram" )
		end
		
		DiagramAtmos:RegisterAnimationSequence( "WingsIn", {
			{
				function ()
					return self.DiagramAtmos:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.DiagramAtmos:SetAlpha( 0.4, 1000 )
				end,
				function ()
					return self.DiagramAtmos:SetAlpha( 0, 250 )
				end
			}
		} )
		DiagramLaunch:RegisterAnimationSequence( "WingsIn", {
			{
				function ()
					return self.DiagramLaunch:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DiagramLaunch:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.DiagramLaunch:SetAlpha( 0.4, 250 )
				end
			}
		} )
		DiagramSpace:RegisterAnimationSequence( "WingsIn", {
			{
				function ()
					return self.DiagramSpace:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramAtmosFlash:RegisterAnimationSequence( "WingsIn", {
			{
				function ()
					return self.DiagramAtmosFlash:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.DiagramAtmosFlash:SetAlpha( 0, 250, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.DiagramAtmosFlash:SetAlpha( 0.4, 250, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.DiagramAtmosFlash:SetAlpha( 0, 250, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.DiagramAtmosFlash:SetAlpha( 0.4, 250, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.DiagramAtmosFlash:SetAlpha( 0, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		DiagramLaunchFlash:RegisterAnimationSequence( "WingsIn", {
			{
				function ()
					return self.DiagramLaunchFlash:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramSpaceFlash:RegisterAnimationSequence( "WingsIn", {
			{
				function ()
					return self.DiagramSpaceFlash:SetAlpha( 0, 100 )
				end
			}
		} )
		StateLabel:RegisterAnimationSequence( "WingsIn", {
			{
				function ()
					return self.StateLabel:SetAlpha( 0.6, 100 )
				end
			}
		} )
		self._sequences.WingsIn = function ()
			DiagramAtmos:AnimateSequence( "WingsIn" )
			DiagramLaunch:AnimateSequence( "WingsIn" )
			DiagramSpace:AnimateSequence( "WingsIn" )
			DiagramAtmosFlash:AnimateSequence( "WingsIn" )
			DiagramLaunchFlash:AnimateSequence( "WingsIn" )
			DiagramSpaceFlash:AnimateSequence( "WingsIn" )
			StateLabel:AnimateSequence( "WingsIn" )
		end
		
		DiagramAtmos:RegisterAnimationSequence( "LowFuel", {
			{
				function ()
					return self.DiagramAtmos:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramLaunch:RegisterAnimationSequence( "LowFuel", {
			{
				function ()
					return self.DiagramLaunch:SetAlpha( 0.4, 100 )
				end
			}
		} )
		DiagramSpace:RegisterAnimationSequence( "LowFuel", {
			{
				function ()
					return self.DiagramSpace:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramAtmosFlash:RegisterAnimationSequence( "LowFuel", {
			{
				function ()
					return self.DiagramAtmosFlash:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramLaunchFlash:RegisterAnimationSequence( "LowFuel", {
			{
				function ()
					return self.DiagramLaunchFlash:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.DiagramLaunchFlash:SetAlpha( 0.2, 100, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.DiagramLaunchFlash:SetAlpha( 0.6, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		DiagramSpaceFlash:RegisterAnimationSequence( "LowFuel", {
			{
				function ()
					return self.DiagramSpaceFlash:SetAlpha( 0, 100 )
				end
			}
		} )
		StateLabel:RegisterAnimationSequence( "LowFuel", {
			{
				function ()
					return self.StateLabel:SetAlpha( 0.6, 100 )
				end,
				function ()
					return self.StateLabel:SetAlpha( 1, 900 )
				end
			}
		} )
		self._sequences.LowFuel = function ()
			DiagramAtmos:AnimateLoop( "LowFuel" )
			DiagramLaunch:AnimateLoop( "LowFuel" )
			DiagramSpace:AnimateLoop( "LowFuel" )
			DiagramAtmosFlash:AnimateLoop( "LowFuel" )
			DiagramLaunchFlash:AnimateLoop( "LowFuel" )
			DiagramSpaceFlash:AnimateLoop( "LowFuel" )
			StateLabel:AnimateLoop( "LowFuel" )
		end
		
		DiagramAtmos:RegisterAnimationSequence( "DetachBoosters", {
			{
				function ()
					return self.DiagramAtmos:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramLaunch:RegisterAnimationSequence( "DetachBoosters", {
			{
				function ()
					return self.DiagramLaunch:SetAlpha( 0.4, 100 )
				end
			}
		} )
		DiagramSpace:RegisterAnimationSequence( "DetachBoosters", {
			{
				function ()
					return self.DiagramSpace:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramAtmosFlash:RegisterAnimationSequence( "DetachBoosters", {
			{
				function ()
					return self.DiagramAtmosFlash:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramLaunchFlash:RegisterAnimationSequence( "DetachBoosters", {
			{
				function ()
					return self.DiagramLaunchFlash:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.DiagramLaunchFlash:SetAlpha( 0, 500 )
				end
			}
		} )
		DiagramSpaceFlash:RegisterAnimationSequence( "DetachBoosters", {
			{
				function ()
					return self.DiagramSpaceFlash:SetAlpha( 0, 100 )
				end
			}
		} )
		StateLabel:RegisterAnimationSequence( "DetachBoosters", {
			{
				function ()
					return self.StateLabel:SetAlpha( 0.6, 100 )
				end
			}
		} )
		self._sequences.DetachBoosters = function ()
			DiagramAtmos:AnimateSequence( "DetachBoosters" )
			DiagramLaunch:AnimateSequence( "DetachBoosters" )
			DiagramSpace:AnimateSequence( "DetachBoosters" )
			DiagramAtmosFlash:AnimateSequence( "DetachBoosters" )
			DiagramLaunchFlash:AnimateSequence( "DetachBoosters" )
			DiagramSpaceFlash:AnimateSequence( "DetachBoosters" )
			StateLabel:AnimateSequence( "DetachBoosters" )
		end
		
		DiagramAtmos:RegisterAnimationSequence( "WingsOutSpace", {
			{
				function ()
					return self.DiagramAtmos:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramLaunch:RegisterAnimationSequence( "WingsOutSpace", {
			{
				function ()
					return self.DiagramLaunch:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.DiagramLaunch:SetAlpha( 0.4, 600 )
				end,
				function ()
					return self.DiagramLaunch:SetAlpha( 0, 200 )
				end
			}
		} )
		DiagramSpace:RegisterAnimationSequence( "WingsOutSpace", {
			{
				function ()
					return self.DiagramSpace:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DiagramSpace:SetAlpha( 0, 600 )
				end,
				function ()
					return self.DiagramSpace:SetAlpha( 0.4, 200 )
				end
			}
		} )
		DiagramAtmosFlash:RegisterAnimationSequence( "WingsOutSpace", {
			{
				function ()
					return self.DiagramAtmosFlash:SetAlpha( 0, 100 )
				end
			}
		} )
		DiagramLaunchFlash:RegisterAnimationSequence( "WingsOutSpace", {
			{
				function ()
					return self.DiagramLaunchFlash:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DiagramLaunchFlash:SetAlpha( 0, 600 )
				end,
				function ()
					return self.DiagramLaunchFlash:SetAlpha( 0.15, 200 )
				end
			}
		} )
		DiagramSpaceFlash:RegisterAnimationSequence( "WingsOutSpace", {
			{
				function ()
					return self.DiagramSpaceFlash:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.DiagramSpaceFlash:SetAlpha( 0.2, 150, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.DiagramSpaceFlash:SetAlpha( 0.6, 150, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.DiagramSpaceFlash:SetAlpha( 0.2, 150, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.DiagramSpaceFlash:SetAlpha( 0.6, 150, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.DiagramSpaceFlash:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		StateLabel:RegisterAnimationSequence( "WingsOutSpace", {
			{
				function ()
					return self.StateLabel:SetAlpha( 0.6, 100 )
				end
			}
		} )
		self._sequences.WingsOutSpace = function ()
			DiagramAtmos:AnimateSequence( "WingsOutSpace" )
			DiagramLaunch:AnimateSequence( "WingsOutSpace" )
			DiagramSpace:AnimateSequence( "WingsOutSpace" )
			DiagramAtmosFlash:AnimateSequence( "WingsOutSpace" )
			DiagramLaunchFlash:AnimateSequence( "WingsOutSpace" )
			DiagramSpaceFlash:AnimateSequence( "WingsOutSpace" )
			StateLabel:AnimateSequence( "WingsOutSpace" )
		end
		
		KMhNumberLabel:RegisterAnimationSequence( "ShowVelocityData", {
			{
				function ()
					return self.KMhNumberLabel:SetAlpha( 0.6, 100 )
				end
			}
		} )
		KMhLabel:RegisterAnimationSequence( "ShowVelocityData", {
			{
				function ()
					return self.KMhLabel:SetAlpha( 0.6, 100 )
				end
			}
		} )
		GForceNumberLabel:RegisterAnimationSequence( "ShowVelocityData", {
			{
				function ()
					return self.GForceNumberLabel:SetAlpha( 0.6, 100 )
				end
			}
		} )
		GForceLabel:RegisterAnimationSequence( "ShowVelocityData", {
			{
				function ()
					return self.GForceLabel:SetAlpha( 0.6, 100 )
				end
			}
		} )
		StateLabel:RegisterAnimationSequence( "ShowVelocityData", {
			{
				function ()
					return self.StateLabel:SetAlpha( 0.6, 100 )
				end
			}
		} )
		self._sequences.ShowVelocityData = function ()
			KMhNumberLabel:AnimateSequence( "ShowVelocityData" )
			KMhLabel:AnimateSequence( "ShowVelocityData" )
			GForceNumberLabel:AnimateSequence( "ShowVelocityData" )
			GForceLabel:AnimateSequence( "ShowVelocityData" )
			StateLabel:AnimateSequence( "ShowVelocityData" )
		end
		
		self._sequences.HideVelocityData = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.launchState:GetModel( f3_local1 ), function ()
		if DataSources.inGame.jackal.launchState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.jackal.launchState:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "HideDiagram" )
			ACTIONS.AnimateSequence( self, "ShowVelocityData" )
		end
		if DataSources.inGame.jackal.launchState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.jackal.launchState:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "AtmosDiagram" )
			ACTIONS.AnimateSequence( self, "HideVelocityData" )
		end
		if DataSources.inGame.jackal.launchState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.jackal.launchState:GetValue( f3_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "WingsIn" )
			ACTIONS.AnimateSequence( self, "HideVelocityData" )
		end
		if DataSources.inGame.jackal.launchState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.jackal.launchState:GetValue( f3_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "LowFuel" )
			ACTIONS.AnimateSequence( self, "HideVelocityData" )
		end
		if DataSources.inGame.jackal.launchState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.jackal.launchState:GetValue( f3_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "DetachBoosters" )
			ACTIONS.AnimateSequence( self, "HideVelocityData" )
		end
		if DataSources.inGame.jackal.launchState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.jackal.launchState:GetValue( f3_local1 ) == 5 then
			ACTIONS.AnimateSequence( self, "WingsOutSpace" )
			ACTIONS.AnimateSequence( self, "HideVelocityData" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "HideDiagram" )
	ACTIONS.AnimateSequence( self, "ShowVelocityData" )
	return self
end

MenuBuilder.registerType( "JackalLaunchOverlayDiagram", JackalLaunchOverlayDiagram )
LockTable( _M )
