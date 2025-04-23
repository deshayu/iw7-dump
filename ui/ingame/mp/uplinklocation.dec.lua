local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetYRotation( 10 * MP.SplitScreenRotModifier )
	f1_arg0.LocationText:SetShadowUOffset( -0 )
	f1_arg0.LocationText:SetShadowVOffset( -0 )
end

function UplinkLocation( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 424 * _1080p, 0, 28 * _1080p )
	self.id = "UplinkLocation"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Shadow = nil
	
	Shadow = LUI.UIImage.new()
	Shadow.id = "Shadow"
	Shadow:SetRGBFromInt( 0, 0 )
	Shadow:SetAlpha( 0.2, 0 )
	Shadow:setImage( RegisterMaterial( "widg_glow_circle" ), 0 )
	Shadow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8.5, _1080p * 33.5, _1080p * -7, _1080p * 35 )
	self:addElement( Shadow )
	self.Shadow = Shadow
	
	local LocationText = nil
	
	LocationText = LUI.UIStyledText.new()
	LocationText.id = "LocationText"
	LocationText:SetFontSize( 22 * _1080p )
	LocationText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LocationText:SetAlignment( LUI.Alignment.Left )
	LocationText:SetOptOutRightToLeftAlignmentFlip( true )
	LocationText:SetShadowMinDistance( -0.2, 0 )
	LocationText:SetShadowMaxDistance( 0.2, 0 )
	LocationText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.5, _1080p * 415.5, _1080p * 3, _1080p * 25 )
	LocationText:BindColorToModel( DataSources.inGame.HUD.uplinkBallStatusColor:GetModel( f2_local1 ) )
	LocationText:SubscribeToModel( DataSources.inGame.HUD.uplinkBallStatus:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.HUD.uplinkBallStatus:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			LocationText:setText( f3_local0, 0 )
		end
	end )
	self:addElement( LocationText )
	self.LocationText = LocationText
	
	local BallIconOutside = nil
	
	BallIconOutside = LUI.UIImage.new()
	BallIconOutside.id = "BallIconOutside"
	BallIconOutside:setImage( RegisterMaterial( "hud_icon_uplink_ball_outer" ), 0 )
	BallIconOutside:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -6, _1080p * 31, _1080p * -4.03, _1080p * 32.03 )
	BallIconOutside:BindColorToModel( DataSources.inGame.HUD.uplinkBallStatusColor:GetModel( f2_local1 ) )
	self:addElement( BallIconOutside )
	self.BallIconOutside = BallIconOutside
	
	local BallIconInside = nil
	
	BallIconInside = LUI.UIImage.new()
	BallIconInside.id = "BallIconInside"
	BallIconInside:setImage( RegisterMaterial( "hud_icon_uplink_ball_inner" ), 0 )
	BallIconInside:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -6, _1080p * 31, _1080p * -4.03, _1080p * 32.03 )
	BallIconInside:BindColorToModel( DataSources.inGame.HUD.uplinkBallStatusColor:GetModel( f2_local1 ) )
	self:addElement( BallIconInside )
	self.BallIconInside = BallIconInside
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "UplinkLocation", UplinkLocation )
LockTable( _M )
