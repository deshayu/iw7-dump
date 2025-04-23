local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function InventoryDLC2( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "InventoryDLC2"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self:playSound( "menu_open" )
	local f1_local2 = self
	local fateAsianBacking = nil
	
	fateAsianBacking = MenuBuilder.BuildRegisteredType( "fateAsianBacking", {
		controllerIndex = f1_local1
	} )
	fateAsianBacking.id = "fateAsianBacking"
	fateAsianBacking:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -686, _1080p * -95, _1080p * 67, _1080p * 169 )
	self:addElement( fateAsianBacking )
	self.fateAsianBacking = fateAsianBacking
	
	local fateInventory5CardWidget = nil
	
	fateInventory5CardWidget = MenuBuilder.BuildRegisteredType( "fateInventory5CardWidget", {
		controllerIndex = f1_local1
	} )
	fateInventory5CardWidget.id = "fateInventory5CardWidget"
	fateInventory5CardWidget.FateCard5.cardBacking:SetAlpha( 0, 0 )
	fateInventory5CardWidget.FateCard4.cardBacking:SetAlpha( 0, 0 )
	fateInventory5CardWidget.FateCard3.cardBacking:SetAlpha( 0, 0 )
	fateInventory5CardWidget.FateCard2.cardBacking:SetAlpha( 0, 0 )
	fateInventory5CardWidget.FateCard1.cardBacking:SetAlpha( 0, 0 )
	fateInventory5CardWidget:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -687, _1080p * -96, _1080p * 67, _1080p * 169 )
	self:addElement( fateInventory5CardWidget )
	self.fateInventory5CardWidget = fateInventory5CardWidget
	
	local inventoryBottomDLC2 = nil
	
	inventoryBottomDLC2 = MenuBuilder.BuildRegisteredType( "inventoryBottomDLC2", {
		controllerIndex = f1_local1
	} )
	inventoryBottomDLC2.id = "inventoryBottomDLC2"
	inventoryBottomDLC2:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -469.04, _1080p * 10.96 )
	self:addElement( inventoryBottomDLC2 )
	self.inventoryBottomDLC2 = inventoryBottomDLC2
	
	local ZomScoreboardDLC11 = nil
	
	ZomScoreboardDLC11 = MenuBuilder.BuildRegisteredType( "ZomScoreboardDLC1", {
		controllerIndex = f1_local1
	} )
	ZomScoreboardDLC11.id = "ZomScoreboardDLC11"
	ZomScoreboardDLC11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 94.5, _1080p * 1161.5, _1080p * 53, _1080p * 445 )
	self:addElement( ZomScoreboardDLC11 )
	self.ZomScoreboardDLC11 = ZomScoreboardDLC11
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ZomScoreboardDLC11:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.ZomScoreboardDLC11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 94.5, _1080p * 1161.5, _1080p * 62, _1080p * 454, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			ZomScoreboardDLC11:AnimateSequence( "Splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "InventoryDLC2", InventoryDLC2 )
LockTable( _M )
