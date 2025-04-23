local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 6
f0_local1 = "cg.MP.broShot.players"
f0_local2 = "cg.MP.broShot.showTaunt"
local f0_local3 = {}
local f0_local4 = {}
local f0_local5 = 0
local f0_local6 = {}
local f0_local7 = {}
local f0_local8 = {}
local f0_local9 = function ( f1_arg0 )
	local f1_local0 = ""
	if f1_arg0 == 0 then
		f1_local0 = "war_"
	elseif f1_arg0 == 1 then
		f1_local0 = "heavy_"
	elseif f1_arg0 == 2 then
		f1_local0 = "c6_"
	elseif f1_arg0 == 3 then
		f1_local0 = "ftl_"
	elseif f1_arg0 == 4 then
		f1_local0 = "stryker_"
	else
		f1_local0 = "ghost_"
	end
	return f1_local0
end

local f0_local10 = function ( f2_arg0 )
	local f2_local0 = ""
	if f2_arg0 == 0 then
		f2_local0 = "archetype_assault"
	elseif f2_arg0 == 1 then
		f2_local0 = "archetype_heavy"
	elseif f2_arg0 == 2 then
		f2_local0 = "archetype_scout"
	elseif f2_arg0 == 3 then
		f2_local0 = "archetype_assassin"
	elseif f2_arg0 == 4 then
		f2_local0 = "archetype_engineer"
	else
		f2_local0 = "archetype_sniper"
	end
	return f2_local0
end

local f0_local11 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f0_local4[f3_arg0]
	if f3_local0 == 13 or f3_arg1 and f3_local0 == 8 then
		return "_alt"
	else
		return ""
	end
end

local f0_local12 = function ( f4_arg0 )
	local f4_local0 = f0_local4[f4_arg0]
	if f4_local0 == 0 then
		return "pistol"
	elseif f4_local0 == 1 then
		return "smg"
	elseif f4_local0 == 2 then
		return "assault_rifle"
	elseif f4_local0 == 3 then
		return "lmg"
	elseif f4_local0 == 4 then
		return "sniper"
	elseif f4_local0 == 5 then
		return "shotgun"
	elseif f4_local0 == 6 then
		return "launcher"
	elseif f4_local0 == 7 then
		return "melee"
	elseif f4_local0 == 8 or f4_local0 == 13 then
		return "akimbo"
	elseif f4_local0 == 9 then
		return "knife"
	elseif f4_local0 == 12 then
		return "mp28"
	elseif f4_local0 == 11 then
		return "augfury"
	else
		return "axe"
	end
end

local f0_local13 = function ( f5_arg0 )
	if f5_arg0 == 0 then
		return "iw7_claw_mp_frontend"
	elseif f5_arg0 == 1 then
		return "iw7_steeldragon_mp_frontend"
	elseif f5_arg0 == 2 then
		return "iw7_armmgs_mp_frontend"
	elseif f5_arg0 == 3 then
		return "iw7_atomizer_mp_frontend"
	elseif f5_arg0 == 4 then
		return "iw7_blackholegun_mp_frontend"
	else
		return "iw7_penetrationrail_mp_frontend"
	end
end

local f0_local14 = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	if f6_arg1 < 0 then
		return 
	end
	local f6_local0 = f6_arg1
	local f6_local1 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.index, f6_local0, CSV.taunts.cols.anim )
	local f6_local2 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.index, f6_local0, CSV.taunts.cols.secondPlaceAnim )
	local f6_local3 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.index, f6_local0, CSV.taunts.cols.thirdPlaceAnim )
	if f6_arg0 == 1 and f6_local2 ~= "" then
		f6_local1 = f6_local2
	elseif f6_arg0 == 2 and f6_local3 ~= "" then
		f6_local1 = f6_local3
	end
	local f6_local4 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.index, f6_local0, CSV.taunts.cols.rigRef )
	local f6_local5 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.index, f6_local0, CSV.taunts.cols.altAnimRigRefs )
	local f6_local6 = f0_local3[f6_arg0]
	local f6_local7 = f0_local10( f6_local6 )
	local f6_local8 = Cac.GetAltTauntAnim( f6_local0, f6_local5, false )
	if f6_local8 ~= "" and f6_local5 == f6_local7 then
		f6_local1 = f6_local8
	end
	local f6_local9 = f0_local12( f6_arg0 )
	local f6_local10 = f6_local9 .. "_idle"
	local f6_local11 = f6_local9 .. "_put_away"
	if f6_local6 == 2 then
		f6_local10 = f6_local10 .. "_synaptic"
		f6_local11 = f6_local11 .. "_synaptic"
	end
	local f6_local12 = f0_local11( f6_arg0, f6_local6 == 2 )
	f6_local10 = f6_local10 .. f6_local12
	f6_local11 = f6_local11 .. f6_local12
	local f6_local13 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.ref, f6_local10, CSV.taunts.cols.anim )
	local f6_local14 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.ref, f6_local11, CSV.taunts.cols.anim )
	local f6_local15 = string.gsub( Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.ref, f0_local9( f6_local6 ) .. "idle_0", CSV.taunts.cols.anim ), " ", "" )
	local f6_local16 = string.gsub( Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.ref, "rig_neutral_idle_0", CSV.taunts.cols.anim ), " ", "" )
	local f6_local17 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.index, f6_arg1, CSV.taunts.cols.useGunIdle ) == "Y"
	local f6_local18 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.index, f6_arg1, CSV.taunts.cols.isSupportingAnim ) == "Y"
	if Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.index, f6_local0, CSV.taunts.cols.rigRef ) == "" and not f6_local18 then
		return 
	end
	local f6_local19 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.index, f6_arg1, CSV.taunts.cols.comboPercent )
	local f6_local20 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.index, f6_arg1, CSV.taunts.cols.animFrameCount )
	local f6_local21 = 0
	if f6_local19 ~= "" and f6_local20 ~= "" then
		local f6_local22 = f6_local20 / 30
		if f0_local6[f6_arg0] ~= nil then
			f6_local21 = f6_local19
			f0_local8[f6_arg0] = true
		end
		local f6_local23 = f6_arg3:Wait( f6_local22 * 1000 )
		f0_local6[f6_arg0] = f6_local23
		f6_local23.onComplete = function ()
			if f0_local8[f6_arg0] == nil then
				f0_local6[f6_arg0] = nil
				f0_local7[f6_arg0] = nil
			end
			f0_local8[f6_arg0] = nil
		end
		
	end
	if f6_local18 then
		ClientCharacter.PlayCharacterAnim( f6_arg0, f6_local14, 0.2, nil, f6_arg2 )
		return 
	elseif f6_local1 and f6_local1 ~= "" and f6_local14 and f6_local14 ~= "" and f6_local15 and f6_local15 ~= "" then
		if f6_local17 == false then
			ClientCharacter.SetCharacterWeaponVisible( f6_arg0, false )
		end
		f0_local7[f6_arg0] = f6_local1
		ClientCharacter.PlayCharacterAnim( f6_arg0, f6_local1, 0.2, f6_local21, f6_arg2 )
		if f6_local17 then
			ClientCharacter.QueueCharacterAnim( f6_arg0, f6_local15, nil, 0.2, nil, f6_arg2 )
		else
			ClientCharacter.QueueCharacterAnim( f6_arg0, f6_local16, nil, 0.2, nil, f6_arg2 )
		end
	else
		DebugPrint( "ERROR: - Unable to find an animation with ID csvID in iw7_cosmetic_emotes_loot_master.csv" )
	end
end

local f0_local15 = function ( f8_arg0, f8_arg1, f8_arg2 )
	f0_local4[f8_arg0] = f8_arg1
	f0_local5 = f0_local5 + 1
end

local f0_local16 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	local f9_local0 = string.gsub( Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.ref, f9_arg1, CSV.taunts.cols.anim ), " ", "" )
	if f9_local0 and f9_local0 ~= "" then
		ClientCharacter.PlayCharacterAnim( f9_arg0, f9_local0, f9_arg3, nil, f9_arg2 )
	end
end

local f0_local17 = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = f0_local12( f10_arg0 ) .. "_put_away"
	local f10_local1 = f0_local3[f10_arg0]
	if f10_local1 == 2 then
		f10_local0 = f10_local0 .. "_synaptic"
	end
	f0_local16( f10_arg0, f10_local0 .. f0_local11( f10_arg0, f10_local1 == 2 ), f10_arg2, 0.2 )
end

local f0_local18 = function ( f11_arg0, f11_arg1, f11_arg2 )
	if f11_arg1 < 0 then
		return 
	elseif f11_arg1 == 20001 then
		ClientCharacter.PlayCharacterAnim( 3, "IW7_mp_taunt_drone_crush_04", 0.2, nil, 0 )
		ClientCharacter.PlayCharacterAnim( 4, "IW7_mp_taunt_drone_crush_05", 0.2, nil, 0 )
		ClientCharacter.PlayCharacterAnim( 5, "IW7_mp_taunt_drone_crush_06", 0.2, nil, 0 )
	elseif f11_arg1 == 20002 then
		ClientCharacter.PlayCharacterAnim( 3, "IW7_mp_taunt_crush_the_enemies_04", 0.2, nil, 0 )
		ClientCharacter.PlayCharacterAnim( 4, "IW7_mp_taunt_crush_the_enemies_05", 0.2, nil, 0 )
		ClientCharacter.PlayCharacterAnim( 5, "IW7_mp_taunt_crush_the_enemies_06", 0.2, nil, 0 )
	elseif f11_arg1 == 20003 then
		ClientCharacter.PlayCharacterAnim( 3, "IW7_mp_taunt_dance_lean_01", 0.2, nil, 0 )
		ClientCharacter.PlayCharacterAnim( 4, "IW7_mp_taunt_dance_lean_01", 0.2, nil, 0 )
		ClientCharacter.PlayCharacterAnim( 5, "IW7_mp_taunt_dance_lean_01", 0.2, nil, 0 )
	end
end

local f0_local19 = function ( f12_arg0, f12_arg1, f12_arg2 )
	if f12_arg1 < 0 then
		return 
	else
		ClientCharacter.SetCharacterWeapons( f12_arg0, nil, nil, f12_arg2 )
		ClientCharacter.SetCharacterAkimbo( f12_arg0, false )
		local f12_local0 = f0_local9( f0_local3[f12_arg0] ) .. "transout_0"
		ClientCharacter.SetCharacterWeapons( f12_arg0, f0_local13( f0_local3[f12_arg0] ), nil, f12_arg2 )
		ClientCharacter.SetCharacterWeaponVisible( f12_arg0, false )
		f0_local16( f12_arg0, f12_local0, f12_arg2, 0.2 )
	end
end

local f0_local20 = function ( f13_arg0 )
	local f13_local0 = 0
	for f13_local1 = 0, f0_local0 - 1, 1 do
		if DataModel.GetModelValue( DataModel.GetModel( DataModel.GetModel( DataModel.GetGlobalModel(), "cg.MP.broShot.players." .. f13_local1 ), "shouldShow" ) ) then
			f13_local0 = f13_local0 + 1
		end
	end
	if f13_arg0.isSplitscreen then
		f13_local0 = f13_local0 * 2
	end
	return f0_local5 == f13_local0
end

local f0_local21 = function ( f14_arg0, f14_arg1, f14_arg2 )
	local f14_local0 = DataModel.GetModel( DataModel.GetGlobalModel(), f14_arg1 )
	if DataModel.GetModelValue( DataModel.GetModel( f14_local0, "shouldShow" ) ) then
		local f14_local1 = DataModel.GetModel( f14_local0, "headIndex" )
		local f14_local2 = DataModel.GetModel( f14_local0, "bodyIndex" )
		local f14_local3 = DataModel.GetModel( f14_local0, "rigIndex" )
		local f14_local4 = DataModel.GetModelValue( f14_local1 )
		local f14_local5 = DataModel.GetModelValue( f14_local2 )
		local f14_local6 = DataModel.GetModelValue( f14_local3 )
		local f14_local7 = Engine.TableLookup( CSV.heads.file, CSV.heads.cols.index, f14_local4, CSV.heads.cols.model )
		local f14_local8 = Engine.TableLookup( CSV.bodies.file, CSV.bodies.cols.index, f14_local5, CSV.bodies.cols.model )
		local f14_local9 = DataModel.GetModelValue( DataModel.GetModel( f14_local0, "weapon" ) )
		if f14_local9 == "iw7_armmgs_mp_frontend" then
			f14_local9 = ""
		end
		ClientCharacter.SetCharacterRotation( f14_arg0, 0, 0, 0 )
		ClientCharacter.SetCharacterWeapons( f14_arg0, f14_local9, nil, f14_arg2 )
		ClientCharacter.SetCharacterAkimbo( f14_arg0, string.find( f14_local9, "akimbo" ) ~= nil )
		ClientCharacter.SetCharacterModels( f14_arg0, f14_local8, f14_local7, nil, nil, nil, nil, nil, nil, f14_arg2 )
		if not ClientCharacter.GetCharacterLoaded( f14_arg0, f14_arg2 ) then
			DebugPrint( "ERROR: - Character Not Loaded for index " .. f14_arg0 )
		end
		ClientCharacter.SetCharacterVisible( f14_arg0, true, f14_arg2 )
		f0_local3[f14_arg0] = f14_local6
		local f14_local10 = f0_local12( f14_arg0 )
		local f14_local11 = f14_local10 .. "_idle"
		local f14_local12 = f14_local10 .. "_walk_to_stop"
		local f14_local13 = f0_local3[f14_arg0]
		if f14_local13 == 2 then
			f14_local11 = f14_local11 .. "_synaptic"
			f14_local12 = f14_local12 .. "_synaptic"
		end
		f14_local11 = f14_local11 .. f0_local11( f14_arg0, f14_local13 == 2 )
		f14_local12 = f14_local12 .. f0_local11( f14_arg0, f14_local13 == 2 )
		local f14_local14 = string.gsub( Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.ref, f14_local11, CSV.taunts.cols.anim ), " ", "" )
		ClientCharacter.PlayCharacterAnim( f14_arg0, string.gsub( Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.ref, f14_local12, CSV.taunts.cols.anim ), " ", "" ), 0, f14_arg0 * 0.08, f14_arg2 )
		ClientCharacter.QueueCharacterAnim( f14_arg0, f14_local14, nil, 0.2, nil, f14_arg2 )
		ClientCharacter.SetCharacterWeaponVisible( f14_arg0, true )
		local f14_local15 = "iw7_mp_frontend_facial_loop01"
		if f14_local15 and f14_local15 ~= "" then
			ClientCharacter.PlayCharacterFacialAnim( f14_arg0, f14_local15 )
		end
	else
		ClientCharacter.SetCharacterVisible( f14_arg0, false, f14_arg2 )
	end
end

local f0_local22 = function ( f15_arg0 )
	for f15_local0 = 0, f0_local0 - 1, 1 do
		f0_local21( f15_local0, "cg.MP.broShot.players." .. f15_local0, f15_arg0 )
	end
end

local f0_local23 = function ( f16_arg0, f16_arg1 )
	f16_arg0.Playercard:SubscribeToModelThroughElement( f16_arg0.Playercard, "shouldShow", function ()
		local f17_local0 = f16_arg0.Playercard:GetDataSource()
		f17_local0 = f17_local0.shouldShow:GetValue( f16_arg1 )
		local f17_local1 = f16_arg0.Playercard
		local f17_local2 = f17_local1
		f17_local1 = f17_local1.SetAlpha
		local f17_local3
		if f17_local0 then
			f17_local3 = 1
			if not f17_local3 then
			
			else
				f17_local1( f17_local2, f17_local3, 0 )
				f17_local1 = f16_arg0.Place
				f17_local2 = f17_local1
				f17_local1 = f17_local1.SetAlpha
				if f17_local0 then
					f17_local3 = 1
					if not f17_local3 then
					
					else
						f17_local1( f17_local2, f17_local3, 0 )
					end
				end
				f17_local3 = 0
			end
		end
		f17_local3 = 0
	end )
end

local f0_local24 = function ( f18_arg0 )
	return function ( f19_arg0 )
		if f19_arg0 and 0 <= f19_arg0 then
			return f18_arg0( f19_arg0 )
		else
			return ""
		end
	end
	
end

local f0_local25 = function ( f20_arg0, f20_arg1 )
	local f20_local0 = {}
	for f20_local1 = 0, f0_local0 - 1, 1 do
		local f20_local4 = f0_local1 .. "." .. f20_local1
		local f20_local5 = LUI.DataSourceInGlobalModel.new( f20_local4 .. ".backgroundIndex" )
		local f20_local6 = LUI.DataSourceInGlobalModel.new( f20_local4 .. ".clanTag" )
		local f20_local7 = LUI.DataSourceInGlobalModel.new( f20_local4 .. ".name" )
		local f20_local8 = LUI.DataSourceInGlobalModel.new( f20_local4 .. ".rank" )
		local f20_local9 = LUI.DataSourceInGlobalModel.new( f20_local4 .. ".prestige" )
		f20_local0[f20_local1 + 1] = {
			shouldShow = LUI.DataSourceInGlobalModel.new( f20_local4 .. ".shouldShow" ),
			xuid = LUI.DataSourceInGlobalModel.new( f20_local4 .. ".xuidString" ),
			clanTag = f20_local6,
			gamertag = f20_local7,
			displayRank = LUI.AggregateDataSource.new( f20_local8, {
				f20_local8,
				f20_local9
			}, "display", Rank.MakeRankDisplayAggregateFunction( f20_local8, f20_local9, true ) ),
			rankIcon = LUI.AggregateDataSource.new( f20_local8, {
				f20_local8,
				f20_local9
			}, "rankIcon", Rank.MakeRankIconAggregateFunction( f20_local8, f20_local9 ) ),
			isMasterPrestige = f20_local9:Filter( "isMasterPrestige", Rank.IsMasterPrestige ),
			emblem = LUI.DataSourceInGlobalModel.new( f20_local4 .. ".emblem" ),
			customEmblemEquipped = LUI.DataSourceInGlobalModel.new( f20_local4 .. ".customEmblemEquipped" ),
			backgroundIndex = f20_local5,
			background = f20_local5:Filter( "texture", CallingCardUtils.GetCardTexture ),
			fullName = LUI.AggregateDataSource.new( f20_local7, {
				f20_local6,
				f20_local7
			}, "fullName", function ()
				local f21_local0 = f20_local6:GetValue( f20_arg1 )
				local f21_local1 = f20_local7:GetValue( f20_arg1 )
				if f21_local0 and #f21_local0 > 0 then
					return "[" .. f21_local0 .. "]" .. f21_local1
				else
					return f21_local1
				end
			end
			 )
		}
	end
	f0_local23( f20_arg0.FirstPlace, f20_arg1 )
	f0_local23( f20_arg0.SecondPlace, f20_arg1 )
	f0_local23( f20_arg0.ThirdPlace, f20_arg1 )
	f20_arg0.FirstPlace.Playercard:SetDataSource( f20_local0[1], f20_arg1 )
	f20_arg0.SecondPlace.Playercard:SetDataSource( f20_local0[2], f20_arg1 )
	f20_arg0.ThirdPlace.Playercard:SetDataSource( f20_local0[3], f20_arg1 )
	if Game.GetOmnvar( "ui_broshot_upside_down" ) then
		f20_arg0.FirstPlace:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -240, _1080p * 180, _1080p * -210, _1080p * -40 )
		f20_arg0.ThirdPlace:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -700, _1080p * -280, _1080p * -275, _1080p * -105 )
		f20_arg0.SecondPlace:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 220, _1080p * 640, _1080p * -275, _1080p * -105 )
	end
	ACTIONS.AnimateSequenceByElement( f20_arg0, {
		elementName = "FirstPlace",
		sequenceName = "FirstPlace",
		elementPath = "FirstPlace"
	} )
end

local f0_local26 = function ( f22_arg0 )
	ACTIONS.AnimateSequence( f22_arg0, "Outro" )
	ClientCharacter.SetCharacterWeaponVisible( 0, true )
	ClientCharacter.SetCharacterWeaponVisible( 1, true )
	ClientCharacter.SetCharacterWeaponVisible( 2, true )
end

local f0_local27 = function ( f23_arg0, f23_arg1 )
	local f23_local0 = Game.GetTeamScore( Teams.allies )
	local f23_local1 = Game.GetTeamScore( Teams.axis )
	if GameX.gameModeIsFFA( GameX.GetGameMode() ) or f23_local0 == f23_local1 then
		return Teams.free
	else
		local f23_local2
		if f23_local1 < f23_local0 then
			f23_local2 = Teams.allies
			if not f23_local2 then
			
			else
				return f23_local2
			end
		end
	end
	f23_local2 = Teams.axis
end

local f0_local28 = function ( f24_arg0, f24_arg1 )
	local f24_local0 = f24_arg0.winningTeam
	local f24_local1 = true
	MLG.SetThirdPerson( false )
	local f24_local2 = f24_arg0:Wait( 1500 )
	f24_local2.onComplete = function ()
		f24_arg0.Title:setText( ToUpperCase( Engine.Localize( "MP_INGAME_ONLY_BROSHOT_TITLE" ) ), 0 )
		if f24_arg0.isSplitscreen then
			f24_arg0.Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * 60, _1080p * 120 )
			f24_arg0.Title:SetAlignment( LUI.Alignment.Left )
			ACTIONS.AnimateSequence( f24_arg0, "Intro_Splitscreen" )
		else
			ACTIONS.AnimateSequence( f24_arg0, "Intro" )
		end
		f24_arg0.Title:SetAlpha( 1, 0 )
		if f24_local0 ~= Teams.free then
			if f24_local0 == Teams.allies then
				f24_arg0.TeamLogo:setImage( RegisterMaterial( TeamLogos.allies ), 0 )
				f24_arg0.TeamWatermark:setImage( RegisterMaterial( "icon_faction_watermark_unsa" ), 0 )
				f24_arg0.TeamWatermark2:setImage( RegisterMaterial( "icon_faction_watermark_unsa" ), 0 )
			elseif f24_local0 == Teams.axis then
				f24_arg0.TeamLogo:setImage( RegisterMaterial( TeamLogos.axis ), 0 )
				f24_arg0.TeamWatermark:setImage( RegisterMaterial( "icon_faction_watermark_sdf" ), 0 )
				f24_arg0.TeamWatermark2:setImage( RegisterMaterial( "icon_faction_watermark_sdf" ), 0 )
			end
			if CODCASTER.IsCODCaster() and CODCASTER.CanCODCast() then
				f24_arg0.TeamWatermark:SetAlpha( 0 )
				f24_arg0.TeamWatermark2:SetAlpha( 0 )
				if f24_local0 == Teams.allies then
					f24_arg0.codCasterLogo = RegisterMaterial( CODCASTER.GetTeam1LogoMaterial( f24_arg1 ) )
					f24_arg0.codcasterTeamName = CODCASTER.GetTeam1Name( f24_arg1, f24_arg0.winningTeam )
				elseif f24_local0 == Teams.axis then
					f24_arg0.codCasterLogo = RegisterMaterial( CODCASTER.GetTeam2LogoMaterial( f24_arg1 ) )
					f24_arg0.codcasterTeamName = CODCASTER.GetTeam2Name( f24_arg1 )
				end
				f24_arg0.CodcasterTeamName:setText( f24_arg0.codcasterTeamName, 0 )
				local f25_local0, f25_local1, f25_local2, f25_local3 = f24_arg0.CodcasterTeamName:getLocalRect()
				CODCASTER.ResizeTeamNameText( f24_arg0.CodcasterTeamName, f25_local1 )
				f24_arg0.CodcasterTeamName:SetAlpha( 1 )
				f24_arg0.TeamLogo:setImage( f24_arg0.codCasterLogo, 0 )
				f24_arg0._sequences.ShowTeam = function ()
					f24_arg0.TeamLogo:AnimateSequence( "ShowTeam" )
				end
				
				if not MLG.ShoutcasterProfileVarBool( f24_arg1, "shoutcaster_team_identity" ) then
					f24_arg0.CodcasterTeamName:SetAlpha( 0 )
					f24_local1 = false
				end
			end
			if f24_arg0.isSplitscreen then
				f24_arg0._sequences.ShowTeam_Splitscreen()
			elseif f24_local1 then
				f24_arg0._sequences.ShowTeam()
			end
		end
		if DataModel.GetModelValue( DataModel.GetModel( DataModel.GetModelForController( f24_arg1 ), f0_local2 ) ) then
			local f25_local3 = f24_arg0:Wait( 600 )
			f25_local3.onComplete = function ()
				f24_arg0.TauntInstructions:SetAlpha( 1, 400 )
			end
			
		end
		if 1 ~= Game.GetOmnvar( "ui_broshot_debug" ) then
			f24_local2 = f24_arg0:Wait( 10500 )
			f24_local2.onComplete = function ()
				f0_local26( f24_arg0 )
				if CODCASTER.IsCODCaster() then
					f24_arg0.CodcasterTeamName:SetAlpha( 0 )
				end
			end
			
		end
	end
	
end

local f0_local29 = function ( f29_arg0, f29_arg1 )
	local f29_local0 = f29_arg0:Wait( 50 )
	f29_local0.onComplete = function ()
		if f0_local20( f29_arg0 ) then
			f0_local22( f29_arg1 )
			f0_local25( f29_arg0, f29_arg1 )
			f0_local28( f29_arg0, f29_arg1 )
		else
			StartWhenReady( f29_arg0, f29_arg1 )
		end
	end
	
end

local f0_local30 = function ( f31_arg0, f31_arg1, f31_arg2 )
	assert( f31_arg0.Title, "WARNING: Broshot Items Are Missing..." )
	f31_arg0.winningTeam = f0_local27( f31_arg0, f31_arg1 )
	f31_arg0.isSplitscreen = CONDITIONS.IsSplitscreen()
	if not f31_arg0.isSplitscreen then
		f31_arg0:setupLetterboxElement( true )
	end
	f31_arg0.TauntInstructions:SetAlpha( 0, 0 )
	f31_arg0.Title:SetShadowUOffset( -0 )
	f31_arg0.Title:SetShadowVOffset( -0 )
	if CONDITIONS.IsJapanese( f31_arg0 ) then
		ACTIONS.AnimateSequence( f31_arg0, "SmallerText" )
	end
	local f31_local0 = LUI.DataSourceInGlobalModel.new( "cg.MP.broShot.players.notify" )
	f31_arg0:SubscribeToModel( f31_local0:GetModel( f31_arg1 ), function ()
		f0_local29( f31_arg0, f31_arg1 )
	end, true )
	for f31_local1 = 0, f0_local0 - 1, 1 do
		local f31_local4 = f31_local1
		f31_arg0:registerOmnvarHandler( "ui_broshot_anim_" .. f31_local4, function ( f33_arg0, f33_arg1 )
			if f33_arg1.value < 0 then
				f0_local17( f31_local4, f33_arg1.value, f31_arg1 )
			elseif f33_arg1.value < 20000 then
				f0_local14( f31_local4, f33_arg1.value, f31_arg1, f31_arg0 )
			elseif f33_arg1.value < 30000 then
				f0_local18( f31_local4, f33_arg1.value, f31_arg1, f31_arg0 )
			else
				f0_local19( f31_local4, f33_arg1.value, f31_arg1 )
			end
		end )
		f31_arg0:registerOmnvarHandler( "ui_broshot_weapon_type_" .. f31_local4, function ( f34_arg0, f34_arg1 )
			f0_local15( f31_local4, f34_arg1.value, f31_arg1 )
		end )
	end
end

function Broshot( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "Broshot"
	self._animationSets = {}
	self._sequences = {}
	local f35_local1 = controller and controller.controllerIndex
	if not f35_local1 and not Engine.InFrontend() then
		f35_local1 = self:getRootController()
	end
	assert( f35_local1 )
	self:playSound( "menu_open" )
	local f35_local2 = self
	local FirstPlace = nil
	
	FirstPlace = MenuBuilder.BuildRegisteredType( "BroshotPlayercard", {
		controllerIndex = f35_local1
	} )
	FirstPlace.id = "FirstPlace"
	FirstPlace.Place:setText( Engine.Localize( "LUA_MENU_1ST" ), 0 )
	FirstPlace:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -240, _1080p * 180, _1080p * -355, _1080p * -185 )
	self:addElement( FirstPlace )
	self.FirstPlace = FirstPlace
	
	local SecondPlace = nil
	
	SecondPlace = MenuBuilder.BuildRegisteredType( "BroshotPlayercard", {
		controllerIndex = f35_local1
	} )
	SecondPlace.id = "SecondPlace"
	SecondPlace.Place:setText( Engine.Localize( "LUA_MENU_2ND" ), 0 )
	SecondPlace:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -700, _1080p * -280, _1080p * -275, _1080p * -105 )
	self:addElement( SecondPlace )
	self.SecondPlace = SecondPlace
	
	local ThirdPlace = nil
	
	ThirdPlace = MenuBuilder.BuildRegisteredType( "BroshotPlayercard", {
		controllerIndex = f35_local1
	} )
	ThirdPlace.id = "ThirdPlace"
	ThirdPlace.Place:setText( Engine.Localize( "LUA_MENU_3RD" ), 0 )
	ThirdPlace:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 220, _1080p * 640, _1080p * -275, _1080p * -105 )
	self:addElement( ThirdPlace )
	self.ThirdPlace = ThirdPlace
	
	local Title = nil
	
	Title = LUI.UIStyledText.new()
	Title.id = "Title"
	Title:setText( ToUpperCase( "" ), 0 )
	Title:SetFontSize( 90 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Title:SetAlignment( LUI.Alignment.Center )
	Title:SetShadowMinDistance( -0.01, 0 )
	Title:SetShadowMaxDistance( 0.01, 0 )
	Title:SetShadowRGBFromInt( 0, 0 )
	Title:SetDecodeLetterLength( 30 )
	Title:SetDecodeMaxRandChars( 6 )
	Title:SetDecodeUpdatesPerLetter( 4 )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * 60, _1080p * 180 )
	self:addElement( Title )
	self.Title = Title
	
	local TeamLogo = nil
	
	TeamLogo = LUI.UIImage.new()
	TeamLogo.id = "TeamLogo"
	TeamLogo:setImage( RegisterMaterial( "icon_faction_sdf_bw" ), 0 )
	TeamLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 141.5, _1080p * 397.5, _1080p * 35, _1080p * 291 )
	self:addElement( TeamLogo )
	self.TeamLogo = TeamLogo
	
	local TeamWatermark2 = nil
	
	TeamWatermark2 = LUI.UIImage.new()
	TeamWatermark2.id = "TeamWatermark2"
	TeamWatermark2:SetRGBFromInt( 0, 0 )
	TeamWatermark2:setImage( RegisterMaterial( "icon_faction_watermark_unsa" ), 0 )
	TeamWatermark2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 191, _1080p * 348, _1080p * 296, _1080p * 338 )
	self:addElement( TeamWatermark2 )
	self.TeamWatermark2 = TeamWatermark2
	
	local TeamWatermark = nil
	
	TeamWatermark = LUI.UIImage.new()
	TeamWatermark.id = "TeamWatermark"
	TeamWatermark:setImage( RegisterMaterial( "icon_faction_watermark_unsa" ), 0 )
	TeamWatermark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 191, _1080p * 348, _1080p * 296, _1080p * 338 )
	self:addElement( TeamWatermark )
	self.TeamWatermark = TeamWatermark
	
	local TauntInstructions = nil
	
	TauntInstructions = MenuBuilder.BuildRegisteredType( "BroshotTaunt", {
		controllerIndex = f35_local1
	} )
	TauntInstructions.id = "TauntInstructions"
	TauntInstructions:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -700, _1080p * -100, _1080p * 155, _1080p * 301 )
	self:addElement( TauntInstructions )
	self.TauntInstructions = TauntInstructions
	
	local CodcasterTeamName = nil
	
	CodcasterTeamName = LUI.UIText.new()
	CodcasterTeamName.id = "CodcasterTeamName"
	CodcasterTeamName:SetAlpha( 0, 0 )
	CodcasterTeamName:setText( Engine.Localize( "MENU_NEW" ), 0 )
	CodcasterTeamName:SetFontSize( 45 * _1080p )
	CodcasterTeamName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CodcasterTeamName:SetAlignment( LUI.Alignment.Center )
	CodcasterTeamName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 435, _1080p * 291, _1080p * 338 )
	self:addElement( CodcasterTeamName )
	self.CodcasterTeamName = CodcasterTeamName
	
	self._animationSets.DefaultAnimationSet = function ()
		FirstPlace:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FirstPlace:SetAlpha( 0, 0 )
				end
			}
		} )
		SecondPlace:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.SecondPlace:SetAlpha( 0, 0 )
				end
			}
		} )
		ThirdPlace:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ThirdPlace:SetAlpha( 0, 0 )
				end
			}
		} )
		Title:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Title:SetAlpha( 0, 0 )
				end
			}
		} )
		TeamLogo:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TeamLogo:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.TeamLogo:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.TeamLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 141.5, _1080p * 397.5, _1080p * 35, _1080p * 291, 0 )
				end
			}
		} )
		TeamWatermark2:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TeamWatermark2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.TeamWatermark2:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.TeamWatermark2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 191, _1080p * 348, _1080p * 296, _1080p * 338, 0 )
				end
			}
		} )
		TeamWatermark:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TeamWatermark:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.TeamWatermark:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.TeamWatermark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 191, _1080p * 348, _1080p * 296, _1080p * 338, 0 )
				end
			}
		} )
		TauntInstructions:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TauntInstructions:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			FirstPlace:AnimateSequence( "DefaultSequence" )
			SecondPlace:AnimateSequence( "DefaultSequence" )
			ThirdPlace:AnimateSequence( "DefaultSequence" )
			Title:AnimateSequence( "DefaultSequence" )
			TeamLogo:AnimateSequence( "DefaultSequence" )
			TeamWatermark2:AnimateSequence( "DefaultSequence" )
			TeamWatermark:AnimateSequence( "DefaultSequence" )
			TauntInstructions:AnimateSequence( "DefaultSequence" )
		end
		
		FirstPlace:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.FirstPlace:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FirstPlace:SetAlpha( 0, 100 )
				end,
				function ()
					return self.FirstPlace:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.FirstPlace:SetScale( 1, 0 )
				end,
				function ()
					return self.FirstPlace:SetScale( 1, 100 )
				end,
				function ()
					return self.FirstPlace:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		SecondPlace:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.SecondPlace:SetScale( 1, 0 )
				end,
				function ()
					return self.SecondPlace:SetScale( 1, 250 )
				end,
				function ()
					return self.SecondPlace:SetScale( 0, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.SecondPlace:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SecondPlace:SetAlpha( 0, 250 )
				end,
				function ()
					return self.SecondPlace:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			}
		} )
		ThirdPlace:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.ThirdPlace:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ThirdPlace:SetAlpha( 0, 400 )
				end,
				function ()
					return self.ThirdPlace:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ThirdPlace:SetScale( 1, 0 )
				end,
				function ()
					return self.ThirdPlace:SetScale( 1, 400 )
				end,
				function ()
					return self.ThirdPlace:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Intro = function ()
			FirstPlace:AnimateSequence( "Intro" )
			SecondPlace:AnimateSequence( "Intro" )
			ThirdPlace:AnimateSequence( "Intro" )
		end
		
		TeamLogo:RegisterAnimationSequence( "ShowTeam", {
			{
				function ()
					return self.TeamLogo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TeamLogo:SetAlpha( 0, 150 )
				end,
				function ()
					return self.TeamLogo:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		TeamWatermark2:RegisterAnimationSequence( "ShowTeam", {
			{
				function ()
					return self.TeamWatermark2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TeamWatermark2:SetAlpha( 0, 200 )
				end,
				function ()
					return self.TeamWatermark2:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		TeamWatermark:RegisterAnimationSequence( "ShowTeam", {
			{
				function ()
					return self.TeamWatermark:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TeamWatermark:SetAlpha( 0, 200 )
				end,
				function ()
					return self.TeamWatermark:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ShowTeam = function ()
			TeamLogo:AnimateSequence( "ShowTeam" )
			TeamWatermark2:AnimateSequence( "ShowTeam" )
			TeamWatermark:AnimateSequence( "ShowTeam" )
		end
		
		FirstPlace:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.FirstPlace:SetAlpha( 0, 500 )
				end
			}
		} )
		SecondPlace:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.SecondPlace:SetAlpha( 0, 500 )
				end
			}
		} )
		ThirdPlace:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.ThirdPlace:SetAlpha( 0, 500 )
				end
			}
		} )
		Title:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Title:SetAlpha( 0, 500 )
				end
			}
		} )
		TeamLogo:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.TeamLogo:SetAlpha( 0, 500 )
				end
			}
		} )
		TeamWatermark2:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.TeamWatermark2:SetAlpha( 0, 500 )
				end
			}
		} )
		TeamWatermark:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.TeamWatermark:SetAlpha( 0, 500 )
				end
			}
		} )
		TauntInstructions:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.TauntInstructions:SetAlpha( 0, 500 )
				end
			}
		} )
		self._sequences.Outro = function ()
			FirstPlace:AnimateSequence( "Outro" )
			SecondPlace:AnimateSequence( "Outro" )
			ThirdPlace:AnimateSequence( "Outro" )
			Title:AnimateSequence( "Outro" )
			TeamLogo:AnimateSequence( "Outro" )
			TeamWatermark2:AnimateSequence( "Outro" )
			TeamWatermark:AnimateSequence( "Outro" )
			TauntInstructions:AnimateSequence( "Outro" )
		end
		
		TeamLogo:RegisterAnimationSequence( "ShowTeam_Splitscreen", {
			{
				function ()
					return self.TeamLogo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TeamLogo:SetAlpha( 0, 150 )
				end,
				function ()
					return self.TeamLogo:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.TeamLogo:SetScale( -0.5, 0 )
				end
			},
			{
				function ()
					return self.TeamLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 68, _1080p * 324, _1080p * 56, _1080p * 312, 0 )
				end
			}
		} )
		TeamWatermark2:RegisterAnimationSequence( "ShowTeam_Splitscreen", {
			{
				function ()
					return self.TeamWatermark2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TeamWatermark2:SetAlpha( 0, 200 )
				end,
				function ()
					return self.TeamWatermark2:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.TeamWatermark2:SetScale( -0.5, 0 )
				end
			},
			{
				function ()
					return self.TeamWatermark2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 117.5, _1080p * 274.5, _1080p * 243, _1080p * 285, 0 )
				end
			}
		} )
		TeamWatermark:RegisterAnimationSequence( "ShowTeam_Splitscreen", {
			{
				function ()
					return self.TeamWatermark:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TeamWatermark:SetAlpha( 0, 200 )
				end,
				function ()
					return self.TeamWatermark:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.TeamWatermark:SetScale( -0.5, 0 )
				end
			},
			{
				function ()
					return self.TeamWatermark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 117.5, _1080p * 274.5, _1080p * 243, _1080p * 285, 0 )
				end
			}
		} )
		self._sequences.ShowTeam_Splitscreen = function ()
			TeamLogo:AnimateSequence( "ShowTeam_Splitscreen" )
			TeamWatermark2:AnimateSequence( "ShowTeam_Splitscreen" )
			TeamWatermark:AnimateSequence( "ShowTeam_Splitscreen" )
		end
		
		FirstPlace:RegisterAnimationSequence( "Intro_Splitscreen", {
			{
				function ()
					return self.FirstPlace:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FirstPlace:SetAlpha( 0, 100 )
				end,
				function ()
					return self.FirstPlace:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.FirstPlace:SetScale( 1, 0 )
				end,
				function ()
					return self.FirstPlace:SetScale( 1, 100 )
				end,
				function ()
					return self.FirstPlace:SetScale( 0, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.FirstPlace:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -240, _1080p * 180, _1080p * -280, _1080p * -110, 0 )
				end
			}
		} )
		SecondPlace:RegisterAnimationSequence( "Intro_Splitscreen", {
			{
				function ()
					return self.SecondPlace:SetScale( 1, 0 )
				end,
				function ()
					return self.SecondPlace:SetScale( 1, 250 )
				end,
				function ()
					return self.SecondPlace:SetScale( 0, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.SecondPlace:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SecondPlace:SetAlpha( 0, 250 )
				end,
				function ()
					return self.SecondPlace:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.SecondPlace:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -700, _1080p * -280, _1080p * -200, _1080p * -30, 0 )
				end
			}
		} )
		ThirdPlace:RegisterAnimationSequence( "Intro_Splitscreen", {
			{
				function ()
					return self.ThirdPlace:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ThirdPlace:SetAlpha( 0, 400 )
				end,
				function ()
					return self.ThirdPlace:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ThirdPlace:SetScale( 1, 0 )
				end,
				function ()
					return self.ThirdPlace:SetScale( 1, 400 )
				end,
				function ()
					return self.ThirdPlace:SetScale( 0, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ThirdPlace:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 220, _1080p * 640, _1080p * -200, _1080p * -30, 0 )
				end
			}
		} )
		self._sequences.Intro_Splitscreen = function ()
			FirstPlace:AnimateSequence( "Intro_Splitscreen" )
			SecondPlace:AnimateSequence( "Intro_Splitscreen" )
			ThirdPlace:AnimateSequence( "Intro_Splitscreen" )
		end
		
		Title:RegisterAnimationSequence( "SmallerText", {
			{
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 100, _1080p * -100, _1080p * 60, _1080p * 150, 0 )
				end
			}
		} )
		self._sequences.SmallerText = function ()
			Title:AnimateSequence( "SmallerText" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f130_arg0, f130_arg1 )
		f130_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_CONTINUE" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_primary", function ( f131_arg0, f131_arg1 )
		local f131_local0 = f131_arg1.controller or f35_local1
		ACTIONS.AdvancePostGame( self )
		return true
	end )
	f0_local30( self, f35_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "Broshot", Broshot )
LockTable( _M )
