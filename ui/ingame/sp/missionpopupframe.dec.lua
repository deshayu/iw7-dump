local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissionPopupFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p )
	self.id = "MissionPopupFrame"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.8, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -6, _1080p * 6 )
	self:addElement( Background )
	self.Background = Background
	
	local PipTopLeft = nil
	
	PipTopLeft = LUI.UIImage.new()
	PipTopLeft.id = "PipTopLeft"
	PipTopLeft:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 12, _1080p * -6, _1080p * -4 )
	self:addElement( PipTopLeft )
	self.PipTopLeft = PipTopLeft
	
	local PipTopRight = nil
	
	PipTopRight = LUI.UIImage.new()
	PipTopRight.id = "PipTopRight"
	PipTopRight:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * -12, _1080p * -6, _1080p * -4 )
	self:addElement( PipTopRight )
	self.PipTopRight = PipTopRight
	
	local PipBottomRight = nil
	
	PipBottomRight = LUI.UIImage.new()
	PipBottomRight.id = "PipBottomRight"
	PipBottomRight:SetAnchorsAndPosition( 1, 0, 1, 0, 0, _1080p * -12, _1080p * 4, _1080p * 6 )
	self:addElement( PipBottomRight )
	self.PipBottomRight = PipBottomRight
	
	local PipBottomLeft = nil
	
	PipBottomLeft = LUI.UIImage.new()
	PipBottomLeft.id = "PipBottomLeft"
	PipBottomLeft:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 12, _1080p * 4, _1080p * 6 )
	self:addElement( PipBottomLeft )
	self.PipBottomLeft = PipBottomLeft
	
	return self
end

MenuBuilder.registerType( "MissionPopupFrame", MissionPopupFrame )
LockTable( _M )
