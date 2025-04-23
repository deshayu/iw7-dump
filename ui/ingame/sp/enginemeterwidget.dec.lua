local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EngineMeterWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 60 * _1080p )
	self.id = "EngineMeterWidget"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local bg = nil
	
	bg = LUI.UIImage.new()
	bg.id = "bg"
	bg:SetRGBFromTable( SWATCHES.HUD.inactive, 0 )
	bg:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -24, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:SetRGBFromTable( SWATCHES.HUD.caution, 0 )
	Image0:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 400, _1080p * -22, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Label0 = nil
	
	Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:setText( "Temperature", 0 )
	Label0:SetFontSize( 30 * _1080p )
	Label0:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label0:SetAlignment( LUI.Alignment.Center )
	Label0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 145, _1080p * -145, 0, _1080p * 30 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	return self
end

MenuBuilder.registerType( "EngineMeterWidget", EngineMeterWidget )
LockTable( _M )
