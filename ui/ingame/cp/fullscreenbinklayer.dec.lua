LUI.FullscreenBinkLayer = LUI.Class( LUI.UIElement )
LUI.FullscreenBinkLayer.init = function ( f1_arg0 )
	LUI.FullscreenBinkLayer.super.init( f1_arg0 )
	f1_arg0.id = "FullscreenBinkLayer"
end

LUI.FullscreenBinkLayer.ShouldBeVisible = function ( f2_arg0 )
	return Game.GetOmnvar( "bink_video_active" )
end

LUI.FullscreenBinkLayer.InitLayer = function ( f3_arg0 )
	if not f3_arg0._bink then
		f3_arg0._bink = LUI.UIImage.new()
		f3_arg0._bink.id = "bink"
		f3_arg0._bink:setImage( RegisterMaterial( "cinematic" ), 0 )
		f3_arg0:addElement( f3_arg0._bink )
	end
end

LUI.FullscreenBinkLayer.ClearLayer = function ( f4_arg0, f4_arg1 )
	f4_arg0:closeChildren()
	f4_arg0._bink = nil
end

