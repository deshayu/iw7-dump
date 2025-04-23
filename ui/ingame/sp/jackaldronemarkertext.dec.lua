local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.Message
	if f1_local1 then
		f1_local1 = f1_arg0.LeftAccent and f1_arg0.RightAccent
	end
	f1_local0( f1_local1, "WARNING: Jackal Drone Marker Text Items Are Missing..." )
	f1_local0 = f1_arg0.Message
	f1_local1 = f1_arg0.LeftAccent
	local f1_local2 = f1_arg0.RightAccent
	local f1_local3 = f1_local0:GetCurrentFont()
	local f1_local4, f1_local5, f1_local6, f1_local7 = f1_local0:getLocalRect()
	local f1_local8 = math.abs( f1_local6 - f1_local4 )
	local f1_local9 = math.abs( f1_local7 - f1_local5 )
	local f1_local10 = f1_local0:getText()
	local f1_local11, f1_local12, f1_local13, f1_local14 = GetTextDimensions( f1_local10, f1_local3, f1_local9, f1_local8 )
	local f1_local15 = math.abs( f1_local13 - f1_local11 )
	local f1_local16 = math.abs( f1_local14 - f1_local12 )
	local f1_local17 = _1080p * 10
	local f1_local18 = _1080p * 32
	f1_local0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -f1_local15, f1_local15, _1080p * -10, _1080p * 10, 0 )
	f1_local1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, f1_local15 * -0.5 - f1_local17 - f1_local18, f1_local15 * -0.5 - f1_local17, _1080p * -8, _1080p * 8, 0 )
	f1_local2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, f1_local15 * 0.5 + f1_local17, f1_local15 * 0.5 + f1_local17 + f1_local18, _1080p * -8, _1080p * 8, 0 )
	f1_local0:setText( f1_local10 )
	ACTIONS.AnimateSequence( f1_arg0, "Loop" )
end

function JackalDroneMarkerText( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 180 * _1080p, 0, 20 * _1080p )
	self.id = "JackalDroneMarkerText"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Message = nil
	
	Message = LUI.UIStyledText.new()
	Message.id = "Message"
	Message:SetRGBFromTable( SWATCHES.jackal.incomingDrone, 0 )
	Message:setText( ToUpperCase( Engine.Localize( "JACKAL_DRONE_INCOMING" ) ), 0 )
	Message:SetFontSize( 22 * _1080p )
	Message:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Message:SetAlignment( LUI.Alignment.Center )
	Message:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -200, _1080p * 200, _1080p * -11, _1080p * 11 )
	self:addElement( Message )
	self.Message = Message
	
	local RightAccent = nil
	
	RightAccent = LUI.UIImage.new()
	RightAccent.id = "RightAccent"
	RightAccent:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	RightAccent:setImage( RegisterMaterial( "hud_jackal_overheat_accent" ), 0 )
	RightAccent:SetUseAA( true )
	RightAccent:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 80, _1080p * 112, _1080p * -8, _1080p * 8 )
	self:addElement( RightAccent )
	self.RightAccent = RightAccent
	
	local LeftAccent = nil
	
	LeftAccent = LUI.UIImage.new()
	LeftAccent.id = "LeftAccent"
	LeftAccent:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	LeftAccent:setImage( RegisterMaterial( "hud_jackal_overheat_accent" ), 0 )
	LeftAccent:SetUseAA( true )
	LeftAccent:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -112, _1080p * -80, _1080p * -8, _1080p * 8 )
	self:addElement( LeftAccent )
	self.LeftAccent = LeftAccent
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Message:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.Message:SetRGBFromInt( 3707827, 0 )
				end,
				function ()
					return self.Message:SetRGBFromInt( 8835027, 140 )
				end,
				function ()
					return self.Message:SetRGBFromInt( 3707827, 120 )
				end,
				function ()
					return self.Message:SetRGBFromTable( SWATCHES.jackal.incomingDrone, 130 )
				end,
				function ()
					return self.Message:SetRGBFromInt( 8835027, 140 )
				end,
				function ()
					return self.Message:SetRGBFromInt( 3707827, 140 )
				end,
				function ()
					return self.Message:SetRGBFromInt( 8835027, 130 )
				end,
				function ()
					return self.Message:SetRGBFromInt( 3707827, 130 )
				end,
				function ()
					return self.Message:SetRGBFromTable( SWATCHES.jackal.incomingDrone, 170 )
				end
			},
			{
				function ()
					return self.Message:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Message:SetAlpha( 1, 20 )
				end,
				function ()
					return self.Message:SetAlpha( 1, 350 )
				end,
				function ()
					return self.Message:SetAlpha( 0, 20 )
				end,
				function ()
					return self.Message:SetAlpha( 0, 140 )
				end,
				function ()
					return self.Message:SetAlpha( 1, 20 )
				end,
				function ()
					return self.Message:SetAlpha( 1, 380 )
				end,
				function ()
					return self.Message:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Message:SetAlpha( 0, 140 )
				end
			}
		} )
		RightAccent:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.RightAccent:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end,
				function ()
					return self.RightAccent:SetRGBFromInt( 14411202, 140 )
				end,
				function ()
					return self.RightAccent:SetRGBFromTable( SWATCHES.jackal.stable, 120 )
				end,
				function ()
					return self.RightAccent:SetRGBFromInt( 14411202, 130 )
				end,
				function ()
					return self.RightAccent:SetRGBFromTable( SWATCHES.jackal.stable, 140 )
				end,
				function ()
					return self.RightAccent:SetRGBFromInt( 14411202, 140 )
				end,
				function ()
					return self.RightAccent:SetRGBFromTable( SWATCHES.jackal.stable, 130 )
				end,
				function ()
					return self.RightAccent:SetRGBFromInt( 14411202, 160 )
				end,
				function ()
					return self.RightAccent:SetRGBFromTable( SWATCHES.jackal.stable, 140 )
				end
			}
		} )
		LeftAccent:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.LeftAccent:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end,
				function ()
					return self.LeftAccent:SetRGBFromInt( 14411202, 140 )
				end,
				function ()
					return self.LeftAccent:SetRGBFromTable( SWATCHES.jackal.stable, 120 )
				end,
				function ()
					return self.LeftAccent:SetRGBFromInt( 14411202, 130 )
				end,
				function ()
					return self.LeftAccent:SetRGBFromTable( SWATCHES.jackal.stable, 140 )
				end,
				function ()
					return self.LeftAccent:SetRGBFromInt( 14411202, 140 )
				end,
				function ()
					return self.LeftAccent:SetRGBFromTable( SWATCHES.jackal.stable, 130 )
				end,
				function ()
					return self.LeftAccent:SetRGBFromInt( 14411202, 160 )
				end,
				function ()
					return self.LeftAccent:SetRGBFromTable( SWATCHES.jackal.stable, 140 )
				end
			}
		} )
		self._sequences.Loop = function ()
			Message:AnimateLoop( "Loop" )
			RightAccent:AnimateLoop( "Loop" )
			LeftAccent:AnimateLoop( "Loop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalDroneMarkerText", JackalDroneMarkerText )
LockTable( _M )
