local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = Engine.GetDvarString( "ui_mapname" )
f0_local1 = ""
if f0_local0 == "cp_disco" then
	f0_local1 = "cp/cp_disco_wall_buy_models.csv"
elseif f0_local0 == "cp_town" then
	f0_local1 = "cp/cp_town_wall_buy_models.csv"
elseif f0_local0 == "cp_final" then
	f0_local1 = "cp/cp_final_wall_buy_models.csv"
else
	f0_local1 = "cp/cp_wall_buy_models.csv"
end
f0_local2 = {
	File = f0_local1,
	indexColumn = 0,
	sharedLoadoutWeaponColumn = 2,
	zombieWeaponModel = 3,
	overrideWeapon = 4,
	overrideMPWeapon = 5,
	MaxEntries = 40,
	numAttachmentSlot = 6,
	variantFile = 6,
	variantModelColumn = 20
}
local f0_local3 = {
	File = "mp/statstable.csv",
	sharedLoadoutWeaponColumn = 4,
	weaponClassColumn = 1,
	defaultAttachmentColumn = 9
}
local f0_local4 = {
	File = "mp/camotable.csv",
	weaponIndex = 8
}
local f0_local5 = {
	File = "cp/zombies/mode_string_tables/zombies_statstable.csv",
	sharedLoadoutWeaponColumn = 4,
	defaultAttachmentColumn = 9
}
local f0_local6 = {
	File = "mp/attachmentmap.csv",
	classNameOrWeaponNameColumn = 0,
	scopeColumn = 1,
	acogColumn = 2,
	reflexColumn = 3,
	phaseColumn = 4,
	thermalColumn = 5,
	hybridColumn = 6,
	oscopeColumn = 7,
	vzscopeColumn = 8,
	eloColumn = 9,
	smartColumn = 10,
	fastaimColumn = 11,
	firetypeautoColumn = 12,
	silencerColumn = 13,
	barrelrangeColumn = 14,
	xmagsColumn = 15,
	xmagseColumn = 16,
	rofColumn = 17,
	stockColumn = 18,
	highcalColumn = 19,
	gripColumn = 20,
	hipaimColumn = 21,
	shotgunColumn = 22,
	glColumn = 23,
	akimboColumn = 24
}
local f0_local7 = {
	File = "cp/zombies/zombie_attachmentmap.csv",
	classNameOrWeaponNameColumn = 0,
	scopeColumn = 10,
	xmagseColumn = 12,
	akimboColumn = 14,
	shotgunColumn = 15,
	highcalColumn = 16,
	glColumn = 17,
	mpFinalWeaponRef = 18
}
local f0_local8 = {
	File = "mp/attachmenttable.csv",
	referenceColumn = 4,
	baseRefColumn = 5
}
local f0_local9 = {
	File = "cp/zombies/zombie_attachmenttable.csv",
	referenceColumn = 4,
	baseRefColumn = 5
}
local f0_local10 = {
	File = "mp/attachmentcombos.csv",
	indexColumn = 0,
	scopeColumn = 1,
	reflexColumn = 2,
	acogColumn = 3,
	thermalColumn = 4,
	phaseColumn = 5,
	eloColumn = 6,
	oscopeColumn = 7,
	vzscopeColumn = 8,
	hybridColumn = 9,
	gripColumn = 10,
	shotgunColumn = 11,
	akimboColumn = 12,
	glglproxColumn = 13,
	shotgunglproxColumn = 14,
	stickglproxColumn = 15,
	missglproxColumn = 16,
	arm8Column = 17,
	arripperColumn = 18
}
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	for f1_local0 = 0, f0_local2.MaxEntries - 1, 1 do
		local f1_local3 = f1_local0
		local f1_local4 = Engine.TableLookup( f0_local2.File, f0_local2.indexColumn, "" .. f1_local3, f0_local2.zombieWeaponModel )
		local f1_local5 = Engine.TableLookup( f0_local2.File, f0_local2.indexColumn, "" .. f1_local3, f0_local2.sharedLoadoutWeaponColumn )
		local f1_local6 = Engine.TableLookup( f0_local2.File, f0_local2.indexColumn, "" .. f1_local3, f0_local2.overrideWeapon )
		local f1_local7 = Engine.TableLookup( f0_local2.File, f0_local2.indexColumn, "" .. f1_local3, f0_local2.overrideMPWeapon )
		local f1_local8 = Engine.TableLookup( f0_local2.File, f0_local2.indexColumn, "" .. f1_local3, f0_local2.variantFile )
		local f1_local9 = -1
		local f1_local10 = 0
		if f1_local8 ~= "" and f1_local8 ~= "none" and f1_local8 ~= nil then
			f1_local9 = Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombiePlayerWeaponModels", f1_local5, "variantID" )
			if f1_local9 > -1 then
				local f1_local11 = CSV.ReadRow( {
					file = f1_local8,
					cols = CSV.weaponLoot.cols
				}, f1_local9 )
				if not Cac.IsLootWeaponOwned( f1_local11.ref, f1_arg1 ) then
					local f1_local12 = f1_arg0:Wait( 50 * f1_local10 + 1 )
					f1_local12.onComplete = function ()
						f1_local10 = f1_local10 + 1
						Engine.NotifyServer( "reset_weapon_player_data", tonumber( f1_local3 ) )
					end
					
					f1_local9 = -1
				end
				local f1_local12 = Engine.TableLookup( f1_local8, 0, "" .. f1_local9, f0_local2.variantModelColumn )
				if f1_local12 ~= "" and f1_local12 ~= "none" and f1_local12 ~= nil then
					f1_local4 = f1_local12
				end
			end
		end
		local f1_local11 = convertZmWeaponToMpWeapon( f1_local5, f1_local4 )
		local f1_local13 = convertZmWeaponToBaseVariant( f1_local5, f1_local4 )
		local f1_local12 = convertZmWeaponToMPBaseVariant( f1_local5, f1_local4 )
		local f1_local14 = {}
		local f1_local15 = {}
		local f1_local16 = {}
		if f1_local5 ~= "" then
			for f1_local17 = 0, f0_local2.numAttachmentSlot - 1, 1 do
				local f1_local20 = GetBaseAttachment( f1_arg1, f1_local5, f1_local17 )
				if f1_local20 ~= "none" then
					table.insert( f1_local14, f1_local20 )
				end
			end
			for f1_local20, f1_local22 in ipairs( filterBaseAttachments( f1_local14, GetDefaultBaseAttachments( f1_arg1, f1_local5, f1_local12, f1_local11, f1_local4, f1_local13 ) ) ) do
				local f1_local23 = GetAttachment( f1_arg1, f1_local5, f1_local22, f1_local6, f1_local7, f1_local4 )
				if f1_local23 ~= "none" then
					table.insert( f1_local15, f1_local23 )
				end
			end
			f1_local18 = getCosmeticAttachmentFromPlayerData( f1_arg1, f1_local5 )
			if isValidAttachmentString( f1_local18 ) then
				table.insert( f1_local15, f1_local18 )
			end
			table.sort( f1_local15 )
			for f1_local22, f1_local23 in ipairs( f1_local15 ) do
				f1_local4 = f1_local4 .. "+" .. f1_local23
			end
		end
		local f1_local17 = getWeaponCamoFromPlayerData( f1_arg1, f0_local4, f1_local5, f1_local8, f1_local9 )
		if isValidAttachmentString( f1_local17 ) then
			f1_local4 = f1_local4 .. "+" .. f1_local17
		end
		ClientWeapon.SetWeaponModel( f1_local3, f1_local4 )
		ClientWeapon.SetWeaponIsViewModel( f1_local3, false )
		ClientWeapon.SetWeaponVisible( f1_local3, true )
	end
	Engine.NotifyServer( "weaponplayerdatafinished", 0 )
end

function getCosmeticAttachmentFromPlayerData( f3_arg0, f3_arg1 )
	return Engine.GetPlayerDataEx( f3_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombiePlayerWeaponModels", f3_arg1, "cosmeticAttachment" )
end

function IsHolidayWeapon( f4_arg0 )
	local f4_local0
	if f4_arg0 ~= "weapon_iw7_ripper_common_3" and f4_arg0 ~= "weapon_iw7_lmg03_rare_3" and f4_arg0 ~= "weapon_iw7_ar57_legendary_3" then
		f4_local0 = false
	else
		f4_local0 = true
	end
	return f4_local0
end

function IsSummerHolidayWeapon( f5_arg0 )
	local f5_local0
	if f5_arg0 ~= "weapon_iw7_erad_legendary_4" and f5_arg0 ~= "weapon_iw7_ake_epic_4" and f5_arg0 ~= "weapon_iw7_sdflmg_legendary_4" and f5_arg0 ~= "weapon_iw7_mod2187_legendary_3" and f5_arg0 ~= "weapon_iw7_longshot_legendary_3" then
		f5_local0 = false
	else
		f5_local0 = true
	end
	return f5_local0
end

function IsHalloweenHolidayWeapon( f6_arg0 )
	local f6_local0
	if f6_arg0 ~= "weapon_iw7_kbs_rare_3" and f6_arg0 ~= "weapon_iw7_ripper_rare_3" and f6_arg0 ~= "weapon_iw7_m4_rare_3" and f6_arg0 ~= "weapon_iw7_mod2187_legendary_5" and f6_arg0 ~= "weapon_iw7_mag_rare_3" and f6_arg0 ~= "weapon_iw7_minilmg_epic_3" then
		f6_local0 = false
	else
		f6_local0 = true
	end
	return f6_local0
end

function getWeaponCamoFromPlayerData( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
	local f7_local0, f7_local1 = nil
	f7_local0 = isValidAttachmentString( f7_arg3 )
	if f7_local0 and tonumber( f7_arg4 ) > -1 then
		f7_local1 = Engine.TableLookup( f7_arg3, 0, f7_arg4, 1 )
	end
	local f7_local2 = f7_local0
	local f7_local3
	if f7_arg4 == nil or f7_local1 == nil then
		f7_local3 = false
	else
		f7_local3 = f7_local2 and true
	end
	if f7_local3 and IsHolidayWeapon( f7_local1 ) then
		return "camo" .. Engine.TableLookup( f7_arg1.File, 1, "camo89", f7_arg1.weaponIndex )
	elseif f7_local3 and IsSummerHolidayWeapon( f7_local1 ) then
		return "camo" .. Engine.TableLookup( f7_arg1.File, 1, "camo230", f7_arg1.weaponIndex )
	elseif f7_local3 and IsHalloweenHolidayWeapon( f7_local1 ) then
		return "camo" .. Engine.TableLookup( f7_arg1.File, 1, "camo242", f7_arg1.weaponIndex )
	end
	local f7_local4 = Engine.GetPlayerDataEx( f7_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombiePlayerWeaponModels", f7_arg2, "camo" )
	local f7_local5 = nil
	local f7_local6 = 0
	if isValidAttachmentString( f7_local4 ) then
		f7_local6 = Engine.TableLookup( f7_arg1.File, 1, f7_local4, f7_arg1.weaponIndex )
	end
	if not isValidAttachmentString( f7_local6 ) then
		f7_local6 = 0
	end
	if f7_local3 and tonumber( f7_local6 ) <= 0 then
		local f7_local7 = Cac.GetWeaponLootIDFromLootRef( f7_local1 )
		if isValidAttachmentString( f7_local7 ) and Cac.IsLootIDMk2( tonumber( f7_local7 ) ) then
			local f7_local8 = Engine.TableLookup( f7_arg3, 0, f7_arg4, 4 )
			if isValidAttachmentString( f7_local8 ) then
				local f7_local9 = "camo" .. Cac.GetWeaponMark2CamoIndex( tonumber( f7_local8 ) )
				if isValidAttachmentString( f7_local9 ) then
					return "camo" .. Engine.TableLookup( f7_arg1.File, 1, f7_local9, f7_arg1.weaponIndex )
				end
			end
		end
	end
	if isValidAttachmentString( f7_arg3 ) and tonumber( f7_local6 ) <= 0 then
		local f7_local7 = Engine.TableLookup( f7_arg3, 0, f7_arg4, 4 )
		if isValidAttachmentString( f7_local7 ) then
			if f7_local7 == "1" then
				f7_local5 = "camo24"
			elseif f7_local7 == "2" then
				f7_local5 = "camo19"
			elseif f7_local7 == "3" then
				f7_local5 = "camo18"
			end
		end
		if isValidAttachmentString( f7_local5 ) then
			f7_local6 = Engine.TableLookup( f7_arg1.File, 1, f7_local5, f7_arg1.weaponIndex )
		end
	end
	if isValidAttachmentString( f7_local6 ) and tonumber( f7_local6 ) > 0 then
		return "camo" .. f7_local6
	end
	return nil
end

function GetDefaultBaseAttachments( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5 )
	local f8_local0 = {}
	local f8_local1 = "none"
	local f8_local2 = false
	local f8_local3 = Engine.TableLookup( f0_local5.File, f0_local5.sharedLoadoutWeaponColumn, f8_arg4, f0_local5.defaultAttachmentColumn )
	if f8_local3 ~= nil and f8_local3 ~= "" then
		f8_local1 = f8_local3
		f8_local2 = true
	end
	local f8_local4 = Engine.TableLookup( f0_local3.File, f0_local3.sharedLoadoutWeaponColumn, f8_arg3, f0_local3.defaultAttachmentColumn )
	if f8_local2 == false and f8_local4 ~= nil and f8_local4 ~= "" then
		f8_local1 = f8_local4
		f8_local2 = true
	end
	local f8_local5 = Engine.TableLookup( f0_local5.File, f0_local5.sharedLoadoutWeaponColumn, f8_arg5, f0_local5.defaultAttachmentColumn )
	if f8_local2 == false and f8_local5 ~= nil and f8_local5 ~= "" then
		f8_local1 = f8_local5
		f8_local2 = true
	end
	local f8_local6 = Engine.TableLookup( f0_local3.File, f0_local3.sharedLoadoutWeaponColumn, f8_arg2, f0_local3.defaultAttachmentColumn )
	if f8_local2 == false and f8_local6 ~= nil and f8_local6 ~= "" then
		f8_local1 = f8_local6
		f8_local2 = true
	end
	local f8_local7 = Engine.TableLookup( f0_local5.File, f0_local5.sharedLoadoutWeaponColumn, f8_arg1, f0_local5.defaultAttachmentColumn )
	if f8_local2 == false and f8_local7 ~= nil and f8_local7 ~= "" then
		f8_local1 = f8_local7
		f8_local2 = true
	end
	local f8_local8 = Engine.TableLookup( f0_local3.File, f0_local3.sharedLoadoutWeaponColumn, f8_arg1, f0_local3.defaultAttachmentColumn )
	if f8_local2 == false and f8_local8 ~= nil and f8_local8 ~= "" then
		f8_local1 = f8_local8
		f8_local2 = true
	end
	if f8_local1 ~= "" then
		f8_local0 = LUI.Split( f8_local1, " " )
	end
	return f8_local0
end

function filterBaseAttachments( f9_arg0, f9_arg1 )
	local f9_local0 = {}
	for f9_local4, f9_local5 in ipairs( f9_arg0 ) do
		table.insert( f9_local0, f9_local5 )
	end
	for f9_local4, f9_local5 in ipairs( f9_arg1 ) do
		local f9_local6 = true
		for f9_local7, f9_local8 in ipairs( f9_local0 ) do
			if f9_local5 == f9_local8 then
				f9_local6 = false
			end
			if not areCompatibleAttachments( f9_local5, f9_local8 ) then
				f9_local6 = false
			end
		end
		if f9_local6 == true then
			table.insert( f9_local0, f9_local5 )
		end
	end
	return f9_local0
end

function areCompatibleAttachments( f10_arg0, f10_arg1 )
	local f10_local0 = getAttachmentComboColumn( f10_arg1 )
	if f10_local0 == -1 then
		return true
	elseif Engine.TableLookup( f0_local10.File, f0_local10.indexColumn, f10_arg0, f10_local0 ) == "no" then
		return false
	else
		return true
	end
end

function GetBaseAttachment( f11_arg0, f11_arg1, f11_arg2 )
	return Engine.GetPlayerDataEx( f11_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombiePlayerWeaponModels", f11_arg1, "attachment", f11_arg2 )
end

function GetAttachment( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4, f12_arg5 )
	local f12_local0 = f12_arg2
	local f12_local1 = Engine.TableLookup( f0_local3.File, f0_local3.sharedLoadoutWeaponColumn, f12_arg1, f0_local3.weaponClassColumn )
	local f12_local2 = getMPAttachmentColumn( f12_arg2 )
	local f12_local3 = getZombieAttachmentColumn( f12_arg2 )
	local f12_local4 = convertZmWeaponToMpWeapon( f12_arg1, f12_arg5 )
	local f12_local5 = convertZmWeaponToBaseVariant( f12_arg1, f12_arg5 )
	local f12_local6 = convertZmWeaponToMPBaseVariant( f12_arg1, f12_arg5 )
	if f12_local2 == -1 then
		return "none"
	end
	f12_local0 = getAttachmentFromFinalWeaponModel( f12_arg2, f12_local4, f12_arg5, f12_local2, f12_local3 )
	if f12_local0 == f12_arg2 or f12_local0 == nil or f12_local0 == "" then
		f12_local0 = getAttachmentFromOverrideWeapons( f12_arg2, f12_local5, f12_local6, f12_local2, f12_local3 )
	end
	if f12_local0 == f12_arg2 or f12_local0 == nil or f12_local0 == "" then
		f12_local0 = getAttachmentFromSharedWeapon( f12_arg2, f12_arg1, f12_local2, f12_local3 )
	end
	if f12_local0 == f12_arg2 or f12_local0 == nil or f12_local0 == "" then
		f12_local0 = getAttachmentFromWeaponClass( f12_arg2, f12_local1, f12_local2, f12_local3 )
	end
	if f12_local0 == nil or f12_local0 == "" then
		return f12_arg2
	end
	return f12_local0
end

function convertZmWeaponToMPBaseVariant( f13_arg0, f13_arg1 )
	local f13_local0 = f13_arg1
	local f13_local1 = "none"
	local f13_local2 = "none"
	f13_local1 = string.find( f13_arg1, "_zml" )
	if isValidAttachmentString( f13_local1 ) then
		f13_local2 = "_mpl"
	end
	if not isValidAttachmentString( f13_local1 ) then
		f13_local1 = string.find( f13_arg1, "_zmr" )
		if isValidAttachmentString( f13_local1 ) then
			f13_local2 = "_mpr"
		end
	end
	if not isValidAttachmentString( f13_local1 ) and isValidAttachmentString( string.find( f13_arg1, "_zm" ) ) then
		f13_local2 = "_mp"
	end
	if isValidAttachmentString( f13_local2 ) then
		f13_local0 = f13_arg0 .. f13_local2
	end
	return f13_local0
end

function convertZmWeaponToBaseVariant( f14_arg0, f14_arg1 )
	local f14_local0 = f14_arg1
	local f14_local1 = "none"
	local f14_local2 = "none"
	f14_local1 = string.find( f14_arg1, "_zml" )
	if isValidAttachmentString( f14_local1 ) then
		f14_local2 = "_zml"
	end
	if not isValidAttachmentString( f14_local1 ) then
		f14_local1 = string.find( f14_arg1, "_zmr" )
		if isValidAttachmentString( f14_local1 ) then
			f14_local2 = "_zmr"
		end
	end
	if not isValidAttachmentString( f14_local1 ) and isValidAttachmentString( string.find( f14_arg1, "_zm" ) ) then
		f14_local2 = "_zm"
	end
	if isValidAttachmentString( f14_local2 ) then
		f14_local0 = f14_arg0 .. f14_local2
	end
	return f14_local0
end

function convertZmWeaponToMpWeapon( f15_arg0, f15_arg1 )
	local f15_local0 = string.gsub( f15_arg1, "_zm", "_mp" )
	if isValidAttachmentString( f15_local0 ) then
		return f15_local0
	else
		return "none"
	end
end

function getAttachmentFromWeaponClass( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
	local f16_local0 = f16_arg0
	local f16_local1 = Engine.TableLookup( f0_local6.File, f0_local6.classNameOrWeaponNameColumn, f16_arg1, f16_arg2 )
	if f16_local1 ~= nil and f16_local1 ~= "" then
		f16_local0 = f16_local1
	end
	if f16_arg3 ~= -1 then
		local f16_local2 = Engine.TableLookup( f0_local7.File, f0_local7.classNameOrWeaponNameColumn, f16_arg1, f16_arg3 )
		if f16_local2 ~= nil and f16_local2 ~= "" then
			f16_local0 = f16_local2
		end
	end
	return f16_local0
end

function getAttachmentFromOverrideWeapons( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
	local f17_local0 = f17_arg0
	if isValidAttachmentString( f17_arg2 ) then
		local f17_local1 = Engine.TableLookup( f0_local6.File, f0_local6.classNameOrWeaponNameColumn, f17_arg2, f17_arg3 )
		if f17_local1 ~= nil and f17_local1 ~= "" then
			f17_local0 = f17_local1
		end
	end
	if f17_arg4 ~= -1 and isValidAttachmentString( f17_arg1 ) then
		local f17_local1 = Engine.TableLookup( f0_local7.File, f0_local7.classNameOrWeaponNameColumn, f17_arg1, f17_arg4 )
		if f17_local1 ~= nil and f17_local1 ~= "" then
			f17_local0 = f17_local1
		end
	end
	return f17_local0
end

function getAttachmentFromSharedWeapon( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
	local f18_local0 = f18_arg0
	local f18_local1 = Engine.TableLookup( f0_local6.File, f0_local6.classNameOrWeaponNameColumn, f18_arg1, f18_arg2 )
	if f18_local1 ~= nil and f18_local1 ~= "" then
		f18_local0 = f18_local1
	end
	if f18_arg3 ~= -1 then
		local f18_local2 = Engine.TableLookup( f0_local7.File, f0_local7.classNameOrWeaponNameColumn, f18_arg1, f18_arg3 )
		if f18_local2 ~= nil and f18_local2 ~= "" then
			f18_local0 = f18_local2
		end
	end
	return f18_local0
end

function getAttachmentFromFinalWeaponModel( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
	local f19_local0 = f19_arg0
	if isValidAttachmentString( f19_arg1 ) then
		local f19_local1 = Engine.TableLookup( f0_local6.File, f0_local6.classNameOrWeaponNameColumn, f19_arg1, f19_arg3 )
		if f19_local1 ~= nil and f19_local1 ~= "" then
			f19_local0 = f19_local1
		end
	end
	if f19_arg4 ~= -1 and isValidAttachmentString( f19_arg2 ) then
		local f19_local1 = Engine.TableLookup( f0_local7.File, f0_local7.classNameOrWeaponNameColumn, f19_arg2, f19_arg4 )
		if f19_local1 ~= nil and f19_local1 ~= "" then
			f19_local0 = f19_local1
		end
	end
	return f19_local0
end

function isValidAttachmentString( f20_arg0 )
	if f20_arg0 ~= "" and f20_arg0 ~= "none" and f20_arg0 ~= nil then
		return true
	else
		return false
	end
end

function getAttachmentComboColumn( f21_arg0 )
	if f21_arg0 == "scope" then
		return f0_local10.scopeColumn
	elseif f21_arg0 == "reflex" then
		return f0_local10.reflexColumn
	elseif f21_arg0 == "acog" then
		return f0_local10.acogColumn
	elseif f21_arg0 == "thermal" then
		return f0_local10.thermalColumn
	elseif f21_arg0 == "phase" then
		return f0_local10.phaseColumn
	elseif f21_arg0 == "elo" then
		return f0_local10.eloColumn
	elseif f21_arg0 == "oscope" then
		return f0_local10.oscopeColumn
	elseif f21_arg0 == "vzscope" then
		return f0_local10.vzscopeColumn
	elseif f21_arg0 == "hybrid" then
		return f0_local10.hybridColumn
	elseif f21_arg0 == "grip" then
		return f0_local10.gripColumn
	elseif f21_arg0 == "shotgun" then
		return f0_local10.shotgunColumn
	elseif f21_arg0 == "akimbo" then
		return f0_local10.akimboColumn
	elseif f21_arg0 == "glglprox" then
		return f0_local10.glglproxColumn
	elseif f21_arg0 == "shotgunglprox" then
		return f0_local10.shotgunglproxColumn
	elseif f21_arg0 == "stickglprox" then
		return f0_local10.stickglproxColumn
	elseif f21_arg0 == "missglprox" then
		return f0_local10.missglproxColumn
	elseif f21_arg0 == "arm8" then
		return f0_local10.arm8Column
	elseif f21_arg0 == "arripper" then
		return f0_local10.arripperColumn
	else
		return -1
	end
end

function getMPAttachmentColumn( f22_arg0 )
	if f22_arg0 == "scope" then
		return f0_local6.scopeColumn
	elseif f22_arg0 == "acog" then
		return f0_local6.acogColumn
	elseif f22_arg0 == "nodualfov" then
		return f0_local6.nodualfovColumn
	elseif f22_arg0 == "reflex" then
		return f0_local6.reflexColumn
	elseif f22_arg0 == "phase" then
		return f0_local6.phaseColumn
	elseif f22_arg0 == "thermal" then
		return f0_local6.thermalColumn
	elseif f22_arg0 == "hybrid" then
		return f0_local6.hybridColumn
	elseif f22_arg0 == "oscope" then
		return f0_local6.oscopeColumn
	elseif f22_arg0 == "vzscope" then
		return f0_local6.vzscopeColumn
	elseif f22_arg0 == "elo" then
		return f0_local6.eloColumn
	elseif f22_arg0 == "fastaim" then
		return f0_local6.fastaimColumn
	elseif f22_arg0 == "firetypeauto" then
		return f0_local6.firetypeautoColumn
	elseif f22_arg0 == "silencer" then
		return f0_local6.silencerColumn
	elseif f22_arg0 == "barrelrange" then
		return f0_local6.barrelrangeColumn
	elseif f22_arg0 == "xmags" then
		return f0_local6.xmagsColumn
	elseif f22_arg0 == "xmagse" then
		return f0_local6.xmagseColumn
	elseif f22_arg0 == "rof" then
		return f0_local6.rofColumn
	elseif f22_arg0 == "stock" then
		return f0_local6.stockColumn
	elseif f22_arg0 == "highcal" then
		return f0_local6.highcalColumn
	elseif f22_arg0 == "grip" then
		return f0_local6.gripColumn
	elseif f22_arg0 == "hipaim" then
		return f0_local6.hipaimColumn
	elseif f22_arg0 == "shotgun" then
		return f0_local6.shotgunColumn
	elseif f22_arg0 == "gl" then
		return f0_local6.glColumn
	elseif f22_arg0 == "akimbo" then
		return f0_local6.akimboColumn
	else
		return -1
	end
end

function getZombieAttachmentColumn( f23_arg0 )
	if f23_arg0 == "scope" then
		return f0_local7.scopeColumn
	elseif f23_arg0 == "xmagse" then
		return f0_local7.xmagseColumn
	elseif f23_arg0 == "akimbo" then
		return f0_local7.akimboColumn
	elseif f23_arg0 == "shotgun" then
		return f0_local7.shotgunColumn
	elseif f23_arg0 == "highcal" then
		return f0_local7.highcalColumn
	elseif f23_arg0 == "gl" then
		return f0_local7.glColumn
	else
		return -1
	end
end

function playerWeaponBuiltKit( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "playerWeaponBuiltKit"
	local f24_local1 = controller and controller.controllerIndex
	if not f24_local1 and not Engine.InFrontend() then
		f24_local1 = self:getRootController()
	end
	assert( f24_local1 )
	local f24_local2 = self
	PostLoadFunc( self, f24_local1, controller )
	return self
end

MenuBuilder.registerType( "playerWeaponBuiltKit", playerWeaponBuiltKit )
LockTable( _M )
