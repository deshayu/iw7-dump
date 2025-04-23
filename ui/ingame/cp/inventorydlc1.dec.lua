local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function InventoryDLC1( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "InventoryDLC1"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self:playSound( "menu_open" )
	local f1_local2 = self
	local challengeBadgeInventory = nil
	
	challengeBadgeInventory = MenuBuilder.BuildRegisteredType( "challengeBadgeInventory", {
		controllerIndex = f1_local1
	} )
	challengeBadgeInventory.id = "challengeBadgeInventory"
	challengeBadgeInventory:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -901, _1080p * -25, _1080p * -148, _1080p * 804 )
	self:addElement( challengeBadgeInventory )
	self.challengeBadgeInventory = challengeBadgeInventory
	
	local fateBloodBacking = nil
	
	fateBloodBacking = MenuBuilder.BuildRegisteredType( "fateBloodBacking", {
		controllerIndex = f1_local1
	} )
	fateBloodBacking.id = "fateBloodBacking"
	fateBloodBacking:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -687, _1080p * -96, _1080p * 52, _1080p * 154 )
	self:addElement( fateBloodBacking )
	self.fateBloodBacking = fateBloodBacking
	
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
	fateInventory5CardWidget:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -687, _1080p * -96, _1080p * 54, _1080p * 156 )
	self:addElement( fateInventory5CardWidget )
	self.fateInventory5CardWidget = fateInventory5CardWidget
	
	local PhotoPackDLC1 = nil
	
	PhotoPackDLC1 = MenuBuilder.BuildRegisteredType( "PhotoPackDLC1xml", {
		controllerIndex = f1_local1
	} )
	PhotoPackDLC1.id = "PhotoPackDLC1"
	PhotoPackDLC1:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -300, 0 )
	self:addElement( PhotoPackDLC1 )
	self.PhotoPackDLC1 = PhotoPackDLC1
	
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
		
		challengeBadgeInventory:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.challengeBadgeInventory:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.challengeBadgeInventory:SetZRotation( -41, 0 )
				end
			},
			{
				function ()
					return self.challengeBadgeInventory:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -759, _1080p * 117, _1080p * -581, _1080p * 371, 0 )
				end
			}
		} )
		ZomScoreboardDLC11:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.ZomScoreboardDLC11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 94.5, _1080p * 1161.5, _1080p * 62, _1080p * 454, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			challengeBadgeInventory:AnimateSequence( "Splitscreen" )
			ZomScoreboardDLC11:AnimateSequence( "Splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "InventoryDLC1", InventoryDLC1 )
LockTable( _M )
