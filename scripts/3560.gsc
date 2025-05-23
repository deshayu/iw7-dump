// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._effect["sonicPulseImpact"] = loadfx( "vfx/iw7/_requests/mp_effects/vfx_force_push_distortion" );
}

_id_72D3()
{
    if ( isdefined( self._id_72D2 ) )
        self._id_72D2 notify( "detonateExplosive" );
}

_id_72D9( var_0 )
{
    level endon( "game_ended" );
    var_1 = var_0.owner.origin;
    var_0 waittill( "missile_stuck", var_2 );

    if ( isdefined( var_2 ) )
    {
        if ( _id_9FE2( var_2 ) )
        {
            var_3 = var_2.origin - var_1;
            var_4 = vectornormalize( var_3 );
            var_5 = length( var_3 );

            if ( var_5 < 500 )
            {
                var_6 = spawn( "script_model", var_0.origin );
                var_6 setmodel( "tag_origin" );
                var_6.angles = vectortoangles( var_4 );
                var_6.owner = self;
                var_6.team = self.team;
                self._id_72D2 = var_6;
                var_7 = 0.4;
                var_8 = 500 - var_5;
                var_9 = var_8 / 500;
                var_10 = var_7 * var_9;
                var_11 = var_6.origin + var_4 * var_8;
                var_6 _id_10DE4( var_2, var_4, var_10 );
                var_6 endon( "forcePushDetonate" );
                var_6 thread _id_5916( var_11, var_10 );
                var_6 thread _id_72D8();
                var_6 thread _id_72D7();
                wait( var_10 );
                var_0 delete();
                var_6 _id_72D5();
                return;
            }
        }
    }

    var_0 _id_72D4();
}

_id_72D5()
{
    self notify( "forcePushEnd" );
    playfx( scripts\engine\utility::_id_7ECB( "sonicPulseImpact" ), self.origin, anglestoforward( self.angles ) );
    scripts\engine\utility::waitframe();
    self delete();
}

_id_72D4( var_0 )
{
    self notify( "forcePushDetonate" );
    playfx( scripts\engine\utility::_id_7ECB( "sonicPulseImpact" ), self.origin, anglestoforward( self.angles ) );
    var_1 = self._id_AD30;

    if ( isdefined( var_1 ) )
    {
        var_1 _meth_8442();
        var_1 unlink();

        if ( isdefined( var_0 ) )
            var_1 setorigin( var_0 );
        else
            var_0 = self.origin;

        if ( isalive( var_1 ) && isdefined( var_1._id_DB17 ) )
        {
            var_1 _meth_8366( var_1._id_DB17 * 100 );
            var_1._id_DB17 = undefined;
        }

        radiusdamage( var_0, 100, 300, 100, self.owner, "MOD_EXPLOSIVE", "forcepush_mp" );
        earthquake( 0.75, 0.5, var_0, 100 );
    }

    if ( isdefined( self.owner ) )
        self.owner._id_72D2 = undefined;

    scripts\engine\utility::waitframe();
    self delete();
}

_id_72D8()
{
    level endon( "game_ended" );
    self endon( "death" );
    self.owner scripts\engine\utility::waittill_any( "joined_team", "joined_spectators", "disconnect" );
    self notify( "detonateExplosive" );
}

_id_72D7()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "forcePushEnd" );
    var_0 = scripts\engine\trace::_id_48B1() + physics_createcontents( [ "physicscontents_solid", "physicscontents_playerclip" ] );
    var_1 = self.origin;
    var_2 = [ self.owner, self._id_AD30 ];

    for (;;)
    {
        scripts\engine\utility::waitframe();
        var_3 = physics_spherecast( var_1, self.origin, 32, var_0, var_2, "physicsquery_closest" );

        if ( var_3.size > 0 )
        {
            _id_72D4( var_3[0]["shape_position"] );
            break;
        }

        var_1 = self.origin;
    }
}

_id_72D6()
{
    level endon( "game_ended" );
    self endon( "death" );
    var_0 = scripts\engine\trace::_id_48B1() + physics_createcontents( [ "physicscontents_solid" ] );
    var_1 = self.origin;

    for (;;)
    {
        scripts\engine\utility::waitframe();
        var_2 = [ self.owner ];

        if ( isdefined( self._id_AD30 ) )
            var_2[var_2.size] = self._id_AD30;

        var_3 = physics_spherecast( var_1, self.origin, 32, var_0, var_2, "physicsquery_closest" );

        if ( var_3.size > 0 )
        {
            var_4 = var_3[0]["entity"];

            if ( _id_9FE2( var_4 ) )
                _id_10DE4( var_4 );
            else
            {
                self notify( "detonateExplosive" );
                break;
            }
        }

        var_1 = self.origin;
    }
}

_id_5916( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self moveto( var_0, var_1 );
    scripts\engine\utility::waitframe();
}

_id_9FE2( var_0 )
{
    return !isdefined( self._id_AD30 ) && isdefined( var_0 ) && isplayer( var_0 ) && var_0 getstance() != "prone";
}

_id_10DE4( var_0, var_1, var_2 )
{
    self._id_AD30 = var_0;
    var_0 _meth_823A( self, "tag_origin", 1 );
    self rotateto( self.angles + ( 0, 180, 0 ), 0.1 );
    var_0._id_DB17 = var_1;
    var_0 shellshock( "concussion_grenade_mp", var_2 );
    var_0 _meth_8441( "ges_hold" );
}
