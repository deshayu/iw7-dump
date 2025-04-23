local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OverlayPrintoutFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 183 * _1080p )
	self.id = "OverlayPrintoutFrame"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TextPrintoutLine = nil
	
	TextPrintoutLine = LUI.UIImage.new()
	TextPrintoutLine.id = "TextPrintoutLine"
	TextPrintoutLine:SetUseAA( true )
	TextPrintoutLine:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -290, _1080p * -10, _1080p * 6.5, _1080p * 8.5 )
	self:addElement( TextPrintoutLine )
	self.TextPrintoutLine = TextPrintoutLine
	
	self._animationSets.DefaultAnimationSet = function ()
		TextPrintoutLine:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TextPrintoutLine:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			TextPrintoutLine:AnimateSequence( "DefaultSequence" )
		end
		
		TextPrintoutLine:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.TextPrintoutLine:SetAlpha( 0, 200 )
				end,
				function ()
					return self.TextPrintoutLine:SetAlpha( 0.75, 100, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Bootup = function ()
			TextPrintoutLine:AnimateSequence( "Bootup" )
		end
		
		TextPrintoutLine:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.TextPrintoutLine:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TextPrintoutLine:SetAlpha( 0, 100, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			TextPrintoutLine:AnimateSequence( "Shutdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.overlay.isC12Active:GetModel( f1_local1 ), function ()
		if DataSources.inGame.HUD.overlay.isC12Active:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.overlay.isC12Active:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.HUD.overlay.jackalCallDownActive:GetModel( f1_local1 ), function ()
		if DataSources.inGame.HUD.overlay.jackalCallDownActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.overlay.jackalCallDownActive:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "OverlayPrintoutFrame", OverlayPrintoutFrame )
LockTable( _M )
