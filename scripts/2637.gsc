// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_958E()
{
    _id_956D();

    if ( !isdefined( level._id_3C23 ) )
        level._id_3C23 = ::_id_4FE2;

    _id_97B0();
}

_id_C9B9()
{
    [[ level.challenge_pause_func ]]();
}

_id_956D()
{
    scripts\engine\utility::_id_6E39( "pause_challenges" );
    var_0 = getdvar( "ui_mapname" );
    level._id_13F16 = "cp/zombies/" + var_0 + "_challenges.csv";

    if ( !_func_1F6( level._id_13F16 ) )
        level._id_13F16 = undefined;

    level._id_3C17 = [];

    if ( isdefined( level._id_3C1E ) )
        [[ level._id_3C1E ]]();

    level._id_4B4C = -1;
    level._id_4B51 = -1;
    level._id_4B50 = -1;
    level._id_4B4E = -1;
    level._id_4B53 = -1;
    level._id_4B54 = -1;
    level._id_4B52 = -1;
    level._id_4B55 = -1;
    level._id_4B4F = 0;
    level._id_1BE8 = 1;
    level._id_D7B7 = 0;
    level._id_C1E1 = 0;
    level._id_110AC = 0;
}

_id_12D9C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !_id_4B4D( var_0 ) || !_id_0A77::_id_462B( "challenge" ) )
        return;

    if ( level._id_D7B7 )
        return;

    var_10 = level._id_3C17[level._id_4B4A];
    var_10 thread [[ var_10._id_12E9C ]]( var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

_id_62C6()
{
    if ( _id_4B4B() && _id_0A77::_id_462B( "challenge" ) )
        _id_4DAE();
}

_id_4DAE()
{
    if ( !_id_4B4B() )
        return;

    var_0 = level._id_3C17[level._id_4B4A];
    _id_12BF7();

    if ( var_0 [[ var_0._id_9F82 ]]() )
    {
        _id_56AD( "challenge_success", 0 );
        var_0 [[ var_0._id_E4C5 ]]();
        var_1 = "challenge";

        if ( isdefined( level._id_3C24 ) )
            var_1 = level._id_3C24;

        _id_0A54::_id_12E13( var_1, "challenge_complete" );
        _id_0A63::_id_12DDB( 1 );
        _id_0A4B::_id_12D9F( var_0._id_DE3F, 1 );

        if ( _id_9F17( var_0 ) )
        {
            if ( level._id_4B54 - level._id_110AD <= 0.01 )
                _id_0D45::_id_AF63( var_0._id_DE3F, level._id_13BD3, level._id_110AD - level._id_4B54 );
            else
                _id_0D45::_id_AF63( var_0._id_DE3F, level._id_13BD3, level._id_4B54 );

            foreach ( var_3 in level.players )
                var_3 thread _id_0A6A::_id_12885( "challenge_success_generic", "zmb_comment_vo" );

            level._id_C1E1++;
        }
    }
    else
    {
        _id_56AD( "challenge_failed", 0 );

        if ( _id_9F17( var_0 ) )
        {
            if ( isdefined( level._id_3C2B[var_0._id_DE3F] ) && _id_9F17( var_0 ) )
                level._id_3C2B[var_0._id_DE3F]++;

            if ( var_0._id_DE3F == "no_laststand" || var_0._id_DE3F == "no_bleedout" || var_0._id_DE3F == "protect_player" )
                _id_0D45::_id_AF64( var_0._id_DE3F, level._id_13BD3, 0, level._id_3C2B[var_0._id_DE3F] );
            else
                _id_0D45::_id_AF64( var_0._id_DE3F, level._id_13BD3, var_0._id_4BA0 / var_0._id_0155 * 100, level._id_3C2B[var_0._id_DE3F] );

            foreach ( var_3 in level.players )
            {
                if ( !_id_0A77::_id_9F02() && level.players.size > 1 )
                {
                    _id_0A6A::_id_12886( "challenge_fail_team" );
                    continue;
                }

                var_3 thread _id_0A6A::_id_12885( "challenge_fail_solo", "zmb_comment_vo" );
            }
        }

        var_0 [[ var_0._id_6AD0 ]]();
        level._id_1BE8 = 0;
        _id_0A63::_id_12DDB( 0 );
        _id_0A4B::_id_12D9F( var_0._id_DE3F, 0 );
    }

    level notify( "challenge_deactivated" );
    var_0 [[ var_0._id_4DDE ]]();
}

_id_9F17( var_0 )
{
    switch ( var_0._id_DE3F )
    {
        case "challenge_success":
        case "challenge_failed":
        case "next_challenge":
            return 0;
        default:
            return 1;
    }
}

_id_15D7( var_0 )
{
    var_1 = level._id_3C17[var_0];

    if ( !isdefined( level._id_3C2B[var_0] ) && var_0 != "next_challenge" )
        level._id_3C2B[var_0] = 0;

    if ( var_1 [[ var_1._id_386E ]]() )
    {
        var_2 = _id_7897( var_0 );

        if ( isdefined( var_2 ) )
        {
            level._id_3C17[var_0]._id_0155 = var_2;
            level._id_4B52 = var_2;
        }
        else
            level._id_4B52 = -1;

        _id_56AD( var_0, 1, var_2 );
        _id_F31A( var_0 );
        level._id_4B4F = 0;
        var_1 [[ var_1._id_1609 ]]();
    }
    else
        var_1 [[ var_1._id_6ACB ]]();
}

_id_7897( var_0 )
{
    return [[ level._id_3C23 ]]( var_0 );
}

_id_3C15()
{
    level endon( "game_ended" );
    var_0 = int( gettime() + 5000 );

    foreach ( var_2 in level.players )
        var_2 setclientomnvar( "ui_intel_title", 1 );

    level._id_4B55 = 1;
    wait 5;

    foreach ( var_2 in level.players )
        var_2 setclientomnvar( "ui_intel_title", -1 );

    level._id_4B55 = -1;
    wait 0.5;
}

_id_56AD( var_0, var_1, var_2 )
{
    var_3 = tablelookup( level._id_13F16, 1, var_0, 0 );

    foreach ( var_5 in level.players )
    {
        if ( var_1 )
        {
            if ( isdefined( var_2 ) )
            {
                var_5 setclientomnvar( "ui_intel_challenge_scalar", var_2 );
                var_5 setclientomnvar( "ui_intel_progress_max", var_2 );
            }
            else
                var_5 setclientomnvar( "ui_intel_challenge_scalar", -1 );

            var_5 setclientomnvar( "ui_intel_prechallenge", 1 );
            var_5 setclientomnvar( "ui_intel_active_index", int( var_3 ) );
            level._id_4B4C = int( var_3 );
            level._id_4B4F = 1;

            if ( var_0 == "next_challenge" )
                var_5 playlocalsound( "zmb_challenge_config" );
            else
                var_5 playlocalsound( "zmb_challenge_start" );

            var_5 setclientomnvar( "zm_show_challenge", 4 );
            level._id_4BD3 = 4;
        }
    }

    if ( var_1 )
        return;

    if ( level._id_4BD3 != 2 && level._id_4BD3 != 3 && level._id_4BD3 != 4 )
        level thread _id_100CB( var_0, var_3 );
}

_id_100CB( var_0, var_1 )
{
    level endon( "game_ended" );
    wait 1;

    foreach ( var_3 in level.players )
    {
        if ( var_0 == "challenge_failed" )
        {
            var_3 playlocalsound( "zmb_challenge_fail" );
            var_3 setclientomnvar( "zm_show_challenge", 2 );
            level._id_4BD3 = 2;
            continue;
        }

        var_3 playlocalsound( "zmb_challenge_complete" );
        var_3 setclientomnvar( "zm_show_challenge", 3 );
        level._id_4BD3 = 3;
    }

    wait 3.0;

    foreach ( var_3 in level.players )
        var_3 thread _id_E20D();

    setomnvar( "zm_challenge_progress", 0 );
    level._id_4B4C = -1;
    level._id_4B51 = -1;
    level._id_4B50 = -1;
    level._id_4B4E = -1;
    level._id_4B53 = -1;
    level._id_4B54 = -1;
    level._id_4B52 = -1;
    level._id_4B4F = 0;
}

_id_E20D()
{
    wait 0.5;
    self setclientomnvar( "ui_intel_active_index", -1 );
    self setclientomnvar( "ui_intel_progress_current", -1 );
    self setclientomnvar( "ui_intel_progress_max", -1 );
    self setclientomnvar( "ui_intel_percent", -1 );
    self setclientomnvar( "ui_intel_target_player", -1 );
    self setclientomnvar( "ui_intel_prechallenge", 0 );
    self setclientomnvar( "ui_intel_timer", -1 );
    self setclientomnvar( "ui_intel_challenge_scalar", -1 );
}

_id_DEA1( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    var_11 = spawnstruct();
    var_11._id_DE3F = var_0;
    var_11._id_0155 = var_1;
    var_11._id_5021 = var_2;
    var_11._id_9F82 = ::_id_4FFA;

    if ( isdefined( var_3 ) )
        var_11._id_9F82 = var_3;

    var_11._id_386E = ::_id_4FDD;

    if ( isdefined( var_4 ) )
        var_11._id_386E = var_4;

    var_11._id_1609 = var_5;
    var_11._id_4DDE = var_6;
    var_11._id_6ACB = ::_id_4FED;

    if ( isdefined( var_7 ) )
        var_11._id_6ACB = var_7;

    var_11._id_12E9C = var_8;
    var_11._id_E4C5 = ::_id_5011;

    if ( isdefined( var_9 ) )
        var_11._id_E4C5 = var_9;

    var_11._id_6AD0 = ::_id_4FEE;

    if ( isdefined( var_10 ) )
        var_11._id_6AD0 = var_10;

    level._id_3C17[var_0] = var_11;
}

_id_12D9E( var_0, var_1 )
{
    if ( scripts\engine\utility::_id_6E25( "pause_challenges" ) )
        return;

    foreach ( var_3 in level.players )
    {
        var_3 setclientomnvar( "zm_show_challenge", 1 );
        var_3 setclientomnvar( "ui_intel_progress_current", var_0 );
        level._id_4BD3 = 1;
    }

    setomnvar( "zm_challenge_progress", var_0 / var_1 );
    level._id_4B51 = var_1;
    level._id_4B50 = var_0;
}

_id_4FDD()
{
    return 1;
}

_id_4FED()
{

}

_id_4FFA()
{
    if ( isdefined( self.success ) )
        return self.success;
    else
        return 0;
}

_id_5022()
{
    if ( isdefined( self.success ) )
        return self.success;
    else
        return self._id_5021;
}

_id_4FEE()
{

}

_id_5010()
{
    self.success = self._id_5021;
}

_id_5011()
{

}

_id_4B4B()
{
    return isdefined( level._id_4B4A );
}

_id_4B4D( var_0 )
{
    return _id_4B4B() && level._id_4B4A == var_0;
}

_id_12BF7()
{
    level._id_4B4A = undefined;
}

_id_F31A( var_0 )
{
    level._id_4B4A = var_0;
    _id_0D45::_id_AF62( level._id_4B4A, level._id_13BD3 );
    level._id_110AC = gettime() / 1000;
}

_id_7B31()
{
    if ( !isdefined( level._id_C1E1 ) )
        return 0;
    else
        return level._id_C1E1;
}

_id_97B0()
{
    if ( !isdefined( level._id_13F16 ) )
        return;

    var_0 = level._id_13F16;
    var_1 = 0;
    var_2 = 1;
    var_3 = 99;
    var_4 = 1;
    var_5 = 2;
    var_6 = 6;
    var_7 = 7;
    var_8 = 8;

    for ( var_9 = var_2; var_9 <= var_3; var_9++ )
    {
        var_10 = tablelookup( var_0, var_1, var_9, var_4 );

        if ( var_10 == "" )
            break;

        var_11 = tablelookup( var_0, var_1, var_9, var_5 );
        var_12 = tablelookup( var_0, var_1, var_9, var_8 );

        if ( isdefined( level._id_3C17[var_10] ) )
        {
            level._id_3C17[var_10]._id_1C81 = var_11;
            level._id_3C17[var_10]._id_1C8C = int( tablelookup( var_0, var_1, var_9, var_6 ) );
            level._id_3C17[var_10]._id_1649 = strtok( var_12, " " );
        }
    }
}

_id_4FE2( var_0 )
{
    return 1;
}

_id_12DA9( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( scripts\engine\utility::_id_9CEE( self._id_54CB ) )
        return;

    if ( !isdefined( level._id_4B4A ) )
        return;

    var_9 = level._id_4B4A;

    if ( isdefined( level._id_4C46 ) )
    {
        var_10 = self [[ level._id_4C46 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

        if ( !scripts\engine\utility::_id_9CEE( var_10 ) )
            return;
    }
}

_id_12DA5( var_0 )
{
    level endon( "stop_challenge_timer" );
    level endon( "game_ended" );
    level endon( "challenge_deactivated" );
    self endon( "success" );
    var_1 = 0;
    var_2 = level._id_4B54;

    while ( level._id_4B54 > 0 )
    {
        wait 0.1;

        if ( scripts\engine\utility::_id_6E25( "pause_challenges" ) )
        {
            foreach ( var_4 in level.players )
            {
                var_4 setclientomnvar( "ui_intel_timer", -1 );
                var_4 setclientomnvar( "zm_show_challenge", 10 );
            }

            scripts\engine\utility::_id_6E5A( "pause_challenges" );
            var_6 = int( gettime() + level._id_4B54 * 1000 );

            foreach ( var_4 in level.players )
            {
                var_4 setclientomnvar( "ui_intel_timer", var_6 );
                var_4 setclientomnvar( "zm_show_challenge", level._id_4BD3 );
            }
        }

        level._id_4B54 = level._id_4B54 - 0.1;

        if ( isdefined( var_0 ) )
            _id_12D9E( int( var_2 - level._id_4B54 ), int( var_2 ) );
    }
}

_id_5026( var_0 )
{
    level endon( "game_ended" );
    level endon( "challenge_deactivated" );
    self endon( "success" );
    var_1 = var_0;

    while ( var_1 > 0 )
    {
        wait 0.1;

        if ( scripts\engine\utility::_id_6E25( "pause_challenges" ) )
            continue;

        var_1 = var_1 - 0.1;
    }

    self.success = self._id_5021;
    level thread _id_4DAE();
}
