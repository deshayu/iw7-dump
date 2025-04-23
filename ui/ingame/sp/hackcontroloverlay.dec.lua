local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Reticle:SetBlendMode( BLEND_MODE.addWithAlpha )
end

function HackControlOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HackControlOverlay"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Grid = nil
	
	Grid = MenuBuilder.BuildRegisteredType( "HackControlGrid", {
		controllerIndex = f2_local1
	} )
	Grid.id = "Grid"
	Grid:SetAlpha( 0, 0 )
	Grid:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Grid )
	self.Grid = Grid
	
	local Vignette = nil
	
	Vignette = LUI.UIImage.new()
	Vignette.id = "Vignette"
	Vignette:SetRGBFromInt( 0, 0 )
	Vignette:SetAlpha( 0, 0 )
	Vignette:setImage( RegisterMaterial( "bkgd_vignette" ), 0 )
	Vignette:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -540, _1080p * 540 )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	local VideoFeed = nil
	
	VideoFeed = MenuBuilder.BuildRegisteredType( "HackVideoFeed", {
		controllerIndex = f2_local1
	} )
	VideoFeed.id = "VideoFeed"
	VideoFeed:SetCurvedRenderingX( 0.4 )
	VideoFeed:SetCurvedRenderingY( -0.2 )
	VideoFeed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -41.71, _1080p * 1977.76, _1080p * -41.18, _1080p * 1130.25 )
	self:addElement( VideoFeed )
	self.VideoFeed = VideoFeed
	
	local HackControlScreenElements = nil
	
	HackControlScreenElements = MenuBuilder.BuildRegisteredType( "HackControlScreenElements", {
		controllerIndex = f2_local1
	} )
	HackControlScreenElements.id = "HackControlScreenElements"
	HackControlScreenElements:SetCurvedRenderingX( 0.4 )
	HackControlScreenElements:SetCurvedRenderingY( -0.2 )
	HackControlScreenElements:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( HackControlScreenElements )
	self.HackControlScreenElements = HackControlScreenElements
	
	local SelfDestruct = nil
	
	SelfDestruct = MenuBuilder.BuildRegisteredType( "HackControlSelfDestruct", {
		controllerIndex = f2_local1
	} )
	SelfDestruct.id = "SelfDestruct"
	SelfDestruct:SetCurvedRenderingX( 0.4 )
	SelfDestruct:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -540, _1080p * 144 )
	self:addElement( SelfDestruct )
	self.SelfDestruct = SelfDestruct
	
	local SignalFailing = nil
	
	SignalFailing = MenuBuilder.BuildRegisteredType( "HackControlSignalFailing", {
		controllerIndex = f2_local1
	} )
	SignalFailing.id = "SignalFailing"
	SignalFailing:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -500, _1080p * 500, _1080p * 265, _1080p * 295 )
	self:addElement( SignalFailing )
	self.SignalFailing = SignalFailing
	
	local Reticle = nil
	
	Reticle = MenuBuilder.BuildRegisteredType( "HackControlReticle", {
		controllerIndex = f2_local1
	} )
	Reticle.id = "Reticle"
	Reticle:SetAlpha( 0, 0 )
	Reticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -120, _1080p * 120, _1080p * -120, _1080p * 120 )
	self:addElement( Reticle )
	self.Reticle = Reticle
	
	local BootupScreenExpand = nil
	
	BootupScreenExpand = LUI.UIImage.new()
	BootupScreenExpand.id = "BootupScreenExpand"
	BootupScreenExpand:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -8, _1080p * 8 )
	self:addElement( BootupScreenExpand )
	self.BootupScreenExpand = BootupScreenExpand
	
	local HackControlConnectionStatus = nil
	
	HackControlConnectionStatus = MenuBuilder.BuildRegisteredType( "HackControlConnectionStatus", {
		controllerIndex = f2_local1
	} )
	HackControlConnectionStatus.id = "HackControlConnectionStatus"
	HackControlConnectionStatus:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -500, _1080p * 500, _1080p * 265, _1080p * 295 )
	self:addElement( HackControlConnectionStatus )
	self.HackControlConnectionStatus = HackControlConnectionStatus
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Grid:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Grid:SetAlpha( 0, 1980 )
				end,
				function ()
					return self.Grid:SetAlpha( 1, 20 )
				end
			}
		} )
		Vignette:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Vignette:SetAlpha( 0, 1980 )
				end,
				function ()
					return self.Vignette:SetAlpha( 0, 20 )
				end
			}
		} )
		VideoFeed:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.VideoFeed:SetAlpha( 1, 0 )
				end,
				function ()
					return self.VideoFeed:SetAlpha( 1, 2000 )
				end,
				function ()
					return self.VideoFeed:SetAlpha( 0, 70 )
				end
			},
			{
				function ()
					return self.VideoFeed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * -414, _1080p * -486, _1080p * -236, 0 )
				end,
				function ()
					return self.VideoFeed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * -414, _1080p * -486, _1080p * -236, 349 )
				end,
				function ()
					return self.VideoFeed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1000, _1080p * 1000, _1080p * -580, _1080p * 580, 349, LUI.EASING.outBack )
				end
			}
		} )
		HackControlScreenElements:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.HackControlScreenElements:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HackControlScreenElements:SetAlpha( 0, 480 )
				end,
				function ()
					return self.HackControlScreenElements:SetAlpha( 1, 100 )
				end,
				function ()
					return self.HackControlScreenElements:SetAlpha( 1, 1410 )
				end,
				function ()
					return self.HackControlScreenElements:SetAlpha( 1, 10 )
				end
			}
		} )
		SelfDestruct:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.SelfDestruct:SetAlpha( 0, 1980 )
				end,
				function ()
					return self.SelfDestruct:SetAlpha( 1, 20 )
				end
			}
		} )
		SignalFailing:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.SignalFailing:SetAlpha( 0, 1980 )
				end,
				function ()
					return self.SignalFailing:SetAlpha( 1, 20 )
				end
			}
		} )
		Reticle:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Reticle:SetAlpha( 0, 1980 )
				end,
				function ()
					return self.Reticle:SetAlpha( 1, 20 )
				end
			}
		} )
		BootupScreenExpand:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.BootupScreenExpand:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.BootupScreenExpand:SetAlpha( 0.8, 1620 )
				end,
				function ()
					return self.BootupScreenExpand:SetAlpha( 1, 190, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.BootupScreenExpand:SetAlpha( 0.8, 190, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.BootupScreenExpand:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.BootupScreenExpand:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.BootupScreenExpand:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, 0, 0, 0, 1610 )
				end,
				function ()
					return self.BootupScreenExpand:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -8, _1080p * 8, 9 )
				end,
				function ()
					return self.BootupScreenExpand:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1000, _1080p * 1000, _1080p * -8, _1080p * 8, 189, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.BootupScreenExpand:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1000, _1080p * 1000, _1080p * -540, _1080p * 540, 190, LUI.EASING.outQuadratic )
				end
			}
		} )
		HackControlConnectionStatus:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.HackControlConnectionStatus:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Intro = function ()
			Grid:AnimateSequence( "Intro" )
			Vignette:AnimateSequence( "Intro" )
			VideoFeed:AnimateSequence( "Intro" )
			HackControlScreenElements:AnimateSequence( "Intro" )
			SelfDestruct:AnimateSequence( "Intro" )
			SignalFailing:AnimateSequence( "Intro" )
			Reticle:AnimateSequence( "Intro" )
			BootupScreenExpand:AnimateSequence( "Intro" )
			HackControlConnectionStatus:AnimateSequence( "Intro" )
		end
		
		self._sequences.SuicideLoop = function ()
			
		end
		
		VideoFeed:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.VideoFeed:SetAlpha( 0, 0 )
				end
			}
		} )
		Reticle:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Reticle:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			VideoFeed:AnimateSequence( "Default" )
			Reticle:AnimateSequence( "Default" )
		end
		
		Grid:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Grid:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Grid:SetAlpha( 0, 250 )
				end
			}
		} )
		Vignette:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Vignette:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Vignette:SetAlpha( 0, 250 )
				end
			}
		} )
		VideoFeed:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.VideoFeed:SetAlpha( 0, 0 )
				end,
				function ()
					return self.VideoFeed:SetAlpha( 1, 150 )
				end,
				function ()
					return self.VideoFeed:SetAlpha( 1, 1250, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.VideoFeed:SetAlpha( 0, 20 )
				end,
				function ()
					return self.VideoFeed:SetAlpha( 1, 20 )
				end,
				function ()
					return self.VideoFeed:SetAlpha( 0, 20 )
				end,
				function ()
					return self.VideoFeed:SetAlpha( 1, 20 )
				end,
				function ()
					return self.VideoFeed:SetAlpha( 0, 20 )
				end,
				function ()
					return self.VideoFeed:SetAlpha( 1, 20 )
				end,
				function ()
					return self.VideoFeed:SetAlpha( 0, 20 )
				end
			},
			{
				function ()
					return self.VideoFeed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1000, _1080p * 1000, _1080p * -580, _1080p * 580, 1100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.VideoFeed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * -453, _1080p * -486, _1080p * -247.62, 299, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		HackControlScreenElements:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.HackControlScreenElements:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HackControlScreenElements:SetAlpha( 1, 1300 )
				end,
				function ()
					return self.HackControlScreenElements:SetAlpha( 0, 100 )
				end
			}
		} )
		SelfDestruct:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.SelfDestruct:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SelfDestruct:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.SelfDestruct:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -48, _1080p * 732, 0 )
				end
			}
		} )
		SignalFailing:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.SignalFailing:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SignalFailing:SetAlpha( 0, 250 )
				end
			}
		} )
		Reticle:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Reticle:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Reticle:SetAlpha( 0, 250 )
				end
			}
		} )
		BootupScreenExpand:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.BootupScreenExpand:SetAlpha( 0, 0 )
				end
			}
		} )
		HackControlConnectionStatus:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.HackControlConnectionStatus:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Outro = function ()
			Grid:AnimateSequence( "Outro" )
			Vignette:AnimateSequence( "Outro" )
			VideoFeed:AnimateSequence( "Outro" )
			HackControlScreenElements:AnimateSequence( "Outro" )
			SelfDestruct:AnimateSequence( "Outro" )
			SignalFailing:AnimateSequence( "Outro" )
			Reticle:AnimateSequence( "Outro" )
			BootupScreenExpand:AnimateSequence( "Outro" )
			HackControlConnectionStatus:AnimateSequence( "Outro" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.hackControlOutro:GetModel( f2_local1 ), function ()
		if DataSources.inGame.SP.hackControlOutro:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.hackControlOutro:GetValue( f2_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "SuicideLoop" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "Grid",
				sequenceName = "SelfDestruct",
				elementPath = "Grid"
			} )
		end
		if DataSources.inGame.SP.hackControlOutro:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.hackControlOutro:GetValue( f2_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Outro" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "Intro" )
	return self
end

MenuBuilder.registerType( "HackControlOverlay", HackControlOverlay )
LockTable( _M )
