local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
ZMSecureStates = {
	Off = 0,
	Reviving = 3,
	Skeeball = 21
}
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.Header
	if f1_local1 then
		f1_local1 = f1_arg0.Header.MessageText
	end
	f1_local0( f1_local1, "WARNING: Revive Progress Bar Items Are Missing..." )
	f1_local0 = f1_arg0.Header
	f1_local1 = f1_arg0.Header.MessageText
	local f1_local2 = f1_local1:GetCurrentFont()
	local f1_local3, f1_local4, f1_local5, f1_local6 = f1_local1:getLocalRect()
	local f1_local7 = math.abs( f1_local3 - f1_local5 )
	local f1_local8 = math.abs( f1_local4 - f1_local6 )
	local f1_local9 = ToUpperCase( f1_arg1 )
	local f1_local10, f1_local11, f1_local12, f1_local13 = GetTextDimensions( f1_local9, f1_local2, f1_local8, f1_local7 )
	local f1_local14 = math.abs( f1_local10 - f1_local12 )
	local f1_local15 = _1080p * 26
	local f1_local16 = _1080p * -118
	f1_local0:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, f1_local16, f1_local16 + f1_local14 + f1_local15, _1080p * -2, _1080p * 30, 100, LUI.EASING.outBack )
	f1_local1:setText( f1_local9 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetHeader = f0_local0
	f2_arg0.visible = false
	local f2_local0 = DataSources.inGame.CP.zombies.secureState
	f2_arg0:SubscribeToModel( f2_local0:GetModel( f2_arg1 ), function ()
		local f3_local0 = f2_local0:GetValue( f2_arg1 )
		local f3_local1 = ""
		if f3_local0 == ZMSecureStates.Reviving then
			f3_local1 = Engine.Localize( "MPUI_REVIVING" )
		elseif f3_local0 == ZMSecureStates.Skeeball then
			f3_local1 = Engine.Localize( "COOP_INTERACTIONS_SKEEBALL_FORCE" )
		end
		if f3_local0 == ZMSecureStates.Off and f2_arg0.visible then
			ACTIONS.AnimateSequence( f2_arg0, "Hide" )
			f2_arg0.visible = false
		elseif f3_local0 ~= ZMSecureStates.Off and not f2_arg0.visible then
			ACTIONS.AnimateSequence( f2_arg0, "Show" )
			f2_arg0.visible = true
		end
		if f3_local0 then
			f2_arg0:SetHeader( f3_local1 )
		end
	end )
end

function ReviveBarContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 64 * _1080p )
	self.id = "ReviveBarContainer"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Accent = nil
	
	Accent = LUI.UIImage.new()
	Accent.id = "Accent"
	Accent:SetAlpha( 0.5, 0 )
	Accent:SetScale( 0.25, 0 )
	Accent:setImage( RegisterMaterial( "zm_revive_bar_accent" ), 0 )
	Accent:SetUseAA( true )
	Accent:SetBlendMode( BLEND_MODE.addWithAlpha )
	Accent:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -127, _1080p * 129, _1080p * -36, _1080p * 28 )
	self:addElement( Accent )
	self.Accent = Accent
	
	local Header = nil
	
	Header = MenuBuilder.BuildRegisteredType( "ReviveBarHeader", {
		controllerIndex = f4_local1
	} )
	Header.id = "Header"
	Header:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -118, _1080p * 32, _1080p * -2, _1080p * 30 )
	self:addElement( Header )
	self.Header = Header
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "zm_revive_bar_bg" ), 0 )
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -16, _1080p * 16 )
	self:addElement( Background )
	self.Background = Background
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "ReviveProgressBar", {
		controllerIndex = f4_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -110, _1080p * 110, _1080p * -16, _1080p * 16 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	self._animationSets.DefaultAnimationSet = function ()
		Accent:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Accent:SetAlpha( 0, 0 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Accent:AnimateSequence( "DefaultSequence" )
			Header:AnimateSequence( "DefaultSequence" )
			Background:AnimateSequence( "DefaultSequence" )
			ProgressBar:AnimateSequence( "DefaultSequence" )
		end
		
		Accent:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Accent:SetScale( -1, 0 )
				end,
				function ()
					return self.Accent:SetScale( 0.25, 150, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Accent:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Accent:SetAlpha( 0.5, 150, LUI.EASING.outBack )
				end
			}
		} )
		Header:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Header:SetScale( -1, 0 )
				end,
				function ()
					return self.Header:SetScale( -1, 150 )
				end,
				function ()
					return self.Header:SetScale( 0, 150, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 150 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 150, LUI.EASING.outBack )
				end
			}
		} )
		Background:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 100 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 150, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Background:SetScale( -1, 0 )
				end,
				function ()
					return self.Background:SetScale( -1, 100 )
				end,
				function ()
					return self.Background:SetScale( 0, 150, LUI.EASING.outBack )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.ProgressBar:SetScale( -1, 0 )
				end,
				function ()
					return self.ProgressBar:SetScale( -1, 100 )
				end,
				function ()
					return self.ProgressBar:SetScale( 0, 150, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ProgressBar:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ProgressBar:SetAlpha( 0, 100 )
				end,
				function ()
					return self.ProgressBar:SetAlpha( 1, 150, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Show = function ()
			Accent:AnimateSequence( "Show" )
			Header:AnimateSequence( "Show" )
			Background:AnimateSequence( "Show" )
			ProgressBar:AnimateSequence( "Show" )
		end
		
		Accent:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Accent:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.Accent:SetAlpha( 0, 150, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Accent:SetScale( 0.25, 0 )
				end,
				function ()
					return self.Accent:SetScale( -1, 150, LUI.EASING.inBack )
				end
			}
		} )
		Header:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Header:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 150, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Header:SetScale( 0, 0 )
				end,
				function ()
					return self.Header:SetScale( -1, 150, LUI.EASING.inBack )
				end
			}
		} )
		Background:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 150, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Background:SetScale( 0, 0 )
				end,
				function ()
					return self.Background:SetScale( -1, 150, LUI.EASING.inBack )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ProgressBar:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ProgressBar:SetAlpha( 0, 150, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.ProgressBar:SetScale( 0, 0 )
				end,
				function ()
					return self.ProgressBar:SetScale( -1, 150, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.Hide = function ()
			Accent:AnimateSequence( "Hide" )
			Header:AnimateSequence( "Hide" )
			Background:AnimateSequence( "Hide" )
			ProgressBar:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "ReviveBarContainer", ReviveBarContainer )
LockTable( _M )
