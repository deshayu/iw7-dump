local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HackControlTransitionElements( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HackControlTransitionElements"
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
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -80, _1080p * 80, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local VideoFeed = nil
	
	VideoFeed = MenuBuilder.BuildRegisteredType( "HackVideoFeed", {
		controllerIndex = f1_local1
	} )
	VideoFeed.id = "VideoFeed"
	VideoFeed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 507, _1080p * 54, _1080p * 292.38 )
	self:addElement( VideoFeed )
	self.VideoFeed = VideoFeed
	
	local ConnectionStatus = nil
	
	ConnectionStatus = MenuBuilder.BuildRegisteredType( "HackControlConnectionStatus", {
		controllerIndex = f1_local1
	} )
	ConnectionStatus.id = "ConnectionStatus"
	ConnectionStatus:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 267, _1080p * 309 )
	self:addElement( ConnectionStatus )
	self.ConnectionStatus = ConnectionStatus
	
	local Flare = nil
	
	Flare = LUI.UIImage.new()
	Flare.id = "Flare"
	Flare:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( Flare )
	self.Flare = Flare
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
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
				end,
				function ()
					return self.VideoFeed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1000, _1080p * 1000, _1080p * -580, _1080p * 580, 1300 )
				end,
				function ()
					return self.VideoFeed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1000, _1080p * 1000, _1080p * -580, _1080p * 580, 69 )
				end
			}
		} )
		ConnectionStatus:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.ConnectionStatus:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ConnectionStatus:SetAlpha( 0, 350 )
				end,
				function ()
					return self.ConnectionStatus:SetAlpha( 1, 350 )
				end,
				function ()
					return self.ConnectionStatus:SetAlpha( 1, 1300 )
				end,
				function ()
					return self.ConnectionStatus:SetAlpha( 0, 70 )
				end
			}
		} )
		Flare:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Flare:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.Flare:SetAlpha( 0, 1790 )
				end,
				function ()
					return self.Flare:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Flare:SetAlpha( 1, 200, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Flare:SetAlpha( 0, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Flare:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, 0, 0, 0, 1789 )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, 0, _1080p * -1, _1080p * 1, 9 )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1000, _1080p * 1000, _1080p * -1, _1080p * 1, 100, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1000, _1080p * 1000, _1080p * -540, _1080p * 540, 100, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1000, _1080p * 1000, _1080p * -540, _1080p * 540, 599, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Intro = function ()
			VideoFeed:AnimateSequence( "Intro" )
			ConnectionStatus:AnimateSequence( "Intro" )
			Flare:AnimateSequence( "Intro" )
		end
		
		VideoFeed:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.VideoFeed:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			VideoFeed:AnimateSequence( "Default" )
		end
		
		Background:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Background:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 50 )
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
		ConnectionStatus:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.ConnectionStatus:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ConnectionStatus:SetAlpha( 1, 1100 )
				end,
				function ()
					return self.ConnectionStatus:SetAlpha( 0, 100 )
				end
			}
		} )
		Flare:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Flare:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Outro = function ()
			Background:AnimateSequence( "Outro" )
			VideoFeed:AnimateSequence( "Outro" )
			ConnectionStatus:AnimateSequence( "Outro" )
			Flare:AnimateSequence( "Outro" )
		end
		
		Background:RegisterAnimationSequence( "ShuttingDown", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.8, 850 )
				end
			}
		} )
		self._sequences.ShuttingDown = function ()
			Background:AnimateSequence( "ShuttingDown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.hackControlOutro:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.hackControlOutro:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.hackControlOutro:GetValue( f1_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Outro" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "ConnectionStatus",
				sequenceName = "Lost",
				elementPath = "ConnectionStatus"
			} )
		end
		if DataSources.inGame.SP.hackControlOutro:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.hackControlOutro:GetValue( f1_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "ShuttingDown" )
		end
	end )
	ACTIONS.AnimateSequence( self, "Intro" )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ConnectionStatus",
		sequenceName = "Loop",
		elementPath = "ConnectionStatus"
	} )
	return self
end

MenuBuilder.registerType( "HackControlTransitionElements", HackControlTransitionElements )
LockTable( _M )
