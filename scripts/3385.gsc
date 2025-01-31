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
    _id_F945( "team_door_switch" );
    _id_F945( "chi_0" );
    _id_F945( "chi_1" );
    _id_F945( "chi_2" );
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

_id_102F3( var_0, var_1 )
{
    _id_0D61::_id_F28B( var_0 );
    _id_0D61::_id_15FC( var_0._id_ECFA );
    playloopsound( var_0.origin, "zmb_sliding_door_open" );
    var_2 = getentarray( var_0._id_0334, "targetname" );

    foreach ( var_4 in var_2 )
    {
        var_4 connectpaths();
        var_5 = scripts\engine\utility::_id_817E( var_4._id_0334, "targetname" );
        var_4 moveto( var_5.origin, 1 );
    }

    _id_0A59::_id_554F( var_0 );

    if ( level.players.size > 1 )
        var_1 thread _id_0A6A::_id_12885( "purchase_area", "zmb_comment_vo", "low", 10, 0, 0, 1, 40 );
    else
        level.players[0] thread _id_0A6A::_id_12885( "purchase_area", "zmb_comment_vo", "low", 10, 0, 1, 1, 40 );
}

_id_1302F( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;

    if ( !isdefined( level._id_115C8 ) )
        level._id_115C8 = 0;

    switch ( var_0._id_EEA9 )
    {
        case "moon":
            if ( !isdefined( level._id_BB11 ) )
                level._id_BB11 = -1;

            level._id_BB11++;
            var_3 = level._id_BB11;
            _id_0D45::log_purchasingforateamdoor( 1, var_1, var_0._id_EEA9, 1000, level._id_13BD3 );
            break;
        case "kepler":
            if ( !isdefined( level._id_A585 ) )
                level._id_A585 = -1;

            level._id_A585++;
            var_3 = level._id_A585;
            _id_0D45::log_purchasingforateamdoor( 1, var_1, var_0._id_EEA9, 1000, level._id_13BD3 );
            break;
        case "triton":
            if ( !isdefined( level._id_127FE ) )
                level._id_127FE = -1;

            level._id_127FE++;
            var_3 = level._id_127FE;
            _id_0D45::log_purchasingforateamdoor( 1, var_1, var_0._id_EEA9, 1000, level._id_13BD3 );
            break;
    }

    var_4 = getentarray( var_0._id_0334, "targetname" );

    foreach ( var_6 in var_4 )
    {
        if ( !isdefined( var_6.script_noteworthy ) )
            continue;
        else if ( var_6.script_noteworthy == "progress" )
        {
            var_6 _meth_8212( 4, 0.1 );
            var_6 waittill( "movedone" );
        }
    }

    if ( var_3 >= 3 )
    {
        level thread _id_C61B( var_0, var_2, var_3, var_1 );
        var_1 _id_0A5E::_id_D9AD( "mt_purchase_doors" );
        var_1 notify( "door_opened_notify" );
        level._id_115C8++;

        if ( level._id_115C8 == 2 )
            scripts\engine\utility::_id_6E3E( "canFiresale" );
    }

    if ( _id_0A77::_id_9F02() || scripts\engine\utility::_id_9CEE( level._id_C552 ) )
    {
        if ( !scripts\cp\zombies\direct_boss_fight::should_directly_go_to_boss_fight() )
            var_1 _id_0A63::_id_831D( 250, 1 );
    }
    else if ( !scripts\cp\zombies\direct_boss_fight::should_directly_go_to_boss_fight() )
        var_1 _id_0A63::_id_831D( 75, 1 );

    var_1 _id_0A59::_id_DE6E();
}

_id_C61B( var_0, var_1, var_2, var_3 )
{
    _id_0D45::_id_AF7E( 1, var_3, var_0._id_EEA9, 1000, level._id_13BD3 );
    thread _id_115B2( var_0 );
    _id_0A59::_id_554F( var_0 );
    var_4 = _id_0A59::_id_7A90( var_0 );

    foreach ( var_6 in var_4 )
    {
        if ( !level._id_10816[var_6._id_ECFA]._id_0019 )
            level thread [[ level.team_buy_vos ]]( var_6, var_3 );
    }

    foreach ( var_9 in var_4 )
    {
        _id_0D61::_id_F28B( var_9 );
        _id_0D61::_id_15FC( var_9._id_ECFA );
    }

    if ( isdefined( var_0._id_ED83 ) )
        scripts\engine\utility::_id_69A3( var_0._id_ED83 );

    var_11 = getentarray( var_4[0]._id_0334, "targetname" );

    foreach ( var_14, var_13 in var_11 )
    {
        if ( var_13._id_02AF == 1 )
        {
            var_13 connectpaths();
            var_13 notsolid();
            continue;
        }

        if ( var_13.classname == "script_brushmodel" )
        {
            var_13 hide();
            var_13 notsolid();
            continue;
        }

        var_13 setscriptablepartstate( "default", "hide" );

        if ( should_play_door_purchase_sound() )
            var_13 playsound( "purchase_generic" );
    }
}

_id_115B2( var_0 )
{
    wait 0.5;
    playloopsound( var_0.origin, "zmb_clear_barricade" );
    wait 0.5;
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
    playloopsound( self.origin, "zmb_sliding_door_open" );
    var_0 = getentarray( self._id_0334, "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2 connectpaths();
        var_3 = scripts\engine\utility::_id_817E( var_2._id_0334, "targetname" );
        var_2 moveto( var_3.origin, 1 );
    }

    _id_0A59::_id_554F( self );
    _id_0D61::_id_F28B( self );
    _id_0D61::_id_15FC( self._id_ECFA );
}

_id_8FDE( var_0, var_1 )
{
    playloopsound( var_0.origin, "zmb_gate_open" );
    var_2 = getent( var_0._id_0334, "targetname" );
    var_2 _meth_8271( 160, 1 );
    _id_0A59::_id_554F( var_0 );
}

_id_4142( var_0, var_1 )
{
    _id_0A59::_id_554F( var_0 );

    if ( isdefined( level.script ) && level.script == "cp_disco" )
    {
        if ( isdefined( var_0 ) && issubstr( var_0.name, "chi_" ) )
            playloopsound( var_0.origin, "cp_disco_doorbuy_chi_gongs" );
        else
            playloopsound( var_0.origin, "cp_disco_doorbuy_caution_tape" );
    }
    else
        playloopsound( var_0.origin, "zmb_clear_barricade" );

    _id_0D61::_id_F28B( var_0 );
    _id_0D61::_id_15FC( var_0._id_ECFA );
    var_2 = getentarray( var_0._id_0334, "targetname" );

    foreach ( var_5, var_4 in var_2 )
    {
        if ( var_4.classname == "script_brushmodel" )
        {
            var_4 connectpaths();
            var_4 notsolid();
            continue;
        }

        var_4 setscriptablepartstate( "default", "hide" );

        if ( should_play_door_purchase_sound() )
            var_4 playsound( "purchase_generic" );
    }
}

should_play_door_purchase_sound()
{
    if ( scripts\cp\zombies\direct_boss_fight::should_directly_go_to_boss_fight() )
        return 0;

    return 1;
}

_id_BC9C( var_0 )
{
    self endon( "death" );
    wait( var_0 * 0.2 );
    self _meth_8212( 10, 0.5 );
    self rotateto( self.angles + ( randomintrange( -10, 10 ), randomintrange( -10, 10 ), randomintrange( -10, 10 ) ), 0.5 );
    wait 0.5;
    self _meth_8212( 1000, 3, 2, 1 );
    wait 2;

    if ( isdefined( self ) )
        self delete();
}
