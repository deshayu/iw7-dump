local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalEnemyLockonShip( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 62 * _1080p, 0, 62 * _1080p )
	self.id = "JackalEnemyLockonShip"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local shipY = nil
	
	shipY = LUI.UIImage.new()
	shipY.id = "shipY"
	shipY:SetRGBFromInt( 8816262, 0 )
	shipY:SetDepth( 3, 0 )
	shipY:setImage( RegisterMaterial( "hud_jackal_enemy_lock_y" ), 0 )
	shipY:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, _1080p * -11, _1080p * 11, _1080p * -11 )
	self:addElement( shipY )
	self.shipY = shipY
	
	local ShipRIn = nil
	
	ShipRIn = LUI.UIImage.new()
	ShipRIn.id = "ShipRIn"
	ShipRIn:SetRGBFromInt( 8947848, 0 )
	ShipRIn:SetYRotation( -71.5, 0 )
	ShipRIn:SetZRotation( 90, 0 )
	ShipRIn:SetDepth( 30, 0 )
	ShipRIn:setImage( RegisterMaterial( "hud_jackal_enemy_lock_z" ), 0 )
	ShipRIn:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 21, _1080p * -1, _1080p * -0.33, _1080p * 0.33 )
	self:addElement( ShipRIn )
	self.ShipRIn = ShipRIn
	
	local ShipBIn = nil
	
	ShipBIn = LUI.UIImage.new()
	ShipBIn.id = "ShipBIn"
	ShipBIn:SetRGBFromInt( 15263976, 0 )
	ShipBIn:SetXRotation( -71.5, 0 )
	ShipBIn:SetDepth( 30, 0 )
	ShipBIn:setImage( RegisterMaterial( "hud_jackal_enemy_lock_z" ), 0 )
	ShipBIn:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, _1080p * -11, _1080p * 9.67, _1080p * 10.33 )
	self:addElement( ShipBIn )
	self.ShipBIn = ShipBIn
	
	local shipLIn = nil
	
	shipLIn = LUI.UIImage.new()
	shipLIn.id = "shipLIn"
	shipLIn:SetRGBFromInt( 12829635, 0 )
	shipLIn:SetYRotation( 71.5, 0 )
	shipLIn:SetZRotation( -90, 0 )
	shipLIn:SetDepth( 30, 0 )
	shipLIn:setImage( RegisterMaterial( "hud_jackal_enemy_lock_z" ), 0 )
	shipLIn:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -21, _1080p * -0.33, _1080p * 0.33 )
	self:addElement( shipLIn )
	self.shipLIn = shipLIn
	
	local ShipTin = nil
	
	ShipTin = LUI.UIImage.new()
	ShipTin.id = "ShipTin"
	ShipTin:SetRGBFromInt( 4868682, 0 )
	ShipTin:SetXRotation( 71.5, 0 )
	ShipTin:SetZRotation( 180, 0 )
	ShipTin:SetDepth( 30, 0 )
	ShipTin:setImage( RegisterMaterial( "hud_jackal_enemy_lock_z" ), 0 )
	ShipTin:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, _1080p * -11, _1080p * -10.33, _1080p * -9.67 )
	self:addElement( ShipTin )
	self.ShipTin = ShipTin
	
	local shipROut = nil
	
	shipROut = LUI.UIImage.new()
	shipROut.id = "shipROut"
	shipROut:SetRGBFromInt( 12829635, 0 )
	shipROut:SetYRotation( -71.5, 0 )
	shipROut:SetZRotation( 90, 0 )
	shipROut:SetDepth( 30, 0 )
	shipROut:setImage( RegisterMaterial( "hud_jackal_enemy_lock_z_outer" ), 0 )
	shipROut:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 21, _1080p * -1, _1080p * -0.33, _1080p * 0.33 )
	self:addElement( shipROut )
	self.shipROut = shipROut
	
	local ShipBOut = nil
	
	ShipBOut = LUI.UIImage.new()
	ShipBOut.id = "ShipBOut"
	ShipBOut:SetRGBFromInt( 4868682, 0 )
	ShipBOut:SetXRotation( -71.5, 0 )
	ShipBOut:SetDepth( 30, 0 )
	ShipBOut:setImage( RegisterMaterial( "hud_jackal_enemy_lock_z_outer" ), 0 )
	ShipBOut:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, _1080p * -11, _1080p * 9.67, _1080p * 10.33 )
	self:addElement( ShipBOut )
	self.ShipBOut = ShipBOut
	
	local ShipLOut = nil
	
	ShipLOut = LUI.UIImage.new()
	ShipLOut.id = "ShipLOut"
	ShipLOut:SetRGBFromInt( 8947848, 0 )
	ShipLOut:SetYRotation( 71.5, 0 )
	ShipLOut:SetZRotation( -90, 0 )
	ShipLOut:SetDepth( 30, 0 )
	ShipLOut:setImage( RegisterMaterial( "hud_jackal_enemy_lock_z_outer" ), 0 )
	ShipLOut:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -21, _1080p * -0.33, _1080p * 0.33 )
	self:addElement( ShipLOut )
	self.ShipLOut = ShipLOut
	
	local ShipTOut = nil
	
	ShipTOut = LUI.UIImage.new()
	ShipTOut.id = "ShipTOut"
	ShipTOut:SetRGBFromInt( 14342874, 0 )
	ShipTOut:SetXRotation( 71.5, 0 )
	ShipTOut:SetZRotation( 180, 0 )
	ShipTOut:SetDepth( 30, 0 )
	ShipTOut:setImage( RegisterMaterial( "hud_jackal_enemy_lock_z_outer" ), 0 )
	ShipTOut:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 11, _1080p * -11, _1080p * -10.33, _1080p * -9.67 )
	self:addElement( ShipTOut )
	self.ShipTOut = ShipTOut
	
	return self
end

MenuBuilder.registerType( "JackalEnemyLockonShip", JackalEnemyLockonShip )
LockTable( _M )
