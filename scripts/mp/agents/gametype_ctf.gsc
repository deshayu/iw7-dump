// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    setup_callbacks();
    _id_F8D9();
}

setup_callbacks()
{
    level.bot_funcs["crate_can_use"] = ::_id_4830;
    level.bot_funcs["gametype_think"] = ::_id_2D46;
}

_id_F8D9()
{
    scripts\mp\bots\bots_util::_id_2ECA();
    level._id_115CC["allies"]._id_01AD = "allies";
    level._id_115CC["axis"]._id_01AD = "axis";
    var_0[0] = level._id_115CC["allies"].curorigin;
    var_1[0] = "flag_" + level._id_115CC["allies"]._id_01AD;
    var_0[1] = level._id_115CC["axis"].curorigin;
    var_1[1] = "flag_" + level._id_115CC["axis"]._id_01AD;
    scripts\mp\bots\bots_util::_id_2D18( var_0, var_1 );
    var_2 = getzonenearest( level._id_115CC["allies"].curorigin );

    if ( isdefined( var_2 ) )
        botzonesetteam( var_2, "allies" );

    var_2 = getzonenearest( level._id_115CC["axis"].curorigin );

    if ( isdefined( var_2 ) )
        botzonesetteam( var_2, "axis" );

    level._id_2DA1 = 1;
}

_id_4830( var_0 )
{
    if ( isagent( self ) && !isdefined( var_0.boxtype ) )
        return 0;

    if ( isdefined( self._id_3AF4 ) )
        return 0;

    if ( !level._id_115CC[self.team] scripts\mp\gameobjects::_id_9E35() )
        return 0;

    return 1;
}

_id_46BE()
{
    var_0 = 0;

    foreach ( var_2 in level._id_C928 )
    {
        if ( !isdefined( var_2.team ) )
            continue;

        if ( var_2 == self )
            continue;

        if ( scripts\mp\utility\game::_id_9F9D( var_2 ) && var_2.team == self.team )
            var_0++;
    }

    return var_0;
}

_id_2D46()
{
    self notify( "bot_ctf_think" );
    self endon( "bot_ctf_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( !isdefined( level._id_2DA1 ) )
        wait 0.05;

    _id_9557();
    self._id_BF69 = gettime();
    self._id_BF3E = gettime();
    self botsetflag( "separation", 0 );

    if ( !isdefined( level._id_BF3F ) )
        level._id_BF3F = gettime() - 100;

    for (;;)
    {
        wait 0.05;

        if ( gettime() >= level._id_BF3F )
        {
            _id_12DC1();
            level._id_BF3F = gettime() + 100;
        }

        if ( self.health <= 0 )
            continue;

        if ( !isdefined( self._id_E67C ) )
            _id_F319();

        if ( isdefined( self._id_3AF4 ) )
        {
            _id_4143();

            if ( !isdefined( level._id_6E28[level._id_C74B[self.team]] ) || scripts\engine\utility::_id_9CEE( level._id_3A3C ) )
                self botsetscriptgoal( level._id_3A42[self.team].curorigin, 16, "critical" );
            else if ( isdefined( level._id_6E28[level._id_C74B[self.team]] ) && _id_46BE() == 0 )
            {
                self botclearscriptgoal();
                self botsetscriptgoal( level._id_6E28[level._id_C74B[self.team]].origin, 256, "guard" );
            }
            else if ( gettime() > self._id_BF3E )
            {
                var_0 = getnodesinradius( level._id_3A42[self.team].curorigin, 900, 0, 300 );
                var_1 = self botnodepick( var_0, var_0.size * 0.15, "node_hide" );

                if ( isdefined( var_1 ) )
                    self botsetscriptgoalnode( var_1, "critical" );

                self._id_BF3E = gettime() + 10000;
            }

            continue;
        }

        if ( self._id_E67C == "attacker" )
        {
            if ( isdefined( level._id_6E28[self.team] ) )
            {
                if ( !scripts\mp\bots\bots_util::_id_2DD4() )
                    scripts\mp\bots\bots_strategy::_id_2DC1( level._id_6E28[self.team], 400 );
            }
            else
            {
                _id_4143();
                self botsetscriptgoal( level._id_115CC[level._id_C74B[self.team]].curorigin, 16, "guard" );
            }

            continue;
        }

        if ( !level._id_115CC[self.team] scripts\mp\gameobjects::_id_9E35() )
        {
            if ( !isdefined( level._id_6E28[level._id_C74B[self.team]] ) )
            {
                _id_4143();
                self botsetscriptgoal( level._id_115CC[self.team].curorigin, 16, "critical" );
            }
            else
            {
                var_2 = level._id_6E28[level._id_C74B[self.team]];

                if ( gettime() > self._id_BF69 || self botcanseeentity( var_2 ) )
                {
                    _id_4143();
                    self botsetscriptgoal( var_2.origin, 16, "critical" );
                    self._id_BF69 = gettime() + randomintrange( 4500, 5500 );
                }
            }

            continue;
        }

        if ( !_id_9C95() )
        {
            self botclearscriptgoal();
            var_3["entrance_points_index"] = "flag_" + level._id_115CC[self.team]._id_01AD;
            scripts\mp\bots\bots_strategy::_id_2E57( level._id_115CC[self.team].curorigin, 600, var_3 );
        }
    }
}

_id_4143()
{
    if ( scripts\mp\bots\bots_util::_id_2DD7() )
        scripts\mp\bots\bots_strategy::_id_2D4E();
}

_id_9C95()
{
    return scripts\mp\bots\bots_util::_id_2DDD();
}

_id_F319()
{
    self._id_E67C = level._id_BF57[self.team];

    if ( level._id_BF57[self.team] == "attacker" )
        level._id_BF57[self.team] = "defender";
    else if ( level._id_BF57[self.team] == "defender" )
        level._id_BF57[self.team] = "attacker";
}

_id_9557()
{
    if ( isdefined( level._id_2EF4 ) && level._id_2EF4 )
        return;

    level._id_2EF4 = 1;
    level._id_BF57["allies"] = "attacker";
    level._id_BF57["axis"] = "attacker";
    level._id_6E28 = [];
}

_id_12DC1()
{
    level._id_6E28["allies"] = undefined;
    level._id_6E28["axis"] = undefined;

    foreach ( var_1 in level._id_C928 )
    {
        if ( isalive( var_1 ) && isdefined( var_1._id_3AF4 ) )
            level._id_6E28[var_1.team] = var_1;
    }

    var_3 = [];
    var_4 = [];
    var_5 = [];
    var_6 = [];

    foreach ( var_1 in level._id_C928 )
    {
        if ( isdefined( var_1._id_E67C ) )
        {
            if ( var_1.team == "allies" )
            {
                if ( var_1._id_E67C == "attacker" )
                    var_3[var_3.size] = var_1;
                else if ( var_1._id_E67C == "defender" )
                    var_4[var_4.size] = var_1;

                continue;
            }

            if ( var_1.team == "axis" )
            {
                if ( var_1._id_E67C == "attacker" )
                {
                    var_5[var_5.size] = var_1;
                    continue;
                }

                if ( var_1._id_E67C == "defender" )
                    var_6[var_6.size] = var_1;
            }
        }
    }

    if ( var_4.size > var_3.size )
        scripts\engine\utility::_id_DC6B( var_4 )._id_E67C = undefined;
    else if ( var_3.size > var_4.size + 1 )
        scripts\engine\utility::_id_DC6B( var_3 )._id_E67C = undefined;

    if ( var_6.size > var_5.size )
        scripts\engine\utility::_id_DC6B( var_6 )._id_E67C = undefined;
    else if ( var_5.size > var_6.size + 1 )
        scripts\engine\utility::_id_DC6B( var_5 )._id_E67C = undefined;
}
