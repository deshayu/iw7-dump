// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_94ED()
{
    _id_F945( "debris_350" );
    _id_F945( "debris_1000" );
    _id_F945( "debris_1500" );
    _id_F945( "debris_2000" );
    _id_F945( "debris_1250" );
    _id_F945( "debris_750" );
}

_id_F945( var_0 )
{
    var_1 = scripts\engine\utility::_id_8180( var_0, "script_noteworthy" );

    foreach ( var_3 in var_1 )
        _id_F4A1( var_3 );
}

_id_F4A1( var_0 )
{
    var_1 = getentarray( var_0._id_0334, "targetname" );

    foreach ( var_3 in var_1 )
    {
        var_3 _meth_8318( 1 );
        wait 0.1;
    }
}

_id_9749()
{
    var_0 = scripts\engine\utility::_id_8180( "power_door_sliding", "script_noteworthy" );

    foreach ( var_2 in var_0 )
        var_2 thread _id_102F8();
}

_id_102F8()
{
    if ( scripts\engine\utility::_id_9CEE( self._id_E1B9 ) )
        level scripts\engine\utility::waittill_any( "power_on", self._id_D71C + " power_on" );

    self._id_D776 = 1;

    if ( isdefined( self._id_EEB0 ) )
        playloopsound( self.origin, self._id_EEB0 );

    var_0 = getentarray( self._id_0334, "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.moved ) )
            continue;

        if ( var_2.classname == "script_brushmodel" )
        {
            var_2.moved = 1;
            var_2 connectpaths();
            var_2 notsolid();
        }

        if ( var_2.classname == "script_model" )
        {
            var_2.moved = 1;
            var_2 moveto( var_2.origin + var_2._id_ECF3, 0.5 );
        }
    }

    _id_0A59::_id_554F( self );
    _id_0D61::_id_F28B( self );
    _id_0D61::_id_15FC( self._id_ECFA );
}
