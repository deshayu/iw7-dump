local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetYRotation( -50 )
	f1_arg0.Timer:addEventHandler( "time10sec", function ( f2_arg0, f2_arg1 )
		ACTIONS.AnimateSequence( f1_arg0, "Time10Sec" )
	end )
	f1_arg0.Timer:addEventHandler( "time30sec", function ( f3_arg0, f3_arg1 )
		ACTIONS.AnimateSequence( f1_arg0, "Time30Sec" )
	end )
	f1_arg0.Timer:addEventHandler( "timeReset", function ( f4_arg0, f4_arg1 )
		if f4_arg1.timeValue > 30 then
			ACTIONS.AnimateSequence( f1_arg0, "Show" )
		elseif f4_arg1.timeValue > 10 then
			ACTIONS.AnimateSequence( f1_arg0, "Time30Sec" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "Time10Sec" )
		end
	end )
	local f1_local0 = DataSources.inGame.SP.missionCountdown.timer
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		if f1_local0:GetValue( f1_arg1 ) > 0 then
			ACTIONS.AnimateSequence( f1_arg0, "Show" )
		end
	end )
	f1_arg0.Timer:addEventHandler( "timeout", function ( f6_arg0, f6_arg1 )
		ACTIONS.AnimateSequence( f1_arg0, "Hide" )
	end )
	f1_arg0:SetDepth( -50, 0 )
end

function JackalMissionTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 281 * _1080p, 0, 45 * _1080p )
	self.id = "JackalMissionTimer"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local f7_local3 = nil
	if not Engine.IsMultiplayer() and not Engine.InFrontend() and CONDITIONS.IsSingleplayer( self ) then
		f7_local3 = LUI.UIImage.new()
		f7_local3.id = "Background"
		f7_local3:SetRGBFromInt( 0, 0 )
		f7_local3:SetAlpha( 0.5, 0 )
		f7_local3:SetUseAA( true )
		self:addElement( f7_local3 )
		self.Background = f7_local3
	end
	local CapRight = nil
	
	CapRight = LUI.UIImage.new()
	CapRight.id = "CapRight"
	CapRight:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapRight:SetUseAA( true )
	CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3, 0, 0, 0 )
	self:addElement( CapRight )
	self.CapRight = CapRight
	
	local CapLeft = nil
	
	CapLeft = LUI.UIImage.new()
	CapLeft.id = "CapLeft"
	CapLeft:SetAlpha( 0.4, 0 )
	CapLeft:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapLeft:SetUseAA( true )
	CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 3, 0, 0 )
	self:addElement( CapLeft )
	self.CapLeft = CapLeft
	
	local Timer = nil
	
	Timer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f7_local1
	} )
	Timer.id = "Timer"
	Timer:SetFontSize( 36 * _1080p )
	Timer:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Timer:SetAlignment( LUI.Alignment.Center )
	Timer:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -18, _1080p * 18 )
	Timer:SubscribeToModel( DataSources.inGame.SP.missionCountdown.timer:GetModel( f7_local1 ), function ()
		local f8_local0 = DataSources.inGame.SP.missionCountdown.timer:GetValue( f7_local1 )
		if f8_local0 ~= nil then
			Timer:setEndTime( f8_local0 )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if not Engine.IsMultiplayer() and not Engine.InFrontend() and CONDITIONS.IsSingleplayer( self ) then
			f7_local3:RegisterAnimationSequence( "Show", {
				{
					function ()
						return self.Background:SetAlpha( 0, 0 )
					end,
					function ()
						return self.Background:SetAlpha( 0.5, 50 )
					end
				},
				{
					function ()
						return self.Background:SetRGBFromInt( 0, 0 )
					end
				},
				{
					function ()
						return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 117, _1080p * -117, 0, 0, 50 )
					end,
					function ()
						return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 199, LUI.EASING.outBack )
					end
				}
			} )
		end
		CapRight:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.CapRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -113, _1080p * -110, 0, 0, 50 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3, 0, 0, 0, 199, LUI.EASING.outBack )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.CapLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 50 )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 110, _1080p * 113, 0, 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 3, 0, 0, 199, LUI.EASING.outBack )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Timer:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Timer:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Timer:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.Show = function ()
			if not Engine.IsMultiplayer() and not Engine.InFrontend() and CONDITIONS.IsSingleplayer( self ) then
				f7_local3:AnimateSequence( "Show" )
			end
			CapRight:AnimateSequence( "Show" )
			CapLeft:AnimateSequence( "Show" )
			Timer:AnimateSequence( "Show" )
		end
		
		if not Engine.IsMultiplayer() and not Engine.InFrontend() and CONDITIONS.IsSingleplayer( self ) then
			f7_local3:RegisterAnimationSequence( "Hidden", {
				{
					function ()
						return self.Background:SetAlpha( 0, 0 )
					end
				}
			} )
		end
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
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, 0, 0 )
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
		self._sequences.Hidden = function ()
			if not Engine.IsMultiplayer() and not Engine.InFrontend() and CONDITIONS.IsSingleplayer( self ) then
				f7_local3:AnimateSequence( "Hidden" )
			end
			CapRight:AnimateSequence( "Hidden" )
			CapLeft:AnimateSequence( "Hidden" )
			Timer:AnimateSequence( "Hidden" )
		end
		
		if not Engine.IsMultiplayer() and not Engine.InFrontend() and CONDITIONS.IsSingleplayer( self ) then
			f7_local3:RegisterAnimationSequence( "Hide", {
				{
					function ()
						return self.Background:SetAlpha( 0.5, 100 )
					end,
					function ()
						return self.Background:SetAlpha( 0.5, 150 )
					end,
					function ()
						return self.Background:SetAlpha( 0, 50, LUI.EASING.inBack )
					end
				},
				{
					function ()
						return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 100 )
					end,
					function ()
						return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 115, _1080p * -115, 0, 0, 200, LUI.EASING.inBack )
					end
				}
			} )
		end
		CapRight:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.CapRight:SetAlpha( 1, 250 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3, 0, 0, 0, 100 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -113, _1080p * -110, 0, 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.CapLeft:SetAlpha( 0.4, 100 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 150 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 3, 0, 0, 100 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 110, _1080p * 113, 0, 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Timer:SetAlpha( 0, 220 )
				end
			}
		} )
		self._sequences.Hide = function ()
			if not Engine.IsMultiplayer() and not Engine.InFrontend() and CONDITIONS.IsSingleplayer( self ) then
				f7_local3:AnimateSequence( "Hide" )
			end
			CapRight:AnimateSequence( "Hide" )
			CapLeft:AnimateSequence( "Hide" )
			Timer:AnimateSequence( "Hide" )
		end
		
		if not Engine.IsMultiplayer() and not Engine.InFrontend() and CONDITIONS.IsSingleplayer( self ) then
			f7_local3:RegisterAnimationSequence( "Time10Sec", {
				{
					function ()
						return self.Background:SetAlpha( 0.5, 0 )
					end,
					function ()
						return self.Background:SetAlpha( 0.8, 200 )
					end,
					function ()
						return self.Background:SetAlpha( 0.6, 200 )
					end
				}
			} )
		end
		self._sequences.Time10Sec = function ()
			if not Engine.IsMultiplayer() and not Engine.InFrontend() and CONDITIONS.IsSingleplayer( self ) then
				f7_local3:AnimateLoop( "Time10Sec" )
			end
		end
		
		if not Engine.IsMultiplayer() and not Engine.InFrontend() and CONDITIONS.IsSingleplayer( self ) then
			f7_local3:RegisterAnimationSequence( "Time30Sec", {
				{
					function ()
						return self.Background:SetRGBFromTable( SWATCHES.jackal.target, 500 )
					end
				}
			} )
		end
		self._sequences.Time30Sec = function ()
			if not Engine.IsMultiplayer() and not Engine.InFrontend() and CONDITIONS.IsSingleplayer( self ) then
				f7_local3:AnimateSequence( "Time30Sec" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f7_local1, controller )
	ACTIONS.AnimateSequence( self, "Hidden" )
	return self
end

MenuBuilder.registerType( "JackalMissionTimer", JackalMissionTimer )
LockTable( _M )
