// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    precachestring( &"CP_MERIT_COMPLETED" );

    if ( !_id_B4E9() )
        return;

    level._id_B682 = [];
    _id_DEFE( "enemyKilled", ::_id_BD74 );
    level thread _id_C56E();
}

_id_B4E9()
{
    if ( level.onlinegame && !scripts\cp\zombies\direct_boss_fight::should_directly_go_to_boss_fight() )
        return 1;

    return 0;
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isdefined( var_0.pers["postGameMerits"] ) )
            var_0.pers["postGameMerits"] = 0;

        var_0 thread _id_989A();

        if ( isai( var_0 ) )
            continue;

        var_0 thread _id_B9B2();
    }
}

_id_989A()
{
    self.pers["lastBulletKillTime"] = 0;
    self.pers["bulletStreak"] = 0;
    self._id_6A00 = [];
}

_id_DEFE( var_0, var_1 )
{
    if ( !isdefined( level._id_B682[var_0] ) )
        level._id_B682[var_0] = [];

    level._id_B682[var_0][level._id_B682[var_0].size] = var_1;
}

_id_7FB3( var_0 )
{
    if ( isdefined( self._id_B683[var_0] ) )
        return self._id_B683[var_0];
    else
        return 0;
}

_id_BD74( var_0, var_1 )
{
    var_2 = var_0.attacker;
    var_3 = var_0.victim;

    if ( !isdefined( var_2 ) || !isplayer( var_2 ) )
        return;

    var_2 _id_D9AD( "mt_kills" );
}

_id_6563( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "disconnect" );
    var_8 = spawnstruct();
    var_8.victim = self;
    var_8.einflictor = var_0;
    var_8.attacker = var_1;
    var_8.idamage = var_2;
    var_8.smeansofdeath = var_3;
    var_8.sweapon = var_4;
    var_8.sprimaryweapon = var_5;
    var_8.shitloc = var_6;
    var_8.time = gettime();
    var_8._id_B930 = var_7;
    var_8._id_1337E = var_8.victim isonground();
    _id_5905( "enemyKilled", var_8 );
    var_8.attacker notify( "playerKilledMeritsProcessed" );
}

_id_5905( var_0, var_1 )
{
    if ( !_id_B4E9() )
        return;

    if ( isdefined( var_1 ) )
    {
        var_2 = var_1.player;

        if ( !isdefined( var_2 ) )
            var_2 = var_1.attacker;

        if ( isdefined( var_2 ) && isai( var_2 ) )
            return;
    }

    if ( getdvarint( "disable_merits" ) > 0 )
        return;

    if ( !isdefined( level._id_B682[var_0] ) )
        return;

    if ( isdefined( var_1 ) )
    {
        for ( var_3 = 0; var_3 < level._id_B682[var_0].size; var_3++ )
            thread [[ level._id_B682[var_0][var_3] ]]( var_1 );
    }
    else
    {
        for ( var_3 = 0; var_3 < level._id_B682[var_0].size; var_3++ )
            thread [[ level._id_B682[var_0][var_3] ]]();
    }
}

_id_D95D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( !isplayer( var_1 ) )
    {
        if ( isdefined( var_1.owner ) && isplayer( var_1.owner ) )
            var_1 = var_1.owner;
        else
            return;
    }

    var_9 = _id_0A77::_id_821F( var_4 );
    var_10 = scripts\engine\utility::_id_9CEE( var_1._id_98F3 );
    var_11 = scripts\engine\utility::_id_9D74( var_3 );
    var_12 = var_1 getstance();
    var_13 = self._id_1096F;
    var_14 = var_12 == "crouch";
    var_15 = var_12 == "prone" && !var_10;
    var_16 = isexplosivedamagemod( var_3 );
    var_17 = var_3 == "MOD_MELEE";
    var_18 = ( scripts\engine\utility::_id_9CEE( self._id_9B81 ) || scripts\engine\utility::_id_9CEE( self._id_9B8A ) ) && ( !var_11 || var_4 == "incendiary_ammo_mp" );
    var_19 = scripts\engine\utility::_id_9CEE( self._id_565C );
    var_20 = scripts\engine\utility::_id_9CEE( self.shockmelee );
    var_21 = var_1 _meth_81BE();
    var_22 = scripts\engine\utility::_id_9CEE( self.faf_burned_out );

    if ( isdefined( var_0.owner ) )
        var_23 = var_1 _id_0A77::_id_9CEB( var_0, var_4 ) && var_0.owner == var_1;
    else
        var_23 = var_1 _id_0A77::_id_9CEB( var_0, var_4 );

    var_24 = 0;

    foreach ( var_26 in getarraykeys( level._id_1BED ) )
    {
        if ( _id_0A77::_id_80D8( var_4 ) == var_26 )
        {
            if ( getdvar( "ui_mapname" ) == "cp_final" && var_26 == "arclassic" )
                var_24 = 0;
            else
                var_24 = 1;

            break;
        }
    }

    var_28 = isdefined( var_4 ) && ( var_4 == "iw7_dischorddummy_zm" || var_4 == "iw7_facemelterdummy_zm" || var_4 == "iw7_headcutterdummy_zm" || var_4 == "iw7_shredderdummy_zm" );
    var_29 = isdefined( var_4 ) && issubstr( var_4, "venomx" );
    var_30 = isdefined( var_4 ) && ( var_4 == "iw7_entangler2_zm" || var_4 == "ghost_grenade_launcher" );
    var_31 = undefined;

    if ( isdefined( var_4 ) )
        var_31 = _id_0A77::_id_80D8( var_4 );

    var_32 = isdefined( var_31 ) && ( var_31 == "harpoon1" || var_31 == "harpoon2" || var_31 == "harpoon3" || var_31 == "harpoon4" );

    if ( var_24 )
    {
        if ( issubstr( var_4, "g18_" ) )
            var_24 = isdefined( var_1._id_8BA0 );

        if ( isdefined( var_1.pap2_card_weapon ) && var_4 == var_1.pap2_card_weapon )
            var_24 = 0;
    }

    if ( var_16 )
    {
        if ( issubstr( var_4, "shuriken" ) )
            var_16 = 0;
        else if ( scripts\engine\utility::_id_9CEE( var_1.kung_fu_mode ) )
            var_16 = 0;
    }

    var_33 = issubstr( var_4, "longshot" );
    var_34 = var_1 _id_0A77::_id_4626( var_4 ) == "weapon_sniper" && var_11;
    var_35 = var_11 && _id_0A77::isheadshot( var_4, var_6, var_3, var_1 ) && !var_29;
    var_36 = issubstr( var_4, "m8" );

    if ( !var_17 )
    {
        switch ( var_9 )
        {
            case "weapon_assault":
                var_1 _id_D9AD( "mt_ar_kills" );
                break;
            case "weapon_smg":
                var_1 _id_D9AD( "mt_smg_kills" );
                break;
            case "weapon_lmg":
                var_1 _id_D9AD( "mt_lmg_kills" );
                break;
            case "weapon_shotgun":
                var_1 _id_D9AD( "mt_shotgun_kills" );
                break;
            case "weapon_sniper":
                if ( !var_33 && !var_36 )
                    var_1 _id_D9AD( "mt_sniper_kills" );
                else if ( var_33 && !_id_0CBC::checkaltmodestatus( var_4 ) )
                    var_1 _id_D9AD( "mt_shotgun_kills" );
                else if ( var_33 && _id_0CBC::checkaltmodestatus( var_4 ) )
                    var_1 _id_D9AD( "mt_sniper_kills" );
                else if ( var_36 && !_id_0CBC::checkaltmodestatus( var_4 ) )
                    var_1 _id_D9AD( "mt_ar_kills" );
                else if ( var_36 && _id_0CBC::checkaltmodestatus( var_4 ) )
                    var_1 _id_D9AD( "mt_sniper_kills" );

                break;
            case "weapon_pistol":
                var_1 _id_D9AD( "mt_pistol_kills" );
                break;
            case "other":
                if ( var_28 )
                    var_1 _id_D9AD( "mt_pistol_kills" );

                break;
            default:
                break;
        }
    }

    switch ( var_13 )
    {
        case "zombie":
            if ( self.agent_type != "alien_rhino" && self.agent_type != "alien_phantom" && self.agent_type != "alien_goon" )
                var_1 _id_D9AD( "mt_zombie_kills" );

            break;
        default:
            break;
    }

    if ( var_16 )
        var_1 _id_D9AD( "mt_explosive_kills" );

    if ( var_17 )
        var_1 _id_D9AD( "mt_melee_kills" );

    if ( var_18 )
        var_1 _id_D9AD( "mt_fire_kills" );

    if ( var_23 )
        var_1 _id_D9AD( "mt_trap_kills" );

    if ( var_24 )
        var_1 _id_D9AD( "mt_magic_weapon_kills" );

    if ( var_35 )
        var_1 _id_D9AD( "mt_headshot_kills" );

    if ( var_19 )
        var_1 _id_D9AD( "mt_crawler_kills" );

    if ( var_20 )
        var_1 _id_D9AD( "mt_faf_shock_melee_kills" );

    if ( var_21 )
        var_1 _id_D9AD( "mt_sliding_kills" );

    if ( var_28 || var_32 )
        var_1 _id_D9AD( "mt_quest_weapon_kills" );

    if ( var_22 && var_18 )
        var_1 _id_D9AD( "mt_faf_burned_out_kills" );

    if ( getdvar( "ui_mapname" ) == "cp_rave" )
    {
        if ( isdefined( self.agent_type ) && self.agent_type == "zombie_sasquatch" )
            var_1 _id_D9AD( "mt_dlc1_sasquatch_kills" );

        if ( var_17 )
        {
            if ( var_4 == "iw7_golf_club_mp" || var_4 == "iw7_golf_club_mp_pap1" || var_4 == "iw7_golf_club_mp_pap2" )
                var_1 _id_D9AD( "mt_dlc1_golf_kills" );
            else if ( var_4 == "iw7_spiked_bat_mp" || var_4 == "iw7_spiked_bat_mp_pap1" || var_4 == "iw7_spiked_bat_mp_pap2" )
                var_1 _id_D9AD( "mt_dlc1_bat_kills" );
            else if ( var_4 == "iw7_machete_mp" || var_4 == "iw7_machete_mp_pap1" || var_4 == "iw7_machete_mp_pap2" )
                var_1 _id_D9AD( "mt_dlc1_machete_kills" );
            else if ( var_4 == "iw7_two_headed_axe_mp" || var_4 == "iw7_two_headed_axe_mp_pap1" || var_4 == "iw7_two_headed_axe_mp_pap2" )
                var_1 _id_D9AD( "mt_dlc1_axe_kills" );
            else if ( var_4 == "iw7_lawnmower_zm" )
                var_1 _id_D9AD( "mt_dlc1_lawnmower_kills" );
        }

        if ( issubstr( var_4, "harpoon" ) )
            var_1 _id_D9AD( "mt_dlc1_harpoon_kills" );

        if ( scripts\engine\utility::_id_9CEE( var_1._id_DCEB ) )
            var_1 _id_D9AD( "mt_dlc1_kills_in_rave" );
    }

    if ( getdvar( "ui_mapname" ) == "cp_disco" )
    {
        if ( var_4 == "iw7_katana_zm_pap2+camo222" || var_4 == "iw7_katana_windforce_zm" )
            var_1 _id_D9AD( "mt_dlc2_pap2_katana" );
        else if ( var_4 == "iw7_nunchucks_zm_pap2+camo222" )
            var_1 _id_D9AD( "mt_dlc2_pap2_nunchucks" );
        else if ( var_4 == "heart_cp" )
            var_1 _id_D9AD( "mt_dlc2_heart_kills" );

        if ( isdefined( self.agent_type ) && self.agent_type == "skater" )
            var_1 _id_D9AD( "mt_dlc2_roller_skaters" );

        if ( var_23 )
            var_1 _id_D9AD( "mt_dlc2_trap_kills" );
        else if ( scripts\engine\utility::_id_9CEE( var_1.kung_fu_mode ) && !is_crafted_trap_damage( var_4 ) )
        {
            if ( var_1.kungfu_style == "dragon" )
                var_1 _id_D9AD( "mt_dlc2_dragon_kills" );
            else if ( var_1.kungfu_style == "crane" )
                var_1 _id_D9AD( "mt_dlc2_crane_kills" );
            else if ( var_1.kungfu_style == "snake" )
                var_1 _id_D9AD( "mt_dlc2_snake_kills" );
            else if ( var_1.kungfu_style == "tiger" )
                var_1 _id_D9AD( "mt_dlc2_tiger_kills" );
        }
    }

    if ( getdvar( "ui_mapname" ) == "cp_town" )
    {
        if ( var_17 )
        {
            if ( var_4 == "iw7_knife_zm_cleaver" )
                var_1 _id_D9AD( "mt_dlc3_cleaver_kills" );
            else if ( var_4 == "iw7_knife_zm_crowbar" )
                var_1 _id_D9AD( "mt_dlc3_crowbar_kills" );
        }
        else if ( issubstr( var_4, "cutie" ) )
            var_1 _id_D9AD( "mt_dlc3_mad_kills" );

        if ( isdefined( self.agent_type ) && self.agent_type == "crab_mini" )
            var_1 _id_D9AD( "mt_dlc3_crab_mini" );

        if ( isdefined( var_1.sub_perks ) && isdefined( var_1.sub_perks["perk_machine_change"] ) )
        {
            if ( var_1.sub_perks["perk_machine_change"] == "perk_machine_change1" )
                var_1.change_chew_1_merit = 1;
            else if ( var_1.sub_perks["perk_machine_change"] == "perk_machine_change2" )
                var_1.change_chew_2_merit = 1;
            else if ( var_1.sub_perks["perk_machine_change"] == "perk_machine_change3" )
                var_1.change_chew_3_merit = 1;
            else if ( var_1.sub_perks["perk_machine_change"] == "perk_machine_change4" )
                var_1.change_chew_4_merit = 1;

            if ( scripts\engine\utility::_id_9CEE( var_1.change_chew_1_merit ) && scripts\engine\utility::_id_9CEE( var_1.change_chew_2_merit ) && scripts\engine\utility::_id_9CEE( var_1.change_chew_3_merit ) && scripts\engine\utility::_id_9CEE( var_1.change_chew_4_merit ) )
            {
                if ( !isdefined( var_1.change_chew_merit_progress ) )
                {
                    var_1 _id_D9AD( "mt_dlc3_change_chew" );
                    var_1.change_chew_merit_progress = 1;
                }
            }
        }
    }

    if ( getdvar( "ui_mapname" ) == "cp_final" )
    {
        if ( var_29 )
            var_1 _id_D9AD( "mt_dlc4_venomx_kills" );

        if ( var_30 )
            var_1 _id_D9AD( "mt_dlc4_entangler_kills" );

        if ( isdefined( self.agent_type ) )
        {
            if ( self.agent_type == "alien_rhino" )
                var_1 _id_D9AD( "mt_dlc4_rhino_kills" );
            else if ( self.agent_type == "alien_phantom" )
                var_1 _id_D9AD( "mt_dlc4_phantom_kills" );
            else if ( self.agent_type == "alien_goon" )
                var_1 _id_D9AD( "mt_dlc4_goon_kills" );
            else if ( self.agent_type == "karatemaster" || self.agent_type == "zombie_clown" )
                var_1 _id_D9AD( "mt_dlc4_special_wave_kills" );
        }

        if ( var_23 )
            var_1 _id_D9AD( "mt_dlc4_trap_kills" );
    }
}

is_crafted_trap_damage( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "iw7_robotzap_zm":
        case "zmb_robotprojectile_mp":
        case "incendiary_ammo_mp":
        case "alien_sentry_minigun_4_mp":
        case "iw7_electrictrap_zm":
            return 1;
    }

    return 0;
}

_id_D9AD( var_0, var_1, var_2 )
{
    if ( !_id_B4E9() )
        return;

    if ( !isplayer( self ) || isai( self ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !_id_8C4A( var_0 ) )
        return;

    var_3 = _id_7FB3( var_0 );

    if ( var_3 == 5 )
        return;

    var_4 = isdefined( level._id_B684[var_0]["operation"] );

    if ( var_3 > level._id_B684[var_0]["targetval"].size )
    {
        var_5 = var_3 == level._id_B684[var_0]["targetval"].size + 1;
        var_6 = isdefined( self._id_C637 ) && isdefined( self._id_C637[var_0] );

        if ( var_5 && !var_6 )
            var_3 = level._id_B684[var_0]["targetval"].size;
        else
            return;
    }

    var_7 = _id_0A58::_id_BD6E( var_0 );
    var_8 = level._id_B684[var_0]["targetval"][var_3];

    if ( !isdefined( var_8 ) )
        return;

    if ( isdefined( var_2 ) && var_2 )
        var_9 = var_1;
    else
        var_9 = var_7 + var_1;

    var_10 = 0;

    if ( var_9 >= var_8 )
    {
        var_11 = 1;
        var_10 = var_9 - var_8;
        var_9 = var_8;
    }
    else
        var_11 = 0;

    if ( var_7 < var_9 )
        _id_0A58::_id_BD75( var_0, var_9 );

    if ( var_11 )
    {
        thread _id_839C( var_0, var_3 );
        _id_110AF( var_0 );
        _id_837F( level._id_B684[var_0]["score"][var_3] );
        var_3++;
        _id_0A58::_id_BD76( var_0, var_3 );
        self._id_B683[var_0] = var_3;

        if ( var_0 != "mt_dlc4_troll2" )
            thread _id_0A57::_id_10117( var_0 );

        if ( areallmerittierscomplete( var_0 ) )
            processmastermerit( var_0 );
    }
}

areallmerittierscomplete( var_0 )
{
    if ( self._id_B683[var_0] >= level._id_B684[var_0]["targetval"].size )
        return 1;

    return 0;
}

_id_7CCB()
{
    return "cp/zombies/zombie_splashtable.csv";
}

_id_110AF( var_0 )
{
    if ( !isdefined( self._id_B685 ) )
        self._id_B685 = [];

    var_1 = 0;

    foreach ( var_3 in self._id_B685 )
    {
        if ( var_3 == var_0 )
            var_1 = 1;
    }

    if ( !var_1 )
        self._id_B685[self._id_B685.size] = var_0;
}

_id_110B0( var_0 )
{
    if ( !isdefined( self._id_C636 ) )
        self._id_C636 = [];

    var_1 = 0;

    foreach ( var_3 in self._id_C636 )
    {
        if ( var_3 == var_0 )
        {
            var_1 = 1;
            break;
        }
    }

    if ( !var_1 )
        self._id_C636[self._id_C636.size] = var_0;
}

_id_839C( var_0, var_1 )
{
    self endon( "disconnect" );
    wait 0.25;
    _id_0A63::_id_831D( int( level._id_B684[var_0]["reward"][var_1] ) );
}

_id_837F( var_0 )
{
    var_1 = self getrankedplayerdata( "cp", "challengeScore" );
    self setrankedplayerdata( "cp", "challengeScore", var_1 + var_0 );
}

_id_12ED0()
{
    self._id_B683 = [];
    self endon( "disconnect" );

    if ( !_id_B4E9() )
        return;

    var_0 = 0;

    foreach ( var_5, var_2 in level._id_B684 )
    {
        var_0++;

        if ( var_0 % 20 == 0 )
            wait 0.05;

        self._id_B683[var_5] = 0;
        var_3 = var_2["index"];
        var_4 = _id_0A58::_id_BD6F( var_5 );
        self._id_B683[var_5] = var_4;
    }
}

_id_7FB2( var_0 )
{
    return tablelookup( "cp/allMeritsTable.csv", 0, var_0, 5 );
}

_id_A003( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = _id_7FB2( var_0 );

    if ( isdefined( var_1 ) )
        return 1;

    return 0;
}

_id_8223( var_0 )
{
    return _id_7FB2( var_0 );
}

_id_9ECC( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = _id_7FB2( var_0 );

    if ( isdefined( var_1 ) )
    {
        if ( var_1 == "perk_slot_0" || var_1 == "perk_slot_1" || var_1 == "perk_slot_2" || var_1 == "proficiency" || var_1 == "equipment" || var_1 == "special_equipment" || var_1 == "attachment" || var_1 == "prestige" || var_1 == "final_killcam" || var_1 == "basic" || var_1 == "humiliation" || var_1 == "precision" || var_1 == "revenge" || var_1 == "elite" || var_1 == "intimidation" || var_1 == "operations" || _id_0A77::_id_9F7C( var_1, "killstreaks_" ) )
            return 1;
    }

    if ( _id_A003( var_0 ) )
        return 1;

    return 0;
}

_id_B681( var_0, var_1, var_2 )
{
    var_3 = tablelookup( var_0, 0, var_1, 10 + var_2 * 3 );
    return int( var_3 );
}

_id_B67E( var_0, var_1, var_2 )
{
    var_3 = tablelookup( var_0, 0, var_1, 11 + var_2 * 3 );
    return int( var_3 );
}

_id_B67F( var_0, var_1, var_2 )
{
    var_3 = tablelookup( var_0, 0, var_1, 12 + var_2 * 3 );
    return int( var_3 );
}

_id_3215( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 0;
    var_2 = 0;

    for (;;)
    {
        var_4 = tablelookupbyrow( var_0, var_2, 0 );

        if ( var_4 == "" )
            break;

        var_5 = getmeritmasterchallenge( var_4 );
        level._id_B684[var_4] = [];
        level._id_B684[var_4]["index"] = var_2;
        level._id_B684[var_4]["type"] = var_1;
        level._id_B684[var_4]["targetval"] = [];
        level._id_B684[var_4]["reward"] = [];
        level._id_B684[var_4]["score"] = [];
        level._id_B684[var_4]["filter"] = _id_7FB2( var_4 );
        level._id_B684[var_4]["master"] = var_5;

        if ( _id_9ECC( var_4 ) )
        {
            level._id_B684[var_4]["operation"] = 1;
            level._id_B684[var_4]["spReward"] = [];

            if ( _id_A003( var_4 ) )
            {
                var_6 = _id_8223( var_4 );

                if ( isdefined( var_6 ) )
                    level._id_B684[var_4]["weapon"] = var_6;
            }
        }

        for ( var_7 = 0; var_7 < 5; var_7++ )
        {
            var_8 = _id_B681( var_0, var_4, var_7 );
            var_9 = _id_B67E( var_0, var_4, var_7 );
            var_10 = _id_B67F( var_0, var_4, var_7 );

            if ( var_8 == 0 )
                break;

            level._id_B684[var_4]["targetval"][var_7] = var_8;
            level._id_B684[var_4]["reward"][var_7] = var_9;
            level._id_B684[var_4]["score"][var_7] = var_10;
            var_3 = var_3 + var_9;
        }

        var_4 = tablelookupbyrow( var_0, var_2, 0 );
        var_2++;
    }

    return int( var_3 );
}

_id_3214()
{
    level._id_B684 = [];
    var_0 = 0;
    var_0 = var_0 + _id_3215( "cp/allMeritsTable.csv", 0 );
}

_id_9E9C( var_0 )
{
    var_1 = level._id_B684[var_0]["filter"];

    if ( !isdefined( var_1 ) )
        return 1;

    return self _meth_81A7( var_1, "challenge" );
}

_id_8C4A( var_0 )
{
    return isdefined( level._id_B684 ) && isdefined( level._id_B684[var_0] );
}

getmeritmasterchallenge( var_0 )
{
    var_1 = tablelookup( "cp/allMeritsTable.csv", 0, var_0, 7 );

    if ( isdefined( var_1 ) && var_1 == "" )
        return undefined;

    return var_1;
}

processmastermerit( var_0 )
{
    var_1 = level._id_B684[var_0]["master"];

    if ( isdefined( var_1 ) )
        thread _id_D9AD( var_1 );
}

_id_B9B2()
{
    self endon( "disconnect" );
    self._id_18C1 = 0.0;

    for (;;)
    {
        if ( self playerads() == 1 )
            self._id_18C1 = self._id_18C1 + 0.05;
        else
            self._id_18C1 = 0.0;

        wait 0.05;
    }
}
