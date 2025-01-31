// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._effect["revocator_idle"] = loadfx( "vfx/iw7/core/zombie/vfx_zmb_revocator_idle.vfx" );
    level._effect["revocator_activate"] = loadfx( "vfx/iw7/_requests/coop/vfx_revocator_use.vfx" );
    var_0 = spawnstruct();
    var_0._id_11901 = 30.0;
    var_0._id_B91A = "revocator";
    var_0._id_B924 = "revocator";
    var_0._id_B925 = "revocator_bad";
    var_0._id_CC12 = "revocator";
    var_0._id_017B = &"COOP_CRAFTABLES_PICKUP";
    var_0._id_CC28 = &"COOP_CRAFTABLES_PLACE";
    var_0._id_38E3 = &"COOP_CRAFTABLES_CANNOT_PLACE";
    var_0._id_CC0A = &"COOP_CRAFTABLES_PLACE_CANCELABLE";
    var_0._id_CC22 = 30.0;
    var_0._id_CC25 = 24.0;
    var_0._id_3AA7 = ( 0, 0, 25 );
    var_0._id_3AA6 = ( 0, 0, 0 );
    level._id_47B1 = [];
    level._id_47B1["crafted_revocator"] = var_0;
}

_id_82B9( var_0, var_1 )
{
    var_1 thread _id_13932();
    var_1 notify( "new_power", "crafted_revocator" );
    var_1 setclientomnvar( "zom_crafted_weapon", 6 );
    var_1 thread _id_0A77::_id_1308C( var_1, "iw7_pickup_zm" );
    _id_0A77::_id_F313( "crafted_revocator", ::_id_82B9, var_1 );
}

_id_13932()
{
    self endon( "disconnect" );
    self endon( "death" );
    self notify( "craft_dpad_watcher" );
    self endon( "craft_dpad_watcher" );
    self notifyonplayercommand( "pullout_revocator", "+actionslot 3" );

    for (;;)
    {
        self waittill( "pullout_revocator" );

        if ( scripts\engine\utility::_id_9CEE( self._id_9D81 ) )
            continue;

        if ( scripts\engine\utility::_id_9CEE( self._id_AD2C ) )
            continue;

        if ( isdefined( self.allow_carry ) && self.allow_carry == 0 )
            continue;

        if ( _id_0A77::_id_9D05() )
            break;
    }

    thread _id_8329( 1 );
}

_id_8329( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    _id_0A77::_id_41C4( "msg_power_hint" );
    var_3 = _id_4A08( self, var_2 );
    self._id_A039 = var_3.name;
    _id_E152();
    self._id_3AA5 = var_3;

    if ( var_0 )
        var_3._id_6DEC = 1;

    var_4 = _id_F687( var_3, var_0, var_1 );
    self._id_3AA5 = undefined;
    thread _id_1370F();
    self._id_9D81 = 0;

    if ( isdefined( var_3 ) )
        return 1;
    else
        return 0;
}

_id_F687( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    var_0 _id_E4B7( self, var_1 );
    scripts\engine\utility::_id_1C71( 0 );
    self notifyonplayercommand( "place_revocator", "+attack" );
    self notifyonplayercommand( "place_revocator", "+attack_akimbo_accessible" );
    self notifyonplayercommand( "cancel_revocator", "+actionslot 3" );

    if ( !level._id_4542 )
    {
        self notifyonplayercommand( "cancel_revocator", "+actionslot 5" );
        self notifyonplayercommand( "cancel_revocator", "+actionslot 6" );
        self notifyonplayercommand( "cancel_revocator", "+actionslot 7" );
    }

    for (;;)
    {
        var_3 = scripts\engine\utility::_id_13734( "place_revocator", "cancel_revocator", "force_cancel_placement" );

        if ( !isdefined( var_0 ) )
        {
            scripts\engine\utility::_id_1C71( 1 );
            return 1;
        }

        if ( !isdefined( var_3 ) )
            var_3 = "force_cancel_placement";

        if ( var_3 == "cancel_revocator" || var_3 == "force_cancel_placement" )
        {
            if ( !var_1 && var_3 == "cancel_revocator" )
                continue;

            scripts\engine\utility::_id_1C71( 1 );
            var_0 _id_E4B6();

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

        var_0 _id_E4B9( var_2, self );
        scripts\engine\utility::_id_1C71( 1 );
        return 1;
    }
}

_id_E152()
{
    if ( _id_0A77::_id_12D6( "specialty_explosivebullets" ) )
    {
        self._id_E2DF = "specialty_explosivebullets";
        _id_0A77::_id_1430( "specialty_explosivebullets" );
    }
}

_id_E2E0()
{
    if ( isdefined( self._id_E2DF ) )
    {
        _id_0A77::giveperk( self._id_E2DF );
        self._id_E2DF = undefined;
    }
}

_id_1370F()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait 0.05;
    _id_E2E0();
}

_id_4A08( var_0, var_1 )
{
    var_2 = spawnturret( "misc_turret", var_0.origin + ( 0, 0, 25 ), "sentry_minigun_mp" );
    var_2.angles = var_0.angles;
    var_2.owner = var_0;
    var_2.name = "crafted_revocator";
    var_2._id_3AA4 = spawn( "script_model", var_2.origin );
    var_2._id_3AA4.angles = var_0.angles;
    var_2 maketurretinoperable();
    var_2 _meth_835B( 1 );
    var_2 _meth_830F( "sentry_offline" );
    var_2 makeunusable();
    var_2 _meth_8336( var_0 );

    if ( !isdefined( var_1 ) )
        var_2._id_130D2 = 1;
    else
        var_2._id_130D2 = var_1;

    var_2 _id_E4B4( var_0 );
    return var_2;
}

_id_E4B4( var_0 )
{
    self._id_3872 = 1;
    _id_E4B8();
}

_id_E4B1( var_0 )
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    _id_E4B8();
    playloopsound( self.origin, "trap_revocator_deactivate" );

    if ( isdefined( self._id_3CBF ) )
        self._id_3CBF delete();

    if ( isdefined( self._id_13E61 ) )
        self._id_13E61 delete();

    _id_0A77::_id_E11E();

    if ( isdefined( self ) )
        self delete();
}

_id_E4B9( var_0, var_1 )
{
    var_2 = spawn( "script_model", self.origin + ( 0, 0, 1 ) );
    var_2.angles = self.angles;
    var_2 solid();
    var_2 setmodel( level._id_47B1["crafted_revocator"]._id_CC12 );
    self._id_3A9D _meth_80F3();
    self._id_3A9D = undefined;
    var_1._id_9D81 = 0;
    var_2.owner = var_1;
    var_2._id_130D2 = self._id_130D2;
    var_2.name = "crafted_revocator";
    var_2 thread _id_E4B5( var_0 );
    var_2 playsound( "trap_revocator_activate" );
    self notify( "placed" );
    self._id_3AA4 delete();
    self delete();
}

_id_E4B6()
{
    self._id_3A9D _meth_80F3();

    if ( isdefined( self.owner ) )
        self.owner._id_9D81 = 0;

    self._id_3AA4 delete();
    self delete();
}

_id_E4B7( var_0, var_1 )
{
    self setmodel( level._id_47B1["crafted_revocator"]._id_B924 );
    self hide();
    self _meth_8335( var_0 );
    self setcandamage( 0 );
    self._id_3A9D = var_0;
    var_0._id_9D81 = 1;
    var_0 thread _id_0A77::_id_12E3F( self, self._id_3AA4, level._id_47B1["crafted_revocator"] );
    thread _id_0A77::_id_A025( var_0 );
    thread _id_0A77::_id_A026( var_0 );
    thread _id_0A77::_id_A027( var_0 );
    _id_E4B8();
    self notify( "carried" );
}

_id_E4B5( var_0 )
{
    self endon( "death" );
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( level._id_47B1["crafted_revocator"]._id_017B );
    self makeusable();
    self _meth_84A7( "tag_fx" );
    self _meth_84A5( 120 );
    self _meth_84A2( 96 );
    thread _id_E4B1( self.owner );
    thread _id_0A77::_id_A021( "elecrevocator_handleOwner" );
    thread _id_0A77::_id_A030( var_0, level._id_47B1["crafted_revocator"]._id_11901 );
    thread _id_E4B2();
    thread _id_E4BA();
    _id_0A77::_id_1861();
    wait 1;
    self setscriptablepartstate( "base", "idle" );
}

_id_E4B2()
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

        self playsound( "trap_revocator_pickup" );
        var_0 thread _id_8329( 0, self._id_AC71, self._id_130D2 );

        if ( isdefined( self._id_3CBF ) )
            self._id_3CBF delete();

        _id_0A77::_id_E11E();
        self delete();
    }
}

_id_E4B8()
{
    self makeunusable();
    _id_0A77::_id_E11E();
}

_id_E4BA()
{
    self endon( "death" );
    var_0 = 0;
    var_1 = 1600;

    while ( self._id_130D2 > 0 )
    {
        var_2 = _id_0A4A::_id_7DAF();
        var_2 = scripts\engine\utility::_id_782F( self.origin, var_2 );

        foreach ( var_4 in var_2 )
        {
            if ( !isdefined( var_4.agent_type ) )
                continue;

            if ( var_4.agent_type == "superslasher" || var_4.agent_type == "slasher" || var_4.agent_type == "zombie_sasquatch" || var_4.agent_type == "lumberjack" || scripts\engine\utility::_id_9CEE( var_4.is_skeleton ) )
                continue;

            if ( !isdefined( var_4 ) || !isalive( var_4 ) || !var_4._id_6622 || scripts\engine\utility::_id_9CEE( var_4._id_B36E ) || var_4.agent_type == "zombie_brute" || var_4.agent_type == "zombie_grey" || var_4.agent_type == "zombie_ghost" || var_4.team == "allies" )
                continue;

            if ( distancesquared( self.origin, var_4.origin ) < var_1 )
            {
                self setscriptablepartstate( "base", "active" );

                if ( scripts\engine\utility::_id_9CEE( var_4._id_9CDD ) || scripts\engine\utility::_id_9CEE( var_4._id_9BB0 ) || scripts\engine\utility::_id_6E34( "defense_sequence_active" ) && scripts\engine\utility::_id_6E25( "defense_sequence_active" ) )
                    var_4 _meth_80B0( var_4.health + 50, self.origin );
                else
                    var_4 _id_1299C( self.owner );

                self._id_130D2--;
                wait 1;
                self setscriptablepartstate( "base", "idle" );

                if ( self._id_130D2 <= 0 )
                    break;
            }
        }

        wait 0.1;
    }

    self notify( "death" );
}

_id_1299C( var_0 )
{
    var_1 = self;
    var_1.team = "allies";
    var_1._id_01F5 = "sprint";
    var_1._id_9CA2 = 1;
    var_1._id_9CEF = 1;
    var_1.maxhealth = 900;
    var_1.health = 900;
    var_1._id_0033 = 0;
    var_1 notify( "turned" );

    if ( scripts\engine\utility::_id_9CEE( var_1._id_152C ) )
    {
        if ( isdefined( var_1._id_C37F ) )
            var_1._id_015C = var_1._id_C37F;

        var_1._id_C37F = undefined;
        var_1._id_152C = 0;
        var_1._id_EF64 = 0;
    }

    var_1._id_B57A = int( _id_0D61::_id_3728( "generic_zombie" ) * 0.5 );
    level._id_1084F = scripts\engine\utility::array_remove( level._id_1084F, var_1 );
    level._id_4B6E++;
    level._id_4B95--;
    var_1 setscriptablepartstate( "eyes", "turned_eyes" );
    var_1 setscriptablepartstate( "pet", "active" );
    var_1 thread _id_A626( 180 );
    var_1 thread _id_E0B2();

    if ( isdefined( var_0 ) )
        var_0 _id_0A5E::_id_D9AD( "mt_turned_zombies" );

    _id_B2EB( var_1 );
}

_id_B2EB( var_0 )
{
    if ( !isdefined( level._id_1299F ) )
        level._id_1299F = [];

    level._id_1299F[level._id_1299F.size] = var_0;

    if ( level._id_1299F.size > 6 )
    {
        var_0 = level._id_1299F[0];
        level._id_1299F = scripts\engine\utility::array_remove( level._id_1299F, var_0 );
        var_0 _meth_80B0( var_0.health + 100, var_0.origin );
    }
}

_id_A626( var_0 )
{
    self endon( "death" );

    while ( var_0 > 0 )
    {
        wait 1;
        var_0--;
    }

    self _meth_80B0( self.health + 100, self.origin );
}

_id_E0B2()
{
    self waittill( "death" );
    level._id_1299F = scripts\engine\utility::array_remove( level._id_1299F, self );
    _id_0D61::_id_4FB8( 1 );
}
