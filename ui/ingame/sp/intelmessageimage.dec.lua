local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.IntelImage:SubscribeToModel( DataSources.inGame.SP.SPMessageImageIndex:GetModel( f1_arg1 ), function ()
		local f2_local0 = Engine.TableLookupByRow( CSV.IntelMessage.file, Game.GetOmnvar( "ui_sp_intel_messaging_image_index" ), CSV.IntelMessage.cols.image )
		f1_arg0.IntelImage:setImage( RegisterMaterial( f2_local0 ), 0 )
		DebugPrint( f2_local0 )
	end )
end

function IntelMessageImage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 210 * _1080p, 0, 110 * _1080p )
	self.id = "IntelMessageImage"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAlpha( 0.1, 0 )
	Background:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Background:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( Background )
	self.Background = Background
	
	local IntelImage = nil
	
	IntelImage = LUI.UIImage.new()
	IntelImage.id = "IntelImage"
	IntelImage:SetBlendMode( BLEND_MODE.replace )
	IntelImage:SubscribeToModel( DataSources.inGame.SP.intelImage:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.SP.intelImage:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			IntelImage:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( IntelImage )
	self.IntelImage = IntelImage
	
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
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "IntelMessageImage", IntelMessageImage )
LockTable( _M )
