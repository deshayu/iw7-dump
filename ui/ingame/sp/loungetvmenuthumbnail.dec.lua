local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LoungeTVMenuThumbnail( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 330 * _1080p, 0, 200 * _1080p )
	self.id = "LoungeTVMenuThumbnail"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:setUseStencil( true )
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetRGBFromTable( SWATCHES.loungeTV.tint, 0 )
	Frame:setImage( RegisterMaterial( "hud_lounge_frame" ), 0 )
	Frame:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 330, 0, _1080p * 200 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:setImage( RegisterMaterial( "hud_jackal_static" ), 0 )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 315, _1080p * 30, _1080p * 188 )
	self:addElement( Image )
	self.Image = Image
	
	local TextBR = nil
	
	TextBR = LUI.UIText.new()
	TextBR.id = "TextBR"
	TextBR:setText( ToUpperCase( "TITLE" ), 0 )
	TextBR:SetFontSize( 30 * _1080p )
	TextBR:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TextBR:SetAlignment( LUI.Alignment.Left )
	TextBR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28, _1080p * 302, 0, _1080p * 30 )
	self:addElement( TextBR )
	self.TextBR = TextBR
	
	return self
end

MenuBuilder.registerType( "LoungeTVMenuThumbnail", LoungeTVMenuThumbnail )
LockTable( _M )
