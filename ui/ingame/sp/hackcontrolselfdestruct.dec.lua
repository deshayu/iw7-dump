local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = DataSources.inGame.SP.hackControlOutro
	local f1_local1 = DataSources.inGame.SP.hackControlSelfDestructShowTimer
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		local f2_local1 = f1_local1:GetValue( f1_arg1 )
		if f2_local0 == 1 then
			if f2_local1 then
				ACTIONS.AnimateSequence( f1_arg0, "On_WithCountdown" )
			else
				ACTIONS.AnimateSequence( f1_arg0, "On" )
			end
		elseif f2_local0 == 2 then
			if f2_local1 then
				ACTIONS.AnimateSequence( f1_arg0, "Outro_WithCountdown" )
			else
				ACTIONS.AnimateSequence( f1_arg0, "Outro" )
			end
		elseif f2_local0 == 3 then
			ACTIONS.AnimateSequence( f1_arg0, "OnShuttingDown" )
		end
	end )
end

function HackControlSelfDestruct( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 80 * _1080p )
	self.id = "HackControlSelfDestruct"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local RedBarFull = nil
	
	RedBarFull = LUI.UIImage.new()
	RedBarFull.id = "RedBarFull"
	RedBarFull:SetRGBFromInt( 15864081, 0 )
	RedBarFull:SetBlendMode( BLEND_MODE.addWithAlpha )
	RedBarFull:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -40, _1080p * 40 )
	self:addElement( RedBarFull )
	self.RedBarFull = RedBarFull
	
	local MessageText = nil
	
	MessageText = LUI.UIStyledText.new()
	MessageText.id = "MessageText"
	MessageText:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_SELF_DESTRUCT" ), 0 )
	MessageText:SetFontSize( 50 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -40, _1080p * 10 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	local Countdown = nil
	
	Countdown = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f3_local1
	} )
	Countdown.id = "Countdown"
	Countdown:SetFontSize( 36 * _1080p )
	Countdown:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Countdown:SetAlignment( LUI.Alignment.Center )
	Countdown:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 44, _1080p * 80 )
	Countdown:SubscribeToModel( DataSources.inGame.SP.hackControlSelfDestructTimer:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.SP.hackControlSelfDestructTimer:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Countdown:setEndTime( f4_local0 )
		end
	end )
	self:addElement( Countdown )
	self.Countdown = Countdown
	
	local HVTSelfDestructTimer = nil
	
	HVTSelfDestructTimer = MenuBuilder.BuildRegisteredType( "HVTSelfDestructTimer", {
		controllerIndex = f3_local1
	} )
	HVTSelfDestructTimer.id = "HVTSelfDestructTimer"
	HVTSelfDestructTimer:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -275, _1080p * 275, _1080p * -20, _1080p * 20 )
	self:addElement( HVTSelfDestructTimer )
	self.HVTSelfDestructTimer = HVTSelfDestructTimer
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RedBarFull:RegisterAnimationSequence( "On", {
			{
				function ()
					return self.RedBarFull:SetAlpha( 0.8, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "On", {
			{
				function ()
					return self.MessageText:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_SELF_DESTRUCT" ), 0 )
				end
			},
			{
				function ()
					return self.MessageText:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.MessageText:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -24, _1080p * 24, 0 )
				end
			}
		} )
		self._sequences.On = function ()
			RedBarFull:AnimateLoop( "On" )
			MessageText:AnimateLoop( "On" )
		end
		
		RedBarFull:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.RedBarFull:SetAlpha( 0, 0 )
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
		Countdown:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Countdown:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Off = function ()
			RedBarFull:AnimateSequence( "Off" )
			MessageText:AnimateSequence( "Off" )
			Countdown:AnimateSequence( "Off" )
		end
		
		MessageText:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MessageText:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_SELF_DESTRUCT" ), 0 )
				end
			}
		} )
		self._sequences.TextOn = function ()
			MessageText:AnimateSequence( "TextOn" )
		end
		
		RedBarFull:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.RedBarFull:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.RedBarFull:SetAlpha( 0, 150 )
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
			},
			{
				function ()
					return self.MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -28, _1080p * 22, 0 )
				end
			}
		} )
		Countdown:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Countdown:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Outro = function ()
			RedBarFull:AnimateSequence( "Outro" )
			MessageText:AnimateSequence( "Outro" )
			Countdown:AnimateSequence( "Outro" )
		end
		
		RedBarFull:RegisterAnimationSequence( "OnShuttingDown", {
			{
				function ()
					return self.RedBarFull:SetAlpha( 0.8, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "OnShuttingDown", {
			{
				function ()
					return self.MessageText:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_SHUT_DOWN" ), 0 )
				end
			},
			{
				function ()
					return self.MessageText:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.MessageText:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -28, _1080p * 22, 0 )
				end
			}
		} )
		Countdown:RegisterAnimationSequence( "OnShuttingDown", {
			{
				function ()
					return self.Countdown:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.OnShuttingDown = function ()
			RedBarFull:AnimateLoop( "OnShuttingDown" )
			MessageText:AnimateLoop( "OnShuttingDown" )
			Countdown:AnimateLoop( "OnShuttingDown" )
		end
		
		RedBarFull:RegisterAnimationSequence( "On_WithCountdown", {
			{
				function ()
					return self.RedBarFull:SetAlpha( 0.8, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "On_WithCountdown", {
			{
				function ()
					return self.MessageText:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_SELF_DESTRUCT" ), 0 )
				end
			},
			{
				function ()
					return self.MessageText:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.MessageText:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -40, _1080p * 10, 0 )
				end
			}
		} )
		Countdown:RegisterAnimationSequence( "On_WithCountdown", {
			{
				function ()
					return self.Countdown:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.Countdown:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.On_WithCountdown = function ()
			RedBarFull:AnimateLoop( "On_WithCountdown" )
			MessageText:AnimateLoop( "On_WithCountdown" )
			Countdown:AnimateLoop( "On_WithCountdown" )
		end
		
		RedBarFull:RegisterAnimationSequence( "Outro_WithCountdown", {
			{
				function ()
					return self.RedBarFull:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.RedBarFull:SetAlpha( 0, 150 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "Outro_WithCountdown", {
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MessageText:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -40, _1080p * 10, 0 )
				end
			}
		} )
		Countdown:RegisterAnimationSequence( "Outro_WithCountdown", {
			{
				function ()
					return self.Countdown:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Countdown:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.Outro_WithCountdown = function ()
			RedBarFull:AnimateSequence( "Outro_WithCountdown" )
			MessageText:AnimateSequence( "Outro_WithCountdown" )
			Countdown:AnimateSequence( "Outro_WithCountdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Off" )
	return self
end

MenuBuilder.registerType( "HackControlSelfDestruct", HackControlSelfDestruct )
LockTable( _M )
