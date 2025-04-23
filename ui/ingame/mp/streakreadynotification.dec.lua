local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = GetTextDimensions( f1_arg1, FONTS.GetFont( FONTS.MainBold.File ), 38 )
	local f1_local4 = (_1080p * f1_local2 + 30) / 500 * _1080p
	f1_arg0.MessageBacking:SetAnchors( 0.5 + f1_local4 / 2, 0.5 + f1_local4 / 2, 0, 0 )
	f1_arg0.LineFXL:SetAnchors( 0.5 + f1_local4 / 2, 0.5 + f1_local4 / 2, 0, 0 )
	f1_arg0.LineFXR:SetAnchors( 0.5 + f1_local4 / 2, 0.5 + f1_local4 / 2, 0, 0 )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = true
	if CODCASTER.CanCODCast() and CODCASTER.IsCODCaster() then
		f2_local0 = MLG.ShoutcasterProfileVarBool( f2_arg0, f2_arg1 )
	elseif not Game.IsSpectating() then
		f2_local0 = not Game.InKillCam()
	else
		f2_local0 = false
	end
	return f2_local0
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	if f0_local1( f3_arg2, "shoutcaster_scorestreaks_notification" ) then
		local f3_local0 = ToUpperCase( LocalizeIntoString( f3_arg1.name:GetValue( f3_arg2 ), "MPUI_SUPER_ABILITY_READY_CAPS" ) )
		f0_local0( f3_arg0, f3_local0 )
		f3_arg0.MessageText:setText( f3_local0 )
		local f3_local1 = 4
		if Engine.IsGamepadEnabled() ~= 1 then
			if DataSources.inGame.player.gimmeStreak.isActive:GetValue( f3_arg2 ) then
				f3_local1 = 6
			else
				f3_local1 = 3 + DataSources.inGame.player.streaks:GetCountValue( f3_arg2 ) - 1 - f3_arg3
			end
		end
		if f3_arg0.MessageStreakHint then
			f3_arg0.MessageStreakHint:setText( Engine.Localize( "MPUI_STREAK_USE_HINT", "^3[{+actionslot " .. f3_local1 .. "}]^7" ), 0 )
		end
		ACTIONS.AnimateSequence( f3_arg0, "ShowStreakMessage" )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	if f0_local1( f4_arg1, "shoutcaster_specialist_notification" ) then
		local f4_local0 = ToUpperCase( LocalizeIntoString( DataSources.inGame.player.super.superMeterName:GetValue( f4_arg1 ), "MPUI_SUPER_ABILITY_READY_CAPS" ) )
		f0_local0( f4_arg0, f4_local0 )
		f4_arg0.MessageText:setText( f4_local0 )
		if f4_arg0.MessageSuperHint then
			if Engine.IsGamepadEnabled() == 1 then
				f4_arg0.MessageSuperHint:setText( Engine.Localize( "MPUI_SUPER_ABILITY_HINT" ) )
			else
				f4_arg0.MessageSuperHint:setText( Engine.Localize( "MPUI_SUPER_ABILITY_HINT_PC" ) )
			end
		end
		ACTIONS.AnimateSequence( f4_arg0, "ShowSuperMessage" )
		ACTIONS.AnimateSequenceByElement( f4_arg0, {
			elementName = "LineFXR",
			sequenceName = "ShowSuperMessage",
			elementPath = "LineFXR"
		} )
		ACTIONS.AnimateSequenceByElement( f4_arg0, {
			elementName = "LineFXL",
			sequenceName = "ShowSuperMessage",
			elementPath = "LineFXL"
		} )
	end
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	if DataSources.inGame.player.super.superMeterState:GetValue( f5_arg1 ) == 2 then
		f0_local3( f5_arg0, f5_arg1 )
	else
		local f5_local0 = nil
		local f5_local1 = 0
		local f5_local2 = -1
		if DataSources.inGame.player.gimmeStreak.isActive:GetValue( f5_arg1 ) then
			f5_local0 = DataSources.inGame.player.gimmeStreak
		else
			local f5_local3 = DataSources.inGame.player.streaks:GetCountValue( f5_arg1 )
			for f5_local4 = 0, f5_local3 - 1, 1 do
				local f5_local7 = DataSources.inGame.player.streaks:GetDataSourceAtIndex( f5_local4, f5_arg1 )
				local f5_local8 = f5_local7.cost:GetValue( f5_arg1 )
				if f5_local7.isActive:GetValue( f5_arg1 ) and f5_local1 < f5_local8 then
					f5_local0 = f5_local7
					f5_local1 = f5_local8
					f5_local2 = f5_local4
				end
			end
		end
		if f5_local0 then
			f0_local2( f5_arg0, f5_local0, f5_arg1, f5_local2 )
		end
	end
end

local f0_local5 = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	return function ()
		if f6_arg1.isActive:GetValue( f6_arg2 ) then
			f0_local2( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		end
	end
	
end

function PostLoadFunc( f8_arg0, f8_arg1 )
	if f8_arg0.MessageSuperHint then
		f8_arg0.MessageSuperHint:SetShadowUOffset( -0 )
		f8_arg0.MessageSuperHint:SetShadowVOffset( -0 )
	end
	f8_arg0:registerEventHandler( "playerstate_client_changed", function ( element, event )
		element._sequences.HideMessage()
	end )
	f8_arg0:SubscribeToModel( DataSources.inGame.player.super.superMeterState:GetModel( f8_arg1 ), function ( f10_arg0 )
		if DataModel.GetModelValue( f10_arg0 ) == 2 and not Game.InKillCam() then
			local f10_local0 = f8_arg0:Wait( 200 )
			f10_local0.onComplete = function ()
				if DataModel.GetModelValue( f10_arg0 ) == 2 and not Game.InKillCam() then
					f0_local3( f8_arg0, f8_arg1 )
				end
			end
			
		end
	end )
	f8_arg0:SubscribeToModel( DataSources.inGame.player.spawnNotify:GetModel( f8_arg1 ), function ()
		local f12_local0 = f8_arg0:Wait( 200 )
		f12_local0.onComplete = function ()
			f0_local4( f8_arg0, f8_arg1 )
		end
		
	end )
	local f8_local0 = function ()
		if not f8_arg0.activeSubsInitialized then
			f8_arg0.streakIsActiveSubscriptions = {}
			f8_arg0.streakNameSubscriptions = {}
			local f14_local0 = DataSources.inGame.player.streaks:GetCountValue( f8_arg1 )
			if f14_local0 and f14_local0 > 0 then
				f8_arg0.activeSubsInitialized = true
				for f14_local1 = 0, f14_local0 - 1, 1 do
					local f14_local4 = DataSources.inGame.player.streaks:GetDataSourceAtIndex( f14_local1, f8_arg1 )
					table.insert( f8_arg0.streakIsActiveSubscriptions, f8_arg0:SubscribeToModel( f14_local4.isActive:GetModel( f8_arg1 ), f0_local5( f8_arg0, f14_local4, f8_arg1, f14_local1 ), true ) )
					table.insert( f8_arg0.streakNameSubscriptions, f8_arg0:SubscribeToModel( f14_local4.name:GetModel( f8_arg1 ), f0_local5( f8_arg0, f14_local4, f8_arg1, f14_local1 ), true ) )
				end
			end
		end
	end
	
	local f8_local1 = function ( f15_arg0, f15_arg1 )
		if f15_arg0.streakIsActiveSubscriptions then
			for f15_local3, f15_local4 in ipairs( f15_arg0.streakIsActiveSubscriptions ) do
				f15_arg0:UnsubscribeFromModel( f15_local4 )
			end
		end
		if f15_arg0.streakNameSubscriptions then
			for f15_local3, f15_local4 in ipairs( f15_arg0.streakNameSubscriptions ) do
				f15_arg0:UnsubscribeFromModel( f15_local4 )
			end
		end
		f15_arg0.activeSubsInitialized = false
		f8_local0()
	end
	
	f8_arg0:registerOmnvarHandler( "ui_score_streak_index_1", f8_local1 )
	f8_arg0:registerOmnvarHandler( "ui_score_streak_index_2", f8_local1 )
	f8_arg0:registerOmnvarHandler( "ui_score_streak_index_3", f8_local1 )
end

function StreakReadyNotification( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 45 * _1080p )
	self.id = "StreakReadyNotification"
	self._animationSets = {}
	self._sequences = {}
	local f16_local1 = controller and controller.controllerIndex
	if not f16_local1 and not Engine.InFrontend() then
		f16_local1 = self:getRootController()
	end
	assert( f16_local1 )
	local f16_local2 = self
	local MessageBacking = nil
	
	MessageBacking = LUI.UIImage.new()
	MessageBacking.id = "MessageBacking"
	MessageBacking:SetRGBFromTable( SWATCHES.superMeter.superMeterFillBright, 0 )
	MessageBacking:SetAlpha( 0, 0 )
	self:addElement( MessageBacking )
	self.MessageBacking = MessageBacking
	
	local MessageText = nil
	
	MessageText = LUI.UIText.new()
	MessageText.id = "MessageText"
	MessageText:SetRGBFromInt( 0, 0 )
	MessageText:SetAlpha( 0, 0 )
	MessageText:setText( ToUpperCase( LocalizeIntoString( "", "MPUI_SUPER_ABILITY_READY_CAPS" ) ), 0 )
	MessageText:SetFontSize( 38 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1000, _1080p * 1000, _1080p * -19, _1080p * 19 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	local f16_local5 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f16_local5 = LUI.UIStyledText.new()
		f16_local5.id = "MessageSuperHint"
		f16_local5:SetAlpha( 0, 0 )
		f16_local5:setText( Engine.Localize( "MPUI_SUPER_ABILITY_HINT" ), 0 )
		f16_local5:SetFontSize( 32 * _1080p )
		f16_local5:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f16_local5:SetAlignment( LUI.Alignment.Center )
		f16_local5:SetShadowMinDistance( -0.2, 0 )
		f16_local5:SetShadowMaxDistance( 0.2, 0 )
		f16_local5:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 26, _1080p * 58 )
		self:addElement( f16_local5 )
		self.MessageSuperHint = f16_local5
	end
	local f16_local6 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f16_local6 = LUI.UIStyledText.new()
		f16_local6.id = "MessageStreakHint"
		f16_local6:SetAlpha( 0, 0 )
		f16_local6:setText( Engine.Localize( "MPUI_STREAK_USE_HINT" ), 0 )
		f16_local6:SetFontSize( 32 * _1080p )
		f16_local6:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f16_local6:SetAlignment( LUI.Alignment.Center )
		f16_local6:SetStartupDelay( 1000 )
		f16_local6:SetLineHoldTime( 400 )
		f16_local6:SetAnimMoveTime( 300 )
		f16_local6:SetEndDelay( 1000 )
		f16_local6:SetCrossfadeTime( 400 )
		f16_local6:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
		f16_local6:SetMaxVisibleLines( 1 )
		f16_local6:SetShadowMinDistance( -0.2, 0 )
		f16_local6:SetShadowMaxDistance( 0.2, 0 )
		f16_local6:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 29, _1080p * 61 )
		self:addElement( f16_local6 )
		self.MessageStreakHint = f16_local6
	end
	local LineFXR = nil
	
	LineFXR = MenuBuilder.BuildRegisteredType( "StreakReadyLineFX", {
		controllerIndex = f16_local1
	} )
	LineFXR.id = "LineFXR"
	LineFXR:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -6, _1080p * 494, _1080p * -10, _1080p * 10 )
	self:addElement( LineFXR )
	self.LineFXR = LineFXR
	
	local LineFXL = nil
	
	LineFXL = MenuBuilder.BuildRegisteredType( "StreakReadyLineFX", {
		controllerIndex = f16_local1
	} )
	LineFXL.id = "LineFXL"
	LineFXL:SetZRotation( 180, 0 )
	LineFXL:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -494, _1080p * 6, _1080p * -10, _1080p * 10 )
	self:addElement( LineFXL )
	self.LineFXL = LineFXL
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MessageBacking:RegisterAnimationSequence( "ShowSuperMessage", {
			{
				function ()
					return self.MessageBacking:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MessageBacking:SetAlpha( 0.8, 30 )
				end,
				function ()
					return self.MessageBacking:SetAlpha( 0.8, 2920 )
				end,
				function ()
					return self.MessageBacking:SetAlpha( 0, 550 )
				end
			},
			{
				function ()
					return self.MessageBacking:SetRGBFromTable( SWATCHES.superMeter.superMeterFillBright, 0 )
				end,
				function ()
					return self.MessageBacking:SetRGBFromTable( SWATCHES.superMeter.superMeterFillDim, 500, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.MessageBacking:SetRGBFromTable( SWATCHES.superMeter.superMeterFillBright, 150, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.MessageBacking:SetRGBFromTable( SWATCHES.superMeter.superMeterFillDim, 500, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.MessageBacking:SetRGBFromTable( SWATCHES.superMeter.superMeterFillBright, 150, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.MessageBacking:SetRGBFromTable( SWATCHES.superMeter.superMeterFillDim, 500 )
				end,
				function ()
					return self.MessageBacking:SetRGBFromTable( SWATCHES.superMeter.superMeterFillBright, 150, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.MessageBacking:SetRGBFromTable( SWATCHES.superMeter.superMeterFillDim, 500 )
				end,
				function ()
					return self.MessageBacking:SetRGBFromTable( SWATCHES.superMeter.superMeterFillBright, 150 )
				end,
				function ()
					return self.MessageBacking:SetRGBFromTable( SWATCHES.superMeter.superMeterFillDim, 500 )
				end,
				function ()
					return self.MessageBacking:SetRGBFromTable( SWATCHES.superMeter.superMeterFillDim, 150 )
				end
			},
			{
				function ()
					return self.MessageBacking:SetScale( 0.2, 0 )
				end,
				function ()
					return self.MessageBacking:SetScale( 0, 30 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "ShowSuperMessage", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MessageText:SetAlpha( 0, 140 )
				end,
				function ()
					return self.MessageText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.MessageText:SetAlpha( 1, 2850 )
				end,
				function ()
					return self.MessageText:SetAlpha( 0, 500 )
				end
			},
			{
				function ()
					return self.MessageText:SetScale( 0, 150 )
				end
			}
		} )
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f16_local5:RegisterAnimationSequence( "ShowSuperMessage", {
				{
					function ()
						return self.MessageSuperHint:SetAlpha( 0, 0 )
					end,
					function ()
						return self.MessageSuperHint:SetAlpha( 1, 70 )
					end,
					function ()
						return self.MessageSuperHint:SetAlpha( 1, 10 )
					end,
					function ()
						return self.MessageSuperHint:SetAlpha( 0, 30 )
					end,
					function ()
						return self.MessageSuperHint:SetAlpha( 1, 30 )
					end,
					function ()
						return self.MessageSuperHint:SetAlpha( 0, 30 )
					end,
					function ()
						return self.MessageSuperHint:SetAlpha( 1, 30 )
					end,
					function ()
						return self.MessageSuperHint:SetAlpha( 1, 2800 )
					end,
					function ()
						return self.MessageSuperHint:SetAlpha( 0, 500 )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f16_local6:RegisterAnimationSequence( "ShowSuperMessage", {
				{
					function ()
						return self.MessageStreakHint:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.ShowSuperMessage = function ()
			MessageBacking:AnimateSequence( "ShowSuperMessage" )
			MessageText:AnimateSequence( "ShowSuperMessage" )
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f16_local5:AnimateSequence( "ShowSuperMessage" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f16_local6:AnimateSequence( "ShowSuperMessage" )
			end
		end
		
		MessageBacking:RegisterAnimationSequence( "ShowStreakMessage", {
			{
				function ()
					return self.MessageBacking:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MessageBacking:SetAlpha( 0.8, 250 )
				end,
				function ()
					return self.MessageBacking:SetAlpha( 0.8, 1250 )
				end,
				function ()
					return self.MessageBacking:SetAlpha( 0, 500 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "ShowStreakMessage", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MessageText:SetAlpha( 1, 250 )
				end,
				function ()
					return self.MessageText:SetAlpha( 1, 1250 )
				end,
				function ()
					return self.MessageText:SetAlpha( 0, 500 )
				end
			}
		} )
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f16_local5:RegisterAnimationSequence( "ShowStreakMessage", {
				{
					function ()
						return self.MessageSuperHint:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f16_local6:RegisterAnimationSequence( "ShowStreakMessage", {
				{
					function ()
						return self.MessageStreakHint:SetAlpha( 0, 0 )
					end,
					function ()
						return self.MessageStreakHint:SetAlpha( 1, 250 )
					end,
					function ()
						return self.MessageStreakHint:SetAlpha( 1, 1250 )
					end,
					function ()
						return self.MessageStreakHint:SetAlpha( 0, 500 )
					end
				}
			} )
		end
		self._sequences.ShowStreakMessage = function ()
			MessageBacking:AnimateSequence( "ShowStreakMessage" )
			MessageText:AnimateSequence( "ShowStreakMessage" )
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f16_local5:AnimateSequence( "ShowStreakMessage" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f16_local6:AnimateSequence( "ShowStreakMessage" )
			end
		end
		
		MessageBacking:RegisterAnimationSequence( "HideMessage", {
			{
				function ()
					return self.MessageBacking:SetAlpha( 0, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "HideMessage", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end
			}
		} )
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f16_local5:RegisterAnimationSequence( "HideMessage", {
				{
					function ()
						return self.MessageSuperHint:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not CONDITIONS.ShouldHideButtonPrompts( self ) then
			f16_local6:RegisterAnimationSequence( "HideMessage", {
				{
					function ()
						return self.MessageStreakHint:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideMessage = function ()
			MessageBacking:AnimateSequence( "HideMessage" )
			MessageText:AnimateSequence( "HideMessage" )
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f16_local5:AnimateSequence( "HideMessage" )
			end
			if not CONDITIONS.ShouldHideButtonPrompts( self ) then
				f16_local6:AnimateSequence( "HideMessage" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f16_local1, controller )
	return self
end

MenuBuilder.registerType( "StreakReadyNotification", StreakReadyNotification )
LockTable( _M )
