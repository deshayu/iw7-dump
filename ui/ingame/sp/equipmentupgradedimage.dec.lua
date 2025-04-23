local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EquipmentUpgradedImage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 210 * _1080p, 0, 110 * _1080p )
	self.id = "EquipmentUpgradedImage"
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
	Background:SetAlpha( 0.1, 0 )
	Background:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Background:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( Background )
	self.Background = Background
	
	local NodeBottomRight = nil
	
	NodeBottomRight = LUI.UIImage.new()
	NodeBottomRight.id = "NodeBottomRight"
	NodeBottomRight:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	NodeBottomRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	NodeBottomRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -10, 0, _1080p * 2, _1080p * 4 )
	self:addElement( NodeBottomRight )
	self.NodeBottomRight = NodeBottomRight
	
	local NodeBottomLeft = nil
	
	NodeBottomLeft = LUI.UIImage.new()
	NodeBottomLeft.id = "NodeBottomLeft"
	NodeBottomLeft:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	NodeBottomLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	NodeBottomLeft:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 10, _1080p * 2, _1080p * 4 )
	self:addElement( NodeBottomLeft )
	self.NodeBottomLeft = NodeBottomLeft
	
	local NodeTopRight = nil
	
	NodeTopRight = LUI.UIImage.new()
	NodeTopRight.id = "NodeTopRight"
	NodeTopRight:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	NodeTopRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	NodeTopRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -10, 0, _1080p * -4, _1080p * -2 )
	self:addElement( NodeTopRight )
	self.NodeTopRight = NodeTopRight
	
	local NodeTopLeft = nil
	
	NodeTopLeft = LUI.UIImage.new()
	NodeTopLeft.id = "NodeTopLeft"
	NodeTopLeft:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	NodeTopLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	NodeTopLeft:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 10, _1080p * -4, _1080p * -2 )
	self:addElement( NodeTopLeft )
	self.NodeTopLeft = NodeTopLeft
	
	local EquipImage = nil
	
	EquipImage = LUI.UIImage.new()
	EquipImage.id = "EquipImage"
	EquipImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 39, _1080p * 171, _1080p * 5.24, _1080p * 104.76 )
	self:addElement( EquipImage )
	self.EquipImage = EquipImage
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetBorderThicknessLeft( _1080p * 0, 0 )
	Border:SetBorderThicknessRight( _1080p * 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	return self
end

MenuBuilder.registerType( "EquipmentUpgradedImage", EquipmentUpgradedImage )
LockTable( _M )
