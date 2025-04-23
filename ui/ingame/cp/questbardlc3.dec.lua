local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questBarDLC3( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "questBarDLC3"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self.soundSet = "quests"
	local f1_local2 = self
	local blackStrip = nil
	
	blackStrip = LUI.UIImage.new()
	blackStrip.id = "blackStrip"
	blackStrip:SetRGBFromInt( 2236192, 0 )
	blackStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 1060, _1080p * 1188 )
	self:addElement( blackStrip )
	self.blackStrip = blackStrip
	
	local InventoryBar = nil
	
	InventoryBar = LUI.UIImage.new()
	InventoryBar.id = "InventoryBar"
	InventoryBar:setImage( RegisterMaterial( "cp_town_inventory_bar" ), 0 )
	InventoryBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -64, _1080p * 1984, _1080p * 568, _1080p * 1080 )
	self:addElement( InventoryBar )
	self.InventoryBar = InventoryBar
	
	local questPhase1 = nil
	
	questPhase1 = MenuBuilder.BuildRegisteredType( "questPhase1", {
		controllerIndex = f1_local1
	} )
	questPhase1.id = "questPhase1"
	questPhase1.InventoryBar:SetAlpha( 0, 0 )
	questPhase1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1, _1080p * 1919, _1080p * 750, _1080p * 1065 )
	self:addElement( questPhase1 )
	self.questPhase1 = questPhase1
	
	local questPhase2 = nil
	
	questPhase2 = MenuBuilder.BuildRegisteredType( "questPhase2", {
		controllerIndex = f1_local1
	} )
	questPhase2.id = "questPhase2"
	questPhase2.InventoryBar:SetAlpha( 0, 0 )
	questPhase2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1, _1080p * 1919, _1080p * 750, _1080p * 1065 )
	self:addElement( questPhase2 )
	self.questPhase2 = questPhase2
	
	local questPhase3 = nil
	
	questPhase3 = MenuBuilder.BuildRegisteredType( "questPhase3", {
		controllerIndex = f1_local1
	} )
	questPhase3.id = "questPhase3"
	questPhase3.InventoryBar:SetAlpha( 0, 0 )
	questPhase3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1, _1080p * 1919, _1080p * 750, _1080p * 1065 )
	self:addElement( questPhase3 )
	self.questPhase3 = questPhase3
	
	return self
end

MenuBuilder.registerType( "questBarDLC3", questBarDLC3 )
LockTable( _M )
