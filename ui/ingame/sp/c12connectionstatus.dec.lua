local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function C12ConnectionStatus( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 340 * _1080p, 0, 28 * _1080p )
	self.id = "C12ConnectionStatus"
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
	Background:setImage( RegisterMaterial( "hud_c12_accent_connection" ), 0 )
	Background:SetBlendMode( BLEND_MODE.addWithAlpha )
	Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 512, _1080p * -16, _1080p * 16 )
	self:addElement( Background )
	self.Background = Background
	
	local MessageText = nil
	
	MessageText = LUI.UIStyledText.new()
	MessageText.id = "MessageText"
	MessageText:SetRGBFromInt( 0, 0 )
	MessageText:setText( Engine.Localize( "HUD_CONNECTED" ), 0 )
	MessageText:SetFontSize( 22 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 70, _1080p * 341, _1080p * -11, _1080p * 11 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -171, _1080p * 341, _1080p * -16, _1080p * 16, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 512, _1080p * -16, _1080p * 16, 200, LUI.EASING.outBack )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MessageText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MessageText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -101, _1080p * 170, _1080p * -10, _1080p * 10, 0 )
				end,
				function ()
					return self.MessageText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 70, _1080p * 341, _1080p * -10, _1080p * 10, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Background:AnimateSequence( "Bootup" )
			MessageText:AnimateSequence( "Bootup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.overlay.isC12Active:GetModel( f1_local1 ), function ()
		if DataSources.inGame.HUD.overlay.isC12Active:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.overlay.isC12Active:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
	end )
	return self
end

MenuBuilder.registerType( "C12ConnectionStatus", C12ConnectionStatus )
LockTable( _M )
