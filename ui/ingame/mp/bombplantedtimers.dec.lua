local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetYRotation( 25 )
end

function BombPlantedTimers( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 140 * _1080p )
	self.id = "BombPlantedTimers"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local BombPlantedTrackerB = nil
	
	BombPlantedTrackerB = MenuBuilder.BuildRegisteredType( "BombPlantedTracker", {
		controllerIndex = f2_local1
	} )
	BombPlantedTrackerB.id = "BombPlantedTrackerB"
	BombPlantedTrackerB:SetDataSource( DataSources.inGame.HUD.bombPlantedB, f2_local1 )
	BombPlantedTrackerB.BombPlantedOutline:SetRGBFromTable( SWATCHES.HUD.disabled, 0 )
	BombPlantedTrackerB.BombPlanted:setText( Engine.Localize( "MP_BOMB_PLANT_B" ), 0 )
	BombPlantedTrackerB:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 60, _1080p * 36, _1080p * 63 )
	BombPlantedTrackerB.Background:BindColorToModel( DataSources.inGame.HUD.bombModeTimerStatusColor:GetModel( f2_local1 ) )
	self:addElement( BombPlantedTrackerB )
	self.BombPlantedTrackerB = BombPlantedTrackerB
	
	local BombPlantedTrackerA = nil
	
	BombPlantedTrackerA = MenuBuilder.BuildRegisteredType( "BombPlantedTracker", {
		controllerIndex = f2_local1
	} )
	BombPlantedTrackerA.id = "BombPlantedTrackerA"
	BombPlantedTrackerA:SetDataSource( DataSources.inGame.HUD.bombPlantedA, f2_local1 )
	BombPlantedTrackerA.BombPlantedOutline:SetRGBFromTable( SWATCHES.HUD.disabled, 0 )
	BombPlantedTrackerA.BombPlanted:setText( Engine.Localize( "MP_BOMB_PLANT_A" ), 0 )
	BombPlantedTrackerA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 60, _1080p * 6, _1080p * 33 )
	BombPlantedTrackerA.Background:BindColorToModel( DataSources.inGame.HUD.bombModeTimerStatusColor:GetModel( f2_local1 ) )
	self:addElement( BombPlantedTrackerA )
	self.BombPlantedTrackerA = BombPlantedTrackerA
	
	local BackgroundA = nil
	
	BackgroundA = LUI.UIImage.new()
	BackgroundA.id = "BackgroundA"
	BackgroundA:SetAlpha( 0.5, 0 )
	BackgroundA:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	BackgroundA:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 61, _1080p * -205, _1080p * 6, _1080p * -107 )
	BackgroundA:BindColorToModel( DataSources.inGame.HUD.bombModeTimerStatusColor:GetModel( f2_local1 ) )
	self:addElement( BackgroundA )
	self.BackgroundA = BackgroundA
	
	local ClockOutlineA = nil
	
	ClockOutlineA = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	ClockOutlineA.id = "ClockOutlineA"
	ClockOutlineA:SetRGBFromTable( SWATCHES.HUD.disabled, 0 )
	ClockOutlineA:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 61, _1080p * -205, _1080p * 6, _1080p * -107.5 )
	self:addElement( ClockOutlineA )
	self.ClockOutlineA = ClockOutlineA
	
	local RealCountdownClockA = nil
	
	RealCountdownClockA = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f2_local1
	} )
	RealCountdownClockA.id = "RealCountdownClockA"
	RealCountdownClockA:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	RealCountdownClockA:SetFontSize( 22 * _1080p )
	RealCountdownClockA:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RealCountdownClockA:setTextStyle( CoD.TextStyle.Shadowed )
	RealCountdownClockA:SetAlignment( LUI.Alignment.Center )
	RealCountdownClockA:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * -19, _1080p * -61.5, _1080p * -39.5 )
	RealCountdownClockA:SubscribeToModel( DataSources.inGame.HUD.bombModeTimerAEnd:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.HUD.bombModeTimerAEnd:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			RealCountdownClockA:setEndTime( f3_local0 )
		end
	end )
	self:addElement( RealCountdownClockA )
	self.RealCountdownClockA = RealCountdownClockA
	
	local BackgroundB = nil
	
	BackgroundB = LUI.UIImage.new()
	BackgroundB.id = "BackgroundB"
	BackgroundB:SetAlpha( 0.5, 0 )
	BackgroundB:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	BackgroundB:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 61, _1080p * -206, _1080p * 36, _1080p * -77 )
	BackgroundB:BindColorToModel( DataSources.inGame.HUD.bombModeTimerStatusColor:GetModel( f2_local1 ) )
	self:addElement( BackgroundB )
	self.BackgroundB = BackgroundB
	
	local ClockOutlineB = nil
	
	ClockOutlineB = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	ClockOutlineB.id = "ClockOutlineB"
	ClockOutlineB:SetRGBFromTable( SWATCHES.HUD.disabled, 0 )
	ClockOutlineB:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 61, _1080p * -205, _1080p * 36, _1080p * -77 )
	self:addElement( ClockOutlineB )
	self.ClockOutlineB = ClockOutlineB
	
	local RealCountdownClockB = nil
	
	RealCountdownClockB = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f2_local1
	} )
	RealCountdownClockB.id = "RealCountdownClockB"
	RealCountdownClockB:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	RealCountdownClockB:SetFontSize( 22 * _1080p )
	RealCountdownClockB:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RealCountdownClockB:setTextStyle( CoD.TextStyle.Shadowed )
	RealCountdownClockB:SetAlignment( LUI.Alignment.Center )
	RealCountdownClockB:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * -19, _1080p * -31.5, _1080p * -9.5 )
	RealCountdownClockB:SubscribeToModel( DataSources.inGame.HUD.bombModeTimerBEnd:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.inGame.HUD.bombModeTimerBEnd:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			RealCountdownClockB:setEndTime( f4_local0 )
		end
	end )
	self:addElement( RealCountdownClockB )
	self.RealCountdownClockB = RealCountdownClockB
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BombPlantedTrackerA:RegisterAnimationSequence( "ShowBombTimerA", {
			{
				function ()
					return self.BombPlantedTrackerA:SetAlpha( 1, 100 )
				end
			}
		} )
		BackgroundA:RegisterAnimationSequence( "ShowBombTimerA", {
			{
				function ()
					return self.BackgroundA:SetAlpha( 0.5, 100 )
				end
			}
		} )
		ClockOutlineA:RegisterAnimationSequence( "ShowBombTimerA", {
			{
				function ()
					return self.ClockOutlineA:SetAlpha( 1, 100 )
				end
			}
		} )
		RealCountdownClockA:RegisterAnimationSequence( "ShowBombTimerA", {
			{
				function ()
					return self.RealCountdownClockA:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.ShowBombTimerA = function ()
			BombPlantedTrackerA:AnimateSequence( "ShowBombTimerA" )
			BackgroundA:AnimateSequence( "ShowBombTimerA" )
			ClockOutlineA:AnimateSequence( "ShowBombTimerA" )
			RealCountdownClockA:AnimateSequence( "ShowBombTimerA" )
		end
		
		BombPlantedTrackerA:RegisterAnimationSequence( "HideBombTimerA", {
			{
				function ()
					return self.BombPlantedTrackerA:SetAlpha( 0, 100 )
				end
			}
		} )
		BackgroundA:RegisterAnimationSequence( "HideBombTimerA", {
			{
				function ()
					return self.BackgroundA:SetAlpha( 0, 100 )
				end
			}
		} )
		ClockOutlineA:RegisterAnimationSequence( "HideBombTimerA", {
			{
				function ()
					return self.ClockOutlineA:SetAlpha( 0, 100 )
				end
			}
		} )
		RealCountdownClockA:RegisterAnimationSequence( "HideBombTimerA", {
			{
				function ()
					return self.RealCountdownClockA:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.HideBombTimerA = function ()
			BombPlantedTrackerA:AnimateSequence( "HideBombTimerA" )
			BackgroundA:AnimateSequence( "HideBombTimerA" )
			ClockOutlineA:AnimateSequence( "HideBombTimerA" )
			RealCountdownClockA:AnimateSequence( "HideBombTimerA" )
		end
		
		RealCountdownClockA:RegisterAnimationSequence( "FlashLowTimeRemainingSlowA", {
			{
				function ()
					return self.RealCountdownClockA:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RealCountdownClockA:SetAlpha( 0.25, 500, LUI.EASING.inCubic )
				end,
				function ()
					return self.RealCountdownClockA:SetAlpha( 1, 500, LUI.EASING.outCubic )
				end
			}
		} )
		self._sequences.FlashLowTimeRemainingSlowA = function ()
			RealCountdownClockA:AnimateSequence( "FlashLowTimeRemainingSlowA" )
		end
		
		self._sequences.FlashLowTimeRemainingFast = function ()
			
		end
		
		BombPlantedTrackerB:RegisterAnimationSequence( "ShowBombTimerB", {
			{
				function ()
					return self.BombPlantedTrackerB:SetAlpha( 1, 100 )
				end
			}
		} )
		BackgroundB:RegisterAnimationSequence( "ShowBombTimerB", {
			{
				function ()
					return self.BackgroundB:SetAlpha( 0.5, 100 )
				end
			}
		} )
		ClockOutlineB:RegisterAnimationSequence( "ShowBombTimerB", {
			{
				function ()
					return self.ClockOutlineB:SetAlpha( 1, 100 )
				end
			}
		} )
		RealCountdownClockB:RegisterAnimationSequence( "ShowBombTimerB", {
			{
				function ()
					return self.RealCountdownClockB:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.ShowBombTimerB = function ()
			BombPlantedTrackerB:AnimateSequence( "ShowBombTimerB" )
			BackgroundB:AnimateSequence( "ShowBombTimerB" )
			ClockOutlineB:AnimateSequence( "ShowBombTimerB" )
			RealCountdownClockB:AnimateSequence( "ShowBombTimerB" )
		end
		
		BombPlantedTrackerB:RegisterAnimationSequence( "HideBombTimerB", {
			{
				function ()
					return self.BombPlantedTrackerB:SetAlpha( 0, 100 )
				end
			}
		} )
		BackgroundB:RegisterAnimationSequence( "HideBombTimerB", {
			{
				function ()
					return self.BackgroundB:SetAlpha( 0, 100 )
				end
			}
		} )
		ClockOutlineB:RegisterAnimationSequence( "HideBombTimerB", {
			{
				function ()
					return self.ClockOutlineB:SetAlpha( 0, 100 )
				end
			}
		} )
		RealCountdownClockB:RegisterAnimationSequence( "HideBombTimerB", {
			{
				function ()
					return self.RealCountdownClockB:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.HideBombTimerB = function ()
			BombPlantedTrackerB:AnimateSequence( "HideBombTimerB" )
			BackgroundB:AnimateSequence( "HideBombTimerB" )
			ClockOutlineB:AnimateSequence( "HideBombTimerB" )
			RealCountdownClockB:AnimateSequence( "HideBombTimerB" )
		end
		
		RealCountdownClockB:RegisterAnimationSequence( "FlashLowTimeRemainingSlowB", {
			{
				function ()
					return self.RealCountdownClockB:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RealCountdownClockB:SetAlpha( 0.25, 500, LUI.EASING.inCubic )
				end,
				function ()
					return self.RealCountdownClockB:SetAlpha( 1, 500, LUI.EASING.outCubic )
				end
			}
		} )
		self._sequences.FlashLowTimeRemainingSlowB = function ()
			RealCountdownClockB:AnimateSequence( "FlashLowTimeRemainingSlowB" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	BombPlantedTrackerB:SetDataSource( DataSources.inGame.HUD.bombPlantedB, f2_local1 )
	BombPlantedTrackerA:SetDataSource( DataSources.inGame.HUD.bombPlantedA, f2_local1 )
	self:SubscribeToModel( DataSources.inGame.HUD.bombPlantedA:GetModel( f2_local1 ), function ()
		if DataSources.inGame.HUD.bombPlantedA:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.bombPlantedA:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowBombTimerA" )
		end
		if DataSources.inGame.HUD.bombPlantedA:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.bombPlantedA:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideBombTimerA" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.HUD.bombPlantedB:GetModel( f2_local1 ), function ()
		if DataSources.inGame.HUD.bombPlantedB:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.bombPlantedB:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowBombTimerB" )
		end
		if DataSources.inGame.HUD.bombPlantedB:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.bombPlantedB:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideBombTimerB" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "BombPlantedTimers", BombPlantedTimers )
LockTable( _M )
