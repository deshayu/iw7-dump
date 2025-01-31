// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_6603( var_0 )
{
    if ( isdefined( level.rewind_afterlife_func ) )
        level thread [[ level.rewind_afterlife_func ]]( var_0 );

    if ( !isdefined( var_0._id_6DDD ) )
        var_0._id_6DDD = 1;

    if ( isdefined( level.afterlife_arcade_set_audio_zone_func ) )
        var_0 thread [[ level.afterlife_arcade_set_audio_zone_func ]]( var_0 );

    var_1 = _id_77D5( var_0 );
    _id_41CE( var_0 );
    level notify( "player_entered_ala", var_0 );
    var_0 notify( "player_entered_ala" );
    var_0._id_6977 = 0;

    if ( isdefined( level._id_11929 ) )
        level._id_11929++;

    var_0._id_118EE = gettime();
    var_0.health = var_0.maxhealth;
    var_0 _meth_8070( 0.02 );
    var_0 _id_0A77::stoplocalsound_safe( "zmb_laststand_music" );
    var_0 setorigin( var_1.origin );
    var_0 _meth_81DC();
    var_0 setstance( "stand" );
    var_0 takeallweapons();
    var_0 _meth_8447();
    var_0 _id_0A77::_id_12C6( "iw7_gunless_zm", undefined, undefined, 1 );
    var_0 scripts\engine\utility::_id_1C53( 0 );
    var_0 _id_0D5B::_id_F53F( var_0, "afterlife" );
    var_0 _id_0A77::_id_7298();
    var_0 _id_18E5( var_0 );
    var_0 _id_F3FA( var_0, 0 );
    var_0 _id_93E4( var_0 );

    if ( isdefined( var_0 ) )
    {
        if ( _id_3DCA( var_0 ) )
            var_0 _id_0A77::_id_F78C( "welcome_to_afterlife", &"CP_ZOMBIE_AFTERLIFE_ARCADE_WELCOME", 6.0 );
        else
            var_0 _id_0A77::_id_F78C( "welcome_to_afterlife_no_self_revives", &"CP_ZOMBIE_AFTERLIFE_ARCADE_NO_REVIVES", 6.0 );

        _id_0D45::_id_AF69( 1, var_0, level._id_13BD3, var_0._id_10450, int( level._id_13BD3 / 10 ) + 1 - var_0._id_11924 );
    }

    if ( var_0._id_6DDD )
    {
        var_0 thread _id_0A6A::_id_12885( "spawn_arcade_first", "zmb_comment_vo", "highest", 15, 0, 0, 1, 50 );
        var_0._id_6DDD = 0;
    }
    else
        var_0 thread _id_0A6A::_id_12885( "spawn_arcade", "zmb_comment_vo", "high", 15, 0, 0, 1, 50 );

    var_0 _id_E226( var_0 );
    var_0 thread _id_D058( var_0 );
    var_0 thread _id_50CD( var_0, var_1.angles );
    var_0 thread _id_2B1D( var_0 );
    var_0 thread _id_D052( var_0 );
    level thread _id_C5DA( var_0, 10 );
    var_0 _id_F418( var_0, 1 );
    var_0 _id_18E4( var_0, 1 );
    var_0 _id_0A77::_id_8EC2( var_0._id_92B4 );
    var_0 visionsetnakedforplayer( "cp_zmb_afterlife", 1.0 );
    var_0 setclientomnvar( "zm_ui_player_in_afterlife_arcade", 1 );
    var_0 _meth_82BE( "player_damaged", 1, 0 );
    var_0 _meth_82BE( "player_damaged", 2, 0 );

    if ( _id_0A77::_id_9F02() || level._id_C552 )
    {
        scripts\engine\utility::_id_6E3E( "pause_wave_progression" );
        level._id_13FA3 = 1;

        foreach ( var_3 in _id_0A4A::_id_7DB0( "axis" ) )
        {
            if ( isdefined( var_3.dont_cleanup ) )
                continue;

            if ( isdefined( var_3.agent_type ) && ( var_3.agent_type == "zombie_brute" || var_3.agent_type == "zombie_grey" ) )
                continue;

            if ( isdefined( var_3.agent_type ) && ( var_3.agent_type == "crab_mini" || var_3.agent_type == "crab_brute" ) )
                var_3.vignette_nocorpse = 1;

            var_3._id_54CB = 1;
            var_3 suicide();
        }

        var_0 thread _id_0A57::wait_and_play_tutorial_message( "afterlife", 18 );
        thread give_solo_self_revive_token( var_0 );
    }

    if ( isdefined( level.enter_afterlife_clear_player_scriptable_func ) )
        [[ level.enter_afterlife_clear_player_scriptable_func ]]( var_0 );

    if ( isdefined( level.aa_ww_char_vo ) )
        var_0 thread [[ level.aa_ww_char_vo ]]( var_0 );
    else
        level thread play_willard_afterlife_vo( var_0 );

    if ( isdefined( level.aa_memoirs_vo ) )
        var_0 thread [[ level.aa_memoirs_vo ]]( var_0 );

    var_0 thread freeze_controls_for_time();
}

play_willard_afterlife_vo( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );

    while ( scripts\engine\utility::_id_9CEE( var_0._id_13518 ) )
        wait 0.1;

    var_0 thread _id_0A6A::_id_12885( "ww_afterlife_arrive", "zmb_afterlife_vo", "high", 20, 0, 0, 1 );
}

freeze_controls_for_time()
{
    self endon( "disconnect" );
    self _meth_8423( 0 );
    wait 3;
    self _meth_8423( 1 );
}

play_ww_vo_memoirs( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "player_done_exit_afterlife" );
    wait( randomintrange( 30, 40 ) );

    if ( !isdefined( var_0.array_of_memoir_vos ) )
        var_0.array_of_memoir_vos = [ "ww_afterlife_memoir_1", "ww_afterlife_memoir_2", "ww_afterlife_memoir_3", "ww_afterlife_memoir_4", "ww_afterlife_memoir_5", "ww_afterlife_memoir_6", "ww_afterlife_memoir_7", "ww_afterlife_memoir_8" ];

    while ( var_0.array_of_memoir_vos.size > 0 )
    {
        if ( randomint( 100 ) < 30 )
            scripts\engine\utility::_id_CE2B( var_0.array_of_memoir_vos[0], level.willard_speaker.origin );

        var_0.array_of_memoir_vos = scripts\engine\utility::array_remove( var_0.array_of_memoir_vos, var_0.array_of_memoir_vos[0] );

        if ( isdefined( var_0.array_of_memoir_vos[0] ) )
        {
            if ( soundexists( var_0.array_of_memoir_vos[0] ) )
                wait( randomfloatrange( 80.0, 110.0 ) + _id_0A6A::_id_7C76( var_0.array_of_memoir_vos[0] ) );

            continue;
        }

        wait( randomfloatrange( 120.0, 180.0 ) );
    }
}

choose_correct_vo_for_player( var_0 )
{
    wait 10;
    var_1 = "";

    if ( var_0._id_11924 >= var_0.max_self_revive_machine_use )
        var_1 = "ww_afterlife_p4_notoken";
    else
    {
        var_2 = [ "ww_afterlife_p1_generic", "ww_afterlife_p5_alt_1", "ww_afterlife_arrive" ];
        var_1 = scripts\engine\utility::_id_DC6B( var_2 );
    }

    if ( var_1 == "ww_afterlife_arrive" )
    {
        var_0 thread _id_0A6A::_id_12885( var_1, "zmb_afterlife_vo", "high", 20, 0, 0, 1 );
        return;
    }

    var_3 = strtok( var_1, "_" );
    var_4 = "";
    var_5 = var_3[3];
    var_6 = var_0.vo_suffix;
    var_7 = strtok( var_6, "_" );
    var_8 = var_7[0];

    switch ( var_8 )
    {
        case "p5":
        case "p4":
        case "p3":
        case "p2":
        case "p1":
            var_4 = choose_vo_based_on_type( var_8, var_5 );
            break;
        default:
            var_4 = var_1;
            break;
    }

    if ( soundexists( var_4 ) )
        var_0 thread _id_0A6A::_id_12885( var_4, "zmb_afterlife_vo", "high", 60, 1, 0, 1 );
}

choose_vo_based_on_type( var_0, var_1 )
{
    var_2 = "ww_afterlife_";

    for (;;)
    {
        var_2 = "ww_afterlife_";

        switch ( var_1 )
        {
            case "generic":
                var_2 = var_2 + var_0 + "_generic";
                break;
            case "notoken":
                var_2 = var_2 + var_0 + "_notoken";
                break;
            case "alt":
                var_2 = var_2 + var_0 + "_alt_1";
                break;
            default:
                break;
        }

        if ( !soundexists( var_2 ) )
        {
            var_3 = [ "ww_afterlife_p1_generic", "ww_afterlife_arrive", "ww_afterlife_p5_alt_1" ];
            var_2 = scripts\engine\utility::_id_DC6B( var_3 );

            if ( var_2 == "ww_afterlife_arrive" )
                return var_2;
            else
            {
                var_4 = strtok( var_2, "_" );
                var_1 = var_4[3];
                continue;
            }
        }
        else
            return var_2;

        scripts\engine\utility::waitframe();
    }

    return var_2;
}

_id_41CE( var_0 )
{
    var_0._id_C8A2 = [];
}

_id_77D5( var_0 )
{
    var_1 = scripts\engine\utility::_id_8180( "afterlife_arcade", "targetname" );

    if ( isdefined( level.additional_afterlife_arcade_start_point ) )
        var_1 = scripts\engine\utility::_id_227F( var_1, level.additional_afterlife_arcade_start_point );

    var_1 = scripts\engine\utility::_id_22A7( var_1 );

    foreach ( var_3 in var_1 )
    {
        if ( can_spawn_at_afterlife_arcade_start_point( var_3, var_0 ) )
            return var_3;
    }

    return scripts\engine\utility::_id_DC6B( var_1 );
}

can_spawn_at_afterlife_arcade_start_point( var_0, var_1 )
{
    var_2 = 16;

    foreach ( var_4 in level.players )
    {
        if ( var_4 == var_1 )
            continue;

        if ( distance2d( var_0.origin, var_4.origin ) < var_2 )
            return 0;
    }

    return 1;
}

_id_12859( var_0 )
{
    if ( _id_9C10( var_0 ) )
        _id_693F( var_0 );
}

clear_up_all_vo_in_afterlife( var_0 )
{
    foreach ( var_2 in level._id_134FE )
    {
        if ( isdefined( var_0._id_13516._id_134FF[var_2] ) && var_0._id_13516._id_134FF[var_2].size > 0 )
        {
            foreach ( var_4 in var_0._id_13516._id_134FF[var_2] )
            {
                if ( isdefined( var_4 ) )
                {
                    if ( issubstr( var_4._id_1B46, "afterlife" ) )
                        var_0 stopolcalsound( var_4._id_1B46 );
                }
            }
        }
    }

    var_7 = undefined;

    if ( isdefined( var_0._id_13516 ) )
    {
        if ( isdefined( var_0._id_13516._id_134C6 ) )
        {
            if ( isdefined( var_0._id_13516._id_134C6._id_1B46 ) )
                var_7 = var_0._id_13516._id_134C6._id_1B46;
        }
    }

    if ( isdefined( var_7 ) )
        var_0 stopolcalsound( var_7 );
}

_id_693F( var_0 )
{
    if ( var_0._id_AF9B == "wave_complete" )
        var_0._id_DDAD = "Wave Complete";
    else
        var_0._id_DDAD = "Self Revive";

    if ( var_0 hasweapon( "iw7_gunless_zm" ) )
        var_0 _meth_83B8( "iw7_gunless_zm" );

    if ( isdefined( level.afterlife_arcade_unset_audio_zone_func ) )
        var_0 thread [[ level.afterlife_arcade_unset_audio_zone_func ]]( var_0 );

    level thread _id_4250( var_0 );
    level thread clear_up_all_vo_in_afterlife( var_0 );

    if ( isdefined( var_0._id_55D5 ) && var_0._id_55D5 >= 1 )
        var_0 scripts\engine\utility::_id_1C53( 1 );

    var_0._id_6977 = 1;
    var_0._id_1192F = ( gettime() - var_0._id_118EE ) / 1000;
    _id_0D45::_id_AF6B( 1, var_0, level._id_13BD3, var_0._id_DDAD, var_0._id_1192F );
    var_0 scripts\engine\utility::_id_1C6E( 0 );
    var_0 _id_F418( var_0, 0 );
    var_0 _id_18E4( var_0, 0 );
    var_0 _id_0A77::_id_1012C( var_0._id_92B4 );
    var_0 visionsetnakedforplayer( "", 0 );
    var_0 setclientomnvar( "zm_ui_player_in_afterlife_arcade", 0 );
    var_0._id_9C54 = undefined;
    var_0.is_in_pap = undefined;
    var_0 setclientomnvar( "zombie_afterlife_soul_power_needed", -1 );
    var_0 thread _id_CD06( var_0 );
    var_0 notify( "player_done_exit_afterlife" );
}

_id_CD06( var_0 )
{
    var_0 endon( "disconnect" );

    if ( isdefined( var_0.ignoreselfrevive ) )
        return;

    wait 4.0;

    if ( !isdefined( var_0._id_C1F9 ) )
        var_0._id_C1F9 = 0;

    var_0._id_C1F9++;

    if ( var_0._id_C1F9 == 1 )
        var_0 thread _id_0A6A::_id_12885( "arcade_token_revive_first", "zmb_comment_vo", "low", 3, 0, 0, 1 );
    else
        var_0 thread _id_0A6A::_id_12885( "arcade_token_revive", "zmb_comment_vo", "low", 3, 0, 0, 1 );
}

_id_5172()
{
    wait 0.1;
    self delete();
}

_id_50CD( var_0, var_1 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "player_exit_afterlife" );
    scripts\engine\utility::waitframe();
    var_0 setplayerangles( var_1 );
}

_id_2B1D( var_0 )
{
    var_0 endon( "disconnect" );
    var_1 = newclienthudelem( var_0 );
    var_1.x = 0;
    var_1.y = 0;
    var_1 setshader( "black", 640, 480 );
    var_1._id_002B = "left";
    var_1._id_002C = "top";
    var_1._id_02A4 = 1;
    var_1._id_017D = "fullscreen";
    var_1._id_0382 = "fullscreen";
    var_1.alpha = 1;
    var_1._id_0142 = 1;
    var_1 fadeovertime( 15.0 );
    var_1.alpha = 0;
    var_1 _id_0A77::_id_1372C( 15.0, var_0, "player_exit_afterlife", level, "game_ended" );
    var_1 destroy();
}

_id_18E5( var_0 )
{
    var_0._id_9A3F = _id_0A59::_id_7B99();
    _id_0A59::_id_E1F8();
    var_0._id_A8D3 = undefined;
    var_0._id_9A3F makeunusable();
    var_0 thread _id_18E7();
    var_0 thread _id_0A59::_id_D103();
}

_id_18E7()
{
    var_0 = self._id_9A3F;
    scripts\engine\utility::waittill_any( "player_exit_afterlife", "spawned", "disconnect" );
    var_0._id_93A8 = 0;
}

_id_F418( var_0, var_1 )
{
    var_0._id_9387 = var_1;
}

_id_18E4( var_0, var_1 )
{
    var_0._id_C004 = var_1;
    var_0._id_C016 = var_1;
}

_id_9C10( var_0 )
{
    return scripts\engine\utility::_id_9CEE( var_0._id_9387 );
}

_id_975E()
{

}

_id_972F()
{

}

_id_1301F( var_0, var_1 )
{
    if ( level.players.size == 1 )
    {
        var_1 _id_0A59::_id_9A3C( var_0, &"CP_ZOMBIE_AFTERLIFE_ARCADE_CANNOT_SPECTATE" );
        return;
    }

    var_1._id_D7DC = var_1.origin;
    var_1._id_D7DB = var_1 getplayerangles();
    var_1 _id_0A55::_id_662C();
    var_1 thread _id_6962( var_1 );
}

_id_6962( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "player_exit_afterlife" );
    var_0 endon( "spawned" );
    var_0 notifyonplayercommand( "release_use_button", "-usereload" );
    var_0 notifyonplayercommand( "release_use_button", "-activate" );
    var_0 notifyonplayercommand( "press_use_button", "+usereload" );
    var_0 notifyonplayercommand( "press_use_button", "+activate" );
    var_0 waittill( "release_use_button" );
    var_0 waittill( "press_use_button" );
    var_0 _id_0A77::updatesessionstate( "playing" );
    var_0 spawn( var_0._id_D7DC, var_0._id_D7DB );
    var_0 _meth_8422( 0 );
    var_0 _meth_8424( 0 );
}

_id_1300F( var_0, var_1 )
{
    var_1 endon( "disconnect" );

    if ( var_1 _id_0A77::_id_9F02() || level._id_C552 )
    {
        if ( !scripts\engine\utility::_id_9CEE( level.dont_resume_wave_after_solo_afterlife ) )
            level thread resumespawningaftertime();
    }

    if ( !isdefined( var_1.ignoreselfrevive ) )
        var_1 _id_1794();

    if ( isdefined( var_1._id_55D5 ) && var_1._id_55D5 >= 1 )
        var_1 scripts\engine\utility::_id_1C53( 1 );

    if ( !isdefined( var_1.ignoreselfrevive ) )
    {
        _id_BC83( var_1, "fast_travel_tube_start", "fast_travel_tube_end" );
        var_1 thread _id_E0AE( 0.1 );
    }

    var_1 notify( "player_exit_afterlife" );
    var_1 _id_0A5B::_id_992F( var_1 );
    var_1 setclientomnvar( "zombie_afterlife_soul_power_earned", 0 );
    var_1 setclientomnvar( "zombie_afterlife_soul_power_goal", 0 );
    var_1 setclientomnvar( "zombie_afterlife_soul_power_needed", -1 );
    var_1 _id_F3FA( var_1, 0 );

    if ( var_1 _id_0A77::_id_9BA0( "self_revive" ) )
        return;

    if ( var_1 _id_0A77::_id_9F02() || level._id_C552 )
    {
        var_1._id_11924 = var_1._id_F1E7;
        var_2 = var_1.max_self_revive_machine_use - var_1._id_11924;
    }
    else
    {
        var_1._id_11924 = var_1._id_11924 + 1;
        var_2 = int( level._id_13BD3 / 10 ) + 1 - var_1._id_11924;
    }

    var_1 setclientomnvar( "zombie_afterlife_self_revive_count", int( max( var_2, 0 ) ) );
    var_1 thread set_spawn_defaults();
}

set_spawn_defaults()
{
    self endon( "disconnect" );
    wait 0.15;
    self _meth_8422( 0 );
    self _meth_8427( 1 );
    self _meth_8424( 0 );
    self _meth_8412( 0 );
    self _meth_8426( 0 );
    self _meth_8425( 0 );
    self _meth_8454( 3 );

    if ( isdefined( level.player_suit ) )
        self _meth_845A( level.player_suit );
    else
        self _meth_845A( "zom_suit" );

    self._id_111BC = "zom_suit";
}

resumespawningaftertime()
{
    level endon( "game_ended" );
    wait 20;
    level._id_13FA3 = 0;
    scripts\engine\utility::_id_6E2A( "pause_wave_progression" );
}

_id_12E0E( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_1 = 0;

    while ( var_1 < 2 )
    {
        level scripts\engine\utility::waittill_any( "regular_wave_starting", "event_wave_starting" );

        if ( var_0 _id_0A77::_id_9F02() || level._id_C552 )
            continue;
        else
            var_2 = int( level._id_13BD3 / 10 ) + 1 - var_0._id_11924;

        var_0 setclientomnvar( "zombie_afterlife_self_revive_count", int( max( var_2, 0 ) ) );
        var_1++;
    }
}

_id_BC83( var_0, var_1, var_2 )
{
    var_3 = getent( var_1, "targetname" );
    var_4 = getent( var_2, "targetname" );

    if ( !isdefined( var_3 ) || !isdefined( var_4 ) )
        return;

    var_0 _meth_844F( 0.3, 0.2, var_0.origin, 200 );
    var_0 _meth_805B();
    var_0._id_C004 = 1;
    var_0._id_C016 = 1;
    var_5 = var_3.origin + ( 0, 0, -45 );
    var_6 = var_4.origin + ( 0, 0, -45 );
    var_0._id_9BE1 = 1;
    var_0 _id_0A77::_id_1C5C( 1 );
    var_0 dontinterpolate();
    var_0 setorigin( var_5 );
    var_0 setplayerangles( var_3.angles );
    var_0 playlocalsound( "zmb_portal_travel_lr" );
    var_7 = spawn( "script_origin", var_5 );
    var_0 _meth_823A( var_7 );
    wait 0.1;
    var_7 moveto( var_6, 1 );
    var_0 thread _id_E0AE( 0.1 );
    wait 1;
    var_0._id_9BE1 = undefined;

    if ( var_0 _id_0A77::_id_9E3A() )
        var_0 _id_0A77::_id_1C5C( 0 );

    var_0._id_C004 = 0;
    var_0._id_C016 = 0;

    if ( isdefined( level._id_D679 ) )
    {
        var_8 = anglestoforward( ( 0, 90, 0 ) );
        playfx( level._effect["vfx_zmb_portal_exit_burst"], level._id_D679, var_8 );
    }

    var_0 _id_1794();
    var_7 thread _id_5172();
}

_id_1794()
{
    if ( isdefined( self._id_13D0C ) )
        return;

    self._id_13D0C = newclienthudelem( self );
    self._id_13D0C.x = 0;
    self._id_13D0C.y = 0;
    self._id_13D0C setshader( "white", 640, 480 );
    self._id_13D0C._id_002B = "left";
    self._id_13D0C._id_002C = "top";
    self._id_13D0C._id_02A4 = 1;
    self._id_13D0C._id_017D = "fullscreen";
    self._id_13D0C._id_0382 = "fullscreen";
    self._id_13D0C.alpha = 1;
    self._id_13D0C._id_0142 = 1;
}

_id_E0AE( var_0 )
{
    self endon( "disconnect" );

    if ( isdefined( var_0 ) )
        wait( var_0 );

    if ( isdefined( self._id_13D0C ) )
    {
        self._id_13D0C.alpha = 0;
        wait 0.1;

        if ( isdefined( self._id_13D0C ) )
            self._id_13D0C destroy();
    }
}

_id_386A( var_0, var_1 )
{
    if ( _id_0A77::_id_9F02() || scripts\engine\utility::_id_9CEE( level._id_C552 ) )
        return 1;

    if ( _id_8BA8( var_1 ) )
        return 1;

    return 0;
}

_id_7C53( var_0, var_1 )
{
    if ( _id_3DCA( var_1 ) )
    {
        if ( _id_8BA8( var_1 ) || _id_0A77::_id_9F02() || scripts\engine\utility::_id_9CEE( level._id_C552 ) )
            return &"CP_ZOMBIE_AFTERLIFE_ARCADE_SELFREVIVE_DOOR";
        else
            return &"CP_ZOMBIE_AFTERLIFE_ARCADE_NEED_SELFREVIVE_TOKEN";
    }
    else
        return &"CP_ZOMBIE_AFTERLIFE_ARCADE_NO_MORE_SELF_REVIVES";
}

_id_832E( var_0 )
{
    var_0 thread _id_0A6A::_id_12885( "arcade_token_earn", "zmb_comment_vo", "low", 3, 0, 0, 1 );
    var_0 playlocalsound( "zmb_ala_soul_meter_filled" );
    var_0 _id_F3FA( var_0, 1 );
    var_0._id_10450 = 0;
    var_0._id_1044F = 0;
    level thread _id_C5DA( var_0, 165 );
    wait 5;
    var_0 thread _id_0A6A::_id_12885( "ww_afterlife_overstay", "zmb_afterlife_vo", "high", undefined, undefined, undefined, 1 );
}

give_solo_self_revive_token( var_0 )
{
    var_0 playlocalsound( "zmb_ala_soul_meter_filled" );
    var_0 _id_F3FA( var_0, 1 );
    var_0 setclientomnvar( "zombie_afterlife_soul_power_needed", -1 );
    var_0._id_10450 = 0;
    var_0._id_1044F = 0;
    level thread _id_C5DA( var_0, 165 );
}

_id_C5DA( var_0, var_1 )
{
    if ( !isdefined( level._id_1B14 ) )
    {
        level._id_1B15 = getent( "ala_revive_door", "targetname" );
        var_2 = scripts\engine\utility::_id_817E( "selfrevive_portal", "targetname" );
        level._id_1B14 = spawn( "script_model", var_2.origin );
        level._id_1B14 setmodel( "tag_origin" );
        level._id_1B14.angles = var_2.angles;
        wait 0.1;
    }

    if ( !isdefined( var_0._id_E498 ) )
    {
        var_0._id_E498 = spawn( "script_model", level._id_1B15.origin + ( 0, 0, -300 ) );
        var_0._id_E498 setmodel( level._id_1B15._id_01F1 );
        var_0._id_E498.angles = level._id_1B15.angles;

        foreach ( var_4 in level.players )
        {
            if ( var_4 != var_0 )
                var_0._id_E498 _meth_8429( var_4 );
        }

        wait 0.1;
        var_0._id_E498.origin = var_0._id_E498.origin + ( 0, 0, 300 );
        wait 0.1;
        level._id_1B15 _meth_8429( var_0 );
    }

    var_0._id_E498 _meth_8271( var_1, 0.2 );
    var_6 = level._effect["vfx_zmb_portal_centhub"];

    if ( isdefined( level.centhub_portal_fx ) )
        var_6 = level.centhub_portal_fx;

    playfxontagforclients( var_6, level._id_1B14, "tag_origin", var_0 );
}

_id_4250( var_0 )
{
    if ( isdefined( var_0._id_E498 ) )
        var_0._id_E498.angles = level._id_1B15.angles;

    _func_297( level._effect["vfx_zmb_portal_centhub"], level._id_1B14, "tag_origin", var_0 );
}

_id_F3FA( var_0, var_1 )
{
    var_0._id_8BA8 = var_1;

    if ( var_1 == 1 )
        var_0 setclientomnvar( "zombie_afterlife_has_self_revive_token", 1 );
    else
        var_0 setclientomnvar( "zombie_afterlife_has_self_revive_token", 0 );
}

_id_8BA8( var_0 )
{
    return scripts\engine\utility::_id_9CEE( var_0._id_8BA8 );
}

_id_3DCA( var_0 )
{
    if ( _id_0A77::_id_9F02() || level._id_C552 )
        return 1;
    else if ( scripts\engine\utility::_id_9CEE( var_0.have_gns_perk ) )
        return 1;
    else if ( var_0._id_11924 >= var_0.max_self_revive_machine_use )
        return 0;
    else if ( int( level._id_13BD3 / 10 ) + 1 - var_0._id_11924 >= 1 )
        return 1;
    else
        return 0;
}

_id_D058( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "player_done_exit_afterlife" );
    var_0 scripts\engine\utility::_id_13734( "player_exit_afterlife", "spawned" );
    var_0 _id_693F( var_0 );
}

_id_94D7()
{
    level._id_11929 = 0;
    level._id_CF91 = ::_id_6603;
}

_id_10B95()
{
    var_0 = spawn( "script_origin", ( -10100, 114, -1753 ) );
    var_0 playloopsound( "zmb_afterlife_music" );
}

_id_D052( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "player_done_exit_afterlife" );
    wait 3.0;

    if ( _id_3DCA( var_0 ) )
        _id_12991( var_0 );

    var_0 visionsetnakedforplayer( "", 2.0 );
}

_id_12991( var_0 )
{
    var_0 setclientomnvar( "zombie_afterlife_soul_power_earned", var_0._id_10450 );
    var_0 setclientomnvar( "zombie_afterlife_soul_power_needed", var_0._id_10451 );
    var_0 setclientomnvar( "zombie_afterlife_soul_power_goal", var_0._id_10451 );
}

_id_D0F7( var_0 )
{
    var_0._id_92B4 = [];
}

_id_1766( var_0, var_1 )
{
    var_0._id_92B4[var_0._id_92B4.size] = var_1;
}

_id_E01E( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_0._id_92B4 = scripts\engine\utility::array_remove( var_0._id_92B4, var_1 );
    var_0._id_92B4 = scripts\engine\utility::_id_22BC( var_0._id_92B4 );
}

_id_974F( var_0 )
{
    var_0._id_10450 = 0;
    var_0._id_1044F = 0;
    var_0._id_11924 = 0;
    var_0._id_10451 = _id_7C74( var_0 );
}

_id_8334( var_0, var_1 )
{
    if ( _id_3DCA( var_0 ) && !_id_8BA8( var_0 ) )
    {
        var_0._id_10450 = var_0._id_10450 + var_1;
        var_0 thread _id_56C9( var_0 );
    }
}

_id_56C9( var_0 )
{
    var_0 notify( "display_soul_power_earned" );
    level endon( "game_ended" );
    var_0 endon( "display_soul_power_earned" );
    var_0 endon( "revive" );

    while ( var_0._id_1044F < min( var_0._id_10450, var_0._id_10451 ) )
    {
        var_1 = min( var_0._id_10450, var_0._id_10451 );
        var_2 = var_0._id_1044F + 5;
        var_0._id_1044F = min( var_2, var_1 );
        var_0 setclientomnvar( "zombie_afterlife_soul_power_earned", int( var_0._id_1044F ) );
        var_0 setclientomnvar( "zombie_afterlife_soul_power_needed", int( var_0._id_10451 - var_0._id_1044F ) );
        scripts\engine\utility::waitframe();
    }

    if ( var_0._id_10450 >= var_0._id_10451 )
    {
        if ( _id_3DCA( var_0 ) )
            _id_832E( var_0 );
    }
}

_id_93E4( var_0 )
{
    if ( !isdefined( var_0._id_C207 ) )
        var_0._id_C207 = 0;

    var_0._id_C207++;
}

_id_7C74( var_0 )
{
    if ( _id_0A77::_id_9F02() || scripts\engine\utility::_id_9CEE( level._id_C552 ) )
        return 0;
    else
        return 200;
}

_id_DEBC()
{
    level._id_9A12["afterlife_spectate_door"] = &"CP_ZOMBIE_AFTERLIFE_ARCADE_SPECTATE_DOOR";
    _id_0A59::_id_DEBB( "afterlife_spectate_door", undefined, undefined, undefined, ::_id_1301F, 0, 0, ::_id_975E );
    _id_0A59::_id_DEBB( "afterlife_selfrevive_door", undefined, undefined, ::_id_7C53, ::_id_1300F, 0, 0, ::_id_972F, ::_id_386A );
}

_id_E226( var_0 )
{
    var_0._id_10450 = 0;
    var_0._id_1044F = 0;
    var_0 setclientomnvar( "zombie_afterlife_soul_power_earned", var_0._id_10450 );
}
