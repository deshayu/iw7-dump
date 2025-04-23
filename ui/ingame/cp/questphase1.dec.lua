local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questPhase1( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 315 * _1080p )
	self.id = "questPhase1"
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
	
	local legRight = nil
	
	legRight = LUI.UIImage.new()
	legRight.id = "legRight"
	legRight:SetZRotation( -60, 0 )
	legRight:setImage( RegisterMaterial( "cp_town_inv_leg_r" ), 0 )
	legRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 397.6, _1080p * 461.6, _1080p * 202, _1080p * 266 )
	legRight:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetModel( f1_local1 ) )
	self:addElement( legRight )
	self.legRight = legRight
	
	local legLeft = nil
	
	legLeft = LUI.UIImage.new()
	legLeft.id = "legLeft"
	legLeft:SetZRotation( 65, 0 )
	legLeft:setImage( RegisterMaterial( "cp_town_inv_leg_l" ), 0 )
	legLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 415.6, _1080p * 543.6, _1080p * 84.5, _1080p * 212.5 )
	legLeft:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetModel( f1_local1 ) )
	self:addElement( legLeft )
	self.legLeft = legLeft
	
	local armLeft = nil
	
	armLeft = LUI.UIImage.new()
	armLeft.id = "armLeft"
	armLeft:SetZRotation( -157, 0 )
	armLeft:setImage( RegisterMaterial( "cp_town_inv_arm_l" ), 0 )
	armLeft:SetUseAA( true )
	armLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 508.6, _1080p * 636.6, _1080p * 80.49, _1080p * 336.49 )
	armLeft:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetModel( f1_local1 ) )
	self:addElement( armLeft )
	self.armLeft = armLeft
	
	local mirrorTopLeft = nil
	
	mirrorTopLeft = LUI.UIImage.new()
	mirrorTopLeft.id = "mirrorTopLeft"
	mirrorTopLeft:setImage( RegisterMaterial( "cp_town_inv_mirror_1" ), 0 )
	mirrorTopLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.6, _1080p * 369.6, _1080p * 100.5, _1080p * 228.5 )
	mirrorTopLeft:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ) )
	self:addElement( mirrorTopLeft )
	self.mirrorTopLeft = mirrorTopLeft
	
	local mirrorBottomLeft = nil
	
	mirrorBottomLeft = LUI.UIImage.new()
	mirrorBottomLeft.id = "mirrorBottomLeft"
	mirrorBottomLeft:setImage( RegisterMaterial( "cp_town_inv_mirror_2" ), 0 )
	mirrorBottomLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 281.6, _1080p * 409.6, _1080p * 208.49, _1080p * 336.49 )
	mirrorBottomLeft:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetModel( f1_local1 ) )
	self:addElement( mirrorBottomLeft )
	self.mirrorBottomLeft = mirrorBottomLeft
	
	local mirrorTopRight = nil
	
	mirrorTopRight = LUI.UIImage.new()
	mirrorTopRight.id = "mirrorTopRight"
	mirrorTopRight:setImage( RegisterMaterial( "cp_town_inv_mirror_3" ), 0 )
	mirrorTopRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 564.6, _1080p * 692.6, _1080p * 248, _1080p * 312 )
	mirrorTopRight:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetModel( f1_local1 ) )
	self:addElement( mirrorTopRight )
	self.mirrorTopRight = mirrorTopRight
	
	local punchCard = nil
	
	punchCard = LUI.UIImage.new()
	punchCard.id = "punchCard"
	punchCard:setImage( RegisterMaterial( "cp_town_inv_punchcard" ), 0 )
	punchCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 254.6, _1080p * 382.6, _1080p * 163.5, _1080p * 291.5 )
	punchCard:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( punchCard )
	self.punchCard = punchCard
	
	local key = nil
	
	key = LUI.UIImage.new()
	key.id = "key"
	key:setImage( RegisterMaterial( "cp_town_inv_key" ), 0 )
	key:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 564.6, _1080p * 692.6, _1080p * 112.49, _1080p * 240.49 )
	key:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.boatQuestCompleteAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( key )
	self.key = key
	
	local armRight = nil
	
	armRight = LUI.UIImage.new()
	armRight.id = "armRight"
	armRight:SetZRotation( 51, 0 )
	armRight:setImage( RegisterMaterial( "cp_town_inv_arm_r" ), 0 )
	armRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 300.6, _1080p * 428.6, _1080p * 63.5, _1080p * 319.5 )
	armRight:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetModel( f1_local1 ) )
	self:addElement( armRight )
	self.armRight = armRight
	
	local torso = nil
	
	torso = LUI.UIImage.new()
	torso.id = "torso"
	torso:SetZRotation( -39, 0 )
	torso:setImage( RegisterMaterial( "cp_town_inv_torso" ), 0 )
	torso:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 424.6, _1080p * 552.6, _1080p * 111, _1080p * 367 )
	torso:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questToothAlpha:GetModel( f1_local1 ) )
	self:addElement( torso )
	self.torso = torso
	
	local head = nil
	
	head = LUI.UIImage.new()
	head.id = "head"
	head:SetZRotation( 83, 0 )
	head:setImage( RegisterMaterial( "cp_town_inv_head" ), 0 )
	head:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 362.6, _1080p * 426.6, _1080p * 93.5, _1080p * 221.5 )
	head:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetModel( f1_local1 ) )
	self:addElement( head )
	self.head = head
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		head:RegisterAnimationSequence( "headFound", {
			{
				function ()
					return self.head:SetScale( 0.2, 0 )
				end,
				function ()
					return self.head:SetScale( 0.5, 250 )
				end,
				function ()
					return self.head:SetScale( 0, 250 )
				end,
				function ()
					return self.head:SetScale( 0.25, 250 )
				end,
				function ()
					return self.head:SetScale( 0, 250 )
				end,
				function ()
					return self.head:SetScale( 0.13, 250 )
				end,
				function ()
					return self.head:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.headFound = function ()
			head:AnimateSequence( "headFound" )
		end
		
		armLeft:RegisterAnimationSequence( "armLeftFound", {
			{
				function ()
					return self.armLeft:SetScale( 0, 0 )
				end,
				function ()
					return self.armLeft:SetScale( 0.5, 250 )
				end,
				function ()
					return self.armLeft:SetScale( 0, 250 )
				end,
				function ()
					return self.armLeft:SetScale( 0.25, 250 )
				end,
				function ()
					return self.armLeft:SetScale( 0, 250 )
				end,
				function ()
					return self.armLeft:SetScale( 0.13, 250 )
				end,
				function ()
					return self.armLeft:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.armLeftFound = function ()
			armLeft:AnimateSequence( "armLeftFound" )
		end
		
		armRight:RegisterAnimationSequence( "armRightFound", {
			{
				function ()
					return self.armRight:SetScale( 0, 0 )
				end,
				function ()
					return self.armRight:SetScale( 0.5, 250 )
				end,
				function ()
					return self.armRight:SetScale( 0, 250 )
				end,
				function ()
					return self.armRight:SetScale( 0.25, 250 )
				end,
				function ()
					return self.armRight:SetScale( 0, 250 )
				end,
				function ()
					return self.armRight:SetScale( 0.13, 250 )
				end,
				function ()
					return self.armRight:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.armRightFound = function ()
			armRight:AnimateSequence( "armRightFound" )
		end
		
		legLeft:RegisterAnimationSequence( "legLeftFound", {
			{
				function ()
					return self.legLeft:SetScale( 0, 0 )
				end,
				function ()
					return self.legLeft:SetScale( 0.5, 250 )
				end,
				function ()
					return self.legLeft:SetScale( 0, 250 )
				end,
				function ()
					return self.legLeft:SetScale( 0.25, 250 )
				end,
				function ()
					return self.legLeft:SetScale( 0, 250 )
				end,
				function ()
					return self.legLeft:SetScale( 0.13, 250 )
				end,
				function ()
					return self.legLeft:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.legLeftFound = function ()
			legLeft:AnimateSequence( "legLeftFound" )
		end
		
		legRight:RegisterAnimationSequence( "legRightFound", {
			{
				function ()
					return self.legRight:SetScale( 0, 0 )
				end,
				function ()
					return self.legRight:SetScale( 0.5, 250 )
				end,
				function ()
					return self.legRight:SetScale( 0, 250 )
				end,
				function ()
					return self.legRight:SetScale( 0.25, 240 )
				end,
				function ()
					return self.legRight:SetScale( 0, 260 )
				end,
				function ()
					return self.legRight:SetScale( 0.13, 250 )
				end,
				function ()
					return self.legRight:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.legRightFound = function ()
			legRight:AnimateSequence( "legRightFound" )
		end
		
		torso:RegisterAnimationSequence( "torsoFound", {
			{
				function ()
					return self.torso:SetScale( 0, 0 )
				end,
				function ()
					return self.torso:SetScale( 0.5, 250 )
				end,
				function ()
					return self.torso:SetScale( 0, 240 )
				end,
				function ()
					return self.torso:SetScale( 0.25, 260 )
				end,
				function ()
					return self.torso:SetScale( 0, 250 )
				end,
				function ()
					return self.torso:SetScale( 0.13, 250 )
				end,
				function ()
					return self.torso:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.torsoFound = function ()
			torso:AnimateSequence( "torsoFound" )
		end
		
		mirrorTopLeft:RegisterAnimationSequence( "topLeftMirrorFound", {
			{
				function ()
					return self.mirrorTopLeft:SetScale( 0, 0 )
				end,
				function ()
					return self.mirrorTopLeft:SetScale( 0.5, 250 )
				end,
				function ()
					return self.mirrorTopLeft:SetScale( 0, 250 )
				end,
				function ()
					return self.mirrorTopLeft:SetScale( 0.25, 250 )
				end,
				function ()
					return self.mirrorTopLeft:SetScale( 0, 250 )
				end,
				function ()
					return self.mirrorTopLeft:SetScale( 0.13, 250 )
				end,
				function ()
					return self.mirrorTopLeft:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.topLeftMirrorFound = function ()
			mirrorTopLeft:AnimateSequence( "topLeftMirrorFound" )
		end
		
		mirrorBottomLeft:RegisterAnimationSequence( "bottomLeftMirrorFound", {
			{
				function ()
					return self.mirrorBottomLeft:SetScale( 0, 0 )
				end,
				function ()
					return self.mirrorBottomLeft:SetScale( 0.5, 250 )
				end,
				function ()
					return self.mirrorBottomLeft:SetScale( 0, 250 )
				end,
				function ()
					return self.mirrorBottomLeft:SetScale( 0.25, 250 )
				end,
				function ()
					return self.mirrorBottomLeft:SetScale( 0, 250 )
				end,
				function ()
					return self.mirrorBottomLeft:SetScale( 0.13, 250 )
				end,
				function ()
					return self.mirrorBottomLeft:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.bottomLeftMirrorFound = function ()
			mirrorBottomLeft:AnimateSequence( "bottomLeftMirrorFound" )
		end
		
		mirrorTopRight:RegisterAnimationSequence( "topRightMirrorFound", {
			{
				function ()
					return self.mirrorTopRight:SetScale( 0, 0 )
				end,
				function ()
					return self.mirrorTopRight:SetScale( 0.5, 250 )
				end,
				function ()
					return self.mirrorTopRight:SetScale( 0, 250 )
				end,
				function ()
					return self.mirrorTopRight:SetScale( 0.25, 250 )
				end,
				function ()
					return self.mirrorTopRight:SetScale( 0, 250 )
				end,
				function ()
					return self.mirrorTopRight:SetScale( 0.13, 250 )
				end,
				function ()
					return self.mirrorTopRight:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.topRightMirrorFound = function ()
			mirrorTopRight:AnimateSequence( "topRightMirrorFound" )
		end
		
		punchCard:RegisterAnimationSequence( "punchCardFound", {
			{
				function ()
					return self.punchCard:SetScale( 0, 0 )
				end,
				function ()
					return self.punchCard:SetScale( 0.5, 250 )
				end,
				function ()
					return self.punchCard:SetScale( 0, 250 )
				end,
				function ()
					return self.punchCard:SetScale( 0.25, 250 )
				end,
				function ()
					return self.punchCard:SetScale( 0, 250 )
				end,
				function ()
					return self.punchCard:SetScale( 0.13, 240 )
				end,
				function ()
					return self.punchCard:SetScale( 0, 260 )
				end
			}
		} )
		self._sequences.punchCardFound = function ()
			punchCard:AnimateSequence( "punchCardFound" )
		end
		
		key:RegisterAnimationSequence( "keyFound", {
			{
				function ()
					return self.key:SetScale( 0, 0 )
				end,
				function ()
					return self.key:SetScale( 0.5, 250 )
				end,
				function ()
					return self.key:SetScale( 0, 250 )
				end,
				function ()
					return self.key:SetScale( 0.25, 250 )
				end,
				function ()
					return self.key:SetScale( 0, 250 )
				end,
				function ()
					return self.key:SetScale( 0.13, 250 )
				end,
				function ()
					return self.key:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.keyFound = function ()
			key:AnimateSequence( "keyFound" )
		end
		
		legRight:RegisterAnimationSequence( "zombieAnimated", {
			{
				function ()
					return self.legRight:SetZRotation( 0, 1010 )
				end
			},
			{
				function ()
					return self.legRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 422.6, _1080p * 486.6, _1080p * 280, _1080p * 344, 1009 )
				end
			}
		} )
		legLeft:RegisterAnimationSequence( "zombieAnimated", {
			{
				function ()
					return self.legLeft:SetZRotation( 0, 1010 )
				end
			},
			{
				function ()
					return self.legLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 465.6, _1080p * 593.6, _1080p * 240.49, _1080p * 368.49, 1009 )
				end
			}
		} )
		armLeft:RegisterAnimationSequence( "zombieAnimated", {
			{
				function ()
					return self.armLeft:SetZRotation( 0, 1010 )
				end
			},
			{
				function ()
					return self.armLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 458.6, _1080p * 586.6, _1080p * 9.49, _1080p * 265.49, 1009 )
				end
			}
		} )
		armRight:RegisterAnimationSequence( "zombieAnimated", {
			{
				function ()
					return self.armRight:SetZRotation( 0, 1010 )
				end
			},
			{
				function ()
					return self.armRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 292.6, _1080p * 420.6, _1080p * 20.5, _1080p * 276.5, 1009 )
				end
			}
		} )
		torso:RegisterAnimationSequence( "zombieAnimated", {
			{
				function ()
					return self.torso:SetZRotation( 0, 1010 )
				end
			},
			{
				function ()
					return self.torso:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 394.6, _1080p * 522.6, _1080p * 106, _1080p * 362, 1009 )
				end
			}
		} )
		head:RegisterAnimationSequence( "zombieAnimated", {
			{
				function ()
					return self.head:SetZRotation( 0, 1010 )
				end
			},
			{
				function ()
					return self.head:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 401.6, _1080p * 465.6, _1080p * 80.49, _1080p * 208.49, 1009 )
				end
			}
		} )
		self._sequences.zombieAnimated = function ()
			legRight:AnimateSequence( "zombieAnimated" )
			legLeft:AnimateSequence( "zombieAnimated" )
			armLeft:AnimateSequence( "zombieAnimated" )
			armRight:AnimateSequence( "zombieAnimated" )
			torso:AnimateSequence( "zombieAnimated" )
			head:AnimateSequence( "zombieAnimated" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "armLeftFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "headFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "armRightFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "legLeftFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "legRightFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questToothAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questToothAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questToothAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "torsoFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "topLeftMirrorFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "bottomLeftMirrorFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "topRightMirrorFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "punchCardFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.boatQuestCompleteAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.boatQuestCompleteAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.boatQuestCompleteAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "keyFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.liferayCompleteAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.liferayCompleteAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.liferayCompleteAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "zombieAnimated" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questPhase1", questPhase1 )
LockTable( _M )
