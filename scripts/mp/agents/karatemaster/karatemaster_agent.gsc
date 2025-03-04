// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_DF0C()
{
    scripts\aitypes\bt_util::init();
    behaviortree\karatemaster::_id_DEE8();
    scripts\asm\karatemaster\mp\states::_id_2371();
    thread _id_FAB0();
}

_id_FAB0()
{
    level endon( "game_ended" );

    if ( !isdefined( level._id_18EE ) )
        level waittill( "scripted_agents_initialized" );

    level._id_18EE["karatemaster"]["setup_func"] = ::_id_FA8A;
    level._id_18EE["karatemaster"]["setup_model_func"] = ::_id_FACE;
    level.agent_funcs["karatemaster"]["gametype_on_damage_finished"] = _id_0CBC::_id_C5CE;
    level.agent_funcs["karatemaster"]["gametype_on_killed"] = _id_0CBC::_id_C5D2;
    level.agent_funcs["karatemaster"]["on_damaged"] = ::_id_C4E0;
    level.agent_funcs["karatemaster"]["on_damaged_finished"] = ::ondamagefinished;
    level.agent_funcs["karatemaster"]["on_killed"] = level._id_C4BE;
    level._id_1094E["karatemaster"] = ::should_spawn_karatemaster;
}

_id_FACE( var_0 )
{
    if ( isdefined( level.karate_zombie_model_list ) )
        var_1 = scripts\engine\utility::_id_DC6B( level.karate_zombie_model_list );
    else
        var_1 = "karatemaster_male_3_black";

    self setmodel( var_1 );
    thread _id_0F72::_id_50EF();
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
    self _meth_84E6( 30 );

    if ( getdvarint( "scr_zombie_left_foot_sharp_turn_only", 0 ) == 1 )
        self._id_AB3F = 1;

    setmovemode( "run" );
}

_id_FA8A()
{
    thread _id_0F72::_id_12EE6();
    setupzombiegametypevars();
    self.karatemaster = 1;
    self.aj_karatemaster = 0;
    self.height = self._id_18F4;
    self.radius = self._id_18F9;
    self._id_B62D = 70;
    self._id_B62E = 70;
    self._id_B631 = 80;
    self._id_B62F = squared( self._id_B62E );
    self._id_503C = self.radius + 1;
    self._id_B607 = 0.5;
    self._id_B601 = 45;
    self._id_504E = 55;
    self._id_129AF = 55;
    self._id_0368 = -60;
    self._id_0100 = 60;
    self.ground_pound_damage = 50;
    self._id_013C = 2500;
    self._id_013E = 2500;
    self._id_013D = 2500;
    self._id_0033 = 0;
    self.dontmutilate = 1;
    scripts\mp\agents\karatemaster\karatemaster_tunedata::setuptunedata();
}

getenemy()
{
    return self.myenemy;
}

setmovemode( var_0 )
{
    self.desiredmovemode = var_0;
}

findgoodteleportcloserspot()
{
    if ( isdefined( self._id_0233 ) )
    {
        var_0 = self _meth_841E();
        var_1 = self _meth_845D( var_0 - scripts\mp\agents\karatemaster\karatemaster_tunedata::gettunedata().cteleportthisclosetoplayer );
        return var_1;
    }

    return self.initialteleportpos;
}

accumulatedamage( var_0, var_1 )
{
    var_2 = scripts\mp\agents\karatemaster\karatemaster_tunedata::gettunedata();

    if ( !isdefined( self.damageaccumulator ) )
    {
        self.damageaccumulator = spawnstruct();
        self.damageaccumulator.accumulateddamage = 0;
    }
    else if ( !isdefined( self.damageaccumulator._id_A96A ) || gettime() > self.damageaccumulator._id_A96A + var_2.cdamageaccumulationcleartimems )
    {
        self.damageaccumulator.accumulateddamage = 0;
        self.damageaccumulator._id_A96A = 0;
    }

    self.damageaccumulator._id_A96A = gettime();

    if ( !isdefined( var_1 ) )
        var_1 = ( 1, 1, 1 );

    self.damageaccumulator.lastdir = var_1;
    self.damageaccumulator.accumulateddamage = self.damageaccumulator.accumulateddamage + var_0;
}

getdamageaccumulator()
{
    if ( !isdefined( self.damageaccumulator ) )
    {
        self.damageaccumulator = spawnstruct();
        self.damageaccumulator.accumulateddamage = 0;
    }

    var_0 = scripts\mp\agents\karatemaster\karatemaster_tunedata::gettunedata();

    if ( !isdefined( self.damageaccumulator._id_A96A ) || gettime() > self.damageaccumulator._id_A96A + var_0.cdamageaccumulationcleartimems )
    {
        self.damageaccumulator.accumulateddamage = 0;
        self.damageaccumulator._id_A96A = 0;
    }

    if ( self.damageaccumulator.accumulateddamage == 0 )
        return undefined;

    return self.damageaccumulator;
}

cleardamageaccumulator()
{
    self.damageaccumulator.accumulateddamage = 0;
    self.damageaccumulator._id_A96A = 0;
}

ondamagefinished( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 )
{
    accumulatedamage( var_2, var_7 );
    _id_0F72::_id_C5CE( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 );
}

_id_C4E0( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( scripts\engine\utility::_id_9CEE( self.ishidden ) )
        return;

    [[ level.on_zombie_damaged_func ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

should_spawn_karatemaster()
{
    if ( scripts\engine\utility::_id_6E34( "rk_fight_started" ) && scripts\engine\utility::_id_6E25( "rk_fight_started" ) )
        return undefined;

    var_0 = 0;

    if ( level._id_13BD3 >= 20 )
        var_0 = min( level._id_13BD3 - 19, 10 );
    else if ( level._id_13BD3 < 10 )
        return undefined;

    var_1 = 5;

    if ( getdvarint( "scr_force_karatemaster_spawn", 0 ) == 1 )
    {
        var_1 = 0;
        var_0 = 100;
    }

    if ( getdvarint( "scr_force_no_karatemaster_spawn", 0 ) == 1 )
    {
        var_1 = 500;
        var_0 = 0;
    }

    if ( level._id_13BD3 > var_1 )
    {
        if ( randomint( 100 ) < var_0 )
            return "karatemaster";

        return undefined;
    }

    return undefined;
}
