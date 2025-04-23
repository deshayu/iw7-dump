local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PipTopRightFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 250 * _1080p )
	self.id = "PipTopRightFrame"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HackVideoFeedFrame = nil
	
	HackVideoFeedFrame = MenuBuilder.BuildRegisteredType( "HackVideoFeedFrame", {
		controllerIndex = f1_local1
	} )
	HackVideoFeedFrame.id = "HackVideoFeedFrame"
	HackVideoFeedFrame:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -1, 0, _1080p * -1 )
	self:addElement( HackVideoFeedFrame )
	self.HackVideoFeedFrame = HackVideoFeedFrame
	
	local FluffRight3 = nil
	
	FluffRight3 = LUI.UIImage.new()
	FluffRight3.id = "FluffRight3"
	FluffRight3:SetRGBFromTable( SWATCHES.PIP.PIPOutline, 0 )
	FluffRight3:SetAlpha( 0.8, 0 )
	FluffRight3:SetScale( 0.5, 0 )
	FluffRight3:setImage( RegisterMaterial( "hud_pip_rt_fluff1" ), 0 )
	FluffRight3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 7, _1080p * 14, _1080p * 25, _1080p * 55 )
	self:addElement( FluffRight3 )
	self.FluffRight3 = FluffRight3
	
	local FrameRightCornerDot = nil
	
	FrameRightCornerDot = LUI.UIImage.new()
	FrameRightCornerDot.id = "FrameRightCornerDot"
	FrameRightCornerDot:SetRGBFromTable( SWATCHES.PIP.PIPOutline, 0 )
	FrameRightCornerDot:SetAlpha( 0.8, 0 )
	FrameRightCornerDot:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * 20, _1080p * 23, _1080p * -6, _1080p * -3 )
	self:addElement( FrameRightCornerDot )
	self.FrameRightCornerDot = FrameRightCornerDot
	
	local FluffTopLeftSquare = nil
	
	FluffTopLeftSquare = MenuBuilder.BuildRegisteredType( "GenericBorderFrame", {
		controllerIndex = f1_local1
	} )
	FluffTopLeftSquare.id = "FluffTopLeftSquare"
	FluffTopLeftSquare:SetRGBFromTable( SWATCHES.PIP.PIPOutline, 0 )
	FluffTopLeftSquare:SetAlpha( 0.2, 0 )
	FluffTopLeftSquare.Left:SetRight( _1080p * 1, 0 )
	FluffTopLeftSquare.Right:SetLeft( _1080p * -1, 0 )
	FluffTopLeftSquare.Top:SetBottom( _1080p * 1, 0 )
	FluffTopLeftSquare.Bottom:SetTop( _1080p * -1, 0 )
	FluffTopLeftSquare:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -11, 0, _1080p * -14, _1080p * -3 )
	self:addElement( FluffTopLeftSquare )
	self.FluffTopLeftSquare = FluffTopLeftSquare
	
	local FluffTop1 = nil
	
	FluffTop1 = LUI.UIImage.new()
	FluffTop1.id = "FluffTop1"
	FluffTop1:SetRGBFromTable( SWATCHES.PIP.PIPOutline, 0 )
	FluffTop1:SetAlpha( 0.4, 0 )
	FluffTop1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -7, _1080p * -3, _1080p * -2, _1080p * 2 )
	self:addElement( FluffTop1 )
	self.FluffTop1 = FluffTop1
	
	local FluffTop2 = nil
	
	FluffTop2 = LUI.UIImage.new()
	FluffTop2.id = "FluffTop2"
	FluffTop2:SetRGBFromTable( SWATCHES.PIP.PIPOutline, 0 )
	FluffTop2:SetAlpha( 0.4, 0 )
	FluffTop2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 3, _1080p * 7, _1080p * -2, _1080p * 2 )
	self:addElement( FluffTop2 )
	self.FluffTop2 = FluffTop2
	
	local FluffRightSquare = nil
	
	FluffRightSquare = MenuBuilder.BuildRegisteredType( "GenericBorderFrame", {
		controllerIndex = f1_local1
	} )
	FluffRightSquare.id = "FluffRightSquare"
	FluffRightSquare:SetRGBFromTable( SWATCHES.PIP.PIPOutline, 0 )
	FluffRightSquare:SetAlpha( 0.2, 0 )
	FluffRightSquare.Left:SetRight( _1080p * 1, 0 )
	FluffRightSquare.Right:SetLeft( _1080p * -1, 0 )
	FluffRightSquare.Top:SetBottom( _1080p * 1, 0 )
	FluffRightSquare.Bottom:SetTop( _1080p * -1, 0 )
	FluffRightSquare:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 9.5, _1080p * 21.5, _1080p * -14, _1080p * -2 )
	self:addElement( FluffRightSquare )
	self.FluffRightSquare = FluffRightSquare
	
	local FrameTopLine = nil
	
	FrameTopLine = LUI.UIImage.new()
	FrameTopLine.id = "FrameTopLine"
	FrameTopLine:SetRGBFromTable( SWATCHES.PIP.PIPOutline, 0 )
	FrameTopLine:SetAlpha( 0.6, 0 )
	FrameTopLine:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * 21, _1080p * 11, _1080p * 12 )
	self:addElement( FrameTopLine )
	self.FrameTopLine = FrameTopLine
	
	local FrameRightLine = nil
	
	FrameRightLine = LUI.UIImage.new()
	FrameRightLine.id = "FrameRightLine"
	FrameRightLine:SetRGBFromTable( SWATCHES.PIP.PIPOutline, 0 )
	FrameRightLine:SetAlpha( 0.6, 0 )
	FrameRightLine:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 21, _1080p * 22, _1080p * 11, _1080p * -10 )
	self:addElement( FrameRightLine )
	self.FrameRightLine = FrameRightLine
	
	return self
end

MenuBuilder.registerType( "PipTopRightFrame", PipTopRightFrame )
LockTable( _M )
