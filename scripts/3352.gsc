// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_F81E()
{
    thread _id_13A62();
}

_id_12D1B()
{
    self notify( "rewindUnset" );
    self setscriptablepartstate( "rewind", "neutral", 0 );
    thread _id_E163();
}

_id_10DEB()
{
    self endon( "disconnect" );
    self setscriptablepartstate( "rewind", "activeStart", 0 );
    self._id_1516 = 1;
    scripts\engine\utility::_id_1C6E( 0 );
    self _meth_855A( 0 );
    self notify( "cancel_sentry" );
    self notify( "cancel_medusa" );
    self notify( "cancel_trap" );
    self notify( "cancel_boombox" );
    self notify( "cancel_revocator" );
    self notify( "cancel_ims" );
    self notify( "cancel_gascan" );
    scripts\engine\utility::waitframe();

    foreach ( var_1 in level.players )
    {
        if ( var_1 == self )
            continue;

        self _meth_8429( var_1 );
    }

    self._id_9F2A = 1;
    _id_0A77::_id_17C0( "rewind", 0.0, 0 );
    self _meth_8209();
    _id_E2EB();
}

delayed_unset_damage_modifier()
{
    self endon( "disconnect" );
    wait 2;
    self._id_1516 = undefined;
    _id_0A77::_id_E0E6( "rewind", 0 );
}

_id_637E()
{
    self setscriptablepartstate( "rewind", "activeEnd", 0 );
    scripts\engine\utility::waitframe();

    if ( !self isonground() )
    {
        self._id_6F73 = 1;
        self _meth_855A( 1 );
        thread _id_12CE7();
    }

    thread delayed_unset_damage_modifier();
    _id_E4D5();
    _id_E4C7();
    _id_E163();
}

_id_12CE7()
{
    self endon( "disconnect" );

    while ( !self isonground() && isalive( self ) )
        wait 0.05;

    self._id_6F73 = undefined;
    self _meth_855A( 0 );
}

_id_E163()
{
    self._id_9F2A = undefined;
    self._id_1516 = undefined;
    _id_0A77::_id_E0E6( "rewind", 0 );

    if ( !scripts\engine\utility::_id_9FBE() )
        scripts\engine\utility::_id_1C6E( 1 );

    self _meth_84D3( "power_exit", "rewind" );

    foreach ( var_1 in level.players )
    {
        if ( var_1 == self )
            continue;

        self _meth_8388( var_1 );
    }

    self _meth_8208();
    _id_E2DC();
}

_id_13A62()
{
    self endon( "disconnect" );
    self endon( "rewindUnset" );
    self notify( "watchForRewind" );
    self endon( "watchForRewind" );

    for (;;)
    {
        var_0 = spawnstruct();
        childthread _id_13A66( var_0 );
        childthread _id_13A64( var_0 );
        childthread _id_13A63( var_0 );
        childthread _id_13A65( var_0 );
        self waittill( "rewindBeginRace" );
        waittillframeend;

        if ( isdefined( var_0._id_6ACF ) )
            _id_0D15::_id_D71A( 1, "secondary" );
        else if ( isdefined( var_0._id_10DE6 ) && isdefined( var_0._id_4E59 ) )
            _id_0D15::_id_D71A( 1, "secondary" );
        else if ( isdefined( var_0._id_637B ) )
            _id_637E();
        else if ( isdefined( var_0._id_10DE6 ) )
            _id_10DEB();

        self notify( "rewindEndRace" );
    }
}

_id_13A66( var_0 )
{
    self endon( "rewindEndRace" );
    self waittill( "rewindStart" );
    var_0._id_10DE6 = 1;
    self notify( "rewindBeginRace" );
}

_id_13A64( var_0 )
{
    self endon( "rewindEndRace" );
    self waittill( "rewindEnd" );
    var_0._id_637B = 1;
    self notify( "rewindBeginRace" );
    self notify( "powers_rewind_used", 1 );
}

_id_13A63( var_0 )
{
    self endon( "rewindEndRace" );
    self waittill( "death" );
    var_0._id_4E59 = 1;
    self notify( "rewindBeginRace" );
}

_id_13A65( var_0 )
{
    self endon( "rewindEndRace" );
    self waittill( "rewindFailed" );
    var_0._id_6ACF = 1;
    self notify( "rewindBeginRace" );
    self notify( "powers_rewind_used", 0 );
}

_id_E4D5()
{
    var_0 = self.maxhealth - self.health;
    self.health = self.maxhealth;
}

_id_E4C7()
{
    var_0 = self getweaponslistprimaries();

    foreach ( var_2 in var_0 )
    {
        if ( _id_0A77::_id_9C42( var_2 ) )
            continue;

        var_3 = weaponstartammo( var_2 );
        var_4 = self getweaponammoclip( var_2 ) + self getweaponammostock( var_2 );
        var_5 = scripts\engine\utility::ter_op( var_3 > var_4, var_3, var_4 );
        var_6 = int( min( weaponclipsize( var_2 ), var_5 ) );
        var_7 = var_5 - var_6;
        self setweaponammoclip( var_2, var_6 );
        self setweaponammostock( var_2, var_7 );
    }
}

_id_E2EB()
{
    if ( scripts\engine\utility::_id_9CEE( self._id_E4D9 ) )
        return;

    self._id_E4D9 = 1;
    scripts\engine\utility::_id_1C76( 0 );
    scripts\engine\utility::_id_1C6E( 0 );
    _id_0A77::_id_1C5E( 0 );
    thread _id_E2EC();
}

_id_E2DC()
{
    if ( !scripts\engine\utility::_id_9CEE( self._id_E4D9 ) )
        return;

    self._id_E4D9 = undefined;

    if ( !scripts\engine\utility::_id_A009() )
        scripts\engine\utility::_id_1C76( 1 );

    if ( !scripts\engine\utility::_id_9FBE() )
        scripts\engine\utility::_id_1C6E( 1 );

    if ( !_id_0A77::_id_9FA2() )
        _id_0A77::_id_1C5E( 1 );
}

_id_E2EC()
{
    self endon( "disconnect" );
    self endon( "rewindUnset" );
    self notify( "rewindRestrictFunctionalityCleanup" );
    self endon( "rewindRestrictFunctionalityCleanup" );
    self waittill( "death" );
    self._id_E4D9 = undefined;
}
