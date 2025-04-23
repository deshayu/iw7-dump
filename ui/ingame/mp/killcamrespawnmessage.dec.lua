local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.MessageText )
	f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
		element.MessageText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_SKIP_KILLCAM" ) ), 0 )
	end )
	if IsLanguageOversizedFont() or IsLanguageGerman() then
		f1_arg0.MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -14, _1080p * 14 )
	end
end

function KillcamRespawnMessage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 50 * _1080p )
	self.id = "KillcamRespawnMessage"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 11776947, 0 )
	Blur:SetBlurStrength( 1, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 3,
		borderThicknessRight = _1080p * 3,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 0
	} )
	Border.id = "Border"
	Border:SetBorderThicknessLeft( _1080p * 3, 0 )
	Border:SetBorderThicknessRight( _1080p * 3, 0 )
	Border:SetBorderThicknessTop( _1080p * 0, 0 )
	Border:SetBorderThicknessBottom( _1080p * 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local MessageText = nil
	
	MessageText = LUI.UIStyledText.new()
	MessageText.id = "MessageText"
	MessageText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_SKIP_KILLCAM" ) ), 0 )
	MessageText:SetFontSize( 38 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -19, _1080p * 19 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	self._animationSets.DefaultAnimationSet = function ()
		Blur:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Blur:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetBlurStrength( 0, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Border:SetAlpha( 0, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Blur:AnimateSequence( "DefaultSequence" )
			Border:AnimateSequence( "DefaultSequence" )
			MessageText:AnimateSequence( "DefaultSequence" )
		end
		
		Blur:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Blur:SetBlurStrength( 2, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 250, _1080p * -250, 0, 0, 0 )
				end,
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 250, _1080p * -250, 0, 0, 400 )
				end,
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		Border:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Border:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Border:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Border:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Border:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Border:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Border:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Border:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Border:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 246, _1080p * -246, 0, 0, 0 )
				end,
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 246, _1080p * -246, 0, 0, 400 )
				end,
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MessageText:SetAlpha( 0, 500 )
				end,
				function ()
					return self.MessageText:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Blur:AnimateSequence( "Bootup" )
			Border:AnimateSequence( "Bootup" )
			MessageText:AnimateSequence( "Bootup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.killcam.countdown:GetModel( f3_local1 ), function ()
		if DataSources.inGame.MP.killcam.countdown:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.killcam.countdown:GetValue( f3_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "KillcamRespawnMessage", KillcamRespawnMessage )
LockTable( _M )
