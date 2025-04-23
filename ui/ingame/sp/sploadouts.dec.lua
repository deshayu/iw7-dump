local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 0
f0_local1 = "frontEnd.SP.loadouts.loadoutSelect"
function PopFunc()
	WipeSPLoadoutDataModels()
	WipeGlobalModelsAtPath( f0_local1 )
	ACTIONS.ResumeGame()
end

MenuBuilder.registerType( "LoadoutConfirmation", function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.currentMenu.SPLoadout:GetDataSource( f2_arg1.controllerIndex )
	assert( f2_local0 )
	local f2_local1 = f2_arg1.controllerIndex
	local f2_local2 = ShipCribUtils.GetSelectedMission()
	local f2_local3 = "LUA_MENU_LOADOUT_CONFIRM_MISSION"
	if f2_local2 ~= "" then
		f2_local3 = "LUA_MENU_LOADOUT_CONFIRM"
	end
	local f2_local4 = {
		title = f2_local0.name:GetValue( f2_local1 ),
		width = 400,
		message = "",
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		buttonsClosePopup = false,
		buttons = {}
	}
	table.insert( f2_local4.buttons, {
		label = Engine.Localize( f2_local3 ),
		action = function ( f3_arg0, f3_arg1 )
			local f3_local0 = VRManager.GetLoadoutErrorString( f2_local0, false, false, f3_arg1 )
			if #f3_local0 > 0 then
				VRManager.ShowLoadoutErrorPopup( f3_local0, f3_arg1 )
			else
				DataSources.inGame.SP.player.selectedLoadout:SetValue( f3_arg1, f2_local0.slot:GetValue( f3_arg1 ) )
				Engine.NotifyServer( "give_player_loadout", 1 )
				LUI.FlowManager.RequestLeaveMenu( f3_arg0, true )
				LUI.UIRoot.BlockButtonInput( Engine.GetLuiRoot(), true, "LeaveSPLoadouts" )
			end
		end
	} )
	if f2_local0.slot:GetValue( f2_local1 ) == 0 then
		table.insert( f2_local4.buttons, {
			label = Engine.Localize( "LUA_MENU_RESET" ),
			action = function ( f4_arg0, f4_arg1 )
				LUI.FlowManager.RequestPopupMenu( f4_arg0, "PopupYesNo", true, f4_arg1, false, {
					yesAction = function ()
						Engine.NotifyServer( "edit_loadout_reset", 1 )
						LUI.FlowManager.RequestLeaveMenu( f4_arg0, true )
					end,
					message = Engine.Localize( "MENU_SP_CONFIRM_LOADOUT_RESET" )
				} )
			end
		} )
	end
	table.insert( f2_local4.buttons, {
		label = Engine.Localize( "LUA_MENU_CANCEL" ),
		action = function ( f6_arg0, f6_arg1 )
			ACTIONS.LeaveMenu( f6_arg0 )
		end
	} )
	local f2_local5 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", f2_local4 )
	f2_local5.id = "LoadoutConfirmation"
	return f2_local5
end )
local f0_local3 = function ( f7_arg0, f7_arg1, f7_arg2 )
	return function ( f8_arg0, f8_arg1 )
		if not f7_arg0.ItemDescription.WeaponStatsPanel then
			
		else
			
		end
		Cac.UpdateWeaponStatsPanel( f7_arg1:GetDataSource( f7_arg2 ), f7_arg0.ItemDescription.WeaponStatsPanel, f7_arg2 )
		ACTIONS.AnimateSequence( f7_arg0.ItemDescription, "ImageHidden" )
		local f8_local0 = f8_arg0:GetDataSource( f7_arg2 )
		f8_local0.headerColor = LUI.DataSourceInGlobalModel.new( f0_local1 .. "." .. f8_arg0.id .. "color", GetIntForColor( SWATCHES.CAC.defaultItemHeader ) )
		f7_arg0.itemDescriptionDataLink = f7_arg0.ItemDescription:SetDataSourceThroughElement( f8_arg0, nil )
	end
	
end

local f0_local4 = function ( f9_arg0, f9_arg1, f9_arg2 )
	return function ( f10_arg0, f10_arg1 )
		if not f9_arg0.ItemDescription.WeaponStatsPanel then
			Cac.AttachWeaponStatsPanel( f9_arg0.ItemDescription, f9_arg2 )
		end
		Cac.UpdateWeaponStatsPanel( f9_arg1:GetDataSource( f9_arg2 ), f9_arg0.ItemDescription.WeaponStatsPanel, f9_arg2 )
		ACTIONS.AnimateSequence( f9_arg0.ItemDescription, "RatioLarge" )
		local f10_local0 = f10_arg0:GetDataSource( f9_arg2 )
		f10_local0.headerColor = LUI.DataSourceInGlobalModel.new( f0_local1 .. "." .. f10_arg0.id .. "color", GetIntForColor( SWATCHES.CAC.defaultItemHeader ) )
		f9_arg0.itemDescriptionDataLink = f9_arg0.ItemDescription:SetDataSourceThroughElement( f10_arg0, nil )
		f10_local0 = f9_arg0.ItemDescription.UnlockCriteria
		local f10_local1 = f9_arg0.ItemDescription.ShowcaseLock
		ACTIONS.AnimateSequence( f10_local0, "Hidden" )
		ACTIONS.AnimateSequence( f10_local1, "HideCriteria" )
		f9_arg0.ItemDescription.UpgradeState:SetAlpha( 0, 0 )
		f10_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_CLEAR" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 0,
			clickable = true
		} )
	end
	
end

local f0_local5 = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = LUI.FlowManager.GetScopedData( f11_arg0:GetCurrentMenu() )
	f11_local0.refreshWidgetMenu = f11_arg2
end

local f0_local6 = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
	return function ( f13_arg0, f13_arg1 )
		local f13_local0 = f12_arg1:GetDataSource( f12_arg3 )
		f13_local0.isProperty = false
		local f13_local1 = {
			currentWeaponDataSource = f13_local0,
			loadoutDataSource = f12_arg0.SubMenuTabsBar.Tabs:GetDataSource(),
			attachmentSlot = f12_arg2,
			loadoutDataSource = false
		}
		f0_local5( f13_arg0, f12_arg3, Cac.LoadoutEditMenus.AttachmentSelect )
		LUI.FlowManager.RequestAddMenu( "SPAttachmentSelect", true, f12_arg3, nil, f13_local1, true )
	end
	
end

local f0_local7 = function ( f14_arg0 )
	local f14_local0 = f14_arg0:GetCurrentMenu()
	f14_local0.statsData = nil
	local f14_local1 = f14_local0.ItemDescription
	if f14_local1.WeaponStatsPanel then
		f14_local1.WeaponStatsPanel:closeTree()
		f14_local1.WeaponStatsPanel = nil
	end
end

local f0_local8 = function ( f15_arg0, f15_arg1 )
	return function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg0:GetDataSource( f15_arg1 )
		f16_local0.headerColor = LUI.DataSourceInGlobalModel.new( f0_local1 .. "." .. f16_arg0.id .. "color", GetIntForColor( SWATCHES.CAC.defaultItemHeader ) )
		f15_arg0.itemDescriptionDataLink = f15_arg0.ItemDescription:SetDataSourceThroughElement( f16_arg0, nil )
		f16_local0 = f16_arg0:GetDataSource()
		f16_local0 = f16_local0.extraDisabled:GetValue( f15_arg1 )
		if f16_local0 ~= nil then
			local f16_local1 = f15_arg0.ItemDescription.UnlockCriteria
			local f16_local2 = f15_arg0.ItemDescription.ShowcaseLock
			if f16_local0 then
				f16_local1:SetAlpha( 1, 0 )
				f16_local1.UnlockDesc:setText( Engine.Localize( "EQUIPMENT_UNLOCK_EXTRA" ) )
				ACTIONS.AnimateSequence( f16_local1, "Visible" )
				ACTIONS.AnimateSequence( f16_local2, "ShowCriteria" )
			else
				ACTIONS.AnimateSequence( f16_local1, "Hidden" )
				ACTIONS.AnimateSequence( f16_local2, "HideCriteria" )
			end
		end
		local f16_local1 = f16_arg0:GetDataSource()
		f16_local1 = f16_local1.ref
		f15_arg0.ItemDescription.UpgradeState:setText( Cac.GetSPPowerStateText( DataSources.inGame.SP.player.equipmentState[f16_local1.ref:GetValue( f15_arg1 )]:GetValue( f15_arg1 ) ) )
		f15_arg0.ItemDescription.UpgradeState:SetAlpha( 1, 0 )
		f0_local7( f16_arg0 )
		ACTIONS.AnimateSequence( f15_arg0.ItemDescription, "RatioLarge" )
		Engine.SetDvarString( "loadout_weapon_string", "none" )
		f16_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_CLEAR" ),
			button_ref = "button_alt1",
			side = "left",
			priority = 0,
			clickable = true
		} )
	end
	
end

local f0_local9 = function ( f17_arg0, f17_arg1 )
	return function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg0:GetDataSource( f17_arg1 )
		f18_local0.headerColor = LUI.DataSourceInGlobalModel.new( f0_local1 .. "." .. f18_arg0.id .. "color", GetIntForColor( SWATCHES.CAC.defaultItemHeader ) )
		f17_arg0.itemDescriptionDataLink = f17_arg0.ItemDescription:SetDataSourceThroughElement( f18_arg0, nil )
		f0_local7( f18_arg0 )
		ACTIONS.AnimateSequence( f17_arg0.ItemDescription, "RatioExtraWide" )
		Engine.SetDvarString( "loadout_weapon_string", "none" )
		f18_local0 = f17_arg0.ItemDescription.UnlockCriteria
		local f18_local1 = f17_arg0.ItemDescription.ShowcaseLock
		ACTIONS.AnimateSequence( f18_local0, "Hidden" )
		ACTIONS.AnimateSequence( f18_local1, "HideCriteria" )
		f17_arg0.ItemDescription.UpgradeState:SetAlpha( 0, 0 )
		f18_arg0:AddButtonHelperText( {
			helper_text = "",
			button_ref = "button_alt1",
			side = "left",
			priority = 0,
			clickable = true
		} )
	end
	
end

local f0_local10 = function ( f19_arg0 )
	return function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg0.loadoutsDataSource:GetCountValue( f19_arg0 )
		local f20_local1 = {}
		local f20_local2 = LUI.DataSourceFromList.new( f20_local0 )
		f20_local2.MakeDataSourceAtIndex = function ( f21_arg0, f21_arg1 )
			return f20_local1[f21_arg1 + 1]
		end
		
		f20_local2.GetDefaultFocusIndex = function ()
			return f0_local0
		end
		
		for f20_local3 = 1, f20_local0, 1 do
			local f20_local6 = {}
			local f20_local7 = GetSPPlayerDataDataSources()
			f20_local7.isProperty = false
			f20_local7.__serializable = false
			local f20_local8 = f20_local7.loadouts:GetDataSourceAtIndex( f20_local3 - 1, f19_arg0 )
			if f20_local3 == 1 then
				f20_local6.name = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".tabRecommendedName", Engine.Localize( "MENU_SP_RECOMMENDED" ) )
			else
				f20_local6.name = f20_local8.name
			end
			f20_local6.focusFunction = function ( f23_arg0, f23_arg1, f23_arg2 )
				local f23_local0 = f20_arg0.loadoutsDataSource:GetDataSourceAtIndex( f23_arg2, f23_arg1 )
				f20_arg0.SPLoadout:SetDataSource( f23_local0, f23_arg1 )
				f20_arg0:processEvent( {
					name = "open_loadout_edit_menu",
					loadoutDataSource = f23_local0
				} )
				f0_local0 = f23_arg2
				local f23_local1 = f20_arg0.SPLoadout.WeaponOne:getAllFocusedChildren()
				local f23_local2 = f20_arg0.SPLoadout.WeaponTwo:getAllFocusedChildren()
				if #f23_local1 > 0 then
					f23_local1[1]:processEvent( {
						name = "button_over"
					} )
				elseif #f23_local2 > 0 then
					f23_local2[1]:processEvent( {
						name = "button_over"
					} )
				end
			end
			
			table.insert( f20_local1, f20_local6 )
		end
		f20_arg0.SubMenuTabsBar.Tabs:SetTabManagerDataSource( f20_local2 )
		f20_arg0:SubscribeToModelThroughElement( f20_arg0.SubMenuTabsBar.Tabs, "name", function ()
			local f24_local0 = f20_arg0.SubMenuTabsBar.Tabs:GetDataSource()
			f24_local0 = f24_local0.name:GetValue( f19_arg0 )
			if f24_local0 ~= nil then
				f20_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( f24_local0 ), 0 )
			end
		end )
		local f20_local4 = LUI.FlowManager.GetScopedData( f20_arg0 )
		if f20_local4.currentDataSource then
			f20_arg0.SubMenuTabsBar.Tabs:SetDataSource( f20_local4.currentDataSource, f19_arg0 )
			ACTIONS.AnimateSequence( f20_arg0, "OpenedLoadoutEdit" )
			Engine.SetDvarString( "loadout_weapon_string", "none" )
		end
		if f20_local4.openedLoadoutEdit then
			f20_arg0.SPLoadout:processEvent( {
				name = "open_loadout_edit_menu"
			} )
		end
		local f20_local5 = f20_local4.refreshWidgetMenu
		if f20_local5 then
			if f20_local5 == Cac.LoadoutEditMenus.WeaponSelect then
				ACTIONS.AnimateSequence( f20_arg0.ItemDescription, "FromWeaponSelect" )
			elseif f20_local5 == Cac.LoadoutEditMenus.AttachmentSelect then
				ACTIONS.AnimateSequence( f20_arg0.ItemDescription, "FromAttachmentSelect" )
			elseif f20_local5 == Cac.LoadoutEditMenus.PowerSelect then
				ACTIONS.AnimateSequence( f20_arg0.ItemDescription, "FromPowerSelect" )
			elseif f20_local5 == Cac.LoadoutEditMenus.JackalDecalSelect then
				ACTIONS.AnimateSequence( f20_arg0.ItemDescription, "FromJackalDecal" )
			elseif f20_local5 == Cac.LoadoutEditMenus.JackalEquipSelect then
				ACTIONS.AnimateSequence( f20_arg0.ItemDescription, "FromPowerSelect" )
			end
			f20_local4.refreshWidgetMenu = nil
		else
			f20_arg0.SPLoadout:processEvent( {
				name = "gain_focus"
			} )
		end
	end
	
end

local f0_local11 = function ( f25_arg0, f25_arg1 )
	local f25_local0 = LUI.FlowManager.GetScopedData( f25_arg0 )
	if f25_arg0.itemDescriptionDataLink then
		f25_arg0.ItemDescription:UnsubscribeFromModelThroughElement( f25_arg0.itemDescriptionDataLink )
	end
	f25_local0.currentDataSource = nil
	f25_local0.openedLoadoutEdit = false
	Engine.NotifyServer( "exit_loadouts_page", 1 )
	Engine.SetDvarString( "loadout_tut_string", "exit_loadouts_page" )
	Engine.SetDvarString( "loadout_weapon_string", "none" )
end

local f0_local12 = function ( f26_arg0 )
	return function ( f27_arg0, f27_arg1 )
		f0_local5( f27_arg0, f26_arg0, Cac.LoadoutEditMenus.WeaponSelect )
		ACTIONS.OpenWeaponSelectMenu( f27_arg0, f27_arg0, f26_arg0 )
	end
	
end

local f0_local13 = function ( f28_arg0 )
	return function ( f29_arg0, f29_arg1 )
		f0_local5( f29_arg0, f28_arg0, Cac.LoadoutEditMenus.PowerSelect )
		ACTIONS.OpenSPPowerSelectMenu( f29_arg0, f29_arg0, f28_arg0 )
	end
	
end

local f0_local14 = function ( f30_arg0 )
	return function ( f31_arg0, f31_arg1 )
		f0_local5( f31_arg0, f30_arg0, Cac.LoadoutEditMenus.JackalEquipSelect )
		ACTIONS.OpenJackalEquipMenu( f31_arg0, f31_arg0, f31_arg1.controller or f30_arg0 )
	end
	
end

local f0_local15 = function ( f32_arg0 )
	return function ( f33_arg0, f33_arg1 )
		f0_local5( f33_arg0, f32_arg0, Cac.LoadoutEditMenus.JackalDecalSelect )
		ACTIONS.OpenJackalDecalMenu( f33_arg0, f33_arg1.controller or f32_arg0 )
	end
	
end

function PostLoadFunc( f34_arg0, f34_arg1, f34_arg2 )
	f34_arg0:addEventHandler( "open_loadout_edit_menu", function ( f35_arg0, f35_arg1 )
		f34_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ARMORY" ) .. " / " .. Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT" ) ), 0 )
		local f35_local0 = LUI.FlowManager.GetScopedData( f34_arg0 )
		f35_local0.openedLoadoutEdit = true
		local f35_local1 = f35_arg0.SubMenuTabsBar.Tabs
		local f35_local2 = f35_local1:GetDataSource( f34_arg1 )
		if f35_local2 == nil then
			f35_local2 = f35_arg1.loadoutDataSource
		end
		local f35_local3 = LUI.FlowManager.GetScopedData( f34_arg0 )
		f35_local3.currentDataSource = f35_local2
		f35_local3.currentDataSource.isProperty = false
		f35_local1:saveState()
	end )
	f34_arg0:addEventHandler( "close_loadout_edit_menu", function ( f36_arg0, f36_arg1 )
		local f36_local0 = f36_arg0.SPLoadout:GetDataSource( f34_arg1 )
		local f36_local1 = f36_arg0.SubMenuTabsBar.Tabs:GetDataSource( f34_arg1 )
		LUI.FlowManager.RequestPopupMenu( f34_arg0, "LoadoutConfirmation", true, f34_arg1, false, {
			currentMenu = f34_arg0
		} )
		return true
	end )
	f34_arg0.loadoutsDataSource = GetProgressionLoadoutDataSources()
	f34_arg0:addEventHandler( "menu_create", f0_local10( f34_arg1 ) )
	f34_arg0:addEventHandler( "restore_focus", function ( f37_arg0, f37_arg1 )
		local f37_local0 = f37_arg0.SubMenuTabsBar.Tabs
		local f37_local1 = f37_local0:GetDataSource( f34_arg1 )
		local f37_local2 = LUI.FlowManager.GetScopedData( f37_arg0:GetCurrentMenu() )
		f37_local2.currentDataSource = f37_local1
		f37_local2.currentDataSource.isProperty = false
		f37_local0:saveState()
	end )
	assert( f34_arg0.bindButton )
	f34_arg0.bindButton:addEventHandler( "button_start", function ( f38_arg0, f38_arg1 )
		local f38_local0 = f34_arg0.SPLoadout:GetDataSource( f34_arg1 )
		f38_local0.isProperty = false
		f38_local0.__serializable = false
		local f38_local1 = GetSPPlayerDataDataSources()
		f38_local1.isProperty = false
		f38_local1.__serializable = false
		LUI.FlowManager.RequestPopupMenu( f34_arg0, "LoadoutOptionsPopup", true, f34_arg1, false, {
			currentLoadoutIndex = f38_local0.slot:GetValue( f34_arg1 ),
			loadoutListDataSource = f38_local1,
			loadoutDataSource = f38_local0
		}, nil, true )
	end )
	f34_arg0:addEventHandler( "close_loadout_edit_menu", f0_local11 )
	local f34_local0 = f34_arg0.SPLoadout
	local f34_local1 = f34_local0.WeaponOne
	local f34_local2 = f34_local0.WeaponTwo
	f34_local1.WeaponButton:addEventHandler( "button_action", f0_local12( f34_arg1 ) )
	f34_local2.WeaponButton:addEventHandler( "button_action", f0_local12( f34_arg1 ) )
	f34_local1.WeaponButton.navigation = {}
	f34_local1.WeaponButton.navigation.up = f34_local0.JackalItems.JackalItem1
	f34_local1.WeaponButton.navigation.right = f34_local1.AttachmentsOne.SlotOne
	f34_local1.WeaponButton.navigation.down = f34_local2.WeaponButton
	f34_local1.WeaponButton:addEventHandler( "button_over", f0_local4( f34_arg0, f34_local1.WeaponButton, f34_arg1 ) )
	f34_local1.WeaponButton:addEventHandler( "button_over", f0_local3( f34_arg0, f34_local1.WeaponButton, f34_arg1 ) )
	f34_local1.WeaponButton.id = "WeaponOne"
	f34_local2.WeaponButton.navigation = {}
	f34_local2.WeaponButton.navigation.up = f34_local1.WeaponButton
	f34_local2.WeaponButton.navigation.right = f34_local2.AttachmentsOne.SlotOne
	f34_local2.WeaponButton.navigation.down = f34_local0.FramedPowers.Power
	f34_local2.WeaponButton:addEventHandler( "button_over", f0_local4( f34_arg0, f34_local2.WeaponButton, f34_arg1 ) )
	f34_local2.WeaponButton:addEventHandler( "button_over", f0_local3( f34_arg0, f34_local2.WeaponButton, f34_arg1 ) )
	f34_local2.WeaponButton.id = "WeaponTwo"
	local f34_local3 = function ( f39_arg0, f39_arg1 )
		f39_arg0.AttachmentsOne.SlotOne:SetDataSourceThroughElement( f39_arg0, "attachments.attachmentSlotOne" )
		f39_arg0.AttachmentsOne.SlotTwo:SetDataSourceThroughElement( f39_arg0, "attachments.attachmentSlotTwo" )
		f39_arg0.AttachmentsOne.SlotThree:SetDataSourceThroughElement( f39_arg0, "attachments.attachmentSlotThree" )
		local f39_local0 = f39_arg0.AttachmentsOne:getFirstChild()
		local f39_local1 = 0
		while f39_local0 do
			f39_local0.navigation = {}
			f39_local0:addEventHandler( "button_over", f0_local4( f34_arg0, f39_arg0.WeaponButton, f34_arg1 ) )
			f39_local0:addEventHandler( "button_over_disable", f0_local4( f34_arg0, f39_arg0.WeaponButton, f34_arg1 ) )
			f39_local0:addEventHandler( "button_action", f0_local6( f34_arg0, f39_arg0.WeaponButton, f39_local1, f34_arg1 ) )
			f39_local0.id = f39_arg1 .. f39_local1
			f39_local0 = f39_local0:getNextSibling()
			f39_local1 = f39_local1 + 1
		end
		f39_arg0.AttachmentsOne.SlotOne.navigation.left = f39_arg0.WeaponButton
		f39_arg0.AttachmentsOne.SlotTwo.navigation.left = f39_arg0.WeaponButton
		f39_arg0.AttachmentsOne.SlotThree.navigation.left = f39_arg0.WeaponButton
	end
	
	f34_local3( f34_local1, "PrimaryAttachment" )
	f34_local3( f34_local2, "SecondaryAttachment" )
	local f34_local4 = f34_local1.AttachmentsOne
	local f34_local5 = f34_local2.AttachmentsOne
	f34_local4.SlotOne.navigation.up = f34_local0.JackalItems.JackalItem3
	f34_local4.SlotThree.navigation.down = f34_local5.SlotOne
	f34_local5.SlotOne.navigation.up = f34_local4.SlotThree
	f34_local5.SlotThree.navigation.down = f34_local0.FramedOffhandPowers.ExtraPower
	f34_local0.FramedPowers.Power:addEventHandler( "button_action", f0_local13( f34_arg1 ) )
	f34_local0.FramedPowers.ExtraPower:addEventHandler( "button_action", f0_local13( f34_arg1 ) )
	f34_local0.FramedOffhandPowers.Power:addEventHandler( "button_action", f0_local13( f34_arg1 ) )
	f34_local0.FramedOffhandPowers.ExtraPower:addEventHandler( "button_action", f0_local13( f34_arg1 ) )
	f34_local0.FramedPowers.Power.navigation = {}
	f34_local0.FramedPowers.Power.navigation.up = f34_local2.WeaponButton
	f34_local0.FramedPowers.Power.navigation.down = f34_local0.JackalItems.JackalLivery
	f34_local0.FramedPowers.Power.navigation.right = f34_local0.FramedPowers.ExtraPower
	f34_local0.FramedPowers.Power.id = "ItemPower"
	f34_local0.FramedPowers.Power:addEventHandler( "gain_focus", f0_local8( f34_arg0, f34_arg1 ) )
	f34_local0.FramedPowers.ExtraPower.navigation = {}
	f34_local0.FramedPowers.ExtraPower.navigation.up = f34_local2.WeaponButton
	f34_local0.FramedPowers.ExtraPower.navigation.down = f34_local0.JackalItems.JackalLivery
	f34_local0.FramedPowers.ExtraPower.navigation.left = f34_local0.FramedPowers.Power
	f34_local0.FramedPowers.ExtraPower.navigation.right = f34_local0.FramedOffhandPowers.Power
	f34_local0.FramedPowers.ExtraPower.id = "ItemExtraPower"
	f34_local0.FramedPowers.ExtraPower:addEventHandler( "gain_focus", f0_local8( f34_arg0, f34_arg1 ) )
	f34_local0.FramedOffhandPowers.Power.navigation = {}
	f34_local0.FramedOffhandPowers.Power.navigation.up = f34_local2.WeaponButton
	f34_local0.FramedOffhandPowers.Power.navigation.down = f34_local0.JackalItems.JackalLivery
	f34_local0.FramedOffhandPowers.Power.navigation.left = f34_local0.FramedPowers.ExtraPower
	f34_local0.FramedOffhandPowers.Power.navigation.right = f34_local0.FramedOffhandPowers.ExtraPower
	f34_local0.FramedOffhandPowers.Power.id = "OffhandPower"
	f34_local0.FramedOffhandPowers.Power:addEventHandler( "gain_focus", f0_local8( f34_arg0, f34_arg1 ) )
	f34_local0.FramedOffhandPowers.ExtraPower.navigation = {}
	f34_local0.FramedOffhandPowers.ExtraPower.navigation.up = f34_local5.SlotThree
	f34_local0.FramedOffhandPowers.ExtraPower.navigation.down = f34_local0.JackalItems.JackalLivery
	f34_local0.FramedOffhandPowers.ExtraPower.navigation.left = f34_local0.FramedOffhandPowers.Power
	f34_local0.FramedOffhandPowers.ExtraPower.id = "OffhandExtraPower"
	f34_local0.FramedOffhandPowers.ExtraPower:addEventHandler( "gain_focus", f0_local8( f34_arg0, f34_arg1 ) )
	f34_local0.JackalItems.JackalLivery:addEventHandler( "button_action", f0_local15( f34_arg1 ) )
	f34_local0.JackalItems.JackalItem1:addEventHandler( "button_action", f0_local14( f34_arg1 ) )
	f34_local0.JackalItems.JackalItem2:addEventHandler( "button_action", f0_local14( f34_arg1 ) )
	f34_local0.JackalItems.JackalItem3:addEventHandler( "button_action", f0_local14( f34_arg1 ) )
	f34_local0.JackalItems.JackalLivery.navigation = {}
	f34_local0.JackalItems.JackalLivery.navigation.up = f34_local0.FramedPowers.Power
	f34_local0.JackalItems.JackalLivery.navigation.down = f34_local0.JackalItems.JackalItem1
	f34_local0.JackalItems.JackalLivery.id = "JackalLivery"
	f34_local0.JackalItems.JackalLivery:addEventHandler( "button_over", f0_local9( f34_arg0, f34_arg1 ) )
	f34_local0.JackalItems.JackalItem1.navigation = {}
	f34_local0.JackalItems.JackalItem1.navigation.up = f34_local0.JackalItems.JackalLivery
	f34_local0.JackalItems.JackalItem1.navigation.down = f34_local1.WeaponButton
	f34_local0.JackalItems.JackalItem1.navigation.right = f34_local0.JackalItems.JackalItem2
	f34_local0.JackalItems.JackalItem1.id = "JackalItem1"
	f34_local0.JackalItems.JackalItem1:addEventHandler( "button_over", f0_local9( f34_arg0, f34_arg1 ) )
	f34_local0.JackalItems.JackalItem2.navigation = {}
	f34_local0.JackalItems.JackalItem2.navigation.up = f34_local0.JackalItems.JackalLivery
	f34_local0.JackalItems.JackalItem2.navigation.down = f34_local1.WeaponButton
	f34_local0.JackalItems.JackalItem2.navigation.right = f34_local0.JackalItems.JackalItem3
	f34_local0.JackalItems.JackalItem2.navigation.left = f34_local0.JackalItems.JackalItem1
	f34_local0.JackalItems.JackalItem2.id = "JackalItem2"
	f34_local0.JackalItems.JackalItem2:addEventHandler( "button_over", f0_local9( f34_arg0, f34_arg1 ) )
	f34_local0.JackalItems.JackalItem3.navigation = {}
	f34_local0.JackalItems.JackalItem3.navigation.up = f34_local0.JackalItems.JackalLivery
	f34_local0.JackalItems.JackalItem3.navigation.down = f34_local4.SlotOne
	f34_local0.JackalItems.JackalItem3.navigation.left = f34_local0.JackalItems.JackalItem2
	f34_local0.JackalItems.JackalItem3.id = "JackalItem3"
	f34_local0.JackalItems.JackalItem3:addEventHandler( "button_over", f0_local9( f34_arg0, f34_arg1 ) )
	if ShipCribUtils.IsSelectedMissionJackal() then
		f34_local0.JackalItems:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 206.98 )
		f34_local0.LoadoutBlur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -550 )
		f34_local0.WeaponOne:closeTree()
		f34_local0.WeaponTwo:closeTree()
		f34_local0.FramedPowers:closeTree()
		f34_local0.FramedOffhandPowers:closeTree()
		f34_local0.VRHint:closeTree()
		f34_local0.JackalItems.JackalLivery.navigation.up = f34_local0.JackalItems.JackalItem1
		f34_local0.JackalItems.JackalItem1.navigation.down = f34_local0.JackalItems.JackalLivery
		f34_local0.JackalItems.JackalItem2.navigation.down = f34_local0.JackalItems.JackalLivery
		f34_local0.JackalItems.JackalItem3.navigation.down = f34_local0.JackalItems.JackalLivery
	end
	f34_arg0:registerOmnvarHandler( "ui_open_loadout_menu", function ( f40_arg0, f40_arg1 )
		if not f40_arg1.value then
			LUI.FlowManager.RequestCloseAllMenus()
		end
	end )
	local f34_local6 = Engine.GetDvarString( "ui_mapname" )
	if f34_local6 == "shipcrib_moon" or f34_local6 == "shipcrib_titan" then
		local f34_local7 = MenuBuilder.BuildRegisteredType( "LoadoutTutorialText", {
			controllerIndex = f34_arg1
		} )
		f34_local7.id = "LoadoutTutorialText"
		f34_local7:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		f34_arg0:addElement( f34_local7 )
		f34_arg0.loadoutTutorialText = f34_local7
	end
end

function SPLoadouts( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "SPLoadouts"
	self._animationSets = {}
	self._sequences = {}
	local f41_local1 = controller and controller.controllerIndex
	if not f41_local1 and not Engine.InFrontend() then
		f41_local1 = self:getRootController()
	end
	assert( f41_local1 )
	self:playSound( "menu_open" )
	local f41_local2 = self
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f41_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_LOADOUT_EDIT" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( Engine.Localize( "LUA_MENU_ARMORY" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -10, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 80, 0 )
	MenuTitle.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ItemDescription = nil
	
	ItemDescription = MenuBuilder.BuildRegisteredType( "LoadoutSelectHeader", {
		controllerIndex = f41_local1
	} )
	ItemDescription.id = "ItemDescription"
	ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1920, _1080p * 3194, _1080p * 216, _1080p * 966 )
	self:addElement( ItemDescription )
	self.ItemDescription = ItemDescription
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f41_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SPLoadout = nil
	
	SPLoadout = MenuBuilder.BuildRegisteredType( "SPLoadout", {
		controllerIndex = f41_local1
	} )
	SPLoadout.id = "SPLoadout"
	SPLoadout.WeaponOne.Background:SetAlpha( 0, 0 )
	SPLoadout.WeaponTwo.Background:SetAlpha( 0, 0 )
	SPLoadout.FramedOffhandPowers.Background:SetAlpha( 0, 0 )
	SPLoadout.FramedPowers.Background:SetAlpha( 0, 0 )
	SPLoadout.JackalItems.Background:SetAlpha( 0, 0 )
	SPLoadout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 216, _1080p * 979 )
	self:addElement( SPLoadout )
	self.SPLoadout = SPLoadout
	
	local SubMenuTabsBar = nil
	
	SubMenuTabsBar = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f41_local1
	} )
	SubMenuTabsBar.id = "SubMenuTabsBar"
	SubMenuTabsBar:SetDataSourceThroughElement( self, nil )
	SubMenuTabsBar:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185 )
	self:addElement( SubMenuTabsBar )
	self.SubMenuTabsBar = SubMenuTabsBar
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ItemDescription:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1920, _1080p * 3194, _1080p * 216, _1080p * 966, 0 )
				end,
				function ()
					return self.ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 646, _1080p * 1920, _1080p * 216, _1080p * 966, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		SPLoadout:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.SPLoadout.WeaponOne.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.SPLoadout.WeaponTwo.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.SPLoadout.FramedOffhandPowers.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.SPLoadout.FramedPowers.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.SPLoadout.JackalItems.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.SPLoadout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 720, _1080p * 1220, _1080p * 216, _1080p * 979, 0 )
				end,
				function ()
					return self.SPLoadout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 979, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.OpenLoadoutEdit = function ()
			ItemDescription:AnimateSequence( "OpenLoadoutEdit" )
			SPLoadout:AnimateSequence( "OpenLoadoutEdit" )
		end
		
		ItemDescription:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1920, _1080p * 3120, _1080p * 216, _1080p * 966, 0 )
				end
			}
		} )
		SPLoadout:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.SPLoadout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 676, _1080p * 1176, _1080p * 216, _1080p * 979, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			ItemDescription:AnimateSequence( "Default" )
			SPLoadout:AnimateSequence( "Default" )
		end
		
		ItemDescription:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 646, _1080p * 1920, _1080p * 216, _1080p * 966, 0 )
				end,
				function ()
					return self.ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1920, _1080p * 3194, _1080p * 216, _1080p * 966, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		SPLoadout:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.SPLoadout.WeaponOne.Background:SetAlpha( 0, 0, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.SPLoadout.WeaponTwo.Background:SetAlpha( 0, 0, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.SPLoadout.FramedOffhandPowers.Background:SetAlpha( 0, 0, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.SPLoadout.FramedPowers.Background:SetAlpha( 0, 0, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.SPLoadout.JackalItems.Background:SetAlpha( 0, 0, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.SPLoadout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 979, 0, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.SPLoadout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 720, _1080p * 1220, _1080p * 216, _1080p * 979, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.CloseLoadoutEdit = function ()
			ItemDescription:AnimateSequence( "CloseLoadoutEdit" )
			SPLoadout:AnimateSequence( "CloseLoadoutEdit" )
		end
		
		ItemDescription:RegisterAnimationSequence( "OpenedLoadoutEdit", {
			{
				function ()
					return self.ItemDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 646, _1080p * 1920, _1080p * 216, _1080p * 966, 0 )
				end
			}
		} )
		SPLoadout:RegisterAnimationSequence( "OpenedLoadoutEdit", {
			{
				function ()
					return self.SPLoadout.WeaponOne.Background:SetAlpha( 1, 0, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.SPLoadout.WeaponTwo.Background:SetAlpha( 1, 0, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.SPLoadout.FramedOffhandPowers.Background:SetAlpha( 1, 0, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.SPLoadout.FramedPowers.Background:SetAlpha( 1, 0, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.SPLoadout.JackalItems.Background:SetAlpha( 1, 0, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.SPLoadout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 979, 0, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.OpenedLoadoutEdit = function ()
			ItemDescription:AnimateSequence( "OpenedLoadoutEdit" )
			SPLoadout:AnimateSequence( "OpenedLoadoutEdit" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	SubMenuTabsBar:SetDataSourceThroughElement( self, nil )
	self.addButtonHelperFunction = function ( f75_arg0, f75_arg1 )
		f75_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f75_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f75_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_LOADOUT_OPTIONS" ),
			button_ref = "button_start",
			side = "left",
			priority = 4,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "close_loadout_edit_menu", function ( f76_arg0, f76_arg1 )
		ACTIONS.UploadStats( self, f76_arg1.controller or f41_local1 )
	end )
	self:addEventHandler( "menu_create", function ( f77_arg0, f77_arg1 )
		ACTIONS.UploadStats( self, f77_arg1.controller or f41_local1 )
	end )
	self.bindButton:addEventHandler( "button_secondary", function ( f78_arg0, f78_arg1 )
		local f78_local0 = f78_arg1.controller or f41_local1
		ACTIONS.CloseLoadoutEditMenu( self )
	end )
	PostLoadFunc( self, f41_local1, controller )
	return self
end

MenuBuilder.registerType( "SPLoadouts", SPLoadouts )
LUI.FlowManager.RegisterStackPopBehaviour( "SPLoadouts", PopFunc )
LockTable( _M )
