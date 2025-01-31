// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._effect["directors_cut_golden_film"] = loadfx( "vfx/iw7/levels/cp_final/pap/vfx_filmreel_golden_anim.vfx" );
    level._effect["soul_key_place"] = loadfx( "vfx/iw7/levels/cp_final/pap/vfx_soulkey_place.vfx" );
}

start_directors_cut()
{
    level endon( "game_ended" );

    if ( !allow_directors_cut() )
    {
        level thread store_no_dc_mode_in_player_data();
        return;
    }

    level thread directors_cut_player_connect_monitor();
    wait 7;
    set_up_soul_jar_interaction();
    set_directors_cut_is_activated();

    if ( directors_cut_is_activated() )
    {
        _id_0D45::log_using_dc_mode( 1 );
        activate_directors_cut_global_benefits();
        start_level_specific_easter_eggs();
    }
}

store_no_dc_mode_in_player_data()
{
    wait 10;
    _id_0D45::log_using_dc_mode( 0 );
}

allow_directors_cut()
{
    if ( scripts\cp\zombies\direct_boss_fight::should_directly_go_to_boss_fight() )
        return 0;

    if ( !level.onlinegame )
        return 0;

    return 1;
}

directors_cut_player_connect_monitor()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( directors_cut_activated_for( var_0 ) )
            var_0 thread give_directors_cut_benefits_to( var_0 );
    }
}

give_directors_cut_benefits_to( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 waittill( "spawned_player" );
    scripts\cp\maps\cp_zmb\cp_zmb_ghost_wave::set_consumable_meter_scalar( var_0, 2 );
    wait( get_pre_perkaholic_wait_time() );
    give_unlimited_self_revive( var_0 );
    give_perkaholic_to( var_0 );
}

give_perkaholic_to( var_0 )
{
    var_0.have_permanent_perks = 1;
    var_0 thread scripts\cp\maps\cp_zmb\cp_zmb_ghost_wave::_id_5FB7( var_0 );
}

give_unlimited_self_revive( var_0 )
{
    var_0.max_self_revive_machine_use = 6;
    var_0.have_gns_perk = 1;
}

try_drop_talisman( var_0, var_1 )
{
    level endon( "game_ended" );

    if ( should_drop_talisman() )
    {
        wait 3;
        drop_talisman( var_0, var_1 );
    }
}

drop_talisman( var_0, var_1 )
{
    var_2 = undefined;

    switch ( level.script )
    {
        case "cp_zmb":
            var_2 = "d";
            break;
        case "cp_rave":
            var_2 = "e";
            break;
        case "cp_disco":
            var_2 = "a";
            break;
        case "cp_town":
            var_2 = "t";
            break;
        case "cp_final":
            var_2 = "h";
            break;
    }

    var_3 = spawn( "script_model", var_0 );
    var_3 setmodel( "directors_cut_origin" );
    var_3.angles = var_1;
    var_3 setscriptablepartstate( "talisman_flames", var_2 );
    var_4 = make_talisman_pick_up_interaction( var_0 );
    var_4.talisman = var_3;
    enable_talisman_pick_up_for_players( var_4 );
}

should_drop_talisman()
{
    foreach ( var_1 in level.players )
    {
        if ( player_can_earn_talisman( var_1 ) )
            return 1;
    }

    return 0;
}

enable_talisman_pick_up_for_players( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( player_can_earn_talisman( var_2 ) )
            enable_talisman_pick_up_for( var_0, var_2 );
    }
}

enable_talisman_pick_up_for( var_0, var_1 )
{
    if ( !isdefined( var_0.players_who_can_pick_up ) )
        var_0.players_who_can_pick_up = [];

    var_0.players_who_can_pick_up[var_0.players_who_can_pick_up.size] = var_1;
}

player_can_earn_talisman( var_0 )
{
    var_1 = var_0 getrankedplayerdata( "cp", "dc" );
    return var_1;
}

set_up_soul_jar_interaction()
{
    var_0 = getent( "pap_machine", "targetname" );
    var_1 = var_0.origin;
    var_2 = var_0.angles;
    var_3 = anglestoforward( var_2 );
    var_4 = anglestoright( var_2 );
    var_5 = var_4 * -1;
    var_6 = anglestoup( var_2 );
    var_7 = var_1 + var_3 * 34 + var_5 * 133.5 + var_6 * 55;
    var_8 = spawnstruct();
    var_8.name = "open_soul_jar";
    var_8.script_noteworthy = "open_soul_jar";
    var_8.origin = var_7;
    var_8._id_46A2 = 0;
    var_8._id_D776 = 1;
    var_8._id_109DA = undefined;
    var_8._id_EE79 = "";
    var_8._id_E1B9 = 0;
    var_8._id_8FFA = ::soul_jar_hint_func;
    var_8._id_161A = ::try_open_soul_jar;
    var_8._id_6261 = 1;
    var_8.disable_guided_interactions = 0;
    level._id_9A43["open_soul_jar"] = var_8;
    _id_0A59::_id_175C( var_8 );
}

try_open_soul_jar( var_0, var_1 )
{
    if ( can_open_soul_jar( var_1 ) )
        open_soul_jar( var_0, var_1 );
}

make_talisman_pick_up_interaction( var_0 )
{
    var_1 = spawnstruct();
    var_1.name = "talisman_pick_up";
    var_1.script_noteworthy = "talisman_pick_up";
    var_1.origin = var_0;
    var_1._id_46A2 = 0;
    var_1._id_D776 = 1;
    var_1._id_109DA = undefined;
    var_1._id_EE79 = "";
    var_1._id_E1B9 = 0;
    var_1._id_8FFA = ::talisman_hint_func;
    var_1._id_161A = ::pick_up_talisman;
    var_1._id_6261 = 1;
    var_1.disable_guided_interactions = 0;
    level._id_9A43["talisman_pick_up"] = var_1;
    _id_0A59::_id_175C( var_1 );
    return var_1;
}

talisman_player_connect_monitor( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "talisman_pick_up_complete" );

    for (;;)
    {
        level waittill( "connected", var_1 );
        var_1 thread remove_talisman_interaction( var_0, var_1 );
    }
}

remove_talisman_interaction( var_0, var_1 )
{
    var_1 endon( "disconnect" );
    level endon( "game_ended" );
    var_1 waittill( "spawned_player" );
    _id_0A59::_id_E01A( var_0, var_1 );
}

talisman_hint_func( var_0, var_1 )
{
    if ( player_can_earn_talisman( var_1 ) )
        return &"DIRECTORS_CUT_PICK_UP_TALISMAN";
    else
        return &"DIRECTORS_CUT_UNABLE_PICK_UP_TALISMAN";
}

soul_jar_hint_func( var_0, var_1 )
{
    return "";
}

pick_up_talisman( var_0, var_1 )
{
    if ( !player_can_earn_talisman( var_1 ) )
        return;

    _id_0A59::_id_E01A( var_0, var_1 );
    var_0.players_who_can_pick_up = scripts\engine\utility::array_remove( var_0.players_who_can_pick_up, var_1 );
    var_0.talisman _meth_8429( var_1 );
    update_talisman_interaction_after_pick_up( var_0 );
    mark_talisman_possession( var_1 );
}

update_talisman_interaction_after_pick_up( var_0 )
{
    if ( var_0.players_who_can_pick_up.size == 0 )
    {
        _id_0A59::_id_E019( var_0 );
        var_0 notify( "talisman_pick_up_complete" );
        var_0.talisman delete();
    }
}

mark_talisman_possession( var_0 )
{
    var_1 = undefined;

    switch ( level.script )
    {
        case "cp_zmb":
            var_1 = "item_1";
            break;
        case "cp_rave":
            var_1 = "item_2";
            break;
        case "cp_disco":
            var_1 = "item_3";
            break;
        case "cp_town":
            var_1 = "item_4";
            break;
        case "cp_final":
            var_1 = "item_5";
            break;
    }

    var_0 setrankedplayerdata( "cp", "haveItems", var_1, 1 );
    var_2 = getdvar( "ui_mapname" );

    switch ( var_2 )
    {
        case "cp_zmb":
            var_0 _id_0A5E::_id_D9AD( "mt_tali_1" );
            break;
        case "cp_rave":
            var_0 _id_0A5E::_id_D9AD( "mt_tali_2" );
            break;
        case "cp_disco":
            var_0 _id_0A5E::_id_D9AD( "mt_tali_3" );
            break;
        case "cp_town":
            var_0 _id_0A5E::_id_D9AD( "mt_tali_4" );
            break;
        case "cp_final":
            var_0 _id_0A5E::_id_D9AD( "mt_tali_5" );
            break;
    }
}

activate_directors_cut_global_benefits()
{
    give_unlimited_fnf_refill();
    allow_max_pap_from_start();
    upgrade_magic_wheel();
    add_wonder_weapons_to_magic_wheel();
}

give_unlimited_fnf_refill()
{
    level.unlimited_fnf = 1;
}

allow_max_pap_from_start()
{
    level._id_C8A4 = 3;
    level thread insert_fuses_into_pap_machine();
}

insert_fuses_into_pap_machine()
{
    var_0 = getdvar( "ui_mapname" );

    switch ( var_0 )
    {
        case "cp_zmb":
            var_1 = getent( "pap_machine", "targetname" );
            var_1 setscriptablepartstate( "door", "close" );
            wait 0.5;
            var_1 setscriptablepartstate( "machine", "upgraded" );
            wait 0.25;
            var_1 setscriptablepartstate( "reels", "neutral" );
            wait 0.25;
            var_1 setscriptablepartstate( "reels", "on" );
            wait 0.25;
            var_1 setscriptablepartstate( "door", "open_idle" );
            break;
        default:
            foreach ( var_1 in level.player_pap_machines )
                var_1 setscriptablepartstate( "machine", "upgraded" );

            break;
    }
}

upgrade_magic_wheel()
{
    level.magic_wheel_upgraded_pap1 = 1;
}

add_wonder_weapons_to_magic_wheel()
{
    switch ( level.script )
    {
        case "cp_zmb":
            level._id_B15E["dischord"] = "iw7_dischord_zm_pap1";
            level._id_B15E["facemelter"] = "iw7_facemelter_zm_pap1";
            level._id_B15E["headcutter"] = "iw7_headcutter_zm_pap1";
            level._id_B15E["shredder"] = "iw7_shredder_zm_pap1";
            break;
        case "cp_rave":
            level._id_B15E["acidrain"] = "iw7_harpoon1_zm";
            level._id_B15E["benfranklin"] = "iw7_harpoon2_zm";
            level._id_B15E["trapomatic"] = "iw7_harpoon3_zm+akimbo";
            level._id_B15E["whirlwind"] = "iw7_harpoon4_zm";
            break;
        case "cp_disco":
            level._id_B15E["nunchucks"] = "iw7_nunchucks_zm_pap1";
            break;
        case "cp_town":
            level._id_B15E["cutie"] = "iw7_cutie_zm+cutiecrank+cutiegrip+cutieplunger";
            break;
        case "cp_final":
            level._id_B15E["venomx"] = "iw7_venomx_zm_pap1";
            break;
        default:
            return;
    }

    foreach ( var_1 in level._id_B163 )
        var_1._id_13C25 = _id_0D37::_id_7ABF();
}

get_pre_perkaholic_wait_time()
{
    switch ( level.script )
    {
        case "cp_final":
        case "cp_disco":
        case "cp_rave":
        case "cp_zmb":
            return 9;
        case "cp_town":
            return 13;
    }
}

open_soul_jar( var_0, var_1 )
{
    var_1 setrankedplayerdata( "cp", "dc_available", 1 );
    level thread open_soul_jar_sequence( var_1 );
}

open_soul_jar_sequence( var_0 )
{
    var_1 = getent( "pap_machine", "targetname" );
    var_2 = var_1.origin;
    var_3 = var_1.angles;
    var_4 = anglestoforward( var_3 );
    var_5 = anglestoup( var_3 );
    var_1 = getent( "pap_machine", "targetname" );
    var_2 = var_1.origin;
    var_3 = var_1.angles;
    var_4 = anglestoforward( var_3 );
    var_6 = anglestoright( var_3 );
    var_7 = var_6 * -1;
    var_5 = anglestoup( var_3 );
    var_8 = var_2 + var_4 * 59 + var_7 * 133.5 + var_5 * 61;
    playfx( level._effect["soul_key_place"], var_8, var_4 * -1, var_5, var_0 );
    wait 9.2;
    var_9 = make_lost_reel( var_0 );
    var_10 = make_lost_reel( var_0 );
    wait 1;
    var_1 = getent( "pap_machine", "targetname" );
    var_11 = var_1 gettagorigin( "j_top_wheel" );
    var_12 = var_1 gettagorigin( "j_bottom_wheel" );
    var_9 moveto( var_11, 0.8, 0.8 );
    var_10 moveto( var_12, 0.8, 0.8 );
    wait 0.8;
    var_9 delete();
    var_10 delete();
    try_play_lost_reel_vfx_on_machine();
}

make_lost_reel( var_0 )
{
    var_1 = getent( "pap_machine", "targetname" );
    var_2 = var_1.origin;
    var_3 = var_1.angles;
    var_4 = anglestoforward( var_3 );
    var_5 = anglestoright( var_3 );
    var_6 = var_5 * -1;
    var_7 = anglestoup( var_3 );
    var_8 = var_2 + var_4 * 72 + var_6 * 133.5 + var_7 * 70;
    var_9 = spawn( "script_model", var_8 );
    var_9 hide();
    var_9 setmodel( "directors_cut_origin" );
    var_9 setscriptablepartstate( "lost_reel", "on" );
    var_9 _meth_8388( var_0 );
    return var_9;
}

can_open_soul_jar( var_0 )
{
    if ( var_0 getrankedplayerdata( "cp", "dc_available" ) )
        return 0;

    if ( !var_0 getrankedplayerdata( "cp", "haveSoulKeys", "soul_key_1" ) )
        return 0;

    if ( !var_0 getrankedplayerdata( "cp", "haveSoulKeys", "soul_key_2" ) )
        return 0;

    if ( !var_0 getrankedplayerdata( "cp", "haveSoulKeys", "soul_key_3" ) )
        return 0;

    if ( !var_0 getrankedplayerdata( "cp", "haveSoulKeys", "soul_key_4" ) )
        return 0;

    if ( !var_0 getrankedplayerdata( "cp", "haveSoulKeys", "soul_key_5" ) )
        return 0;

    return 1;
}

try_play_lost_reel_vfx_on_machine()
{
    if ( scripts\engine\utility::_id_9CEE( level.lost_reel_vfx_on_machine ) )
        return;

    level.lost_reel_vfx_on_machine = 1;
    var_0 = getent( "pap_machine", "targetname" );
    var_1 = var_0 gettagorigin( "tag_origin" );
    var_2 = var_0.angles;
    playfx( level._effect["directors_cut_golden_film"], var_1, anglestoforward( var_2 ), anglestoup( var_2 ) );
}

set_directors_cut_is_activated()
{
    level.directors_cut_is_activated = 0;

    foreach ( var_1 in level.players )
    {
        if ( directors_cut_activated_for( var_1 ) )
            level.directors_cut_is_activated = 1;
    }
}

directors_cut_is_activated()
{
    return scripts\engine\utility::_id_9CEE( level.directors_cut_is_activated );
}

directors_cut_activated_for( var_0 )
{
    return var_0 getrankedplayerdata( "cp", "dc" );
}

get_directors_cut_starting_currency()
{
    return 25000;
}

start_level_specific_easter_eggs()
{
    switch ( level.script )
    {
        case "cp_zmb":
            level thread cp_zmb_directors_cut_easter_egg();
            break;
        case "cp_rave":
            level thread cp_rave_directors_cut_easter_egg();
            break;
        case "cp_disco":
            level thread cp_disco_directors_cut_easter_egg();
            break;
        case "cp_town":
            level thread cp_town_directors_cut_easter_egg();
            break;
        case "cp_final":
            level thread cp_final_directors_cut_easter_egg();
            break;
        default:
            break;
    }
}

give_dc_player_extra_xp_for_carrying_newb()
{
    var_0 = get_num_of_newbs_in_game();
    var_1 = var_0 * 50000;

    foreach ( var_3 in level.players )
    {
        if ( directors_cut_activated_for( var_3 ) )
            var_3 _id_0A63::_id_831D( var_1, 1 );
    }
}

get_num_of_newbs_in_game()
{
    var_0 = 0;
    var_1 = undefined;

    switch ( level.script )
    {
        case "cp_zmb":
            var_1 = "soul_key_1";
            break;
        case "cp_rave":
            var_1 = "soul_key_2";
            break;
        case "cp_disco":
            var_1 = "soul_key_3";
            break;
        case "cp_town":
            var_1 = "soul_key_4";
            break;
        case "cp_final":
            var_1 = "soul_key_5";
            break;
    }

    foreach ( var_3 in level.players )
    {
        if ( !var_3 getrankedplayerdata( "cp", "haveSoulKeys", var_1 ) )
            var_0++;
    }

    return var_0;
}

cp_zmb_directors_cut_easter_egg()
{
    level._id_BF51 = 0;
    level.glasses_drop_change_increase = 90;
    level thread _id_42F2();
}

_id_42F2()
{
    for (;;)
    {
        level waittill( "coaster_started", var_0 );

        if ( isdefined( level._id_13BD3 ) && level._id_13BD3 > 1 )
            return;

        var_1 = spawn( "script_model", ( 2141, -3807, 348 ) );
        var_1 setmodel( "cp_final_talisman_alt" );
        var_1.angles = ( 26, 145, 0 );
        var_2 = [];

        foreach ( var_4 in level.players )
        {
            if ( isdefined( var_4._id_AD1C ) && var_4._id_AD1C == var_0 )
                var_2[var_2.size] = var_4;
        }

        talisman_visibility_manager( var_1, var_2 );

        foreach ( var_4 in var_2 )
            var_4 thread shoot_talisman_monitor( var_4, var_0, var_1 );

        var_0 waittill( "ride_finished" );
        var_1 delete();

        if ( isdefined( level._id_13BD3 ) && level._id_13BD3 > 1 )
            return;
    }
}

talisman_visibility_manager( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
    {
        if ( !directors_cut_activated_for( var_3 ) )
            var_0 _meth_8429( var_3 );

        if ( !scripts\engine\utility::_id_9CEE( var_3._id_13CE5 ) )
            var_0 _meth_8429( var_3 );
    }
}

shoot_talisman_monitor( var_0, var_1, var_2 )
{
    var_0 endon( "disconnect" );
    var_1 endon( "ride_finished" );

    if ( !scripts\engine\utility::_id_9CEE( var_0._id_13CE5 ) )
        return;

    if ( !directors_cut_activated_for( var_0 ) )
        return;

    var_0 notifyonplayercommand( "shoot_while_riding_coaster", "+Attack" );
    var_0 notifyonplayercommand( "shoot_while_riding_coaster", "+attack_akimbo_accessible" );

    for (;;)
    {
        var_0 waittill( "shoot_while_riding_coaster" );

        if ( distancesquared( var_0.origin, var_2.origin ) <= 1440000 )
        {
            if ( var_0 _meth_8409( var_2.origin, 25, 100 ) )
            {
                playfx( level._effect["souvenir_pickup"], var_2.origin, anglestoforward( var_2.angles ), anglestoup( var_2.angles ), var_0 );
                var_2 _meth_8429( var_0 );
                var_0 setrankedplayerdata( "cp", "dcq", "cp_zmb", 1 );
                var_0 _id_0A4F::updatedamagefeedback( "hitaliensoft" );
                var_0 _id_0A5E::_id_D9AD( "mt_dc_1" );

                if ( scripts\engine\utility::_id_9CEE( level.onlinegame ) )
                {
                    var_0 setrankedplayerdata( "cp", "hasSongsUnlocked", "any_song", 1 );
                    var_0 setrankedplayerdata( "cp", "hasSongsUnlocked", "song_7", 1 );
                }

                return;
            }
        }
    }
}

cp_rave_directors_cut_easter_egg()
{
    level.dc_wheel_of_misfortune_start_func = ::dc_wheel_of_misfortune_start_func;

    if ( isdefined( level.enable_slasher_weapon ) )
        level thread [[ level.enable_slasher_weapon ]]();
}

dc_wheel_of_misfortune_start_func( var_0, var_1 )
{
    if ( !directors_cut_activated_for( var_1 ) )
        return;

    if ( isdefined( level._id_13BD3 ) && level._id_13BD3 > 1 )
    {
        level.dc_wheel_of_misfortune_start_func = undefined;
        return;
    }

    var_2 = spawn( "script_model", ( -581, -1604, 152 ) );
    var_2 hide();
    var_2 setmodel( "cp_final_talisman_alt" );
    var_2.angles = ( 0, 320, 0 );
    var_2 linkto( var_0 );
    var_3 = randomfloatrange( 0.3, 1.0 );
    wait( var_3 );
    var_2 _meth_8388( var_1 );
    var_2 thread talisman_damage_monitor( var_2 );
    var_4 = var_2 _id_0A77::_id_1372C( 4, var_2, "talisman_hit_by_knife", var_1, "arcade_game_over_for_player" );

    if ( var_4 == "talisman_hit_by_knife" )
    {
        playfx( level._effect["souvenir_pickup"], var_2.origin, anglestoforward( var_2.angles ), anglestoup( var_2.angles ), var_1 );
        var_1 setrankedplayerdata( "cp", "dcq", "cp_rave", 1 );
        var_1 _id_0A4F::updatedamagefeedback( "hitaliensoft" );
        var_1 _id_0A5E::_id_D9AD( "mt_dc_2" );

        if ( scripts\engine\utility::_id_9CEE( level.onlinegame ) )
        {
            var_1 setrankedplayerdata( "cp", "hasSongsUnlocked", "any_song", 1 );
            var_1 setrankedplayerdata( "cp", "hasSongsUnlocked", "song_8", 1 );
        }
    }

    var_2 delete();
}

talisman_damage_monitor( var_0 )
{
    var_0 endon( "timeout" );
    var_0 setcandamage( 1 );
    var_0.health = 999999;

    for (;;)
    {
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
        var_0.health = 999999;

        if ( isplayer( var_2 ) && isdefined( var_10 ) && var_10 == "iw7_cpknifethrow_mp" )
            break;
    }

    var_0 notify( "talisman_hit_by_knife" );
}

cp_disco_directors_cut_easter_egg()
{
    var_0 = spawn( "script_model", ( -709, 1253, 246 ) );
    var_0 setmodel( "cp_final_talisman_alt" );
    var_0.angles = ( 346, 120, 0 );
    var_0 disco_talisman_visibility_manager( var_0 );
    var_0 thread disco_talisman_damage_monitor( var_0 );
    var_0 thread talisman_clean_up_monitor( var_0 );
}

disco_talisman_damage_monitor( var_0 )
{
    var_0 endon( "death" );
    var_0 setcandamage( 1 );
    var_0.health = 999999;

    for (;;)
    {
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
        var_0.health = 999999;

        if ( isplayer( var_2 ) )
        {
            var_11 = var_2;

            if ( directors_cut_activated_for( var_11 ) && !scripts\engine\utility::_id_9CEE( var_11.got_disco_talisman ) )
            {
                var_0 _meth_8429( var_11 );
                var_11.got_disco_talisman = 1;
                playfx( level._effect["crafting_pickup"], var_0.origin, anglestoforward( var_0.angles ), anglestoup( var_0.angles ), var_11 );
                var_11 setrankedplayerdata( "cp", "dcq", "cp_disco", 1 );
                var_11 _id_0A4F::updatedamagefeedback( "hitaliensoft" );
                var_11 _id_0A5E::_id_D9AD( "mt_dc_3" );

                if ( scripts\engine\utility::_id_9CEE( level.onlinegame ) )
                {
                    var_11 setrankedplayerdata( "cp", "hasSongsUnlocked", "any_song", 1 );
                    var_11 setrankedplayerdata( "cp", "hasSongsUnlocked", "song_9", 1 );
                }
            }
        }
    }
}

talisman_clean_up_monitor( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        level waittill( "regular_wave_starting" );

        if ( isdefined( level._id_13BD3 ) && level._id_13BD3 > 1 )
            var_0 delete();
    }
}

disco_talisman_visibility_manager( var_0 )
{
    var_0 hide();

    foreach ( var_2 in level.players )
    {
        if ( directors_cut_activated_for( var_2 ) )
            var_0 _meth_8388( var_2 );
    }

    var_0 thread disco_player_connect_monitor( var_0 );
}

disco_player_connect_monitor( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        level waittill( "connected", var_1 );

        if ( directors_cut_activated_for( var_1 ) )
            var_0 _meth_8388( var_1 );
    }
}

cp_town_directors_cut_easter_egg()
{
    var_0 = spawn( "script_model", ( 135.5, -2568, 583.3 ) );
    var_0 setmodel( "directors_cut_origin" );
    var_0.angles = ( 0, 180, 0 );
    var_0 setscriptablepartstate( "small_red_talisman", "on" );
    town_talisman_visibility_manager( var_0 );
    town_talisman_player_shoot_manager( var_0 );
    level thread town_player_connect_manager( var_0 );

    for (;;)
    {
        level waittill( "regular_wave_starting" );

        if ( isdefined( level._id_13BD3 ) && level._id_13BD3 > 1 )
        {
            var_0 delete();
            return;
        }
    }
}

town_player_connect_manager( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        level waittill( "connected", var_1 );

        if ( directors_cut_activated_for( var_1 ) )
        {
            var_0 _meth_8388( var_1 );
            var_1 thread shoot_small_talisman_monitor( var_1, var_0 );
        }
    }
}

town_talisman_visibility_manager( var_0 )
{
    var_0 hide();

    foreach ( var_2 in level.players )
    {
        if ( directors_cut_activated_for( var_2 ) )
            var_0 _meth_8388( var_2 );
    }
}

town_talisman_player_shoot_manager( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( directors_cut_activated_for( var_2 ) )
            var_2 thread shoot_small_talisman_monitor( var_2, var_0 );
    }
}

shoot_small_talisman_monitor( var_0, var_1 )
{
    var_0 endon( "disconnect" );
    var_1 endon( "death" );
    var_0 notifyonplayercommand( "try_shoot_at_small_talisman", "+Attack" );
    var_0 notifyonplayercommand( "try_shoot_at_small_talisman", "+attack_akimbo_accessible" );

    for (;;)
    {
        var_0 waittill( "try_shoot_at_small_talisman" );

        if ( distancesquared( var_0.origin, var_1.origin ) <= 250000 )
        {
            if ( var_0 _meth_8409( var_1.origin, 25, 25 ) )
            {
                if ( facing_the_right_angles( var_0 ) )
                {
                    playfx( level._effect["sb_quest_item_pickup"], var_1.origin, anglestoforward( var_1.angles ), anglestoup( var_1.angles ), var_0 );
                    var_1 _meth_8429( var_0 );
                    var_0 setrankedplayerdata( "cp", "dcq", "cp_town", 1 );
                    var_0 _id_0A4F::updatedamagefeedback( "hitaliensoft" );
                    var_0 _id_0A5E::_id_D9AD( "mt_dc_4" );

                    if ( scripts\engine\utility::_id_9CEE( level.onlinegame ) )
                    {
                        var_0 setrankedplayerdata( "cp", "hasSongsUnlocked", "any_song", 1 );
                        var_0 setrankedplayerdata( "cp", "hasSongsUnlocked", "song_10", 1 );
                    }

                    return;
                }
            }
        }
    }
}

facing_the_right_angles( var_0 )
{
    var_1 = var_0 getplayerangles();
    var_2 = var_1[1];
    return var_2 >= -38 && var_2 <= 39;
}

cp_final_directors_cut_easter_egg()
{
    var_0 = [ ( 4917, -5852, 71 ), ( 4910.5, -5859.5, 71 ), ( 4910.5, -5873, 71 ), ( 4910.5, -5897, 71 ), ( 4910.5, -5921, 71 ), ( 4910.5, -5945, 71 ), ( 4910.5, -5969, 71 ), ( 4910.5, -5993, 71 ), ( 4910.5, -6017, 71 ), ( 4910.5, -6041, 71 ), ( 4910.5, -6065, 71 ), ( 4910.5, -6089, 71 ), ( 4910.5, -6113, 71 ), ( 4911.5, -6126.5, 71 ), ( 4922.5, -6138.5, 71 ) ];
    level.abandoned_shooting_gallery_interactions = [];

    foreach ( var_2 in var_0 )
        set_up_abandoned_shooting_gallery_interaction_at( var_2 );

    for (;;)
    {
        level scripts\engine\utility::waittill_any( "event_wave_starting", "regular_wave_starting" );

        if ( isdefined( level._id_13BD3 ) && level._id_13BD3 > 1 )
        {
            foreach ( var_5 in level.abandoned_shooting_gallery_interactions )
                _id_0A59::_id_E019( var_5 );
        }
    }
}

set_up_abandoned_shooting_gallery_interaction_at( var_0 )
{
    var_1 = spawnstruct();
    var_1.name = "abandoned_shooting_gallery";
    var_1.script_noteworthy = "abandoned_shooting_gallery";
    var_1.origin = var_0;
    var_1._id_46A2 = 0;
    var_1._id_D776 = 1;
    var_1._id_109DA = undefined;
    var_1._id_EE79 = "";
    var_1._id_E1B9 = 0;
    var_1._id_8FFA = ::abandoned_shooting_gallery_hint_func;
    var_1._id_161A = ::try_abandoned_shooting_gallery;
    var_1._id_6261 = 1;
    var_1.disable_guided_interactions = 1;
    level._id_9A43["abandoned_shooting_gallery"] = var_1;
    level.abandoned_shooting_gallery_interactions[level.abandoned_shooting_gallery_interactions.size] = var_1;
    _id_0A59::_id_175C( var_1 );
}

abandoned_shooting_gallery_hint_func( var_0, var_1 )
{
    return "";
}

try_abandoned_shooting_gallery( var_0, var_1 )
{
    if ( !directors_cut_activated_for( var_1 ) )
        return;

    if ( scripts\engine\utility::_id_9CEE( var_1.played_abandoned_shooting_gallery ) )
        return;

    var_1.played_abandoned_shooting_gallery = 1;
    var_2 = [ ( 4440, -5826, 287 ), ( 4440, -5826, 253 ), ( 4442, -5906, 246 ), ( 4488, -6082, 249 ), ( 4488, -6082, 287 ) ];
    var_3 = [ ( 4488, -6082, 287 ), ( 4488, -6082, 249 ), ( 4442, -5906, 246 ), ( 4440, -5826, 253 ), ( 4440, -5826, 287 ) ];
    var_4 = [ var_2, var_3 ];
    var_5 = scripts\engine\utility::_id_DC6B( var_4 );
    level thread talisman_fly_over_shooting_gallery( var_1, var_5 );
}

talisman_fly_over_shooting_gallery( var_0, var_1 )
{
    var_2 = var_1[0];
    var_3 = spawn( "script_model", var_2 );
    var_3 setmodel( "cp_final_talisman_alt" );
    var_3.angles = ( 0, 360, 0 );
    var_3 hide();
    var_3 _meth_8388( var_0 );
    var_3 thread talisman_start_flying( var_3, var_1 );
    var_3 thread flying_talisman_damage_monitor( var_3, var_0 );
}

talisman_start_flying( var_0, var_1 )
{
    var_0 endon( "death" );

    for ( var_2 = 1; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];
        var_4 = distance( var_0.origin, var_3 );
        var_5 = var_4 / 85;
        var_0 moveto( var_3, var_5 );
        var_0 waittill( "movedone" );

        if ( var_2 < var_1.size - 1 )
        {
            var_6 = randomfloatrange( 0.5, 3.5 );
            wait( var_6 );
        }
    }

    var_0 delete();
}

flying_talisman_damage_monitor( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 setcandamage( 1 );
    var_0.health = 999999;

    for (;;)
    {
        var_0 waittill( "damage", var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
        var_0.health = 999999;

        if ( isplayer( var_3 ) && var_3 == var_1 && directors_cut_activated_for( var_1 ) )
        {
            playfx( level._effect["sb_quest_item_pickup"], var_0.origin, anglestoforward( var_0.angles ), anglestoup( var_0.angles ), var_1 );
            var_0 _meth_8429( var_1 );
            var_1 setrankedplayerdata( "cp", "dcq", "cp_final", 1 );
            var_1 _id_0A4F::updatedamagefeedback( "hitaliensoft" );
            var_1 _id_0A5E::_id_D9AD( "mt_dc_5" );

            if ( scripts\engine\utility::_id_9CEE( level.onlinegame ) )
            {
                var_1 setrankedplayerdata( "cp", "hasSongsUnlocked", "any_song", 1 );
                var_1 setrankedplayerdata( "cp", "hasSongsUnlocked", "song_11", 1 );
            }

            var_0 delete();
            return;
        }
    }
}
