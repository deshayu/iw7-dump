// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_D687()
{
    level._effect["portal_open"] = loadfx( "vfx/iw7/core/zombie/vfx_zmb_portal_generator.vfx" );
}

_id_D68B( var_0 )
{
    if ( !isalive( self ) )
    {
        var_0 delete();
        return;
    }

    var_0 waittill( "missile_stuck", var_1 );

    if ( scripts\engine\utility::_id_9CEE( self._id_9C54 ) )
    {
        thread _id_CC21( var_0 );
        return;
    }

    if ( isdefined( var_1 ) && isdefined( var_1.owner ) )
    {
        thread _id_CC21( var_0 );
        return;
    }

    if ( scripts\engine\utility::_id_6E25( "disable_portals" ) )
    {
        thread _id_CC21( var_0 );
        return;
    }

    foreach ( var_3 in level.players )
    {
        if ( var_3 == self )
            continue;

        if ( distance( var_3.origin, var_0.origin ) < 50 )
        {
            thread _id_CC21( var_0 );
            return;
        }
    }

    if ( _id_0A6B::_id_9E54( var_0.origin, level._id_9B0B, self, undefined, 1, var_1 ) )
    {
        var_5 = self canplayerplacesentry( 1, 12 );
        var_6 = spawn( "script_model", var_0.origin );
        var_6 setmodel( "black_hole_projector_wm" );
        var_6.angles = var_0.angles;
        var_6.team = self.team;
        var_6.owner = self;
        var_6 thread _id_D68C();
        var_6 thread _id_D685( self );
        var_6 thread _id_D688( 10 );
        var_6 thread _id_D683( self );
        var_6 _meth_831F( self );
        var_6 _id_0A6B::_id_69FF( var_5["entity"], 1 );
        _id_0A6B::_id_C5AC( var_6 );
        self notify( "powers_portalGenerator_used", 1 );
    }
    else
    {
        thread _id_CC21( var_0 );
        return;
    }

    scripts\engine\utility::waitframe();

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_CC21( var_0 )
{
    self notify( "powers_portalGenerator_used", 0 );
    _id_0A6B::_id_CC16( var_0._id_13C2E, 1, var_0.origin );
    var_0 delete();
}

_id_D684( var_0 )
{
    _id_0A6B::monitordamage( 100, "trophy", ::_id_D686, ::_id_D689, 0 );
}

_id_D686( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self.owner ) && var_0 != self.owner )
        var_0 notify( "destroyed_equipment" );

    self notify( "detonateExplosive" );
}

_id_D689( var_0, var_1, var_2, var_3 )
{
    var_4 = var_3;
    return var_4;
}

_id_D68C()
{
    level endon( "game_ended" );
    self waittill( "detonateExplosive" );
    self scriptmodelclearanim();
    self stoploopsound();
    self playsound( "phase_portal_end" );
    var_0 = self.origin;
    self notify( "death" );

    if ( isdefined( self ) )
    {
        if ( isdefined( self._id_A63A ) )
            self._id_A63A delete();

        _id_0A6B::_id_66A8();
        _id_0A6B::_id_51B5();
    }
}

_id_D685( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );
    self notify( "detonateExplosive" );
}

_id_D68A( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    var_0 waittill( "spawned_player" );
    self notify( "detonateExplosive" );
}

_id_D688( var_0 )
{
    self endon( "death" );
    wait( var_0 );
    self notify( "detonateExplosive" );
}

_id_D683( var_0 )
{
    var_1 = spawn( "trigger_rotatable_radius", self.origin, 0, 50, 100 );
    var_1.angles = self.angles;
    var_1.team = var_0.team;
    var_1 thread _id_13B15( var_0 );
    var_1 thread _id_13B14( self, 10 );
    var_2 = 50;
    var_3 = anglestoup( self.angles );
    var_3 = var_2 * self.angles;
    var_4 = self.origin + var_3;
    var_1._id_D682 = spawnfx( scripts\engine\utility::_id_7ECB( "portal_open" ), self.origin + ( 0, 0, 50 ), anglestoforward( self.angles ), anglestoup( self.angles ) );
    triggerfx( var_1._id_D682 );
    _id_0A77::_id_D52A( "phase_portal_start", var_4 );
    scripts\engine\utility::_id_50E1( 1.0, ::playloopsound, "phase_portal_energy_lp" );
}

_id_13B15( var_0 )
{
    self endon( "death" );
    var_1 = 10;
    var_2 = 1;

    for (;;)
    {
        self waittill( "trigger", var_3 );

        if ( !isplayer( var_3 ) )
        {
            wait 0.1;
            continue;
        }

        if ( scripts\engine\utility::_id_9CEE( var_3._id_9F2A ) )
        {
            wait 0.1;
            continue;
        }

        if ( scripts\engine\utility::_id_9CEE( var_3.playing_game ) )
        {
            wait 0.1;
            continue;
        }

        if ( _id_0A77::_id_462B( "portal" ) )
        {
            if ( isdefined( level._id_5592 ) )
                var_3 thread [[ level._id_5592 ]]( var_3, 0.5, "fast_travel_complete" );

            if ( isdefined( level._id_6B8D ) )
                var_3 thread [[ level._id_6B8D ]]( var_3, 1 );

            continue;
        }

        if ( isdefined( var_3._id_DDCA ) && var_3._id_DDCA )
            continue;

        if ( !_id_0D12::_id_9DDF( var_3 ) )
            var_3 thread _id_10DDD( var_1 );
        else
            var_3 _id_0D12::_id_6978( 1 );

        var_3 thread _id_10DDE( var_2 );
    }
}

_id_10DDD( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "phase_shift_completed" );
    _id_0D12::_id_6626( 1, var_0 );
    wait( var_0 );
    thread _id_6979();
}

_id_10DDE( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self._id_DDCA = 1;
    wait( var_0 );
    self._id_DDCA = undefined;
}

_id_6979()
{
    level endon( "game_ended" );
    _id_0D12::_id_6978( 1 );
    var_0 = self gettagorigin( "j_mainroot" ) + ( 0, 0, 10 );
    var_1 = spawnfx( scripts\engine\utility::_id_7ECB( "portal_open" ), var_0 );
    triggerfx( var_1 );
    wait 0.3;
    var_1 delete();
}

_id_13B14( var_0, var_1 )
{
    var_0 scripts\engine\utility::_id_13736( var_1, "death" );

    if ( isdefined( self._id_C2B5 ) )
        objective_delete( self._id_C2B5 );

    if ( isdefined( self._id_D682 ) )
        self._id_D682 delete();

    self delete();
}
