local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SetTimeLimitAnimation( f1_arg0 )
	local f1_local0 = {
		{
			function ()
				local f2_local0 = f1_arg0:getParent()
				return f2_local0.NoTimeLimit:SetAlpha( 0, 0 )
			end
		}
	}
	local f1_local1 = f1_arg0:getParent()
	f1_local1.NoTimeLimit:RegisterAnimationSequence( "TimeLimitSequence", f1_local0 )
	f1_local0 = {
		{
			function ()
				local f3_local0 = f1_arg0:getParent()
				return f3_local0.GameTimer:SetAlpha( 1, 0 )
			end
		}
	}
	f1_local1 = f1_arg0:getParent()
	f1_local1.GameTimer:RegisterAnimationSequence( "TimeLimitSequence", f1_local0 )
	if GameX.gameModeIsFFA() then
		f1_local1 = {
			{
				function ()
					local f4_local0 = f1_arg0:getParent()
					return f4_local0.GameTimer:SetRGBFromInt( 2434341, 0 )
				end,
				function ()
					local f5_local0 = f1_arg0:getParent()
					return f5_local0.GameTimer:SetRGBFromInt( 16730900, 500, LUI.EASING.outCubic )
				end,
				function ()
					local f6_local0 = f1_arg0:getParent()
					return f6_local0.GameTimer:SetRGBFromInt( 2434341, 500, LUI.EASING.inCubic )
				end
			}
		}
		local f1_local2 = f1_arg0:getParent()
		f1_local2.GameTimer:RegisterAnimationSequence( "FlashLowTimeRemainingSlow", f1_local1 )
		f1_local2 = {
			{
				function ()
					local f7_local0 = f1_arg0:getParent()
					return f7_local0.GameTimer:SetRGBFromInt( 2434341, 0 )
				end,
				function ()
					local f8_local0 = f1_arg0:getParent()
					return f8_local0.GameTimer:SetRGBFromInt( 16730900, 250, LUI.EASING.outCubic )
				end,
				function ()
					local f9_local0 = f1_arg0:getParent()
					return f9_local0.GameTimer:SetRGBFromInt( 2434341, 250, LUI.EASING.inCubic )
				end
			}
		}
		local f1_local3 = f1_arg0:getParent()
		f1_local3.GameTimer:RegisterAnimationSequence( "FlashLowTimeRemainingFast", f1_local2 )
	end
end

function UpdateTimerState( f10_arg0, f10_arg1 )
	local f10_local0 = DataSources.inGame.MP.match.endTime:GetValue( f10_arg0.controllerIndex )
	if f10_local0 ~= nil and f10_local0 > 30000 then
		SetTimeLimitAnimation( f10_arg0 )
	end
	if f10_arg1.name == "time30sec" then
		ACTIONS.AnimateSequence( f10_arg0:getParent(), "FlashLowTimeRemainingSlow" )
		local f10_local1 = ACTIONS.AnimateSequence
		local f10_local2 = f10_arg0:getParent()
		f10_local1( f10_local2.GameTimerWarningLeft, "TimeLimitWarning" )
		f10_local1 = ACTIONS.AnimateSequence
		f10_local2 = f10_arg0:getParent()
		f10_local1( f10_local2.GameTimerWarningRight, "TimeLimitWarning" )
	elseif f10_arg1.name == "time10sec" then
		ACTIONS.AnimateSequence( f10_arg0:getParent(), "FlashLowTimeRemainingFast" )
	elseif f10_arg1.name == "timeReset" then
		ACTIONS.AnimateSequence( f10_arg0:getParent(), "TimeLimitSequence" )
		local f10_local1 = ACTIONS.AnimateSequence
		local f10_local2 = f10_arg0:getParent()
		f10_local1( f10_local2.GameTimerWarningLeft, "ResetSequence" )
		f10_local1 = ACTIONS.AnimateSequence
		f10_local2 = f10_arg0:getParent()
		f10_local1( f10_local2.GameTimerWarningRight, "ResetSequence" )
	end
end

function PostLoadFunc( f11_arg0, f11_arg1, f11_arg2 )
	assert( f11_arg0.GameTimer )
	f11_arg0.GameTimer:registerEventHandler( "time30sec", UpdateTimerState )
	f11_arg0.GameTimer:registerEventHandler( "time10sec", UpdateTimerState )
	f11_arg0.GameTimer:registerEventHandler( "timeReset", UpdateTimerState )
	f11_arg0:SubscribeToModel( DataSources.inGame.MP.match.matchTimerStopped:GetModel( f11_arg1 ), function ()
		if DataSources.inGame.MP.match.matchTimerStopped:GetValue( f11_arg1 ) then
			f11_arg0.GameTimer:freeze()
		else
			f11_arg0.GameTimer:unfreeze()
		end
	end )
end

function CodCasterTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 151 * _1080p, 0, 36 * _1080p )
	self.id = "CodCasterTimer"
	self._animationSets = {}
	self._sequences = {}
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	local f13_local2 = self
	local GameTimerWarningLeft = nil
	
	GameTimerWarningLeft = MenuBuilder.BuildRegisteredType( "GameTimerWarning", {
		controllerIndex = f13_local1
	} )
	GameTimerWarningLeft.id = "GameTimerWarningLeft"
	GameTimerWarningLeft:SetYRotation( 180, 0 )
	GameTimerWarningLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 80, _1080p * -0.75, _1080p * 36.75 )
	self:addElement( GameTimerWarningLeft )
	self.GameTimerWarningLeft = GameTimerWarningLeft
	
	local GameTimerWarningRight = nil
	
	GameTimerWarningRight = MenuBuilder.BuildRegisteredType( "GameTimerWarning", {
		controllerIndex = f13_local1
	} )
	GameTimerWarningRight.id = "GameTimerWarningRight"
	GameTimerWarningRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 70, _1080p * 145, _1080p * -0.75, _1080p * 36.75 )
	self:addElement( GameTimerWarningRight )
	self.GameTimerWarningRight = GameTimerWarningRight
	
	local NoTimeLimit = nil
	
	NoTimeLimit = LUI.UIText.new()
	NoTimeLimit.id = "NoTimeLimit"
	NoTimeLimit:setText( "-:--:-", 0 )
	NoTimeLimit:SetFontSize( 32 * _1080p )
	NoTimeLimit:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NoTimeLimit:SetAlignment( LUI.Alignment.Center )
	NoTimeLimit:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 151, _1080p * 2, _1080p * 34 )
	self:addElement( NoTimeLimit )
	self.NoTimeLimit = NoTimeLimit
	
	local GameTimer = nil
	
	GameTimer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f13_local1
	} )
	GameTimer.id = "GameTimer"
	GameTimer:SetAlpha( 0, 0 )
	GameTimer:SetFontSize( 32 * _1080p )
	GameTimer:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GameTimer:SetAlignment( LUI.Alignment.Center )
	GameTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13, _1080p * 136, _1080p * 2, _1080p * 34 )
	GameTimer:SubscribeToModel( DataSources.inGame.MP.match.endTime:GetModel( f13_local1 ), function ()
		local f14_local0 = DataSources.inGame.MP.match.endTime:GetValue( f13_local1 )
		if f14_local0 ~= nil then
			GameTimer:setEndTime( f14_local0 )
		end
	end )
	self:addElement( GameTimer )
	self.GameTimer = GameTimer
	
	self._animationSets.DefaultAnimationSet = function ()
		NoTimeLimit:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.NoTimeLimit:SetAlpha( 1, 0 )
				end
			}
		} )
		GameTimer:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GameTimer:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			NoTimeLimit:AnimateSequence( "DefaultSequence" )
			GameTimer:AnimateSequence( "DefaultSequence" )
		end
		
		GameTimer:RegisterAnimationSequence( "FlashLowTimeRemainingSlow", {
			{
				function ()
					return self.GameTimer:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.GameTimer:SetRGBFromInt( 16730900, 500, LUI.EASING.outCubic )
				end,
				function ()
					return self.GameTimer:SetRGBFromInt( 16777215, 500, LUI.EASING.inCubic )
				end
			}
		} )
		self._sequences.FlashLowTimeRemainingSlow = function ()
			GameTimer:AnimateLoop( "FlashLowTimeRemainingSlow" )
		end
		
		GameTimer:RegisterAnimationSequence( "FlashLowTimeRemainingFast", {
			{
				function ()
					return self.GameTimer:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.GameTimer:SetRGBFromInt( 16730900, 250, LUI.EASING.outCubic )
				end,
				function ()
					return self.GameTimer:SetRGBFromInt( 16777215, 250, LUI.EASING.inCubic )
				end
			}
		} )
		self._sequences.FlashLowTimeRemainingFast = function ()
			GameTimer:AnimateLoop( "FlashLowTimeRemainingFast" )
		end
		
		NoTimeLimit:RegisterAnimationSequence( "NoTimeLimitSequence", {
			{
				function ()
					return self.NoTimeLimit:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.NoTimeLimit:setText( "-:--:-", 0 )
				end
			}
		} )
		GameTimer:RegisterAnimationSequence( "NoTimeLimitSequence", {
			{
				function ()
					return self.GameTimer:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoTimeLimitSequence = function ()
			NoTimeLimit:AnimateSequence( "NoTimeLimitSequence" )
			GameTimer:AnimateSequence( "NoTimeLimitSequence" )
		end
		
		NoTimeLimit:RegisterAnimationSequence( "TimeLimitSequence", {
			{
				function ()
					return self.NoTimeLimit:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.NoTimeLimit:setText( "-:--:-", 0 )
				end
			}
		} )
		GameTimer:RegisterAnimationSequence( "TimeLimitSequence", {
			{
				function ()
					return self.GameTimer:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.TimeLimitSequence = function ()
			NoTimeLimit:AnimateSequence( "TimeLimitSequence" )
			GameTimer:AnimateSequence( "TimeLimitSequence" )
		end
		
	end
	
	self._animationSets.Active = function ()
		NoTimeLimit:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.NoTimeLimit:SetAlpha( 0, 0 )
				end
			}
		} )
		GameTimer:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GameTimer:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.GameTimer:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			NoTimeLimit:AnimateSequence( "DefaultSequence" )
			GameTimer:AnimateSequence( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.TimeLow = function ()
		NoTimeLimit:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.NoTimeLimit:SetAlpha( 0, 0 )
				end
			}
		} )
		GameTimer:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GameTimer:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.GameTimer:SetRGBFromInt( 16711680, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			NoTimeLimit:AnimateSequence( "DefaultSequence" )
			GameTimer:AnimateSequence( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.NoTimeLimit = function ()
		NoTimeLimit:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.NoTimeLimit:SetAlpha( 1, 0 )
				end
			}
		} )
		GameTimer:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GameTimer:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			NoTimeLimit:AnimateSequence( "DefaultSequence" )
			GameTimer:AnimateSequence( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.match.endTime:GetModel( f13_local1 ), function ()
		if DataSources.inGame.MP.match.endTime:GetValue( f13_local1 ) ~= nil and DataSources.inGame.MP.match.endTime:GetValue( f13_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "NoTimeLimitSequence" )
		end
		if DataSources.inGame.MP.match.endTime:GetValue( f13_local1 ) ~= nil and DataSources.inGame.MP.match.endTime:GetValue( f13_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "TimeLimitSequence" )
		end
	end )
	PostLoadFunc( self, f13_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CodCasterTimer", CodCasterTimer )
LockTable( _M )
