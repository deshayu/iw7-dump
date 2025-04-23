local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function inventoryBottomDLC2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 481 * _1080p )
	self.id = "inventoryBottomDLC2"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local inventoryBacking = nil
	
	inventoryBacking = LUI.UIImage.new()
	inventoryBacking.id = "inventoryBacking"
	inventoryBacking:setImage( RegisterMaterial( "zm_dlc2_inventory_bar" ), 0 )
	inventoryBacking:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -424, _1080p * 56 )
	self:addElement( inventoryBacking )
	self.inventoryBacking = inventoryBacking
	
	local questBarDLC2 = nil
	
	questBarDLC2 = MenuBuilder.BuildRegisteredType( "questBarDLC2", {
		controllerIndex = f1_local1
	} )
	questBarDLC2.id = "questBarDLC2"
	questBarDLC2:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 0.1, _1080p * -958.9, _1080p * -280, _1080p * 20 )
	self:addElement( questBarDLC2 )
	self.questBarDLC2 = questBarDLC2
	
	local chiTree = nil
	
	chiTree = MenuBuilder.BuildRegisteredType( "chiTree", {
		controllerIndex = f1_local1
	} )
	chiTree.id = "chiTree"
	chiTree:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 979.1, 0, _1080p * -289.54, _1080p * -23 )
	self:addElement( chiTree )
	self.chiTree = chiTree
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		questBarDLC2:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.questBarDLC2:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 0.1, _1080p * -958.9, _1080p * -310, _1080p * -10, 0 )
				end
			}
		} )
		chiTree:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.chiTree:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1232.1, _1080p * 253, _1080p * -289.54, _1080p * -23, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			questBarDLC2:AnimateSequence( "Splitscreen" )
			chiTree:AnimateSequence( "Splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "inventoryBottomDLC2", inventoryBottomDLC2 )
LockTable( _M )
