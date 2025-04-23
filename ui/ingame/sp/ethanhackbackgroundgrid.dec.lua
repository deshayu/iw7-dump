local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EthanHackBackgroundGrid( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "EthanHackBackgroundGrid"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BG1 = nil
	
	BG1 = LUI.UIImage.new()
	BG1.id = "BG1"
	BG1:setImage( RegisterMaterial( "hud_ethan_bg_grid" ), 0 )
	BG1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 512, _1080p * -512, 0 )
	self:addElement( BG1 )
	self.BG1 = BG1
	
	local BG2 = nil
	
	BG2 = LUI.UIImage.new()
	BG2.id = "BG2"
	BG2:setImage( RegisterMaterial( "hud_ethan_bg_grid" ), 0 )
	BG2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 512, _1080p * 1024, _1080p * -512, 0 )
	self:addElement( BG2 )
	self.BG2 = BG2
	
	local BG3 = nil
	
	BG3 = LUI.UIImage.new()
	BG3.id = "BG3"
	BG3:setImage( RegisterMaterial( "hud_ethan_bg_grid" ), 0 )
	BG3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 512, 0, _1080p * 512 )
	self:addElement( BG3 )
	self.BG3 = BG3
	
	local BG4 = nil
	
	BG4 = LUI.UIImage.new()
	BG4.id = "BG4"
	BG4:setImage( RegisterMaterial( "hud_ethan_bg_grid" ), 0 )
	BG4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 512, _1080p * 1024, 0, _1080p * 512 )
	self:addElement( BG4 )
	self.BG4 = BG4
	
	local BG5 = nil
	
	BG5 = LUI.UIImage.new()
	BG5.id = "BG5"
	BG5:setImage( RegisterMaterial( "hud_ethan_bg_grid" ), 0 )
	BG5:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, 0, _1080p * -512, 0 )
	self:addElement( BG5 )
	self.BG5 = BG5
	
	local BG6 = nil
	
	BG6 = LUI.UIImage.new()
	BG6.id = "BG6"
	BG6:setImage( RegisterMaterial( "hud_ethan_bg_grid" ), 0 )
	BG6:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1024, _1080p * -512, _1080p * -512, 0 )
	self:addElement( BG6 )
	self.BG6 = BG6
	
	local BG7 = nil
	
	BG7 = LUI.UIImage.new()
	BG7.id = "BG7"
	BG7:setImage( RegisterMaterial( "hud_ethan_bg_grid" ), 0 )
	BG7:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, 0, 0, _1080p * 512 )
	self:addElement( BG7 )
	self.BG7 = BG7
	
	local BG8 = nil
	
	BG8 = LUI.UIImage.new()
	BG8.id = "BG8"
	BG8:setImage( RegisterMaterial( "hud_ethan_bg_grid" ), 0 )
	BG8:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1024, _1080p * -512, 0, _1080p * 512 )
	self:addElement( BG8 )
	self.BG8 = BG8
	
	return self
end

MenuBuilder.registerType( "EthanHackBackgroundGrid", EthanHackBackgroundGrid )
LockTable( _M )
