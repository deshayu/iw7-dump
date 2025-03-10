// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_DF0C()
{
    scripts\aitypes\bt_util::init();
    behaviortree\slasher::_id_DEE8();
    scripts\asm\slasher\mp\states::_id_2371();
    scripts\mp\agents\slasher\slasher_tunedata::setuptunedata();
    thread _id_FAB0();
}

_id_FAB0()
{
    level endon( "game_ended" );

    if ( !isdefined( level._id_18EE ) )
        level waittill( "scripted_agents_initialized" );

    level._id_18EE["slasher"]["setup_func"] = ::_id_FA8A;
    level._id_18EE["slasher"]["setup_model_func"] = ::_id_FACE;
    level.agent_funcs["slasher"]["on_damaged_finished"] = ::onslasherdamagefinished;
    level.agent_funcs["slasher"]["on_killed"] = ::onslasherkilled;
}

_id_FACE( var_0 )
{
    var_1 = getdvar( "ui_mapname" );

    if ( var_1 == "cp_final" )
        self setmodel( "body_final_slasher" );
    else
        self setmodel( "body_zmb_slasher" );

    self attach( "head_zmb_slasher" );
    self attach( "weapon_zmb_slasher_vm", "tag_weapon_right" );
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

    if ( getdvarint( "scr_zombie_left_foot_sharp_turn_only", 0 ) == 1 )
        self._id_AB3F = 1;
}

_id_FA8A()
{
    setupzombiegametypevars();
    self.height = self._id_18F4;
    self.radius = self._id_18F9;
    self._id_9341 = 1;
    self._id_B62D = 70;
    self._id_B62E = 70;
    self._id_B631 = 80;
    self._id_B62F = squared( self._id_B62E );
    self._id_503C = self.radius + 1;
    self._id_B607 = 0.5;
    self._id_B601 = 45;
    self.meleeattackchance["melee_spin"] = 10;
    self.meleeattackchance["ground_pound"] = 30;
    self.meleeattackchance["swipe_attack"] = 100;
    self._id_504E = 55;
    self._id_129AF = 55;
    self._id_0368 = -60;
    self._id_0100 = 60;
    self._id_0166 = "slasher_grenade_zm";
    self._id_0162 = 999;
    self.ground_pound_damage = 50;
    self._id_013C = 2500;
    self._id_013E = 2500;
    self._id_013D = 2500;
    self._id_71D0 = ::shouldslasherplaypainanim;
    self._id_0180 = 1;
    var_0 = getdvar( "ui_mapname" );

    if ( var_0 != "cp_final" )
        self _meth_85B7( 1 );

    if ( isdefined( level.slasher_level ) )
    {
        if ( level._id_13BD3 < 30 && level._id_13BD3 > 19 && level.slasher_level < 3 )
            level.slasher_level = 2;
        else if ( level._id_13BD3 > 29 )
            level.slasher_level = 3;
    }

    thread turn_on_saw_blade_after_time( 5 );
    thread listen_for_fake_death();
}

turn_on_saw_blade_after_time( var_0 )
{
    self endon( "death" );
    wait( var_0 );
    self setscriptablepartstate( "slasher_saw", "active" );
    var_1 = getdvar( "ui_mapname" );

    if ( var_1 == "cp_final" )
        return;

    if ( isdefined( level.slasher_level ) )
    {
        switch ( level.slasher_level )
        {
            case 1:
                self setscriptablepartstate( "mask", "blue_mask" );
                break;
            case 2:
                self setscriptablepartstate( "mask", "yellow_mask" );
                break;
            case 3:
                self setscriptablepartstate( "mask", "green_mask" );
                break;
            default:
                break;
        }
    }
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
    self.damageaccumulator.accumulateddamage = self.damageaccumulator.accumulateddamage + var_0;
}

isinravemode()
{
    if ( self _meth_85B8() )
        return 1;

    return 0;
}

onslasherdamagefinished( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 )
{
    var_13 = var_2;

    if ( var_5 == "iw7_harpoon_zm" )
    {
        var_2 = min( 0.1 * self.maxhealth, 2000 );
        var_2 = int( var_2 );
    }
    else if ( issubstr( var_5, "harpoon1" ) )
    {
        var_2 = min( 0.01 * self.maxhealth, 100 );
        var_2 = int( var_2 );
    }
    else if ( issubstr( var_5, "harpoon2" ) )
    {
        var_2 = min( 0.1 * self.maxhealth, 1500 );
        var_2 = int( var_2 );
    }
    else if ( issubstr( var_5, "harpoon3" ) )
    {
        var_2 = min( 0.1 * self.maxhealth, 1500 );
        var_2 = int( var_2 );
    }
    else if ( issubstr( var_5, "harpoon4" ) )
    {
        var_2 = min( 0.01 * self.maxhealth, 1000 );
        var_2 = int( var_2 );
    }

    if ( isdefined( var_5 ) && var_5 == "iw7_slasher_zm" )
    {
        var_2 = var_2 * 0.1;
        var_2 = int( var_2 );
    }
    else
    {
        if ( isinravemode() || scripts\engine\utility::_id_9CEE( var_1._id_DCEB ) )
            var_2 = 0;

        if ( scripts\asm\asm::_id_2354( "block" ) )
        {
            var_2 = var_2 * 0.1;
            var_2 = int( var_2 );
        }
    }

    if ( isdefined( level.players ) && level.players.size > 1 )
    {
        if ( var_2 != 0 )
        {
            var_14 = int( var_2 / ( level.players.size + 1 ) );
            var_2 = int( max( var_14, 1 ) );
        }
    }

    if ( var_2 > 0 )
        accumulatedamage( var_2, var_7 );

    if ( isdefined( self.nodamagescale ) )
        var_2 = var_13;

    slasher_on_damage_finished( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, 0.0, var_11, var_12 );
}

slasher_on_damage_finished( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 )
{
    var_13 = self.health;

    if ( isdefined( var_7 ) )
    {
        var_14 = vectortoyaw( var_7 );
        var_15 = self.angles[1];
        self._id_00E3 = angleclamp180( var_14 - var_15 );
    }
    else
        self._id_00E3 = 0;

    self._id_00DD = var_8;
    self._id_00DE = var_4;
    self._id_4D3F = var_1;
    self._id_00DC = var_7;
    self._id_00E1 = var_2;
    self._id_00E2 = var_5;
    self._id_4D62 = var_6;

    if ( var_2 >= self.health )
    {
        var_2 = 0;

        if ( isdefined( var_5 ) && var_5 == "iw7_slasher_zm" )
            var_1 notify( "slasher_killed_by_own_weapon", var_1, var_5 );

        self notify( "fake_death" );
    }

    self finishagentdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, 0.0, var_11, var_12, 0, 1 );

    if ( self.health > 0 && self.health < var_13 )
        self notify( "pain" );

    if ( isalive( self ) && isdefined( self.agent_type ) )
    {
        var_16 = level.agent_funcs[self.agent_type]["gametype_on_damage_finished"];

        if ( isdefined( var_16 ) )
            [[ var_16 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 );
    }
}

onslasherkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self _meth_8096( "weapon_zmb_slasher_vm", "tag_weapon_right" );
    self._id_C026 = 1;
    scripts\mp\mp_agent::_id_5006( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

getslashergrenadehandoffset()
{
    return ( 12, 12, 100 );
}

getslasherhandposition()
{
    return self localtoworldcoords( self.origin + ( 12, 12, 100 ) );
}

shouldslasherplaypainanim()
{
    return 0;
}

getenemy()
{
    if ( isdefined( self.slasherenemy ) )
        return self.slasherenemy;

    return undefined;
}

lookatslasherenemy()
{
    var_0 = getenemy();

    if ( isdefined( var_0 ) )
    {
        var_1 = var_0.origin - self.origin;
        var_2 = vectortoangles( var_1 );
        self orientmode( "face angle abs", var_2 );
    }
    else
        self orientmode( "face angle abs", self.angles );
}

listen_for_fake_death()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "fake_death" );

        if ( !scripts\engine\utility::_id_9CEE( level.slasher_fight ) )
        {
            self._id_0180 = 1;
            self setscriptablepartstate( "teleport", "hide" );
            wait 0.1;
            self hide();
            wait 0.1;
            self suicide();
        }
    }
}
