// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_7443( var_0 )
{
    playloopsound( ( 632, 2357, 334 ), "entrance_sign_power_on_build" );
    wait 3;
    _id_12982();
    wait 2;
    _id_13F05();
    wait 3;
    playloopsound( ( 579, 2387, 374 ), "pa_speaker_power_on" );
    playloopsound( ( 634, 664, 255 ), "pa_speaker_power_on" );
    wait 1;
    _func_062( "starting_area" );
    _func_062( "cosmic_way" );
    _id_0A6A::_id_1769( "dj_powerswitch_restore_nag", "zmb_dj_vo", 60, 15, 2, 1 );
    _id_0A6A::_id_1769( "dj_quest_ufo_partsrecovery_start", "zmb_dj_vo", 180, 50, 1, 1 );
    level thread scripts\cp\maps\cp_zmb\cp_zmb_dj::_id_573B();
    level notify( "jukebox_start" );
    level thread _id_B218( var_0 );
    level thread _id_101F3();
    _id_F4A1();
}

_id_F4A1()
{
    var_0 = getentarray( "coaster_ice_monster", "targetname" );
    var_1 = getentarray( "octonian", "targetname" );
    var_2 = scripts\engine\utility::_id_227F( var_0, var_1 );

    foreach ( var_4 in var_2 )
    {
        var_4 _meth_8318( 1 );
        scripts\engine\utility::waitframe();
    }
}

_id_12982()
{
    var_0 = getentarray( "global_light", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 setscriptablepartstate( "root", "on" );
}

_id_13F05()
{
    _id_12989();
}

_id_12989()
{
    var_0 = getentarray( "main_gate", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 setscriptablepartstate( "main_gate", "gate_on" );

    for ( var_4 = 1; var_4 <= 5; var_4++ )
    {
        var_5 = getent( "gate_light_0" + var_4, "targetname" );
        var_5 setscriptablepartstate( "main_gate_light", "turning_on" );
    }
}

_id_8E5F()
{

}

_id_BB03()
{

}

_id_BB29()
{
    _id_12990( "sign_cosmiccinema" );
    _id_12990( "sign_roverrampage" );
    _id_12990( "sign_starmission" );
    _id_12990( "sign_escapevelocity" );
    _id_12990( "sign_lunarterrace" );
    _id_1298E( "rocket_diorama" );
}

_id_BB3D()
{

}

_id_BB3E()
{
    playloopsound( ( 3548, 938, 275 ), "journey_power_on_build" );
    wait 5.5;
    playloopsound( ( 3850, 438, 328 ), "pa_speaker_power_on" );
    wait 2;
    _func_062( "journey" );
}

_id_BB06()
{

}

_id_210B()
{
    _id_12990( "astrocade_signs" );
    getent( "bfp_cabinet", "targetname" ) setmodel( "zmb_game_bowling_for_planets_on" );
    wait 1;
    getent( "demon_group", "targetname" ) setscriptablepartstate( "group", "all_on" );
    level thread _id_D747( "arcade_demon" );
    wait 1;
    getent( "barnstorming_group", "targetname" ) setscriptablepartstate( "group", "all_on" );
    level thread _id_D747( "arcade_barnstorming" );
    wait 1;
    getent( "starmaster_group", "targetname" ) setscriptablepartstate( "group", "all_on" );
    level thread _id_D747( "arcade_starmaster" );
    wait 1;
    getent( "group_cosmicarc", "targetname" ) setscriptablepartstate( "group", "all_on" );
    level thread _id_D747( "arcade_cosmic" );
    wait 1;
    getent( "group_pitfall", "targetname" ) setscriptablepartstate( "group", "all_on" );
    level thread _id_D747( "arcade_pitfall" );
    wait 1;
    getent( "group_riverraid", "targetname" ) setscriptablepartstate( "group", "all_on" );
    level thread _id_D747( "arcade_riverraid" );
    wait 1;
    getent( "spider_arcade_group", "targetname" ) setscriptablepartstate( "group", "all_on" );
    level thread _id_D747( "arcade_spider" );
    wait 1;
    getent( "robottank_group", "targetname" ) setscriptablepartstate( "group", "all_on" );
    level thread _id_D747( "arcade_robottank" );
}

_id_D747( var_0 )
{
    var_1 = scripts\engine\utility::_id_8180( var_0, "script_noteworthy" );

    foreach ( var_3 in var_1 )
    {
        scripts\engine\utility::waitframe();
        var_3._id_D776 = 1;

        if ( isdefined( var_3._id_EDE8 ) )
        {
            var_4 = getent( var_3.name, "targetname" );
            var_5 = var_3._id_EDE8;
            var_4 setscriptablepartstate( "cab" + var_5, "idle" );
        }
    }
}

_id_210C()
{
    playloopsound( ( 2873, -1083, 357 ), "astrocade_power_on_build" );
    wait 5.5;
    playloopsound( ( 2794, -1428, 318 ), "pa_speaker_power_on" );
    wait 2;
    _func_062( "astrocade" );
}

_id_67C3()
{
    _id_101F4();
}

_id_E6D9()
{

}

_id_67A8()
{

}

_id_E67F()
{
    playloopsound( ( -830, -3394, 604 ), "triton_power_on_build" );
    wait 5.5;
    playloopsound( ( -1103, -3168, 601 ), "pa_speaker_power_on" );
    wait 2;
    _func_062( "triton" );
}

_id_11303()
{

}

_id_B385()
{
    _id_101F2();
}

_id_B384()
{
    playloopsound( ( -2168, 206, 668 ), "kepler_power_on_build" );
    wait 5.5;
    playloopsound( ( -2034, -340, 534 ), "pa_speaker_power_on" );
    playloopsound( ( -950, 1510, 428 ), "pa_speaker_power_on" );
    wait 2;
    _func_062( "kepler" );
}

init()
{
    level thread _id_D749();
}

_id_9B5F()
{
    foreach ( var_1 in level._id_773B )
    {
        if ( !scripts\engine\utility::_id_9CEE( var_1._id_D776 ) )
            return 0;
    }

    return 1;
}

_id_1BF3( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( var_0._id_134FD == "p1_" )
            level thread _id_0A6A::_id_12885( "poweron_final_valleygirl_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
        else if ( var_0._id_134FD == "p2_" )
            level thread _id_0A6A::_id_12885( "poweron_final_nerd_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
        else if ( var_0._id_134FD == "p3_" )
            level thread _id_0A6A::_id_12885( "poweron_final_rapper_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
        else if ( var_0._id_134FD == "p4_" )
            level thread _id_0A6A::_id_12885( "poweron_final_jock_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
    }
}

_id_D749()
{
    level endon( "game_ended" );
    var_0 = getent( "main_portal_sun", "targetname" );
    var_0 setmodel( "zmb_center_portal_sun_off" );

    for (;;)
    {
        level waittill( "power_on_scriptable_and_light", var_1, var_2 );
        var_3 = _id_9B5F();

        if ( var_3 )
            level thread _id_1BF3( var_2 );

        var_4 = strtok( var_1, "," );

        foreach ( var_6 in var_4 )
        {
            switch ( var_6 )
            {
                case "front_gate":
                    level thread _id_7443( var_2 );
                    break;
                case "hidden_room":
                    level thread _id_8E5F();
                    break;
                case "moon":
                    level thread _id_BB03();
                    break;
                case "moon_outside_begin":
                    level thread _id_BB29();
                    break;
                case "moon_rocket_space":
                    level thread _id_BB3D();
                    break;
                case "moon_second":
                    level thread _id_BB3E();
                    break;
                case "moon_bridge":
                    level thread _id_BB06();
                    break;
                case "arcade":
                    level thread _id_210B();
                    break;
                case "arcade_back":
                    level thread _id_210C();
                    break;
                case "europa_tunnel":
                    level thread _id_67C3();
                    break;
                case "room_europa":
                    level thread _id_E6D9();
                    break;
                case "europa_2":
                    level thread _id_67A8();
                    break;
                case "roller_coast_back":
                    level thread _id_E67F();
                    break;
                case "swamp_stage":
                    level thread _id_11303();
                    break;
                case "mars_3":
                    level thread _id_B385();
                    break;
                case "mars":
                    level thread _id_B384();
                    break;
            }
        }
    }
}

_id_B218( var_0 )
{
    if ( var_0._id_134FD == "p1_" )
        level thread _id_0A6A::_id_12885( "poweron_first_valleygirl_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
    else if ( var_0._id_134FD == "p2_" )
        level thread _id_0A6A::_id_12885( "poweron_first_nerd_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
    else if ( var_0._id_134FD == "p3_" )
        level thread _id_0A6A::_id_12885( "poweron_first_rapper_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
    else if ( var_0._id_134FD == "p4_" )
        level thread _id_0A6A::_id_12885( "poweron_first_jock_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100 );

    level._id_D745 = 1;
    level _id_0A6A::_id_1769( "dj_fateandfort_replenish_nag", "zmb_dj_vo", 180, 30, 20, 1 );
    level _id_0A6A::_id_1769( "dj_ticketbooths_use_nag", "zmb_dj_vo", 180, 60, 20, 1 );
    level _id_0A6A::_id_1769( "dj_pap_cosmicway_nag", "zmb_dj_vo", 180, 25, 20, 1 );
    level _id_0A6A::_id_1769( "dj_polarpeaks_use_nag", "zmb_dj_vo", 180, 90, 20, 1 );
}

_id_12986( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3._id_EDED ) )
        {
            var_4 = var_3._id_EDED;
            var_3 setlightintensity( var_4 );
        }
    }
}

_id_101F3()
{
    var_0 = getent( "main_portal_sun", "targetname" );
    var_0.angles = ( 0, 0, 0 );
    var_1 = getent( "triton_skull_light", "targetname" );
    var_2 = getent( "triton_sign_light", "targetname" );
    level thread _id_E6F9();
    wait 3;
    var_1 setscriptablepartstate( "light", "on" );
    var_2 setscriptablepartstate( "light", "on" );
    _id_1298E( "main_street_ball_lights" );
    _id_1298E( "space_depot_main_sign" );
    _id_1298E( "spacedepot_neon_upper" );
    _id_1298E( "spacedepot_neon_lower" );
    _id_1298E( "pitstop_main_sign" );
    _id_1298E( "pitstop_neon_upper" );
    _id_1298E( "pitstop_neon_lower" );
    _id_1298E( "saturn_sundaes_main_sign" );
    _id_1298E( "saturn_sundaes_neon_upper" );
    _id_1298E( "crater_cakes_main_sign" );
    _id_1298E( "crater_cakes_neon_upper" );
    level thread scripts\cp\maps\cp_zmb\cp_zmb_coaster::_id_1297B();
    var_3 = getent( "main_street_monster", "targetname" );
    var_3 setscriptablepartstate( "main", "idle2" );
}

_id_E6F9()
{
    var_0 = getent( "main_portal_sun", "targetname" );
    var_0 setmodel( "zmb_center_portal_sun" );

    for (;;)
    {
        var_0 _meth_8271( 360, 10 );
        wait 9.95;
    }
}

_id_12990( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
    {
        wait( randomfloatrange( 0.15, 0.25 ) );
        var_3 setscriptablepartstate( "sign", "powered_on" );
    }
}

_id_1298E( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    foreach ( var_3 in var_1 )
    {
        wait( randomfloatrange( 0.25, 0.5 ) );
        var_3 setscriptablepartstate( "neon_tube", "on" );
    }
}

_id_101F4()
{
    _id_1298E( "triton_ceiling_neon" );
}

_id_101F2()
{
    _id_12990( "moonlight_cafe_signs" );
    _id_12990( "sign_hyperslopes" );
    _id_12990( "sign_conelord" );
    _id_12990( "chromosphere_sign" );
    _id_12990( "shooting_gallery_sign" );
    _id_12990( "sign_spaceshipsplash" );
    getent( "chromosphere_mike", "targetname" ) setscriptablepartstate( "main", "on" );
    var_0 = getentarray( "octonian", "targetname" );

    foreach ( var_2 in var_0 )
        var_2 setscriptablepartstate( "body", "on" );
}
