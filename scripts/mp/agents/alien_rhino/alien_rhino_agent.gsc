// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_DF0C()
{
    scripts\mp\agents\alien_rhino\alien_rhino_tunedata::setuptunedata();
    scripts\aitypes\bt_util::init();
    behaviortree\alien_rhino::_id_DEE8();
    scripts\asm\alien_rhino\mp\states::_id_2371();
    thread _id_FAB0();
}

_id_FAB0()
{
    level endon( "game_ended" );

    if ( !isdefined( level._id_18EE ) )
        level waittill( "scripted_agents_initialized" );

    level._id_18EE["alien_rhino"]["setup_func"] = ::_id_FA8A;
    level._id_18EE["alien_rhino"]["setup_model_func"] = ::_id_FACE;
    level.agent_funcs["alien_rhino"]["on_damaged"] = ::_id_C4E0;
    level.agent_funcs["alien_rhino"]["gametype_on_damage_finished"] = _id_0CBC::_id_C5CE;
    level.agent_funcs["alien_rhino"]["gametype_on_killed"] = scripts\cp\maps\cp_final\cp_final_damage::cp_final_onzombiekilled;
    level.agent_funcs["alien_rhino"]["on_damaged_finished"] = _id_0F72::_id_C5CE;
    level.agent_funcs["alien_rhino"]["on_killed"] = ::onrhinokilled;

    if ( !isdefined( level._id_8CBD ) )
        level._id_8CBD = [];

    level._id_8CBD["alien_rhino"] = ::calculatealienrhinohealth;

    if ( !isdefined( level.damage_feedback_overrride ) )
        level.damage_feedback_overrride = [];
}

_id_FACE( var_0 )
{
    if ( should_spawn_mammoth() )
        self setmodel( "alien_queen_blue" );
    else
        self setmodel( "alien_queen" );
}

setupzombiegametypevars()
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
    self.attackent = undefined;
    self._id_9342 = 1;
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
    self._id_B62E = 70;
    self._id_B631 = 80;
    self._id_B62F = squared( self._id_B62E );
    self._id_503C = self.radius + 1;
    self._id_B607 = 0.5;
    self._id_565C = 0;
    self._id_9BAC = 0;
    self._id_54CB = 0;
    self.damaged_by_player = 0;
    self._id_9E0C = undefined;
    self._id_6F73 = undefined;
    self._id_B0FC = 1;
    self._id_74B5 = 0;
    self._id_012E = undefined;
    self._id_E821 = undefined;
    self._id_A8A2 = [];
    self._id_8C12 = 0;
    self._id_8C14 = undefined;
    self._id_9BA7 = undefined;
    self._id_0179 = 200;
    self._id_4E4C = undefined;
    self._id_10A57 = undefined;
    self._id_828A = undefined;
    self._id_CE65 = undefined;
    self._id_29D2 = 1;
    self.vignette_nocorpse = undefined;
    self.death_anim_no_ragdoll = undefined;
    self.dont_cleanup = 1;
    self._id_0033 = 0;
    self _meth_84E6( 65 );

    if ( getdvarint( "scr_zombie_left_foot_sharp_turn_only", 0 ) == 1 )
        self._id_AB3F = 1;
}

_id_FA8A()
{
    setupzombiegametypevars();
    thread _id_0F72::_id_12EE6();
    self.height = self._id_18F4;
    self.radius = self._id_18F9;
    self._id_9341 = 1;
    self._id_B62D = 70;
    self._id_B62E = 70;
    self._id_B631 = 80;
    self._id_B62F = squared( self._id_B62E );
    self._id_503C = self.radius + 1;
    self._id_B607 = 0.5;
    self._id_B601 = 90;
    self._id_504E = 55;
    self._id_129AF = 55;
    self._id_0368 = -60;
    self._id_0100 = 60;
    self.ground_pound_damage = 50;
    self._id_013C = 2500;
    self._id_013E = 2500;
    self._id_013D = 2500;
    self._id_0180 = 1;
    self.dontmutilate = 1;

    if ( scripts\engine\utility::_id_9CEE( self.activated_venomx_sphere ) )
        self.activated_venomx_sphere = undefined;

    if ( scripts\engine\utility::_id_9CEE( self.dot_triggered ) )
        self.dot_triggered = undefined;

    self.preventplayerpushdist = 12;
}

calculatealienrhinohealth()
{
    return 50000 * level.players.size;
}

accumulatedamage( var_0, var_1 )
{
    if ( !isdefined( self.damageaccumulator ) )
    {
        self.damageaccumulator = spawnstruct();
        self.damageaccumulator.accumulateddamage = 0;
    }
    else if ( !isdefined( self.damageaccumulator._id_A96A ) || gettime() > self.damageaccumulator._id_A96A + 1000 )
    {
        self.damageaccumulator.accumulateddamage = 0;
        self.damageaccumulator._id_A96A = 0;
    }

    self.damageaccumulator._id_A96A = gettime();

    if ( !isdefined( var_1 ) )
        var_1 = ( 1, 1, 1 );

    self.damageaccumulator.lastdir = var_1;

    if ( isdefined( self.fake_damage ) )
    {
        self.damageaccumulator.accumulateddamage = self.damageaccumulator.accumulateddamage + self.fake_damage;
        self.fake_damage = undefined;
    }
    else
        self.damageaccumulator.accumulateddamage = self.damageaccumulator.accumulateddamage + var_0;
}

_id_C4E0( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( isdefined( self.is_mammoth ) && self.is_mammoth )
        var_2 = var_2 / 4;

    var_12 = weaponclass( var_5 );

    if ( var_12 == "smg" || var_12 == "spread" )
        var_2 = var_2 / 2;

    accumulatedamage( var_2, var_7 );
    scripts\cp\maps\cp_final\cp_final_damage::cp_final_onzombiedamaged( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

should_spawn_mammoth()
{
    if ( isdefined( level.mammoth_spawn ) && level.mammoth_spawn )
        return 1;

    return 0;
}

onrhinokilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( scripts\engine\utility::_id_9CEE( self.is_mammoth ) )
        var_9 = 4000;
    else
        var_9 = 1000;

    foreach ( var_11 in level.players )
    {
        if ( var_11 _id_0A77::_id_9D05() )
            var_11 _id_0A63::_id_82F9( var_9 );
    }

    scripts\mp\mp_agent::_id_5006( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}
