local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CounterUAVJam( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 425 * _1080p, 0, 60 * _1080p )
	self.id = "CounterUAVJam"
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
	Background:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	Background:SetAlpha( 0.6, 0 )
	Background:SetGlitchEnabled( true )
	Background:SetGlitchAmount( 0, 0 )
	Background:SetGlitchBlockWidth( 50, 0 )
	Background:SetGlitchBlockHeight( 50, 0 )
	Background:SetGlitchDistortionRange( 16, 0 )
	Background:SetGlitchScanlinePitch( 1, 0 )
	Background:SetGlitchMaskPitch( 1, 0 )
	Background:setImage( RegisterMaterial( "hud_bkgd_warning" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local MessageText = nil
	
	MessageText = LUI.UIText.new()
	MessageText.id = "MessageText"
	MessageText:SetAlpha( 0.8, 0 )
	MessageText:SetGlitchEnabled( true )
	MessageText:SetGlitchAmount( 1, 0 )
	MessageText:SetGlitchBlockWidth( 50, 0 )
	MessageText:SetGlitchBlockHeight( 50, 0 )
	MessageText:SetGlitchDistortionRange( 16, 0 )
	MessageText:SetGlitchScanlinePitch( 1, 0 )
	MessageText:SetGlitchMaskPitch( 1, 0 )
	MessageText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SYSTEM_COMPROMISED" ) ), 0 )
	MessageText:SetFontSize( 34 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 5, _1080p * -5, _1080p * 3, _1080p * 37 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	local StatusBar = nil
	
	StatusBar = LUI.UIImage.new()
	StatusBar.id = "StatusBar"
	StatusBar:SetAlpha( 0.8, 0 )
	StatusBar:SetGlitchEnabled( true )
	StatusBar:SetGlitchAmount( 0, 0 )
	StatusBar:SetGlitchBlockWidth( 50, 0 )
	StatusBar:SetGlitchBlockHeight( 50, 0 )
	StatusBar:SetGlitchDistortionRange( 16, 0 )
	StatusBar:SetGlitchScanlinePitch( 1, 0 )
	StatusBar:SetGlitchMaskPitch( 1, 0 )
	StatusBar:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 50, _1080p * 375, _1080p * -14, _1080p * -12 )
	self:addElement( StatusBar )
	self.StatusBar = StatusBar
	
	local Status1 = nil
	
	Status1 = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 4,
		minValue = 0,
		maxValue = 4000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	Status1.id = "Status1"
	Status1:SetAlpha( 0.8, 0 )
	Status1:SetGlitchEnabled( true )
	Status1:SetGlitchAmount( 1, 0 )
	Status1:SetGlitchBlockWidth( 50, 0 )
	Status1:SetGlitchBlockHeight( 50, 0 )
	Status1:SetGlitchDistortionRange( 16, 0 )
	Status1:SetGlitchScanlinePitch( 1, 0 )
	Status1:SetGlitchMaskPitch( 1, 0 )
	Status1:SetFontSize( 10 * _1080p )
	Status1:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Status1:SetAlignment( LUI.Alignment.Left )
	Status1:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 50, _1080p * 100, _1080p * -25, _1080p * -15 )
	self:addElement( Status1 )
	self.Status1 = Status1
	
	local Status2 = nil
	
	Status2 = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 8,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f1_local1
	} )
	Status2.id = "Status2"
	Status2:SetAlpha( 0.8, 0 )
	Status2:SetGlitchEnabled( true )
	Status2:SetGlitchAmount( 1, 0 )
	Status2:SetGlitchBlockWidth( 50, 0 )
	Status2:SetGlitchBlockHeight( 50, 0 )
	Status2:SetGlitchDistortionRange( 16, 0 )
	Status2:SetGlitchScanlinePitch( 1, 0 )
	Status2:SetGlitchMaskPitch( 1, 0 )
	Status2:SetFontSize( 10 * _1080p )
	Status2:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Status2:SetAlignment( LUI.Alignment.Right )
	Status2:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -100, _1080p * -50, _1080p * -25, _1080p * -15 )
	self:addElement( Status2 )
	self.Status2 = Status2
	
	local Warning = nil
	
	Warning = LUI.UIImage.new()
	Warning.id = "Warning"
	Warning:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	Warning:SetAlpha( 0.6, 0 )
	Warning:SetGlitchEnabled( true )
	Warning:SetGlitchAmount( 1, 0 )
	Warning:SetGlitchBlockWidth( 50, 0 )
	Warning:SetGlitchBlockHeight( 50, 0 )
	Warning:SetGlitchDistortionRange( 16, 0 )
	Warning:SetGlitchScanlinePitch( 1, 0 )
	Warning:SetGlitchMaskPitch( 1, 0 )
	Warning:setImage( RegisterMaterial( "hud_icon_warning" ), 0 )
	Warning:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, _1080p * -54, _1080p * 10 )
	self:addElement( Warning )
	self.Warning = Warning
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "BlinkOn", {
			{
				function ()
					return self.Background:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Background:SetGlitchAmount( 0, 150 )
				end,
				function ()
					return self.Background:SetGlitchAmount( 0, 290, LUI.EASING.outBack )
				end,
				function ()
					return self.Background:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.Background:SetGlitchAmount( 0, 910 )
				end,
				function ()
					return self.Background:SetGlitchAmount( 0, 1390, LUI.EASING.outBack )
				end,
				function ()
					return self.Background:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.Background:SetGlitchAmount( 0, 440 )
				end,
				function ()
					return self.Background:SetGlitchAmount( 0, 800 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchBlockWidth( 20, 0 )
				end,
				function ()
					return self.Background:SetGlitchBlockWidth( 7, 450 )
				end,
				function ()
					return self.Background:SetGlitchBlockWidth( 80, 2310 )
				end,
				function ()
					return self.Background:SetGlitchBlockWidth( 20, 1240 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchBlockHeight( 20, 0 )
				end,
				function ()
					return self.Background:SetGlitchBlockHeight( 31, 450 )
				end,
				function ()
					return self.Background:SetGlitchBlockHeight( 29, 2310 )
				end,
				function ()
					return self.Background:SetGlitchBlockHeight( 20, 1240 )
				end
			},
			{
				function ()
					return self.Background:SetGlitchDistortionRange( 40, 0 )
				end,
				function ()
					return self.Background:SetGlitchDistortionRange( 6, 450 )
				end,
				function ()
					return self.Background:SetGlitchDistortionRange( 20, 2310 )
				end,
				function ()
					return self.Background:SetGlitchDistortionRange( 16, 1240 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "BlinkOn", {
			{
				function ()
					return self.MessageText:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.MessageText:SetGlitchAmount( 0, 150 )
				end,
				function ()
					return self.MessageText:SetGlitchAmount( 0, 290 )
				end,
				function ()
					return self.MessageText:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.MessageText:SetGlitchAmount( 0, 910, LUI.EASING.outBack )
				end,
				function ()
					return self.MessageText:SetGlitchAmount( 0, 1390 )
				end,
				function ()
					return self.MessageText:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.MessageText:SetGlitchAmount( 0, 440 )
				end,
				function ()
					return self.MessageText:SetGlitchAmount( 0, 800, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MessageText:SetGlitchBlockWidth( 13, 0 )
				end,
				function ()
					return self.MessageText:SetGlitchBlockWidth( 15, 450 )
				end,
				function ()
					return self.MessageText:SetGlitchBlockWidth( 80, 2310 )
				end,
				function ()
					return self.MessageText:SetGlitchBlockWidth( 13, 1240, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MessageText:SetGlitchBlockHeight( 13, 0 )
				end,
				function ()
					return self.MessageText:SetGlitchBlockHeight( 22, 450 )
				end,
				function ()
					return self.MessageText:SetGlitchBlockHeight( 5, 2310 )
				end,
				function ()
					return self.MessageText:SetGlitchBlockHeight( 13, 1240, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MessageText:SetGlitchDistortionRange( 16, 0 )
				end,
				function ()
					return self.MessageText:SetGlitchDistortionRange( 6, 450 )
				end,
				function ()
					return self.MessageText:SetGlitchDistortionRange( 17, 2310 )
				end,
				function ()
					return self.MessageText:SetGlitchDistortionRange( 16, 1240, LUI.EASING.outBack )
				end
			}
		} )
		StatusBar:RegisterAnimationSequence( "BlinkOn", {
			{
				function ()
					return self.StatusBar:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.StatusBar:SetGlitchAmount( 0, 150 )
				end,
				function ()
					return self.StatusBar:SetGlitchAmount( 0, 290 )
				end,
				function ()
					return self.StatusBar:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.StatusBar:SetGlitchAmount( 0, 910 )
				end,
				function ()
					return self.StatusBar:SetGlitchAmount( 0, 1390 )
				end,
				function ()
					return self.StatusBar:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.StatusBar:SetGlitchAmount( 1, 440 )
				end,
				function ()
					return self.StatusBar:SetGlitchAmount( 0, 800, LUI.EASING.outQuintic )
				end
			},
			{
				function ()
					return self.StatusBar:SetGlitchBlockWidth( 13, 0 )
				end,
				function ()
					return self.StatusBar:SetGlitchBlockWidth( 15, 450 )
				end,
				function ()
					return self.StatusBar:SetGlitchBlockWidth( 80, 2310 )
				end,
				function ()
					return self.StatusBar:SetGlitchBlockWidth( 13, 1240, LUI.EASING.outQuintic )
				end
			},
			{
				function ()
					return self.StatusBar:SetGlitchBlockHeight( 13, 0 )
				end,
				function ()
					return self.StatusBar:SetGlitchBlockHeight( 22, 450 )
				end,
				function ()
					return self.StatusBar:SetGlitchBlockHeight( 5, 2310 )
				end,
				function ()
					return self.StatusBar:SetGlitchBlockHeight( 13, 1240, LUI.EASING.outQuintic )
				end
			},
			{
				function ()
					return self.StatusBar:SetGlitchDistortionRange( 16, 0 )
				end,
				function ()
					return self.StatusBar:SetGlitchDistortionRange( 6, 450 )
				end,
				function ()
					return self.StatusBar:SetGlitchDistortionRange( 17, 2310 )
				end,
				function ()
					return self.StatusBar:SetGlitchDistortionRange( 16, 1240, LUI.EASING.outQuintic )
				end
			},
			{
				function ()
					return self.StatusBar:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 50, _1080p * 50, _1080p * -14, _1080p * -12, 0 )
				end,
				function ()
					return self.StatusBar:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 50, _1080p * 75, _1080p * -14, _1080p * -12, 1250 )
				end,
				function ()
					return self.StatusBar:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 50, _1080p * 75, _1080p * -14, _1080p * -12, 500 )
				end,
				function ()
					return self.StatusBar:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 50, _1080p * 150, _1080p * -14, _1080p * -12, 1509 )
				end,
				function ()
					return self.StatusBar:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 50, _1080p * 150, _1080p * -14, _1080p * -12, 1029 )
				end,
				function ()
					return self.StatusBar:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 50, _1080p * 300, _1080p * -14, _1080p * -12, 1960 )
				end,
				function ()
					return self.StatusBar:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 50, _1080p * 300, _1080p * -14, _1080p * -12, 730 )
				end,
				function ()
					return self.StatusBar:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 50, _1080p * 375, _1080p * -14, _1080p * -12, 1019 )
				end
			}
		} )
		Status1:RegisterAnimationSequence( "BlinkOn", {
			{
				function ()
					return self.Status1:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Status1:SetGlitchAmount( 0, 150 )
				end,
				function ()
					return self.Status1:SetGlitchAmount( 0, 290 )
				end,
				function ()
					return self.Status1:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.Status1:SetGlitchAmount( 0, 910, LUI.EASING.outBack )
				end,
				function ()
					return self.Status1:SetGlitchAmount( 0, 1390 )
				end,
				function ()
					return self.Status1:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.Status1:SetGlitchAmount( 0, 440 )
				end,
				function ()
					return self.Status1:SetGlitchAmount( 0, 800, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Status1:SetGlitchBlockWidth( 13, 0 )
				end,
				function ()
					return self.Status1:SetGlitchBlockWidth( 15, 450 )
				end,
				function ()
					return self.Status1:SetGlitchBlockWidth( 80, 2310 )
				end,
				function ()
					return self.Status1:SetGlitchBlockWidth( 13, 1240, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Status1:SetGlitchBlockHeight( 13, 0 )
				end,
				function ()
					return self.Status1:SetGlitchBlockHeight( 22, 450 )
				end,
				function ()
					return self.Status1:SetGlitchBlockHeight( 5, 2310 )
				end,
				function ()
					return self.Status1:SetGlitchBlockHeight( 13, 1240, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Status1:SetGlitchDistortionRange( 16, 0 )
				end,
				function ()
					return self.Status1:SetGlitchDistortionRange( 6, 450 )
				end,
				function ()
					return self.Status1:SetGlitchDistortionRange( 17, 2310 )
				end,
				function ()
					return self.Status1:SetGlitchDistortionRange( 16, 1240, LUI.EASING.outBack )
				end
			}
		} )
		Status2:RegisterAnimationSequence( "BlinkOn", {
			{
				function ()
					return self.Status2:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Status2:SetGlitchAmount( 0, 150 )
				end,
				function ()
					return self.Status2:SetGlitchAmount( 0, 290 )
				end,
				function ()
					return self.Status2:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.Status2:SetGlitchAmount( 0, 910, LUI.EASING.outBack )
				end,
				function ()
					return self.Status2:SetGlitchAmount( 0, 1390 )
				end,
				function ()
					return self.Status2:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.Status2:SetGlitchAmount( 0, 440 )
				end,
				function ()
					return self.Status2:SetGlitchAmount( 0, 800, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Status2:SetGlitchBlockWidth( 13, 0 )
				end,
				function ()
					return self.Status2:SetGlitchBlockWidth( 15, 450 )
				end,
				function ()
					return self.Status2:SetGlitchBlockWidth( 80, 2310 )
				end,
				function ()
					return self.Status2:SetGlitchBlockWidth( 13, 1240, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Status2:SetGlitchBlockHeight( 13, 0 )
				end,
				function ()
					return self.Status2:SetGlitchBlockHeight( 22, 450 )
				end,
				function ()
					return self.Status2:SetGlitchBlockHeight( 5, 2310 )
				end,
				function ()
					return self.Status2:SetGlitchBlockHeight( 13, 1240, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Status2:SetGlitchDistortionRange( 16, 0 )
				end,
				function ()
					return self.Status2:SetGlitchDistortionRange( 6, 450 )
				end,
				function ()
					return self.Status2:SetGlitchDistortionRange( 17, 2310 )
				end,
				function ()
					return self.Status2:SetGlitchDistortionRange( 16, 1240, LUI.EASING.outBack )
				end
			}
		} )
		Warning:RegisterAnimationSequence( "BlinkOn", {
			{
				function ()
					return self.Warning:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Warning:SetGlitchAmount( 0, 150 )
				end,
				function ()
					return self.Warning:SetGlitchAmount( 0, 290, LUI.EASING.outBack )
				end,
				function ()
					return self.Warning:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.Warning:SetGlitchAmount( 0, 910 )
				end,
				function ()
					return self.Warning:SetGlitchAmount( 0, 1390, LUI.EASING.outBack )
				end,
				function ()
					return self.Warning:SetGlitchAmount( 1, 10 )
				end,
				function ()
					return self.Warning:SetGlitchAmount( 0, 440 )
				end,
				function ()
					return self.Warning:SetGlitchAmount( 0, 800 )
				end
			},
			{
				function ()
					return self.Warning:SetGlitchBlockWidth( 20, 0 )
				end,
				function ()
					return self.Warning:SetGlitchBlockWidth( 7, 450 )
				end,
				function ()
					return self.Warning:SetGlitchBlockWidth( 80, 2310 )
				end,
				function ()
					return self.Warning:SetGlitchBlockWidth( 20, 1240 )
				end
			},
			{
				function ()
					return self.Warning:SetGlitchBlockHeight( 20, 0 )
				end,
				function ()
					return self.Warning:SetGlitchBlockHeight( 31, 450 )
				end,
				function ()
					return self.Warning:SetGlitchBlockHeight( 29, 2310 )
				end,
				function ()
					return self.Warning:SetGlitchBlockHeight( 20, 1240 )
				end
			},
			{
				function ()
					return self.Warning:SetGlitchDistortionRange( 40, 0 )
				end,
				function ()
					return self.Warning:SetGlitchDistortionRange( 6, 450 )
				end,
				function ()
					return self.Warning:SetGlitchDistortionRange( 20, 2310 )
				end,
				function ()
					return self.Warning:SetGlitchDistortionRange( 16, 1240 )
				end
			}
		} )
		self._sequences.BlinkOn = function ()
			Background:AnimateLoop( "BlinkOn" )
			MessageText:AnimateLoop( "BlinkOn" )
			StatusBar:AnimateLoop( "BlinkOn" )
			Status1:AnimateLoop( "BlinkOn" )
			Status2:AnimateLoop( "BlinkOn" )
			Warning:AnimateLoop( "BlinkOn" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "hud_anim_bootup_on", function ( f139_arg0, f139_arg1 )
		local f139_local0 = f139_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "BlinkOn" )
	end )
	return self
end

MenuBuilder.registerType( "CounterUAVJam", CounterUAVJam )
LockTable( _M )
