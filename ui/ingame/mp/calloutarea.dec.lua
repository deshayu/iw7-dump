local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CalloutArea( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 24 * _1080p )
	self.id = "CalloutArea"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.callout.calloutBackground, 0 )
	Background:SetAlpha( 0.15, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Label0 = nil
	
	Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:SetFontSize( 22 * _1080p )
	Label0:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Label0:SetAlignment( LUI.Alignment.Left )
	Label0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4, _1080p * 196, _1080p * 1, _1080p * 23 )
	Label0:SubscribeToModel( DataSources.inGame.MP.calloutAreaString:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.MP.calloutAreaString:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Label0:setText( f2_local0, 0 )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local BorderImage0 = nil
	
	BorderImage0 = LUI.UIImage.new()
	BorderImage0.id = "BorderImage0"
	BorderImage0:SetAlpha( 0.3, 0 )
	BorderImage0:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1, _1080p * -1, _1080p * -1, 0 )
	self:addElement( BorderImage0 )
	self.BorderImage0 = BorderImage0
	
	local BorderImage1 = nil
	
	BorderImage1 = LUI.UIImage.new()
	BorderImage1.id = "BorderImage1"
	BorderImage1:SetAlpha( 0.3, 0 )
	BorderImage1:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1, _1080p * -1, 0, _1080p * 1 )
	self:addElement( BorderImage1 )
	self.BorderImage1 = BorderImage1
	
	local BorderImage2 = nil
	
	BorderImage2 = LUI.UIImage.new()
	BorderImage2.id = "BorderImage2"
	BorderImage2:SetAlpha( 0.3, 0 )
	BorderImage2:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -1, 0, 0, 0 )
	self:addElement( BorderImage2 )
	self.BorderImage2 = BorderImage2
	
	local BorderImage3 = nil
	
	BorderImage3 = LUI.UIImage.new()
	BorderImage3.id = "BorderImage3"
	BorderImage3:SetAlpha( 0.3, 0 )
	BorderImage3:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 1, 0, 0, 0 )
	self:addElement( BorderImage3 )
	self.BorderImage3 = BorderImage3
	
	return self
end

MenuBuilder.registerType( "CalloutArea", CalloutArea )
LockTable( _M )
