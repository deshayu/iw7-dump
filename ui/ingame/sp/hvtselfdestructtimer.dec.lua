local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GetTextWidth( f1_arg0 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = GetTextDimensions( f1_arg0, FONTS.GetFont( FONTS.MainBold.File ), 32 )
	return f1_local2
end

f0_local0 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = GetTextWidth( f2_arg0.Text:getText() )
	local f2_local1 = GetTextWidth( "0:00.0" )
	local f2_local2 = 2
	local f2_local3 = (f2_local0 - f2_local1) / 2
	f2_arg0.Text:SetRight( _1080p * f2_local3 - f2_local2, 0 )
	f2_arg0.Timer:SetLeft( _1080p * f2_local3 + f2_local2, 0 )
end

function HVTSelfDestructTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 550 * _1080p, 0, 34 * _1080p )
	self.id = "HVTSelfDestructTimer"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self.soundSet = "countdownTimer"
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 16714496, 0 )
	Background:SetAlpha( 0.2, 0 )
	Background:SetBlendMode( BLEND_MODE.blend )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * -4, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:setText( LocalizeString( ToUpperCase( Engine.Localize( "PHSTREETS_CORE_OVERHEAT" ) ) ), 0 )
	Text:SetFontSize( 24 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text:SetAlignment( LUI.Alignment.Right )
	Text:SetOptOutRightToLeftAlignmentFlip( true )
	Text:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -457, _1080p * 43, _1080p * 5, _1080p * 29 )
	self:addElement( Text )
	self.Text = Text
	
	local Timer = nil
	
	Timer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f3_local1
	} )
	Timer.id = "Timer"
	Timer:SetFontSize( 24 * _1080p )
	Timer:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Timer:SetAlignment( LUI.Alignment.Left )
	Timer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 50, _1080p * 550, _1080p * 5, _1080p * 29 )
	Timer:SubscribeToModel( DataSources.inGame.SP.pearlHarbor.hvtSelfDestructTimer:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.SP.pearlHarbor.hvtSelfDestructTimer:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Timer:setEndTime( f4_local0 )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	local CapRight = nil
	
	CapRight = LUI.UIImage.new()
	CapRight.id = "CapRight"
	CapRight:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 3, 0, 0 )
	self:addElement( CapRight )
	self.CapRight = CapRight
	
	local CapLeft = nil
	
	CapLeft = LUI.UIImage.new()
	CapLeft.id = "CapLeft"
	CapLeft:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, 0 )
	self:addElement( CapLeft )
	self.CapLeft = CapLeft
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 234.5, _1080p * -237.5, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		Text:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Text:SetAlpha( 1, 50 )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Timer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Timer:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Timer:SetAlpha( 1, 50 )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.CapRight:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -238, _1080p * -235, 0, 0, 0 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 3, _1080p * 6, 0, 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.CapLeft:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 232, _1080p * 235, 0, 0, 0 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -6, _1080p * -3, 0, 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Show = function ()
			Background:AnimateSequence( "Show" )
			Text:AnimateSequence( "Show" )
			Timer:AnimateSequence( "Show" )
			CapRight:AnimateSequence( "Show" )
			CapLeft:AnimateSequence( "Show" )
		end
		
		Background:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Background:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.3, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.Background:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 237.5, _1080p * -237.5, 0, 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		Text:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Text:SetAlpha( 0, 50 )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Timer:SetAlpha( 0, 50 )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.CapRight:SetAlpha( 1, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 3, _1080p * 6, 0, 0, 0 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -237.5, _1080p * -234.5, 0, 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.CapLeft:SetAlpha( 1, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -6, _1080p * -3, 0, 0, 0 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 233.5, _1080p * 236.5, 0, 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.Hide = function ()
			Background:AnimateSequence( "Hide" )
			Text:AnimateSequence( "Hide" )
			Timer:AnimateSequence( "Hide" )
			CapRight:AnimateSequence( "Hide" )
			CapLeft:AnimateSequence( "Hide" )
		end
		
		Background:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Timer:SetAlpha( 0, 0 )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.CapRight:SetAlpha( 0, 0 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.CapLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			Background:AnimateSequence( "Hidden" )
			Text:AnimateSequence( "Hidden" )
			Timer:AnimateSequence( "Hidden" )
			CapRight:AnimateSequence( "Hidden" )
			CapLeft:AnimateSequence( "Hidden" )
		end
		
		Background:RegisterAnimationSequence( "FlashBackground", {
			{
				function ()
					return self.Background:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.8, 500, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.Background:SetAlpha( 0.2, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.FlashBackground = function ()
			Background:AnimateLoop( "FlashBackground" )
		end
		
		Text:RegisterAnimationSequence( "ReadsRightToLeft", {
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -30, _1080p * 150, _1080p * 5, _1080p * 29, 0 )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "ReadsRightToLeft", {
			{
				function ()
					return self.Timer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -138, _1080p * -41, _1080p * 5, _1080p * 29, 0 )
				end
			}
		} )
		self._sequences.ReadsRightToLeft = function ()
			Text:AnimateSequence( "ReadsRightToLeft" )
			Timer:AnimateSequence( "ReadsRightToLeft" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.pearlHarbor.hvtSelfDestruct:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.pearlHarbor.hvtSelfDestruct:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.pearlHarbor.hvtSelfDestruct:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Show" )
			ACTIONS.AnimateSequence( self, "FlashBackground" )
		end
		if DataSources.inGame.SP.pearlHarbor.hvtSelfDestruct:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.pearlHarbor.hvtSelfDestruct:GetValue( f3_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Hide" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "ReadsRightToLeft" )
	end
	return self
end

MenuBuilder.registerType( "HVTSelfDestructTimer", HVTSelfDestructTimer )
LockTable( _M )
