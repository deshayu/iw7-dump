// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_8453()
{
    level._id_10E3C = _id_79EB();
    level._id_5F7F = [];
    level._id_B467 = 24;
    level._id_B432 = 0;
    level._id_5274 = _id_8455();
    level._id_4B6E = 0;
    level.last_clown_spawn_time = gettime();
    _id_1071B();
}

_id_8455()
{
    var_0 = level.players.size;
    var_1 = var_0 * 3;
    var_2 = 2;

    switch ( level._id_1096B )
    {
        case 0:
            var_1 = var_0 * 6;
            break;
        case 1:
            var_1 = var_0 * 9;
            break;
        case 2:
            var_1 = var_0 * 12;
            break;
        case 3:
            var_1 = var_0 * 16;
            var_2 = 3;
            break;
        default:
            var_1 = var_0 * 16;
            var_2 = 3;
    }

    var_1 = var_1 * var_2;
    return var_1;
}

_id_1071B()
{
    level endon( "force_spawn_wave_done" );
    level endon( "game_ended" );
    level._id_E299 = 0;
    level._id_C1E8 = 0;
    level._id_4BB5 = 0;
    level._id_10725 = [];
    var_0 = 0;

    while ( level._id_4B6E < level._id_5274 )
    {
        while ( scripts\engine\utility::_id_9CEE( level._id_13FA3 ) || scripts\engine\utility::_id_9CEE( level.nuke_zombies_paused ) )
            scripts\engine\utility::waitframe();

        var_1 = _id_C1E9();
        var_2 = get_spawner_and_spawn_goons( var_1 );
        var_0 = var_0 + var_2;

        if ( var_2 > 0 )
        {
            wait( _id_8454( var_0, level._id_5274 ) );
            continue;
        }

        wait 0.1;
    }

    level._id_B467 = 0;
    level._id_B432 = 0;
    level._id_11046 = 1;
}

_id_B26D()
{
    if ( !_id_9C13( level._id_162C, self ) )
        level._id_162C[level._id_162C.size] = self;

    self._id_0019 = 1;
    self._id_93A8 = 0;
}

_id_B26E()
{
    self._id_0019 = 0;
}

_id_5CF7( var_0, var_1, var_2 )
{
    if ( isdefined( level._id_726C ) )
    {
        level thread _id_0A76::_id_5CF6( var_1, var_2, level._id_726C );
        level._id_726C = undefined;
        return 1;
    }

    if ( level._id_106E2 == 1 )
    {
        if ( level._id_5274 == level._id_4B6E )
        {
            level thread _id_0A76::_id_5CF6( var_1, var_2, "ammo_max" );
            return 1;
        }
        else
            return 0;
    }
    else
        return 0;
}

_id_79EB()
{
    return [ "skater" ];
}

_id_8454( var_0, var_1 )
{
    var_2 = 1.5;

    switch ( level._id_1096B )
    {
        case 0:
            var_2 = 3;
            break;
        case 1:
            var_2 = 2;
            break;
        case 2:
            var_2 = 1.5;
            break;
        case 3:
            var_2 = 1;
            break;
        default:
            var_2 = 1;
    }

    var_2 = var_2 - var_0 / var_1;
    var_2 = max( var_2, 0.05 );
    return var_2;
}

_id_826F()
{
    var_0 = 0.5;
    return var_0;
}

_id_8270()
{
    var_0 = level.players.size;
    return 8 + 4 * var_0;
}

get_spawner_and_spawn_goons( var_0 )
{
    var_1 = 0;

    if ( var_0 <= 0 )
    {
        if ( var_0 < 0 )
            _id_0D61::_id_A5FA( abs( var_0 ) );

        return 0;
    }

    if ( isdefined( level.respawn_data ) )
    {
        if ( level.respawn_data.type == "skater" )
            var_0 = 1;
    }

    var_2 = min( var_0, 2 );
    _id_1071C( var_2 );
    return var_2;
}

_id_1071C( var_0 )
{
    var_1 = 0.3;
    var_2 = 0.7;

    if ( var_0 > 0 )
    {
        _id_0D61::_id_93E6( var_0 );
        var_3 = [];
        var_4 = scripts\engine\utility::_id_817E( "brute_hide_org", "targetname" );
        var_5 = 0;

        while ( var_5 < var_0 )
        {
            var_6 = _id_10719( var_4 );

            if ( isdefined( var_6 ) )
            {
                var_5++;
                var_6 _meth_82EF( var_6.origin );
                var_6 scripts\anim\notetracks_mp::_id_F85E( 1, "spawn_in_box" );
                var_6._id_0180 = 1;
                var_6._id_0184 = 1;
                var_6._id_EF64 = 1;
                var_3[var_3.size] = var_6;
            }

            wait 0.1;
        }

        var_7 = _id_0D61::_id_7C2E();
        var_7._id_93A8 = 1;
        var_7.lastspawntime = gettime();
        thread _id_0A77::_id_D52A( "zombie_spawn_lightning", var_7.origin );

        for ( var_8 = 0; var_8 < var_3.size; var_8++ )
        {
            var_6 = var_3[var_8];
            var_9 = _id_0D61::_id_772C( var_7.origin, var_7.angles );
            var_6._id_02AE = var_9;
            _id_1B99( var_6._id_02AE );
            var_6 _id_0D61::_id_BC94( var_6._id_02AE );
            var_6._id_0184 = 0;
            var_6._id_EF64 = 0;
            var_6 scripts\anim\notetracks_mp::_id_F85E( 0, "spawn_in_box" );
            var_9 = undefined;
            _id_0D61::_id_4FB6( 1 );
            wait( randomfloatrange( var_1, var_2 ) );
        }

        var_7._id_93A8 = 0;
    }
}

_id_1B99( var_0 )
{
    var_1 = level._effect["goon_spawn_bolt"];
    playfx( var_1, var_0.origin );
    playfx( level._effect["drone_ground_spawn"], var_0.origin, ( 0, 0, 1 ) );
    playrumbleonentity( "grenade_rumble", var_0.origin );
    earthquake( 0.3, 0.2, var_0.origin, 500 );
}

_id_BC94( var_0 )
{
    var_1 = getclosestpointonnavmesh( var_0.origin );
    self dontinterpolate();
    self setorigin( var_0.origin, 1 );
    self _meth_8286( var_0.origin );
    self._id_0180 = 0;
}

_id_772C( var_0, var_1 )
{
    var_2 = 50;
    var_3 = 50;
    var_4 = spawnstruct();
    var_4.angles = var_1;
    var_5 = var_4.origin;
    var_6 = 0;

    while ( !var_6 )
    {
        var_7 = randomintrange( var_2 * -1, var_2 );
        var_8 = randomintrange( var_3 * -1, var_3 );
        var_5 = getclosestpointonnavmesh( ( var_0[0] + var_7, var_0[1] + var_8, var_0[2] ) );
        var_6 = 1;

        foreach ( var_10 in level.players )
        {
            if ( positionwouldtelefrag( var_5 ) )
                var_6 = 0;
        }

        if ( !var_6 )
            wait 0.1;
    }

    var_4.origin = var_5 + ( 0, 0, 5 );
    return var_4;
}

_id_10719( var_0 )
{
    var_1 = "skater";
    var_2 = var_0.origin;
    var_3 = var_0.angles;
    var_4 = "axis";
    var_5 = scripts\mp\mp_agent::_id_108E8( var_1, var_4, var_2, var_3 );

    if ( isdefined( var_5 ) )
    {
        update_respawn_data( var_1 );
        var_5 _meth_84E6( 4 );
        var_0.lastspawntime = gettime();
        var_5 thread _id_0D61::_id_64E7( var_1 );
        level notify( "agent_spawned", var_5 );
    }

    return var_5;
}

update_respawn_data( var_0 )
{
    if ( isdefined( level.respawn_data ) )
    {
        var_1 = -1;

        for ( var_2 = 0; var_2 < level.respawn_enemy_list.size; var_2++ )
        {
            if ( level.respawn_enemy_list[var_2]._id_92B8 == level.respawn_data._id_92B8 && level.respawn_data.type == var_0 )
            {
                var_1 = var_2;
                break;
            }
        }

        if ( var_1 > -1 )
        {
            if ( isdefined( level.respawn_data.health ) )
                self.health = level.respawn_data.health;

            level.respawn_enemy_list = _id_0A77::_id_22B0( level.respawn_enemy_list, var_1 );
        }

        level.respawn_data = undefined;
    }
}

sasquatch_audio_monitor()
{
    level endon( "game_ended" );
    self endon( "death" );
    thread _id_0D62::_id_CE9B( self._id_13550, undefined, 1 );
    self._id_D4AA = 0;

    for (;;)
    {
        var_0 = scripts\engine\utility::_id_13736( 6, "attack_hit", "attack_miss", "attack_charge" );

        switch ( var_0 )
        {
            case "attack_hit":
                level thread _id_0D62::_id_CE9C( self, "attack", 0 );
                break;
            case "attack_miss":
                level thread _id_0D62::_id_CE9C( self, "attack", 0 );
                break;
            case "attack_charge":
                level thread _id_0D62::_id_CE9C( self, "charge_grunt", 0 );
                break;
            case "timeout":
                level thread _id_0D62::_id_CE9C( self, "idle_grunt", 0 );
                break;
        }
    }
}

_id_C1E9()
{
    var_0 = _id_0D61::_id_C209();
    return var_0;
}

_id_7C2E()
{
    var_0 = undefined;
    var_0 = _id_79EC();
    return var_0;
}

_id_79EC()
{
    var_0 = [];

    foreach ( var_2 in level._id_162C )
    {
        if ( scripts\engine\utility::_id_9CEE( var_2._id_0019 ) && !scripts\engine\utility::_id_9CEE( var_2._id_93A8 ) )
            var_0[var_0.size] = var_2;
    }

    if ( var_0.size > 0 )
    {
        var_2 = _id_8456( var_0 );

        if ( isdefined( var_2 ) )
            return var_2;
    }

    return scripts\engine\utility::_id_DC6B( var_0 );
}

_id_8456( var_0 )
{
    var_1 = [];
    var_2 = 2;
    var_3 = 1;
    var_4 = 5000;

    foreach ( var_6 in var_0 )
    {
        if ( _id_0D60::_id_800B( var_6._id_13538 ) )
        {
            var_1[var_1.size] = var_6;
            var_6._id_B92F = var_2;
            continue;
        }

        if ( isdefined( var_6._id_13538._id_186E ) )
        {
            foreach ( var_8 in var_6._id_13538._id_186E )
            {
                if ( _id_0D60::_id_800B( var_8 ) )
                {
                    var_1[var_1.size] = var_6;
                    var_6._id_B92F = var_3;
                    break;
                }
            }
        }
    }

    var_11 = 562500;
    var_12 = 4000000;
    var_13 = 9000000;
    var_14 = 122500;
    var_15 = 40000;
    var_16 = -99999999;
    var_17 = undefined;
    var_18 = 15000;
    var_19 = 40000;
    var_20 = " ";
    var_21 = undefined;
    var_22 = gettime();
    var_23 = _id_81F8();
    var_24 = [];

    if ( !isdefined( var_23 ) )
        return undefined;

    foreach ( var_6 in var_1 )
    {
        var_21 = "";
        var_26 = 0;
        var_27 = var_6._id_B92F * randomintrange( var_18, var_19 );
        var_28 = randomint( 100 );

        if ( isdefined( var_6._id_BF6C ) && var_6._id_BF6C >= var_22 )
        {
            var_26 = var_26 - 20000;
            var_21 = var_21 + " Short Cooldown";
        }

        var_29 = distancesquared( var_23.origin, var_6.origin );

        if ( var_29 < var_14 )
        {
            var_26 = var_26 - 50000;
            var_21 = var_21 + " Too Close";
        }
        else if ( var_29 > var_13 )
        {
            var_26 = var_26 - 50000;
            var_21 = var_21 + " Too Far";
        }
        else if ( var_29 < var_11 )
        {
            if ( var_28 < max( int( level._id_1096B + 1 ) * 10, 20 ) )
            {
                var_26 = var_26 + var_27;
                var_21 = var_21 + " Chance Close";
            }
            else
            {
                var_26 = var_26 - var_27;
                var_21 = var_21 + " Close";
            }
        }
        else if ( var_29 > var_12 )
        {
            var_26 = var_26 - var_27;
            var_21 = var_21 + " Far";
        }
        else
        {
            var_26 = var_26 + var_27;
            var_21 = var_21 + " Good Spawn";
        }

        if ( var_26 > var_16 )
        {
            var_16 = var_26;
            var_17 = var_6;
            var_20 = var_21;
            var_24[var_24.size] = var_6;
        }
    }

    if ( !isdefined( var_17 ) )
        return undefined;

    for ( var_31 = var_24.size - 1; var_31 >= 0; var_31-- )
    {
        var_32 = 1;

        foreach ( var_23 in level.players )
        {
            if ( distancesquared( var_23.origin, var_24[var_31].origin ) < var_15 )
            {
                var_32 = 0;
                break;
            }
        }

        if ( var_32 )
        {
            var_17 = var_24[var_31];
            break;
        }
    }

    var_17._id_BF6C = var_22 + var_4;
    return var_17;
}

_id_81F8()
{
    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( !isalive( var_2 ) )
            continue;

        if ( scripts\engine\utility::_id_9CEE( var_2._id_AD2C ) )
            continue;

        var_0[var_0.size] = var_2;
    }

    return scripts\engine\utility::_id_DC6B( var_0 );
}

_id_9608()
{
    level._id_8457 = [];
    var_0 = scripts\engine\utility::_id_8180( "dog_spawner", "targetname" );

    if ( isdefined( level.goon_spawner_patch_func ) )
        [[ level.goon_spawner_patch_func ]]( var_0 );

    foreach ( var_2 in var_0 )
    {
        var_3 = 0;

        foreach ( var_5 in level._id_9B0B )
        {
            if ( ispointinvolume( var_2.origin, var_5 ) )
                var_3 = 1;
        }

        if ( !var_3 )
        {
            foreach ( var_5 in level._id_10816 )
            {
                if ( ispointinvolume( var_2.origin, var_5 ) )
                {
                    if ( !isdefined( var_2.angles ) )
                        var_2.angles = ( 0, 0, 0 );

                    level._id_8457[level._id_8457.size] = var_2;
                    var_2._id_13538 = var_5;

                    if ( !isdefined( var_5._id_8457 ) )
                        var_5._id_8457 = [];

                    var_5._id_8457[var_5._id_8457.size] = var_2;
                    break;
                }
            }
        }
    }
}

move_goon_spawner( var_0, var_1, var_2 )
{
    var_3 = scripts\engine\utility::_id_7E2E( var_1, var_0, 500 );
    var_3.origin = var_2;
}

_id_3712()
{
    var_0 = 400;

    switch ( level._id_1096B )
    {
        case 1:
        case 0:
            var_0 = 400;
            break;
        case 2:
            var_0 = 900;
            break;
        case 3:
            var_0 = 1300;
            break;
        default:
            var_0 = 1600;
    }

    return var_0;
}

_id_7CE3()
{
    if ( !isdefined( self._id_0334 ) )
        return undefined;

    var_0 = getentarray( self._id_0334, "targetname" );

    if ( !isdefined( var_0 ) || var_0.size == 0 )
        var_0 = scripts\engine\utility::_id_8180( self._id_0334, "targetname" );

    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3.remove_me ) )
            var_1[var_1.size] = var_3;
    }

    if ( var_1.size > 0 )
        var_0 = scripts\engine\utility::_id_22AC( var_0, var_1 );

    return var_0;
}

update_origin( var_0, var_1 )
{
    if ( !isdefined( level.spawn_struct_list ) )
        level.spawn_struct_list = scripts\engine\utility::_id_8180( "static", "script_noteworthy" );

    foreach ( var_3 in level.spawn_struct_list )
    {
        if ( var_3.origin == var_0 )
        {
            var_3.origin = var_1;
            break;
        }
    }
}

remove_origin( var_0 )
{
    if ( !isdefined( level.spawn_struct_list ) )
        level.spawn_struct_list = scripts\engine\utility::_id_8180( "static", "script_noteworthy" );

    foreach ( var_2 in level.spawn_struct_list )
    {
        if ( var_2.origin == var_0 )
        {
            var_2.remove_me = 1;
            break;
        }
    }
}

update_kvp( var_0, var_1, var_2 )
{
    if ( !isdefined( level.spawn_struct_list ) )
        level.spawn_struct_list = scripts\engine\utility::_id_8180( "static", "script_noteworthy" );

    foreach ( var_4 in level.spawn_struct_list )
    {
        if ( var_4.origin == var_0 )
        {
            var_4 = [[ level.kvp_update_funcs[var_1] ]]( var_4, var_2 );
            break;
        }
    }
}

kvp_update_init()
{
    level.kvp_update_funcs["script_fxid"] = ::update_kvp_script_fxid;
}

update_kvp_script_fxid( var_0, var_1 )
{
    var_0._id_EDBB = var_1;
    return var_0;
}

_id_77D3()
{
    if ( isdefined( level._id_186E[self._id_28AB] ) )
    {
        var_0 = [];

        foreach ( var_2 in level._id_186E[self._id_28AB] )
            var_0[var_0.size] = level._id_10817[var_2];

        return var_0;
    }

    return [];
}

_id_7999()
{
    var_0 = getentarray( self._id_027C, "script_noteworthy" );

    if ( isdefined( var_0 ) && var_0.size != 0 )
        self._id_665B = var_0;
}

_id_4F1E()
{
    level endon( "game_ended" );
    var_0 = getdvarint( "scr_spawn_start_delay" );

    if ( var_0 > 0 )
        wait( var_0 );
}

_id_1294D()
{
    foreach ( var_1 in level._id_1647 )
    {
        var_1._id_0019 = 0;
        var_1 notify( "dont_restart_spawner" );
    }

    level._id_1647 = [];
}

_id_AD62()
{
    level endon( "game_ended" );

    for (;;)
    {
        if ( getdvarint( "scr_reserve_spawning" ) > 0 )
            level._id_E1CC = getdvarint( "scr_reserve_spawning" );

        wait 1.0;
    }
}

should_spawn_skater()
{
    if ( isdefined( level.no_clown_spawn ) )
        return 0;

    if ( scripts\engine\utility::_id_6E25( "rk_fight_started" ) )
        return 0;

    if ( isdefined( level.respawn_data ) )
    {
        if ( level.respawn_data.type == "skater" )
            return 1;

        return 0;
    }

    var_0 = randomint( 100 );

    if ( var_0 < min( level._id_13BD3 - 19, 10 ) && level._id_13BD3 > 20 )
    {
        if ( gettime() - level.last_clown_spawn_time > 15000 )
        {
            level.last_clown_spawn_time = gettime();
            return 1;
        }
    }
    else
        return 0;

    return 0;
}

_id_726E()
{
    level notify( "force_spawn_wave_done" );
    wait 0.1;
    level._id_B467 = 0;
    level._id_B432 = 0;
    level._id_11046 = 1;
}

_id_5173( var_0 )
{
    scripts\engine\utility::waittill_any( "death", "emerge_done" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_3728( var_0 )
{
    var_1 = 0;
    var_2 = level._id_13BD3;

    if ( isdefined( level._id_8CBD ) && isdefined( level._id_8CBD[var_0] ) )
        var_1 = [[ level._id_8CBD[var_0] ]]();
    else
    {
        if ( isdefined( level._id_13BD6 ) )
            var_2 = level._id_13BD6;

        if ( scripts\engine\utility::_id_9CEE( self._id_9BA7 ) )
            var_2 = var_2 + 3;

        if ( scripts\engine\utility::_id_9CEE( self.is_skeleton ) )
            var_2 = var_2 + 10;

        if ( scripts\engine\utility::_id_9CEE( self.aj_karatemaster ) )
        {
            if ( var_2 < 10 )
                var_2 = var_2 + 20;
            else
                var_2 = var_2 + 10;
        }

        var_3 = 150;

        if ( var_2 == 1 )
            var_1 = var_3;
        else if ( var_2 <= 9 )
            var_1 = var_3 + ( var_2 - 1 ) * 100;
        else
        {
            var_4 = 950;
            var_5 = var_2 - 9;
            var_1 = var_4 * _func_17B( 1.1, var_5 );
        }
    }

    if ( isdefined( level._id_8CB3[var_0] ) )
        var_1 = int( var_1 * level._id_8CB3[var_0] );

    if ( var_1 > 6100000 )
        var_1 = 6100000;

    return int( var_1 );
}

_id_FF9D( var_0 )
{
    if ( _id_0A77::_id_9BD8() )
        return 0;

    if ( getdvar( "ui_mapname" ) == "cp_disco" )
        return 0;

    if ( var_0 < 5 )
        return 0;
    else if ( scripts\engine\utility::_id_6E34( "defense_sequence_active" ) && scripts\engine\utility::_id_6E25( "defense_sequence_active" ) )
        return 0;
    else if ( scripts\engine\utility::_id_6E34( "all_center_positions_used" ) && scripts\engine\utility::_id_6E25( "all_center_positions_used" ) )
        return 0;
    else if ( isdefined( level.should_run_event_func ) )
        return [[ level.should_run_event_func ]]( var_0 );
    else
    {
        var_1 = var_0 - level._id_A8BC;

        if ( var_1 < 5 )
            return 0;
        else
        {
            var_1 = var_1 - 4;
            var_2 = var_1 / 3 * 100;

            if ( randomint( 100 ) < var_2 )
                return 1;
        }
    }

    return 0;
}

_id_F604( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( !scripts\engine\utility::_id_9CEE( var_3._id_13CE5 ) )
            var_3 visionsetnakedforplayer( var_0, var_1 );
    }
}

_id_7848( var_0 )
{
    if ( isdefined( level.available_event_func ) )
        return [[ level.available_event_func ]]( var_0 );

    return "goon";
}

_id_7B1C()
{
    return level._id_13BD3 + 1;
}

_id_7D00( var_0, var_1 )
{
    if ( _id_0A77::_id_9BD8() )
        return 1;

    return 10;
}

_id_7CA9( var_0 )
{
    var_1 = [ "generic_zombie" ];
    return var_1;
}

_id_7ACD( var_0 )
{
    if ( _id_0A77::_id_9BD8() && var_0 < 5 )
    {
        var_1 = level.players.size * 6;
        var_2 = [ 0, 0.25, 0.3, 0.5, 0.7, 0.9 ];
        var_3 = 1;
        var_4 = 1;
        var_3 = var_2[var_0];
        var_5 = level.players.size - 1;

        if ( var_5 < 1 )
            var_5 = 0.5;

        var_6 = ( 24 + var_5 * 6 * var_4 ) * var_3;
        return int( min( var_1, var_6 ) );
    }

    return 24;
}

_id_7D10( var_0 )
{
    if ( _id_0A77::_id_9BD8() )
        return 9000;

    var_1 = [ 0, 0.25, 0.3, 0.5, 0.7, 0.9 ];
    var_2 = 1;
    var_3 = 1;

    if ( var_0 < 6 )
        var_2 = var_1[var_0];
    else if ( var_0 < 10 )
        var_3 = var_0 / 5;
    else
        var_3 = squared( var_0 ) * 0.03;

    var_4 = level.players.size - 1;

    if ( var_4 < 1 )
        var_4 = 0.5;

    var_5 = ( 24 + var_4 * 6 * var_3 ) * var_2;
    return int( var_5 );
}

_id_7CFF( var_0 )
{
    return 1;
}

_id_13691()
{
    while ( level._id_4B6E < level._id_5274 )
        wait 1.0;

    level._id_B467 = 0;
    level._id_B432 = 0;
    level._id_11046 = 1;
}

_id_9C13( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) || var_0.size == 0 )
        return 0;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] == var_1 )
            return 1;
    }

    return 0;
}

_id_13FA2()
{
    foreach ( var_1 in level._id_10816 )
    {
        if ( self istouching( var_1 ) )
            return 1;
    }

    return 0;
}

cp_disco_cleanup_main()
{
    var_0 = 0;
    level._id_BE23 = 0;

    for (;;)
    {
        scripts\engine\utility::waitframe();
        var_1 = gettime();

        if ( var_1 < var_0 )
            continue;

        if ( isdefined( level._id_BE22 ) )
        {
            var_2 = gettime() / 1000;
            var_3 = var_2 - level._id_BE22;

            if ( var_3 < 0 )
                continue;

            level._id_BE22 = undefined;
        }

        var_4 = ( var_1 - level._id_13BDA ) / 1000;

        if ( level._id_13BD3 <= 5 && var_4 < 30 )
            continue;
        else if ( level._id_13BD3 > 5 && var_4 < 20 )
            continue;

        var_5 = undefined;

        if ( level._id_5274 - level._id_4B6E < 3 )
            var_5 = 1000000;

        var_0 = var_0 + 3000;
        var_6 = _id_0A4A::_id_7DB0( "axis" );

        foreach ( var_8 in var_6 )
        {
            if ( level._id_BE23 >= 1 )
            {
                level._id_BE23 = 0;
                scripts\engine\utility::waitframe();
            }

            if ( _id_380D( var_8 ) )
                var_8 _id_5773( var_5 );
        }
    }
}

_id_380D( var_0 )
{
    if ( isdefined( level.zbg_active ) )
        return 0;

    if ( isdefined( var_0.agent_type ) && var_0.agent_type == "zombie_ghost" )
        return 0;

    if ( isdefined( var_0._id_2BF9 ) )
        return 0;

    if ( scripts\engine\utility::_id_9CEE( var_0._id_9CEF ) )
        return 0;

    if ( scripts\engine\utility::_id_9CEE( var_0.dont_cleanup ) )
        return 0;

    if ( isdefined( var_0.delay_cleanup_until ) && gettime() < var_0.delay_cleanup_until )
        return 0;

    return 1;
}

_id_5773( var_0 )
{
    if ( !isalive( self ) )
        return;

    if ( !_id_FF1A( self ) )
        return;

    var_1 = gettime() - self._id_107F7;

    if ( var_1 < 5000 )
        return;

    if ( self.agent_type == "generic_zombie" || self.agent_type == "lumberjack" )
    {
        if ( var_1 < 45000 && !self._id_6622 )
            return;
    }

    var_2 = 1;
    var_3 = 0;
    var_4 = 1;

    if ( scripts\engine\utility::_id_9CEE( self._id_565C ) && level._id_5274 - level._id_4B6E < 2 )
    {
        var_3 = 1;
        var_0 = 250000;
        var_2 = 0;
    }
    else if ( level._id_B789.size == 0 )
    {
        if ( isdefined( level._id_12F9D ) )
            var_2 = _id_0D61::_id_8016( 1, 0 );
        else
            var_2 = _id_0D61::_id_8016( 0, 0 );
    }
    else
    {
        var_2 = _id_0D61::_id_8016( 1, 0 );

        if ( var_2 )
            var_4 = _id_0D61::_id_8016( 0, 1 );
    }

    level._id_BE23++;

    if ( !var_2 || !var_4 )
    {
        var_5 = 10000000;
        var_6 = level.players[0];

        foreach ( var_8 in level.players )
        {
            var_9 = distancesquared( self.origin, var_8.origin );

            if ( var_9 < var_5 )
            {
                var_5 = var_9;
                var_6 = var_8;
            }
        }

        if ( isdefined( var_0 ) )
            var_11 = var_0;
        else if ( isdefined( var_6 ) && _id_0D61::_id_CF4C( var_6 ) )
            var_11 = 189225;
        else
            var_11 = 250000;

        if ( var_5 >= var_11 )
        {
            if ( !var_4 )
            {
                if ( level.last_mini_zone_fail + 1000 > gettime() )
                    return;
                else
                    level.last_mini_zone_fail = gettime();
            }

            thread _id_51A5( var_5, var_3 );
        }
    }
}

_id_FF1A( var_0 )
{
    if ( !isdefined( var_0.agent_type ) )
        return 0;

    if ( scripts\engine\utility::_id_9CEE( var_0._id_EF64 ) )
        return 0;

    switch ( var_0.agent_type )
    {
        case "superslasher":
        case "slasher":
            return 0;
        default:
            return 1;
    }
}

_id_51A5( var_0, var_1 )
{
    if ( scripts\engine\utility::_id_9CEE( self._id_93A7 ) )
        return;

    if ( var_1 )
    {
        if ( scripts\engine\utility::_id_9CEE( self._id_9D25 ) )
            _id_EDF6();
        else
        {

        }
    }
    else
    {
        foreach ( var_3 in level.players )
        {
            if ( scripts\engine\utility::_id_9CEE( var_3._id_1097A ) )
                continue;

            if ( scripts\engine\utility::_id_9CEE( var_3._id_9BE1 ) )
                continue;

            if ( scripts\engine\utility::_id_9CEE( var_3._id_9387 ) )
                continue;

            if ( _id_0D61::_id_CFB2( var_3 ) )
            {
                if ( var_0 < 4000000 )
                    return;
            }
        }

        self._id_54CB = 1;

        if ( scripts\engine\utility::_id_9CEE( self._id_B36D ) && isdefined( level._id_C20A ) )
            level._id_C20A--;

        if ( scripts\engine\utility::_id_9CEE( self._id_9D25 ) )
        {
            self._id_C026 = 1;
            _id_EDF6();
        }
    }
}

_id_EDF6()
{
    self _meth_80B0( self.health + 950, self.origin, self, self, "MOD_SUICIDE" );
}

pausenormalwavespawning( var_0 )
{
    scripts\engine\utility::_id_6E3E( "pause_wave_progression" );

    if ( scripts\engine\utility::_id_9CEE( var_0 ) )
        level._id_13FA3 = 1;
    else
        level._id_13FA3 = 0;
}

setmaxstaticspawns( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 16;

    if ( !isdefined( var_1 ) )
        var_1 = 24;

    if ( !isdefined( var_2 ) )
        var_2 = 24;

    if ( _id_0A77::_id_9F02() || scripts\engine\utility::_id_9CEE( level._id_C552 ) )
        level._id_B467 = var_0;
    else
        level._id_B467 = var_1;

    level._id_5274 = 24;
}

unpausenormalwavespawning()
{
    scripts\engine\utility::_id_6E2A( "pause_wave_progression" );
    level._id_13FA3 = 0;
}

storewavespawningcounters()
{
    var_0 = spawnstruct();
    var_0._id_4632 = level._id_4632;
    var_0._id_4B6E = level._id_4B6E;
    var_0._id_B467 = level._id_B467;
    var_0._id_5274 = level._id_5274;
    var_0._id_13BD3 = level._id_13BD3;
    level.storedspawncounters = var_0;
}

restorewavespawningcounters()
{
    var_0 = level.storedspawncounters;

    if ( level._id_13BD3 == var_0._id_13BD3 )
    {
        level._id_4B6E = var_0._id_4B6E;
        level._id_B467 = var_0._id_B467;
        level._id_5274 = var_0._id_5274;
    }
    else
    {
        level._id_4B6E = 0;
        level._id_B467 = _id_7ACD( level._id_13BD3 );
        level._id_5274 = _id_7D10( level._id_13BD3 );
    }

    level.storedspawncounters = undefined;
}

waitforvalidwavepause()
{
    while ( level._id_4B6E == level._id_5274 )
        wait 0.05;
}

unsetzombiemovespeed()
{
    level notify( "unsetZombieMoveSpeed" );
}

setzombiemovespeed( var_0 )
{
    level endon( "game_ended" );
    level notify( "unsetZombieMoveSpeed" );
    level endon( "unsetZombieMoveSpeed" );

    foreach ( var_2 in _id_0A4A::_id_7DB0( "axis" ) )
    {
        if ( isdefined( var_2.agent_type ) && var_2.agent_type != "ratking" )
        {
            var_3 = scripts\engine\utility::_id_DC6B( var_0 );
            var_2 thread _id_1887( var_2, 0, var_3 );
        }
    }

    for (;;)
    {
        level waittill( "agent_spawned", var_5 );
        var_3 = scripts\engine\utility::_id_DC6B( var_0 );
        var_5 thread _id_1887( var_5, 1, var_3 );
    }
}

_id_1887( var_0, var_1, var_2 )
{
    var_0 endon( "death" );

    if ( isdefined( var_0.agent_type ) && var_0.agent_type == "ratking" )
        return;

    if ( scripts\engine\utility::_id_9CEE( var_0._id_9CDD ) )
        return;

    if ( scripts\engine\utility::_id_9CEE( var_1 ) )
        wait 0.5;

    var_0 scripts\asm\asm_bb::_id_2968( var_2 );
}

disablespawnvolumes( var_0, var_1 )
{
    level.copy_active_spawn_volumes = level._id_1646;
    var_2 = undefined;
    var_3 = _id_0A4A::_id_7DB0( "axis" );

    foreach ( var_5 in level.copy_active_spawn_volumes )
    {
        if ( ispointinvolume( var_0, var_5 ) )
        {
            var_2 = var_5;

            foreach ( var_7 in var_3 )
                var_7 thread sendzombietopos( var_7, var_0 );

            break;
        }
    }

    foreach ( var_11 in level.copy_active_spawn_volumes )
    {
        if ( !scripts\engine\utility::_id_9CEE( var_1 ) )
        {
            if ( isdefined( var_2 ) && var_11 == var_2 )
                continue;
        }

        var_11 _id_0D61::_id_B292();
    }
}

restorespawnvolumes()
{
    level notify( "spawn_volumes_restored" );

    foreach ( var_1 in level.copy_active_spawn_volumes )
        var_1 _id_0D61::_id_B291();

    level.copy_active_spawn_volumes = undefined;
}

sendzombietopos( var_0, var_1 )
{
    level endon( "spawn_volumes_restored" );
    var_0 endon( "death" );
    var_2 = 250000;
    var_0._id_EF64 = 1;
    var_0._id_0180 = 1;
    var_0 _meth_82EF( var_1 );

    for (;;)
    {
        if ( distance( var_0.origin, var_1 ) < var_2 )
            break;

        wait 0.5;
    }

    var_0._id_EF64 = 0;
    var_0._id_0180 = 0;
}

setspecialevent()
{
    level._id_10942 = 1;
}

unsetspecialevent()
{
    level._id_10942 = undefined;
}

setspawndelayoverride( var_0 )
{
    level._id_10847 = var_0;
}

unsetspawndelayoverride( var_0 )
{
    level._id_10847 = undefined;
}

setwavenumoverride( var_0 )
{
    level._id_13BD6 = var_0;
}

unsetwavenumoverride( var_0 )
{
    level._id_13BD6 = undefined;
}

wave_complete_vo( var_0 )
{
    if ( !isdefined( level._id_4481 ) )
        level._id_4481 = [];

    if ( level.players.size < 2 )
    {
        if ( level.players[0]._id_134FD == "p5_" )
        {
            if ( randomint( 100 ) > 90 )
                level.players[0] thread _id_0A6A::_id_12885( "ww_p5_taunt", "rave_ww_vo" );
        }
    }

    if ( var_0 >= 8 && var_0 <= 12 )
    {
        if ( randomint( 100 ) > 60 )
        {
            var_1 = scripts\engine\utility::_id_DC6B( level.players );

            if ( isdefined( var_1._id_134FD ) )
            {
                switch ( var_1._id_134FD )
                {
                    case "p1_":
                        if ( !isdefined( level._id_4481["sally_end_round_8-12_1"] ) )
                        {
                            var_1 thread _id_0A6A::_id_12885( "sally_end_round_8-12_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                            level._id_4481["sally_end_round_8-12_1"] = 1;
                        }

                        break;
                    case "p4_":
                        if ( !isdefined( level._id_4481["aj_end_round_8-12_1"] ) )
                        {
                            var_1 thread _id_0A6A::_id_12885( "aj_end_round_8-12_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                            level._id_4481["aj_end_round_8-12_1"] = 1;
                        }

                        break;
                    case "p3_":
                        if ( !isdefined( level._id_4481["andre_end_round_8-12_1"] ) )
                        {
                            var_1 thread _id_0A6A::_id_12885( "andre_end_round_8-12_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                            level._id_4481["andre_end_round_8-12_1"] = 1;
                        }

                        break;
                    case "p2_":
                        if ( !isdefined( level._id_4481["pdex_end_round_8-12_1"] ) )
                        {
                            var_1 thread _id_0A6A::_id_12885( "pdex_end_round_8-12_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                            level._id_4481["pdex_end_round_8-12_1"] = 1;
                        }

                        break;
                    default:
                        break;
                }
            }
        }
    }
    else if ( var_0 >= 16 && var_0 <= 20 )
    {
        if ( randomint( 100 ) > 60 )
        {
            var_1 = scripts\engine\utility::_id_DC6B( level.players );

            if ( isdefined( var_1._id_134FD ) )
            {
                switch ( var_1._id_134FD )
                {
                    case "p1_":
                        if ( !isdefined( level._id_4481["sally_end_round_16-20_1"] ) )
                        {
                            var_1 thread _id_0A6A::_id_12885( "sally_end_round_16-20_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                            level._id_4481["sally_end_round_16-20_1"] = 1;
                        }

                        break;
                    case "p4_":
                        if ( !isdefined( level._id_4481["aj_end_round_16-20_1"] ) )
                        {
                            var_1 thread _id_0A6A::_id_12885( "aj_end_round_16-20_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                            level._id_4481["aj_end_round_16-20_1"] = 1;
                        }

                        break;
                    case "p3_":
                        if ( !isdefined( level._id_4481["andre_end_round_16-20_1"] ) )
                        {
                            var_1 thread _id_0A6A::_id_12885( "andre_end_round_16-20_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                            level._id_4481["andre_end_round_16-20_1"] = 1;
                        }

                        break;
                    case "p2_":
                        if ( !isdefined( level._id_4481["pdex_end_round_16-20_1"] ) )
                        {
                            var_1 thread _id_0A6A::_id_12885( "pdex_end_round_16-20_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                            level._id_4481["pdex_end_round_16-20_1"] = 1;
                        }

                        break;
                    default:
                        break;
                }
            }
        }
    }
    else if ( randomint( 100 ) > 60 )
    {
        if ( isdefined( level.spoke_to_pam_first ) )
        {
            var_2 = level.spoke_to_pam_first;

            switch ( var_2._id_134FD )
            {
                case "p1_":
                    if ( !isdefined( level._id_4481["sally_will_pam_fight_1"] ) )
                    {
                        var_2 thread _id_0A6A::_id_12885( "sally_will_pam_fight_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                        level._id_4481["sally_will_pam_fight_1"] = 1;
                    }

                    break;
                case "p4_":
                    if ( !isdefined( level._id_4481["aj_will_pam_fight_1"] ) )
                    {
                        var_2 thread _id_0A6A::_id_12885( "aj_will_pam_fight_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                        level._id_4481["aj_will_pam_fight_1"] = 1;
                    }

                    break;
                case "p3_":
                    if ( !isdefined( level._id_4481["andre_will_pam_fight_1"] ) )
                    {
                        var_2 thread _id_0A6A::_id_12885( "andre_will_pam_fight_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                        level._id_4481["andre_will_pam_fight_1"] = 1;
                    }

                    break;
                case "p2_":
                    if ( !isdefined( level._id_4481["pdex_will_pam_fight_1"] ) )
                    {
                        var_2 thread _id_0A6A::_id_12885( "pdex_will_pam_fight_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                        level._id_4481["pdex_will_pam_fight_1"] = 1;
                    }

                    break;
                default:
                    break;
            }
        }
    }
}
