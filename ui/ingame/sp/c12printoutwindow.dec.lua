local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function C12PrintoutWindow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 183 * _1080p )
	self.id = "C12PrintoutWindow"
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
	
	local Text = nil
	
	Text = MenuBuilder.BuildRegisteredType( "ChyronBlock", {
		sourceFile = "sp/output_chyron_text.csv",
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
	Text.id = "Text"
	Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text:SetFontSize( 12 * _1080p )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 289, _1080p * 19, _1080p * 172.5 )
	self:addElement( Text )
	self.Text = Text
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Text:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Text:SetAlpha( 0, 390 )
				end,
				function ()
					return self.Text:SetAlpha( 0.6, 10 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Text:AnimateSequence( "Bootup" )
		end
		
		Text:RegisterAnimationSequence( "ShowTextC6", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowTextC6 = function ()
			Text:AnimateSequence( "ShowTextC6" )
		end
		
		Text:RegisterAnimationSequence( "ShowTextC8", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowTextC8 = function ()
			Text:AnimateSequence( "ShowTextC8" )
		end
		
		Text:RegisterAnimationSequence( "ShowTextJackal", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowTextJackal = function ()
			Text:AnimateSequence( "ShowTextJackal" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.overlay.isC12Active:GetModel( f1_local1 ), function ()
		if DataSources.inGame.HUD.overlay.isC12Active:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.overlay.isC12Active:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Bootup" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "OverlayPrintoutFrame",
				sequenceName = "Bootup",
				elementPath = "OverlayPrintoutFrame"
			} )
		end
	end )
	return self
end

MenuBuilder.registerType( "C12PrintoutWindow", C12PrintoutWindow )
LockTable( _M )
