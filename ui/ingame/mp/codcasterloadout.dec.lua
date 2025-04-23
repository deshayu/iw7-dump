local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 106
f0_local1 = 12
f0_local2 = 12
local f0_local3 = 452.5
local f0_local4 = function ( f1_arg0, f1_arg1 )
	for f1_local6, f1_local7 in pairs( f1_arg0.ContainersList ) do
		if f1_local7 ~= f1_arg0.RigContainer then
			local f1_local3 = f1_local7
			local f1_local4 = f1_local7.SetAlpha
			local f1_local5
			if f1_arg1 then
				f1_local5 = 1
				if not f1_local5 then
				
				else
					f1_local4( f1_local3, f1_local5 )
				end
			end
			f1_local5 = 0
		end
	end
end

local f0_local5 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg1 then
		f2_arg1 = MLG.ShoutcasterProfileVarBool( f2_arg0._controllerIndex, "shoutcaster_qs_playercard" ) and MLG.ShoutcasterProfileVarBool( f2_arg2, "shoutcaster_lo_specialist" ) and Game.GetPlayerstateClientnum() ~= Game.GetPlayerClientnum()
	end
	local f2_local0 = f2_arg0.RigContainer
	local f2_local1 = f2_local0
	f2_local0 = f2_local0.SetAlpha
	local f2_local2
	if f2_arg1 then
		f2_local2 = 1
		if not f2_local2 then
		
		else
			f2_local0( f2_local1, f2_local2 )
		end
	end
	f2_local2 = 0
end

local f0_local6 = function ( f3_arg0 )
	if f3_arg0.lastFocusedContainerId ~= f3_arg0.RigContainer.id and (f3_arg0.lastFocusedContainerId == nil or f3_arg0.ContainersList[f3_arg0.lastFocusedContainerId].containerIsVisible == false) then
		for f3_local3, f3_local4 in ipairs( f3_arg0.ContainersListOrder ) do
			local f3_local5 = f3_arg0.ContainersList[f3_local4]
			if f3_local5.containerIsVisible then
				f3_arg0.lastFocusedContainerId = f3_local5.id
				break
			end
		end
	end
	if f3_arg0.lastFocusedContainerId ~= nil then
		ACTIONS.GainFocus( f3_arg0, f3_arg0.lastFocusedContainerId, controllerIndex )
		f3_arg0.ContainersList[f3_arg0.lastFocusedContainerId]:UpdateItemInfo()
	end
end

local f0_local7 = function ( f4_arg0 )
	for f4_local3, f4_local4 in pairs( f4_arg0.ContainersList ) do
		if f4_local4:isInFocus() then
			f4_arg0.lastFocusedContainerId = f4_local4.id
			break
		end
	end
	if f4_arg0.lastFocusedContainerId then
		ACTIONS.LoseFocus( f4_arg0, f4_arg0.lastFocusedContainerId, controllerIndex )
		f4_arg0.ContainersList[f4_arg0.lastFocusedContainerId]:UpdateItemInfo()
	end
end

local f0_local8 = function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = f5_arg2 or Game.GetPlayerstateClientnum()
	local f5_local1 = Game.GetPlayerTeam( f5_local0 )
	local f5_local2 = 0
	if f5_local1 == Teams.allies then
		f5_local2 = CODCASTER.GetTeam1Color( f5_arg0._controllerIndex )
	elseif f5_local1 == Teams.axis then
		f5_local2 = CODCASTER.GetTeam2Color( f5_arg0._controllerIndex )
	end
	local f5_local3 = MLG.GetClientLoadoutInfo( f5_local0 )
	local f5_local4 = f5_local3.archetypeIndex
	local f5_local5 = {}
	local f5_local6 = {}
	local f5_local7 = MLG.ShoutcasterProfileVarBool( f5_arg0._controllerIndex, "shoutcaster_lo_specialist" )
	if f5_local7 then
		f5_local7 = MLG.ShoutcasterProfileVarBool( f5_arg0._controllerIndex, "shoutcaster_qs_playercard" )
	end
	if f5_local7 and MLG.ShoutcasterProfileVarBool( f5_arg0._controllerIndex, "shoutcaster_qs_playercard" ) and f5_local4 ~= nil then
		local f5_local8 = Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.index, f5_local4, CSV.battleRigs.cols.headshot )
		local f5_local9 = Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.index, f5_local4, CSV.battleRigs.cols.name )
		if f5_local8 ~= "" then
			table.insert( f5_local5, f5_local8 )
			table.insert( f5_local6, f5_local9 )
		end
	end
	local f5_local8 = Engine.GetDvarString( "ui_gametype" )
	local f5_local9 = {}
	local f5_local10 = {}
	if MLG.ShoutcasterProfileVarBool( f5_arg0._controllerIndex, "shoutcaster_lo_specialist_weapon" ) and f5_local8 ~= "gun" then
		local f5_local11 = f5_local3.superIndex
		if f5_local11 ~= nil then
			local f5_local12 = Engine.TableLookupByRow( CSV.supers.file, f5_local11, CSV.supers.cols.uiImageSmall )
			local f5_local13 = Engine.TableLookupByRow( CSV.supers.file, f5_local11, CSV.supers.cols.uiName )
			if f5_local12 ~= "" then
				table.insert( f5_local9, f5_local12 )
				table.insert( f5_local10, f5_local13 )
			end
		end
		local f5_local12 = f5_local3.rigTraitIndex
		if f5_local12 ~= 0 then
			local f5_local13 = Engine.TableLookup( CSV.perks.file, CSV.perks.cols.index, f5_local12, CSV.perks.cols.image )
			local f5_local14 = Engine.TableLookup( CSV.perks.file, CSV.perks.cols.index, f5_local12, CSV.perks.cols.name )
			if f5_local13 ~= "" then
				table.insert( f5_local9, f5_local13 )
				table.insert( f5_local10, f5_local14 )
			end
		end
	end
	local f5_local11 = f5_local3.weaponName_1
	local f5_local12 = {}
	local f5_local13 = {}
	if MLG.ShoutcasterProfileVarBool( f5_arg0._controllerIndex, "shoutcaster_lo_primary" ) and f5_local8 ~= "gun" and f5_local11 ~= nil then
		local f5_local15 = Engine.TableLookup( CSV.MPWeapons.file, CSV.MPWeapons.cols.asset, f5_local11, CSV.MPWeapons.cols.image )
		local f5_local16 = Engine.TableLookup( CSV.MPWeapons.file, CSV.MPWeapons.cols.asset, f5_local11, CSV.MPWeapons.cols.name )
		if f5_local15 ~= "" and f5_local16 ~= "MENU_NONE" and f5_local16 ~= "WEAPON_FISTS" then
			table.insert( f5_local12, f5_local15 )
			table.insert( f5_local13, f5_local16 )
		end
	end
	local f5_local15 = f5_local3.weaponName_2
	local f5_local16 = {}
	local f5_local17 = {}
	if MLG.ShoutcasterProfileVarBool( f5_arg0._controllerIndex, "shoutcaster_lo_secondary" ) and f5_local8 ~= "gun" and f5_local15 ~= nil then
		local f5_local18 = Engine.TableLookup( CSV.MPWeapons.file, CSV.MPWeapons.cols.asset, f5_local15, CSV.MPWeapons.cols.image )
		local f5_local19 = Engine.TableLookup( CSV.MPWeapons.file, CSV.MPWeapons.cols.asset, f5_local15, CSV.MPWeapons.cols.name )
		if f5_local18 ~= "" and f5_local19 ~= "MENU_NONE" and f5_local19 ~= "WEAPON_FISTS" then
			table.insert( f5_local16, f5_local18 )
			table.insert( f5_local17, f5_local19 )
		end
	end
	local f5_local18 = {}
	local f5_local19 = {}
	if MLG.ShoutcasterProfileVarBool( f5_arg0._controllerIndex, "shoutcaster_lo_equipment" ) and f5_local8 ~= "gun" then
		local f5_local20 = f5_local3.primaryPowerIndex
		if f5_local20 ~= 0 then
			local f5_local21 = Engine.TableLookup( CSV.MPpowers.file, CSV.MPpowers.cols.index, f5_local20, CSV.MPpowers.cols.image )
			local f5_local22 = Engine.TableLookup( CSV.MPpowers.file, CSV.MPpowers.cols.index, f5_local20, CSV.MPpowers.cols.name )
			if f5_local21 ~= "" then
				table.insert( f5_local18, f5_local21 )
				table.insert( f5_local19, f5_local22 )
			end
		end
		local f5_local21 = f5_local3.secondaryPowerIndex
		if f5_local21 ~= 0 then
			local f5_local22 = Engine.TableLookup( CSV.MPpowers.file, CSV.MPpowers.cols.index, f5_local21, CSV.MPpowers.cols.image )
			local f5_local23 = Engine.TableLookup( CSV.MPpowers.file, CSV.MPpowers.cols.index, f5_local21, CSV.MPpowers.cols.name )
			if f5_local22 ~= "" then
				table.insert( f5_local18, f5_local22 )
				table.insert( f5_local19, f5_local23 )
			end
		end
	end
	local f5_local20 = {}
	local f5_local21 = {}
	if MLG.ShoutcasterProfileVarBool( f5_arg0._controllerIndex, "shoutcaster_lo_perks" ) and f5_local8 ~= "gun" then
		local f5_local23 = 3
		for f5_local24 = 1, f5_local23, 1 do
			local f5_local27 = f5_local3[f5_local24 .. "_perkIndex"]
			if f5_local27 ~= 0 then
				local f5_local28 = Engine.TableLookup( CSV.perks.file, CSV.perks.cols.index, f5_local27, CSV.perks.cols.image )
				local f5_local29 = Engine.TableLookup( CSV.perks.file, CSV.perks.cols.index, f5_local27, CSV.perks.cols.name )
				table.insert( f5_local20, f5_local28 )
				table.insert( f5_local21, f5_local29 )
			end
			local f5_local28 = f5_local3[f5_local24 .. "_extraPerkIndex"]
			if f5_local28 ~= 0 then
				local f5_local29 = Engine.TableLookup( CSV.perks.file, CSV.perks.cols.index, f5_local28, CSV.perks.cols.image )
				local f5_local30 = Engine.TableLookup( CSV.perks.file, CSV.perks.cols.index, f5_local28, CSV.perks.cols.name )
				table.insert( f5_local20, f5_local29 )
				table.insert( f5_local21, f5_local30 )
			end
		end
	end
	local f5_local23 = tonumber( f5_local3.weaponAttachmentCount_1 )
	local f5_local24 = {}
	local f5_local25 = {}
	if MLG.ShoutcasterProfileVarBool( f5_arg0._controllerIndex, "shoutcaster_lo_primary_attachment" ) and f5_local8 ~= "gun" then
		for f5_local31 = 1, f5_local23, 1 do
			local f5_local30 = Engine.TableLookup( CSV.MPAttachments.file, CSV.MPAttachments.cols.ref, f5_local3["weapon_1_attachment_" .. f5_local31], CSV.MPAttachments.cols.image )
			local f5_local32 = Engine.TableLookup( CSV.MPAttachments.file, CSV.MPAttachments.cols.ref, f5_local3["weapon_1_attachment_" .. f5_local31], CSV.MPAttachments.cols.name )
			if f5_local30 ~= "" then
				table.insert( f5_local24, f5_local30 )
				table.insert( f5_local25, f5_local32 )
			end
		end
	end
	local f5_local31 = tonumber( f5_local3.weaponAttachmentCount_2 )
	local f5_local27 = {}
	local f5_local28 = {}
	if MLG.ShoutcasterProfileVarBool( f5_arg0._controllerIndex, "shoutcaster_lo_secondary_attachment" ) and f5_local8 ~= "gun" then
		for f5_local30 = 1, f5_local31, 1 do
			local f5_local34 = Engine.TableLookup( CSV.MPAttachments.file, CSV.MPAttachments.cols.ref, f5_local3["weapon_2_attachment_" .. f5_local30], CSV.MPAttachments.cols.image )
			local f5_local35 = Engine.TableLookup( CSV.MPAttachments.file, CSV.MPAttachments.cols.ref, f5_local3["weapon_2_attachment_" .. f5_local30], CSV.MPAttachments.cols.name )
			if f5_local34 ~= "" then
				table.insert( f5_local27, f5_local34 )
				table.insert( f5_local28, f5_local35 )
			end
		end
	end
	f5_arg0.ContainersImagesList = {}
	f5_arg0.ContainersImagesList[f5_arg0.RigContainer.id] = {
		assets = f5_local5,
		names = f5_local6,
		size = f0_local0,
		small = false
	}
	f5_arg0.ContainersImagesList[f5_arg0.RigPowerContainer.id] = {
		assets = f5_local9,
		names = f5_local10,
		size = f0_local0,
		small = true
	}
	f5_arg0.ContainersImagesList[f5_arg0.PrimaryWeaponContainer.id] = {
		assets = f5_local12,
		names = f5_local13,
		size = f0_local0 * 2,
		small = false
	}
	f5_arg0.ContainersImagesList[f5_arg0.PrimaryWeaponAttachmentsContainer.id] = {
		assets = f5_local24,
		names = f5_local25,
		size = f0_local0,
		small = true
	}
	f5_arg0.ContainersImagesList[f5_arg0.SecondaryWeaponContainer.id] = {
		assets = f5_local16,
		names = f5_local17,
		size = f0_local0 * 2,
		small = false
	}
	f5_arg0.ContainersImagesList[f5_arg0.SecondaryWeaponAttachmentsContainer.id] = {
		assets = f5_local27,
		names = f5_local28,
		size = f0_local0,
		small = true
	}
	f5_arg0.ContainersImagesList[f5_arg0.GrenadesContainer.id] = {
		assets = f5_local18,
		names = f5_local19,
		size = f0_local0,
		small = true
	}
	f5_arg0.ContainersImagesList[f5_arg0.PerksContainer.id] = {
		assets = f5_local20,
		names = f5_local21,
		size = f0_local0,
		small = true
	}
	local f5_local30 = f0_local3
	for f5_local34, f5_local35 in ipairs( f5_arg0.ContainersListOrder ) do
		local f5_local39 = f5_arg0.ContainersList[f5_local35]
		local f5_local37 = f5_arg1
		f5_local39:SetLeft( _1080p * f5_local30 )
		local f5_local40 = f5_arg0.ContainersImagesList[f5_local35]
		local f5_local38 = f0_local1
		local f5_local41 = f0_local2
		if f5_local35 == "RigContainer" then
			f5_local37 = true
			f5_local38 = 0
		end
		if f5_local37 then
			f5_local30 = f5_local30 + f5_local39:UpdateContainer( f0_local0, f5_local40.assets, f5_local40.names, f5_local40.size, f5_local40.small, f5_local38, f5_local41, f5_local2 )
		end
	end
end

function ProcessDpadButtonEvent( f6_arg0, f6_arg1 )
	f6_arg0:processEvent( f6_arg1 )
	for f6_local3, f6_local4 in pairs( f6_arg0.ContainersList ) do
		f6_local4:UpdateItemInfo()
	end
end

local f0_local9 = function ( f7_arg0 )
	f7_arg0:RegisterAnimationSequence( "MoveDown", {
		{
			function ()
				return f7_arg0:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 0, _1080p * 1080, 0 )
			end,
			function ()
				return f7_arg0:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 30, _1080p * 1110, 150 )
			end
		}
	} )
	f7_arg0:RegisterAnimationSequence( "MoveUp", {
		{
			function ()
				return f7_arg0:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 0, _1080p * 1080, 0 )
			end,
			function ()
				return f7_arg0:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * -30, _1080p * 1050, 150 )
			end
		}
	} )
end

local f0_local10 = function ( f12_arg0, f12_arg1, f12_arg2 )
	f0_local9( f12_arg0 )
	f12_arg0.SetLoadoutVisibility = f0_local4
	f12_arg0.SetRigContainerVisibility = f0_local5
	f12_arg0.UpdateLoadout = f0_local8
	f12_arg0.ProcessDpadButtonEvent = ProcessDpadButtonEvent
	f12_arg0.LoadoutGainFocus = f0_local6
	f12_arg0.LoadoutLoseFocus = f0_local7
	f12_arg0._controllerIndex = f12_arg1
	f12_arg0.RigContainer:SetUnselectable()
	f12_arg0.ContainersList = {
		[f12_arg0.RigContainer.id] = f12_arg0.RigContainer,
		[f12_arg0.RigPowerContainer.id] = f12_arg0.RigPowerContainer,
		[f12_arg0.PrimaryWeaponContainer.id] = f12_arg0.PrimaryWeaponContainer,
		[f12_arg0.PrimaryWeaponAttachmentsContainer.id] = f12_arg0.PrimaryWeaponAttachmentsContainer,
		[f12_arg0.SecondaryWeaponContainer.id] = f12_arg0.SecondaryWeaponContainer,
		[f12_arg0.SecondaryWeaponAttachmentsContainer.id] = f12_arg0.SecondaryWeaponAttachmentsContainer,
		[f12_arg0.GrenadesContainer.id] = f12_arg0.GrenadesContainer,
		[f12_arg0.PerksContainer.id] = f12_arg0.PerksContainer
	}
	f12_arg0.ContainersListOrder = {
		f12_arg0.RigContainer.id,
		f12_arg0.RigPowerContainer.id,
		f12_arg0.PrimaryWeaponContainer.id,
		f12_arg0.PrimaryWeaponAttachmentsContainer.id,
		f12_arg0.SecondaryWeaponContainer.id,
		f12_arg0.SecondaryWeaponAttachmentsContainer.id,
		f12_arg0.GrenadesContainer.id,
		f12_arg0.PerksContainer.id
	}
end

function CodCasterLoadout( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CodCasterLoadout"
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	local f13_local2 = self
	local RigContainer = nil
	
	RigContainer = MenuBuilder.BuildRegisteredType( "CodCasterLoadoutItemContainer", {
		controllerIndex = f13_local1
	} )
	RigContainer.id = "RigContainer"
	RigContainer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 452.5, _1080p * 558.5, _1080p * 917, _1080p * 1023 )
	self:addElement( RigContainer )
	self.RigContainer = RigContainer
	
	local RigPowerContainer = nil
	
	RigPowerContainer = MenuBuilder.BuildRegisteredType( "CodCasterLoadoutItemContainer", {
		controllerIndex = f13_local1
	} )
	RigPowerContainer.id = "RigPowerContainer"
	RigPowerContainer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 558.5, _1080p * 664.5, _1080p * 917, _1080p * 1023 )
	self:addElement( RigPowerContainer )
	self.RigPowerContainer = RigPowerContainer
	
	local PrimaryWeaponContainer = nil
	
	PrimaryWeaponContainer = MenuBuilder.BuildRegisteredType( "CodCasterLoadoutItemContainer", {
		controllerIndex = f13_local1
	} )
	PrimaryWeaponContainer.id = "PrimaryWeaponContainer"
	PrimaryWeaponContainer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 664.5, _1080p * 770.5, _1080p * 917, _1080p * 1023 )
	self:addElement( PrimaryWeaponContainer )
	self.PrimaryWeaponContainer = PrimaryWeaponContainer
	
	local PrimaryWeaponAttachmentsContainer = nil
	
	PrimaryWeaponAttachmentsContainer = MenuBuilder.BuildRegisteredType( "CodCasterLoadoutItemContainer", {
		controllerIndex = f13_local1
	} )
	PrimaryWeaponAttachmentsContainer.id = "PrimaryWeaponAttachmentsContainer"
	PrimaryWeaponAttachmentsContainer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 770.5, _1080p * 876.5, _1080p * 917, _1080p * 1023 )
	self:addElement( PrimaryWeaponAttachmentsContainer )
	self.PrimaryWeaponAttachmentsContainer = PrimaryWeaponAttachmentsContainer
	
	local SecondaryWeaponContainer = nil
	
	SecondaryWeaponContainer = MenuBuilder.BuildRegisteredType( "CodCasterLoadoutItemContainer", {
		controllerIndex = f13_local1
	} )
	SecondaryWeaponContainer.id = "SecondaryWeaponContainer"
	SecondaryWeaponContainer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 876.5, _1080p * 982.5, _1080p * 917, _1080p * 1023 )
	self:addElement( SecondaryWeaponContainer )
	self.SecondaryWeaponContainer = SecondaryWeaponContainer
	
	local SecondaryWeaponAttachmentsContainer = nil
	
	SecondaryWeaponAttachmentsContainer = MenuBuilder.BuildRegisteredType( "CodCasterLoadoutItemContainer", {
		controllerIndex = f13_local1
	} )
	SecondaryWeaponAttachmentsContainer.id = "SecondaryWeaponAttachmentsContainer"
	SecondaryWeaponAttachmentsContainer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 982.5, _1080p * 1088.5, _1080p * 917, _1080p * 1023 )
	self:addElement( SecondaryWeaponAttachmentsContainer )
	self.SecondaryWeaponAttachmentsContainer = SecondaryWeaponAttachmentsContainer
	
	local GrenadesContainer = nil
	
	GrenadesContainer = MenuBuilder.BuildRegisteredType( "CodCasterLoadoutItemContainer", {
		controllerIndex = f13_local1
	} )
	GrenadesContainer.id = "GrenadesContainer"
	GrenadesContainer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1088.5, _1080p * 1194.5, _1080p * 917, _1080p * 1023 )
	self:addElement( GrenadesContainer )
	self.GrenadesContainer = GrenadesContainer
	
	local PerksContainer = nil
	
	PerksContainer = MenuBuilder.BuildRegisteredType( "CodCasterLoadoutItemContainer", {
		controllerIndex = f13_local1
	} )
	PerksContainer.id = "PerksContainer"
	PerksContainer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1194.5, _1080p * 1300.5, _1080p * 917, _1080p * 1023 )
	self:addElement( PerksContainer )
	self.PerksContainer = PerksContainer
	
	f0_local10( self, f13_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterLoadout", CodCasterLoadout )
LockTable( _M )
