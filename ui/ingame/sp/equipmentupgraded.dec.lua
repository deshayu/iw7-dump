local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.EquipmentUpgradedMessage.EquipTitle )
	assert( f1_arg0.EquipmentUpgradedMessage.EquipmentUpgradedImage.EquipImage )
	assert( f1_arg0.EquipmentUpgradedMessage.EquipState )
	assert( f1_arg0.EquipmentUpgradedMessage.EquipDesc )
	local f1_local0 = DataSources.inGame.SP.lootUnlocked
	local f1_local1 = {}
	local self = LUI.UITimer.new( nil, {
		interval = 4000,
		event = "process_upgrades",
		disposable = false
	} )
	local f1_local3 = false
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			if f2_local0 ~= "none" then
				table.insert( f1_local1, f2_local0 )
				self.interval = 500
				f1_local3 = true
				LUI.UITimer.Reset( self )
				f1_arg0:addElement( self )
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "EquipmentUpgradedMessage",
					sequenceName = "TextOn",
					elementPath = "EquipmentUpgradedMessage"
				} )
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "EquipmentUpgradedMessageBG",
					sequenceName = "TextOn",
					elementPath = "EquipmentUpgradedMessageBG"
				} )
			elseif f1_local3 == false then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "EquipmentUpgradedMessage",
					sequenceName = "Hidden",
					elementPath = "EquipmentUpgradedMessage"
				} )
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "EquipmentUpgradedMessageBG",
					sequenceName = "Hidden",
					elementPath = "EquipmentUpgradedMessageBG"
				} )
			end
		end
	end )
	f1_arg0:addEventHandler( "process_upgrades", function ( f3_arg0, f3_arg1 )
		if #f1_local1 == 0 then
			if f1_local3 == true then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "EquipmentUpgradedMessage",
					sequenceName = "TextOff",
					elementPath = "EquipmentUpgradedMessage"
				} )
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "EquipmentUpgradedMessageBG",
					sequenceName = "TextOff",
					elementPath = "EquipmentUpgradedMessageBG"
				} )
				f1_arg0:removeElement( self )
			end
			f1_local3 = false
			return true
		end
		self.interval = 6000
		LUI.UITimer.Reset( self )
		local f3_local0 = table.remove( f1_local1, 1 )
		local f3_local1 = DataSources.inGame.SP.player.equipmentState[f3_local0]:GetValue( f1_arg1 )
		f1_arg0.EquipmentUpgradedMessage.EquipTitle:setText( Cac.GetPowerName( f3_local0 ) )
		f1_arg0.EquipmentUpgradedMessage.EquipmentUpgradedImage.EquipImage:setImage( RegisterMaterial( Cac.GetPowerImage( f3_local0 ) ), 0 )
		local f3_local2 = Cac.GetPowerDesc( f3_local0 )
		if f3_local1 == Cac.SPPowerState.UNLOCKED then
			f3_local1 = "BASE"
		elseif f3_local1 == Cac.SPPowerState.UPGRADE_ONE then
			f3_local1 = "V1"
			f3_local2 = Cac.GetPowerUpgradeOneDesc( f3_local0 )
		elseif f3_local1 == Cac.SPPowerState.UPGRADE_TWO then
			f3_local1 = "V2"
			f3_local2 = Cac.GetPowerUpgradeTwoDesc( f3_local0 )
		else
			f3_local1 = ""
		end
		f1_arg0.EquipmentUpgradedMessage.EquipDesc:setText( f3_local2 )
		f1_arg0.EquipmentUpgradedMessage.EquipState:setText( f3_local1 )
		return true
	end )
end

function EquipmentUpgraded( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 25 * _1080p )
	self.id = "EquipmentUpgraded"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local EquipmentUpgradedMessageBG = nil
	
	EquipmentUpgradedMessageBG = MenuBuilder.BuildRegisteredType( "EquipmentUpgradedMessage", {
		controllerIndex = f4_local1
	} )
	EquipmentUpgradedMessageBG.id = "EquipmentUpgradedMessageBG"
	EquipmentUpgradedMessageBG:SetAlpha( 0.1, 0 )
	EquipmentUpgradedMessageBG.EquipmentUpgradedImage.EquipImage:SetAlpha( 0, 0 )
	EquipmentUpgradedMessageBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -9, _1080p * 266, 0, _1080p * 375 )
	self:addElement( EquipmentUpgradedMessageBG )
	self.EquipmentUpgradedMessageBG = EquipmentUpgradedMessageBG
	
	local EquipmentUpgradedMessage = nil
	
	EquipmentUpgradedMessage = MenuBuilder.BuildRegisteredType( "EquipmentUpgradedMessage", {
		controllerIndex = f4_local1
	} )
	EquipmentUpgradedMessage.id = "EquipmentUpgradedMessage"
	EquipmentUpgradedMessage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 275, 0, _1080p * 375 )
	self:addElement( EquipmentUpgradedMessage )
	self.EquipmentUpgradedMessage = EquipmentUpgradedMessage
	
	f0_local0( self, f4_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "EquipmentUpgradedMessage",
		sequenceName = "Hidden",
		elementPath = "EquipmentUpgradedMessage"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "EquipmentUpgradedMessageBG",
		sequenceName = "Hidden",
		elementPath = "EquipmentUpgradedMessageBG"
	} )
	return self
end

MenuBuilder.registerType( "EquipmentUpgraded", EquipmentUpgraded )
LockTable( _M )
