// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_8841()
{
    self._id_907C = undefined;
}

_id_1181C( var_0, var_1 )
{
    var_1._id_1E8E = var_0.angles;
}

_id_1181B( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) && isdefined( var_1 ) )
    {
        if ( isplayer( var_1 ) && var_1 != var_2 )
        {
            if ( !level.teambased || var_2.team != var_1.team )
                var_2 _id_E7FC( var_0, var_1, var_2 );
        }
    }

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_8840( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
        var_0 playlocalsound( "bs_shield_explo" );

    var_1 playsoundtoteam( "bs_shield_explo_npc", "axis", var_0 );
    var_1 playsoundtoteam( "bs_shield_explo_npc", "allies", var_0 );
    playfx( scripts\engine\utility::_id_7ECB( "hackKnife_impactWorld" ), var_1.origin, anglestoforward( var_1.angles ), anglestoup( var_1.angles ) );
}

_id_E7FC( var_0, var_1, var_2 )
{
    if ( isdefined( var_2._id_907C ) )
        _id_8842( var_2._id_907C );

    var_3 = _id_53C9( var_1 );
    self._id_907C = [];

    if ( isdefined( var_3 ) )
    {
        for ( var_4 = 0; var_4 < 1; var_4++ )
        {
            var_2._id_907C[var_4] = _id_8843( var_3[var_4], var_0._id_1E8E );
            var_2._id_907C[var_4] _id_883F( var_1 );
        }
    }

    self playlocalsound( "ghost_prism_activate" );
    self waittill( "death" );
    thread _id_8842( var_2._id_907C );
}

_id_53C9( var_0 )
{
    var_1 = getclosestpointonnavmesh( var_0.origin + anglestoforward( var_0.angles ) * 64 );
    var_2 = [];
    var_2 = getnodesinradius( var_1, 128, 64, 64 );
    return var_2;
}

_id_8842( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        foreach ( var_2 in var_0 )
        {
            playloopsound( var_2.origin, "ghost_prism_deactivate" );
            var_2 notify( "death" );
            var_2 suicide();
        }
    }
}

_id_8843( var_0, var_1 )
{
    if ( scripts\mp\agents\agent_utility::_id_8008( "squadmate" ) >= 5 )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AGENT_MAX" );
        return 0;
    }

    if ( scripts\mp\agents\agent_utility::_id_8010( self ) >= 2 )
        return 0;

    if ( !isdefined( var_0 ) )
        var_0 = scripts\mp\agents\agent_utility::_id_81FB( 1, 1 );

    var_2 = scripts\mp\agents\agents::_id_16F2( "squadmate", self.team, "reconAgent", var_0.origin, var_1, self, 0, 0, "hardened" );

    if ( !isdefined( var_2 ) )
        return 0;

    var_2._id_A6BB = "agent";
    return var_2;
}

_id_883F( var_0 )
{
    if ( isdefined( self._id_8C98 ) )
    {
        self _meth_8096( self._id_8C98, "" );
        self._id_8C98 = undefined;
    }

    self setmodel( var_0._id_01F1 );
    self takeallweapons();
    self giveweapon( var_0.primaryweapon );

    if ( var_0._id_F0C4 != "none" )
        self giveweapon( var_0._id_F0C4 );

    scripts\mp\utility\game::_id_141A( var_0.primaryweapon );
    self botsetflag( "disable_attack", 0 );
    self.health = 50;
    thread _id_1903();
    var_1 = var_0.origin + anglestoforward( var_0.angles ) * 64 * 5;
    var_2 = scripts\engine\trace::_id_DCED( var_0.origin, var_1, level.players );

    if ( !isdefined( var_2 ) )
        var_2["position"] = var_1;
    else
        var_2 = var_2["position"];

    var_3 = getclosestpointonnavmesh( var_2 );
    var_3 = getclosestnodeinsight( var_3 );
    self botsetscriptgoalnode( var_3, "objective" );
}

_id_1903()
{
    self waittill( "death" );
    var_0 = self.origin;
    var_1 = self _meth_8113();
    var_1 hide();
}

_id_68D5()
{
    self endon( "death" );

    for (;;)
    {
        wait 0.75;
        playfxontag( level._id_CAA3["shimmer"], self, "j_spineupper" );
    }
}

_id_13BAD( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        if ( var_0 isonladder() )
        {
            wait 0.1;
            continue;
        }

        var_1 = var_0 getcurrentweapon();
        self giveweapon( var_1 );
        scripts\mp\utility\game::_id_141A( var_1 );
        var_0 waittill( "weapon_change" );
    }
}
