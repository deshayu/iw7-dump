// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_DF0C()
{
    level._id_13F28 = scripts\engine\utility::_id_8180( "zombie_ghost_hide_node", "script_noteworthy" );
    level._id_13F29 = scripts\engine\utility::_id_8180( "zombie_ghost_hover_node", "targetname" );
    scripts\aitypes\bt_util::init();
    _id_03B4::_id_DEE8();
    _id_0F46::_id_2371();
    _id_AEB0();
    thread _id_FAB0();
}

_id_FAB0()
{
    level endon( "game_ended" );

    if ( !isdefined( level._id_18EE ) )
        level waittill( "scripted_agents_initialized" );

    level._id_18EE["zombie_ghost"]["setup_func"] = ::_id_FA8A;
    level._id_18EE["zombie_ghost"]["setup_model_func"] = ::_id_FACE;
    level.agent_funcs["zombie_ghost"]["on_killed"] = ::_id_C535;
    level.agent_funcs["zombie_ghost"]["on_damaged"] = ::_id_C536;
}

_id_FA8A()
{
    self.class = undefined;
    self._id_BCF6 = undefined;
    self._id_26B9 = undefined;
    self.guid = undefined;
    self.name = undefined;
    self._id_EB6A = undefined;
    self._id_CA5B = undefined;
    self._id_13CA0 = undefined;
    self._id_C2AD = undefined;
    self._id_0291 = undefined;
    self.sessionstate = undefined;
    self._id_55E6 = undefined;
    self._id_55E9 = undefined;
    self._id_55D9 = undefined;
    self._id_55E4 = 1;
    self._id_C026 = undefined;
    self._id_0184 = 0;
    self._id_0180 = 0;
    self._id_116D4 = undefined;
    self._id_441A = undefined;
    self._id_4B82 = undefined;
    self._id_5793 = undefined;
    self._id_37FD = 0;
    self._id_24CA = undefined;
    self._id_6622 = 0;
    self._id_B36E = undefined;
    self._id_126A3 = undefined;
    self._id_8C35 = 0;
    self._id_1B03 = "idle";
    self._id_01F5 = "walk";
    self._id_0293 = 100;
    self.radius = 15;
    self.height = 40;
    self._id_252B = 26 + self.radius;
    self._id_B640 = "normal";
    self._id_B641 = 50;
    self._id_2539 = 54;
    self._id_253A = -64;
    self._id_4D45 = 2250000;
    self._id_0181 = 1;
    self.guid = self getentitynumber();
    self._id_BCE4 = 1.0;
    self._id_C081 = 1.0;
    self._id_126E8 = 1.0;
    self._id_772A = 1.0;
    self._id_2AB2 = 0;
    self._id_2AB8 = 1;
    self._id_118FC = 0;
    self._id_002F = 1;
    self._id_B5F9 = 40;
    self._id_B62E = 60;
    self._id_B62F = squared( self._id_B62E );
    self._id_503C = self.radius + 1;
    self._id_B607 = 0.5;
    self._id_565C = 0;
    self._id_54CB = 0;
    self._id_9E0C = undefined;
    self._id_6F73 = undefined;
    self._id_565C = 0;
    self._id_B0FC = 1;
    self._id_74B5 = 0;
    self._id_C1F7 = 0;
    _id_0F74::_id_F794( self._id_B62E );
    self _meth_8500( 0 );
    thread _id_899C();
}

_id_899C()
{
    self endon( "death" );
    level waittill( "game_ended" );
    self _meth_841F();

    foreach ( var_4, var_1 in self._id_164D )
    {
        var_2 = var_1._id_4BC0;
        var_3 = anim._id_2303[var_4]._id_10E2F[var_2];
        scripts\asm\asm::_id_2388( var_4, var_2, var_3, var_3._id_116FB );
        scripts\asm\asm::_id_238A( var_4, "idle", 0.2, undefined, undefined, undefined );
    }
}

_id_FACE( var_0 )
{
    var_1 = get_ghost_info();
    self._id_00B9 = var_1._id_00B9;

    if ( isdefined( level.fbd ) && isdefined( level.fbd.fightstarted ) && level.fbd.fightstarted )
    {
        self setmodel( "dlc4_boss_soul" );
        return;
    }

    self setmodel( level.zombie_ghost_model );
}

get_ghost_info()
{
    var_0 = spawnstruct();

    switch ( level.zombie_ghost_model )
    {
        case "zombie_ghost_cube_red":
        case "zombie_ghost_red":
            var_0._id_00B9 = "red";
            break;
        case "zombie_ghost_cube_green":
        case "zombie_ghost_green":
            var_0._id_00B9 = "green";
            break;
        case "zombie_ghost_cube_yellow":
        case "zombie_ghost_yellow":
            var_0._id_00B9 = "yellow";
            break;
        case "zombie_ghost_cube_blue":
        case "zombie_ghost_blue":
            var_0._id_00B9 = "blue";
            break;
        case "zombie_ghost_bomb_red":
            var_0._id_00B9 = "red_bomb";
            break;
        case "zombie_ghost_bomb_green":
            var_0._id_00B9 = "green_bomb";
            break;
        case "zombie_ghost_bomb_yellow":
            var_0._id_00B9 = "yellow_bomb";
            break;
        case "zombie_ghost_bomb_blue":
            var_0._id_00B9 = "blue_bomb";
            break;
        case "zombie_ghost_cube_white":
            var_0._id_00B9 = "white";
            break;
    }

    return var_0;
}

_id_50EF()
{
    self endon( "death" );
    wait 0.5;

    if ( scripts\engine\utility::_id_9CEE( self._id_8C5F ) )
        return;

    if ( isdefined( level._id_C01F ) )
        return;
}

_id_AEB0()
{
    level._effect["ghost_explosion_death_green"] = loadfx( "vfx/iw7/core/zombie/vfx_zmb_ghost_imp.vfx" );
}

_id_C536( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = gettime();

    if ( isplayer( var_1 ) )
    {
        if ( isdefined( var_5 ) && var_5 == "iw7_entangler_zm" )
        {
            if ( !isdefined( self._id_65FC ) )
                _id_D974( var_1, self );
            else if ( var_1 == self._id_65FC )
                _id_D974( var_1, self );
            else if ( !isdefined( level.fbd ) || !isdefined( level.fbd.fightstarted ) || !level.fbd.fightstarted )
                _id_8263( var_1, var_12 );
        }
        else if ( !isdefined( level.fbd ) || !isdefined( level.fbd.fightstarted ) || !level.fbd.fightstarted )
            var_1 iprintlnbold( "This weapon is not effective againt the ghost" );
    }

    if ( isdefined( var_2 ) )
        self.health = self.health + var_2;
}

_id_8263( var_0, var_1 )
{
    if ( !isdefined( var_0._id_D8A1 ) || ( var_1 - var_0._id_D8A1 ) / 1000 > 3 )
    {
        if ( isdefined( level.grab_same_ghost_string ) )
            var_0 iprintlnbold( level.grab_same_ghost_string );
        else
            var_0 iprintlnbold( &"CP_ZMB_GHOST_TRACK_SAME_GHOST" );

        var_0._id_D8A1 = var_1;
    }
}

_id_D974( var_0, var_1 )
{
    scripts\cp\maps\cp_zmb\cp_zmb_ghost_wave::_id_12DBA( var_0, var_1 );
    var_1 thread _id_158F( var_1 );
    var_1 thread _id_65FD( var_0, var_1 );
}

_id_158F( var_0 )
{
    var_0 endon( "death" );
    var_0 notify( "activate_being_tracked_scriptable" );
    var_0 endon( "activate_being_tracked_scriptable" );
    var_0 setscriptablepartstate( "being_tracked", "on" );
    wait 0.2;
    var_0 setscriptablepartstate( "being_tracked", "off" );
}

_id_65FD( var_0, var_1 )
{
    var_1 endon( "death" );
    var_1 notify( "entangled_by_player_monitor" );
    var_1 endon( "entangled_by_player_monitor" );
    var_1._id_65FC = var_0;
    scripts\engine\utility::waitframe();
    var_1._id_65FC = undefined;
}

_id_C535( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    _id_108D0( self._id_1657, var_3, var_4 );
    scripts\mp\mp_agent::_id_5006( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

    if ( isdefined( level._id_8269 ) )
        [[ level._id_8269 ]]( var_1, var_4 );
}

_id_108D0( var_0, var_1, var_2 )
{

}
