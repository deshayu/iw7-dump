// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

tiger_kung_fu_init()
{
    thread _id_0D0D::init();
    level._effect["blackhole_trap"] = loadfx( "vfx/iw7/core/zombie/traps/vfx_zmb_blackhole_trap.vfx" );
    level._effect["blackhole_trap_death"] = loadfx( "vfx/iw7/_requests/coop/vfx_zmb_blackhole_death" );
    scripts\engine\utility::_id_6E4C( "interactions_initialized" );
    _id_0D15::_id_D787( "power_shuriken_tiger", scripts\cp\maps\cp_disco\kung_fu_mode_dragon::set_dragon_shuriken_power, scripts\cp\maps\cp_disco\kung_fu_mode_dragon::unset_dragon_shuriken_power, scripts\cp\maps\cp_disco\kung_fu_mode_dragon::use_dragon_shuriken, undefined, undefined, undefined );
    _id_0D15::_id_D787( "power_black_hole_tiger", ::tiger_black_hole_set, ::tiger_black_hole_unset, ::tiger_black_hole_use, undefined, "power_tiger_black_hole_used", undefined );
}

tiger_black_hole_set( var_0 )
{

}

tiger_black_hole_unset( var_0 )
{

}

tiger_black_hole_use( var_0 )
{
    _id_0D15::_id_D728();
    var_1 = 2.5;
    thread run_black_hole_logic();
    wait( var_1 );
    self.kung_fu_exit_delay = 0;
    _id_0D15::_id_D72E();
    self notify( "power_tiger_black_hole_used", 1 );
}

run_black_hole_logic()
{
    wait 0.3;

    if ( scripts\engine\utility::_id_9CEE( self.tiger_super_use ) )
        return;

    var_0 = sortbydistance( level._id_1084F, self.origin );
    var_1 = undefined;
    var_2 = 3;
    var_3 = 2.5;
    var_4 = 256;
    var_5 = self getplayerangles();
    var_6 = anglestoforward( var_5 );
    var_6 = vectornormalize( var_6 );
    var_7 = self geteye();
    var_8 = var_7 + var_6 * var_4;
    var_9 = _id_0A4A::_id_7DAF();
    var_9 = scripts\engine\utility::_id_227F( var_9, level.players );
    var_10 = scripts\engine\trace::_id_DCED( var_7, var_8, var_9 );
    var_11 = var_10["position"];
    var_1 = scripts\engine\utility::_id_5D14( var_11, 20, -1000 );
    var_1 = getclosestpointonnavmesh( var_1 );
    var_12 = 250;

    if ( self.chi_meter_amount - var_12 <= 0 )
        self.kung_fu_exit_delay = 1;

    thread scripts\cp\zombies\zombies_chi_meter::chi_meter_kill_decrement( var_12 );
    var_13 = scripts\engine\utility::_id_107E6( var_1 + ( 0, 0, 60 ) );
    var_13.owner = self;
    var_13 setmodel( "tag_origin_tiger_black_hole" );
    thread scripts\engine\utility::_id_CE2B( "chi_tiger_blackhole", var_13.origin );
    thread grabclosestzombies( var_13, 1 );
    self _meth_8441( "ges_plyr_gesture042", undefined, 1 );
    wait( var_3 );
    var_13 notify( "death" );
    var_13 delete();
}

grabclosestzombies( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0.grabbedents = [];
    var_2 = anglestoup( var_0.angles );
    var_3 = spawn( "trigger_rotatable_radius", _id_0D04::_id_7E08( var_0 ) - var_2 * 64 * 0.5, 0, 200, 64 );
    var_3.angles = var_0.angles;
    var_3 _meth_80D2();
    var_3 linkto( var_0 );
    var_3 thread _id_0D04::_id_4108( var_0 );

    while ( isdefined( var_3 ) )
    {
        var_4 = scripts\engine\utility::_id_782F( var_0.origin, level._id_1084F, undefined, undefined, 200 );

        foreach ( var_6 in var_4 )
        {
            if ( !_id_0A77::isreallyalive( var_6 ) || !isdefined( var_0.owner ) )
                continue;

            if ( isplayer( var_6 ) )
                continue;

            if ( isdefined( var_6.team ) && var_6.team == "allies" )
                continue;

            if ( var_0.owner == var_6 )
                continue;

            if ( !_id_0D12::_id_213D( var_0, var_6 ) )
                continue;

            if ( !_id_0A77::_id_FF18( var_6, undefined, 1 ) || isdefined( var_6._id_6F73 ) )
                continue;

            if ( !isalive( var_6 ) )
                continue;

            if ( isdefined( level._id_1299F ) && isdefined( scripts\engine\utility::_id_2291( level._id_1299F, var_6 ) ) )
                continue;

            if ( !var_6 _id_0D04::isgrabbedent( var_0 ) )
            {
                var_6 thread _id_0D04::grabent( var_0 );
                var_6._id_6F73 = 1;
                var_6 thread _id_0D04::_id_111B0( var_6, var_0, var_1 );
                wait 0.2;
            }
        }

        scripts\engine\utility::waitframe();
    }
}

tiger_ground_pound_set( var_0 )
{

}

tiger_ground_pound_unset( var_0 )
{

}

tiger_ground_pound_use( var_0 )
{
    self.tiger_super_use = 1;
    self.kung_fu_shield = 1;
    self _meth_800A( 0 );
    scripts\engine\utility::_id_1C64( 0 );
    scripts\engine\utility::_id_1C53( 0 );
    thread tiger_pound_cowbell();
    thread play_tiger_hand_fx();
    wait 1.5;
    self setscriptablepartstate( "tiger_style_fx", "active", 1 );
    run_slam_wave();
    self _meth_800A( 1 );
    scripts\engine\utility::_id_1C53( 1 );
    scripts\engine\utility::_id_1C64( 1 );
    self.kung_fu_shield = undefined;
    _id_0D15::_id_D72E();
}

tiger_pound_cowbell()
{
    self _meth_8441( "ges_tiger_melee_super", undefined, 1 );
    thread stay_in_kung_fu_till_gesture_done( "ges_tiger_melee_super" );
    var_0 = scripts\engine\utility::_id_5D14( self.origin, 30, -100 );
}

stay_in_kung_fu_till_gesture_done( var_0 )
{
    self endon( "disconnect" );
    var_1 = 500;

    if ( self.chi_meter_amount - var_1 <= 0 )
        self.kung_fu_exit_delay = 1;

    var_2 = self _meth_8443( var_0 );
    wait( var_2 );
    self.tiger_super_use = 0;
    self.kung_fu_exit_delay = 0;
}

play_tiger_hand_fx()
{
    self setscriptablepartstate( "kung_fu_super_fx", "tiger" );
    wait 2.5;
    self setscriptablepartstate( "kung_fu_super_fx", "off" );
}

run_slam_wave()
{
    var_0 = 150;
    var_1 = 3;
    var_2 = 0;

    while ( var_2 < var_1 )
    {
        var_3 = ( var_2 + 1 ) * var_0;
        var_4 = var_3 * var_3;

        foreach ( var_6 in level._id_1084F )
        {
            if ( distancesquared( var_6.origin, self.origin ) < var_4 )
            {
                var_7 = var_6.origin + ( 0, 0, 100 );
                var_6 thread fling_enemy( var_6.maxhealth, var_7 - var_6.origin, self, 0, "kung_fu_super_zm_tiger" );
            }
        }

        var_2++;
        wait 0.25;
    }
}

fling_enemy( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = isdefined( self.agent_type ) && self.agent_type == "ratking";

    if ( var_5 )
    {
        if ( isdefined( var_2 ) )
            self _meth_80B0( self.health + 1000, self.origin, var_2, var_2, "MOD_UNKNOWN", var_4 );
        else
            self _meth_80B0( self.health + 1000, self.origin, level.players[0], level.players[0], "MOD_UNKNOWN", var_4 );
    }
    else
    {
        self._id_5793 = 1;
        self._id_4C87 = 1;
        self._id_5502 = 1;
        wait 0.05;

        if ( scripts\engine\utility::_id_9CEE( var_3 ) )
        {
            self._id_C026 = 1;
            self._id_74B5 = 1;

            if ( isdefined( var_2 ) )
                self _meth_80B0( self.health + 1000, self.origin, var_2, var_2, "MOD_UNKNOWN", var_4 );
            else
                self _meth_80B0( self.health + 1000, self.origin, level.players[0], level.players[0], "MOD_UNKNOWN", var_4 );
        }
        else
        {
            self _meth_8366( vectornormalize( var_1 ) * 500 );
            wait 0.1;

            if ( isdefined( var_2 ) )
                self _meth_80B0( self.health + 1000, self.origin, var_2, var_2, "MOD_UNKNOWN", var_4 );
            else
                self _meth_80B0( self.health + 1000, self.origin, level.players[0], level.players[0], "MOD_UNKNOWN", var_4 );
        }
    }
}

_id_102C7( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
    {
        var_3 = lengthsquared( var_0.origin - var_1 );

        if ( var_3 < 65536 )
            return;

        if ( var_3 > squared( 600 ) )
            return;
    }

    var_4 = var_0 scripts\engine\utility::_id_107E6();
    thread _id_0D0D::_id_102C6( var_0, var_4 );
    _id_102C8( var_0, var_1, var_4, var_2 );
    var_0 notify( "slam_finished" );
}

_id_102C8( var_0, var_1, var_2, var_3 )
{
    var_4 = lengthsquared( var_0.origin - var_1 );
    var_5 = 0;
    var_6 = 0;
    var_7 = 0;

    if ( var_4 >= 28224 )
    {
        var_6 = 20736;
        var_5 = 1;
    }
    else if ( var_4 >= 7056 )
    {
        var_6 = 5184;
        var_7 = 20736;
    }
    else
        var_7 = 11664;

    var_0 _meth_823A( var_2, "tag_origin" );
    wait 0.25;
    var_0 thread _id_0A6B::_id_858A( 0 );

    if ( !isdefined( var_3 ) )
    {
        var_0 playsound( "detpack_explo_metal" );
        var_8 = scripts\engine\utility::ter_op( var_5, scripts\engine\utility::_id_7ECB( "slam_lrg" ), scripts\engine\utility::_id_7ECB( "slam_sml" ) );
        playfx( var_8, var_1 );
    }
    else
    {

    }

    thread _id_0D0D::_id_102CA( var_1 );
    var_9 = _id_0A4A::_id_7DB0( "axis" );

    foreach ( var_11 in var_9 )
    {
        if ( !isdefined( var_11 ) || var_11 == var_0 || !_id_0A77::isreallyalive( var_11 ) )
            continue;

        var_12 = undefined;
        var_13 = distancesquared( var_1, var_11.origin );

        if ( var_13 <= var_6 )
            var_12 = 1000000;
        else if ( var_13 <= var_7 )
            var_12 = 1000000;
        else
            continue;

        var_11 _id_0A6B::_id_FC6A( "MOD_EXPLOSIVE", var_12 );

        if ( var_12 >= var_11.health )
            var_11._id_4C87 = 1;

        var_11 _meth_80B0( var_12, var_1, var_0, var_0, "MOD_CRUSH" );
    }

    wait 0.5;
    var_0 unlink();
    var_0 setscriptablepartstate( "tiger_style_fx", "inactive", 1 );
}
