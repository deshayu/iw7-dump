local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RadioTransmitter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 64 * _1080p )
	self.id = "RadioTransmitter"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local EqualizerBackground = nil
	
	EqualizerBackground = LUI.UIImage.new()
	EqualizerBackground.id = "EqualizerBackground"
	EqualizerBackground:SetRGBFromInt( 0, 0 )
	EqualizerBackground:SetAlpha( 0.4, 0 )
	EqualizerBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * -5, _1080p * 29, _1080p * -8 )
	self:addElement( EqualizerBackground )
	self.EqualizerBackground = EqualizerBackground
	
	local Equalizer = nil
	
	Equalizer = LUI.UIImage.new()
	Equalizer.id = "Equalizer"
	Equalizer:setImage( RegisterMaterial( "pip_audio_low_sequence" ), 0 )
	self:addElement( Equalizer )
	self.Equalizer = Equalizer
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		EqualizerBackground:RegisterAnimationSequence( "On", {
			{
				function ()
					return self.EqualizerBackground:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EqualizerBackground:SetAlpha( 0.65, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.EqualizerBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 132, _1080p * 123, _1080p * 29, _1080p * -8, 0 )
				end,
				function ()
					return self.EqualizerBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 5, _1080p * -6, _1080p * 29, _1080p * -9, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		Equalizer:RegisterAnimationSequence( "On", {
			{
				function ()
					return self.Equalizer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Equalizer:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Equalizer:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 128, _1080p * 128, 0, 0, 0 )
				end,
				function ()
					return self.Equalizer:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.On = function ()
			EqualizerBackground:AnimateSequence( "On" )
			Equalizer:AnimateSequence( "On" )
		end
		
		EqualizerBackground:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.EqualizerBackground:SetAlpha( 0.65, 0 )
				end,
				function ()
					return self.EqualizerBackground:SetAlpha( 0.65, 350 )
				end,
				function ()
					return self.EqualizerBackground:SetAlpha( 0, 200, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.EqualizerBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 5, _1080p * -6, _1080p * 29, _1080p * -9, 0 )
				end,
				function ()
					return self.EqualizerBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 5, _1080p * -6, _1080p * 29, _1080p * -9, 349 )
				end,
				function ()
					return self.EqualizerBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 132, _1080p * 123, _1080p * 29, _1080p * -9, 200, LUI.EASING.inQuadratic )
				end
			}
		} )
		Equalizer:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Equalizer:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Equalizer:SetAlpha( 1, 350 )
				end,
				function ()
					return self.Equalizer:SetAlpha( 0, 200, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.Equalizer:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Equalizer:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 349 )
				end,
				function ()
					return self.Equalizer:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 128, _1080p * 128, 0, 0, 200, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.Off = function ()
			EqualizerBackground:AnimateSequence( "Off" )
			Equalizer:AnimateSequence( "Off" )
		end
		
		EqualizerBackground:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.EqualizerBackground:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.EqualizerBackground:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 5, _1080p * -6, _1080p * 29, _1080p * -9, 0 )
				end
			}
		} )
		Equalizer:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Equalizer:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			EqualizerBackground:AnimateSequence( "Hidden" )
			Equalizer:AnimateSequence( "Hidden" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.radio:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.radio:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.radio:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Off" )
		end
		if DataSources.inGame.SP.radio:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.radio:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "On" )
		end
	end )
	ACTIONS.AnimateSequence( self, "Hidden" )
	return self
end

MenuBuilder.registerType( "RadioTransmitter", RadioTransmitter )
LockTable( _M )
