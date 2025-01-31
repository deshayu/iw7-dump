// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    setup_callbacks();
    scripts\mp\bots\gametype_conf::_id_F8D8();
}

setup_callbacks()
{
    level.bot_funcs["gametype_think"] = ::_id_2DBF;
}

_id_2DBF()
{
    self notify( "bot_grind_think" );
    self endon( "bot_grind_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_860B = 0;
    self._id_8432 = undefined;
    self._id_4505 = 0;
    self._id_17D9 = ::_id_2DBE;

    if ( self botgetdifficultysetting( "strategyLevel" ) > 0 )
        childthread _id_6541();

    scripts\mp\bots\gametype_conf::_id_2D39();
}

_id_2DBE()
{
    if ( !isdefined( self._id_113DD ) )
    {
        if ( self._id_11422 > 0 )
        {
            var_0 = squared( 500 + self._id_11422 * 250 );

            if ( game["teamScores"][self.team] + self._id_11422 >= level._id_E763 )
                var_0 = squared( 5000 );
            else if ( !isdefined( self._id_010C ) && !scripts\mp\bots\bots_util::_id_2DCA() )
                var_0 = squared( 1500 + self._id_11422 * 250 );

            var_1 = undefined;

            foreach ( var_3 in level._id_13FC1 )
            {
                var_4 = distancesquared( self.origin, var_3.origin );

                if ( var_4 < var_0 )
                {
                    var_0 = var_4;
                    var_1 = var_3;
                }
            }

            if ( isdefined( var_1 ) )
            {
                var_6 = 1;

                if ( self._id_860B )
                {
                    if ( isdefined( self._id_8432 ) && self._id_8432 == var_1 )
                        var_6 = 0;
                }

                if ( var_6 )
                {
                    self._id_860B = 1;
                    self._id_8432 = var_1;
                    self botclearscriptgoal();
                    self notify( "stop_going_to_zone" );
                    self notify( "stop_camping_zone" );
                    self._id_4505 = 0;
                    scripts\mp\bots\bots_personality::clear_camper_data();
                    scripts\mp\bots\bots_strategy::_id_2D02( "kill_tag" );
                    childthread _id_2DBC( var_1, "tactical" );
                }
            }

            if ( self._id_860B )
            {
                if ( game["teamScores"][self.team] + self._id_11422 >= level._id_E763 )
                    self botsetflag( "force_sprint", 1 );
            }
        }
        else if ( self._id_860B )
        {
            self._id_860B = 0;
            self._id_8432 = undefined;
            self notify( "stop_going_to_zone" );
            self botclearscriptgoal();
        }

        if ( self.personality == "camper" && !self._id_4504 && !self._id_860B )
        {
            var_0 = undefined;
            var_1 = undefined;

            foreach ( var_3 in level._id_13FC1 )
            {
                var_4 = distancesquared( self.origin, var_3.origin );

                if ( !isdefined( var_0 ) || var_4 < var_0 )
                {
                    var_0 = var_4;
                    var_1 = var_3;
                }
            }

            if ( isdefined( var_1 ) )
            {
                if ( scripts\mp\bots\bots_personality::_id_FF87() )
                {
                    if ( scripts\mp\bots\bots_personality::find_ambush_node( var_1.origin ) )
                    {
                        self._id_4505 = 1;
                        self notify( "stop_going_to_zone" );
                        self._id_860B = 0;
                        self botclearscriptgoal();
                        childthread _id_2D20( var_1, "camp" );
                    }
                    else
                    {
                        self notify( "stop_camping_zone" );
                        self._id_4505 = 0;
                        scripts\mp\bots\bots_personality::clear_camper_data();
                    }
                }
            }
            else
                self._id_4505 = 1;
        }
    }
    else
    {
        self notify( "stop_going_to_zone" );
        self._id_860B = 0;
        self._id_8432 = undefined;
        self notify( "stop_camping_zone" );
        self._id_4505 = 0;
    }

    return self._id_860B || self._id_4505;
}

_id_2DBC( var_0, var_1 )
{
    self endon( "stop_going_to_zone" );

    if ( !isdefined( var_0._id_370E ) )
    {
        var_0._id_BE7C = getclosestnodeinsight( var_0.origin );
        var_0._id_370E = 1;
    }

    var_2 = var_0._id_BE7C;
    self botsetscriptgoal( var_2.origin, 32, var_1 );
    var_3 = scripts\mp\bots\bots_util::_id_2ECB();
}

_id_2D20( var_0, var_1 )
{
    self endon( "stop_camping_zone" );
    self botsetscriptgoalnode( self.node_ambushing_from, var_1, self.ambush_aw );
    var_2 = scripts\mp\bots\bots_util::_id_2ECB();

    if ( var_2 == "goal" )
    {
        if ( !isdefined( var_0._id_370E ) )
        {
            var_0._id_BE7C = getclosestnodeinsight( var_0.origin );
            var_0._id_370E = 1;
        }

        var_3 = var_0._id_BE7C;

        if ( isdefined( var_3 ) )
        {
            var_4 = findentrances( self.origin );
            var_4 = scripts\engine\utility::_id_2279( var_4, var_3 );
            childthread scripts\mp\bots\bots_util::_id_2ED4( var_4 );
        }
    }
}

_id_6541()
{
    self._id_5001 = self botgetdifficultysetting( "meleeChargeDist" );

    for (;;)
    {
        if ( self botgetdifficultysetting( "strategyLevel" ) < 2 )
            wait 0.5;
        else
            wait 0.2;

        if ( isdefined( self._id_010C ) && isplayer( self._id_010C ) && isdefined( self._id_010C._id_11422 ) && self._id_010C._id_11422 >= 3 && self botcanseeentity( self._id_010C ) && distance( self.origin, self._id_010C.origin ) <= 500 )
        {
            self botsetdifficultysetting( "meleeChargeDist", 500 );
            self botsetflag( "prefer_melee", 1 );
            continue;
        }

        self botsetdifficultysetting( "meleeChargeDist", self._id_5001 );
        self botsetflag( "prefer_melee", 0 );
    }
}
