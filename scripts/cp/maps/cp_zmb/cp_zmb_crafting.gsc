// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_9594()
{
    level._id_B426 = 1;
    level._id_C1E2 = 0;
    level._id_A89F = gettime();
    level._id_47C1 = 25000;
    level._id_47C0 = 60000;
    level._id_BF36 = gettime() + 180000;
    level._id_47BE = ::_id_13F02;
    level._id_47BD = ::_id_13F01;
    level._id_47C2 = _id_78F1( level._id_47CF );
    level._id_47A7 = _id_78EA( level._id_47CF );
    level._id_47C3 = level._id_47C2;
    level._id_CC0C = [];
    level.crafting_icon_create_func = ::_id_4939;
}

_id_9596()
{
    var_0 = scripts\engine\utility::_id_8180( "crafting_station", "script_noteworthy" );

    foreach ( var_3, var_2 in var_0 )
        var_2 thread _id_47CE( var_3 );
}

_id_47CE( var_0 )
{
    if ( var_0 > 0 )
        wait( 0.1 * var_0 );

    var_1 = scripts\engine\utility::_id_8180( self._id_0334, "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( var_3.script_noteworthy == "fx_spot" )
        {
            self._id_47B8 = var_3;
            continue;
        }

        if ( var_3.script_noteworthy == "egg_land_spot" )
            self._id_5FF5 = var_3;
    }

    var_1 = getentarray( self._id_0334, "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( var_3.script_noteworthy == "souvenir_light" )
        {
            self._id_01B9 = var_3;
            continue;
        }

        if ( var_3.script_noteworthy == "souvenir_toy" )
        {
            self._id_1048E = var_3;
            continue;
        }

        if ( var_3.script_noteworthy == "station" )
            self._id_1048C = var_3;
    }

    if ( isdefined( self._id_01B9 ) )
        self._id_01B9 setlightintensity( 0 );

    if ( scripts\engine\utility::_id_9CEE( self._id_E1B9 ) && isdefined( self._id_D71C ) )
        level scripts\engine\utility::waittill_any( "power_on", self._id_D71C + " power_on" );

    if ( isdefined( self._id_01B9 ) )
        self._id_01B9 setlightintensity( 0.65 );

    self._id_D776 = 1;
    self._id_6261 = 0;
    self._id_269F = 3;
    self._id_94CA = [];
    self._id_10485 = undefined;
    self._id_1048C setscriptablepartstate( "body", "default_on" );
    self._id_1048C setscriptablepartstate( "monitor_1", "logo" );
    self._id_1048C setscriptablepartstate( "monitor_2", "logo" );
    self._id_1048C setscriptablepartstate( "monitor_3", "logo" );
    self._id_5FF5.origin = self._id_5FF5.origin + ( 0, 0, 2 );
}

_id_12FBE( var_0, var_1 )
{
    if ( !scripts\engine\utility::array_contains( level._id_4B88, var_0 ) )
        return;

    if ( var_0._id_269F > 0 )
    {
        if ( !isdefined( var_1._id_4B5E ) )
            return;
        else
        {
            var_1 playlocalsound( "zmb_coin_sounvenir_place" );
            var_1 thread _id_0A6A::_id_12885( "souvenir_coin_station", "zmb_comment_vo", "medium", 10, 0, 0, 1, 50 );

            if ( getweaponbasename( var_1 getcurrentweapon() ) != "iw7_penetrationrail_mp" )
                thread _id_0A77::firegesturegrenade( var_1, "iw7_souvenircoin_zm" );

            var_2 = "logo";
            level._id_10490 = var_1._id_4B5E._id_47C9;

            switch ( var_1._id_4B5E._id_47C9 )
            {
                case "zmb_coin_alien":
                    var_2 = "alien";
                    break;
                case "zmb_coin_space":
                    var_2 = "space";
                    break;
                case "zmb_coin_ice":
                    var_2 = "ice";
                    break;
            }

            switch ( var_0._id_269F )
            {
                case 3:
                    var_0._id_1048C setscriptablepartstate( "monitor_1", var_2 );
                    break;
                case 2:
                    var_0._id_1048C setscriptablepartstate( "monitor_2", var_2 );
                    break;
                case 1:
                    var_0._id_1048C setscriptablepartstate( "monitor_3", var_2 );
                    break;
            }

            playloopsound( var_0._id_47B8.origin + ( 0, 0, -5 ), "zmb_souvenir_machine_arm_mvmt" );
            var_1 setclientomnvar( "zombie_souvenir_piece_index", 0 );
            var_0._id_94CA = scripts\engine\utility::_id_1756( var_0._id_94CA, var_1._id_4B5E._id_47C9 );
            var_1._id_A8D3 = undefined;
            var_1._id_4B5E = undefined;
            var_0._id_269F--;
            var_1 _id_0A5E::_id_D9AD( "mt_used_crafting" );

            if ( var_0._id_269F > 0 )
                return;

            level notify( "quest_crafting_check", var_0 );
            _id_0A59::_id_E019( var_0 );
            level thread _id_1048F( var_0 );
            wait 0.25;
            playfx( level._effect["crafting_souvenir"], var_0._id_47B8.origin + ( 0, 0, -5 ) );
            playloopsound( var_0._id_47B8.origin + ( 0, 0, -5 ), "zmb_souvenir_machine_craft" );
            wait 2;

            if ( !isdefined( var_0._id_1048A ) )
            {
                var_0._id_1048A = var_0._id_1048E.origin;
                var_0._id_10489 = var_0._id_1048E._id_01F1;
            }

            var_0._id_1048E _meth_8212( -35, 0.2 );
            var_0._id_1048E waittill( "movedone" );
            var_0._id_1048E moveto( var_0._id_5FF5.origin, 0.2 );
            level thread _id_0A6A::_id_E01F( "nag_use_souvenircoin" );
            _id_0D45::_id_AF89( level._id_13BD3, level._id_10490 );
            _id_47A5( var_0, var_1 );

            if ( var_1 _id_0A77::_id_9D05() )
                var_1 thread _id_0A6A::_id_12885( "souvenir_craft_success", "zmb_comment_vo", "low", 10, 0, 0, 0, 50 );

            _id_0A6A::_id_E01F( "dj_souvenircoin_collect_nag" );
            var_0._id_1048C setscriptablepartstate( "monitor_3", "logo" );
            wait 0.1;
            var_0._id_1048C setscriptablepartstate( "monitor_2", "logo" );
            wait 0.1;
            var_0._id_1048C setscriptablepartstate( "monitor_1", "logo" );
            wait 0.1;
            _id_0A59::_id_175C( var_0 );

            while ( isdefined( var_0._id_10485 ) )
                wait 0.1;

            playfx( level._effect["souvenir_pickup"], var_0._id_1048E.origin + ( 0, 0, -45 ) );
            var_0._id_269F = 3;
            var_0._id_94CA = [];

            if ( var_1 _id_0A77::_id_9D05() )
                var_1._id_A8D3 = undefined;
        }
    }
}

_id_1048F( var_0 )
{
    var_1 = _id_78EC( var_0 );
    var_2 = lookupsoundlength( "announcer_crafting_inform" );
    playloopsound( var_0._id_1048C.origin + ( 0, 0, 60 ), "announcer_crafting_inform" );
    wait( var_2 / 1000 + 0.25 );

    switch ( var_1 )
    {
        case "crafted_autosentry":
            playloopsound( var_0._id_1048C.origin + ( 0, 0, 60 ), "announcer_crafting_sentry" );
            break;
        case "crafted_ims":
            playloopsound( var_0._id_1048C.origin + ( 0, 0, 60 ), "announcer_crafting_fireworks" );
            break;
        case "crafted_medusa":
            playloopsound( var_0._id_1048C.origin + ( 0, 0, 60 ), "announcer_crafting_medusa" );
            break;
        case "crafted_electric_trap":
            playloopsound( var_0._id_1048C.origin + ( 0, 0, 60 ), "announcer_crafting_electric" );
            break;
        case "crafted_boombox":
            playloopsound( var_0._id_1048C.origin + ( 0, 0, 60 ), "announcer_crafting_boombox" );
            break;
        case "crafted_revocator":
            playloopsound( var_0._id_1048C.origin + ( 0, 0, 60 ), "announcer_crafting_revocator" );
            break;
        case "crafted_gascan":
            playloopsound( var_0._id_1048C.origin + ( 0, 0, 60 ), "announcer_crafting_kindle" );
            break;
        case "crafted_windowtrap":
            playloopsound( var_0._id_1048C.origin + ( 0, 0, 60 ), "announcer_crafting_laser" );
            break;
    }
}

_id_13F02( var_0, var_1, var_2 )
{
    if ( !_id_FF3B( var_1 ) )
        return 0;
    else
    {
        level thread _id_10697( var_1 );
        return 1;
    }
}

_id_13F01( var_0, var_1 )
{
    level thread _id_10697( var_0, var_1 );
}

_id_10697( var_0, var_1 )
{
    level._id_C1E2++;
    level._id_A89F = gettime();
    level._id_BF36 = level._id_A89F + 30000 + randomintrange( level._id_47C1, level._id_47C0 );
    var_2 = spawn( "script_model", var_0 + ( 0, 0, 45 ) );
    var_2.angles = ( 90, 0, 0 );
    var_2._id_C378 = ( 90, 0, 0 );
    var_3 = scripts\engine\utility::_id_DC6B( level._id_47C3 );

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    var_2 setmodel( var_3 );
    var_2.script_noteworthy = "crafting_item";
    var_4 = "red";

    if ( var_2._id_01F1 == "zmb_coin_space" )
        var_4 = "blue";
    else if ( var_2._id_01F1 == "zmb_coin_ice" )
        var_4 = "green";

    var_2 setscriptablepartstate( "fx", var_4 );
    var_5 = _id_48C2( var_2, 25 );
    var_2 thread _id_47C6( var_5 );
}

_id_48C2( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.script_noteworthy = "crafting_pickup";
    var_2.origin = var_0.origin - ( 0, 0, 45 );
    var_2._id_0195 = var_0;
    var_2._id_E1B9 = 0;
    var_2._id_D776 = 1;
    var_2._id_EE79 = "crafting_pickup";
    var_2.name = "crafting_pickup";
    var_2._id_118D7 = var_1;
    var_2._id_47C9 = var_0._id_01F1;
    var_2._id_47BA = "";
    var_2._id_109DA = "souvenir_coin";
    _id_0A59::_id_175C( var_2 );
    return var_2;
}

_id_47C4( var_0, var_1 )
{
    if ( !isdefined( var_0._id_0195 ) )
        return;

    if ( isdefined( var_0._id_0195._id_2A89 ) )
        return;

    _id_0A59::_id_E019( var_0 );

    if ( !isdefined( level._id_4376 ) )
    {
        level._id_4376 = 1;
        level thread _id_0A6A::_id_1769( "dj_souvenircoin_collect_nag", "zmb_dj_vo", 60, 60, 2 );
    }

    var_2 = var_0.origin + ( 0, 0, 45 );
    playfx( level._effect["souvenir_pickup"], var_0._id_0195.origin );
    var_0._id_0195 delete();
    scripts\engine\utility::waitframe();

    if ( isdefined( var_1._id_4B5E ) )
    {
        var_1 playlocalsound( "zmb_coin_swap" );
        var_3 = spawnstruct();
        var_3.script_noteworthy = "crafting_pickup";
        var_3.origin = var_0.origin;
        var_3._id_0195 = spawn( "script_model", var_2 );
        var_3._id_0195.angles = ( 90, 0, 0 );
        var_3._id_0195._id_C378 = ( 90, 0, 0 );
        var_3._id_E1B9 = 0;
        var_3._id_D776 = 1;
        var_3._id_EE79 = var_1._id_4B5E._id_EE79;
        var_3.name = var_1._id_4B5E.name;
        var_3._id_118D7 = var_0._id_118D7;
        var_3._id_47C9 = var_1._id_4B5E._id_47C9;
        var_3._id_47BA = "";
        var_3._id_0195 setmodel( var_3._id_47C9 );
        var_1._id_4B5E = var_0;
        var_1 _id_4939( var_0 );
        var_3._id_0195 thread _id_47C6( var_3 );
        var_0 = undefined;
        _id_0A59::_id_175C( var_3 );
        wait 0.3;
        var_4 = "red";

        if ( var_3._id_0195._id_01F1 == "zmb_coin_space" )
            var_4 = "blue";
        else if ( var_3._id_0195._id_01F1 == "zmb_coin_ice" )
            var_4 = "green";

        var_3._id_0195 setscriptablepartstate( "fx", var_4 );
    }
    else
    {
        var_1 playlocalsound( "zmb_coin_pickup" );
        level._id_C1E2--;
        var_1._id_4B5E = var_0;
        var_1 thread _id_0A6A::_id_12885( "pillage_craft", "zmb_comment_vo", "low", 10, 0, 1, 0, 40 );
        var_1 _id_4939( var_0 );

        if ( isdefined( var_0._id_0195 ) )
            var_0._id_0195 delete();
    }
}

_id_4939( var_0 )
{
    var_1 = _id_7A27( var_0._id_47C9 );
    self setclientomnvar( "zombie_souvenir_piece_index", int( var_1 ) );
}

_id_47C6( var_0 )
{
    self endon( "death" );
    self endon( "vacuum" );
    self notify( "timeout" );
    self endon( "timeout" );
    var_1 = 25;

    if ( isdefined( var_0._id_118D7 ) )
        var_1 = int( var_0._id_118D7 );

    var_2 = gettime() + var_1 * 1000;
    var_3 = 0;
    var_4 = 0;

    while ( gettime() < var_2 )
    {
        if ( var_4 == 0 )
        {
            self _meth_8271( 360, 2 );
            self _meth_8212( 5, 2 );
        }

        if ( var_4 == 2 )
        {
            self _meth_8271( 360, 2 );
            self _meth_8212( -5, 2 );
        }

        if ( var_4 == 4 )
        {
            var_4 = 0;
            continue;
        }

        wait 1;
        var_4++;
        var_0._id_118D7 = var_0._id_118D7 - 1;
    }

    playloopsound( self.origin, "zmb_coin_disappear" );
    playfx( level._effect["souvenir_pickup"], self.origin );
    level._id_C1E2--;

    if ( level._id_C1E2 < 0 )
        level._id_C1E2 = 0;

    _id_0A59::_id_E019( var_0 );
    self delete();
}

_id_FF3B( var_0 )
{
    if ( level._id_C1E2 >= level._id_B426 )
        return 0;

    if ( !self._id_6622 )
        return 0;

    if ( isdefined( level._id_164B ) )
    {
        if ( ![[ level._id_164B ]]( var_0 ) )
            return 0;
    }

    if ( isdefined( level._id_9B0B ) )
    {
        if ( !_id_0A6B::_id_9E54( var_0, level._id_9B0B, undefined, undefined, 1 ) )
            return 0;
    }
    else if ( !_id_0A6B::_id_9E54( var_0, undefined, undefined, undefined, 1 ) )
        return 0;

    if ( randomint( 100 ) < 30 )
        return 0;

    if ( level._id_BF36 > gettime() )
        return 0;

    return 1;
}

_id_47A5( var_0, var_1 )
{
    var_2 = _id_78EC( var_0 );

    if ( !isdefined( var_2 ) )
        var_2 = "money";

    switch ( var_2 )
    {
        case "crafted_gascan":
        case "crafted_revocator":
        case "crafted_boombox":
        case "crafted_electric_trap":
        case "crafted_medusa":
        case "crafted_ims":
        case "crafted_autosentry":
        case "crafted_windowtrap":
            var_0.script_noteworthy = var_2;
            var_0._id_109DA = "craftable";
            var_0._id_E1B9 = 0;
            var_0._id_D776 = 1;
            var_0._id_EE79 = var_2;
            var_0.name = var_2;
            var_0._id_10485 = 1;
            var_0._id_D6B3 = 1;
            var_0._id_47B2 = 1;
            break;
        default:
            foreach ( var_4 in level.players )
            {
                var_4 _id_0A63::_id_82F9( 500 );
                break;
            }
    }

    _id_0D45::_id_AF77( level._id_13BD3, var_2 );

    if ( isdefined( var_1 ) && isalive( var_1 ) )
        var_1._id_A039 = var_2;
}

_id_78EC( var_0 )
{
    foreach ( var_2 in level._id_47A7 )
    {
        var_3 = 0;
        var_4 = var_2;

        foreach ( var_6 in var_0._id_94CA )
        {
            if ( scripts\engine\utility::array_contains( var_4, var_6 ) )
            {
                var_3++;
                var_4 = _id_E040( var_4, var_6 );
            }
        }

        if ( var_3 == 3 )
            return var_2[0];
    }

    return undefined;
}

_id_E040( var_0, var_1 )
{
    var_2 = 0;
    var_3 = [];

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        if ( !var_2 && var_0[var_4] == var_1 )
        {
            var_2 = 1;
            continue;
        }

        var_3[var_3.size] = var_0[var_4];
    }

    return var_3;
}

_id_78F1( var_0 )
{
    var_1 = [];

    for ( var_2 = 1; var_2 < 99; var_2++ )
    {
        var_3 = _id_113C5( var_0, var_2, 1 );

        if ( var_3 == "" )
            break;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_78EA( var_0 )
{
    var_1 = 1;
    var_2 = 2;
    var_3 = [];

    for ( var_4 = 100; var_4 <= 199; var_4++ )
    {
        var_5 = undefined;
        var_5 = _id_113C5( var_0, var_4, var_1 );

        if ( var_5 == "" )
            break;

        var_6 = strtok( _id_113C5( var_0, var_4, var_2 ), " " );
        var_6 = scripts\engine\utility::_id_229C( var_6, var_5, 0 );
        var_3[var_3.size] = var_6;
    }

    return var_3;
}

_id_113C5( var_0, var_1, var_2 )
{
    return tablelookup( var_0, 0, var_1, var_2 );
}

_id_7A27( var_0 )
{
    return tablelookup( "scripts/cp/maps/cp_zmb/cp_zmb_crafting.csv", 1, var_0, 0 );
}

_id_10488( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( isdefined( var_0._id_D4A9 ) )
        return;

    var_0 endon( "death" );
    var_0._id_D4A9 = 1;
    var_9 = "arcade_tooth_hit";
    var_0 playsound( var_9 );
    wait( lookupsoundlength( var_9 ) / 1000 );
    var_0._id_D4A9 = undefined;
}
