local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function UpdateOverlayAlphaHelper( f1_arg0, f1_arg1 )
	return function ()
		f1_arg0.overlayAlpha = 0.9
		f1_arg0:AnimateSequence( "Show" )
	end
	
end

f0_local0 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0.overlayAlpha = 0
	f3_arg0:RegisterAnimationSequence( "Show", {
		{
			function ()
				return f3_arg0.ScreenCover:SetAlpha( f3_arg0.overlayAlpha, 0 )
			end,
			function ()
				return f3_arg0.ScreenCover:SetAlpha( 0, 300 )
			end
		}
	} )
	f3_arg0:SubscribeToModel( DataSources.inGame.MP.playerDamaged:GetModel( f3_arg1 ), UpdateOverlayAlphaHelper( f3_arg0, f3_arg1 ), true )
end

function DamageOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "DamageOverlay"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local ScreenCover = nil
	
	ScreenCover = LUI.UIImage.new()
	ScreenCover.id = "ScreenCover"
	ScreenCover:SetRGBFromInt( 5636096, 0 )
	ScreenCover:SetAlpha( 0, 0 )
	ScreenCover:setImage( RegisterMaterial( "hud_damage_overlay" ), 0 )
	ScreenCover:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10000, _1080p * 10000, _1080p * -10000, _1080p * 10000 )
	self:addElement( ScreenCover )
	self.ScreenCover = ScreenCover
	
	f0_local0( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "DamageOverlay", DamageOverlay )
LockTable( _M )
