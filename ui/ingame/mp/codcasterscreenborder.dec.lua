local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.Top:SetRGBFromInt( f1_arg1, 0 )
	f1_arg0.Right:SetRGBFromInt( f1_arg1, 0 )
	f1_arg0.Bottom:SetRGBFromInt( f1_arg1, 0 )
	f1_arg0.Left:SetRGBFromInt( f1_arg1, 0 )
end

f0_local1 = function ( f2_arg0 )
	ACTIONS.AnimateSequence( f2_arg0, "Show" )
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Game.GetPlayerTeam( Game.GetPlayerstateClientnum() )
	local f3_local1 = 0
	if f3_local0 == Teams.allies then
		f3_local1 = CODCASTER.GetTeam1Color( f3_arg1 )
	elseif f3_local0 == Teams.axis then
		f3_local1 = CODCASTER.GetTeam2Color( f3_arg1 )
	end
	f0_local0( f3_arg0, f3_local1 )
	f0_local1( f3_arg0 )
end

local f0_local3 = function ( f4_arg0 )
	return function ( f5_arg0, f5_arg1 )
		if not GameX.gameModeIsFFA( GameX.GetGameMode() ) and MLG.ShoutcasterProfileVarBool( f4_arg0, "shoutcaster_qs_screenborder" ) and Game.GetPlayerClientnum() ~= Game.GetPlayerstateClientnum() then
			f0_local2( f5_arg0, f4_arg0 )
		end
	end
	
end

local f0_local4 = function ( f6_arg0, f6_arg1, f6_arg2 )
	f6_arg0:registerEventHandler( "playerstate_client_changed", f0_local3( f6_arg1 ) )
end

function CodcasterScreenBorder( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CodcasterScreenBorder"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local Top = nil
	
	Top = LUI.UIImage.new()
	Top.id = "Top"
	Top:SetAlpha( 0, 0 )
	Top:SetDotPitchEnabled( true )
	Top:SetDotPitchX( 16, 0 )
	Top:SetDotPitchY( 8, 0 )
	Top:SetDotPitchContrast( 0.8, 0 )
	Top:SetDotPitchMode( 0 )
	Top:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	Top:SetBlendMode( BLEND_MODE.addWithAlpha )
	Top:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -30, _1080p * 30, _1080p * -85, _1080p * 85 )
	self:addElement( Top )
	self.Top = Top
	
	local Right = nil
	
	Right = LUI.UIImage.new()
	Right.id = "Right"
	Right:SetAlpha( 0, 0 )
	Right:SetDotPitchEnabled( true )
	Right:SetDotPitchX( 16, 0 )
	Right:SetDotPitchY( 8, 0 )
	Right:SetDotPitchContrast( 0.8, 0 )
	Right:SetDotPitchMode( 0 )
	Right:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
	Right:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -130, _1080p * 30, _1080p * -170, _1080p * 170 )
	self:addElement( Right )
	self.Right = Right
	
	local Bottom = nil
	
	Bottom = LUI.UIImage.new()
	Bottom.id = "Bottom"
	Bottom:SetAlpha( 0, 0 )
	Bottom:SetDotPitchEnabled( true )
	Bottom:SetDotPitchX( 16, 0 )
	Bottom:SetDotPitchY( 8, 0 )
	Bottom:SetDotPitchContrast( 0.8, 0 )
	Bottom:SetDotPitchMode( 0 )
	Bottom:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	Bottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -30, _1080p * 30, _1080p * -85, _1080p * 85 )
	self:addElement( Bottom )
	self.Bottom = Bottom
	
	local Left = nil
	
	Left = LUI.UIImage.new()
	Left.id = "Left"
	Left:SetAlpha( 0, 0 )
	Left:SetDotPitchEnabled( true )
	Left:SetDotPitchX( 16, 0 )
	Left:SetDotPitchY( 8, 0 )
	Left:SetDotPitchContrast( 0.8, 0 )
	Left:SetDotPitchMode( 0 )
	Left:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	Left:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -30, _1080p * 130, _1080p * -170, _1080p * 170 )
	self:addElement( Left )
	self.Left = Left
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Top:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Top:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Top:SetAlpha( 0.8, 100 )
				end,
				function ()
					return self.Top:SetAlpha( 1, 750 )
				end,
				function ()
					return self.Top:SetAlpha( 0, 150 )
				end
			}
		} )
		Right:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Right:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Right:SetAlpha( 1, 100 )
				end,
				function ()
					return self.Right:SetAlpha( 1, 750 )
				end,
				function ()
					return self.Right:SetAlpha( 0, 150 )
				end
			}
		} )
		Bottom:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Bottom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Bottom:SetAlpha( 0.8, 100 )
				end,
				function ()
					return self.Bottom:SetAlpha( 1, 750 )
				end,
				function ()
					return self.Bottom:SetAlpha( 0, 150 )
				end
			}
		} )
		Left:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Left:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Left:SetAlpha( 1, 100 )
				end,
				function ()
					return self.Left:SetAlpha( 1, 750 )
				end,
				function ()
					return self.Left:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.Show = function ()
			Top:AnimateSequence( "Show" )
			Right:AnimateSequence( "Show" )
			Bottom:AnimateSequence( "Show" )
			Left:AnimateSequence( "Show" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local4( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "CodcasterScreenBorder", CodcasterScreenBorder )
LockTable( _M )
