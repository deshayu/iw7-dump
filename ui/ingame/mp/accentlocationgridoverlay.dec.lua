local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AccentLocationGridOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p )
	self.id = "AccentLocationGridOverlay"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TopLeft = nil
	
	TopLeft = LUI.UIImage.new()
	TopLeft.id = "TopLeft"
	TopLeft:setImage( RegisterMaterial( "hud_location_selector_frame" ), 0 )
	TopLeft:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 256 )
	self:addElement( TopLeft )
	self.TopLeft = TopLeft
	
	local TopRight = nil
	
	TopRight = LUI.UIImage.new()
	TopRight.id = "TopRight"
	TopRight:setImage( RegisterMaterial( "hud_location_selector_frame" ), 0 )
	TopRight:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * -32, 0, _1080p * 256 )
	self:addElement( TopRight )
	self.TopRight = TopRight
	
	local BottomLeft = nil
	
	BottomLeft = LUI.UIImage.new()
	BottomLeft.id = "BottomLeft"
	BottomLeft:setImage( RegisterMaterial( "hud_location_selector_frame" ), 0 )
	BottomLeft:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 32, 0, _1080p * -256 )
	self:addElement( BottomLeft )
	self.BottomLeft = BottomLeft
	
	local BottomRight = nil
	
	BottomRight = LUI.UIImage.new()
	BottomRight.id = "BottomRight"
	BottomRight:setImage( RegisterMaterial( "hud_location_selector_frame" ), 0 )
	BottomRight:SetAnchorsAndPosition( 1, 0, 1, 0, 0, _1080p * -32, 0, _1080p * -256 )
	self:addElement( BottomRight )
	self.BottomRight = BottomRight
	
	local LeftCross = nil
	
	LeftCross = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f1_local1
	} )
	LeftCross.id = "LeftCross"
	LeftCross.rightLine:SetLeft( _1080p * -15, 0 )
	LeftCross.rightLine:SetTop( _1080p * -0.5, 0 )
	LeftCross.rightLine:SetBottom( _1080p * 0.5, 0 )
	LeftCross.leftLine:SetRight( _1080p * 17, 0 )
	LeftCross.leftLine:SetTop( _1080p * -0.5, 0 )
	LeftCross.leftLine:SetBottom( _1080p * 0.5, 0 )
	LeftCross.bottomLine:SetLeft( _1080p * -0.5, 0 )
	LeftCross.bottomLine:SetRight( _1080p * 0.5, 0 )
	LeftCross.bottomLine:SetTop( _1080p * -15, 0 )
	LeftCross.topLine:SetLeft( _1080p * -0.5, 0 )
	LeftCross.topLine:SetRight( _1080p * 0.5, 0 )
	LeftCross.topLine:SetBottom( _1080p * 17, 0 )
	LeftCross:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16 )
	self:addElement( LeftCross )
	self.LeftCross = LeftCross
	
	local RightCross = nil
	
	RightCross = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f1_local1
	} )
	RightCross.id = "RightCross"
	RightCross.rightLine:SetLeft( _1080p * -15, 0 )
	RightCross.rightLine:SetTop( _1080p * -0.5, 0 )
	RightCross.rightLine:SetBottom( _1080p * 0.5, 0 )
	RightCross.leftLine:SetRight( _1080p * 17, 0 )
	RightCross.leftLine:SetTop( _1080p * -0.5, 0 )
	RightCross.leftLine:SetBottom( _1080p * 0.5, 0 )
	RightCross.bottomLine:SetLeft( _1080p * -0.5, 0 )
	RightCross.bottomLine:SetRight( _1080p * 0.5, 0 )
	RightCross.bottomLine:SetTop( _1080p * -15, 0 )
	RightCross.topLine:SetLeft( _1080p * -0.5, 0 )
	RightCross.topLine:SetRight( _1080p * 0.5, 0 )
	RightCross.topLine:SetBottom( _1080p * 17, 0 )
	RightCross:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16 )
	self:addElement( RightCross )
	self.RightCross = RightCross
	
	return self
end

MenuBuilder.registerType( "AccentLocationGridOverlay", AccentLocationGridOverlay )
LockTable( _M )
