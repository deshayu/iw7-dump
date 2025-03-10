// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_6B8F()
{
    scripts\engine\utility::_id_6E39( "fast_travel_init_done" );
    level._id_62ED = "main_street";
    level._id_8E63 = 0;
    _id_95D9();
    level._id_6B90 = [];
    level._id_6B91 = [];
    var_0 = scripts\engine\utility::_id_8180( "fast_travel", "script_noteworthy" );
    level._id_5592 = ::_id_5591;
    level._id_6B8D = ::_id_126BF;
    level._id_D679 = ( 646.605, 701.459, 105.882 );

    foreach ( var_2 in var_0 )
    {
        level._id_6B91[level._id_6B91.size] = var_2;
        var_2 _id_95DA();
    }

    scripts\engine\utility::_id_6E3E( "fast_travel_init_done" );
    level thread _id_8E62();
    level thread _id_B23A();
    level thread _id_172F();
    level thread _id_172E();
    scripts\engine\utility::_id_6E39( "disable_portals" );
    scripts\engine\utility::_id_6E39( "pap_portal_used" );
}

_id_95D9()
{
    level._effect["hidden_room_portal_locked"] = loadfx( "vfx/iw7/_requests/coop/vfx_cp_z_portal_01_idle.vfx" );
    level._effect["hidden_room_portal_locked_exit"] = loadfx( "vfx/iw7/_requests/coop/vfx_cp_z_portal_01_out.vfx" );
    level._effect["hidden_room_portal_locked_charging"] = loadfx( "vfx/iw7/levels/cp_zmb/vfx_cp_z_portal_01.vfx" );
    level._effect["hidden_room_portal"] = loadfx( "vfx/iw7/core/impact/energy_sm/vfx_cp_z_portal_02.vfx" );
}

_id_95DA()
{
    level endon( "game_ended" );
    var_0 = getentarray( "portal_center", "targetname" );
    var_1 = level._id_62ED == self._id_ECFA;

    if ( !var_1 )
    {
        var_0 = scripts\engine\utility::_id_782F( self.origin, var_0 );
        self._id_D682 = var_0[0];
        _id_F4AA();
    }
    else
    {
        var_0 = scripts\engine\utility::_id_782F( self.origin, var_0 );
        self._id_D682 = var_0[0];
        _id_F4AA();
    }

    self._id_62EF = scripts\engine\utility::_id_8180( self._id_0334, "targetname" );
    level._id_6B90[self._id_ECFA] = self;
    var_2 = getentarray( "portal_trigger", "targetname" );
    var_2 = scripts\engine\utility::_id_782F( self.origin, var_2 );
    self._id_D680 = var_2[0];
    self._id_D674 = 0;
    thread _id_D681();
    var_3 = getentarray( self._id_0334, "targetname" );
    var_3 = scripts\engine\utility::_id_782F( self.origin, var_3 );
    self._id_01B9 = var_3[0];

    if ( isdefined( self._id_01B9 ) )
        self._id_01B9 setlightintensity( 0 );

    self._id_D776 = 0;
    self._id_D674 = 0;
    self._id_D67E = 0;
    self._id_D677 = 0;
    thread _id_8947( var_1 );
}

_id_8947( var_0 )
{
    var_1 = self._id_ECFA;

    if ( var_1 == "moon" )
    {
        var_2 = getentarray( "rangetarget", "targetname" );

        foreach ( var_4 in var_2 )
            var_4 hide();
    }

    if ( var_0 )
    {
        for (;;)
        {
            var_6 = level scripts\engine\utility::_id_13734( "power_on", self._id_D71C + " power_on", "portal_on", "power_off" );

            if ( var_6 != "power_off" )
            {
                self._id_D776 = 1;
                self._id_D674 = 1;
                _id_1297F( 0 );
                getent( "center_portal", "targetname" ) setscriptablepartstate( "model", "on" );
            }
            else
            {
                self._id_D776 = 0;
                _id_1297F( 0 );
            }

            wait 0.25;
        }
    }
    else
    {
        for (;;)
        {
            var_6 = level scripts\engine\utility::_id_13734( "power_on", self._id_D71C + " power_on", "power_off" );

            if ( scripts\engine\utility::_id_6E25( "disable_portals" ) )
                continue;

            if ( var_6 != "power_off" )
            {
                if ( _id_0A77::map_check( 0 ) )
                    level thread _id_0A6A::_id_1769( "dj_portal_use_nag", "zmb_dj_vo", 60, 15, 2, 1 );

                _id_0A6A::_id_12886( "nag_use_portal", 1 );

                switch ( var_1 )
                {
                    default:
                        self._id_D776 = 1;
                        self._id_D674 = 1;
                        self._id_D67E = 0;
                        self._id_D677 = 0;

                        if ( isdefined( self._id_01B9 ) )
                            self._id_01B9 setlightintensity( 1 );

                        _id_F556();
                        level notify( "portal_on" );
                }
            }
            else
            {
                self._id_D776 = 0;

                if ( isdefined( self._id_D682 ) )
                {
                    self._id_D682 stoploopsound();
                    _id_F4AA();
                }

                if ( isdefined( self._id_01B9 ) )
                    self._id_01B9 setlightintensity( 0 );
            }

            wait 0.25;
        }
    }
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

_id_172F()
{
    var_0 = getent( "fast_travel_tube_start", "targetname" );
    var_1 = anglestoforward( var_0.angles );
    var_2 = spawnfx( level._effect["vfx_zmb_portal_base_01"], var_0.origin + ( 0, 0, 15 ), var_1 );
    triggerfx( var_2 );
    var_0 = getent( "fast_travel_tube_end", "targetname" );
    var_1 = anglestoforward( var_0.angles );
    var_2 = spawnfx( level._effect["vfx_zmb_portal_centhub"], var_0.origin + ( 0, 0, 15 ), var_1 );
    triggerfx( var_2 );
}

_id_172E()
{
    var_0 = getent( "hidden_travel_tube_start", "targetname" );
    var_1 = anglestoforward( var_0.angles );
    var_2 = spawnfx( level._effect["vfx_zmb_portal_centhub"], var_0.origin + ( 0, 0, 15 ), var_1 );
    triggerfx( var_2 );
    var_0 = getent( "hidden_travel_tube_end", "targetname" );
    var_1 = anglestoforward( var_0.angles + ( 0, 180, 0 ) );
    var_2 = spawnfx( level._effect["hidden_room_portal"], var_0.origin + ( 0, 0, 15 ), var_1 );
    triggerfx( var_2 );
}

_id_6B8E( var_0, var_1 )
{
    if ( scripts\engine\utility::_id_6E25( "disable_portals" ) )
        return "";

    if ( var_0._id_E1B9 && !var_0._id_D776 )
        return &"COOP_INTERACTIONS_REQUIRES_POWER";

    if ( var_0._id_ECFA == level._id_62ED )
    {
        if ( scripts\engine\utility::_id_9CEE( level._id_8E61 ) )
            return &"CP_ZMB_INTERACTIONS_HIDDEN_TELEPORT";
        else if ( level._id_8E63 )
            return &"COOP_INTERACTIONS_COOLDOWN";
        else
            return &"CP_ZMB_INTERACTIONS_EXIT_PORTAL";
    }

    if ( !scripts\engine\utility::_id_9CEE( var_0._id_D674 ) )
    {
        if ( var_0._id_D67E )
            return &"COOP_INTERACTIONS_COOLDOWN";
        else
            return "";
    }

    return level._id_9A12[var_0.script_noteworthy];
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

_id_E7F4( var_0, var_1 )
{
    if ( scripts\engine\utility::_id_6E25( "disable_portals" ) )
        return;

    if ( !var_1 _id_0A77::_id_9FA2() )
        var_1 _id_0A59::_id_DE6E();
    else
    {
        if ( !scripts\engine\utility::_id_9CEE( var_0._id_D674 ) )
            return;

        var_2 = 0.5;

        if ( var_0._id_ECFA != level._id_62ED )
        {
            if ( scripts\engine\utility::_id_6E25( "disable_portals" ) )
            {
                var_1 _id_0A59::_id_DE6E();
                return;
            }

            var_3 = 0;

            if ( var_1 _id_0A63::_id_D0BB( var_3 ) )
            {
                var_1 _id_0A59::_id_11449( var_3, "fast_travel" );
                var_0 thread _id_6B8B();
                return;
            }

            var_1 thread _id_0A6A::_id_12885( "no_cash", "zmb_comment_vo", "high", 30, 0, 0, 1, 50 );
            var_1 _id_0A59::_id_9A3C( var_0, &"COOP_INTERACTIONS_NEED_MONEY" );
            var_1 _id_0A59::_id_DE6E();
            return;
            return;
            return;
        }

        if ( scripts\engine\utility::_id_9CEE( level._id_8E61 ) )
        {
            var_1 thread _id_5591( var_1, var_2, "fast_travel_complete" );
            var_0 thread _id_126BE( var_1 );
        }
    }
}

_id_6AF8( var_0 )
{
    self._id_13DB4 = 1;
    _id_0D12::_id_6626( 1, var_0 );
    wait( var_0 );

    if ( scripts\engine\utility::_id_9CEE( self._id_13DB4 ) )
    {
        _id_0D12::_id_6978( 1 );
        self._id_13DB4 = 0;
    }
}

_id_126BF( var_0, var_1 )
{
    var_0 _id_0D15::_id_D728();
    var_0._id_5511 = 1;
    var_0 _id_0D44::_id_1794();
    var_2 = _id_BC83( var_0, "fast_travel_tube_start", "fast_travel_tube_end", var_1 );
    level._id_6B90[level._id_62ED] _id_1164E( var_0 );
    var_0 thread _id_0D44::_id_E0AE( 0.1 );
    var_3 = ( 646.605, 701.459, 105.882 );
    var_4 = anglestoforward( ( 0, 90, 0 ) );
    playfx( level._effect["vfx_zmb_portal_exit_burst"], var_3, var_4 );
    wait 0.1;
    var_2 delete();

    if ( !isdefined( var_1 ) )
    {
        if ( !scripts\engine\utility::_id_9CEE( self._id_13068 ) )
        {
            self._id_13068 = 1;
            var_5 = 0;
            var_6 = self._id_ECFA;

            switch ( var_6 )
            {
                case "moon":
                    var_5 = 1;
                    break;
                case "europa":
                    var_5 = 2;
                    break;
                case "mars":
                    var_5 = 3;
                    break;
                case "arcade":
                    var_5 = 0;
                    break;
                default:
                    var_5 = 0;
                    break;
            }

            level notify( "turn_on_portal_light", int( var_5 ) );

            if ( _id_1BF8() )
                level.last_portal_opener = var_0;
        }
    }

    var_0 notify( "fast_travel_complete" );
}

_id_CE6F( var_0, var_1 )
{
    if ( !isdefined( level._id_12913 ) )
        level._id_12913 = 1;

    if ( scripts\engine\utility::_id_9CEE( var_0._id_13068 ) )
        return;

    if ( scripts\engine\utility::_id_9CEE( var_1 ) )
        return;

    switch ( level._id_12913 )
    {
        case 1:
            self playlocalsound( "announcer_portal_1of4" );
            break;
        case 2:
            self playlocalsound( "announcer_portal_2of4" );
            break;
        case 3:
            self playlocalsound( "announcer_portal_3of4" );
            break;
        case 4:
            level notify( "pap_portal_unlocked" );
            self playlocalsound( "announcer_portal_4of4" );
            break;
        default:
            break;
    }

    level._id_12913++;
}

_id_126BE( var_0 )
{
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

_id_8E60( var_0 )
{
    var_0 _meth_80F3();
    var_0 notify( "delete_equipment" );
    var_0 _id_0D44::_id_1794();
    var_1 = _id_BC83( var_0, "hidden_travel_tube_end", "hidden_travel_tube_start", 1 );
    level._id_6B90[level._id_62ED] _id_1164E( var_0 );
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

is_in_pap_room( var_0 )
{
    return scripts\engine\utility::_id_9CEE( self.is_in_pap );
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

_id_B23A()
{
    var_0 = 0;

    for ( var_1 = getent( "center_portal", "targetname" ); var_0 < 4; var_0++ )
    {
        level waittill( "turn_on_portal_light", var_2 );
        var_3 = undefined;

        switch ( var_2 )
        {
            case 0:
                var_1 setscriptablepartstate( "light2", "show" );
                break;
            case 1:
                var_1 setscriptablepartstate( "light1", "show" );
                break;
            case 2:
                var_1 setscriptablepartstate( "light3", "show" );
                break;
            case 3:
                var_1 setscriptablepartstate( "light4", "show" );
                break;
        }
    }
}

_id_1164E( var_0 )
{
    var_1 = undefined;

    while ( !isdefined( var_1 ) )
    {
        foreach ( var_3 in self._id_62EF )
        {
            if ( !positionwouldtelefrag( var_3.origin ) )
                var_1 = var_3;
        }

        if ( !isdefined( var_1 ) )
        {
            var_5 = _id_0A77::_id_13192( anglestoforward( self._id_62EF[0].angles, 64 ) );
            var_1 = self._id_62EF[0].origin + var_5;
        }

        wait 0.1;
    }

    var_0 _meth_8447();
    var_0 unlink();
    var_0 dontinterpolate();
    var_0 setorigin( var_1.origin );
    var_0 setplayerangles( var_1.angles );
    var_0._id_5511 = undefined;
    var_0 _id_0D15::_id_D72E();
    var_0 thread _id_0A6A::_id_12885( "portal_exit", "zmb_comment_vo" );
}

_id_1BF8()
{
    if ( getdvarint( "debug_teleport_quest_done", 0 ) == 1 )
        return 1;

    foreach ( var_1 in level._id_6B90 )
    {
        if ( var_1._id_ECFA == level._id_62ED )
            continue;

        if ( !scripts\engine\utility::_id_9CEE( var_1._id_13068 ) )
            return 0;
    }

    return 1;
}

_id_8E62()
{
    for (;;)
    {
        if ( _id_1BF8() )
            break;

        wait 0.1;
    }

    if ( isdefined( level.last_portal_opener ) )
    {
        if ( isdefined( level.last_portal_opener._id_134FD ) )
        {
            switch ( level.last_portal_opener._id_134FD )
            {
                case "p1_":
                    level thread _id_0A6A::_id_12885( "portal_pap_valleygirl_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                    break;
                case "p2_":
                    level thread _id_0A6A::_id_12885( "portal_pap_nerd_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                    break;
                case "p3_":
                    level thread _id_0A6A::_id_12885( "portal_pap_rapper_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                    break;
                case "p4_":
                    level thread _id_0A6A::_id_12885( "portal_pap_jock_1", "zmb_dialogue_vo", "highest", 666, 0, 0, 0, 100 );
                    break;
                default:
                    break;
            }
        }
    }

    foreach ( var_1 in level.players )
        var_1 thread _id_0A6A::_id_1769( "nag_find_pap", "zmb_comment_vo", 60, 15, 6, 1 );

    level thread _id_0A6A::_id_1769( "dj_quest_ufo_pap1_nag", "zmb_dj_vo", 120, 100, 2, 1 );
    _id_15B6();
}

_id_15B6()
{
    level endon( "game_ended" );
    level thread _id_1298D();

    for (;;)
    {
        level._id_8E61 = 1;
        _id_1297F( 1 );
        level waittill( "hidden_room_portal_used" );

        if ( scripts\engine\utility::_id_9CEE( level._id_C617 ) )
            continue;

        wait 30;
        level._id_8E61 = 0;
        level._id_8E63 = 1;
        level notify( "hidden_room_portal_cooldown_start" );
        _id_1297F( 0 );
        wait 60;
        level._id_8E63 = 1;
        level notify( "hidden_room_portal_cooldown_over" );
    }
}

_id_1297F( var_0 )
{
    if ( var_0 )
        getent( "center_portal", "targetname" ) setscriptablepartstate( "portal", "active" );
    else
        getent( "center_portal", "targetname" ) setscriptablepartstate( "portal", "powered_on" );
}

_id_1298D()
{
    var_0 = getent( "hidden_room_portal", "targetname" );
    var_1 = anglestoforward( var_0.angles );
    var_2 = spawnfx( level._effect["vfx_zmb_portal_centhub"], var_0.origin, var_1 );
    triggerfx( var_2 );
    _id_11627( var_0 );
}

_id_11627( var_0 )
{
    var_0 makeusable();
    var_0 sethintstring( &"CP_ZMB_INTERACTIONS_HIDDEN_LEAVE" );
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
    level notify( "hidden_room_portal_used" );
    thread _id_8E64();
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
        var_0 thread _id_0A6A::_id_12885( "pap_room_first", "zmb_pap_vo" );

    level._id_C8A3 = 1;
    wait 4;
    var_0 thread _id_0A6A::_id_12885( "ww_pap_nag", "zmb_pap_vo", "high", undefined, undefined, undefined, 1 );
}

_id_6B8B()
{
    self._id_D674 = 0;
    self._id_D682.angles = self._id_D682.angles + ( 0, 180, 0 );
    self._id_D677 = 1;
    _id_F2FE();
    wait 3;
    self._id_D677 = 0;
    self._id_D67A = 1;
    _id_F28A();
    wait 15;
    self._id_D67A = 0;
    _id_F30B();
    self._id_D682.angles = self._id_D682.angles - ( 0, 180, 0 );
    self._id_D682 stoploopsound();
    self._id_01B9 setlightintensity( 0 );
    self._id_D67E = 1;
    wait 30;
    self._id_D674 = 1;
    self._id_D67E = 0;
    _id_DE70();
    self._id_01B9 setlightintensity( 10 );
    _id_F556();
}

_id_DE70()
{
    foreach ( var_1 in level.players )
    {
        if ( isdefined( var_1._id_A8D3 ) && var_1._id_A8D3 == self )
            var_1 _id_0A59::_id_DE6E();
    }
}

_id_D678()
{
    if ( isdefined( self._id_D67C ) )
        self._id_D67C delete();
}

_id_D681()
{
    level endon( "game_ended" );

    if ( !isdefined( self._id_D680 ) )
        return;

    self._id_D67A = 0;
    var_0 = 0.5;

    for (;;)
    {
        self._id_D680 waittill( "trigger", var_1 );

        if ( scripts\engine\utility::_id_6E25( "disable_portals" ) )
        {
            wait 0.05;
            continue;
        }

        if ( isplayer( var_1 ) && self._id_D67A )
        {
            if ( _id_0A5B::_id_D0EF( var_1 ) )
            {
                wait 0.05;
                continue;
            }

            _id_0D45::_id_AF85( level._id_13BD3, self._id_ECFA );

            if ( scripts\engine\utility::_id_9CEE( level._id_13DB5 ) )
            {
                var_1 thread _id_5591( var_1, var_0, "fast_travel_complete" );
                var_1 thread _id_6AF8( 30 );
                level notify( "player_entering_wor_changed_portal", var_1 );
                thread _id_126BE( var_1 );
            }
            else
            {
                var_1 thread _id_5591( var_1, var_0, "fast_travel_complete" );
                thread _id_126BF( var_1 );
            }
        }

        wait 0.1;
    }
}

_id_F556()
{
    self._id_D682 setscriptablepartstate( "portal", "powered_on" );
}

_id_F2FE()
{
    self._id_D682 setscriptablepartstate( "portal", "charging" );
}

_id_F4AA()
{
    self._id_D682 setscriptablepartstate( "portal", "off" );
}

_id_F28A()
{
    self._id_D682 setscriptablepartstate( "portal", "active" );
}

_id_F30B()
{
    self._id_D682 setscriptablepartstate( "portal", "off" );
}
