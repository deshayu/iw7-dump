local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PhotoPackDLC1xml( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 300 * _1080p )
	self.id = "PhotoPackDLC1xml"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local saw = nil
	
	saw = LUI.UIImage.new()
	saw.id = "saw"
	saw:SetScale( -0.22, 0 )
	saw:setImage( RegisterMaterial( "zm_dlc1_inventory_saw" ), 0 )
	saw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -108.72, _1080p * 403.28, _1080p * -159.52, _1080p * 352.48 )
	self:addElement( saw )
	self.saw = saw
	
	local blood = nil
	
	blood = LUI.UIImage.new()
	blood.id = "blood"
	blood:setImage( RegisterMaterial( "zm_dlc1_inventory_saw_blood" ), 0 )
	blood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.22, _1080p * 403.28, _1080p * -69.07, _1080p * 334.93 )
	self:addElement( blood )
	self.blood = blood
	
	local fractalBacking = nil
	
	fractalBacking = LUI.UIImage.new()
	fractalBacking.id = "fractalBacking"
	fractalBacking:setImage( RegisterMaterial( "zm_dlc1_inventory_backing" ), 0 )
	fractalBacking:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -1, _1080p * -1, _1080p * -483.47, _1080p * -2.47 )
	self:addElement( fractalBacking )
	self.fractalBacking = fractalBacking
	
	local questBoatDLC1 = nil
	
	questBoatDLC1 = MenuBuilder.BuildRegisteredType( "questBoatDLC1", {
		controllerIndex = f1_local1
	} )
	questBoatDLC1.id = "questBoatDLC1"
	questBoatDLC1:SetZRotation( 7, 0 )
	questBoatDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 70.1, _1080p * 278.1, _1080p * 10.28, _1080p * 261.28 )
	self:addElement( questBoatDLC1 )
	self.questBoatDLC1 = questBoatDLC1
	
	local questHarpoonDLC1 = nil
	
	questHarpoonDLC1 = MenuBuilder.BuildRegisteredType( "questHarpoonDLC1", {
		controllerIndex = f1_local1
	} )
	questHarpoonDLC1.id = "questHarpoonDLC1"
	questHarpoonDLC1:SetZRotation( -3, 0 )
	questHarpoonDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 305.78, _1080p * 518.78, _1080p * 6.28, _1080p * 260.28 )
	self:addElement( questHarpoonDLC1 )
	self.questHarpoonDLC1 = questHarpoonDLC1
	
	local questPAPDLC1 = nil
	
	questPAPDLC1 = MenuBuilder.BuildRegisteredType( "questMemory1", {
		controllerIndex = f1_local1
	} )
	questPAPDLC1.id = "questPAPDLC1"
	questPAPDLC1:SetZRotation( 5, 0 )
	questPAPDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 537.45, _1080p * 746.45, _1080p * 3.78, _1080p * 258.78 )
	self:addElement( questPAPDLC1 )
	self.questPAPDLC1 = questPAPDLC1
	
	local questJayDLC1 = nil
	
	questJayDLC1 = MenuBuilder.BuildRegisteredType( "questMemory2", {
		controllerIndex = f1_local1
	} )
	questJayDLC1.id = "questJayDLC1"
	questJayDLC1:SetZRotation( -6, 0 )
	questJayDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 792.21, _1080p * 1001.21, _1080p * 5.78, _1080p * 260.78 )
	self:addElement( questJayDLC1 )
	self.questJayDLC1 = questJayDLC1
	
	local charmNecklace = nil
	
	charmNecklace = MenuBuilder.BuildRegisteredType( "charmNecklace", {
		controllerIndex = f1_local1
	} )
	charmNecklace.id = "charmNecklace"
	charmNecklace:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 919, _1080p * 1940, _1080p * -12.22, _1080p * 348.78 )
	self:addElement( charmNecklace )
	self.charmNecklace = charmNecklace
	
	local questMemory1Copy0 = nil
	
	questMemory1Copy0 = MenuBuilder.BuildRegisteredType( "questMemory1", {
		controllerIndex = f1_local1
	} )
	questMemory1Copy0.id = "questMemory1Copy0"
	questMemory1Copy0:SetZRotation( 5, 0 )
	questMemory1Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 537.45, _1080p * 746.45, _1080p * 3.78, _1080p * 258.78 )
	self:addElement( questMemory1Copy0 )
	self.questMemory1Copy0 = questMemory1Copy0
	
	return self
end

MenuBuilder.registerType( "PhotoPackDLC1xml", PhotoPackDLC1xml )
LockTable( _M )
