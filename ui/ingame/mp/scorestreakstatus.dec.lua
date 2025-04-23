local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FlashLowTimeRemaining( f1_arg0, f1_arg1 )
	ACTIONS.AnimateSequence( f1_arg0:getParent(), "FlashLowTimeRemaining" )
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.CountdownTimer )
	f2_arg0.CountdownTimer:registerEventHandler( "time10sec", FlashLowTimeRemaining )
	if IsLanguageOversizedFont() then
		f2_arg0.CountdownTimer:SetTop( _1080p * 4, 0 )
		f2_arg0.CountdownTimer:SetBottom( _1080p * 24, 0 )
		f2_arg0.VenomOnlineText:SetTop( _1080p * 4, 0 )
		f2_arg0.VenomOnlineText:SetBottom( _1080p * 24, 0 )
	end
end

function ScorestreakStatus( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 425 * _1080p, 0, 32 * _1080p )
	self.id = "ScorestreakStatus"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local TimerBacking = nil
	
	TimerBacking = LUI.UIImage.new()
	TimerBacking.id = "TimerBacking"
	TimerBacking:SetRGBFromInt( 0, 0 )
	TimerBacking:SetAlpha( 0.3, 0 )
	TimerBacking:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 102.5, _1080p * 200, _1080p * 1, _1080p * 32 )
	self:addElement( TimerBacking )
	self.TimerBacking = TimerBacking
	
	local TimerBorder = nil
	
	TimerBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	TimerBorder.id = "TimerBorder"
	TimerBorder:SetRGBFromInt( 12772835, 0 )
	TimerBorder:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 100, _1080p * 202, 0, _1080p * 32 )
	self:addElement( TimerBorder )
	self.TimerBorder = TimerBorder
	
	local CountdownTimer = nil
	
	CountdownTimer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f3_local1
	} )
	CountdownTimer.id = "CountdownTimer"
	CountdownTimer:SetFontSize( 24 * _1080p )
	CountdownTimer:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CountdownTimer:SetAlignment( LUI.Alignment.Center )
	CountdownTimer:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 102.5, _1080p * 200, _1080p * 4, _1080p * 28 )
	CountdownTimer:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.countdown:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.MP.scorestreakHuds.countdown:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			CountdownTimer:setEndTime( f4_local0 )
		end
	end )
	self:addElement( CountdownTimer )
	self.CountdownTimer = CountdownTimer
	
	local HealthBar = nil
	
	HealthBar = LUI.UIImage.new()
	HealthBar.id = "HealthBar"
	HealthBar:SetAnchors( 0.5, 0.5, 0, 1, 0 )
	HealthBar:SetLeft( _1080p * -132, 0 )
	HealthBar:SetTop( _1080p * 0, 0 )
	HealthBar:SetBottom( _1080p * 32, 0 )
	HealthBar:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	HealthBar:SetAlpha( 0.5, 0 )
	HealthBar:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.health:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.MP.scorestreakHuds.health:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			HealthBar:SetRight( _1080p * Subtract( Multiply( f5_local0, 220 ), 132 ), 0 )
		end
	end )
	self:addElement( HealthBar )
	self.HealthBar = HealthBar
	
	local HealthBarBorder = nil
	
	HealthBarBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	HealthBarBorder.id = "HealthBarBorder"
	HealthBarBorder:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	HealthBarBorder:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -132, _1080p * 88, 0, _1080p * 32 )
	self:addElement( HealthBarBorder )
	self.HealthBarBorder = HealthBarBorder
	
	local HealthBarBox = nil
	
	HealthBarBox = LUI.UIImage.new()
	HealthBarBox.id = "HealthBarBox"
	HealthBarBox:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	HealthBarBox:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -180, _1080p * -148, 0, _1080p * 32 )
	self:addElement( HealthBarBox )
	self.HealthBarBox = HealthBarBox
	
	local VenomOnlineText = nil
	
	VenomOnlineText = LUI.UIStyledText.new()
	VenomOnlineText.id = "VenomOnlineText"
	VenomOnlineText:setText( Engine.Localize( "LUA_MENU_MP_VENOM_ONLINE" ), 0 )
	VenomOnlineText:SetFontSize( 24 * _1080p )
	VenomOnlineText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	VenomOnlineText:SetAlignment( LUI.Alignment.Center )
	VenomOnlineText:SetDecodeLetterLength( 50 )
	VenomOnlineText:SetDecodeMaxRandChars( 4 )
	VenomOnlineText:SetDecodeUpdatesPerLetter( 4 )
	VenomOnlineText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -133, _1080p * 89, _1080p * 4, _1080p * 28 )
	self:addElement( VenomOnlineText )
	self.VenomOnlineText = VenomOnlineText
	
	local HealthBarBoxFlashing = nil
	
	HealthBarBoxFlashing = LUI.UIImage.new()
	HealthBarBoxFlashing.id = "HealthBarBoxFlashing"
	HealthBarBoxFlashing:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 0 )
	HealthBarBoxFlashing:SetAlpha( 0, 0 )
	HealthBarBoxFlashing:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -180, _1080p * -148, 0, _1080p * 32 )
	self:addElement( HealthBarBoxFlashing )
	self.HealthBarBoxFlashing = HealthBarBoxFlashing
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TimerBorder:RegisterAnimationSequence( "ShowLowHealth", {
			{
				function ()
					return self.TimerBorder:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 0 )
				end
			}
		} )
		HealthBar:RegisterAnimationSequence( "ShowLowHealth", {
			{
				function ()
					return self.HealthBar:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 0 )
				end
			}
		} )
		HealthBarBorder:RegisterAnimationSequence( "ShowLowHealth", {
			{
				function ()
					return self.HealthBarBorder:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 0 )
				end
			}
		} )
		HealthBarBox:RegisterAnimationSequence( "ShowLowHealth", {
			{
				function ()
					return self.HealthBarBox:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 0 )
				end
			},
			{
				function ()
					return self.HealthBarBox:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HealthBarBox:SetAlpha( 1, 100 )
				end,
				function ()
					return self.HealthBarBox:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ShowLowHealth = function ()
			TimerBorder:AnimateLoop( "ShowLowHealth" )
			HealthBar:AnimateLoop( "ShowLowHealth" )
			HealthBarBorder:AnimateLoop( "ShowLowHealth" )
			HealthBarBox:AnimateLoop( "ShowLowHealth" )
		end
		
		TimerBorder:RegisterAnimationSequence( "YellowOrangeState", {
			{
				function ()
					return self.TimerBorder:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
				end
			}
		} )
		CountdownTimer:RegisterAnimationSequence( "YellowOrangeState", {
			{
				function ()
					return self.CountdownTimer:SetAlpha( 1, 0 )
				end
			}
		} )
		HealthBar:RegisterAnimationSequence( "YellowOrangeState", {
			{
				function ()
					return self.HealthBar:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
				end
			}
		} )
		HealthBarBorder:RegisterAnimationSequence( "YellowOrangeState", {
			{
				function ()
					return self.HealthBarBorder:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		HealthBarBox:RegisterAnimationSequence( "YellowOrangeState", {
			{
				function ()
					return self.HealthBarBox:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
				end
			},
			{
				function ()
					return self.HealthBarBox:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.YellowOrangeState = function ()
			TimerBorder:AnimateSequence( "YellowOrangeState" )
			CountdownTimer:AnimateSequence( "YellowOrangeState" )
			HealthBar:AnimateSequence( "YellowOrangeState" )
			HealthBarBorder:AnimateSequence( "YellowOrangeState" )
			HealthBarBox:AnimateSequence( "YellowOrangeState" )
		end
		
		CountdownTimer:RegisterAnimationSequence( "FlashLowTimeRemaining", {
			{
				function ()
					return self.CountdownTimer:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CountdownTimer:SetAlpha( 0, 300, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CountdownTimer:SetAlpha( 1, 10 )
				end,
				function ()
					return self.CountdownTimer:SetAlpha( 1, 690 )
				end
			}
		} )
		self._sequences.FlashLowTimeRemaining = function ()
			CountdownTimer:AnimateLoop( "FlashLowTimeRemaining" )
		end
		
		TimerBorder:RegisterAnimationSequence( "DefaultBlueState", {
			{
				function ()
					return self.TimerBorder:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
				end
			}
		} )
		CountdownTimer:RegisterAnimationSequence( "DefaultBlueState", {
			{
				function ()
					return self.CountdownTimer:SetAlpha( 1, 0 )
				end
			}
		} )
		HealthBar:RegisterAnimationSequence( "DefaultBlueState", {
			{
				function ()
					return self.HealthBar:SetRGBFromTable( SWATCHES.HUD.active, 0 )
				end
			}
		} )
		HealthBarBorder:RegisterAnimationSequence( "DefaultBlueState", {
			{
				function ()
					return self.HealthBarBorder:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
				end
			}
		} )
		HealthBarBox:RegisterAnimationSequence( "DefaultBlueState", {
			{
				function ()
					return self.HealthBarBox:SetRGBFromTable( SWATCHES.HUD.active, 0 )
				end
			},
			{
				function ()
					return self.HealthBarBox:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.DefaultBlueState = function ()
			TimerBorder:AnimateSequence( "DefaultBlueState" )
			CountdownTimer:AnimateSequence( "DefaultBlueState" )
			HealthBar:AnimateSequence( "DefaultBlueState" )
			HealthBarBorder:AnimateSequence( "DefaultBlueState" )
			HealthBarBox:AnimateSequence( "DefaultBlueState" )
		end
		
		HealthBarBox:RegisterAnimationSequence( "FlashDamage", {
			{
				function ()
					return self.HealthBarBox:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HealthBarBox:SetAlpha( 0, 700 )
				end,
				function ()
					return self.HealthBarBox:SetAlpha( 1, 100 )
				end
			}
		} )
		HealthBarBoxFlashing:RegisterAnimationSequence( "FlashDamage", {
			{
				function ()
					return self.HealthBarBoxFlashing:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HealthBarBoxFlashing:SetAlpha( 0, 100 )
				end,
				function ()
					return self.HealthBarBoxFlashing:SetAlpha( 1, 100 )
				end,
				function ()
					return self.HealthBarBoxFlashing:SetAlpha( 0, 100 )
				end,
				function ()
					return self.HealthBarBoxFlashing:SetAlpha( 1, 100 )
				end,
				function ()
					return self.HealthBarBoxFlashing:SetAlpha( 0, 100 )
				end,
				function ()
					return self.HealthBarBoxFlashing:SetAlpha( 1, 100 )
				end,
				function ()
					return self.HealthBarBoxFlashing:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.FlashDamage = function ()
			HealthBarBox:AnimateSequence( "FlashDamage" )
			HealthBarBoxFlashing:AnimateSequence( "FlashDamage" )
		end
		
		TimerBorder:RegisterAnimationSequence( "GreyscaleState", {
			{
				function ()
					return self.TimerBorder:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		CountdownTimer:RegisterAnimationSequence( "GreyscaleState", {
			{
				function ()
					return self.CountdownTimer:SetAlpha( 1, 0 )
				end
			}
		} )
		HealthBar:RegisterAnimationSequence( "GreyscaleState", {
			{
				function ()
					return self.HealthBar:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		HealthBarBorder:RegisterAnimationSequence( "GreyscaleState", {
			{
				function ()
					return self.HealthBarBorder:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		HealthBarBox:RegisterAnimationSequence( "GreyscaleState", {
			{
				function ()
					return self.HealthBarBox:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.GreyscaleState = function ()
			TimerBorder:AnimateSequence( "GreyscaleState" )
			CountdownTimer:AnimateSequence( "GreyscaleState" )
			HealthBar:AnimateSequence( "GreyscaleState" )
			HealthBarBorder:AnimateSequence( "GreyscaleState" )
			HealthBarBox:AnimateSequence( "GreyscaleState" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.health:GetModel( f3_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.health:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.health:GetValue( f3_local1 ) < 0.25 then
			ACTIONS.AnimateSequence( self, "ShowLowHealth" )
		end
		if DataSources.inGame.MP.scorestreakHuds.health:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.health:GetValue( f3_local1 ) >= 0.25 and DataSources.inGame.MP.scorestreakHuds.health:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.health:GetValue( f3_local1 ) < 1 then
			ACTIONS.AnimateSequence( self, "FlashDamage" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ScorestreakStatus", ScorestreakStatus )
LockTable( _M )
