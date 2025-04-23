local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetupInWorldElement( {
		entityNum = Game.GetOmnvar( "ui_jackal_entity" ),
		entityTag = "tag_cockpit_light_monitor2"
	} )
	f1_arg0:SetInWorldScale( 0.02 )
	f1_arg0:SetFollowTagAngles( true )
	f1_arg0:SetTagSpacePosition( 0, -0.08, 0 )
	f1_arg0:SetDelayedRender( true )
end

function JackalInteriorHandScanner( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1160 * _1080p, 0, 640 * _1080p )
	self.id = "JackalInteriorHandScanner"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "hud_jackal_interior_background" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Box = nil
	
	Box = MenuBuilder.BuildRegisteredType( "GenericBoxFillAndStroke", {
		controllerIndex = f2_local1
	} )
	Box.id = "Box"
	Box.Fill:SetRGBFromInt( 3957636, 0 )
	Box.Fill:SetAlpha( 0.48, 0 )
	Box.Stroke:SetBorderThicknessLeft( _1080p * 2, 0 )
	Box.Stroke:SetBorderThicknessRight( _1080p * 2, 0 )
	Box.Stroke:SetBorderThicknessTop( _1080p * 2, 0 )
	Box.Stroke:SetBorderThicknessBottom( _1080p * 2, 0 )
	Box:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -250, _1080p * 250, 0, 0 )
	self:addElement( Box )
	self.Box = Box
	
	local HandScan = nil
	
	HandScan = MenuBuilder.BuildRegisteredType( "HandScan", {
		controllerIndex = f2_local1
	} )
	HandScan.id = "HandScan"
	HandScan:SetScale( 0.3, 0 )
	HandScan:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -175, _1080p * 175, _1080p * -250, _1080p * 250 )
	self:addElement( HandScan )
	self.HandScan = HandScan
	
	local Printout = nil
	
	Printout = MenuBuilder.BuildRegisteredType( "ChyronBlock", {
		sourceFile = "sp/c12chyrontext.csv",
		linesPerBlock = 15,
		textLineDelay = 1000,
		textFont = FONTS.GetFont( FONTS.MainCondensed.File ),
		textHeight = 14,
		chyronLetterSpeed = 30,
		chyronRandDhars = 3,
		chyronUpdatesPerLetter = 4,
		maxCharsPerLine = 50,
		controllerIndex = f2_local1
	} )
	Printout.id = "Printout"
	Printout:SetAlpha( 0, 0 )
	Printout:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Printout:SetFontSize( 14 * _1080p )
	Printout:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 20, _1080p * 1160, _1080p * 100, 0 )
	self:addElement( Printout )
	self.Printout = Printout
	
	local Overlay = nil
	
	Overlay = LUI.UIImage.new()
	Overlay.id = "Overlay"
	Overlay:SetRGBFromTable( SWATCHES.jackalInteriors.fadeOutOverlay, 0 )
	Overlay:SetAlpha( 0, 0 )
	self:addElement( Overlay )
	self.Overlay = Overlay
	
	local Flare = nil
	
	Flare = LUI.UIImage.new()
	Flare.id = "Flare"
	Flare:SetAlpha( 0, 0 )
	self:addElement( Flare )
	self.Flare = Flare
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Background:SetAlpha( 1, 200 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 10 )
				end
			}
		} )
		Box:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Box:SetAlpha( 1, 200 )
				end,
				function ()
					return self.Box:SetAlpha( 0, 10 )
				end
			}
		} )
		HandScan:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.HandScan:SetAlpha( 1, 200 )
				end,
				function ()
					return self.HandScan:SetAlpha( 0, 10 )
				end
			}
		} )
		Printout:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Printout:SetAlpha( 1, 200 )
				end,
				function ()
					return self.Printout:SetAlpha( 0, 10 )
				end
			}
		} )
		Overlay:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Overlay:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Overlay:SetAlpha( 1, 200 )
				end,
				function ()
					return self.Overlay:SetAlpha( 0, 200 )
				end
			}
		} )
		self._sequences.Off = function ()
			Background:AnimateSequence( "Off" )
			Box:AnimateSequence( "Off" )
			HandScan:AnimateSequence( "Off" )
			Printout:AnimateSequence( "Off" )
			Overlay:AnimateSequence( "Off" )
		end
		
		Background:RegisterAnimationSequence( "On", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		Box:RegisterAnimationSequence( "On", {
			{
				function ()
					return self.Box:SetAlpha( 1, 0 )
				end
			}
		} )
		HandScan:RegisterAnimationSequence( "On", {
			{
				function ()
					return self.HandScan:SetAlpha( 1, 0 )
				end
			}
		} )
		Printout:RegisterAnimationSequence( "On", {
			{
				function ()
					return self.Printout:SetAlpha( 1, 0 )
				end
			}
		} )
		Overlay:RegisterAnimationSequence( "On", {
			{
				function ()
					return self.Overlay:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Overlay:SetAlpha( 1, 790 )
				end,
				function ()
					return self.Overlay:SetAlpha( 0, 10 )
				end
			}
		} )
		Flare:RegisterAnimationSequence( "On", {
			{
				function ()
					return self.Flare:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Flare:SetAlpha( 1, 800, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Flare:SetAlpha( 0, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 579, _1080p * -579, _1080p * 319, _1080p * -319, 0 )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 579, _1080p * -579, _1080p * 319, _1080p * -319, 400 )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 319, _1080p * -319, 200, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 199, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		self._sequences.On = function ()
			Background:AnimateSequence( "On" )
			Box:AnimateSequence( "On" )
			HandScan:AnimateSequence( "On" )
			Printout:AnimateSequence( "On" )
			Overlay:AnimateSequence( "On" )
			Flare:AnimateSequence( "On" )
		end
		
		Background:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		Box:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Box:SetAlpha( 0, 0 )
				end
			}
		} )
		HandScan:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.HandScan:SetAlpha( 0, 0 )
				end
			}
		} )
		Printout:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Printout:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			Background:AnimateSequence( "Default" )
			Box:AnimateSequence( "Default" )
			HandScan:AnimateSequence( "Default" )
			Printout:AnimateSequence( "Default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.displayCockpitScanner:GetModel( f2_local1 ), function ()
		if DataSources.inGame.jackal.displayCockpitScanner:GetValue( f2_local1 ) ~= nil and DataSources.inGame.jackal.displayCockpitScanner:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "On" )
		end
		if DataSources.inGame.jackal.displayCockpitScanner:GetValue( f2_local1 ) ~= nil and DataSources.inGame.jackal.displayCockpitScanner:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Off" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "JackalInteriorHandScanner", JackalInteriorHandScanner )
LockTable( _M )
