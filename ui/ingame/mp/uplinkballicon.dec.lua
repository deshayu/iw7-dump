local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetYRotation( -25 * MP.SplitScreenRotModifier )
	f1_arg0:SetXRotation( -15 * MP.SplitScreenRotModifier )
end

function UplinkBallIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "UplinkBallIcon"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromTable( SWATCHES.HUD.contested, 0 )
	Glow:SetAlpha( 0, 0 )
	Glow:setImage( RegisterMaterial( "widg_glow_circle" ), 0 )
	Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -6, _1080p * 6, _1080p * -6, _1080p * 6 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local OuterBall = nil
	
	OuterBall = LUI.UIImage.new()
	OuterBall.id = "OuterBall"
	OuterBall:setImage( RegisterMaterial( "icon_uplink_pickup_ball" ), 0 )
	OuterBall:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -12, _1080p * 13, _1080p * -10, _1080p * 10 )
	self:addElement( OuterBall )
	self.OuterBall = OuterBall
	
	local InnerBall = nil
	
	InnerBall = LUI.UIImage.new()
	InnerBall.id = "InnerBall"
	InnerBall:SetRGBFromTable( SWATCHES.HUD.Countdown, 0 )
	InnerBall:SetAlpha( 0, 0 )
	InnerBall:setImage( RegisterMaterial( "hud_icon_uplink_ball_inner" ), 0 )
	InnerBall:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * 1, 0, 0 )
	self:addElement( InnerBall )
	self.InnerBall = InnerBall
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Glow:RegisterAnimationSequence( "ShowBall", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 250 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.22, 640, LUI.EASING.inBack )
				end,
				function ()
					return self.Glow:SetAlpha( 0.22, 110 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 520 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 980 )
				end
			},
			{
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUD.contested, 0 )
				end
			}
		} )
		OuterBall:RegisterAnimationSequence( "ShowBall", {
			{
				function ()
					return self.OuterBall:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.OuterBall:SetAlpha( 1, 0 )
				end
			}
		} )
		InnerBall:RegisterAnimationSequence( "ShowBall", {
			{
				function ()
					return self.InnerBall:SetRGBFromTable( SWATCHES.HUD.Countdown, 0 )
				end,
				function ()
					return self.InnerBall:SetRGBFromTable( SWATCHES.HUD.Countdown, 250 )
				end,
				function ()
					return self.InnerBall:SetRGBFromTable( SWATCHES.HUD.Countdown, 640, LUI.EASING.inBack )
				end,
				function ()
					return self.InnerBall:SetRGBFromTable( SWATCHES.HUD.Countdown, 110 )
				end,
				function ()
					return self.InnerBall:SetRGBFromTable( SWATCHES.HUD.Countdown, 520 )
				end,
				function ()
					return self.InnerBall:SetRGBFromTable( SWATCHES.HUD.Countdown, 980 )
				end
			},
			{
				function ()
					return self.InnerBall:SetAlpha( 0, 0 )
				end,
				function ()
					return self.InnerBall:SetAlpha( 0, 250 )
				end,
				function ()
					return self.InnerBall:SetAlpha( 1, 640, LUI.EASING.inBack )
				end,
				function ()
					return self.InnerBall:SetAlpha( 1, 110 )
				end,
				function ()
					return self.InnerBall:SetAlpha( 0, 520 )
				end,
				function ()
					return self.InnerBall:SetAlpha( 0, 980 )
				end
			}
		} )
		self._sequences.ShowBall = function ()
			Glow:AnimateLoop( "ShowBall" )
			OuterBall:AnimateLoop( "ShowBall" )
			InnerBall:AnimateLoop( "ShowBall" )
		end
		
		Glow:RegisterAnimationSequence( "HideBall", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 150 )
				end
			}
		} )
		OuterBall:RegisterAnimationSequence( "HideBall", {
			{
				function ()
					return self.OuterBall:SetAlpha( 0, 150 )
				end
			}
		} )
		InnerBall:RegisterAnimationSequence( "HideBall", {
			{
				function ()
					return self.InnerBall:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.HideBall = function ()
			Glow:AnimateSequence( "HideBall" )
			OuterBall:AnimateSequence( "HideBall" )
			InnerBall:AnimateSequence( "HideBall" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.uplinkHUDEnabled:GetModel( f2_local1 ), function ()
		if DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowBall" )
		end
		if DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideBall" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "UplinkBallIcon", UplinkBallIcon )
LockTable( _M )
