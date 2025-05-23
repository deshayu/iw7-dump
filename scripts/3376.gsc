// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_954B()
{
    level._id_2B45 = 0;
    var_0 = undefined;
    var_1 = undefined;
    var_2 = undefined;
    var_3 = scripts\engine\utility::_id_8180( "blackhole_trap", "script_noteworthy" );

    foreach ( var_5 in var_3 )
    {
        var_5 thread _id_2B36();
        var_5._id_2C09 = getent( var_5._id_0334, "targetname" );
        var_6 = scripts\engine\utility::_id_8180( var_5._id_0334, "targetname" );

        foreach ( var_8 in var_6 )
        {
            if ( isdefined( var_8.radius ) )
            {
                var_5._id_2B32 = var_8;
                continue;
            }

            var_5._id_2B30 = var_8;
        }

        var_5._id_2B37 = spawn( "trigger_radius", var_5._id_2B32.origin, 0, var_5._id_2B32.radius, 96 );
    }
}

_id_2B36()
{
    var_0 = scripts\engine\utility::_id_9CEE( self._id_E1B9 ) && isdefined( self._id_D71C );

    for (;;)
    {
        var_1 = "power_on";

        if ( var_0 )
        {
            var_1 = level scripts\engine\utility::_id_13735( "power_on", self._id_D71C + " power_on", "power_off" );

            if ( var_1 != "power_off" )
            {
                self._id_D776 = 1;
                self._id_2C09 setmodel( "ride_zombies_chromosphere_on" );
                level thread _id_0A6A::_id_1769( "dj_traps_use_nag", "zmb_dj_vo", 60, 15, 2, 1 );
            }
            else
                self._id_D776 = 0;
        }

        if ( !var_0 )
            break;

        wait 0.25;
    }
}

_id_12FAE( var_0, var_1 )
{
    playfx( level._effect["console_spark"], var_0.origin + ( 0, 0, 40 ) );
    level._id_2B45++;
    var_1 thread _id_0A6A::_id_12885( "activate_trap_generic", "zmb_comment_vo", "low", 10, 0, 1, 0, 40 );
    _id_0A59::_id_554F( var_0 );
    level._id_1E90 = 0;
    var_0._id_126A4 = 0;
    var_2 = gettime() + 20000;
    var_0._id_2C09 _meth_8271( 10800, int( 21 ), 5, 5 );
    var_0 thread _id_A631( var_1 );
    earthquake( 0.28, int( 21 ), var_0._id_2C09.origin, 500 );
    var_0 thread _id_2B35( int( 21 ), var_0._id_2C09.origin );
    level thread _id_2B34( var_2 );

    while ( gettime() < var_2 )
        wait 1;

    var_0 notify( "stop_dmg" );
    var_0._id_2B30._id_7542 delete();

    if ( var_1 _id_0A77::_id_9D05() )
    {
        var_1._id_1189F = var_0._id_126A4;
        _id_0D2B::_id_12E11( var_1 );
    }

    wait 3;
    _id_0A59::_id_6214( var_0 );
    _id_0A59::_id_9A0D( var_0, max( level._id_2B45 * 45, 45 ) );
}

_id_2B34( var_0 )
{
    var_1 = getent( "chromosphere_sign", "targetname" );
    var_1 setscriptablepartstate( "quake", "on" );

    while ( gettime() < var_0 )
    {
        var_1 setscriptablepartstate( "rumble", "rumble1" );
        wait 1;
        var_1 setscriptablepartstate( "rumble", "rumble2" );
        wait 1;
    }

    var_1 setscriptablepartstate( "rumble", "off" );
    var_1 setscriptablepartstate( "quake", "off" );
}

_id_2B35( var_0, var_1 )
{
    playloopsound( var_1, "trap_blackhole_ride_start" );
    wait 2.0;
    var_2 = scripts\engine\utility::_id_CD86( "trap_blackhole_ride_loop", var_1 );
    wait 0.8;
    playloopsound( ( -3321, 802, 888 ), "trap_blackhole_energy_start" );
    wait 0.6;
    var_3 = scripts\engine\utility::_id_CD86( "trap_blackhole_energy_close_lp", ( -3321, 802, 888 ) );
    wait 0.1;
    var_4 = scripts\engine\utility::_id_CD86( "trap_blackhole_trap_suction_lp", ( -3013, 833, 511 ) );
    wait( var_0 - 8.5 );
    playloopsound( var_1, "trap_blackhole_ride_stop" );
    wait 1.0;
    var_2 stoploopsound();
    wait 3.5;
    playloopsound( ( -3321, 802, 888 ), "trap_blackhole_energy_end" );
    var_3 stoploopsound();
    var_4 stoploopsound();
    var_2 delete();
    var_3 delete();
    var_4 delete();
}

_id_A631( var_0 )
{
    self endon( "stop_dmg" );
    wait 2;
    self._id_2B30._id_7542 = spawnfx( level._effect["blackhole_trap"], self._id_2B30.origin, anglestoforward( self._id_2B30.angles ), anglestoup( self._id_2B30.angles ) );
    wait 1;
    triggerfx( self._id_2B30._id_7542 );

    for (;;)
    {
        self._id_2B37 waittill( "trigger", var_1 );

        if ( !_id_0A77::_id_FF18( var_1 ) || isdefined( var_1._id_6F73 ) )
            continue;

        var_1._id_6F73 = 1;
        var_1 thread _id_111B0( var_0, self );
        level thread _id_0D62::_id_CE9C( var_1, "death_blackhole", 0 );
    }
}

_id_111B0( var_0, var_1 )
{
    self endon( "death" );
    var_2 = var_1._id_2B30;
    var_3 = var_1._id_2B32;
    self._id_EF64 = 1;
    wait( randomfloatrange( 0, 1 ) );
    var_4 = 16384;

    while ( distancesquared( self.origin, var_3.origin ) > var_4 )
    {
        self _meth_8366( vectornormalize( var_3.origin - self.origin ) * 150 + ( 0, 0, 30 ) );
        wait 0.05;
    }

    if ( !isdefined( var_2._id_7542 ) )
    {
        self._id_EF64 = 0;
        self._id_6F73 = undefined;
    }
    else
    {
        var_5 = 2304;
        self._id_C026 = 1;
        self._id_0180 = 1;
        self._id_1E6E = spawn( "script_origin", self.origin );
        self._id_1E6E.angles = self.angles;
        self linkto( self._id_1E6E );
        self._id_1E6E rotateto( ( -90, 0, 0 ), 0.2 );
        var_6 = 360;

        if ( randomint( 100 ) > 50 )
            var_6 = -360;

        self._id_1E6E _meth_826D( var_6, 1.5 );
        self._id_1E6E moveto( var_2.origin, 1.5 );
        wait 1.5;
        playloopsound( self.origin, "trap_blackhole_body_gore" );
        playfx( level._effect["blackhole_trap_death"], self.origin, anglestoforward( ( -90, 0, 0 ) ), anglestoup( ( -90, 0, 0 ) ) );
        self._id_1E6E delete();
        self._id_5502 = 1;
        var_1._id_126A4 = var_1._id_126A4 + 2;

        if ( scripts\engine\utility::_id_6E25( "mini_ufo_red_ready" ) )
            level._id_1E90++;

        if ( isdefined( var_0 ) )
        {
            if ( !isdefined( var_0._id_126B0["trap_gravitron"] ) )
                var_0._id_126B0["trap_gravitron"] = 1;
            else
                var_0._id_126B0["trap_gravitron"]++;

            var_7 = [ "kill_trap_generic", "kill_trap_gravitron" ];
            var_0 thread _id_0A6A::_id_12885( scripts\engine\utility::_id_DC6B( var_7 ), "zmb_comment_vo", "highest", 10, 0, 0, 1, 25 );
            self _meth_80B0( self.health + 100, var_2.origin, var_0, var_0, "MOD_UNKNOWN", "iw7_chromosphere_zm" );
            return;
        }

        self _meth_80B0( self.health + 100, var_2.origin, undefined, undefined, "MOD_UNKNOWN", "iw7_chromosphere_zm" );
    }
}
