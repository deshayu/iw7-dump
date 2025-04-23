local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
MenuBuilder.registerType( "BinkSkipPrompt", function ( f1_arg0, f1_arg1 )
	local f1_local0 = 32
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 0, 1, 0, 100, -100, -100 - f1_local0, -100 )
	self.id = "BinkSkipPrompt"
	self:registerEventHandler( "mousedown", function ( element, event )
		element:processEvent( {
			name = "gamepad_button",
			button = "primary",
			down = true
		} )
	end )
	self:registerEventHandler( "mouseup", function ( element, event )
		element:processEvent( {
			name = "gamepad_button",
			button = "primary",
			down = false
		} )
	end )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local f4_local0 = {
			primary = true,
			secondary = true,
			alt1 = true,
			start = true
		}
		if not f4_local0[event.button] then
			return 
		end
		local f4_local1 = Engine.IsSingleplayer()
		if f4_local1 then
			f4_local1 = not Engine.InFrontend()
		end
		if f4_local1 and (event.button == "start" or not Engine.IsConsoleGame() and event.qualifier == ButtonQualifiers.Keyboard and event.button == "secondary") and event.down then
			LUI.FlowManager.RequestAddMenu( "SPPauseMenu", true, event.controller, false )
			Engine.Pause( false )
			Engine.PauseVideo()
			return 
		end
		local f4_local2 = Engine.IsGamepadEnabled() == 1
		local f4_local3 = f4_local2 and event.qualifier ~= ButtonQualifiers.Gamepad
		local f4_local4
		if f4_local2 or event.qualifier ~= ButtonQualifiers.Gamepad then
			f4_local4 = false
		else
			f4_local4 = true
		end
		if Engine.IsPC() and (f4_local3 or f4_local4) then
			return 
		elseif element.fillComplete then
			return 
		end
		assert( element.bar )
		if not event.down then
			element.text:SetAlpha( 0, 150 )
			element.bar:SetProgress( 0, 150, LUI.EASING.inQuadratic )
			element.fillTween = nil
			return 
		end
		assert( event.down )
		if not element.fillTween then
			element.bar:SetProgress( 0 )
			element.text:SetAlpha( 1, 150 )
			element.fillTween = element.bar:SetProgress( 1, 1500, LUI.EASING.inOutQuadratic )
			local f4_local5 = element.fillTween
			element.fillTween.onComplete = function ()
				if element.fillTween ~= f4_local5 then
					return 
				end
				element.fillComplete = true
				element.bar:SetScale( 0.5, 400, LUI.EASING.inBack )
				element.bar:SetAlpha( 0, 350, LUI.EASING.inCubic )
				element.text:SetAlpha( 0, 350, LUI.EASING.inCubic )
				if f1_arg1.onSkipInput then
					f1_arg1.onSkipInput()
				end
			end
			
		end
	end )
	local f1_local2 = 32 * _1080p
	local f1_local3 = Engine.Localize( "MENU_SKIP_MOVIE" )
	self.text = LUI.UIText.new( {
		alignment = LUI.Alignment.Right,
		font = FONTS.GetFont( FONTS.MainMedium.File ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		left = -500,
		top = -f1_local2 / 2,
		right = 0,
		bottom = f1_local2 / 2
	} )
	self.text.id = "skipBinkText"
	self.text:setText( f1_local3 )
	self.text:SetAlpha( 0 )
	self:addElement( self.text )
	self.text:setTextStyle( CoD.TextStyle.Shadowed )
	local f1_local4, f1_local5, f1_local6, f1_local7 = GetTextDimensions( f1_local3, self.text:GetCurrentFont(), f1_local2 )
	local f1_local8 = f1_local6 - f1_local4
	self.bar = LUI.UIRadialProgressBar.new( {
		segmentCount = 2,
		segmentMaterial = "dpad_circle_segment"
	} )
	self.bar:SetAnchorsAndPosition( 1, 0, 0, 1, -f1_local8 - 10 - f1_local0, -f1_local8 - 10, 0, f1_local0 )
	self:addElement( self.bar )
	return self
end )
LockTable( _M )
