local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "bootup_anim", function ()
		ACTIONS.AnimateSequence( f1_arg0, "BootUp" )
		ACTIONS.AnimateSequenceByElement( f1_arg0, {
			elementName = "Reticle",
			sequenceName = "BootUp",
			elementPath = "Reticle"
		} )
		ACTIONS.AnimateSequenceByElement( f1_arg0, {
			elementName = "EthanHackBoxGrid",
			sequenceName = "BootUp",
			elementPath = "EthanHackBoxGrid"
		} )
	end )
end

function EthanHackOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "EthanHackOverlay"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local TopMeter = nil
	
	TopMeter = LUI.UIImage.new()
	TopMeter.id = "TopMeter"
	TopMeter:SetCurvedRenderingX( 0.4 )
	TopMeter:SetCurvedRenderingY( -0.2 )
	TopMeter:SetGlitchEnabled( true )
	TopMeter:SetGlitchAmount( 0, 0 )
	TopMeter:SetGlitchBlockWidth( 50, 0 )
	TopMeter:SetGlitchBlockHeight( 50, 0 )
	TopMeter:SetGlitchDistortionRange( 16, 0 )
	TopMeter:SetGlitchScanlinePitch( 1, 0 )
	TopMeter:SetGlitchMaskPitch( 1, 0 )
	TopMeter:setImage( RegisterMaterial( "hud_robot_hack_top_meter_blue" ), 0 )
	TopMeter:SetBlendMode( BLEND_MODE.addWithAlpha )
	TopMeter:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * -53, _1080p * 43 )
	self:addElement( TopMeter )
	self.TopMeter = TopMeter
	
	local BottomMeter = nil
	
	BottomMeter = LUI.UIImage.new()
	BottomMeter.id = "BottomMeter"
	BottomMeter:SetCurvedRenderingX( 0.4 )
	BottomMeter:SetCurvedRenderingY( -0.2 )
	BottomMeter:SetGlitchEnabled( true )
	BottomMeter:SetGlitchAmount( 0, 0 )
	BottomMeter:SetGlitchBlockWidth( 50, 0 )
	BottomMeter:SetGlitchBlockHeight( 50, 0 )
	BottomMeter:SetGlitchDistortionRange( 16, 0 )
	BottomMeter:SetGlitchScanlinePitch( 1, 0 )
	BottomMeter:SetGlitchMaskPitch( 1, 0 )
	BottomMeter:setImage( RegisterMaterial( "hud_robot_hack_bottom_meter_blue" ), 0 )
	BottomMeter:SetBlendMode( BLEND_MODE.addWithAlpha )
	BottomMeter:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -710, _1080p * 710, _1080p * -38, _1080p * 38 )
	self:addElement( BottomMeter )
	self.BottomMeter = BottomMeter
	
	local Reticle = nil
	
	Reticle = MenuBuilder.BuildRegisteredType( "EthanHackReticle", {
		controllerIndex = f3_local1
	} )
	Reticle.id = "Reticle"
	Reticle:SetGlitchEnabled( true )
	Reticle:SetGlitchAmount( 0, 0 )
	Reticle:SetGlitchBlockWidth( 50, 0 )
	Reticle:SetGlitchBlockHeight( 50, 0 )
	Reticle:SetGlitchDistortionRange( 16, 0 )
	Reticle:SetGlitchScanlinePitch( 1, 0 )
	Reticle:SetGlitchMaskPitch( 1, 0 )
	Reticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -540, _1080p * 540, _1080p * -400, _1080p * 400 )
	self:addElement( Reticle )
	self.Reticle = Reticle
	
	local DotsTop1 = nil
	
	DotsTop1 = LUI.UIImage.new()
	DotsTop1.id = "DotsTop1"
	DotsTop1:SetAlpha( 0.5, 0 )
	DotsTop1:SetCurvedRenderingX( 0.4 )
	DotsTop1:SetCurvedRenderingY( -0.2 )
	DotsTop1:SetGlitchEnabled( true )
	DotsTop1:SetGlitchAmount( 0, 0 )
	DotsTop1:SetGlitchBlockWidth( 50, 0 )
	DotsTop1:SetGlitchBlockHeight( 50, 0 )
	DotsTop1:SetGlitchDistortionRange( 16, 0 )
	DotsTop1:SetGlitchScanlinePitch( 1, 0 )
	DotsTop1:SetGlitchMaskPitch( 1, 0 )
	DotsTop1:setImage( RegisterMaterial( "hud_ethan_bg_dots" ), 0 )
	DotsTop1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 12, _1080p * 140 )
	self:addElement( DotsTop1 )
	self.DotsTop1 = DotsTop1
	
	local DotsTop2 = nil
	
	DotsTop2 = LUI.UIImage.new()
	DotsTop2.id = "DotsTop2"
	DotsTop2:SetAlpha( 0.5, 0 )
	DotsTop2:SetCurvedRenderingX( 0.4 )
	DotsTop2:SetCurvedRenderingY( -0.2 )
	DotsTop2:SetGlitchEnabled( true )
	DotsTop2:SetGlitchAmount( 0, 0 )
	DotsTop2:SetGlitchBlockWidth( 50, 0 )
	DotsTop2:SetGlitchBlockHeight( 50, 0 )
	DotsTop2:SetGlitchDistortionRange( 16, 0 )
	DotsTop2:SetGlitchScanlinePitch( 1, 0 )
	DotsTop2:SetGlitchMaskPitch( 1, 0 )
	DotsTop2:setImage( RegisterMaterial( "hud_ethan_bg_dots" ), 0 )
	DotsTop2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -768, _1080p * -256, _1080p * 12, _1080p * 140 )
	self:addElement( DotsTop2 )
	self.DotsTop2 = DotsTop2
	
	local DotsTop3 = nil
	
	DotsTop3 = LUI.UIImage.new()
	DotsTop3.id = "DotsTop3"
	DotsTop3:SetAlpha( 0.5, 0 )
	DotsTop3:SetCurvedRenderingX( 0.4 )
	DotsTop3:SetCurvedRenderingY( -0.2 )
	DotsTop3:SetGlitchEnabled( true )
	DotsTop3:SetGlitchAmount( 0, 0 )
	DotsTop3:SetGlitchBlockWidth( 50, 0 )
	DotsTop3:SetGlitchBlockHeight( 50, 0 )
	DotsTop3:SetGlitchDistortionRange( 16, 0 )
	DotsTop3:SetGlitchScanlinePitch( 1, 0 )
	DotsTop3:SetGlitchMaskPitch( 1, 0 )
	DotsTop3:setImage( RegisterMaterial( "hud_ethan_bg_dots" ), 0 )
	DotsTop3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 256, _1080p * 768, _1080p * 12, _1080p * 140 )
	self:addElement( DotsTop3 )
	self.DotsTop3 = DotsTop3
	
	local DotsBottom1 = nil
	
	DotsBottom1 = LUI.UIImage.new()
	DotsBottom1.id = "DotsBottom1"
	DotsBottom1:SetAlpha( 0.5, 0 )
	DotsBottom1:SetCurvedRenderingX( 0.4 )
	DotsBottom1:SetCurvedRenderingY( -0.2 )
	DotsBottom1:SetGlitchEnabled( true )
	DotsBottom1:SetGlitchAmount( 0, 0 )
	DotsBottom1:SetGlitchBlockWidth( 50, 0 )
	DotsBottom1:SetGlitchBlockHeight( 50, 0 )
	DotsBottom1:SetGlitchDistortionRange( 16, 0 )
	DotsBottom1:SetGlitchScanlinePitch( 1, 0 )
	DotsBottom1:SetGlitchMaskPitch( 1, 0 )
	DotsBottom1:setImage( RegisterMaterial( "hud_ethan_bg_dots" ), 0 )
	DotsBottom1:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -256, _1080p * 256, _1080p * -145, _1080p * -17 )
	self:addElement( DotsBottom1 )
	self.DotsBottom1 = DotsBottom1
	
	local DotsBottom2 = nil
	
	DotsBottom2 = LUI.UIImage.new()
	DotsBottom2.id = "DotsBottom2"
	DotsBottom2:SetAlpha( 0.5, 0 )
	DotsBottom2:SetCurvedRenderingX( 0.4 )
	DotsBottom2:SetCurvedRenderingY( -0.2 )
	DotsBottom2:SetGlitchEnabled( true )
	DotsBottom2:SetGlitchAmount( 0, 0 )
	DotsBottom2:SetGlitchBlockWidth( 50, 0 )
	DotsBottom2:SetGlitchBlockHeight( 50, 0 )
	DotsBottom2:SetGlitchDistortionRange( 16, 0 )
	DotsBottom2:SetGlitchScanlinePitch( 1, 0 )
	DotsBottom2:SetGlitchMaskPitch( 1, 0 )
	DotsBottom2:setImage( RegisterMaterial( "hud_ethan_bg_dots" ), 0 )
	DotsBottom2:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -768, _1080p * -256, _1080p * -145, _1080p * -17 )
	self:addElement( DotsBottom2 )
	self.DotsBottom2 = DotsBottom2
	
	local DotsBottom3 = nil
	
	DotsBottom3 = LUI.UIImage.new()
	DotsBottom3.id = "DotsBottom3"
	DotsBottom3:SetAlpha( 0.5, 0 )
	DotsBottom3:SetCurvedRenderingX( 0.4 )
	DotsBottom3:SetCurvedRenderingY( -0.2 )
	DotsBottom3:SetGlitchEnabled( true )
	DotsBottom3:SetGlitchAmount( 0, 0 )
	DotsBottom3:SetGlitchBlockWidth( 50, 0 )
	DotsBottom3:SetGlitchBlockHeight( 50, 0 )
	DotsBottom3:SetGlitchDistortionRange( 16, 0 )
	DotsBottom3:SetGlitchScanlinePitch( 1, 0 )
	DotsBottom3:SetGlitchMaskPitch( 1, 0 )
	DotsBottom3:setImage( RegisterMaterial( "hud_ethan_bg_dots" ), 0 )
	DotsBottom3:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 256, _1080p * 768, _1080p * -145, _1080p * -17 )
	self:addElement( DotsBottom3 )
	self.DotsBottom3 = DotsBottom3
	
	local ArcBL = nil
	
	ArcBL = LUI.UIImage.new()
	ArcBL.id = "ArcBL"
	ArcBL:SetAlpha( 0.3, 0 )
	ArcBL:SetGlitchEnabled( true )
	ArcBL:SetGlitchAmount( 0, 0 )
	ArcBL:SetGlitchBlockWidth( 50, 0 )
	ArcBL:SetGlitchBlockHeight( 50, 0 )
	ArcBL:SetGlitchDistortionRange( 16, 0 )
	ArcBL:SetGlitchScanlinePitch( 1, 0 )
	ArcBL:SetGlitchMaskPitch( 1, 0 )
	ArcBL:setImage( RegisterMaterial( "hud_ethan_outer_arc_segment" ), 0 )
	ArcBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * -704, 0, _1080p * 512 )
	self:addElement( ArcBL )
	self.ArcBL = ArcBL
	
	local ArcTL = nil
	
	ArcTL = LUI.UIImage.new()
	ArcTL.id = "ArcTL"
	ArcTL:SetAlpha( 0.3, 0 )
	ArcTL:SetGlitchEnabled( true )
	ArcTL:SetGlitchAmount( 0, 0 )
	ArcTL:SetGlitchBlockWidth( 50, 0 )
	ArcTL:SetGlitchBlockHeight( 50, 0 )
	ArcTL:SetGlitchDistortionRange( 16, 0 )
	ArcTL:SetGlitchScanlinePitch( 1, 0 )
	ArcTL:SetGlitchMaskPitch( 1, 0 )
	ArcTL:setImage( RegisterMaterial( "hud_ethan_outer_arc_segment" ), 0 )
	ArcTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * -704, 0, _1080p * -512 )
	self:addElement( ArcTL )
	self.ArcTL = ArcTL
	
	local ArcTR = nil
	
	ArcTR = LUI.UIImage.new()
	ArcTR.id = "ArcTR"
	ArcTR:SetAlpha( 0.3, 0 )
	ArcTR:SetGlitchEnabled( true )
	ArcTR:SetGlitchAmount( 0, 0 )
	ArcTR:SetGlitchBlockWidth( 50, 0 )
	ArcTR:SetGlitchBlockHeight( 50, 0 )
	ArcTR:SetGlitchDistortionRange( 16, 0 )
	ArcTR:SetGlitchScanlinePitch( 1, 0 )
	ArcTR:SetGlitchMaskPitch( 1, 0 )
	ArcTR:setImage( RegisterMaterial( "hud_ethan_outer_arc_segment" ), 0 )
	ArcTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 960, _1080p * 704, 0, _1080p * -512 )
	self:addElement( ArcTR )
	self.ArcTR = ArcTR
	
	local ArcBR = nil
	
	ArcBR = LUI.UIImage.new()
	ArcBR.id = "ArcBR"
	ArcBR:SetAlpha( 0.3, 0 )
	ArcBR:SetGlitchEnabled( true )
	ArcBR:SetGlitchAmount( 0, 0 )
	ArcBR:SetGlitchBlockWidth( 50, 0 )
	ArcBR:SetGlitchBlockHeight( 50, 0 )
	ArcBR:SetGlitchDistortionRange( 16, 0 )
	ArcBR:SetGlitchScanlinePitch( 1, 0 )
	ArcBR:SetGlitchMaskPitch( 1, 0 )
	ArcBR:setImage( RegisterMaterial( "hud_ethan_outer_arc_segment" ), 0 )
	ArcBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 960, _1080p * 704, 0, _1080p * 512 )
	self:addElement( ArcBR )
	self.ArcBR = ArcBR
	
	local BracketsBottom = nil
	
	BracketsBottom = LUI.UIImage.new()
	BracketsBottom.id = "BracketsBottom"
	BracketsBottom:SetCurvedRenderingX( 0.4 )
	BracketsBottom:SetCurvedRenderingY( -0.2 )
	BracketsBottom:SetGlitchEnabled( true )
	BracketsBottom:SetGlitchAmount( 0, 0 )
	BracketsBottom:SetGlitchBlockWidth( 50, 0 )
	BracketsBottom:SetGlitchBlockHeight( 50, 0 )
	BracketsBottom:SetGlitchDistortionRange( 16, 0 )
	BracketsBottom:SetGlitchScanlinePitch( 1, 0 )
	BracketsBottom:SetGlitchMaskPitch( 1, 0 )
	BracketsBottom:setImage( RegisterMaterial( "hud_ethan_bottom_brackets" ), 0 )
	BracketsBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * 368, _1080p * 496 )
	self:addElement( BracketsBottom )
	self.BracketsBottom = BracketsBottom
	
	local BracketsTopR = nil
	
	BracketsTopR = LUI.UIImage.new()
	BracketsTopR.id = "BracketsTopR"
	BracketsTopR:SetCurvedRenderingX( 0.4 )
	BracketsTopR:SetCurvedRenderingY( -0.2 )
	BracketsTopR:SetGlitchEnabled( true )
	BracketsTopR:SetGlitchAmount( 0, 0 )
	BracketsTopR:SetGlitchBlockWidth( 50, 0 )
	BracketsTopR:SetGlitchBlockHeight( 50, 0 )
	BracketsTopR:SetGlitchDistortionRange( 16, 0 )
	BracketsTopR:SetGlitchScanlinePitch( 1, 0 )
	BracketsTopR:SetGlitchMaskPitch( 1, 0 )
	BracketsTopR:setImage( RegisterMaterial( "hud_ethan_top_brackets" ), 0 )
	BracketsTopR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 736, _1080p * -486, _1080p * -438 )
	self:addElement( BracketsTopR )
	self.BracketsTopR = BracketsTopR
	
	local BracketsTopL = nil
	
	BracketsTopL = LUI.UIImage.new()
	BracketsTopL.id = "BracketsTopL"
	BracketsTopL:SetCurvedRenderingX( 0.4 )
	BracketsTopL:SetCurvedRenderingY( -0.2 )
	BracketsTopL:SetGlitchEnabled( true )
	BracketsTopL:SetGlitchAmount( 0, 0 )
	BracketsTopL:SetGlitchBlockWidth( 50, 0 )
	BracketsTopL:SetGlitchBlockHeight( 50, 0 )
	BracketsTopL:SetGlitchDistortionRange( 16, 0 )
	BracketsTopL:SetGlitchScanlinePitch( 1, 0 )
	BracketsTopL:SetGlitchMaskPitch( 1, 0 )
	BracketsTopL:setImage( RegisterMaterial( "hud_ethan_top_brackets" ), 0 )
	BracketsTopL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -736, _1080p * -486, _1080p * -438 )
	self:addElement( BracketsTopL )
	self.BracketsTopL = BracketsTopL
	
	local BoxGraph = nil
	
	BoxGraph = LUI.UIImage.new()
	BoxGraph.id = "BoxGraph"
	BoxGraph:SetGlitchEnabled( true )
	BoxGraph:SetGlitchAmount( 0, 0 )
	BoxGraph:SetGlitchBlockWidth( 50, 0 )
	BoxGraph:SetGlitchBlockHeight( 50, 0 )
	BoxGraph:SetGlitchDistortionRange( 16, 0 )
	BoxGraph:SetGlitchScanlinePitch( 1, 0 )
	BoxGraph:SetGlitchMaskPitch( 1, 0 )
	BoxGraph:setImage( RegisterMaterial( "hud_ethan_graph" ), 0 )
	BoxGraph:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -860, _1080p * -556, _1080p * -202, _1080p * 170 )
	self:addElement( BoxGraph )
	self.BoxGraph = BoxGraph
	
	local FrameFluffText = nil
	
	FrameFluffText = LUI.UIImage.new()
	FrameFluffText.id = "FrameFluffText"
	FrameFluffText:SetGlitchEnabled( true )
	FrameFluffText:SetGlitchAmount( 0, 0 )
	FrameFluffText:SetGlitchBlockWidth( 50, 0 )
	FrameFluffText:SetGlitchBlockHeight( 50, 0 )
	FrameFluffText:SetGlitchDistortionRange( 16, 0 )
	FrameFluffText:SetGlitchScanlinePitch( 1, 0 )
	FrameFluffText:SetGlitchMaskPitch( 1, 0 )
	FrameFluffText:setImage( RegisterMaterial( "hud_ethan_fluff_text_box" ), 0 )
	FrameFluffText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 604, _1080p * 804, _1080p * -134, _1080p * -6 )
	self:addElement( FrameFluffText )
	self.FrameFluffText = FrameFluffText
	
	local EthanHackBoxGrid = nil
	
	EthanHackBoxGrid = MenuBuilder.BuildRegisteredType( "EthanHackBoxGrid", {
		controllerIndex = f3_local1
	} )
	EthanHackBoxGrid.id = "EthanHackBoxGrid"
	EthanHackBoxGrid:SetGlitchEnabled( true )
	EthanHackBoxGrid:SetGlitchAmount( 0, 0 )
	EthanHackBoxGrid:SetGlitchBlockWidth( 50, 0 )
	EthanHackBoxGrid:SetGlitchBlockHeight( 50, 0 )
	EthanHackBoxGrid:SetGlitchDistortionRange( 16, 0 )
	EthanHackBoxGrid:SetGlitchScanlinePitch( 1, 0 )
	EthanHackBoxGrid:SetGlitchMaskPitch( 1, 0 )
	EthanHackBoxGrid:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 592, _1080p * 816, _1080p * 60, _1080p * 260 )
	self:addElement( EthanHackBoxGrid )
	self.EthanHackBoxGrid = EthanHackBoxGrid
	
	local EthanHackCountdownTimer = nil
	
	EthanHackCountdownTimer = MenuBuilder.BuildRegisteredType( "EthanHackCountdownTimer", {
		controllerIndex = f3_local1
	} )
	EthanHackCountdownTimer.id = "EthanHackCountdownTimer"
	EthanHackCountdownTimer:SetGlitchEnabled( true )
	EthanHackCountdownTimer:SetGlitchAmount( 0, 0 )
	EthanHackCountdownTimer:SetGlitchBlockWidth( 50, 0 )
	EthanHackCountdownTimer:SetGlitchBlockHeight( 50, 0 )
	EthanHackCountdownTimer:SetGlitchDistortionRange( 16, 0 )
	EthanHackCountdownTimer:SetGlitchScanlinePitch( 1, 0 )
	EthanHackCountdownTimer:SetGlitchMaskPitch( 1, 0 )
	EthanHackCountdownTimer:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 606, _1080p * 806, _1080p * -221.78, _1080p * -146.78 )
	self:addElement( EthanHackCountdownTimer )
	self.EthanHackCountdownTimer = EthanHackCountdownTimer
	
	local FluffText1 = nil
	
	FluffText1 = LUI.UIText.new()
	FluffText1.id = "FluffText1"
	FluffText1:SetCurvedRenderingX( 0.4 )
	FluffText1:SetCurvedRenderingY( -0.2 )
	FluffText1:SetGlitchEnabled( true )
	FluffText1:SetGlitchAmount( 0, 0 )
	FluffText1:SetGlitchBlockWidth( 50, 0 )
	FluffText1:SetGlitchBlockHeight( 50, 0 )
	FluffText1:SetGlitchDistortionRange( 16, 0 )
	FluffText1:SetGlitchScanlinePitch( 1, 0 )
	FluffText1:SetGlitchMaskPitch( 1, 0 )
	FluffText1:setText( "ETH3N", 0 )
	FluffText1:SetFontSize( 30 * _1080p )
	FluffText1:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	FluffText1:SetAlignment( LUI.Alignment.Left )
	FluffText1:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 194, _1080p * 297, _1080p * 426, _1080p * 456 )
	self:addElement( FluffText1 )
	self.FluffText1 = FluffText1
	
	local FluffText2 = nil
	
	FluffText2 = LUI.UIText.new()
	FluffText2.id = "FluffText2"
	FluffText2:SetCurvedRenderingX( 0.4 )
	FluffText2:SetCurvedRenderingY( -0.2 )
	FluffText2:SetGlitchEnabled( true )
	FluffText2:SetGlitchAmount( 0, 0 )
	FluffText2:SetGlitchBlockWidth( 50, 0 )
	FluffText2:SetGlitchBlockHeight( 50, 0 )
	FluffText2:SetGlitchDistortionRange( 16, 0 )
	FluffText2:SetGlitchScanlinePitch( 1, 0 )
	FluffText2:SetGlitchMaskPitch( 1, 0 )
	FluffText2:setText( "VER.00.01", 0 )
	FluffText2:SetFontSize( 24 * _1080p )
	FluffText2:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	FluffText2:SetAlignment( LUI.Alignment.Left )
	FluffText2:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 194, _1080p * 370, _1080p * 458, _1080p * 482 )
	self:addElement( FluffText2 )
	self.FluffText2 = FluffText2
	
	local TechyDigitsTop = nil
	
	TechyDigitsTop = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 3,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f3_local1
	} )
	TechyDigitsTop.id = "TechyDigitsTop"
	TechyDigitsTop:SetCurvedRenderingX( 0.4 )
	TechyDigitsTop:SetCurvedRenderingY( -0.2 )
	TechyDigitsTop:SetGlitchEnabled( true )
	TechyDigitsTop:SetGlitchAmount( 0, 0 )
	TechyDigitsTop:SetGlitchBlockWidth( 50, 0 )
	TechyDigitsTop:SetGlitchBlockHeight( 50, 0 )
	TechyDigitsTop:SetGlitchDistortionRange( 16, 0 )
	TechyDigitsTop:SetGlitchScanlinePitch( 1, 0 )
	TechyDigitsTop:SetGlitchMaskPitch( 1, 0 )
	TechyDigitsTop:SetFontSize( 24 * _1080p )
	TechyDigitsTop:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TechyDigitsTop:SetAlignment( LUI.Alignment.Left )
	TechyDigitsTop:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 240, _1080p * 370, _1080p * -418, _1080p * -394 )
	self:addElement( TechyDigitsTop )
	self.TechyDigitsTop = TechyDigitsTop
	
	local AmmoCounter = nil
	
	AmmoCounter = MenuBuilder.BuildRegisteredType( "EthanHackAmmoCounter", {
		controllerIndex = f3_local1
	} )
	AmmoCounter.id = "AmmoCounter"
	AmmoCounter:SetGlitchEnabled( true )
	AmmoCounter:SetGlitchAmount( 0, 0 )
	AmmoCounter:SetGlitchBlockWidth( 50, 0 )
	AmmoCounter:SetGlitchBlockHeight( 50, 0 )
	AmmoCounter:SetGlitchDistortionRange( 16, 0 )
	AmmoCounter:SetGlitchScanlinePitch( 1, 0 )
	AmmoCounter:SetGlitchMaskPitch( 1, 0 )
	AmmoCounter:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -310, _1080p * -190, _1080p * 828, _1080p * 908 )
	self:addElement( AmmoCounter )
	self.AmmoCounter = AmmoCounter
	
	self._animationSets.DefaultAnimationSet = function ()
		TopMeter:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TopMeter:SetGlitchEnabled( false )
				end
			}
		} )
		BottomMeter:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BottomMeter:SetGlitchEnabled( false )
				end
			}
		} )
		Reticle:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Reticle:SetGlitchEnabled( false )
				end
			}
		} )
		DotsTop1:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.DotsTop1:SetGlitchEnabled( false )
				end
			}
		} )
		DotsTop2:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.DotsTop2:SetGlitchEnabled( false )
				end
			}
		} )
		DotsTop3:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.DotsTop3:SetGlitchEnabled( false )
				end
			}
		} )
		DotsBottom1:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.DotsBottom1:SetGlitchEnabled( false )
				end
			}
		} )
		DotsBottom2:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.DotsBottom2:SetGlitchEnabled( false )
				end
			}
		} )
		DotsBottom3:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.DotsBottom3:SetGlitchEnabled( false )
				end
			}
		} )
		ArcBL:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ArcBL:SetGlitchEnabled( false )
				end
			}
		} )
		ArcTL:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ArcTL:SetGlitchEnabled( false )
				end
			}
		} )
		ArcTR:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ArcTR:SetGlitchEnabled( false )
				end
			}
		} )
		ArcBR:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ArcBR:SetGlitchEnabled( false )
				end
			}
		} )
		BracketsBottom:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BracketsBottom:SetGlitchEnabled( false )
				end
			}
		} )
		BracketsTopR:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BracketsTopR:SetGlitchEnabled( false )
				end
			}
		} )
		BracketsTopL:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BracketsTopL:SetGlitchEnabled( false )
				end
			}
		} )
		BoxGraph:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BoxGraph:SetGlitchEnabled( false )
				end
			}
		} )
		FrameFluffText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FrameFluffText:SetGlitchEnabled( false )
				end
			}
		} )
		EthanHackBoxGrid:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.EthanHackBoxGrid:SetGlitchEnabled( false )
				end
			}
		} )
		EthanHackCountdownTimer:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.EthanHackCountdownTimer:SetGlitchEnabled( false )
				end
			}
		} )
		FluffText1:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FluffText1:SetGlitchEnabled( false )
				end
			}
		} )
		FluffText2:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FluffText2:SetGlitchEnabled( false )
				end
			}
		} )
		TechyDigitsTop:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TechyDigitsTop:SetGlitchEnabled( false )
				end
			}
		} )
		AmmoCounter:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.AmmoCounter:SetGlitchEnabled( false )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			TopMeter:AnimateSequence( "DefaultSequence" )
			BottomMeter:AnimateSequence( "DefaultSequence" )
			Reticle:AnimateSequence( "DefaultSequence" )
			DotsTop1:AnimateSequence( "DefaultSequence" )
			DotsTop2:AnimateSequence( "DefaultSequence" )
			DotsTop3:AnimateSequence( "DefaultSequence" )
			DotsBottom1:AnimateSequence( "DefaultSequence" )
			DotsBottom2:AnimateSequence( "DefaultSequence" )
			DotsBottom3:AnimateSequence( "DefaultSequence" )
			ArcBL:AnimateSequence( "DefaultSequence" )
			ArcTL:AnimateSequence( "DefaultSequence" )
			ArcTR:AnimateSequence( "DefaultSequence" )
			ArcBR:AnimateSequence( "DefaultSequence" )
			BracketsBottom:AnimateSequence( "DefaultSequence" )
			BracketsTopR:AnimateSequence( "DefaultSequence" )
			BracketsTopL:AnimateSequence( "DefaultSequence" )
			BoxGraph:AnimateSequence( "DefaultSequence" )
			FrameFluffText:AnimateSequence( "DefaultSequence" )
			EthanHackBoxGrid:AnimateSequence( "DefaultSequence" )
			EthanHackCountdownTimer:AnimateSequence( "DefaultSequence" )
			FluffText1:AnimateSequence( "DefaultSequence" )
			FluffText2:AnimateSequence( "DefaultSequence" )
			TechyDigitsTop:AnimateSequence( "DefaultSequence" )
			AmmoCounter:AnimateSequence( "DefaultSequence" )
		end
		
		Reticle:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Reticle:SetAlpha( 0.75, 0 )
				end
			}
		} )
		DotsTop1:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.DotsTop1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DotsTop1:SetAlpha( 0, 200 )
				end,
				function ()
					return self.DotsTop1:SetAlpha( 1, 100 )
				end,
				function ()
					return self.DotsTop1:SetAlpha( 0.5, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		DotsTop2:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.DotsTop2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DotsTop2:SetAlpha( 1, 100 )
				end,
				function ()
					return self.DotsTop2:SetAlpha( 0.5, 100 )
				end
			}
		} )
		DotsTop3:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.DotsTop3:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DotsTop3:SetAlpha( 0, 400 )
				end,
				function ()
					return self.DotsTop3:SetAlpha( 1, 100 )
				end,
				function ()
					return self.DotsTop3:SetAlpha( 0.5, 100 )
				end
			}
		} )
		DotsBottom1:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.DotsBottom1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DotsBottom1:SetAlpha( 0, 200 )
				end,
				function ()
					return self.DotsBottom1:SetAlpha( 1, 100 )
				end,
				function ()
					return self.DotsBottom1:SetAlpha( 0.5, 100 )
				end
			}
		} )
		DotsBottom2:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.DotsBottom2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DotsBottom2:SetAlpha( 1, 100 )
				end,
				function ()
					return self.DotsBottom2:SetAlpha( 0.5, 100 )
				end
			}
		} )
		DotsBottom3:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.DotsBottom3:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DotsBottom3:SetAlpha( 0, 400 )
				end,
				function ()
					return self.DotsBottom3:SetAlpha( 1, 100 )
				end,
				function ()
					return self.DotsBottom3:SetAlpha( 0.5, 100 )
				end
			}
		} )
		ArcBL:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ArcBL:SetAlpha( 0.3, 0 )
				end
			},
			{
				function ()
					return self.ArcBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -760, _1080p * -504, _1080p * -40, _1080p * 472, 0 )
				end,
				function ()
					return self.ArcBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * -704, 0, _1080p * 512, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		ArcTL:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ArcTL:SetAlpha( 0.3, 0 )
				end
			},
			{
				function ()
					return self.ArcTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -760, _1080p * -504, _1080p * 50, _1080p * -462, 0 )
				end,
				function ()
					return self.ArcTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * -704, 0, _1080p * -512, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		ArcTR:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ArcTR:SetAlpha( 0.3, 0 )
				end
			},
			{
				function ()
					return self.ArcTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 760, _1080p * 504, _1080p * 40, _1080p * -472, 0 )
				end,
				function ()
					return self.ArcTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 960, _1080p * 704, 0, _1080p * -512, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		ArcBR:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ArcBR:SetAlpha( 0.3, 0 )
				end
			},
			{
				function ()
					return self.ArcBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 760, _1080p * 504, _1080p * -50, _1080p * 462, 0 )
				end,
				function ()
					return self.ArcBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 960, _1080p * 704, 0, _1080p * 512, 400, LUI.EASING.outQuadratic )
				end
			}
		} )
		BracketsBottom:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.BracketsBottom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BracketsBottom:SetAlpha( 0, 600 )
				end,
				function ()
					return self.BracketsBottom:SetAlpha( 1, 250, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BracketsBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * 468, _1080p * 596, 0 )
				end,
				function ()
					return self.BracketsBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * 468, _1080p * 596, 600 )
				end,
				function ()
					return self.BracketsBottom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * 368, _1080p * 496, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		BracketsTopR:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.BracketsTopR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BracketsTopR:SetAlpha( 0, 600 )
				end,
				function ()
					return self.BracketsTopR:SetAlpha( 1, 250, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BracketsTopR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 736, _1080p * -546, _1080p * -498, 600 )
				end,
				function ()
					return self.BracketsTopR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 736, _1080p * -486, _1080p * -438, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		BracketsTopL:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.BracketsTopL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BracketsTopL:SetAlpha( 0, 600 )
				end,
				function ()
					return self.BracketsTopL:SetAlpha( 1, 250, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BracketsTopL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -736, _1080p * -546, _1080p * -498, 600 )
				end,
				function ()
					return self.BracketsTopL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -736, _1080p * -486, _1080p * -438, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		BoxGraph:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.BoxGraph:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BoxGraph:SetAlpha( 0, 860 )
				end,
				function ()
					return self.BoxGraph:SetAlpha( 1, 20 )
				end,
				function ()
					return self.BoxGraph:SetAlpha( 0, 20 )
				end,
				function ()
					return self.BoxGraph:SetAlpha( 1, 20 )
				end,
				function ()
					return self.BoxGraph:SetAlpha( 0, 20 )
				end,
				function ()
					return self.BoxGraph:SetAlpha( 1, 20 )
				end,
				function ()
					return self.BoxGraph:SetAlpha( 0, 20 )
				end,
				function ()
					return self.BoxGraph:SetAlpha( 1, 20 )
				end
			}
		} )
		FrameFluffText:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.FrameFluffText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FrameFluffText:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.FrameFluffText:SetAlpha( 1, 20 )
				end,
				function ()
					return self.FrameFluffText:SetAlpha( 0, 20 )
				end,
				function ()
					return self.FrameFluffText:SetAlpha( 1, 20 )
				end,
				function ()
					return self.FrameFluffText:SetAlpha( 0, 20 )
				end,
				function ()
					return self.FrameFluffText:SetAlpha( 1, 20 )
				end
			}
		} )
		EthanHackBoxGrid:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.EthanHackBoxGrid:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EthanHackBoxGrid:SetAlpha( 0, 1100 )
				end,
				function ()
					return self.EthanHackBoxGrid:SetAlpha( 1, 20 )
				end,
				function ()
					return self.EthanHackBoxGrid:SetAlpha( 0, 20 )
				end,
				function ()
					return self.EthanHackBoxGrid:SetAlpha( 1, 20 )
				end,
				function ()
					return self.EthanHackBoxGrid:SetAlpha( 0, 20 )
				end,
				function ()
					return self.EthanHackBoxGrid:SetAlpha( 1, 20 )
				end
			}
		} )
		EthanHackCountdownTimer:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.EthanHackCountdownTimer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EthanHackCountdownTimer:SetAlpha( 0, 1200 )
				end,
				function ()
					return self.EthanHackCountdownTimer:SetAlpha( 1, 20 )
				end,
				function ()
					return self.EthanHackCountdownTimer:SetAlpha( 0, 20 )
				end,
				function ()
					return self.EthanHackCountdownTimer:SetAlpha( 1, 20 )
				end,
				function ()
					return self.EthanHackCountdownTimer:SetAlpha( 0, 20 )
				end,
				function ()
					return self.EthanHackCountdownTimer:SetAlpha( 1, 20 )
				end
			}
		} )
		FluffText1:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.FluffText1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FluffText1:SetAlpha( 0, 1200 )
				end,
				function ()
					return self.FluffText1:SetAlpha( 0.6, 250 )
				end
			}
		} )
		FluffText2:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.FluffText2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FluffText2:SetAlpha( 0, 1200 )
				end,
				function ()
					return self.FluffText2:SetAlpha( 0.6, 250 )
				end
			}
		} )
		TechyDigitsTop:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.TechyDigitsTop:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TechyDigitsTop:SetAlpha( 0, 1200 )
				end,
				function ()
					return self.TechyDigitsTop:SetAlpha( 0.6, 250 )
				end
			}
		} )
		AmmoCounter:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.AmmoCounter:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AmmoCounter:SetAlpha( 0, 1300 )
				end,
				function ()
					return self.AmmoCounter:SetAlpha( 1, 20 )
				end,
				function ()
					return self.AmmoCounter:SetAlpha( 0, 20 )
				end,
				function ()
					return self.AmmoCounter:SetAlpha( 1, 20 )
				end,
				function ()
					return self.AmmoCounter:SetAlpha( 0, 20 )
				end,
				function ()
					return self.AmmoCounter:SetAlpha( 1, 20 )
				end
			}
		} )
		self._sequences.BootUp = function ()
			Reticle:AnimateSequence( "BootUp" )
			DotsTop1:AnimateSequence( "BootUp" )
			DotsTop2:AnimateSequence( "BootUp" )
			DotsTop3:AnimateSequence( "BootUp" )
			DotsBottom1:AnimateSequence( "BootUp" )
			DotsBottom2:AnimateSequence( "BootUp" )
			DotsBottom3:AnimateSequence( "BootUp" )
			ArcBL:AnimateSequence( "BootUp" )
			ArcTL:AnimateSequence( "BootUp" )
			ArcTR:AnimateSequence( "BootUp" )
			ArcBR:AnimateSequence( "BootUp" )
			BracketsBottom:AnimateSequence( "BootUp" )
			BracketsTopR:AnimateSequence( "BootUp" )
			BracketsTopL:AnimateSequence( "BootUp" )
			BoxGraph:AnimateSequence( "BootUp" )
			FrameFluffText:AnimateSequence( "BootUp" )
			EthanHackBoxGrid:AnimateSequence( "BootUp" )
			EthanHackCountdownTimer:AnimateSequence( "BootUp" )
			FluffText1:AnimateSequence( "BootUp" )
			FluffText2:AnimateSequence( "BootUp" )
			TechyDigitsTop:AnimateSequence( "BootUp" )
			AmmoCounter:AnimateSequence( "BootUp" )
		end
		
		Reticle:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Reticle:SetAlpha( 0, 0 )
				end
			}
		} )
		DotsTop1:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.DotsTop1:SetAlpha( 0, 0 )
				end
			}
		} )
		DotsTop2:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.DotsTop2:SetAlpha( 0, 0 )
				end
			}
		} )
		DotsTop3:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.DotsTop3:SetAlpha( 0, 0 )
				end
			}
		} )
		DotsBottom1:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.DotsBottom1:SetAlpha( 0, 0 )
				end
			}
		} )
		DotsBottom2:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.DotsBottom2:SetAlpha( 0, 0 )
				end
			}
		} )
		DotsBottom3:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.DotsBottom3:SetAlpha( 0, 0 )
				end
			}
		} )
		ArcBL:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ArcBL:SetAlpha( 0, 0 )
				end
			}
		} )
		ArcTL:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ArcTL:SetAlpha( 0, 0 )
				end
			}
		} )
		ArcTR:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ArcTR:SetAlpha( 0, 0 )
				end
			}
		} )
		ArcBR:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ArcBR:SetAlpha( 0, 0 )
				end
			}
		} )
		BracketsBottom:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.BracketsBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		BracketsTopR:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.BracketsTopR:SetAlpha( 0, 0 )
				end
			}
		} )
		BracketsTopL:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.BracketsTopL:SetAlpha( 0, 0 )
				end
			}
		} )
		BoxGraph:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.BoxGraph:SetAlpha( 0, 0 )
				end
			}
		} )
		FrameFluffText:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.FrameFluffText:SetAlpha( 0, 0 )
				end
			}
		} )
		EthanHackBoxGrid:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.EthanHackBoxGrid:SetAlpha( 0, 0 )
				end
			}
		} )
		EthanHackCountdownTimer:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.EthanHackCountdownTimer:SetAlpha( 0, 0 )
				end
			}
		} )
		FluffText1:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.FluffText1:SetAlpha( 0, 0 )
				end
			}
		} )
		FluffText2:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.FluffText2:SetAlpha( 0, 0 )
				end
			}
		} )
		TechyDigitsTop:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.TechyDigitsTop:SetAlpha( 0, 0 )
				end
			}
		} )
		AmmoCounter:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.AmmoCounter:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			Reticle:AnimateSequence( "Hide" )
			DotsTop1:AnimateSequence( "Hide" )
			DotsTop2:AnimateSequence( "Hide" )
			DotsTop3:AnimateSequence( "Hide" )
			DotsBottom1:AnimateSequence( "Hide" )
			DotsBottom2:AnimateSequence( "Hide" )
			DotsBottom3:AnimateSequence( "Hide" )
			ArcBL:AnimateSequence( "Hide" )
			ArcTL:AnimateSequence( "Hide" )
			ArcTR:AnimateSequence( "Hide" )
			ArcBR:AnimateSequence( "Hide" )
			BracketsBottom:AnimateSequence( "Hide" )
			BracketsTopR:AnimateSequence( "Hide" )
			BracketsTopL:AnimateSequence( "Hide" )
			BoxGraph:AnimateSequence( "Hide" )
			FrameFluffText:AnimateSequence( "Hide" )
			EthanHackBoxGrid:AnimateSequence( "Hide" )
			EthanHackCountdownTimer:AnimateSequence( "Hide" )
			FluffText1:AnimateSequence( "Hide" )
			FluffText2:AnimateSequence( "Hide" )
			TechyDigitsTop:AnimateSequence( "Hide" )
			AmmoCounter:AnimateSequence( "Hide" )
		end
		
		TopMeter:RegisterAnimationSequence( "HideVignette", {
			{
				function ()
					return self.TopMeter:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TopMeter:SetAlpha( 0, 1000 )
				end
			}
		} )
		BottomMeter:RegisterAnimationSequence( "HideVignette", {
			{
				function ()
					return self.BottomMeter:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BottomMeter:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.HideVignette = function ()
			TopMeter:AnimateSequence( "HideVignette" )
			BottomMeter:AnimateSequence( "HideVignette" )
		end
		
		TopMeter:RegisterAnimationSequence( "ShowVignette", {
			{
				function ()
					return self.TopMeter:SetAlpha( 1, 0 )
				end
			}
		} )
		BottomMeter:RegisterAnimationSequence( "ShowVignette", {
			{
				function ()
					return self.BottomMeter:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowVignette = function ()
			TopMeter:AnimateSequence( "ShowVignette" )
			BottomMeter:AnimateSequence( "ShowVignette" )
		end
		
		TopMeter:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.TopMeter:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.TopMeter:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.TopMeter:SetGlitchAmount( 0, 1000, LUI.EASING.outSine )
				end
			}
		} )
		BottomMeter:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.BottomMeter:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.BottomMeter:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.BottomMeter:SetGlitchAmount( 0.5, 1000, LUI.EASING.inOutQuartic )
				end,
				function ()
					return self.BottomMeter:SetGlitchAmount( 0, 500, LUI.EASING.inCubic )
				end
			}
		} )
		Reticle:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.Reticle:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.Reticle:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.Reticle:SetGlitchAmount( 0, 1000, LUI.EASING.inBack )
				end
			}
		} )
		DotsTop1:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.DotsTop1:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.DotsTop1:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.DotsTop1:SetGlitchAmount( 0, 1000, LUI.EASING.outCubic )
				end
			}
		} )
		DotsTop2:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.DotsTop2:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.DotsTop2:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.DotsTop2:SetGlitchAmount( 0.5, 1000, LUI.EASING.inQuintic )
				end,
				function ()
					return self.DotsTop2:SetGlitchAmount( 0, 500, LUI.EASING.outBack )
				end
			}
		} )
		DotsTop3:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.DotsTop3:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.DotsTop3:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.DotsTop3:SetGlitchAmount( 0, 1000, LUI.EASING.inOutSine )
				end
			}
		} )
		DotsBottom1:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.DotsBottom1:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.DotsBottom1:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.DotsBottom1:SetGlitchAmount( 0.5, 1000, LUI.EASING.outQuartic )
				end,
				function ()
					return self.DotsBottom1:SetGlitchAmount( 0, 500, LUI.EASING.inSine )
				end
			}
		} )
		DotsBottom2:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.DotsBottom2:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.DotsBottom2:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.DotsBottom2:SetGlitchAmount( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		DotsBottom3:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.DotsBottom3:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.DotsBottom3:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.DotsBottom3:SetGlitchAmount( 0.5, 1000, LUI.EASING.inOutBack )
				end,
				function ()
					return self.DotsBottom3:SetGlitchAmount( 0, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		ArcBL:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.ArcBL:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.ArcBL:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.ArcBL:SetGlitchAmount( 0, 1000, LUI.EASING.inSine )
				end
			}
		} )
		ArcTL:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.ArcTL:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.ArcTL:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.ArcTL:SetGlitchAmount( 0.5, 1000 )
				end,
				function ()
					return self.ArcTL:SetGlitchAmount( 0, 500, LUI.EASING.inCubic )
				end
			}
		} )
		ArcTR:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.ArcTR:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.ArcTR:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.ArcTR:SetGlitchAmount( 0, 1000, LUI.EASING.inOutCubic )
				end
			}
		} )
		ArcBR:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.ArcBR:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.ArcBR:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.ArcBR:SetGlitchAmount( 0.5, 1000, LUI.EASING.outBack )
				end,
				function ()
					return self.ArcBR:SetGlitchAmount( 0, 500, LUI.EASING.inSine )
				end
			}
		} )
		BracketsBottom:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.BracketsBottom:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.BracketsBottom:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.BracketsBottom:SetGlitchAmount( 0, 1000, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		BracketsTopR:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.BracketsTopR:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.BracketsTopR:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.BracketsTopR:SetGlitchAmount( 0.5, 1000, LUI.EASING.outQuintic )
				end,
				function ()
					return self.BracketsTopR:SetGlitchAmount( 0, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		BracketsTopL:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.BracketsTopL:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.BracketsTopL:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.BracketsTopL:SetGlitchAmount( 0, 1000, LUI.EASING.inSine )
				end
			}
		} )
		BoxGraph:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.BoxGraph:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.BoxGraph:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.BoxGraph:SetGlitchAmount( 0.5, 1000, LUI.EASING.outQuartic )
				end,
				function ()
					return self.BoxGraph:SetGlitchAmount( 0, 500, LUI.EASING.inOutSine )
				end
			}
		} )
		FrameFluffText:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.FrameFluffText:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.FrameFluffText:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.FrameFluffText:SetGlitchAmount( 0, 1000, LUI.EASING.outSine )
				end
			}
		} )
		EthanHackBoxGrid:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.EthanHackBoxGrid:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.EthanHackBoxGrid:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.EthanHackBoxGrid:SetGlitchAmount( 0.5, 1000, LUI.EASING.inOutQuintic )
				end,
				function ()
					return self.EthanHackBoxGrid:SetGlitchAmount( 0, 500, LUI.EASING.inCubic )
				end
			}
		} )
		EthanHackCountdownTimer:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.EthanHackCountdownTimer:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.EthanHackCountdownTimer:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.EthanHackCountdownTimer:SetGlitchAmount( 0, 1000, LUI.EASING.outCubic )
				end
			}
		} )
		FluffText1:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.FluffText1:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.FluffText1:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.FluffText1:SetGlitchAmount( 0.5, 1000, LUI.EASING.inQuartic )
				end,
				function ()
					return self.FluffText1:SetGlitchAmount( 0, 500 )
				end
			}
		} )
		FluffText2:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.FluffText2:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.FluffText2:SetGlitchAmount( 0, 1000, LUI.EASING.inCubic )
				end
			},
			{
				function ()
					return self.FluffText2:SetGlitchEnabled( true )
				end
			}
		} )
		TechyDigitsTop:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.TechyDigitsTop:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.TechyDigitsTop:SetGlitchAmount( 0.5, 1000, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.TechyDigitsTop:SetGlitchAmount( 0, 500, LUI.EASING.inQuintic )
				end
			},
			{
				function ()
					return self.TechyDigitsTop:SetGlitchEnabled( true )
				end
			}
		} )
		AmmoCounter:RegisterAnimationSequence( "LightGlitch", {
			{
				function ()
					return self.AmmoCounter:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.AmmoCounter:SetGlitchAmount( 0.5, 0 )
				end,
				function ()
					return self.AmmoCounter:SetGlitchAmount( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.LightGlitch = function ()
			TopMeter:AnimateSequence( "LightGlitch" )
			BottomMeter:AnimateSequence( "LightGlitch" )
			Reticle:AnimateSequence( "LightGlitch" )
			DotsTop1:AnimateSequence( "LightGlitch" )
			DotsTop2:AnimateSequence( "LightGlitch" )
			DotsTop3:AnimateSequence( "LightGlitch" )
			DotsBottom1:AnimateSequence( "LightGlitch" )
			DotsBottom2:AnimateSequence( "LightGlitch" )
			DotsBottom3:AnimateSequence( "LightGlitch" )
			ArcBL:AnimateSequence( "LightGlitch" )
			ArcTL:AnimateSequence( "LightGlitch" )
			ArcTR:AnimateSequence( "LightGlitch" )
			ArcBR:AnimateSequence( "LightGlitch" )
			BracketsBottom:AnimateSequence( "LightGlitch" )
			BracketsTopR:AnimateSequence( "LightGlitch" )
			BracketsTopL:AnimateSequence( "LightGlitch" )
			BoxGraph:AnimateSequence( "LightGlitch" )
			FrameFluffText:AnimateSequence( "LightGlitch" )
			EthanHackBoxGrid:AnimateSequence( "LightGlitch" )
			EthanHackCountdownTimer:AnimateSequence( "LightGlitch" )
			FluffText1:AnimateSequence( "LightGlitch" )
			FluffText2:AnimateSequence( "LightGlitch" )
			TechyDigitsTop:AnimateSequence( "LightGlitch" )
			AmmoCounter:AnimateSequence( "LightGlitch" )
		end
		
		TopMeter:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.TopMeter:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.TopMeter:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.TopMeter:SetGlitchAmount( 0.25, 2000, LUI.EASING.outSine )
				end
			}
		} )
		BottomMeter:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.BottomMeter:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.BottomMeter:SetGlitchAmount( 0.25, 0 )
				end,
				function ()
					return self.BottomMeter:SetGlitchAmount( 1, 1250, LUI.EASING.inOutQuartic )
				end,
				function ()
					return self.BottomMeter:SetGlitchAmount( 0.25, 1000, LUI.EASING.inCubic )
				end
			}
		} )
		Reticle:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.Reticle:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.Reticle:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Reticle:SetGlitchAmount( 0.25, 1250, LUI.EASING.outBack )
				end,
				function ()
					return self.Reticle:SetGlitchAmount( 1, 1000 )
				end
			}
		} )
		DotsTop1:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.DotsTop1:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.DotsTop1:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.DotsTop1:SetGlitchAmount( 0.25, 2000, LUI.EASING.outCubic )
				end
			}
		} )
		DotsTop2:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.DotsTop2:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.DotsTop2:SetGlitchAmount( 0.25, 0 )
				end,
				function ()
					return self.DotsTop2:SetGlitchAmount( 1, 1250, LUI.EASING.inQuintic )
				end,
				function ()
					return self.DotsTop2:SetGlitchAmount( 0.25, 1000, LUI.EASING.outBack )
				end
			}
		} )
		DotsTop3:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.DotsTop3:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.DotsTop3:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.DotsTop3:SetGlitchAmount( 0.25, 2000, LUI.EASING.inOutSine )
				end
			}
		} )
		DotsBottom1:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.DotsBottom1:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.DotsBottom1:SetGlitchAmount( 0.25, 0 )
				end,
				function ()
					return self.DotsBottom1:SetGlitchAmount( 1, 1250, LUI.EASING.outQuartic )
				end,
				function ()
					return self.DotsBottom1:SetGlitchAmount( 0.25, 1000, LUI.EASING.inSine )
				end
			}
		} )
		DotsBottom2:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.DotsBottom2:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.DotsBottom2:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.DotsBottom2:SetGlitchAmount( 0.25, 2000, LUI.EASING.inQuadratic )
				end
			}
		} )
		DotsBottom3:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.DotsBottom3:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.DotsBottom3:SetGlitchAmount( 0.25, 0 )
				end,
				function ()
					return self.DotsBottom3:SetGlitchAmount( 1, 1250, LUI.EASING.inOutBack )
				end,
				function ()
					return self.DotsBottom3:SetGlitchAmount( 0.25, 1000, LUI.EASING.outQuadratic )
				end
			}
		} )
		ArcBL:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.ArcBL:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.ArcBL:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.ArcBL:SetGlitchAmount( 0.25, 2000, LUI.EASING.inSine )
				end
			}
		} )
		ArcTL:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.ArcTL:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.ArcTL:SetGlitchAmount( 0.25, 0 )
				end,
				function ()
					return self.ArcTL:SetGlitchAmount( 1, 1250 )
				end,
				function ()
					return self.ArcTL:SetGlitchAmount( 0.25, 1000, LUI.EASING.inCubic )
				end
			}
		} )
		ArcTR:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.ArcTR:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.ArcTR:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.ArcTR:SetGlitchAmount( 0.25, 2000, LUI.EASING.inOutCubic )
				end
			}
		} )
		ArcBR:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.ArcBR:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.ArcBR:SetGlitchAmount( 0.25, 0 )
				end,
				function ()
					return self.ArcBR:SetGlitchAmount( 1, 1250, LUI.EASING.outBack )
				end,
				function ()
					return self.ArcBR:SetGlitchAmount( 0.25, 1000, LUI.EASING.inSine )
				end
			}
		} )
		BracketsBottom:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.BracketsBottom:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.BracketsBottom:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.BracketsBottom:SetGlitchAmount( 0.25, 2000, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		BracketsTopR:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.BracketsTopR:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.BracketsTopR:SetGlitchAmount( 0.25, 0 )
				end,
				function ()
					return self.BracketsTopR:SetGlitchAmount( 1, 1250, LUI.EASING.outQuintic )
				end,
				function ()
					return self.BracketsTopR:SetGlitchAmount( 0.25, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		BracketsTopL:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.BracketsTopL:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.BracketsTopL:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.BracketsTopL:SetGlitchAmount( 0.25, 2000, LUI.EASING.inSine )
				end
			}
		} )
		BoxGraph:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.BoxGraph:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.BoxGraph:SetGlitchAmount( 0.25, 0 )
				end,
				function ()
					return self.BoxGraph:SetGlitchAmount( 1, 1250, LUI.EASING.outQuartic )
				end,
				function ()
					return self.BoxGraph:SetGlitchAmount( 0.25, 1000, LUI.EASING.inOutSine )
				end
			}
		} )
		FrameFluffText:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.FrameFluffText:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.FrameFluffText:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.FrameFluffText:SetGlitchAmount( 0.25, 2000, LUI.EASING.outSine )
				end
			}
		} )
		EthanHackBoxGrid:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.EthanHackBoxGrid:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.EthanHackBoxGrid:SetGlitchAmount( 0.25, 0 )
				end,
				function ()
					return self.EthanHackBoxGrid:SetGlitchAmount( 1, 1250, LUI.EASING.inOutQuintic )
				end,
				function ()
					return self.EthanHackBoxGrid:SetGlitchAmount( 0.25, 1000, LUI.EASING.inCubic )
				end
			}
		} )
		EthanHackCountdownTimer:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.EthanHackCountdownTimer:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.EthanHackCountdownTimer:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.EthanHackCountdownTimer:SetGlitchAmount( 0.25, 2000, LUI.EASING.outCubic )
				end
			}
		} )
		FluffText1:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.FluffText1:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.FluffText1:SetGlitchAmount( 0.25, 0 )
				end,
				function ()
					return self.FluffText1:SetGlitchAmount( 1, 1250, LUI.EASING.inQuartic )
				end,
				function ()
					return self.FluffText1:SetGlitchAmount( 0.25, 1000 )
				end
			}
		} )
		FluffText2:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.FluffText2:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.FluffText2:SetGlitchAmount( 0.25, 2000, LUI.EASING.inCubic )
				end
			},
			{
				function ()
					return self.FluffText2:SetGlitchEnabled( true )
				end
			}
		} )
		TechyDigitsTop:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.TechyDigitsTop:SetGlitchAmount( 0.25, 0 )
				end,
				function ()
					return self.TechyDigitsTop:SetGlitchAmount( 1, 1250, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.TechyDigitsTop:SetGlitchAmount( 0.25, 1000, LUI.EASING.inQuintic )
				end
			},
			{
				function ()
					return self.TechyDigitsTop:SetGlitchEnabled( true )
				end
			}
		} )
		AmmoCounter:RegisterAnimationSequence( "HeavyGlitch", {
			{
				function ()
					return self.AmmoCounter:SetGlitchEnabled( true )
				end
			},
			{
				function ()
					return self.AmmoCounter:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.AmmoCounter:SetGlitchAmount( 0.25, 2000, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.HeavyGlitch = function ()
			TopMeter:AnimateLoop( "HeavyGlitch" )
			BottomMeter:AnimateLoop( "HeavyGlitch" )
			Reticle:AnimateLoop( "HeavyGlitch" )
			DotsTop1:AnimateLoop( "HeavyGlitch" )
			DotsTop2:AnimateLoop( "HeavyGlitch" )
			DotsTop3:AnimateLoop( "HeavyGlitch" )
			DotsBottom1:AnimateLoop( "HeavyGlitch" )
			DotsBottom2:AnimateLoop( "HeavyGlitch" )
			DotsBottom3:AnimateLoop( "HeavyGlitch" )
			ArcBL:AnimateLoop( "HeavyGlitch" )
			ArcTL:AnimateLoop( "HeavyGlitch" )
			ArcTR:AnimateLoop( "HeavyGlitch" )
			ArcBR:AnimateLoop( "HeavyGlitch" )
			BracketsBottom:AnimateLoop( "HeavyGlitch" )
			BracketsTopR:AnimateLoop( "HeavyGlitch" )
			BracketsTopL:AnimateLoop( "HeavyGlitch" )
			BoxGraph:AnimateLoop( "HeavyGlitch" )
			FrameFluffText:AnimateLoop( "HeavyGlitch" )
			EthanHackBoxGrid:AnimateLoop( "HeavyGlitch" )
			EthanHackCountdownTimer:AnimateLoop( "HeavyGlitch" )
			FluffText1:AnimateLoop( "HeavyGlitch" )
			FluffText2:AnimateLoop( "HeavyGlitch" )
			TechyDigitsTop:AnimateLoop( "HeavyGlitch" )
			AmmoCounter:AnimateLoop( "HeavyGlitch" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.hackEthanControlOverlay:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.hackEthanControlOverlay:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.hackEthanControlOverlay:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "Hide" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "EthanHackBoxGrid",
				sequenceName = "DefaultSequence",
				elementPath = "EthanHackBoxGrid"
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "Reticle",
				sequenceName = "DefaultSequence",
				elementPath = "Reticle"
			} )
			ACTIONS.AnimateSequence( self, "HideVignette" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.SP.hackControlOutro:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.hackControlOutro:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.hackControlOutro:GetValue( f3_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Hide" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "EthanHackBoxGrid",
				sequenceName = "DefaultSequence",
				elementPath = "EthanHackBoxGrid"
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "Reticle",
				sequenceName = "DefaultSequence",
				elementPath = "Reticle"
			} )
			ACTIONS.AnimateSequence( self, "HideVignette" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.SP.missionCountdown.timer:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.missionCountdown.timer:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.missionCountdown.timer:GetValue( f3_local1 ) > 0 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "EthanHackCountdownTimer",
				sequenceName = "Reset",
				elementPath = "EthanHackCountdownTimer"
			} )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.SP.hackEthanOverlayGlitchState:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.hackEthanOverlayGlitchState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.hackEthanOverlayGlitchState:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "DefaultSequence" )
		end
		if DataSources.inGame.SP.hackEthanOverlayGlitchState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.hackEthanOverlayGlitchState:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "LightGlitch" )
		end
		if DataSources.inGame.SP.hackEthanOverlayGlitchState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.hackEthanOverlayGlitchState:GetValue( f3_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "HeavyGlitch" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequence( self, "Hide" )
	ACTIONS.AnimateSequence( self, "ShowVignette" )
	return self
end

MenuBuilder.registerType( "EthanHackOverlay", EthanHackOverlay )
LockTable( _M )
