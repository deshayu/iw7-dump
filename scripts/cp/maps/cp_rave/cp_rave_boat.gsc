// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_96A9()
{
    level._id_B652 = ::_id_13F12;
    level._id_2BFA = getvehiclenode( "boat_start_struct", "targetname" );
    level._id_2BFB = spawnvehicle( "cp_rave_pap_boat_animated", "boat", "cp_rave_boat", level._id_2BFA.origin, level._id_2BFA.angles );
    level._id_2BFB attachpath( level._id_2BFA );
    level._id_2BFB._id_AD27 = [];
    scripts\engine\utility::_id_6E39( "packboat_started" );
    scripts\engine\utility::_id_6E39( "pap_fixed" );
    scripts\engine\utility::_id_6E39( "disable_portals" );
    scripts\engine\utility::_id_6E39( "fuses_inserted" );
    scripts\engine\utility::_id_6E39( "pap_portal_used" );
    level._id_2BFB _meth_8318( 0 );
    level._id_2BFB._id_246B = getentarray( level._id_2BFA._id_0334, "targetname" );

    foreach ( var_1 in level._id_2BFB._id_246B )
        var_1 linkto( level._id_2BFB );

    level._id_2BFB _meth_8187( "tag_motor" );
    wait 1;
    level._id_2BFD = scripts\engine\utility::_id_8180( "boat_water_spawners", "targetname" );
}

activate_pap( var_0 )
{
    var_1 = level._effect["vfx_rave_pap_room_portal"];
    var_2 = scripts\engine\utility::_id_817E( "porta_effect_location", "targetname" );
    var_2.script_noteworthy = "pap_portal";
    var_2._id_D674 = 1;
    var_2._id_E1B9 = 0;
    var_2._id_D776 = 1;
    var_2._id_EE79 = "default";
    var_2._id_4C72 = 96;
    _id_0A59::_id_175C( var_2 );
    level thread _id_1298D();
    var_3 = scripts\engine\utility::_id_817E( "projector_fx_struct", "targetname" );
    var_4 = spawnfx( level._effect["projector_light"], var_3.origin, anglestoforward( var_3.angles ), anglestoup( var_3.angles ) );
    var_5 = spawnfx( var_1, var_2.origin, anglestoforward( var_2.angles ), anglestoup( var_2.angles ) );
    wait 0.5;
    triggerfx( var_4 );
    scripts\engine\utility::delaythread( 0.05, scripts\engine\utility::_id_CD86, "zmb_packapunch_machine_idle_lp", var_3.origin );
    wait 0.5;
    triggerfx( var_5 );
    playloopsound( var_2.origin, "zmb_portal_powered_on_activate" );
    scripts\engine\utility::delaythread( 0.5, scripts\engine\utility::_id_CD86, "zmb_portal_powered_on_activate_lp", var_2.origin );
}

_id_1298D()
{
    var_0 = getent( "hidden_room_portal", "targetname" );
    var_1 = anglestoforward( var_0.angles );
    var_2 = spawnfx( level._effect["vfx_slasher_cabin"], var_0.origin, var_1 );
    thread scripts\engine\utility::_id_CD86( "zmb_portal_powered_on_activate_lp", var_0.origin );
    triggerfx( var_2 );
    _id_11627( var_0 );
}

_id_11627( var_0 )
{
    var_0 makeusable();
    var_0 sethintstring( &"CP_RAVE_HIDDEN_LEAVE" );
    var_0._id_D67A = 1;

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( !isdefined( var_1.kicked_out ) )
        {
            var_1 notify( "left_hidden_room_early" );
            var_1._id_5511 = 1;
            _id_8E60( var_1 );
        }

        wait 0.1;
    }
}

pap_portal_hint_logic( var_0, var_1 )
{
    if ( scripts\engine\utility::_id_6E25( "disable_portals" ) )
        return "";
    else if ( isdefined( var_0._id_4622 ) )
        return &"COOP_INTERACTIONS_COOLDOWN";
    else
        return &"CP_RAVE_HIDDEN_TELEPORT";
}

pap_portal_use_func( var_0, var_1 )
{
    if ( scripts\engine\utility::_id_6E25( "disable_portals" ) )
        return;

    if ( !var_1 _id_0A77::_id_9FA2() )
    {
        var_1 _id_0A59::_id_DE6E();
        return;
    }
    else
    {
        var_1 thread _id_5591( var_1, 0.5, "fast_travel_complete" );
        var_0 thread _id_126BE( var_1 );
        var_0 thread pap_portal_cooldown( var_0 );
    }
}

pap_portal_cooldown( var_0 )
{
    if ( scripts\engine\utility::_id_9CEE( var_0.in_cool_down ) )
        return;

    var_0.in_cool_down = 1;
    wait 31;
    var_0._id_4622 = 1;
    wait 60;
    var_0.in_cool_down = undefined;
    var_0._id_4622 = undefined;
}

_id_126BE( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 _id_0D15::_id_D728();
    var_0 notify( "delete_equipment" );
    var_0._id_5511 = 1;
    var_0 _id_0D44::_id_1794();
    var_1 = _id_BC83( var_0, "hidden_travel_tube_start", "hidden_travel_tube_end" );
    var_0 _id_11648();
    var_0 thread _id_0D44::_id_E0AE( 0.1 );
    wait 0.1;
    var_1 delete();
}

_id_11648()
{
    self endon( "left_hidden_room_early" );
    set_in_pap_room( self, 1 );
    _id_0A77::_id_17C0( "papRoom", 0.0, 0 );
    self._id_9C54 = 1;
    self._id_5511 = undefined;
    var_0 = scripts\engine\utility::_id_817E( "hidden_room_spot", "targetname" );
    self unlink();
    self dontinterpolate();
    _id_0D15::_id_D72E();
    self setorigin( var_0.origin );
    self setplayerangles( var_0.angles );
    self _meth_8447();
    thread _id_8E64();
    level notify( "hidden_room_portal_used" );
    scripts\cp\maps\cp_rave\cp_rave_interactions::update_rave_mode_for_player( self );
}

_id_C8A9()
{
    self endon( "disconnect" );

    if ( !isdefined( self._id_C8A8 ) )
    {
        self._id_C8A8 = 1;
        var_0 = 30;
        self setclientomnvar( "zombie_papTimer", var_0 );
        wait 1;

        for (;;)
        {
            var_0--;

            if ( var_0 < 0 )
            {
                var_0 = 30;
                wait 1;
                break;
            }

            self setclientomnvar( "zombie_papTimer", var_0 );
            wait 1;
        }

        self setclientomnvar( "zombie_papTimer", -1 );
        self notify( "kicked_out" );
        wait 30;
        self._id_C8A8 = undefined;
    }
}

_id_8E60( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 _meth_80F3();
    var_0 notify( "delete_equipment" );
    var_0 _id_0D44::_id_1794();
    var_1 = _id_BC83( var_0, "hidden_travel_tube_end", "hidden_travel_tube_start", 1 );
    _id_1164E( var_0 );
    var_0 thread _id_0D44::_id_E0AE( 0.1 );
    wait 0.1;
    var_1 delete();

    if ( scripts\engine\utility::_id_9CEE( var_0._id_13DB4 ) )
    {
        var_0 _id_0D12::_id_6978( 1 );
        var_0._id_13DB4 = 0;
    }

    var_0 _id_0A77::_id_E0E6( "papRoom", 0 );
    var_0._id_9C54 = undefined;
    var_0.kicked_out = undefined;
    var_0 set_in_pap_room( var_0, 0 );
    var_0 notify( "fast_travel_complete" );
    _id_0A6A::_id_E01F( "ww_pap_nag" );
    _id_0A6A::_id_E01F( "nag_find_pap" );
}

set_in_pap_room( var_0, var_1 )
{
    var_0.is_in_pap = var_1;
}

_id_1164E( var_0 )
{
    var_1 = scripts\engine\utility::_id_8180( scripts\engine\utility::_id_817E( "porta_effect_location", "targetname" )._id_0334, "targetname" );
    var_2 = undefined;

    while ( !isdefined( var_2 ) )
    {
        foreach ( var_4 in var_1 )
        {
            if ( !positionwouldtelefrag( var_4.origin ) )
                var_2 = var_4;
        }

        if ( !isdefined( var_2 ) )
        {
            var_6 = _id_0A77::_id_13192( anglestoforward( var_1[0].angles, 64 ) );
            var_2 = var_1[0].origin + var_6;
        }

        wait 0.1;
    }

    var_0 _meth_8447();
    var_0 unlink();
    var_0 dontinterpolate();
    var_0 setorigin( var_2.origin );
    var_0 setplayerangles( var_2.angles );
    var_0._id_5511 = undefined;
    var_0 _id_0D15::_id_D72E();
}

_id_8E64()
{
    self endon( "left_hidden_room_early" );
    self endon( "disconnect" );
    self endon( "last_stand" );
    self.kicked_out = undefined;

    if ( !scripts\engine\utility::_id_6E25( "pap_portal_used" ) )
        scripts\engine\utility::_id_6E3E( "pap_portal_used" );

    thread _id_C8A9();
    level thread pap_vo( self );
    self waittill( "kicked_out" );
    self.kicked_out = 1;
    level thread _id_8E60( self );
}

pap_vo( var_0 )
{
    if ( level._id_C8A3 != 1 )
        var_0 thread _id_0A6A::_id_12885( "pap_room_first", "rave_pap_vo" );

    level._id_C8A3 = 1;
    wait 4;
    var_0 thread _id_0A6A::_id_12885( "ww_pap_nag", "rave_pap_vo", "high", undefined, undefined, undefined, 1 );
}

_id_BC83( var_0, var_1, var_2, var_3 )
{
    var_0 _meth_844F( 0.3, 0.2, var_0.origin, 200 );
    var_4 = getent( var_1, "targetname" );
    var_5 = getent( var_2, "targetname" );
    var_0 _meth_805B();
    var_0._id_C004 = 1;
    var_0._id_C016 = 1;
    var_6 = var_4.origin + ( 0, 0, -45 );
    var_7 = var_5.origin + ( 0, 0, -45 );
    var_0._id_9BE1 = 1;
    var_0 _id_0A77::_id_17C0( "fast_travel", 0.0, 0 );
    var_0 _id_0A77::_id_1C5C( 1 );
    var_0 dontinterpolate();
    var_0 setorigin( var_6 );
    var_0 setplayerangles( var_4.angles );
    var_0 playlocalsound( "zmb_portal_travel_lr" );
    var_8 = spawn( "script_origin", var_6 );
    var_0 _meth_823A( var_8 );
    var_0 playerhide();
    wait 0.1;
    var_0 thread _id_0D44::_id_E0AE( 0.1 );
    var_8 moveto( var_7, 1 );
    wait 1;
    var_0._id_9BE1 = undefined;
    var_0 _id_0A77::_id_E0E6( "fast_travel", 0 );

    if ( var_0 _id_0A77::_id_9E3A() )
        var_0 _id_0A77::_id_1C5C( 0 );

    var_0._id_9BE1 = undefined;
    var_0._id_C004 = 0;
    var_0._id_C016 = 0;
    var_0 _id_0D44::_id_1794();
    return var_8;
}

_id_5591( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_0 _id_0A77::_id_1C5E( 0 );
    var_0 waittill( var_2 );
    wait( var_1 );

    if ( !var_0 _id_0A77::_id_9FA2() )
        var_0 _id_0A77::_id_1C5E( 1 );

    var_0 notify( "can_teleport" );
}

packboat_hint_func( var_0, var_1 )
{
    if ( level.boat_pieces_found < 3 )
        return "";
    else
        return &"CP_RAVE_USEBOAT";
}

_id_13000( var_0, var_1 )
{
    if ( level.boat_pieces_found < 3 )
        return;

    level _id_0A77::set_completed_quest_mark( 1 );
    level.boat_interaction_struct = var_0;
    level._id_2BFB _meth_8387( "tag_motor" );

    if ( scripts\engine\utility::_id_6E25( "survivor_released" ) )
    {
        if ( !all_players_near_boat( var_0 ) )
        {
            _id_0A59::_id_E019( var_0 );
            level.boat_survivor playsound( "ks_nag_needallplayers" );
            wait 5;
            _id_0A59::_id_175C( var_0 );
            return;
        }
        else
        {
            level.boat_survivor notify( "stop_boat_nag" );

            foreach ( var_3 in level.players )
                _id_AD0A( var_3, var_0 );
        }
    }
    else
    {
        if ( isdefined( level.start_boat_ride_func ) )
            var_0 thread [[ level.start_boat_ride_func ]]();

        var_1 playlocalsound( "scn_boatride_board" );
        level._id_2BFB thread setup_boat_sounds();
        _id_AD0A( var_1, var_0 );
    }

    if ( isdefined( level._id_2BF1 ) )
        return;

    if ( !scripts\engine\utility::_id_6E25( "survivor_released" ) )
    {
        level thread _id_C859();
        scripts\engine\utility::_id_6E4C( "packboat_started" );
    }

    _id_0A59::_id_E019( var_0 );
    _id_E21D( var_0 );

    if ( !isdefined( level._id_C85A ) )
    {
        if ( !scripts\engine\utility::_id_6E25( "survivor_released" ) )
            level._id_2BFB thread _id_C85B( var_0 );
        else
            level thread survivor_boat_ride();

        level._id_2BFB startpath();
        level._id_C85A = 1;
    }
    else if ( scripts\engine\utility::_id_6E25( "survivor_released" ) )
        level thread survivor_boat_ride();
    else
        level notify( "boat_used" );
}

setup_boat_sounds()
{
    if ( !isdefined( level._id_2BFB.sfx_front ) )
        level._id_2BFB.sfx_front = spawn( "script_model", level._id_2BFB.origin );

    if ( !isdefined( level._id_2BFB.sfx_rear ) )
        level._id_2BFB.sfx_rear = spawn( "script_model", level._id_2BFB.origin );

    wait 0.05;
    level._id_2BFB.sfx_front linkto( level._id_2BFB, "tag_body" );
    level._id_2BFB.sfx_rear linkto( level._id_2BFB, "tag_motor" );
    wait 0.05;
    level._id_2BFB.sfx_front playsound( "scn_boatride_startup" );
    level._id_2BFB.sfx_rear playsound( "scn_boatride_startup_lsrs" );
    wait 5.15;
    level._id_2BFB thread boatride_sfx();
}

all_players_near_boat( var_0 )
{
    var_1 = 19600;

    foreach ( var_3 in level.players )
    {
        if ( !var_3 _id_0A77::_id_9D05() )
            return 0;

        if ( distance2dsquared( var_3.origin, var_0.origin ) > var_1 )
            return 0;
    }

    return 1;
}

_id_E21D( var_0 )
{
    var_1 = scripts\engine\utility::_id_8180( var_0._id_0334, "targetname" );

    foreach ( var_3 in var_1 )
        var_3._id_AD26 = undefined;
}

_id_AD0A( var_0, var_1, var_2 )
{
    var_3 = scripts\engine\utility::_id_817E( "boat_player_" + level._id_2BFB._id_AD27.size, "script_noteworthy" );
    var_3._id_AD26 = var_0;

    if ( isdefined( var_2 ) )
    {
        var_3 = spawnstruct();
        var_3.origin = level._id_2BFB gettagorigin( var_2 );
        var_3.angles = level._id_2BFB gettagangles( var_2 );
    }

    level._id_2BFB._id_AD27[level._id_2BFB._id_AD27.size] = var_0;
    var_0 setorigin( var_3.origin );
    var_0 setplayerangles( var_3.angles );
    var_0 _meth_823A( level._id_2BFB, undefined, 1, 45, 45, 30, 30, 0 );
    var_0 _meth_8234();
    var_0._id_0184 = 1;

    if ( !isdefined( level._id_2BFB.first_player ) )
        level._id_2BFB.first_player = var_0;

    var_0 _meth_85B3( "seat", 1 );
    var_0 _meth_800A( 1 );
    var_0 _meth_8013( 0 );
    var_0 _meth_8010( 0 );
    var_0 _meth_8012( 0 );
    var_0._id_AD2B = 1;
    var_0._id_5511 = 1;
    var_0._id_9A45 = 1;
    var_0._id_3859 = 0;
    var_0 thread _id_2BF3( var_0 );
}

_id_C85B( var_0 )
{
    var_1 = getvehiclenode( level._id_2BFA._id_0334, "targetname" );

    for (;;)
    {
        var_1 waittill( "trigger" );

        if ( isdefined( var_1.script_noteworthy ) )
        {
            switch ( var_1.script_noteworthy )
            {
                case "island_stop":
                    _id_10FBA( "island_dropoff_player" );
                    break;
                case "pier_stop":
                    _id_10FBB( var_0 );
                    break;
                default:
                    break;
            }
        }

        if ( !isdefined( var_1._id_0334 ) )
            break;

        var_1 = getvehiclenode( var_1._id_0334, "targetname" );
    }
}

boatride_sfx()
{
    level endon( "boatride_over" );
    level endon( "gamed_ended" );

    if ( isdefined( level._id_2BFB.sfx_front ) )
    {
        level._id_2BFB.sfx_front playsoundonmovingent( "scn_boatride_01" );
        level._id_2BFB.sfx_rear playsoundonmovingent( "scn_boatride_01_lsrs" );
    }

    var_0 = getvehiclenode( level._id_2BFA._id_0334, "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger" );

        if ( isdefined( var_0.name ) )
        {
            switch ( var_0.name )
            {
                case "rave_boat_sound_2":
                    if ( isdefined( level._id_2BFB.sfx_front ) )
                    {
                        level._id_2BFB.sfx_front playsoundonmovingent( "scn_boatride_02" );
                        level._id_2BFB.sfx_rear playsoundonmovingent( "scn_boatride_02_lsrs" );
                    }

                    break;
                default:
                    break;
            }
        }

        if ( !isdefined( var_0._id_0334 ) )
            break;

        var_0 = getvehiclenode( var_0._id_0334, "targetname" );
    }
}

_id_10FBB( var_0 )
{
    level._id_2BFB _meth_83E6( 0, 1, 1 );
    _id_0A59::_id_175C( var_0 );

    if ( isdefined( level._id_2BFB.sfx_front ) )
        level._id_2BFB.sfx_front delete();

    if ( isdefined( level._id_2BFB.sfx_rear ) )
        level._id_2BFB.sfx_rear delete();

    level._id_2BFB._id_57F3 = 1;
    level waittill( "boat_used" );
    level._id_2BFB._id_57F3 = 0;
    level._id_2BFB _meth_8265( 3 );
}

_id_10FBA( var_0 )
{
    level._id_2BFB _meth_83E6( 0, 1, 1 );
    wait 1;

    foreach ( var_2 in level._id_2BFB._id_AD27 )
        level _id_5CFB( var_2, var_0 );

    if ( var_0 == "island_dropoff_player" )
    {
        if ( isdefined( level._id_2BFB.sfx_front ) )
        {
            level._id_2BFB.sfx_front playsoundonmovingent( "scn_boatride_03" );
            level._id_2BFB.sfx_rear playsoundonmovingent( "scn_boatride_03_lsrs" );
        }

        level._id_2BFB _meth_8265( 3 );
    }

    level._id_2BFB.first_player = undefined;
}

_id_5CFB( var_0, var_1 )
{
    var_0 unlink();
    var_2 = var_0 getentitynumber();
    var_3 = scripts\engine\utility::_id_8180( var_1, "targetname" );
    var_4 = undefined;

    foreach ( var_6 in var_3 )
    {
        if ( var_6._id_ED3C == var_2 )
            var_4 = var_6;
    }

    var_8 = getgroundposition( var_4.origin, 8, 32, 32 );

    if ( !isdefined( var_8 ) )
        var_8 = var_4.origin;

    var_0 setorigin( var_8 + ( 0, 0, 1 ) );
    var_0 setplayerangles( var_4.angles );
    var_0 _meth_8013( 1 );
    var_0 _meth_8010( 1 );
    var_0 _meth_800A( 1 );
    var_0 _meth_8012( 1 );
    var_0._id_0184 = 0;
    var_0._id_AD2B = undefined;
    var_0._id_5511 = undefined;
    var_0._id_9A45 = undefined;
    var_0 _meth_85B3( "seat", 0 );
    level._id_2BFB._id_AD27 = scripts\engine\utility::array_remove( level._id_2BFB._id_AD27, var_0 );
    var_0._id_3859 = 1;
    var_0 notify( "ride_over" );
    level notify( "boatride_over" );
}

_id_2BF3( var_0 )
{
    var_0 endon( "ride_over" );
    var_0 endon( "disconnect" );
    var_0 waittill( "last_stand" );
    var_0 unlink();
    var_1 = var_0 getentitynumber();
    var_2 = scripts\engine\utility::_id_8180( "packboat_player_exit", "targetname" );
    var_3 = undefined;

    foreach ( var_5 in var_2 )
    {
        if ( var_5._id_ED3C == var_1 )
            var_3 = var_5;
    }

    var_0 setorigin( var_3.origin );
    var_0 setplayerangles( var_3.angles );
    var_0 _meth_8013( 1 );
    var_0 _meth_8012( 1 );
    var_0._id_0184 = 0;
    var_0._id_AD2B = undefined;
    var_0._id_5511 = undefined;
    var_0._id_9A45 = undefined;
    level._id_2BFB._id_AD27 = scripts\engine\utility::array_remove( level._id_2BFB._id_AD27, var_0 );
    var_0._id_0184 = 0;
    var_0._id_3859 = 1;
    var_0 notify( "ride_over" );
}

_id_C859()
{
    level._id_2BF1 = 1;
    wait 5;
    scripts\engine\utility::_id_6E3E( "packboat_started" );
    wait 1;
    scripts\engine\utility::_id_6E2A( "packboat_started" );
    level._id_2BF1 = undefined;
}

_id_C8A5( var_0, var_1 )
{
    if ( level.pap_pieces_found < 2 )
        return "";

    if ( !scripts\engine\utility::_id_6E25( "pap_fixed" ) )
        return &"CP_RAVE_FIX_PAP";
    else
        return &"CP_RAVE_USE_PAP";
}

_id_6DFD( var_0, var_1 )
{
    if ( level.pap_pieces_found < 2 )
        return;

    if ( !scripts\engine\utility::_id_6E25( "pap_fixed" ) )
    {
        scripts\engine\utility::_id_6E3E( "pap_fixed" );
        var_2 = scripts\engine\utility::_id_8180( var_0.script_noteworthy, "script_noteworthy" );

        foreach ( var_4 in var_2 )
            _id_0A59::_id_E019( var_4 );

        level _id_0A77::set_completed_quest_mark( 3 );
        level.projector_struct setmodel( "cp_rave_projector_with_reels" );
        level thread play_pap_vo( var_1 );
        level thread activate_pap( var_0 );

        foreach ( var_7 in level.players )
            var_7 _id_0A59::_id_DE6E();
    }
}

play_pap_vo( var_0 )
{
    level endon( "gamed_ended" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 thread _id_0A6A::_id_12885( "ks_pap_restored", "rave_ks_vo" );
    wait 4.5;

    switch ( var_0._id_134FD )
    {
        case "p1_":
            var_0 thread _id_0A6A::_id_12885( "pap_chola_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
            level._id_4481["pap_chola_1"] = 1;
            break;
        case "p4_":
            var_0 thread _id_0A6A::_id_12885( "pap_hiphop_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
            level._id_4481["pap_hiphop_1"] = 1;
            break;
        case "p3_":
            var_0 thread _id_0A6A::_id_12885( "pap_rocker_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
            level._id_4481["pap_rocker_1"] = 1;
            break;
        case "p2_":
            var_0 thread _id_0A6A::_id_12885( "pap_raver_1", "rave_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
            level._id_4481["pap_raver_1"] = 1;
            break;
        default:
            break;
    }
}

_id_13F12( var_0 )
{

}

#using_animtree("mp_script_model");

spawn_survivor_on_boat()
{
    level endon( "stop_boat_idle_anims" );

    if ( isdefined( level.boat_survivor ) )
        return;

    if ( isdefined( level.boat_survivor_spawned ) )
        return;

    level.boat_survivor_spawned = 1;

    while ( !scripts\engine\utility::_id_9CEE( level._id_2BFB._id_57F3 ) )
        wait 0.25;

    var_0 = spawnstruct();
    var_0.origin = ( -3803.9, 1589.5, -159 );
    var_0.angles = ( 0, 292, 0 );
    var_1 = spawn( "script_model", var_0.origin );
    var_1.angles = var_0.angles;
    var_1 setmodel( "zmb_world_k_smith" );
    var_1 linkto( level._id_2BFB );
    level.boat_survivor = var_1;
    level.boat_survivor thread survivor_boat_nag();

    for (;;)
    {
        var_2 = getanimlength( %iw7_cp_survivor_boat_idle );
        level.boat_survivor scriptmodelplayanim( "IW7_cp_survivor_boat_idle", 1 );
        wait( var_2 );
    }
}

survivor_boat_nag()
{
    self endon( "stop_boat_nag" );

    for (;;)
    {
        level.boat_survivor playsound( "ks_nag_getonboat" );
        wait( randomintrange( 12, 20 ) );
    }
}

survivor_boat_filler()
{
    self endon( "stop_boat_filler" );
    wait 4;
    var_0 = [ "ks_examine_memento", "ks_examine_memento_2", "ks_examine_memento_3", "ks_examine_memento_4", "ks_examine_memento_5", "ks_examine_memento_6" ];
    var_1 = var_0;

    for (;;)
    {
        var_2 = scripts\engine\utility::_id_DC6B( var_1 );
        var_1 = scripts\engine\utility::array_remove( var_1, var_2 );

        if ( var_1.size < 1 )
            var_1 = var_0;

        level.boat_survivor playsoundonmovingent( var_2 );
        wait( randomintrange( 5, 9 ) );
    }
}

survivor_boat_ride()
{
    level thread scripts\cp\maps\cp_rave\cp_rave::hotjoin_on_boat();
    level._id_C9C1 = 1;
    level._id_2BFB _meth_8265( 3 );

    foreach ( var_1 in level.players )
        var_1 _id_0A77::_id_1C5E( 0 );

    level.no_slasher = 1;

    if ( isdefined( level.slasher ) )
        level.slasher suicide();

    level._id_2BFB thread survivor_boat_ride_sfx();
    wait 1;
    level._id_2BFB.first_player _id_0A6A::_id_12885( "memento_6", "rave_comment_vo", "highest" );
    level.boat_survivor thread survivor_boat_filler();
    wait 15;
    level notify( "stop_boat_idle_anims" );
    var_3 = getanimlength( %iw7_cp_survivor_boat_idle );
    level.boat_survivor scriptmodelplayanim( "IW7_cp_survivor_boat_idle", 1 );
    wait( var_3 - 4.5 );
    level._id_2BFB vehicle_setspeed( 0, 5 );
    level.boat_survivor notify( "stop_boat_filler" );
    wait 4.25;
    level.boat_survivor unlink();
    level thread ksmith_boat_vo();
    level.boat_survivor _meth_8515( "IW7_cp_survivor_boat_fall", level.boat_survivor.origin, level.boat_survivor.angles, 1 );
    level.boat_survivor playsound( "scn_slashride_survivor_fall" );
    var_3 = getanimlength( %iw7_cp_survivor_boat_fall );
    wait( var_3 - 3.25 );
    level.boat_survivor playsound( "scn_slashride_survivor_splash" );
    playfx( level._effect["boat_fall_splash"], level.boat_survivor.origin );

    foreach ( var_1 in level.players )
        var_1 playlocalsound( "scn_slashride_03" );

    wait 1.25;

    foreach ( var_1 in level.players )
        var_1 playlocalsound( "scn_slashride_slasher_water" );

    wait 1;
    level thread super_slasher_intro();
    level waittill( "start_fadeout" );
    wait 1;
    level.boat_survivor delete();
}

survivor_boat_ride_music_01()
{
    foreach ( var_1 in level.players )
        var_1 playlocalsound( "mus_zmb_rave_slasher_boat_01" );
}

survivor_boat_ride_music_02()
{
    foreach ( var_1 in level.players )
        var_1 playlocalsound( "mus_zmb_rave_slasher_boat_02" );
}

survivor_boat_ride_sfx()
{
    level endon( "boatride_over" );
    level endon( "gamed_ended" );

    foreach ( var_1 in level.players )
        var_1 playlocalsound( "scn_slashride_01" );

    var_3 = getvehiclenode( level._id_2BFA._id_0334, "targetname" );

    for (;;)
    {
        var_3 waittill( "trigger" );

        if ( isdefined( var_3.name ) )
        {
            switch ( var_3.name )
            {
                case "slasher_boat_sound_2":
                    foreach ( var_1 in level.players )
                        var_1 playlocalsound( "scn_slashride_02" );

                    break;
                default:
                    break;
            }
        }

        if ( !isdefined( var_3._id_0334 ) )
            break;

        var_3 = getvehiclenode( var_3._id_0334, "targetname" );
    }
}

ksmith_boat_vo()
{
    level thread survivor_boat_ride_music_01();
    level.boat_survivor playsound( "ks_memento_quest_3" );
    var_0 = lookupsoundlength( "ks_memento_quest_3" );
    wait( var_0 / 1000 + 1.25 );
    level thread survivor_boat_ride_music_02();
    level.boat_survivor playsound( "ks_mement_boat_effort" );
}

super_slasher_intro()
{
    playfx( level._effect["vfx_ss_reveal_buildup"], ( -3161, 3791, -244 ) );
    earthquake( 0.3, 5, level._id_2BFB.origin, 350 );
    wait 2;
    earthquake( 0.45, 10, level._id_2BFB.origin, 350 );
    var_0 = spawn( "script_model", ( -3201, 3811, -328 ) );
    var_0.angles = ( 0, 0, 0 );
    var_0 setmodel( "fullbody_zmb_superslasher" );
    var_0 _meth_8515( "IW7_cp_super_taunt_intro", ( -3201, 3811, -328 ), ( 0, 0, 0 ), 1 );
    var_0 playsound( "zmb_vo_supslasher_water_emerge_lr" );
    var_0 thread slasher_intro_fx();
    level thread shellshock_players( 6 );
    level _id_0A77::set_completed_quest_mark( 4 );
    wait 6.25;
    level notify( "start_fadeout" );
    scripts\engine\utility::_id_6E3E( "survivor_got_to_island" );
    wait 0.25;
    earthquake( 0.9, 3, level._id_2BFB.origin, 350 );
    var_0 playsound( "zmb_vo_supslasher_attack_ground_pound" );
    level thread shellshock_players( 4 );
    wait 1;
    var_0 delete();
}

shellshock_players( var_0 )
{
    foreach ( var_2 in level.players )
    {
        var_2 shellshock( "default_nosound", var_0 );
        var_2 thread water_fx();
    }
}

slasher_intro_fx()
{
    wait 0.2;
    playfx( level._effect["vfx_ss_reveal"], ( self.origin[0] + 40, self.origin[1] - 20, -244 ) );
    wait 0.5;
    playfxontag( level._effect["vfx_ss_reveal_arms"], self, "j_elbow_le" );
    wait 0.05;
    playfxontag( level._effect["vfx_ss_reveal_arms"], self, "j_elbow_ri" );
}

water_fx()
{
    self endon( "disconnect" );
    playfxontag( level._effect["geyser_fullscreen_fx"], self, "tag_eye" );
    scripts\engine\utility::waitframe();
    playfxontag( level._effect["geyser_fullscreen_fx"], self, "tag_eye" );
    scripts\engine\utility::waitframe();
    playfxontag( level._effect["geyser_fullscreen_fx"], self, "tag_eye" );
}

fade_screen_after_ss_intro()
{
    foreach ( var_1 in level.players )
        var_1 thread ss_intro_black_screen();

    wait 1;
}

move_players_to_shore()
{
    foreach ( var_1 in level.players )
        var_1 thread move_player_to_shore( var_1, "island_dropoff_player" );
}

fade_in_for_ss_fight()
{
    scripts\engine\utility::_id_6E3E( "survivor_got_to_island" );
}

move_player_to_shore( var_0, var_1 )
{
    var_0 unlink();
    var_2 = var_0 getentitynumber();
    var_3 = scripts\engine\utility::_id_8180( var_1, "targetname" );
    var_4 = undefined;

    foreach ( var_6 in var_3 )
    {
        if ( var_6._id_ED3C == var_2 )
            var_4 = var_6;
    }

    var_0 setorigin( var_4.origin );
    var_0 setplayerangles( var_4.angles );
    var_0 _meth_8013( 1 );
    var_0 _meth_8010( 1 );
    var_0 _meth_8012( 1 );
    var_0._id_AD2B = undefined;
    var_0._id_5511 = undefined;
    var_0._id_9A45 = undefined;
    var_0 _meth_85B3( "seat", 0 );
    level._id_2BFB._id_AD27 = scripts\engine\utility::array_remove( level._id_2BFB._id_AD27, var_0 );
    var_0._id_3859 = 1;
    var_0._id_0184 = 0;
    var_0 notify( "ride_over" );
}

ss_intro_black_screen()
{
    self endon( "disconnect" );
    self setclientomnvar( "ui_hide_hud", 1 );
    self _meth_80AA();
    self.ss_intro_overlay = newclienthudelem( self );
    self.ss_intro_overlay.x = 0;
    self.ss_intro_overlay.y = 0;
    self.ss_intro_overlay setshader( "black", 640, 480 );
    self.ss_intro_overlay._id_002B = "left";
    self.ss_intro_overlay._id_002C = "top";
    self.ss_intro_overlay._id_02A4 = 1;
    self.ss_intro_overlay._id_017D = "fullscreen";
    self.ss_intro_overlay._id_0382 = "fullscreen";
    self.ss_intro_overlay._id_0142 = 1;
    self.ss_intro_overlay.alpha = 0;
    self.ss_intro_overlay fadeovertime( 1 );
    self.ss_intro_overlay.alpha = 1;
    level waittill( "ss_intro_finished" );
    self.ss_intro_overlay fadeovertime( 5 );
    self.ss_intro_overlay.alpha = 0;
    self setclientomnvar( "ui_hide_hud", 0 );
    wait 5;
    self.ss_intro_overlay destroy();
    wait 1.5;
    self enableweapons();
    wait 3;
    level notify( "ww_slasher_intro" );
}
