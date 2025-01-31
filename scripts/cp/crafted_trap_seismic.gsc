// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level.seismic_trap_settings = [];
    var_0 = spawnstruct();
    var_0._id_039B = "zmb_robotprojectile_mp";
    var_0._id_B91A = "cp_town_seismic_wave_device";
    var_0._id_B924 = "cp_town_seismic_wave_device_good";
    var_0._id_B925 = "cp_town_seismic_wave_device_bad";
    var_0._id_017B = &"COOP_CRAFTABLES_PICKUP";
    var_0._id_CC28 = &"COOP_CRAFTABLES_PLACE";
    var_0._id_38E3 = &"COOP_CRAFTABLES_CANNOT_PLACE";
    var_0._id_CC0A = &"COOP_CRAFTABLES_PLACE_CANCELABLE";
    var_0._id_AC71 = 45.0;
    var_0._id_CC22 = 30.0;
    var_0._id_CC25 = 24.0;
    var_0._id_3AA7 = ( 0, 0, 0 );
    var_0._id_3AA6 = ( 0, 0, 0 );
    level.seismic_trap_settings["crafted_seismic"] = var_0;
}

give_crafted_seismic_trap( var_0, var_1 )
{
    var_1 thread _id_13932();
    var_1 notify( "new_power", "crafted_seismic" );
    var_1 setclientomnvar( "zom_crafted_weapon", 17 );
    _id_0A77::_id_F313( "crafted_seismic", ::give_crafted_seismic_trap, var_1 );
}

_id_13932()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "craft_dpad_watcher" );
    self endon( "craft_dpad_watcher" );
    self notifyonplayercommand( "pullout_ims", "+actionslot 3" );

    for (;;)
    {
        self waittill( "pullout_ims" );

        if ( scripts\engine\utility::_id_9CEE( self._id_9D81 ) )
            continue;

        if ( scripts\engine\utility::_id_9CEE( self._id_AD2C ) )
            continue;

        if ( isdefined( self.allow_carry ) && self.allow_carry == 0 )
            continue;

        if ( _id_0A77::_id_9D05() )
            break;
    }

    thread give_seismic_trap( "crafted_seismic" );
}

give_seismic_trap( var_0 )
{
    self endon( "disconnect" );
    _id_0A77::_id_41C4( "msg_power_hint" );
    var_1 = create_seismic_trap_for_player( var_0, self );
    self._id_A039 = var_1.name;
    _id_0A77::_id_E077();
    self.carried_seismic_trap = var_1;
    var_1._id_6DEC = 1;
    var_2 = set_carrying_seismic( var_1, 1 );
    self.carried_seismic_trap = undefined;
    thread _id_0A77::_id_E2CC();
    return var_2;
}

set_carrying_seismic( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    var_0 thread seismic_trap_setcarried( self );
    scripts\engine\utility::_id_1C71( 0 );
    self notifyonplayercommand( "place_ims", "+attack" );
    self notifyonplayercommand( "place_ims", "+attack_akimbo_accessible" );
    self notifyonplayercommand( "cancel_ims", "+actionslot 3" );

    if ( !level._id_4542 )
    {
        self notifyonplayercommand( "cancel_ims", "+actionslot 5" );
        self notifyonplayercommand( "cancel_ims", "+actionslot 6" );
        self notifyonplayercommand( "cancel_ims", "+actionslot 7" );
    }

    for (;;)
    {
        var_3 = scripts\engine\utility::_id_13734( "place_ims", "cancel_ims", "force_cancel_placement", "player_action_slot_restart" );

        if ( !isdefined( var_3 ) )
            var_3 = "force_cancel_placement";

        if ( var_3 == "cancel_ims" || var_3 == "force_cancel_placement" || var_3 == "player_action_slot_restart" )
        {
            if ( !var_1 && var_3 == "cancel_ims" )
                continue;

            var_0 seismic_trap_setcancelled( var_3 == "force_cancel_placement" && !isdefined( var_0._id_6DEC ) );

            if ( var_3 != "force_cancel_placement" )
                thread _id_13932();
            else if ( var_1 )
                _id_0A77::_id_DFE0( self );

            return 0;
        }

        if ( !var_0._id_3872 )
            continue;

        if ( var_1 )
            _id_0A77::_id_DFE0( self );

        var_0 thread seismic_trap_setplaced( var_2 );
        self notify( "IMS_placed" );
        scripts\engine\utility::delaythread( 0.5, scripts\engine\utility::_id_1C71, 1 );
        return 1;
    }
}

create_seismic_trap_for_player( var_0, var_1 )
{
    if ( isdefined( var_1._id_9D81 ) && var_1._id_9D81 )
        return;

    var_2 = spawnturret( "misc_turret", var_1.origin + ( 0, 0, 25 ), "sentry_minigun_mp" );
    var_2.angles = var_1.angles;
    var_2.seismic_trap_type = var_0;
    var_2.owner = var_1;
    var_2.name = "crafted_seismic";
    var_2.carried_seismic_trap = spawn( "script_model", var_2.origin );
    var_2.carried_seismic_trap.angles = var_1.angles;
    var_2 maketurretinoperable();
    var_2 _meth_835B( 1 );
    var_2 _meth_830F( "sentry_offline" );
    var_2 makeunusable();
    var_2 _meth_8336( var_1 );
    return var_2;
}

create_seismic_trap( var_0, var_1 )
{
    var_2 = var_0.owner;
    var_3 = var_0.seismic_trap_type;
    var_4 = spawn( "script_model", var_0.origin + ( 0, 0, 2 ) );
    var_4 setmodel( level.seismic_trap_settings[var_3]._id_B91A );
    var_4._id_EB9C = 3;
    var_4.angles = ( 0, var_0.carried_seismic_trap.angles[1], 0 );
    var_4.seismic_trap_type = var_3;
    var_4.owner = var_2;
    var_4 _meth_831F( var_2 );
    var_4.team = var_2.team;
    var_4.name = "crafted_seismic";
    var_4._id_10085 = 0;
    var_4._id_8E5A = 0;
    var_4._id_451C = level.seismic_trap_settings[var_3];
    var_4 thread seismic_trap_handleuse();

    if ( isdefined( var_1 ) )
        var_4 thread _id_0A77::_id_A030( var_1 );
    else
        var_4 thread _id_0A77::_id_A030( undefined, level.seismic_trap_settings[self.seismic_trap_type]._id_AC71 );

    return var_4;
}

_id_936D( var_0 )
{
    self._id_933C = 1;
    self notify( "death" );
}

_id_9367( var_0 )
{
    self endon( "carried" );
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    seismic_trap_setinactive();

    if ( isdefined( self._id_9B05 ) )
    {
        self._id_9B05 _id_0A77::_id_E2CC();
        self notify( "deleting" );
        wait 1.0;
    }

    _id_66A7();
    self delete();
}

_id_66A7()
{
    self playsound( "trap_boom_box_explode" );
    playfx( level._effect["violet_light_explode"], self.origin );
    wait 0.1;
    radiusdamage( self.origin + ( 0, 0, 40 ), 200, 500, 250, self, "MOD_EXPLOSIVE", "zmb_imsprojectile_mp" );
    self hide();
    wait 0.65;
    physicsexplosionsphere( self.origin, 256, 256, 2 );
}

seismic_trap_handleuse()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !var_0 _id_0A77::_id_9D05() )
            continue;

        if ( scripts\engine\utility::_id_9CEE( var_0._id_9D81 ) )
            continue;

        if ( scripts\engine\utility::_id_9CEE( var_0.kung_fu_mode ) )
            continue;

        var_1 = create_seismic_trap_for_player( self.seismic_trap_type, var_0 );

        if ( !isdefined( var_1 ) )
            continue;

        seismic_trap_setinactive();

        if ( isdefined( self _meth_8138() ) )
            self unlink();

        var_0 thread set_carrying_seismic( var_1, 0, self._id_AC71 );
        self delete();
        break;
    }
}

seismic_trap_setplaced( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );

    if ( isdefined( self._id_3A9D ) )
        self._id_3A9D _meth_80F3();

    self._id_3A9D = undefined;

    if ( isdefined( self.owner ) )
        self.owner._id_9D81 = 0;

    self._id_6DEC = undefined;
    var_1 = create_seismic_trap( self, var_0 );
    var_1._id_9EE4 = 1;
    var_1 thread _id_9367( self.owner );
    self playsound( "trap_boom_box_drop" );
    self notify( "placed" );
    var_1 thread seismic_trap_setactive();
    var_2 = spawnstruct();

    if ( isdefined( self._id_BD3B ) )
        var_2._id_AD39 = self._id_BD3B;

    var_2._id_6371 = "carried";
    var_2._id_4E53 = ::_id_936D;
    var_1 thread _id_0A60::_id_892F( var_2 );
    self.carried_seismic_trap delete();
    self delete();
}

seismic_trap_setcancelled( var_0 )
{
    if ( isdefined( self._id_3A9D ) )
    {
        var_1 = self._id_3A9D;
        var_1 _meth_80F3();
        var_1._id_9D81 = undefined;
        var_1._id_3AA0 = undefined;
        var_1 scripts\engine\utility::_id_1C71( 1 );
    }

    if ( isdefined( var_0 ) && var_0 )
        _id_66A7();

    self.carried_seismic_trap delete();
    self delete();
}

seismic_trap_setcarried( var_0 )
{
    self _meth_8335( var_0 );
    self _meth_82C7( 0 );
    self setcandamage( 0 );
    self._id_3A9D = var_0;
    var_0._id_9D81 = 1;
    var_0 thread _id_0A77::_id_12E3F( self, self.carried_seismic_trap, level.seismic_trap_settings["crafted_seismic"] );
    thread _id_0A77::_id_A025( var_0 );
    thread _id_936F( var_0 );
    thread _id_9371( var_0 );

    if ( isdefined( level._id_5CF2 ) )
        self thread [[ level._id_5CF2 ]]( var_0 );

    self notify( "carried" );
}

_id_936F( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 endon( "last_stand" );
    var_0 waittill( "disconnect" );
    seismic_trap_setcancelled();
}

_id_9371( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 endon( "last_stand" );
    level waittill( "game_ended" );
    seismic_trap_setcancelled();
}

seismic_trap_setactive()
{
    self endon( "death" );
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( level.seismic_trap_settings[self.seismic_trap_type]._id_017B );
    _id_0A77::_id_1861();
    var_0 = self.owner;
    var_0 _meth_80F3();
    _id_0A77::_id_F838( var_0 );
    self _meth_84A5( 120 );
    self _meth_84A2( 96 );

    if ( isdefined( level.mpq_arm_func ) )
        self thread [[ level.mpq_arm_func ]]();

    thread seismic_trap_kill_zombies();
    thread _id_0A77::_id_A021( "seismic_disconnect" );

    if ( !isdefined( var_0.next_trap_time ) )
        var_0.next_trap_time = gettime();

    wait 1;

    if ( isdefined( var_0 ) )
    {
        if ( gettime() >= var_0.next_trap_time )
            self setscriptablepartstate( "seismic", "on" );
        else
        {
            while ( gettime() <= var_0.next_trap_time )
                wait 0.05;

            self setscriptablepartstate( "seismic", "on" );
        }

        if ( isdefined( var_0 ) )
            var_0.next_trap_time = gettime() + 3000;
    }
    else
        self notify( "death" );
}

seismic_trap_setinactive()
{
    self makeunusable();
    self stoploopsound();
    self setscriptablepartstate( "seismic", "off" );

    if ( isdefined( self._id_5761 ) )
        self._id_5761 delete();

    _id_0A77::_id_E11E();
}

seismic_trap_kill_zombies()
{
    self endon( "death" );
    self._id_5761 = spawn( "trigger_radius", self.origin, 0, 250, 64 );

    for (;;)
    {
        self waittill( "scriptableNotification" );
        var_0 = _id_0A4A::_id_7DB0( "axis" );

        foreach ( var_2 in var_0 )
        {
            if ( !var_2 istouching( self._id_5761 ) )
                continue;

            if ( !_id_0A77::_id_FF18( var_2 ) )
                continue;

            if ( var_2.agent_type == "crab_mini" || var_2.agent_type == "crab_brute" )
                continue;

            level thread _id_6F32( self, var_2 );

            if ( isdefined( self.owner ) )
                self.owner _id_0A5E::_id_D9AD( "mt_dlc3_crafted_kills" );
        }

        foreach ( var_5 in level.players )
        {
            if ( var_5 istouching( self._id_5761 ) )
                var_5 shellshock( "seismic", 0.5 );
        }

        wait 0.1;
        physicsexplosionsphere( self.origin + ( 0, 0, -20 ), 200, 150, 250 );
    }
}

_id_6F32( var_0, var_1 )
{
    var_1 endon( "death" );
    var_1.dontmutilate = 1;
    var_1._id_5793 = 1;
    var_1._id_4C87 = 1;
    var_1.ragdollhitloc = "torso_lower";
    var_2 = var_0.origin - var_1.origin;
    var_2 = vectornormalize( ( var_2[0], var_2[1], 0 ) );
    var_1.ragdollimpactvector = var_2 * 3500;
    var_3 = undefined;

    if ( isdefined( var_0.owner ) && var_0.owner _id_0A77::_id_9D05() )
        var_3 = var_0.owner;

    var_1 _meth_80B0( var_1.health + 100, var_0.origin + ( 0, 0, -50 ), var_3, var_3, "MOD_UNKNOWN", "iw7_fantrap_zm" );
}
