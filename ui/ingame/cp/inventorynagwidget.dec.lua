local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function inventoryNagWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 538 * _1080p, 0, 52 * _1080p )
	self.id = "inventoryNagWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local InventoryNag = nil
	
	InventoryNag = LUI.UIText.new()
	InventoryNag.id = "InventoryNag"
	InventoryNag:setText( Engine.Localize( "ZOMBIE_POWERUPS_INVENTORY_NAG" ), 0 )
	InventoryNag:SetFontSize( 30 * _1080p )
	InventoryNag:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	InventoryNag:SetAlignment( LUI.Alignment.Center )
	InventoryNag:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -535.5, _1080p * 5.5, _1080p * 4, _1080p * 36 )
	self:addElement( InventoryNag )
	self.InventoryNag = InventoryNag
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		InventoryNag:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.InventoryNag:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			InventoryNag:AnimateSequence( "Hidden" )
		end
		
		InventoryNag:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.InventoryNag:SetAlpha( 0, 0 )
				end,
				function ()
					return self.InventoryNag:SetAlpha( 1, 260 )
				end,
				function ()
					return self.InventoryNag:SetAlpha( 1, 2490 )
				end,
				function ()
					return self.InventoryNag:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.InventoryNag:SetScale( 0, 0 )
				end,
				function ()
					return self.InventoryNag:SetScale( 0, 260 )
				end,
				function ()
					return self.InventoryNag:SetScale( 0.5, 340 )
				end,
				function ()
					return self.InventoryNag:SetScale( 0, 410 )
				end,
				function ()
					return self.InventoryNag:SetScale( 0.5, 420 )
				end,
				function ()
					return self.InventoryNag:SetScale( 0, 410 )
				end,
				function ()
					return self.InventoryNag:SetScale( 0.5, 430 )
				end,
				function ()
					return self.InventoryNag:SetScale( 0, 480 )
				end
			}
		} )
		self._sequences.Visible = function ()
			InventoryNag:AnimateSequence( "Visible" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.inventoryNagAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.inventoryNagAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.inventoryNagAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Visible" )
		end
	end )
	ACTIONS.AnimateSequence( self, "Hidden" )
	return self
end

MenuBuilder.registerType( "inventoryNagWidget", inventoryNagWidget )
LockTable( _M )
