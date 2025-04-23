local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function fateBloodBacking( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 591 * _1080p, 0, 102 * _1080p )
	self.id = "fateBloodBacking"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Blood5 = nil
	
	Blood5 = LUI.UIImage.new()
	Blood5.id = "Blood5"
	Blood5:SetZRotation( 45, 0 )
	Blood5:setImage( RegisterMaterial( "zm_dlc1_inventory_small_blood" ), 0 )
	Blood5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 413, _1080p * 669, _1080p * -73, _1080p * 183 )
	self:addElement( Blood5 )
	self.Blood5 = Blood5
	
	local Blood4 = nil
	
	Blood4 = LUI.UIImage.new()
	Blood4.id = "Blood4"
	Blood4:SetZRotation( 120, 0 )
	Blood4:setImage( RegisterMaterial( "zm_dlc1_inventory_small_blood" ), 0 )
	Blood4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 288, _1080p * 544, _1080p * -75, _1080p * 181 )
	self:addElement( Blood4 )
	self.Blood4 = Blood4
	
	local Blood3 = nil
	
	Blood3 = LUI.UIImage.new()
	Blood3.id = "Blood3"
	Blood3:SetZRotation( 180, 0 )
	Blood3:setImage( RegisterMaterial( "zm_dlc1_inventory_small_blood" ), 0 )
	Blood3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 164, _1080p * 420, _1080p * -76, _1080p * 180 )
	self:addElement( Blood3 )
	self.Blood3 = Blood3
	
	local Blood2 = nil
	
	Blood2 = LUI.UIImage.new()
	Blood2.id = "Blood2"
	Blood2:SetZRotation( 20, 0 )
	Blood2:setImage( RegisterMaterial( "zm_dlc1_inventory_small_blood" ), 0 )
	Blood2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45, _1080p * 301, _1080p * -73, _1080p * 183 )
	self:addElement( Blood2 )
	self.Blood2 = Blood2
	
	local Blood1 = nil
	
	Blood1 = LUI.UIImage.new()
	Blood1.id = "Blood1"
	Blood1:setImage( RegisterMaterial( "zm_dlc1_inventory_small_blood" ), 0 )
	Blood1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -78, _1080p * 178, _1080p * -70, _1080p * 186 )
	self:addElement( Blood1 )
	self.Blood1 = Blood1
	
	return self
end

MenuBuilder.registerType( "fateBloodBacking", fateBloodBacking )
LockTable( _M )
