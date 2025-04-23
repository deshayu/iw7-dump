local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function jackalPrintoutWindow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 183 * _1080p )
	self.id = "jackalPrintoutWindow"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local OverlayPrintoutFrame = nil
	
	OverlayPrintoutFrame = MenuBuilder.BuildRegisteredType( "OverlayPrintoutFrame", {
		controllerIndex = f1_local1
	} )
	OverlayPrintoutFrame.id = "OverlayPrintoutFrame"
	OverlayPrintoutFrame:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 300, 0, _1080p * 183 )
	self:addElement( OverlayPrintoutFrame )
	self.OverlayPrintoutFrame = OverlayPrintoutFrame
	
	local TextJackal = nil
	
	TextJackal = MenuBuilder.BuildRegisteredType( "ChyronBlock", {
		sourceFile = "sp/jackalchyrontext.csv",
		linesPerBlock = 8,
		textLineDelay = 1000,
		textFont = FONTS.GetFont( FONTS.MainBold.File ),
		textHeight = 12,
		chyronLetterSpeed = 30,
		chyronRandDhars = 2,
		chyronUpdatesPerLetter = 4,
		maxCharsPerLine = 30,
		controllerIndex = f1_local1
	} )
	TextJackal.id = "TextJackal"
	TextJackal:SetAlpha( 0, 0 )
	TextJackal:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TextJackal:SetFontSize( 12 * _1080p )
	TextJackal:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 289, _1080p * 19, _1080p * 172.5 )
	self:addElement( TextJackal )
	self.TextJackal = TextJackal
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TextJackal:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.TextJackal:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TextJackal:SetAlpha( 0, 300 )
				end,
				function ()
					return self.TextJackal:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			TextJackal:AnimateSequence( "Bootup" )
		end
		
		OverlayPrintoutFrame:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.OverlayPrintoutFrame:SetAlpha( 1, 0 )
				end,
				function ()
					return self.OverlayPrintoutFrame:SetAlpha( 0, 100 )
				end
			}
		} )
		TextJackal:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.TextJackal:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TextJackal:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			OverlayPrintoutFrame:AnimateSequence( "Shutdown" )
			TextJackal:AnimateSequence( "Shutdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.overlay.jackalCallDownActive:GetModel( f1_local1 ), function ()
		if DataSources.inGame.HUD.overlay.jackalCallDownActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.overlay.jackalCallDownActive:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
	end )
	self:addEventHandler( "hud_anim_shutdown_off", function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Shutdown" )
	end )
	return self
end

MenuBuilder.registerType( "jackalPrintoutWindow", jackalPrintoutWindow )
LockTable( _M )
