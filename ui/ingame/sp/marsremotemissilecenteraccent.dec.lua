local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MarsRemoteMissileCenterAccent( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 720 * _1080p, 0, 720 * _1080p )
	self.id = "MarsRemoteMissileCenterAccent"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CrossUpperLeft = nil
	
	CrossUpperLeft = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f1_local1
	} )
	CrossUpperLeft.id = "CrossUpperLeft"
	CrossUpperLeft.rightLine:SetLeft( _1080p * -4, 0 )
	CrossUpperLeft.rightLine:SetTop( _1080p * -0.5, 0 )
	CrossUpperLeft.rightLine:SetBottom( _1080p * 0.5, 0 )
	CrossUpperLeft.leftLine:SetRight( _1080p * 4, 0 )
	CrossUpperLeft.leftLine:SetTop( _1080p * -0.5, 0 )
	CrossUpperLeft.leftLine:SetBottom( _1080p * 0.5, 0 )
	CrossUpperLeft.bottomLine:SetLeft( _1080p * -0.5, 0 )
	CrossUpperLeft.bottomLine:SetRight( _1080p * 0.5, 0 )
	CrossUpperLeft.bottomLine:SetTop( _1080p * -4, 0 )
	CrossUpperLeft.topLine:SetLeft( _1080p * -0.5, 0 )
	CrossUpperLeft.topLine:SetRight( _1080p * 0.5, 0 )
	CrossUpperLeft.topLine:SetBottom( _1080p * 4, 0 )
	CrossUpperLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -24, _1080p * -16, _1080p * -24, _1080p * -16 )
	self:addElement( CrossUpperLeft )
	self.CrossUpperLeft = CrossUpperLeft
	
	local FrameUpperRight = nil
	
	FrameUpperRight = MenuBuilder.BuildRegisteredType( "GenericBoxWithBorders", {
		controllerIndex = f1_local1
	} )
	FrameUpperRight.id = "FrameUpperRight"
	FrameUpperRight.Fill:SetAlpha( 0, 0 )
	FrameUpperRight.Stroke.Left:SetRight( _1080p * 0, 0 )
	FrameUpperRight.Stroke.Right:SetLeft( _1080p * -1, 0 )
	FrameUpperRight.Stroke.Top:SetBottom( _1080p * 1, 0 )
	FrameUpperRight.Stroke.Bottom:SetTop( _1080p * 0, 0 )
	FrameUpperRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -348, 0, 0, _1080p * 8 )
	self:addElement( FrameUpperRight )
	self.FrameUpperRight = FrameUpperRight
	
	local FrameUpperLeft = nil
	
	FrameUpperLeft = MenuBuilder.BuildRegisteredType( "GenericBoxWithBorders", {
		controllerIndex = f1_local1
	} )
	FrameUpperLeft.id = "FrameUpperLeft"
	FrameUpperLeft.Fill:SetAlpha( 0, 0 )
	FrameUpperLeft.Stroke.Left:SetRight( _1080p * 1, 0 )
	FrameUpperLeft.Stroke.Right:SetLeft( _1080p * 0, 0 )
	FrameUpperLeft.Stroke.Top:SetBottom( _1080p * 1, 0 )
	FrameUpperLeft.Stroke.Bottom:SetTop( _1080p * 0, 0 )
	FrameUpperLeft:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 348, 0, _1080p * 8 )
	self:addElement( FrameUpperLeft )
	self.FrameUpperLeft = FrameUpperLeft
	
	local CrossUpperRight = nil
	
	CrossUpperRight = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f1_local1
	} )
	CrossUpperRight.id = "CrossUpperRight"
	CrossUpperRight.rightLine:SetLeft( _1080p * -4, 0 )
	CrossUpperRight.rightLine:SetTop( _1080p * -0.5, 0 )
	CrossUpperRight.rightLine:SetBottom( _1080p * 0.5, 0 )
	CrossUpperRight.leftLine:SetRight( _1080p * 4, 0 )
	CrossUpperRight.leftLine:SetTop( _1080p * -0.5, 0 )
	CrossUpperRight.leftLine:SetBottom( _1080p * 0.5, 0 )
	CrossUpperRight.bottomLine:SetLeft( _1080p * -0.5, 0 )
	CrossUpperRight.bottomLine:SetRight( _1080p * 0.5, 0 )
	CrossUpperRight.bottomLine:SetTop( _1080p * -4, 0 )
	CrossUpperRight.topLine:SetLeft( _1080p * -0.5, 0 )
	CrossUpperRight.topLine:SetRight( _1080p * 0.5, 0 )
	CrossUpperRight.topLine:SetBottom( _1080p * 4, 0 )
	CrossUpperRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 16, _1080p * 24, _1080p * -24, _1080p * -16 )
	self:addElement( CrossUpperRight )
	self.CrossUpperRight = CrossUpperRight
	
	local FrameLowerRight = nil
	
	FrameLowerRight = MenuBuilder.BuildRegisteredType( "GenericBoxWithBorders", {
		controllerIndex = f1_local1
	} )
	FrameLowerRight.id = "FrameLowerRight"
	FrameLowerRight.Fill:SetAlpha( 0, 0 )
	FrameLowerRight.Stroke.Left:SetRight( _1080p * 0, 0 )
	FrameLowerRight.Stroke.Right:SetLeft( _1080p * -1, 0 )
	FrameLowerRight.Stroke.Top:SetBottom( _1080p * 0, 0 )
	FrameLowerRight.Stroke.Bottom:SetTop( _1080p * -1, 0 )
	FrameLowerRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -348, 0, _1080p * 32, _1080p * 40 )
	self:addElement( FrameLowerRight )
	self.FrameLowerRight = FrameLowerRight
	
	local FrameLowerLeft = nil
	
	FrameLowerLeft = MenuBuilder.BuildRegisteredType( "GenericBoxWithBorders", {
		controllerIndex = f1_local1
	} )
	FrameLowerLeft.id = "FrameLowerLeft"
	FrameLowerLeft.Fill:SetAlpha( 0, 0 )
	FrameLowerLeft.Stroke.Left:SetRight( _1080p * 1, 0 )
	FrameLowerLeft.Stroke.Right:SetLeft( _1080p * 0, 0 )
	FrameLowerLeft.Stroke.Top:SetBottom( _1080p * 0, 0 )
	FrameLowerLeft.Stroke.Bottom:SetTop( _1080p * -1, 0 )
	FrameLowerLeft:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 348, _1080p * 32, _1080p * 40 )
	self:addElement( FrameLowerLeft )
	self.FrameLowerLeft = FrameLowerLeft
	
	local CrossLowerLeft = nil
	
	CrossLowerLeft = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f1_local1
	} )
	CrossLowerLeft.id = "CrossLowerLeft"
	CrossLowerLeft.rightLine:SetLeft( _1080p * -4, 0 )
	CrossLowerLeft.rightLine:SetTop( _1080p * -0.5, 0 )
	CrossLowerLeft.rightLine:SetBottom( _1080p * 0.5, 0 )
	CrossLowerLeft.leftLine:SetRight( _1080p * 4, 0 )
	CrossLowerLeft.leftLine:SetTop( _1080p * -0.5, 0 )
	CrossLowerLeft.leftLine:SetBottom( _1080p * 0.5, 0 )
	CrossLowerLeft.bottomLine:SetLeft( _1080p * -0.5, 0 )
	CrossLowerLeft.bottomLine:SetRight( _1080p * 0.5, 0 )
	CrossLowerLeft.bottomLine:SetTop( _1080p * 4, 0 )
	CrossLowerLeft.topLine:SetLeft( _1080p * -0.5, 0 )
	CrossLowerLeft.topLine:SetRight( _1080p * 0.5, 0 )
	CrossLowerLeft.topLine:SetBottom( _1080p * -4, 0 )
	CrossLowerLeft:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -24, _1080p * -16, _1080p * 64, _1080p * 56 )
	self:addElement( CrossLowerLeft )
	self.CrossLowerLeft = CrossLowerLeft
	
	local CrossLowerRight = nil
	
	CrossLowerRight = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f1_local1
	} )
	CrossLowerRight.id = "CrossLowerRight"
	CrossLowerRight.rightLine:SetLeft( _1080p * -4, 0 )
	CrossLowerRight.rightLine:SetTop( _1080p * -0.5, 0 )
	CrossLowerRight.rightLine:SetBottom( _1080p * 0.5, 0 )
	CrossLowerRight.leftLine:SetRight( _1080p * 4, 0 )
	CrossLowerRight.leftLine:SetTop( _1080p * -0.5, 0 )
	CrossLowerRight.leftLine:SetBottom( _1080p * 0.5, 0 )
	CrossLowerRight.bottomLine:SetLeft( _1080p * -0.5, 0 )
	CrossLowerRight.bottomLine:SetRight( _1080p * 0.5, 0 )
	CrossLowerRight.bottomLine:SetTop( _1080p * 4, 0 )
	CrossLowerRight.topLine:SetLeft( _1080p * -0.5, 0 )
	CrossLowerRight.topLine:SetRight( _1080p * 0.5, 0 )
	CrossLowerRight.topLine:SetBottom( _1080p * -4, 0 )
	CrossLowerRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * 16, _1080p * 24, _1080p * 64, _1080p * 56 )
	self:addElement( CrossLowerRight )
	self.CrossLowerRight = CrossLowerRight
	
	local UpperBox = nil
	
	UpperBox = MenuBuilder.BuildRegisteredType( "GenericBoxWithBorders", {
		controllerIndex = f1_local1
	} )
	UpperBox.id = "UpperBox"
	UpperBox.Fill:SetAlpha( 0, 0 )
	UpperBox.Stroke.Left:SetRight( _1080p * 1, 0 )
	UpperBox.Stroke.Right:SetLeft( _1080p * -1, 0 )
	UpperBox.Stroke.Top:SetBottom( _1080p * 1, 0 )
	UpperBox.Stroke.Bottom:SetTop( _1080p * -1, 0 )
	UpperBox:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( UpperBox )
	self.UpperBox = UpperBox
	
	local LowerBox = nil
	
	LowerBox = MenuBuilder.BuildRegisteredType( "GenericBoxWithBorders", {
		controllerIndex = f1_local1
	} )
	LowerBox.id = "LowerBox"
	LowerBox.Fill:SetAlpha( 0, 0 )
	LowerBox.Stroke.Left:SetRight( _1080p * 1, 0 )
	LowerBox.Stroke.Right:SetLeft( _1080p * -1, 0 )
	LowerBox.Stroke.Top:SetBottom( _1080p * 1, 0 )
	LowerBox.Stroke.Bottom:SetTop( _1080p * -1, 0 )
	LowerBox:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -4, _1080p * 4, _1080p * 36, _1080p * 44 )
	self:addElement( LowerBox )
	self.LowerBox = LowerBox
	
	local LeftBar = nil
	
	LeftBar = LUI.UIImage.new()
	LeftBar.id = "LeftBar"
	LeftBar:SetUseAA( true )
	LeftBar:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -50, _1080p * 200, _1080p * -80, _1080p * -79 )
	self:addElement( LeftBar )
	self.LeftBar = LeftBar
	
	local LeftTick = nil
	
	LeftTick = LUI.UIImage.new()
	LeftTick.id = "LeftTick"
	LeftTick:SetUseAA( true )
	LeftTick:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 208, _1080p * 216, _1080p * -80, _1080p * -79 )
	self:addElement( LeftTick )
	self.LeftTick = LeftTick
	
	local RightBar = nil
	
	RightBar = LUI.UIImage.new()
	RightBar.id = "RightBar"
	RightBar:SetUseAA( true )
	RightBar:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -200, _1080p * 50, _1080p * -80, _1080p * -79 )
	self:addElement( RightBar )
	self.RightBar = RightBar
	
	local RightTick = nil
	
	RightTick = LUI.UIImage.new()
	RightTick.id = "RightTick"
	RightTick:SetUseAA( true )
	RightTick:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -216, _1080p * -208, _1080p * -80, _1080p * -79 )
	self:addElement( RightTick )
	self.RightTick = RightTick
	
	return self
end

MenuBuilder.registerType( "MarsRemoteMissileCenterAccent", MarsRemoteMissileCenterAccent )
LockTable( _M )
