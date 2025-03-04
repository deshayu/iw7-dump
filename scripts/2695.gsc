// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_1FAA()
{
    while ( !scripts\mp\utility\game::istrue( game["gamestarted"] ) )
        wait 0.05;

    var_0 = getentarray( "animObj", "targetname" );
    var_1 = _id_76F6( var_0 );
    _id_FAF4( var_0 );
    _id_FAEA( var_0 );

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3._id_ECF7 ) )
        {
            switch ( var_3._id_ECF7 )
            {
                case "rotation_continuous":
                case "rotation_pingpong":
                    var_3 thread _id_1FE5( var_3._id_ECF7 );
                    break;
                case "translation_once":
                case "translation_pingpong":
                    var_3 thread _id_1FE8( var_3._id_ECF7 );
                    break;
            }
        }
    }
}

_id_FAF4( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.script_noteworthy ) && scripts\engine\utility::string_starts_with( var_2.script_noteworthy, "vfx_" ) )
        {
            var_3 = var_2 scripts\engine\utility::_id_107E6();
            var_3 show();
            var_3 linkto( var_2 );
            scripts\engine\utility::waitframe();
            thread delayfxcall( scripts\engine\utility::_id_7ECB( var_2.script_noteworthy ), var_3, "tag_origin" );
        }
    }
}

delayfxcall( var_0, var_1, var_2 )
{
    wait 5;
    playfxontag( var_0, var_1, var_2 );
}

_id_FAEA( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.script_noteworthy ) && scripts\engine\utility::string_starts_with( var_2.script_noteworthy, "sfx_" ) )
        {
            var_2 setmodel( "tag_origin" );
            var_2 thread scripts\engine\utility::_id_CD7F( "mp_quarry_lg_crane_loop" );
        }
    }
}

_id_4F24()
{
    for (;;)
    {
        scripts\mp\utility\game::_id_5B85( self.origin, 32, 0.1, ( 0, 0, 255 ) );
        wait 0.1;
    }
}

_id_76F6( var_0 )
{
    var_1 = [];
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4.script_noteworthy ) && issubstr( var_4.script_noteworthy, "group" ) )
            var_1 = scripts\engine\utility::_id_2279( var_1, var_4 );
    }

    foreach ( var_7 in var_1 )
    {
        if ( !isdefined( var_2[var_7.script_noteworthy] ) )
        {
            var_2[var_7.script_noteworthy] = [ var_7 ];
            continue;
        }

        var_2[var_7.script_noteworthy] = scripts\engine\utility::_id_2279( var_2[var_7.script_noteworthy], var_7 );
    }

    foreach ( var_10 in var_2 )
    {
        var_11 = _id_1FE2( var_10 );
        _id_1FE3( var_11, var_10 );
    }

    return var_2;
}

_id_1FE2( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_027C ) )
            return var_2;
    }
}

_id_1FE3( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        foreach ( var_3 in var_1 )
        {
            if ( var_3 == var_0 )
                continue;

            var_3 linkto( var_0 );
        }
    }
}

_id_1FE8( var_0 )
{
    if ( issubstr( var_0, "pingpong" ) )
        thread _id_1FEA();

    if ( issubstr( var_0, "once" ) )
        thread _id_1FE9();
}

_id_1FEA()
{
    level endon( "game_ended" );
    var_0 = ( 0, 90, 0 );
    var_1 = 5;
    var_2 = 0.5;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;

    if ( isdefined( self._id_EEEB ) )
        var_0 = self._id_EEEB;

    if ( isdefined( self._id_EEEC ) )
        var_1 = self._id_EEEC;

    if ( isdefined( self._id_ED06 ) )
    {
        if ( issubstr( self._id_ED06, "start" ) )
            var_3 = "mp_quarry_lg_crane_start";

        if ( issubstr( self._id_ED06, "stop" ) )
            var_4 = "mp_quarry_lg_crane_stop";

        if ( issubstr( self._id_ED06, "loop" ) )
            var_5 = "mp_quarry_lg_crane_loop";
    }

    for (;;)
    {
        var_6 = self.origin;
        self moveto( self.origin + var_0, var_1[0], var_1[1], var_1[2] );

        if ( isdefined( var_4 ) )
            thread _id_1FE4( var_1[0], var_4 );

        wait( var_1[0] + var_2 );

        if ( isdefined( var_3 ) )
            playloopsound( self.origin, var_3 );

        self moveto( var_6, var_1[0], var_1[1], var_1[2] );

        if ( isdefined( var_4 ) )
            thread _id_1FE4( var_1[0], var_4 );

        wait( var_1[0] + var_2 );

        if ( isdefined( var_3 ) )
            playloopsound( self.origin, var_3 );
    }
}

_id_1FE4( var_0, var_1 )
{
    wait( var_0 );
    playloopsound( self.origin, var_1 );
}

_id_1FE9()
{
    level endon( "game_ended" );
    var_0 = ( 0, 90, 0 );
    var_1 = 5;

    if ( isdefined( self._id_EEEB ) )
        var_0 = self._id_EEEB;

    if ( isdefined( self._id_EEEC ) )
        var_1 = length( self._id_EEEC );

    for (;;)
    {
        self rotateby( var_0, var_1, 0, 0 );
        wait( var_1 );
    }
}

_id_1FE5( var_0 )
{
    if ( issubstr( var_0, "pingpong" ) )
        thread _id_1FE7();

    if ( issubstr( var_0, "continuous" ) )
        thread _id_1FE6();
}

_id_1FE7()
{
    level endon( "game_ended" );
    var_0 = ( 0, 90, 0 );
    var_1 = ( 5, 0, 0 );
    var_2 = 0.5;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;

    if ( isdefined( self._id_EE9B ) )
        var_0 = self._id_EE9B;

    if ( isdefined( self._id_EE9E ) )
        var_1 = self._id_EE9E;

    if ( self._id_01F1 == "jackal_arena_aa_turret_01_mp_sml" )
    {
        var_3 = "divide_turret_move_start";
        var_4 = "divide_turret_move_end";
        thread scripts\engine\utility::_id_CD7F( "divide_turret_move_lp" );
    }

    for (;;)
    {
        self rotateby( var_0, var_1[0], var_1[1], var_1[2] );

        if ( isdefined( var_4 ) )
            thread _id_1FE4( var_1[0] * 0.9, var_4 );

        wait( var_1[0] + var_2 );

        if ( isdefined( var_3 ) )
            playloopsound( self.origin, var_3 );

        self rotateby( var_0 * -1, var_1[0], var_1[1], var_1[2] );

        if ( isdefined( var_4 ) )
            thread _id_1FE4( var_1[0] * 0.9, var_4 );

        wait( var_1[0] + var_2 );

        if ( isdefined( var_3 ) )
            playloopsound( self.origin, var_3 );
    }
}

_id_1FE6()
{
    level endon( "game_ended" );
    var_0 = ( 0, 90, 0 );
    var_1 = ( 5, 0, 0 );
    var_2 = 0.5;

    if ( isdefined( self._id_EE9B ) )
        var_0 = self._id_EE9B;

    if ( isdefined( self._id_EE9E ) )
        var_1 = self._id_EE9E;

    for (;;)
    {
        self rotateby( var_0, var_1[0], var_1[1], var_1[2] );
        wait( var_1[0] );
    }
}
