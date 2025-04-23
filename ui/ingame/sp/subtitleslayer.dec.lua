LUI.SubtitlesLayer = LUI.Class( LUI.UIElement )
LUI.SubtitlesLayer.init = function ( f1_arg0, f1_arg1 )
	LUI.SubtitlesLayer.super.init( f1_arg0 )
	f1_arg0.id = "SubtitlesLayer"
	f1_arg0._controllerIndex = f1_arg1
	f1_arg0:SetupSafeArea()
end

LUI.SubtitlesLayer.ShouldBeVisible = function ( f2_arg0 )
	return true
end

LUI.SubtitlesLayer.InitLayer = function ( f3_arg0 )
	f3_arg0._subtitles = LUI.UIElement.new()
	f3_arg0._subtitles.id = "_subtitles"
	f3_arg0._subtitles:setupSubtitles()
	f3_arg0._subtitles:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		top = -135 * _1080p,
		bottom = -50 * _1080p,
		alignment = CoD.OwnerdrawAlignment.TextTopCenter,
		font = FONTS.GetFont( FONTS.MainCondensed.File ),
		red = COLORS.white.r,
		green = COLORS.white.g,
		blue = COLORS.white.b,
		scale = 0.28
	} )
	f3_arg0._subtitles:animateToState( "default", 0 )
	f3_arg0:addElement( f3_arg0._subtitles )
end

LUI.SubtitlesLayer.ClearLayer = function ( f4_arg0, f4_arg1 )
	f4_arg0:closeChildren()
	f4_arg0._subtitles = nil
end

