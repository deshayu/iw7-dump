// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    setup_callbacks();
    _id_F8DD();
}

setup_callbacks()
{
    level.bot_funcs["gametype_think"] = ::_id_2DCF;
    level.bot_funcs["should_pickup_weapons"] = ::_id_2E91;
}

_id_F8DD()
{
    level.bots_gametype_handles_class_choice = 1;
    level._id_2EF5 = 1;
    level.bots_gametype_handles_team_choice = 1;
    thread _id_2DCB();
}

_id_2E91()
{
    if ( level._id_9410 && self.team == "axis" )
        return 0;

    return scripts\mp\bots\bots::bot_should_pickup_weapons();
}

_id_2DCF()
{
    self notify( "bot_infect_think" );
    self endon( "bot_infect_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    childthread _id_2DCE();

    for (;;)
    {
        if ( level._id_9410 )
        {
            if ( self.team == "axis" && self botgetpersonality() != "run_and_gun" )
                scripts\mp\bots\bots_util::bot_set_personality( "run_and_gun" );
        }

        if ( self.bot_team != self.team )
            self.bot_team = self.team;

        if ( self.team == "axis" )
        {
            var_0 = scripts\mp\bots\bots_strategy::_id_2E1E();

            if ( !isdefined( var_0 ) || var_0 )
                self botclearscriptgoal();
        }

        self [[ self.personality_update_function ]]();
        wait 0.05;
    }
}

_id_2DCB()
{
    level notify( "bot_infect_ai_director_update" );
    level endon( "bot_infect_ai_director_update" );
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = [];
        var_1 = [];

        foreach ( var_3 in level.players )
        {
            if ( !isdefined( var_3._id_982D ) && var_3.health > 0 && isdefined( var_3.team ) && ( var_3.team == "allies" || var_3.team == "axis" ) )
                var_3._id_982D = gettime();

            if ( isdefined( var_3._id_982D ) && gettime() - var_3._id_982D > 5000 )
            {
                if ( !isdefined( var_3.team ) )
                    continue;

                if ( var_3.team == "axis" )
                {
                    var_0[var_0.size] = var_3;
                    continue;
                }

                if ( var_3.team == "allies" )
                    var_1[var_1.size] = var_3;
            }
        }

        if ( var_0.size > 0 && var_1.size > 0 )
        {
            var_5 = 1;

            foreach ( var_7 in var_1 )
            {
                if ( isbot( var_7 ) )
                    var_5 = 0;
            }

            if ( var_5 )
            {
                foreach ( var_3 in var_1 )
                {
                    if ( !isdefined( var_3._id_A8D2 ) )
                    {
                        var_3._id_A8D2 = gettime();
                        var_3._id_A8D1 = var_3.origin;
                        var_3._id_118DA = 0;
                    }

                    if ( gettime() >= var_3._id_A8D2 + 5000 )
                    {
                        var_3._id_A8D2 = gettime();
                        var_10 = distancesquared( var_3.origin, var_3._id_A8D1 );
                        var_3._id_A8D1 = var_3.origin;

                        if ( var_10 < 90000 )
                        {
                            var_3._id_118DA = var_3._id_118DA + 5000;

                            if ( var_3._id_118DA >= 20000 )
                            {
                                var_11 = scripts\engine\utility::_id_782F( var_3.origin, var_0 );

                                foreach ( var_13 in var_11 )
                                {
                                    if ( isbot( var_13 ) )
                                    {
                                        var_14 = var_13 botgetscriptgoaltype();

                                        if ( var_14 != "tactical" && var_14 != "critical" )
                                        {
                                            var_13 thread _id_91E4( var_3 );
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                        else
                        {
                            var_3._id_118DA = 0;
                            var_3._id_A8D1 = var_3.origin;
                        }
                    }
                }
            }
        }

        wait 1.0;
    }
}

_id_91E4( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    self botsetscriptgoal( var_0.origin, 0, "critical" );
    scripts\mp\bots\bots_util::_id_2ECB();
    self botclearscriptgoal();
}

_id_2DCE()
{
    if ( self.team == "axis" )
    {
        self._id_3829 = 0;
        self._id_B58B = undefined;
        self._id_B58D = undefined;
        self._id_B58C = 0;
        self._id_B5B2 = undefined;
        self._id_B5B1 = 0;
        var_0 = self botgetdifficultysetting( "throwKnifeChance" );

        if ( var_0 < 0.25 )
            self botsetdifficultysetting( "throwKnifeChance", 0.25 );

        self botsetdifficultysetting( "allowGrenades", 1 );
        self botsetflag( "path_traverse_wait", 1 );

        for (;;)
        {
            if ( self hasweapon( "throwingknife_mp" ) )
            {
                if ( scripts\mp\utility\game::_id_9E0E( self._id_010C ) )
                {
                    var_1 = gettime();

                    if ( !isdefined( self._id_B58B ) || self._id_B58B != self._id_010C )
                    {
                        self._id_B58B = self._id_010C;
                        self._id_B58D = self._id_010C getnearestnode();
                        self._id_B58C = var_1;
                    }
                    else
                    {
                        var_2 = squared( self botgetdifficultysetting( "meleeDist" ) );

                        if ( distancesquared( self._id_010C.origin, self.origin ) <= var_2 )
                            self._id_3829 = var_1;

                        var_3 = self._id_010C getnearestnode();
                        var_4 = self getnearestnode();

                        if ( !isdefined( self._id_B58D ) || self._id_B58D != var_3 )
                        {
                            self._id_B58C = var_1;
                            self._id_B58D = var_3;
                        }

                        if ( !isdefined( self._id_B5B2 ) || self._id_B5B2 != var_4 )
                        {
                            self._id_B5B1 = var_1;
                            self._id_B5B2 = var_4;
                        }
                        else if ( distancesquared( self.origin, self._id_B5B2.origin ) > 9216 )
                            self._id_B5B0 = var_1;

                        if ( self._id_3829 + 3000 < var_1 )
                        {
                            if ( self._id_B5B1 + 3000 < var_1 )
                            {
                                if ( self._id_B58C + 3000 < var_1 )
                                {
                                    if ( _id_2DCC( self.origin, self._id_010C.origin ) )
                                        scripts\mp\bots\bots_util::_id_2E58( "find_node_can_see_ent", ::_id_2DCD, self._id_010C, self._id_B5B2 );

                                    if ( !self getammocount( "throwingknife_mp" ) )
                                        self setweaponammoclip( "throwingknife_mp", 1 );

                                    scripts\mp\utility\game::_id_136EF( 30, "enemy" );
                                    self botclearscriptgoal();
                                }
                            }
                        }
                    }
                }
            }

            wait 0.25;
        }
    }
}

_id_2DCC( var_0, var_1 )
{
    if ( abs( var_0[2] - var_1[2] ) > 56.0 && distance2dsquared( var_0, var_1 ) < 2304 )
        return 1;

    return 0;
}

_id_2DCD( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return;

    var_2 = 0;

    if ( issubstr( var_1.type, "Begin" ) )
        var_2 = 1;

    var_3 = getlinkednodes( var_1 );

    if ( isdefined( var_3 ) && var_3.size )
    {
        var_4 = scripts\engine\utility::_id_22A7( var_3 );

        foreach ( var_6 in var_4 )
        {
            if ( var_2 && issubstr( var_6.type, "End" ) )
                continue;

            if ( _id_2DCC( var_6.origin, var_0.origin ) )
                continue;

            var_7 = self geteye() - self.origin;
            var_8 = var_6.origin + var_7;
            var_9 = var_0.origin;

            if ( isplayer( var_0 ) )
                var_9 = var_0 scripts\mp\utility\game::_id_815C();

            if ( sighttracepassed( var_8, var_9, 0, self, var_0 ) )
            {
                var_10 = vectortoyaw( var_9 - var_8 );
                self botsetscriptgoalnode( var_6, "critical", var_10 );
                scripts\mp\bots\bots_util::_id_2ECB( 3.0 );
                return;
            }

            wait 0.05;
        }
    }
}
