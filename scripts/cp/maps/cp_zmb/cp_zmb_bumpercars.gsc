// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_9560()
{
    var_0 = getentarray( "bumper_car", "targetname" );

    if ( !var_0.size )
        return;

    foreach ( var_2 in var_0 )
    {
        if ( var_2.origin == ( 4113.9, 184.9, 112 ) )
            var_2._id_6B89 = 1;
        else
            var_2._id_6B89 = 0;

        var_2._id_5764 = getent( var_2._id_0334, "targetname" );
        var_2._id_5764 _meth_80D2();
        var_2._id_5764 linkto( var_2 );
        var_2._id_7541 = scripts\engine\utility::_id_817E( var_2._id_0334, "targetname" );
        var_2._id_DDAA = scripts\engine\utility::_id_817E( var_2._id_7541._id_0334, "targetname" );
        var_2._id_380B = 0;
        var_2._id_7541.origin = ( var_2._id_7541.origin[0], var_2._id_7541.origin[1], var_2.origin[2] );
        var_2._id_DDAA.origin = ( var_2._id_DDAA.origin[0], var_2._id_DDAA.origin[1], var_2.origin[2] );
        scripts\engine\utility::waitframe();
    }

    level waittill( "moon_bumpercars power_on" );
    var_4 = getent( "bumpercar_clip", "targetname" );
    var_4 connectpaths();
    var_4 notsolid();

    foreach ( var_6, var_2 in var_0 )
    {
        var_2.name = "car_" + var_6;
        var_2 thread _id_A631();
        scripts\engine\utility::waitframe();
    }

    level._id_3261 = scripts\engine\utility::_id_8180( "bumpercar_impact", "targetname" );

    for (;;)
    {
        var_0 = scripts\engine\utility::_id_22A7( var_0 );

        foreach ( var_6, var_2 in var_0 )
            var_2 _id_1594( var_6 );
    }
}

_id_1594( var_0 )
{
    var_1 = scripts\engine\trace::_id_48B1();
    var_2 = [ self ];

    if ( !isdefined( self._id_10E19 ) )
    {
        self._id_10E19 = "rear";
        self._id_380B = 0;
    }

    var_3 = 1.75;

    if ( self._id_6B89 )
        var_3 = 1.2;

    wait( randomfloatrange( 1, 3 ) );

    if ( self._id_10E19 == "fwd" )
    {
        for (;;)
        {
            var_4 = physics_spherecast( self.origin + ( 0, 0, 60 ), self._id_7541.origin + ( 0, 0, 60 ), 32, var_1, var_2, "physicsquery_all" );

            if ( var_4.size == 0 )
                break;

            var_5 = 0;

            for ( var_6 = 0; var_6 < var_4.size; var_6++ )
            {
                if ( !isdefined( var_4[var_6]["entity"] ) )
                    continue;

                if ( isplayer( var_4[var_6]["entity"] ) && ( _id_0A5B::_id_D0EF( var_4[var_6]["entity"] ) || scripts\engine\utility::_id_9CEE( var_4[var_6]["entity"]._id_9F28 ) ) )
                    var_5 = 1;
            }

            if ( var_5 )
                return;
            else
                break;

            wait 0.1;
        }

        if ( self._id_6B89 )
            self playsoundonmovingent( "trap_bumper_car_mvmt_short" );
        else
            self playsoundonmovingent( "trap_bumper_car_mvmt_long" );

        self setscriptablepartstate( "bumpercar", "moving" );
        wait 0.3;
        self playsound( "trap_bumper_car_lights" );
        self setscriptablepartstate( "lights", "lights_on" );
        wait 0.35;
        self setscriptablepartstate( "lights", "lights_off" );
        wait 0.35;
        self playsound( "trap_bumper_car_lights" );
        self setscriptablepartstate( "lights", "lights_on" );
        wait 0.35;
        self setscriptablepartstate( "lights", "lights_off" );
        wait 0.4;
        self setscriptablepartstate( "lights", "lights_on" );
        self playsound( "trap_bumper_car_lights" );
        wait 0.4;
        self setscriptablepartstate( "lights", "lights_off" );
        wait 0.5;
        self setscriptablepartstate( "lights", "lights_on" );
        self._id_380B = 1;
        self moveto( self._id_7541.origin, var_3 );
        self._id_10E19 = "rear";
    }
    else
    {
        for (;;)
        {
            var_4 = physics_spherecast( self.origin + ( 0, 0, 60 ), self._id_DDAA.origin + ( 0, 0, 60 ), 32, var_1, var_2, "physicsquery_all" );

            if ( var_4.size == 0 )
                break;

            var_5 = 0;

            for ( var_6 = 0; var_6 < var_4.size; var_6++ )
            {
                if ( !isdefined( var_4[var_6]["entity"] ) )
                    continue;

                if ( isplayer( var_4[var_6]["entity"] ) && ( _id_0A5B::_id_D0EF( var_4[var_6]["entity"] ) || scripts\engine\utility::_id_9CEE( var_4[var_6]["entity"]._id_9F28 ) ) )
                    var_5 = 1;
            }

            if ( var_5 )
                return;
            else
                break;

            wait 0.1;
        }

        if ( self._id_6B89 )
            self playsoundonmovingent( "trap_bumper_car_mvmt_short" );
        else
            self playsoundonmovingent( "trap_bumper_car_mvmt_long" );

        self setscriptablepartstate( "bumpercar", "moving" );
        wait 0.05;
        self playsound( "trap_bumper_car_lights" );
        self setscriptablepartstate( "lights", "lights_on" );
        wait 0.35;
        self setscriptablepartstate( "lights", "lights_off" );
        wait 0.35;
        self playsound( "trap_bumper_car_lights" );
        self setscriptablepartstate( "lights", "lights_on" );
        wait 0.35;
        self setscriptablepartstate( "lights", "lights_off" );
        wait 0.4;
        self playsound( "trap_bumper_car_lights" );
        self setscriptablepartstate( "lights", "lights_on" );
        wait 0.4;
        self setscriptablepartstate( "lights", "lights_off" );
        wait 0.5;
        self setscriptablepartstate( "lights", "lights_on" );
        self._id_380B = 1;
        self moveto( self._id_DDAA.origin, var_3 );
        self._id_10E19 = "fwd";
    }

    if ( isdefined( self._id_BE63 ) )
        _func_27C( self._id_BE63 );

    self waittill( "movedone" );
    wait 0.1;
    self._id_380B = 0;
    self._id_BE63 = _func_27A( self.origin, ( 56, 32, 32 ), self.angles );
    var_7 = scripts\engine\utility::_id_7E2E( self.origin, level._id_3261, 128 );

    if ( isdefined( var_7 ) )
        playfx( level._effect["bumpercar_impact"], var_7.origin, anglestoforward( ( 0, 270, 0 ) ), anglestoup( ( 0, 270, 0 ) ) );

    self setscriptablepartstate( "bumpercar", "impact" );
    wait 0.15;
    self setscriptablepartstate( "bumpercar", "normal" );
    self setscriptablepartstate( "lights", "lights_off" );
}

_id_A631()
{
    for (;;)
    {
        self._id_5764 waittill( "trigger", var_0 );
        var_1 = getentarray( "placed_transponder", "script_noteworthy" );

        foreach ( var_3 in var_1 )
        {
            if ( var_0 == var_3 )
            {
                if ( isdefined( var_3.owner ) && var_3.owner _id_0A77::_id_9D05( 1 ) )
                    var_3.owner _id_0A6B::_id_CC16( var_0._id_13C2E, 1, var_0.origin );

                var_3 notify( "detonateExplosive" );
            }
        }

        if ( !self._id_380B || isdefined( var_0._id_6F73 ) )
            continue;

        if ( !isplayer( var_0 ) && !_id_0A77::_id_FF18( var_0 ) )
            continue;

        if ( isplayer( var_0 ) && !_id_0A5B::_id_D0EF( var_0 ) || var_0.team == "allies" )
        {
            var_0 thread _id_DB09( self );
            continue;
        }

        var_0 thread _id_6F32( self );
    }
}

_id_6F32( var_0 )
{
    self endon( "death" );
    var_1 = 250;
    self playsound( "bumpercars_fling_zombie" );
    self._id_6F73 = 1;
    self._id_4C87 = 1;
    playfx( level._effect["blackhole_trap_death"], self.origin, anglestoforward( ( -90, 0, 0 ) ), anglestoup( ( -90, 0, 0 ) ) );
    wait 0.05;
    wait 0.1;
    self playsound( "trap_bumper_car_zombie_hit" );
    self._id_5502 = 1;
    self._id_C026 = 1;
    var_2 = scripts\engine\utility::_id_782F( self.origin, level.players, undefined, 4, var_1 );

    foreach ( var_4 in var_2 )
        var_4 thread _id_0A6A::_id_12885( "trap_kill_rover", "zmb_comment_vo", "medium", 5, 0, 0, 1, 25 );

    self _meth_80B0( self.health + 1000, var_0.origin );
}

_id_DB09( var_0 )
{
    self endon( "death" );
    self playsound( "bumpercars_push_damage_plr" );
    self._id_6F73 = 1;
    var_1 = sortbydistance( scripts\engine\utility::_id_8180( "bumper_car_throw_spots", "targetname" ), self.origin );
    self setorigin( var_1[0].origin, 0 );
    self _meth_8366( vectornormalize( self.origin - var_0.origin ) * 300 + ( 0, 0, 100 ) );
    wait 0.1;

    if ( isplayer( self ) && !scripts\engine\utility::_id_9CEE( self._id_9F2A ) )
        self _meth_80B0( self.health + 100, var_0.origin );

    wait 0.1;
    self._id_6F73 = undefined;
}
