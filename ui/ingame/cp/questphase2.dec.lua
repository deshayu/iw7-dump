local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questPhase2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 315 * _1080p )
	self.id = "questPhase2"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local InventoryBar = nil
	
	InventoryBar = LUI.UIImage.new()
	InventoryBar.id = "InventoryBar"
	InventoryBar:setImage( RegisterMaterial( "cp_town_inventory_bar" ), 0 )
	InventoryBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -63, _1080p * 1985, _1080p * -182.68, _1080p * 329.32 )
	self:addElement( InventoryBar )
	self.InventoryBar = InventoryBar
	
	local finalBacking = nil
	
	finalBacking = LUI.UIImage.new()
	finalBacking.id = "finalBacking"
	finalBacking:setImage( RegisterMaterial( "cp_town_inv_chem_final_bkg" ), 0 )
	finalBacking:SetUseAA( true )
	finalBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 625.46, _1080p * 1137.46, _1080p * -89.93, _1080p * 422.07 )
	finalBacking:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.papQuestCompleteAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( finalBacking )
	self.finalBacking = finalBacking
	
	local monitor = nil
	
	monitor = LUI.UIImage.new()
	monitor.id = "monitor"
	monitor:SetZRotation( -52, 0 )
	monitor:setImage( RegisterMaterial( "cp_town_inv_chem_p3_monitor" ), 0 )
	monitor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 842.53, _1080p * 970.53, _1080p * 214.88, _1080p * 278.88 )
	monitor:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( monitor )
	self.monitor = monitor
	
	local pipes = nil
	
	pipes = LUI.UIImage.new()
	pipes.id = "pipes"
	pipes:SetZRotation( 53, 0 )
	pipes:setImage( RegisterMaterial( "cp_town_inv_chem_p1_valves" ), 0 )
	pipes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 667, _1080p * 923, _1080p * 46, _1080p * 302 )
	pipes:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetModel( f1_local1 ) )
	self:addElement( pipes )
	self.pipes = pipes
	
	local gauges = nil
	
	gauges = LUI.UIImage.new()
	gauges.id = "gauges"
	gauges:SetZRotation( -46, 0 )
	gauges:setImage( RegisterMaterial( "cp_town_inv_chem_p2_gauges" ), 0 )
	gauges:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 842.53, _1080p * 1098.53, _1080p * 125.5, _1080p * 189.5 )
	gauges:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( gauges )
	self.gauges = gauges
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		pipes:RegisterAnimationSequence( "pipesFound", {
			{
				function ()
					return self.pipes:SetScale( 0, 0 )
				end,
				function ()
					return self.pipes:SetScale( 0.5, 250 )
				end,
				function ()
					return self.pipes:SetScale( 0, 250 )
				end,
				function ()
					return self.pipes:SetScale( 0.25, 250 )
				end,
				function ()
					return self.pipes:SetScale( 0, 250 )
				end,
				function ()
					return self.pipes:SetScale( 0.13, 250 )
				end,
				function ()
					return self.pipes:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.pipesFound = function ()
			pipes:AnimateSequence( "pipesFound" )
		end
		
		gauges:RegisterAnimationSequence( "gaugesFound", {
			{
				function ()
					return self.gauges:SetScale( 0, 0 )
				end,
				function ()
					return self.gauges:SetScale( 0.5, 250 )
				end,
				function ()
					return self.gauges:SetScale( 0, 250 )
				end,
				function ()
					return self.gauges:SetScale( 0.25, 250 )
				end,
				function ()
					return self.gauges:SetScale( 0, 250 )
				end,
				function ()
					return self.gauges:SetScale( 0.13, 250 )
				end,
				function ()
					return self.gauges:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.gaugesFound = function ()
			gauges:AnimateSequence( "gaugesFound" )
		end
		
		monitor:RegisterAnimationSequence( "monitorFound", {
			{
				function ()
					return self.monitor:SetScale( 0, 0 )
				end,
				function ()
					return self.monitor:SetScale( 0.5, 250 )
				end,
				function ()
					return self.monitor:SetScale( 0, 250 )
				end,
				function ()
					return self.monitor:SetScale( 0.25, 250 )
				end,
				function ()
					return self.monitor:SetScale( 0, 250 )
				end,
				function ()
					return self.monitor:SetScale( 0.13, 250 )
				end,
				function ()
					return self.monitor:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.monitorFound = function ()
			monitor:AnimateSequence( "monitorFound" )
		end
		
		finalBacking:RegisterAnimationSequence( "machineBuilt", {
			{
				function ()
					return self.finalBacking:SetScale( 0, 0 )
				end,
				function ()
					return self.finalBacking:SetScale( 0.5, 250 )
				end,
				function ()
					return self.finalBacking:SetScale( 0, 250 )
				end,
				function ()
					return self.finalBacking:SetScale( 0.25, 250 )
				end,
				function ()
					return self.finalBacking:SetScale( 0, 250 )
				end,
				function ()
					return self.finalBacking:SetScale( 0.12, 250 )
				end,
				function ()
					return self.finalBacking:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.machineBuilt = function ()
			finalBacking:AnimateSequence( "machineBuilt" )
		end
		
		pipes:RegisterAnimationSequence( "pipesPlaced", {
			{
				function ()
					return self.pipes:SetScale( 0, 0 )
				end,
				function ()
					return self.pipes:SetScale( 0.5, 250 )
				end,
				function ()
					return self.pipes:SetScale( 0, 250 )
				end,
				function ()
					return self.pipes:SetScale( 0.25, 250 )
				end,
				function ()
					return self.pipes:SetScale( 0, 250 )
				end,
				function ()
					return self.pipes:SetScale( 0.13, 250 )
				end,
				function ()
					return self.pipes:SetScale( 0, 250 )
				end
			},
			{
				function ()
					return self.pipes:SetZRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.pipes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 684, _1080p * 940, _1080p * 99.9, _1080p * 355.9, 0 )
				end
			}
		} )
		self._sequences.pipesPlaced = function ()
			pipes:AnimateSequence( "pipesPlaced" )
		end
		
		gauges:RegisterAnimationSequence( "gaguesPlaced", {
			{
				function ()
					return self.gauges:SetScale( 0, 0 )
				end,
				function ()
					return self.gauges:SetScale( 0.5, 250 )
				end,
				function ()
					return self.gauges:SetScale( 0, 250 )
				end,
				function ()
					return self.gauges:SetScale( 0.25, 250 )
				end,
				function ()
					return self.gauges:SetScale( 0, 250 )
				end,
				function ()
					return self.gauges:SetScale( 0.13, 250 )
				end,
				function ()
					return self.gauges:SetScale( 0, 250 )
				end
			},
			{
				function ()
					return self.gauges:SetZRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.gauges:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 711, _1080p * 967, _1080p * 144.88, _1080p * 208.88, 0 )
				end
			}
		} )
		self._sequences.gaguesPlaced = function ()
			gauges:AnimateSequence( "gaguesPlaced" )
		end
		
		monitor:RegisterAnimationSequence( "monitorPlaced", {
			{
				function ()
					return self.monitor:SetScale( 0, 0 )
				end,
				function ()
					return self.monitor:SetScale( 0.5, 250 )
				end,
				function ()
					return self.monitor:SetScale( 0, 250 )
				end,
				function ()
					return self.monitor:SetScale( 0.25, 250 )
				end,
				function ()
					return self.monitor:SetScale( 0, 250 )
				end,
				function ()
					return self.monitor:SetScale( 0.13, 250 )
				end,
				function ()
					return self.monitor:SetScale( 0, 250 )
				end
			},
			{
				function ()
					return self.monitor:SetZRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.monitor:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 869.53, _1080p * 997.53, _1080p * 125.5, _1080p * 189.5, 0 )
				end
			}
		} )
		self._sequences.monitorPlaced = function ()
			monitor:AnimateSequence( "monitorPlaced" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pipesFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "gaugesFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "monitorFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.papQuestCompleteAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.papQuestCompleteAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.papQuestCompleteAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "machineBuilt" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.chemBeakerPlacedAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.chemBeakerPlacedAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.chemBeakerPlacedAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pipesPlaced" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.chemBurnerPlacedAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.chemBurnerPlacedAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.chemBurnerPlacedAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "gaguesPlaced" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.chemClampPlacedAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.chemClampPlacedAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.chemClampPlacedAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "monitorPlaced" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questPhase2", questPhase2 )
LockTable( _M )
