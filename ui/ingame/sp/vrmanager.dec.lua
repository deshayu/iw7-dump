VRManager = VRManager or {}
VRManager.ItemType = {
	NONE = 0,
	WEAPON = 1,
	ATTACHMENT = 2,
	POWER = 3
}
VRManager.GetLoadoutErrorString = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0
	if f1_arg0.weaponSlotOne.weapon:GetValue( f1_arg3 ) ~= "none" then
		f1_local0 = additonalWeaponBool
	else
		f1_local0 = true
	end
	local f1_local1
	if f1_arg0.weaponSlotTwo.weapon:GetValue( f1_arg3 ) ~= "none" then
		f1_local1 = f1_arg2
	else
		f1_local1 = true
	end
	local f1_local2 = f1_arg0.jackalSetup.jackalPrimary:GetValue( f1_arg3 ) == "none"
	local f1_local3 = f1_arg0.jackalSetup.jackalSecondary:GetValue( f1_arg3 ) == "none"
	local f1_local4 = ""
	if f1_local0 and not ShipCribUtils.IsSelectedMissionJackal() then
		f1_local4 = "MENU_SP_REQUIRE_PRIMARY_WEAPON"
	elseif f1_local1 and not ShipCribUtils.IsSelectedMissionJackal() then
		f1_local4 = "MENU_SP_REQUIRE_SECONDARY_WEAPON"
	elseif f1_local2 then
		f1_local4 = "MENU_SP_REQUIRE_JACKAL_PRIMARY_WEAPON"
	elseif f1_local3 then
		f1_local4 = "MENU_SP_REQUIRE_JACKAL_SECONDARY_WEAPON"
	end
	return f1_local4
end

VRManager.ShowLoadoutErrorPopup = function ( f2_arg0, f2_arg1 )
	LUI.FlowManager.RequestPopupMenu( nil, "PopupOK", true, f2_arg1, false, {
		title = Engine.Localize( "MENU_NOTICE" ),
		message = Engine.Localize( f2_arg0 )
	} )
end

VRManager.RunVRRoom = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	local f3_local0 = VRManager.GetLoadoutErrorString
	local f3_local1 = f3_arg0
	local f3_local2
	if f3_arg2 ~= VRManager.ItemType.WEAPON or f3_arg1 ~= "none" then
		f3_local2 = false
	else
		f3_local2 = true
	end
	local f3_local3
	if f3_arg2 ~= VRManager.ItemType.WEAPON or f3_arg1 ~= "none" then
		f3_local3 = false
	else
		f3_local3 = true
	end
	f3_local0 = f3_local0( f3_local1, f3_local2, f3_local3, f3_arg3 )
	if #f3_local0 > 0 then
		VRManager.ShowLoadoutErrorPopup( f3_local0, f3_arg3 )
	else
		DataSources.inGame.SP.player.selectedLoadout:SetValue( f3_arg3, f3_arg0.slot:GetValue( f3_arg3 ) )
		Engine.NotifyServer( "give_player_loadout_vr_" .. f3_arg1, f3_arg2 )
	end
end

