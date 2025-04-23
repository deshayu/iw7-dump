local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageOversizedFont() then
		assert( f1_arg0.MessageText )
		f1_arg0.MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -12, _1080p * 12 )
	end
end

function HackControlSignalFailing( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 30 * _1080p )
	self.id = "HackControlSignalFailing"
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
	Background:SetRGBFromTable( SWATCHES.robotHacking.caution, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -15, _1080p * 15 )
	self:addElement( Background )
	self.Background = Background
	
	local MessageText = nil
	
	MessageText = LUI.UIStyledText.new()
	MessageText.id = "MessageText"
	MessageText:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_SIGNAL_FAILING" ), 0 )
	MessageText:SetFontSize( 36 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetDecodeLetterLength( 30 )
	MessageText:SetDecodeMaxRandChars( 3 )
	MessageText:SetDecodeUpdatesPerLetter( 3 )
	MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -18, _1080p * 18 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "On", {
			{
				function ()
					return self.Background:SetAlpha( 0.7, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.4, 300, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.Background:SetAlpha( 0.7, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.On = function ()
			Background:AnimateLoop( "On" )
		end
		
		Background:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Off = function ()
			Background:AnimateSequence( "Off" )
			MessageText:AnimateSequence( "Off" )
		end
		
		Background:RegisterAnimationSequence( "BackgroundOn", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -15, _1080p * 15, 100, LUI.EASING.outBack )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "BackgroundOn", {
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MessageText:setText( ".", 0 )
				end,
				function ()
					return self.MessageText:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_SIGNAL_FAILING" ), 50 )
				end
			}
		} )
		self._sequences.BackgroundOn = function ()
			Background:AnimateSequence( "BackgroundOn" )
			MessageText:AnimateSequence( "BackgroundOn" )
		end
		
		Background:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Background:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 150 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MessageText:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.Outro = function ()
			Background:AnimateSequence( "Outro" )
			MessageText:AnimateSequence( "Outro" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.hackControlSignalFailing:GetModel( f2_local1 ), function ()
		if DataSources.inGame.SP.hackControlSignalFailing:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.hackControlSignalFailing:GetValue( f2_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "On" )
			ACTIONS.AnimateSequence( self, "BackgroundOn" )
		end
		if DataSources.inGame.SP.hackControlSignalFailing:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.hackControlSignalFailing:GetValue( f2_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "Off" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.SP.hackControlOutro:GetModel( f2_local1 ), function ()
		if DataSources.inGame.SP.hackControlOutro:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.hackControlOutro:GetValue( f2_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Outro" )
		end
	end )
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "Off" )
	return self
end

MenuBuilder.registerType( "HackControlSignalFailing", HackControlSignalFailing )
LockTable( _M )
