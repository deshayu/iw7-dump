// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_9713()
{
    level._id_E5E2 = 0;
    var_0 = scripts\engine\utility::_id_8180( "rockettrap", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_E5D9();
}

_id_E5D9()
{
    var_0 = scripts\engine\utility::_id_8180( self._id_0334, "targetname" );
    var_1 = undefined;
    var_2 = undefined;

    foreach ( var_4 in var_0 )
    {
        if ( var_4.script_noteworthy == "rocket_blast_fx" )
            self._id_026C = var_4;

        if ( var_4.script_noteworthy == "rocket_blast_trigger" )
            self._id_4CDF = var_4;
    }

    var_6 = getentarray( self._id_0334, "targetname" );
    var_7 = undefined;
    var_8 = scripts\engine\utility::_id_9CEE( self._id_E1B9 ) && isdefined( self._id_D71C );
    var_9 = "power_on";

    foreach ( var_11 in var_6 )
    {
        if ( var_11.classname == "light_spot" )
            var_7 = var_11;
    }

    var_7 setlightintensity( 0 );

    for (;;)
    {
        if ( var_8 )
            var_9 = level scripts\engine\utility::_id_13735( "power_on", self._id_D71C + " power_on", "power_off" );

        if ( var_9 != "power_off" )
        {
            for ( var_13 = 0; var_13 < 3; var_13++ )
            {
                var_7 setlightintensity( 100 );
                wait( randomfloatrange( 0.5, 1 ) );
                var_7 setlightintensity( 0 );
                wait( randomfloatrange( 0.5, 1 ) );
            }

            var_7 setlightintensity( 100 );
            self._id_D776 = 1;
            level thread _id_E5D6();
            level thread _id_0A6A::_id_1769( "dj_traps_use_nag", "zmb_dj_vo", 60, 15, 2, 1 );
        }
        else
        {
            var_7 setlightintensity( 0 );
            self._id_D776 = 0;
        }

        if ( !var_8 )
            break;
    }
}

_id_1300A( var_0, var_1 )
{
    playfx( level._effect["console_spark"], var_0.origin + ( 0, 0, 40 ) );
    var_2 = sortbydistance( scripts\engine\utility::_id_8180( "fm_start_struct", "targetname" ), var_1.origin );
    level._id_E5E2++;
    level._id_E5D7 = 0;
    level._id_7047 = var_2[0];
    _id_0A59::_id_554F( var_0 );

    if ( !isdefined( level._id_E5D5 ) )
    {
        level._id_E5D5 = spawn( "trigger_radius", var_0._id_4CDF.origin, 0, var_0._id_4CDF.radius, 128 );
        level._id_E5D8 = spawn( "script_origin", var_0._id_026C.origin );
    }

    var_1 thread _id_0A6A::_id_12885( "activate_trap_generic", "zmb_comment_vo", "low", 10, 0, 0, 0, 50 );
    var_0._id_126A4 = 0;
    var_0._id_126A5 = var_1;
    _id_E5D3();
    level notify( "rocket_idle_stop" );
    scripts\engine\utility::_id_69A3( 56 );
    level thread _id_E5D4( level._id_E5D5, var_1, var_0 );

    if ( scripts\engine\utility::_id_6E25( "mini_ufo_blue_ready" ) )
        level thread _id_13622();

    level._id_E5D8 playsound( "trap_rocket_start" );
    wait 1.95;
    scripts\engine\utility::_id_69A3( 57 );
    earthquake( 0.3, 25, var_0._id_026C.origin, 850 );
    scripts\engine\utility::waitframe();
    level._id_E5D8 playloopsound( "trap_rocket_lp" );
    wait 21;
    level._id_E5D8 stoploopsound( "trap_rocket_lp" );
    level._id_E5D8 playsound( "trap_rocket_stop" );
    wait 0.75;
    level._id_E5D8 stoploopsound( "trap_rocket_lp" );
    level notify( "rocket_trap_done" );

    if ( var_1 _id_0A77::_id_9D05( 1 ) )
    {
        var_1._id_1189F = var_0._id_126A4 * 2;
        _id_0D2B::_id_12E11( var_1 );
    }

    wait 3;
    _id_0A59::_id_6214( var_0 );
    _id_0A59::_id_9A0D( var_0, max( level._id_E5E2 * 45, 45 ) );
    level thread _id_E5D6();
}

_id_E5D3()
{
    earthquake( 0.12, 4, level._id_E5D5.origin, 1000 );
    playloopsound( level._id_E5D5.origin, "trap_rocket_alarm" );
    wait 1;
    playloopsound( level._id_E5D5.origin, "trap_rocket_alarm" );
    wait 1;
}

_id_E5D4( var_0, var_1, var_2 )
{
    level endon( "rocket_trap_done" );

    for (;;)
    {
        var_0 waittill( "trigger", var_3 );

        if ( isplayer( var_3 ) && isalive( var_3 ) && !_id_0A5B::_id_D0EF( var_3 ) && !isdefined( var_3._id_C85F ) )
        {
            var_3._id_C85F = 1;
            var_3 _meth_80B0( 35, var_3.origin, undefined, undefined, "MOD_UNKNOWN", "iw7_rockettrap_zm" );
            playfxontagforclients( level._effect["player_scr_fire"], var_3, "tag_eye", var_3 );
            var_3 thread _id_E069();
            continue;
        }

        if ( _id_0A77::_id_FF18( var_3, undefined, 1 ) )
        {
            if ( scripts\engine\utility::_id_9CEE( var_3._id_9B81 ) )
                continue;

            if ( scripts\engine\utility::_id_9CEE( var_3._id_9CDD ) )
            {
                var_3._id_9B81 = 1;
                level notify( "rocket_trap_kill" );
                var_2._id_126A4++;
                var_3 _meth_80B0( var_3.health + 1000, var_3.origin, undefined, undefined, "MOD_UNKNOWN", "iw7_rockettrap_zm" );
                continue;
            }

            var_4 = [ "kill_trap_generic", "kill_trap_rocket" ];
            var_1 thread _id_0A6A::_id_12885( scripts\engine\utility::_id_DC6B( var_4 ), "zmb_comment_vo", "highest", 10, 0, 0, 1, 25 );
            var_3._id_B36E = 1;
            var_3._id_126A3 = var_1;

            if ( isdefined( var_1 ) )
            {
                if ( !isdefined( var_1._id_126B0["trap_rocket"] ) )
                    var_1._id_126B0["trap_rocket"] = 1;
                else
                    var_1._id_126B0["trap_rocket"]++;

                var_2._id_126A4++;
                var_3 thread _id_0A77::_id_4D0D( var_3, var_1, 1.5, int( var_3.health + 100 ), "MOD_UNKNOWN", "iw7_rockettrap_zm", 1, "burning", "rocket_trap_kill" );
            }
            else
                var_3 thread _id_0A77::_id_4D0D( var_3, undefined, 1.5, int( var_3.health + 100 ), "MOD_UNKNOWN", "iw7_rockettrap_zm", 1, "burning", "rocket_trap_kill" );
        }
    }
}

_id_E069()
{
    self endon( "disconnect" );
    wait 0.25;
    self._id_C85F = undefined;
}

_id_13622()
{
    level endon( "rocket_trap_done" );

    for (;;)
    {
        level waittill( "rocket_trap_kill" );
        level._id_E5D7++;
    }
}

_id_E5D6()
{
    level endon( "rocket_idle_stop" );

    for (;;)
    {
        scripts\engine\utility::_id_69A3( 55 );
        wait 1;
    }
}
