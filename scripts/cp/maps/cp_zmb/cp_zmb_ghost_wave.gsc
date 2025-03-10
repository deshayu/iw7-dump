// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    _id_9603();
    _id_F98F();
    _id_9604();
    _id_97B5();
    _id_9601();
    _id_953C();
    _id_95EB();
    _id_9691();
    _id_0F79::_id_DF0C();
}

_id_953C()
{
    level._id_269B = [];

    for ( var_0 = 1; var_0 <= level.gns_num_of_wave; var_0++ )
        level._id_269B[var_0] = [];
}

_id_95EB()
{
    if ( isdefined( level.init_formation_movement_func ) )
        [[ level.init_formation_movement_func ]]();
    else
        init_formation_movements_default();
}

init_formation_movements_default()
{
    level._id_732A = [];
    _id_DEB7( 1, ::_id_731A );
    _id_DEB7( 2, ::_id_731B );
    _id_DEB7( 3, ::_id_731C );
    _id_DEB7( 4, ::_id_731D );
    _id_DEB7( 5, ::_id_731E );
    _id_DEB7( 6, ::_id_731F );
    _id_DEB7( 7, ::_id_7320 );
    _id_DEB7( 8, ::_id_7321 );
    _id_DEB7( 9, ::_id_7322 );
    _id_DEB7( 10, ::_id_7323 );
    _id_DEB7( 11, ::_id_7324 );
    _id_DEB7( 12, ::_id_7325 );
    _id_DEB7( 13, ::_id_7326 );
    _id_DEB7( 14, ::_id_7327 );
    _id_DEB7( 15, ::_id_7328 );
}

_id_9691()
{
    level._id_BD48 = [];
}

_id_DEC3( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4._id_BC84 = var_1;
    var_4.solo_move_time = var_2;
    var_4._id_13594 = var_3;
    var_4._id_7329 = scripts\engine\utility::_id_DC6B( level._id_269B[var_0] );
    var_4._id_BC4D = level._id_732A[var_4._id_7329];
    level._id_BD48[var_0] = var_4;
}

_id_12FE9( var_0 )
{
    var_0 giveweapon( "iw7_entangler_zm" );
    var_0 _meth_83B6( "iw7_entangler_zm" );
    var_0 scripts\engine\utility::_id_1C76( 0 );
    var_0 thread _id_65FF( var_0 );
    var_0 thread _id_6601( var_0 );
    var_0._id_D784 = var_0 _id_0D15::_id_7A3C( var_0 );
    var_0 _id_0D15::_id_41D0();
}

_id_11053( var_0 )
{
    var_0 scripts\engine\utility::_id_1C76( 1 );
    var_0 _meth_83B8( "iw7_entangler_zm" );

    if ( !var_0 hasweapon( var_0._id_13BFF ) )
        var_0 _id_0A77::_id_12C6( var_0._id_13BFF, undefined, undefined, 1 );

    var_0 _meth_83B5( var_0._id_13BFF );
    var_0 _id_0D15::_id_E2D1( var_0, var_0._id_D784 );
    var_0 _id_418F( var_0 );
}

_id_65FF( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "stop_using_entabgler" );

    for (;;)
    {
        _id_DDE6( var_0, 0 );
        var_1 = 0;

        for (;;)
        {
            var_2 = var_0 scripts\engine\utility::_id_13737( 0.2, "entangler_hit_same_target" );

            if ( var_2 == "entangler_hit_same_target" )
            {
                var_1 = var_1 + 0.2;
                var_3 = min( var_1 / _id_798F(), 1 );
                _id_DDE6( var_0, var_3 );

                if ( var_3 == 1 && isalive( var_0._id_4B6F ) && !_id_0C2D::_id_9DDD( var_0._id_4B6F ) && !isdefined( var_0.ghost_in_entanglement ) )
                    var_0._id_4B6F _id_0C2D::_id_65FE( var_0._id_4B6F, var_0 );

                continue;
            }

            break;
        }
    }
}

_id_798F()
{
    return 1.25;
}

_id_6601( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "stop_using_entabgler" );

    for (;;)
    {
        wait 0.5;
        var_0 setweaponammoclip( "iw7_entangler_zm", weaponclipsize( "iw7_entangler_zm" ) );
    }
}

_id_DDE6( var_0, var_1 )
{
    var_0 setclientomnvar( "zom_entangler_progress_percent", var_1 );
}

_id_12DBA( var_0, var_1 )
{
    if ( !( isdefined( var_0._id_4B6F ) && var_0._id_4B6F == var_1 ) )
    {
        var_0 thread _id_4B70( var_0, var_1 );
        return;
    }

    var_0 notify( "entangler_hit_same_target" );
}

_id_4B70( var_0, var_1 )
{
    var_0 endon( "disconnect" );
    var_1 notify( "entangler_target_monitor" );
    var_1 endon( "entangler_target_monitor" );
    var_0._id_4B6F = var_1;
    scripts\engine\utility::waitframe();
    var_0._id_4B6F = undefined;
}

_id_F98F()
{
    level._id_EFF7 = ::_id_1300C;
}

_id_1300C( var_0 )
{
    var_1 = self;
    var_0 endon( "death" );
    var_1 endon( "death" );
    var_1 endon( "disconnect" );

    if ( !_id_0A77::isreallyalive( var_1 ) )
    {
        var_0 delete();
        return;
    }

    var_1 thread _id_0D15::_id_8397( "power_scu", "secondary", undefined, undefined, undefined, 0, 0 );
    _id_418F( var_1 );
    var_1._id_522D = var_0;
    var_0 waittill( "missile_stuck", var_2 );
    var_0 thread _id_EFF8( var_0, var_1 );

    for (;;)
    {
        scripts\engine\utility::waitframe();

        if ( isdefined( var_1._id_4B6F ) && _id_0C2D::_id_9DDD( var_1._id_4B6F ) )
        {
            var_3 = var_1._id_4B6F;

            if ( _id_8264( var_3, var_0 ) )
            {
                level thread _id_8273( var_3.origin + ( 0, 0, 40 ), var_1._id_522D.origin, var_1 );
                var_3._id_C026 = 1;
                var_3 suicide();
            }
        }
    }
}

_id_8273( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", var_0 );
    var_3 setmodel( "tag_origin" );
    wait 0.1;
    playfxontag( level._effect["zombie_ghost_trail"], var_3, "tag_origin" );
    var_4 = var_1;

    for (;;)
    {
        var_3 moveto( var_4, 0.5, 0.125 );
        var_3 waittill( "movedone" );

        if ( !( isdefined( var_2 ) && isdefined( var_2._id_522D ) ) )
            break;

        var_4 = var_2._id_522D.origin;

        if ( distancesquared( var_3.origin, var_4 ) < 400 )
            break;
    }

    var_3 delete();
}

_id_418F( var_0 )
{
    if ( isdefined( var_0._id_522D ) )
    {
        if ( isdefined( var_0._id_522D._id_AC8D ) )
            var_0._id_522D._id_AC8D delete();

        var_0._id_522D delete();
    }
}

_id_EFF8( var_0, var_1 )
{
    var_0 endon( "death" );
    var_1 endon( "disconnect" );
    var_0._id_AC8D = spawnfx( level._effect["zombie_ghost_scu"], var_0.origin );
    scripts\engine\utility::waitframe();

    if ( isdefined( var_0 ) )
        triggerfx( var_0._id_AC8D );
}

_id_8264( var_0, var_1 )
{
    if ( distancesquared( var_0.origin, var_1.origin ) < 6400 )
        return 1;

    return 0;
}

_id_9603()
{
    level._effect["zombie_ghost_trail"] = loadfx( "vfx/iw7/_requests/coop/zmb_ghost_soultrail" );
    level._effect["zombie_ghost_scu"] = loadfx( "vfx/iw7/_requests/coop/vfx_ghost_scu" );
    level._effect["moving_target_explode"] = loadfx( "vfx/iw7/core/zombie/powerups/vfx_zom_powerup_pickup.vfx" );
    level._effect["moving_target_portal"] = loadfx( "vfx/iw7/core/zombie/vfx_zmb_ghost_portal_green.vfx" );
    level._effect["GnS_activation"] = loadfx( "vfx/iw7/core/zombie/vfx_zmb_GnS_game_elec_bolts.vfx" );
    level._effect["skull_discovered"] = loadfx( "vfx/iw7/core/zombie/vfx_zmb_ghost_exp.vfx" );
}

_id_9604()
{
    level._id_13F2B = scripts\engine\utility::_id_8180( "ghost_spawn", "targetname" );
}

_id_10824( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_13F2D ) )
        level._id_13F2D = [];

    if ( !isdefined( var_2 ) )
        var_2 = "axis";

    var_3 = scripts\mp\mp_agent::_id_108E8( "zombie_ghost", var_2, var_0, var_1 );
    level._id_13F2D[level._id_13F2D.size] = var_3;
    return var_3;
}

_id_10FFB()
{
    level notify( "stop_ghosts_attack_logic" );
}

_id_8284()
{
    level endon( "game_ended" );
    level endon( "stop_ghosts_attack_logic" );
    wait 15;

    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            if ( var_1 _id_37FA( var_1 ) )
            {
                var_2 = sortbydistance( level._id_13F2D, var_1.origin );

                foreach ( var_4 in var_2 )
                {
                    if ( var_4 _id_37F8() )
                    {
                        var_4 _id_24B0( var_1 );
                        break;
                    }
                }
            }
        }

        wait 0.5;
    }
}

_id_37FA( var_0 )
{
    if ( var_0 _id_0A77::_id_9E3A() )
        return 0;

    if ( _id_0A5B::_id_D0EF( var_0 ) )
        return 0;

    if ( _id_0F74::_id_9EFA( var_0 ) )
        return 0;

    if ( !isalive( var_0 ) )
        return 0;

    if ( _id_7B38( var_0 ) > _id_7AC8() )
        return 0;

    if ( _id_118D9( var_0 ) < _id_7AE2() )
        return 0;

    return 1;
}

_id_7AC8()
{
    return 4;
}

_id_7AE2()
{
    return 3;
}

_id_37F8()
{
    if ( _id_9BEF() )
        return 0;

    var_0 = self;

    if ( _id_0C2D::_id_9DDD( var_0 ) )
        return 0;

    if ( var_0 _id_0C2D::_id_7ED5() == "attack" )
        return 0;

    if ( _id_118D8( var_0 ) < 7 )
        return 0;

    return 1;
}

_id_9BEF()
{
    return 1;
}

_id_7B38( var_0 )
{
    if ( !isdefined( var_0._id_C1F5 ) )
        var_0._id_C1F5 = 0;

    return var_0._id_C1F5;
}

_id_118D9( var_0 )
{
    if ( !isdefined( var_0._id_A8C1 ) )
        var_0._id_A8C1 = 0;

    return ( gettime() - var_0._id_A8C1 ) / 1000;
}

_id_118D8( var_0 )
{
    if ( !isdefined( var_0._id_A88B ) )
        var_0._id_A88B = 0;

    return ( gettime() - var_0._id_A88B ) / 1000;
}

_id_24B0( var_0 )
{
    var_1 = self;
    _id_F3CE( var_1, var_0 );
    var_1 thread _id_0C2D::_id_8278( var_0 );
}

_id_F3CE( var_0, var_1 )
{
    var_2 = gettime();
    var_1._id_C1F5++;
    var_1._id_A8C1 = var_2;
    var_0._id_A88B = var_2;
}

_id_10714( var_0 )
{
    level thread _id_10715( var_0 );
}

_id_10715( var_0 )
{
    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        var_2 = scripts\engine\utility::_id_DC6B( level._id_13F2B );
        var_3 = _id_10824( var_2.origin, ( 0, 0, 0 ), "axis" );
        scripts\engine\utility::waitframe();
    }
}

_id_97B5()
{
    level._id_13F2D = [];
}

_id_10C61()
{
    if ( scripts\engine\utility::_id_9CEE( level.gns_active ) )
        return;

    level.gns_active = 1;
    _id_0D45::_id_AF5B( level._id_13BD3 );
    _id_0D2C::_id_F617( 1 );
    _id_5565();
    _id_10C0C();
    play_start_ghost_vo_to_players();
    level._id_8288 = gettime();
    level.processing_ghost_wave_failing = 0;
    level thread _id_BD4B();
    level thread _id_8284();
    level thread _id_10C62();
    level thread _id_CFD5();

    if ( isdefined( level.gns_start_func ) )
        [[ level.gns_start_func ]]();

    foreach ( var_1 in level.players )
        enter_ghosts_n_skulls( var_1 );
}

play_start_ghost_vo_to_players()
{
    foreach ( var_1 in level.players )
        var_1 thread _id_0A6A::_id_12885( "ghost_start", "zmb_comment_vo", "low", 3, 0, 0, 1 );
}

enter_ghosts_n_skulls( var_0 )
{
    if ( isdefined( level.enter_ghosts_n_skulls_func ) )
        [[ level.enter_ghosts_n_skulls_func ]]( var_0 );

    var_0.dontremoveperks = 1;
    var_0 _id_0A5B::_id_6235( var_0 );
    var_0._id_13BFF = var_0 _id_0A77::getweapontoswitchbackto();
    var_0 _id_0D2B::take_player_super_pre_game();
    var_0.disable_self_revive_fnf = 1;
    var_0.allow_carry = 0;
    var_0.ghost_in_entanglement = undefined;
    var_0._id_5511 = 1;
    var_0.playing_ghosts_n_skulls = 1;
    var_0 store_and_take_perks( var_0 );
    var_0 _id_12980( var_0 );
    var_0 _id_1162C( var_0 );
    var_0 _id_56C1( var_0 );
    var_0 _id_12FE9( var_0 );
    var_0 _id_110A2( var_0 );
    var_0 _meth_800F( 0 );

    if ( isdefined( level.gns_laststand_monitor ) )
        var_0 thread [[ level.gns_laststand_monitor ]]( var_0 );
}

_id_CFD5()
{
    level endon( "game_ended" );
    level endon( "delay_end_ghost" );

    for (;;)
    {
        level waittill( "player_spawned", var_0 );
        var_0 thread delay_enter_ghosts_n_skulls( var_0 );
    }
}

delay_enter_ghosts_n_skulls( var_0 )
{
    level endon( "game_ended" );
    level endon( "delay_end_ghost" );
    var_0 endon( "disconnect" );

    if ( isdefined( level.gns_hotjoin_wait_notify ) )
        var_0 waittill( level.gns_hotjoin_wait_notify );

    wait 5.0;
    enter_ghosts_n_skulls( var_0 );
}

_id_10C0C()
{
    if ( scripts\engine\utility::_id_9CEE( level.disable_gns_death_trigger ) )
        return;

    var_0 = getent( "ghost_death_trigger", "targetname" );
    var_0 thread _id_8266( var_0 );
}

_id_8266( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "stop_death_trigger_monitor" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isplayer( var_1 ) )
            continue;

        if ( _id_0A5B::_id_D0EF( var_1 ) )
            continue;

        var_1 _meth_8366( ( 0, 1400, 700 ) );
        var_1 viewkick( 10, var_1.origin );
        var_1 shellshock( "default", 3 );
        var_1 _meth_80B0( var_1.health, var_1.origin );
    }
}

_id_62D4()
{
    _id_0D2C::_id_F617( 0 );
    _id_6225();
    _id_1101F();
    _id_10FFB();
    level thread _id_10FFC();
}

_id_10FD2()
{
    var_0 = getent( "ghost_death_trigger", "targetname" );
    var_0 notify( "stop_death_trigger_monitor" );
}

_id_62D3( var_0 )
{
    if ( !scripts\engine\utility::_id_9CEE( var_0.playing_ghosts_n_skulls ) )
        return;

    var_0 endon( "disconnect" );
    var_0 _id_E2BD( var_0 );

    if ( _id_0A5B::_id_D0EF( var_0 ) )
    {
        var_0 _id_0A5B::_id_992F( var_0 );
        scripts\engine\utility::waitframe();
    }

    var_0 _id_0A5B::_id_557F( var_0 );
    var_0 _id_12953( var_0 );
    var_0 _id_12954( var_0 );
    var_0 _id_E02F( var_0 );
    var_0 _id_11053( var_0 );
    var_0 _id_11631( var_0 );
    var_0 _id_E2BF( var_0 );
    var_0 _id_0A77::_id_E2D4();
    var_0.dontremoveperks = undefined;
    var_0.disable_self_revive_fnf = undefined;
    var_0.allow_carry = 1;
    var_0._id_5511 = undefined;
    var_0.playing_ghosts_n_skulls = undefined;
    var_0 _meth_800F( 1 );

    if ( isdefined( level.end_ghosts_n_skulls_func ) )
        [[ level.end_ghosts_n_skulls_func ]]( var_0 );

    var_0 thread _id_0A6A::_id_12885( "ghost_end", "zmb_comment_vo", "highest" );
}

_id_10C62()
{
    level endon( "game_ended" );
    level._id_13FA3 = 1;

    foreach ( var_1 in level._id_1084F )
    {
        if ( isdefined( var_1 ) )
        {
            var_1._id_54CB = 1;
            var_1._id_C026 = 1;
            var_1 suicide();
        }
    }

    scripts\engine\utility::waitframe();
    level thread _id_0D61::_id_10717();
}

_id_10FFC()
{
    level endon( "game_ended" );
    level._id_13FA3 = 0;
    level notify( "stop_ghost_spawn" );
    scripts\engine\utility::waitframe();

    foreach ( var_1 in level._id_13F2D )
    {
        var_1._id_54CB = 1;
        var_1._id_C026 = 1;
        var_1 suicide();
    }
}

_id_9601( var_0, var_1 )
{
    level._id_8269 = ::_id_12DFC;
}

_id_12DFC( var_0, var_1 )
{
    level._id_13F2D = scripts\engine\utility::array_remove( level._id_13F2D, self );
    level._id_3CB5 = scripts\engine\utility::array_remove( level._id_3CB5, self );
}

_id_BD4B()
{
    level endon( "game_ended" );
    level endon( "stop_moving_target_sequence" );
    _id_10C60();

    for ( var_0 = 1; var_0 <= level.gns_num_of_wave; var_0++ )
    {
        var_1 = scripts\engine\utility::_id_8180( "ghost_formation_" + _id_79C9( var_0 ), "targetname" );

        if ( var_1.size > 0 )
        {
            level._id_8287++;
            _id_E807( var_0, var_1 );

            if ( isdefined( level.complete_one_gns_wave_func ) )
                level thread [[ level.complete_one_gns_wave_func ]]();

            continue;
        }

        break;
    }

    _id_7667();
}

_id_E807( var_0, var_1 )
{
    _id_E207();
    _id_E20C();
    _id_E1E1();
    wait 2.0;
    _id_BD44( var_1, var_0 );
    _id_15D5( var_0 );
    _id_15A4();
    level thread _id_BD49();

    if ( isdefined( level.moving_target_activation_func ) )
        level thread [[ level.moving_target_activation_func ]]( var_0 );

    var_2 = _id_7D58( var_0 );
    var_3 = _id_7D59( var_0 );

    while ( _id_1637() )
    {
        foreach ( var_6, var_5 in level._id_BD43 )
        {
            if ( var_5.size == 0 )
                continue;

            _id_BC33( var_6, var_5, var_2, var_3 );
            level notify( "moving_target_attack", var_5 );
        }
    }
}

_id_BC33( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_79F7( var_0 );
    var_5 = _id_77D0( var_1 );

    if ( isdefined( var_5 ) && isdefined( var_5.origin ) )
        _id_12846( var_5.origin + var_4 );

    foreach ( var_7 in var_1 )
    {
        if ( !isdefined( var_7 ) )
            continue;

        if ( scripts\engine\utility::_id_9CEE( var_7._id_7009 ) )
            continue;

        var_7 moveto( var_7.origin + var_4, var_2 );
    }

    wait( var_2 + var_3 );
}

_id_77D0( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        if ( scripts\engine\utility::_id_9CEE( var_2._id_7009 ) )
            continue;

        return var_2;
    }

    return undefined;
}

_id_E207()
{
    level._id_BD43 = [];
    level._id_BD46 = [];
    level._id_BD46["high"] = [];
    level._id_BD46["medium"] = [];
    level._id_BD46["low"] = [];
    level._id_BD45 = [];
    level._id_C1F0 = 0;
    _id_12DF9();

    if ( isdefined( level._id_E207 ) )
        [[ level._id_E207 ]]();
}

_id_BD44( var_0, var_1 )
{
    foreach ( var_3 in var_0 )
    {
        var_4 = _id_10776( var_3 );
        level._id_BD43[level._id_BD43.size] = var_4;
    }

    foreach ( var_7, var_4 in level._id_BD43 )
        level._id_BD45[var_7] = _id_7AFC( var_1, var_4 );

    wait 1.0;
}

_id_7AFC( var_0, var_1 )
{
    var_2 = level._id_BD48[var_0];
    var_3 = [[ var_2._id_BC4D ]]( var_1 );
    return var_3;
}

_id_10776( var_0 )
{
    var_1 = [];
    var_1[var_1.size] = _id_10774( var_0 );
    scripts\engine\utility::waitframe();

    foreach ( var_3 in scripts\engine\utility::_id_8180( var_0._id_0334, "targetname" ) )
    {
        var_1[var_1.size] = _id_10774( var_3 );
        scripts\engine\utility::waitframe();
    }

    return var_1;
}

_id_10774( var_0 )
{
    var_1 = scripts\engine\utility::_id_817E( "ghost_wave_start_pos", "targetname" );
    var_2 = spawn( "script_model", var_1.origin );
    var_2 setmodel( get_moving_target_model() );
    var_2.angles = var_1.angles;
    var_2._id_EE79 = var_0._id_EE79;
    var_2._id_1E84 = var_0.angles;

    if ( isdefined( level.assign_moving_target_flags_func ) )
        [[ level.assign_moving_target_flags_func ]]( var_0, var_2 );

    var_2 moveto( var_0.origin, 1.0 );
    var_3 = var_0.script_noteworthy;
    level._id_BD46[var_3][level._id_BD46[var_3].size] = var_2;
    return var_2;
}

get_moving_target_model()
{
    if ( isdefined( level.gns_moving_target_model ) )
        return level.gns_moving_target_model;

    return "zmb_pixel_skull";
}

_id_15D5( var_0 )
{
    if ( isdefined( level.activate_moving_targets_func ) )
        [[ level.activate_moving_targets_func ]]( var_0 );
    else
        activate_moving_targets_default( var_0 );
}

activate_moving_targets_default( var_0 )
{
    foreach ( var_2 in level._id_BD43 )
    {
        foreach ( var_4 in var_2 )
        {
            var_4.original_angles_to_face = var_4.angles;
            var_4 rotateto( var_4._id_1E84, 1.0, 1.0 );
        }
    }

    wait 1.0;

    if ( isdefined( level.post_moving_target_rotate_func ) )
        level thread [[ level.post_moving_target_rotate_func ]]();

    foreach ( var_2 in level._id_BD43 )
    {
        foreach ( var_4 in var_2 )
            [[ level.set_moving_target_color_func ]]( var_4, var_0 );
    }
}

all_moving_targets_hide_color()
{
    foreach ( var_1 in level._id_BD43 )
    {
        foreach ( var_3 in var_1 )
        {
            if ( var_3._id_00B9 == "red" )
                continue;

            if ( scripts\engine\utility::_id_9CEE( var_3._id_7009 ) )
                continue;

            var_3 thread hide_color( var_3 );
        }
    }
}

all_moving_targets_show_color()
{
    foreach ( var_1 in level._id_BD43 )
    {
        foreach ( var_3 in var_1 )
        {
            if ( var_3._id_00B9 == "red" )
                continue;

            if ( scripts\engine\utility::_id_9CEE( var_3._id_7009 ) )
                continue;

            var_3 thread show_color( var_3 );
        }
    }
}

hide_color( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "become_red_moving_target" );
    var_0 rotateto( var_0.original_angles_to_face, 1.0, 1.0 );
    wait 1.0;
    var_0 setscriptablepartstate( "skull_vfx", "off" );
}

show_color( var_0 )
{
    var_0 endon( "death" );
    var_0 rotateto( var_0._id_1E84, 1.0, 1.0 );
    wait 1.0;
    var_0 setscriptablepartstate( "skull_vfx", var_0._id_00B9 );
}

_id_10C60()
{
    var_0 = scripts\engine\utility::_id_817E( "ghost_wave_portal", "targetname" );
    var_1 = spawnfx( level._effect["moving_target_portal"], var_0.origin, anglestoforward( var_0.angles ), anglestoup( var_0.angles ) );
    wait 1;
    triggerfx( var_1 );
    level._id_826D = var_1;
}

_id_10FFA()
{
    if ( isdefined( level._id_826D ) )
        level._id_826D delete();
}

activate_red_moving_target( var_0 )
{
    var_0 notify( "become_red_moving_target" );
    var_0.angles = var_0._id_1E84;
    set_moving_target_color( var_0, "red" );
    var_1 = var_0 scripts\engine\utility::_id_13737( level.moving_target_pre_fly_time, "death" );

    if ( var_1 == "timeout" )
        var_0 _id_6F83( var_0 );
}

set_moving_target_color( var_0, var_1 )
{
    var_0._id_00B9 = var_1;
    var_0 setscriptablepartstate( "skull_vfx", var_1 );
}

_id_BD49()
{
    level notify( "moving_targets_attack_logic" );
    level endon( "moving_targets_attack_logic" );
    level endon( "game_ended" );
    level endon( "stop_moving_target_sequence" );
    var_0 = 0;

    while ( _id_1637() )
    {
        level waittill( "moving_target_attack", var_1 );
        var_2 = gettime();

        if ( !_id_1C6A( var_0, var_2 ) )
            continue;

        var_0 = var_2 + get_moving_target_attack_interval();
        var_3 = _id_F19E( var_1 );

        if ( !isdefined( var_3 ) )
            continue;

        var_4 = var_3._id_BD41;
        var_5 = var_3.player;
        var_6 = vectornormalize( var_5 geteye() - var_4.origin );
        var_7 = var_4.origin + var_6 * 60;
        var_8 = var_5.origin;
        level thread _id_FE54( var_7, var_8 );
    }
}

get_moving_target_attack_interval()
{
    if ( isdefined( level.moving_target_attack_interval ) )
        return level.moving_target_attack_interval;

    return 1500;
}

_id_1C6A( var_0, var_1 )
{
    return var_1 > var_0;
}

_id_FE54( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 3; var_2++ )
    {
        magicbullet( "zmb_8bit_laser", var_0, var_1 );
        wait 0.25;
    }
}

_id_F19E( var_0 )
{
    if ( var_0.size == 0 )
        return undefined;

    var_1 = spawnstruct();
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4 ) )
            var_2[var_2.size] = var_4;
    }

    var_2 = scripts\engine\utility::_id_22A7( var_2 );

    foreach ( var_7 in var_2 )
    {
        var_8 = _id_F1A0( var_7 );

        if ( isdefined( var_8 ) )
        {
            var_1._id_BD41 = var_7;
            var_1.player = var_8;
            return var_1;
        }
    }

    return undefined;
}

_id_F1A0( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.players )
    {
        if ( _id_0A5B::_id_D0EF( var_3 ) )
            continue;

        if ( !bullettracepassed( var_0.origin, var_3 geteye(), 0, var_0 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return scripts\engine\utility::_id_DC6B( var_1 );
}

_id_1101F()
{
    _id_10FFA();

    foreach ( var_1 in level._id_BD43 )
    {
        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3 ) )
                var_3 delete();
        }
    }

    level notify( "stop_moving_target_sequence" );
}

_id_DB04()
{
    foreach ( var_2, var_1 in level._id_BD43 )
        level._id_BD43[var_2] = scripts\engine\utility::_id_22BC( var_1 );

    foreach ( var_4, var_1 in level._id_BD46 )
        level._id_BD46[var_4] = scripts\engine\utility::_id_22BC( var_1 );
}

_id_7667()
{
    level thread _id_50B6();
}

_id_50B6()
{
    level endon( "game_ended" );

    foreach ( var_1 in level.players )
        var_1 thread _id_0A6A::_id_12885( "quest_acrcade_play_success", "zmb_comment_vo", "highest", 3, 0, 0, 1 );

    _id_50B4( 1 );
    level._id_8286 = 1;
    _id_0D45::_id_AF83( level._id_8287, level._id_8286, ( gettime() - level._id_8288 ) / 1000 );

    if ( isdefined( level.gns_reward_func ) )
        level thread [[ level.gns_reward_func ]]();
}

_id_50B4( var_0 )
{
    level notify( "delay_end_ghost" );
    level endon( "delay_end_ghost" );
    _id_8E9F();
    _id_62D4();
    _id_100DF( var_0 );
    _id_10FD2();

    if ( isdefined( level.pre_gns_end_func ) )
        level thread [[ level.pre_gns_end_func ]]();

    wait 5;

    foreach ( var_2 in level.players )
        var_2 thread _id_62D3( var_2 );

    scripts\engine\utility::waitframe();
    _id_E1E1();
    level.gns_active = 0;

    if ( var_0 == 2 )
        level notify( "end_this_thread_of_gns_fnf_card" );

    if ( isdefined( level.gns_end_func ) )
        [[ level.gns_end_func ]]();
}

_id_8E9F()
{
    foreach ( var_1 in level.players )
        var_1 thread _id_8E7D( var_1 );
}

_id_8E7D( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 notify( "stop_using_entabgler" );
    scripts\engine\utility::waitframe();
    var_0 setclientomnvar( "zm_ui_ghost_arcade_message", 0 );
    var_0 setclientomnvar( "zom_entangler_progress_percent", 0 );
}

store_and_take_perks( var_0 )
{
    var_0._id_D7C1 = [];

    if ( !isdefined( var_0._id_13FA4 ) )
        return;

    foreach ( var_3, var_2 in var_0._id_13FA4 )
    {
        if ( scripts\engine\utility::_id_9CEE( var_0._id_13FA4[var_3] ) && should_be_removed_for_gns( var_3 ) )
        {
            var_0._id_D7C1 = scripts\engine\utility::_id_2279( var_0._id_D7C1, var_3 );
            var_0 _id_0D5D::_id_1145C( var_3 );
            gns_take_perks_handler( var_0, var_3 );
        }
    }
}

gns_take_perks_handler( var_0, var_1 )
{
    switch ( var_1 )
    {
        case "perk_machine_revive":
            var_0._id_F1E7--;
            break;
        default:
            break;
    }
}

should_be_removed_for_gns( var_0 )
{
    switch ( var_0 )
    {
        case "perk_machine_more":
            return 0;
        default:
            return 1;
    }
}

_id_E2BD( var_0 )
{
    foreach ( var_2 in var_0._id_D7C1 )
        var_0 _id_0D5D::_id_834E( var_2, 0 );
}

_id_56C1( var_0 )
{
    var_0 thread _id_56B9( var_0, 1, 6 );
}

_id_E02F( var_0 )
{
    var_0 setclientomnvar( "zm_ui_ghost_arcade_message", 0 );
}

_id_56B9( var_0, var_1, var_2 )
{
    var_0 endon( "disconnect" );
    var_0 notify( "display_ghost_arcade_message" );
    var_0 endon( "display_ghost_arcade_message" );

    if ( !isdefined( var_1 ) )
        return;

    var_0 setclientomnvar( "zm_ui_ghost_arcade_message", var_1 );
    wait( var_2 );
    _id_E02F( var_0 );
}

_id_E20C()
{
    level._id_C1F2 = 0;
}

_id_1637()
{
    return _id_7B35() > 0;
}

_id_7B35()
{
    var_0 = 0;

    foreach ( var_2 in level._id_BD46 )
        var_0 = var_0 + var_2.size;

    return var_0;
}

_id_79F7( var_0 )
{
    var_1 = level._id_BD45[var_0];
    var_2 = var_1[0];

    if ( var_1.size > 1 )
    {
        var_3 = [];

        for ( var_4 = 1; var_4 < var_1.size; var_4++ )
            var_3[var_3.size] = var_1[var_4];

        var_3[var_3.size] = var_2;
        level._id_BD45[var_0] = var_3;
    }

    return _id_12685( var_2 );
}

_id_7D58( var_0 )
{
    if ( _id_0A77::_id_9F02() || scripts\engine\utility::_id_9CEE( level._id_C552 ) )
        return level._id_BD48[var_0].solo_move_time;
    else
        return level._id_BD48[var_0]._id_BC84;
}

_id_7D59( var_0 )
{
    return level._id_BD48[var_0]._id_13594;
}

_id_12685( var_0 )
{
    switch ( var_0 )
    {
        case "R":
            return ( 120, 0, 0 );
        case "L":
            return ( -120, 0, 0 );
        case "F":
            return ( 0, 120, 0 );
        case "U":
            return ( 0, 0, 120 );
        case "D":
            return ( 0, 0, -120 );
        case "RU":
            return ( 120, 0, 120 );
        case "LU":
            return ( -120, 0, 120 );
        case "RD":
            return ( 120, 0, -120 );
        case "LD":
            return ( -120, 0, -120 );
        default:
    }
}

_id_77CF()
{
    if ( level._id_BD46["high"].size > 0 )
        return scripts\engine\utility::_id_DC6B( level._id_BD46["high"] );

    if ( level._id_BD46["medium"].size > 0 )
        return scripts\engine\utility::_id_DC6B( level._id_BD46["medium"] );

    if ( level._id_BD46["low"].size > 0 )
        return scripts\engine\utility::_id_DC6B( level._id_BD46["low"] );

    return undefined;
}

_id_6F83( var_0 )
{
    var_0 endon( "death" );
    var_0._id_7009 = 1;
    var_1 = scripts\engine\utility::_id_817E( "ghost_wave_start_pos", "targetname" );
    var_0 moveto( var_1.origin, 6.0 );
    var_0 waittill( "movedone" );
    level._id_C1F0++;
    _id_56CF();
    _id_53BB();
    _id_E0A0( var_0 );
    var_0 delete();
}

_id_56CF()
{
    _id_56C8();
    _id_12DF9();
}

_id_56C8()
{
    foreach ( var_1 in level.players )
        var_1 thread _id_56B9( var_1, _id_7C6E(), 4 );
}

_id_7C6E()
{
    switch ( level._id_C1F0 )
    {
        case 1:
            return 2;
        case 2:
            return 3;
        case 3:
            return 4;
    }
}

_id_12DF9()
{
    foreach ( var_1 in level.players )
        var_1 setclientomnvar( "zm_ui_num_targets_escaped", level._id_C1F0 );
}

_id_E0A0( var_0 )
{
    foreach ( var_3, var_2 in level._id_BD43 )
        level._id_BD43[var_3] = scripts\engine\utility::array_remove( var_2, var_0 );

    foreach ( var_5, var_2 in level._id_BD46 )
        level._id_BD46[var_5] = scripts\engine\utility::array_remove( var_2, var_0 );
}

_id_53BB()
{
    if ( level._id_C1F0 >= 3 )
        level thread _id_50B5();
}

_id_50B5()
{
    level endon( "game_ended" );

    if ( scripts\engine\utility::_id_9CEE( level.processing_ghost_wave_failing ) )
        return;

    level.processing_ghost_wave_failing = 1;
    level._id_8286 = 0;

    foreach ( var_1 in level.players )
        var_1 thread _id_0A6A::_id_12885( "quest_acrcade_play_fail", "zmb_comment_vo", "highest", 3, 0, 0, 1 );

    _id_0D45::_id_AF83( level._id_8287, level._id_8286, ( gettime() - level._id_8288 ) / 1000 );

    if ( isdefined( level.ghost_n_skull_reactivate_func ) )
        level thread [[ level.ghost_n_skull_reactivate_func ]]();

    _id_50B4( 2 );
}

_id_1162C( var_0 )
{
    var_1 = scripts\engine\utility::_id_8180( "ghost_wave_player_start", "targetname" );
    var_2 = var_1[var_0 getentitynumber()];
    var_0 setorigin( var_2.origin );
    var_0 setplayerangles( var_2.angles );
}

_id_11631( var_0 )
{
    var_1 = scripts\engine\utility::_id_8180( "ghost_wave_player_end", "targetname" );
    var_2 = var_1[var_0 getentitynumber()];
    var_0 setorigin( scripts\engine\utility::_id_5D14( var_2.origin, 50, -300 ) );
    var_0 setplayerangles( var_2.angles );
}

_id_12980( var_0 )
{
    var_0 setclientomnvar( "zm_ui_player_playing_ghost_arcade", 1 );
}

_id_12953( var_0 )
{
    var_0 setclientomnvar( "zm_ui_player_playing_ghost_arcade", 0 );
}

_id_100DF( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( scripts\engine\utility::_id_9CEE( var_2.playing_ghosts_n_skulls ) )
            _id_12981( var_2, var_0 );
    }
}

_id_12981( var_0, var_1 )
{
    var_0 setclientomnvar( "zm_ui_show_ghost_arcade_scores", var_1 );
}

_id_12954( var_0 )
{
    var_0 setclientomnvar( "zm_ui_show_ghost_arcade_scores", 0 );
}

_id_DE99( var_0, var_1 )
{
    level._id_269B[var_0] = scripts\engine\utility::_id_2279( level._id_269B[var_0], var_1 );
}

_id_DEB7( var_0, var_1 )
{
    level._id_732A[var_0] = var_1;
}

_id_79C9( var_0 )
{
    return level._id_BD48[var_0]._id_7329;
}

_id_5565()
{
    level._id_3869 = ::_id_8275;
}

_id_6225()
{
    level._id_3869 = undefined;
}

_id_8275( var_0 )
{
    return 0;
}

_id_110A2( var_0 )
{
    var_0._id_D7C0 = var_0 _id_0A63::_id_7B8B();
    var_0 setrankedplayerdata( "cp", "alienSession", "currency", 0 );
    var_0 _id_0A63::_id_666A( "currency", 0, 1 );
}

_id_E2BF( var_0 )
{
    var_0 setrankedplayerdata( "cp", "alienSession", "currency", int( var_0._id_D7C0 ) );
    var_0 _id_0A63::_id_666A( "currency", int( var_0._id_D7C0 ), 1 );
}

_id_93F2( var_0 )
{
    var_1 = var_0 getrankedplayerdata( "cp", "alienSession", "currency" );
    var_0 setrankedplayerdata( "cp", "alienSession", "currency", int( var_1 + 1 ) );
    var_0 _id_0A63::_id_666A( "currency", int( var_1 + 1 ), 1 );
}

_id_12846( var_0 )
{
    if ( var_0[1] < level._id_4B63 )
        return;

    _id_18CB();
}

_id_E1E1()
{
    level._id_4B63 = level.original_death_grid_lines_front_y_pos;
    _id_F32C( level.death_trigger_reset_y_pos );
}

_id_15A4()
{
    level._id_4B63 = level.original_death_grid_lines_front_y_pos;
    _id_F32C( level.death_trigger_activate_y_pos );
}

_id_18CB()
{
    var_0 = getent( "ghost_death_trigger", "targetname" );
    var_1 = var_0.origin[1];
    var_2 = var_1 + 217;
    var_3 = level.death_trigger_activate_y_pos + 217 * get_max_num_of_death_trigger_advance();

    if ( var_2 >= var_3 )
        level thread _id_50B5();

    level._id_4B63 = level._id_4B63 + 217;
    _id_F32C( var_2 );
}

get_max_num_of_death_trigger_advance()
{
    if ( isdefined( level.max_num_of_death_trigger_advance ) )
        return level.max_num_of_death_trigger_advance;
    else
        return 13;
}

_id_F32C( var_0 )
{
    var_1 = getent( "ghost_death_trigger", "targetname" );
    var_2 = getent( "ghost_death_grid_lines", "targetname" );
    var_1 dontinterpolate();
    var_2 dontinterpolate();
    var_1.origin = ( var_1.origin[0], var_0, var_1.origin[2] );
    var_2.origin = ( var_2.origin[0], var_0, var_2.origin[2] );
}

_id_731A( var_0 )
{
    return [ "R", "R", "R", "F", "L", "L", "L", "F" ];
}

_id_731B( var_0 )
{
    return [ "U", "D", "D", "U", "F" ];
}

_id_731C( var_0 )
{
    return [ "R", "R", "R", "F", "L", "L", "L", "F" ];
}

_id_731D( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_EE79 ) )
        {
            switch ( var_2._id_EE79 )
            {
                case "LU":
                    return [ "LU", "F", "RD", "F" ];
                case "RU":
                    return [ "RU", "F", "LD", "F" ];
                case "LD":
                    return [ "LD", "F", "RU", "F" ];
                case "RD":
                    return [ "RD", "F", "LU", "F" ];
                default:
            }
        }
    }
}

_id_731E( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_EE79 ) )
        {
            switch ( var_2._id_EE79 )
            {
                case "LU":
                    return [ "LU", "F", "RD", "F" ];
                case "RU":
                    return [ "RU", "F", "LD", "F" ];
                case "LD":
                    return [ "LD", "F", "RU", "F" ];
                case "RD":
                    return [ "RD", "F", "LU", "F" ];
                default:
            }
        }
    }
}

_id_731F( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_EE79 ) )
        {
            switch ( var_2._id_EE79 )
            {
                case "LU":
                    return [ "LU", "F", "RD", "F" ];
                case "RU":
                    return [ "RU", "F", "LD", "F" ];
                case "LD":
                    return [ "LD", "F", "RU", "F" ];
                case "RD":
                    return [ "RD", "F", "LU", "F" ];
                default:
            }
        }
    }
}

_id_7320( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_EE79 ) )
        {
            switch ( var_2._id_EE79 )
            {
                case "L":
                    return [ "L", "R", "F" ];
                case "R":
                    return [ "R", "L", "F" ];
                case "U":
                    return [ "U", "D", "F" ];
                default:
            }
        }
    }
}

_id_7321( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_EE79 ) )
        {
            switch ( var_2._id_EE79 )
            {
                case "LD":
                    return [ "LD", "RU", "F" ];
                case "RD":
                    return [ "RD", "LU", "F" ];
                case "U":
                    return [ "U", "D", "F" ];
                default:
            }
        }
    }
}

_id_7322( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_EE79 ) )
        {
            switch ( var_2._id_EE79 )
            {
                case "L":
                    return [ "L", "R", "F" ];
                case "R":
                    return [ "R", "L", "F" ];
                case "D":
                    return [ "D", "U", "F" ];
                default:
            }
        }
    }
}

_id_7323( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_EE79 ) )
        {
            switch ( var_2._id_EE79 )
            {
                case "U":
                    return [ "U", "F", "D", "F" ];
                case "D":
                    return [ "D", "F", "U", "F" ];
                default:
            }
        }
    }
}

_id_7324( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_EE79 ) )
        {
            switch ( var_2._id_EE79 )
            {
                case "U":
                    return [ "U", "F", "D", "F" ];
                case "D":
                    return [ "D", "F", "U", "F" ];
                default:
            }
        }
    }
}

_id_7325( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_EE79 ) )
        {
            switch ( var_2._id_EE79 )
            {
                case "L":
                    return [ "L", "F", "R", "F" ];
                case "R":
                    return [ "R", "F", "L", "F" ];
                default:
            }
        }
    }
}

_id_7326( var_0 )
{
    return [ "R", "R", "F", "L", "L", "F" ];
}

_id_7327( var_0 )
{
    return [ "R", "R", "F", "L", "L", "F" ];
}

_id_7328( var_0 )
{
    return [ "R", "R", "F", "D", "F", "U", "F", "L", "L", "F" ];
}

give_gns_base_reward( var_0 )
{
    var_0 _id_0A63::_id_831D( 1000, 1 );
    var_0.have_permanent_perks = 1;
    var_0.have_gns_perk = 1;
    var_0 thread _id_5FB7( var_0 );
}

_id_5FB7( var_0 )
{
    var_0 endon( "disconnect" );
    var_1 = [ "perk_machine_boom", "perk_machine_flash", "perk_machine_fwoosh", "perk_machine_more", "perk_machine_rat_a_tat", "perk_machine_revive", "perk_machine_run", "perk_machine_smack", "perk_machine_tough", "perk_machine_zap" ];

    if ( isdefined( level.all_perk_list ) )
        var_1 = level.all_perk_list;

    foreach ( var_3 in var_1 )
    {
        if ( var_0 _id_0A77::_id_8BBE( var_3 ) )
            continue;

        wait 0.5;
        var_0 _id_0D5D::_id_834E( var_3, 0 );
    }
}

_id_C127( var_0, var_1 )
{
    level thread _id_12DF8( var_0 );

    if ( soundexists( "ghosts_quest_step_notify" ) )
    {
        foreach ( var_3 in level.players )
            var_3 playlocalsound( "ghosts_quest_step_notify" );
    }
}

_id_12DF8( var_0, var_1 )
{
    level endon( "game_ended" );

    if ( var_0 == 6 )
    {
        foreach ( var_3 in level.players )
        {
            if ( var_3 _id_0A77::_id_9BA0( "activate_gns_machine" ) )
            {
                var_3 notify( "activate_gns_machine_timeup" );
                var_3 notify( "activate_gns_machine_exited_early" );
            }
        }
    }

    if ( isdefined( var_1 ) )
        wait( var_1 );

    setomnvar( "zm_num_ghost_n_skull_coin", var_0 );
    level.skulls_before_activation = var_0;
}

reactivate_cabinet()
{
    setomnvar( "zm_num_ghost_n_skull_coin", 5 );
}

set_consumable_meter_scalar( var_0, var_1 )
{
    var_0.consumable_meter_scalar = var_1;
}
