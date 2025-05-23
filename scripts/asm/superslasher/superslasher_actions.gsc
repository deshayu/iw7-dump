// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

superslasher_domeleedamage()
{
    var_0 = 60;

    if ( isdefined( self._id_0233 ) )
        var_1 = 36864;
    else
        var_1 = 25600;

    var_2 = 72;
    var_3 = 0.707;
    var_4 = 5184;
    var_5 = 0.174;
    var_6 = anglestoforward( self.angles );

    foreach ( var_8 in level.players )
    {
        if ( !isalive( var_8 ) )
            continue;

        var_9 = var_8.origin - self.origin;
        var_10 = lengthsquared( var_9 );

        if ( var_10 > var_1 )
            continue;

        if ( abs( var_9[2] ) > var_2 )
            continue;

        var_11 = ( var_9[0], var_9[1], 0 );
        var_9 = vectornormalize( var_11 );
        var_12 = vectordot( var_9, var_6 );

        if ( var_10 < var_4 )
        {
            if ( var_12 < var_5 )
                continue;
        }
        else if ( var_12 < var_3 )
            continue;

        _id_0C73::_id_5904( var_8, 0.8 * var_8.maxhealth, "MOD_IMPACT" );
        var_13 = 20;

        if ( !self isonground() )
            var_13 = var_13 * 0.05;

        var_14 = vectornormalize( var_8.origin + ( 0, 0, 45 ) - self.origin );
        var_15 = var_14 * var_13 * 10;
        var_8 _meth_8366( var_15 );
    }
}

superslasher_dogroundpoundimpact()
{
    self _meth_8253( self.origin, 256, 90, 90, self, "MOD_IMPACT" );
    self setscriptablepartstate( "groundpound", "on" );
}

superslasher_summonminions( var_0 )
{
    self setscriptablepartstate( "summon_minions", "on" );

    if ( var_0 == "ground" )
        dogenericsummons( self.nextsummonid, var_0, 1.5, undefined );
    else
        dowallsummon( self.nextsummonid, var_0 );

    self.nextsummonid++;
}

dogenericsummons( var_0, var_1, var_2, var_3 )
{
    var_4 = [ ( -4479, 3951, -161 ), ( -4200, 4030, -164 ), ( -4340, 4527, -146 ), ( -4174, 4895, -144 ), ( -4186, 5220, -154 ), ( -4261, 5478, -160 ), ( -4437, 5668, -150 ), ( -4805, 5547, -134 ), ( -4829, 5045, -140 ), ( -5111, 4425, -67 ), ( -4469, 4789, -151 ), ( -4642, 4542, -156 ) ];
    var_5 = [ 130, 146, 160, 193, 163, 205, 238, 266, 291, 12, 237, 85 ];

    if ( !isdefined( self.spawnwave ) )
        self.spawnwave = 0;

    var_6 = min( self.spawnwave, 10 );
    self.spawnwave++;
    var_7 = [];

    for ( var_8 = 0; var_8 < var_4.size; var_8++ )
        var_7[var_7.size] = var_8;

    var_9 = scripts\engine\utility::_id_22A7( var_7 );
    var_10 = var_9.size;

    if ( var_1 == "ground" )
        var_10 = 8;

    summontracker_init( var_0, var_10, var_3 );

    if ( var_2 <= 0 )
        var_2 = 0.05;
}

dowallsummon( var_0, var_1 )
{
    thread dowalls( var_0 );
    wait 0.1;
    dogenericsummons( var_0, var_1, 0.05, ::wallsummon_allguysdead );
}

summontracker_init( var_0, var_1, var_2 )
{
    if ( !isdefined( self.summontracker ) )
        self.summontracker = [];

    var_3 = spawnstruct();
    var_3.guysremaining = var_1;
    var_3.fnallguysdead = var_2;
    self.summontracker[var_0] = var_3;
}

summontracker_decrement( var_0 )
{
    if ( !isdefined( self ) )
        return;

    var_1 = self.summontracker[var_0];
    var_1.guysremaining--;

    if ( var_1.guysremaining == 0 )
    {
        if ( isdefined( var_1.fnallguysdead ) )
            self [[ var_1.fnallguysdead ]]( var_0 );

        self.summontracker[var_0] = undefined;
    }
}

summoned_waitfordeath( var_0, var_1 )
{
    var_1 waittill( "death" );
    summontracker_decrement( var_0 );
}

wallsummon_allguysdead( var_0 )
{
    self notify( "wallSummonComplete_" + var_0 );
}

dowalls( var_0 )
{

}

dowall( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    level endon( "game_ended" );
}

dowall_waitfortimeordone( var_0, var_1 )
{
    self endon( "wallSummonComplete_" + var_0 );
    wait( var_1 );
}

checkwallsummondamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "killWallSummon_" + var_0 );
    level endon( "game_ended" );
    var_7 = 100;
    var_8 = var_7 / 1000;
    var_9 = var_5;

    for (;;)
    {
        var_9 = var_9 - var_7;

        if ( var_9 <= 0 )
            break;

        var_10 = ( var_5 - var_9 ) / var_5;
        var_11 = var_1 + var_4 * var_10 * var_3;

        foreach ( var_13 in level.players )
        {
            if ( isalive( var_13 ) && var_13 getstance() != "prone" )
            {
                var_14 = var_13.origin - var_11;
                var_15 = vectordot( var_14, var_3 );

                if ( abs( var_15 ) < var_6 )
                {
                    var_16 = var_13.origin - var_15 * var_3;
                    var_13 _meth_80B0( 0.75 * var_13.maxhealth, var_16, self, self, "MOD_IMPACT" );
                }
            }
        }

        wait( var_8 );
    }
}

superslasher_domaskchange( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    var_2 = 3;
    var_0 = var_0 % var_2;
    thread domaskfx( var_0 );
    wait 3;
    thread domaskattack( var_0, var_1 );
}

domaskattack( var_0, var_1 )
{
    switch ( var_0 )
    {
        case 0:
            domaskshockwave( var_1 );
            break;
        case 1:
            domaskwires();
            break;
        case 2:
            dosawsharks( var_1 );
            break;
    }
}

domaskfx( var_0 )
{
    self setscriptablepartstate( "maskchange_" + var_0, "on" );
}

domaskshockwave( var_0 )
{
    level endon( "game_ended" );
    var_1 = var_0 == "roof";
    var_2 = self.origin;

    if ( var_1 )
        var_2 = ( -5092, 4644, -129 );

    var_3 = 30;
    var_4 = 5;
    var_5 = 1;
    var_6 = 3;
    playloopsound( ( -6061, 4944, 596 ), "superslasher_shockwave_wind_build" );
    playloopsound( ( -4818, 4858, 13 ), "superslasher_shockwave_plr_build" );
    scripts\engine\utility::_id_69A3( 101 );
    scripts\engine\utility::_id_69A3( 102 );
    scripts\cp\maps\cp_rave\cp_rave_super_slasher_fight::set_zombie_spawning_parameters( "continuous", 999999, 2, 0.05, "shockwave", "skeleton" );
    wait( var_6 );
    var_7 = thread scripts\engine\utility::_id_CD86( "superslasher_shockwave_plr_lp", ( -4818, 4858, 13 ) );
    var_8 = shock_wave_wind_sfx();
    scripts\cp\maps\cp_rave\cp_rave_super_slasher_fight::kill_off_existing_zombies();
    var_9 = int( var_3 / var_4 );
    var_10 = int( var_4 / var_5 );

    for ( var_11 = 0; var_11 < var_9; var_11++ )
    {
        scripts\engine\utility::_id_69A3( 100 );

        for ( var_12 = 0; var_12 < var_10; var_12++ )
        {
            foreach ( var_14 in level.players )
            {
                if ( playerinanysafearea( var_14 ) )
                    continue;

                if ( _id_0A5B::_id_D0EF( var_14 ) )
                    continue;

                var_14 _meth_80B0( 0.3 * var_14.maxhealth, var_2 );
            }

            wait( var_5 );
        }
    }

    level thread stop_wind_fire_sfxs( var_8 );
    var_7 stoploopsound();
    playloopsound( ( -4818, 4858, 13 ), "superslasher_shockwave_plr_end" );
    self._id_1198.bstoptauntingcontinuously = 1;
    scripts\cp\maps\cp_rave\cp_rave_super_slasher_fight::set_zombie_spawning_parameters( "continuous", 999999, 0.2, 0.05, "near_player", "generic_zombie" );

    if ( self.fight_round < 3 )
        level thread scripts\cp\maps\cp_rave\cp_rave_super_slasher_fight::soul_collection_sequence();
}

shock_wave_wind_sfx()
{
    var_0 = [];
    var_1 = [];
    var_1[0] = ( -4949, 4725, -99 );
    var_1[1] = ( -4274, 4711, -99 );
    var_1[2] = ( -5051, 3906, -99 );
    var_1[3] = ( -4005, 3854, -99 );
    var_1[4] = ( -4747, 5478, -99 );
    var_1[5] = ( -4005, 5717, -99 );
    var_1[6] = ( -4947, 6070, -99 );
    var_1[7] = ( -4681, 6521, -99 );
    var_1[8] = ( -3436, 4168, -99 );
    var_1[9] = ( -3543, 5167, -99 );
    var_1[10] = ( -4076, 6086, -99 );

    foreach ( var_3 in var_1 )
    {
        var_4 = scripts\engine\utility::_id_CD86( "superslasher_shockwave_wind_lp", var_3 );
        var_0[var_0.size] = var_4;
        var_4 playsound( "superslasher_shockwave_wind_start" );
    }

    return var_0;
}

stop_wind_fire_sfxs( var_0 )
{
    foreach ( var_2 in var_0 )
        var_2 thread stop_wind_fire_sfx( var_2 );
}

stop_wind_fire_sfx( var_0 )
{
    var_0 playsound( "superslasher_shockwave_wind_end" );
    wait 0.5;
    var_0 stoploopsound();
    wait 4.0;
    var_0 delete();
}

playerinanysafearea( var_0 )
{
    var_1 = [ ( -4542, 3598, -175 ), ( -4490, 4148, -158 ), ( -3587, 4597, -145 ), ( -4303, 5204, -148 ), ( -4422, 6003, -146 ) ];
    var_2 = [ 40000, 40000, 40000, 44100, 40000 ];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( distance2dsquared( var_1[var_3], var_0.origin ) <= var_2[var_3] )
        {
            var_4 = getentarray( "superslasher_shockwave_safe_area", "targetname" );

            foreach ( var_6 in var_4 )
            {
                if ( ispointinvolume( var_1[var_3], var_6 ) )
                {
                    var_0.super_slasher_shockwave_safe_area = var_6;
                    return 1;
                }
            }
        }
    }

    return 0;
}

domaskwires()
{
    level endon( "game_ended" );
    level endon( "stop_wire_attack" );
    self._id_1198.bwired = 1;

    if ( !isdefined( level.superslasher.fight_round ) )
        return;

    if ( level.superslasher.fight_round == 1 )
        return;

    var_0 = 1;

    if ( level.superslasher.fight_round == 2 )
        var_0 = level.players.size;
    else
        var_0 = 4;

    for ( var_1 = 1; var_1 <= var_0; var_1++ )
        scripts\cp\maps\cp_rave\cp_rave_super_slasher_fight::activate_super_slasher_barrier( var_1 );
}

stopwireattack()
{
    level notify( "stop_wire_attack" );
    self._id_1198.bwired = undefined;
}

dogroundjumpattackfx( var_0 )
{
    level endon( "game_ended" );
    var_1 = allocattackent();
    var_1 setattackentorigin( var_0 );
    var_1 setscriptablepartstate( "attack", "jumptarget" );
    self.jumpattackent = var_1;
}

groundjumpattackfxcleanup()
{
    if ( isdefined( self.jumpattackent ) )
    {
        self.jumpattackent setscriptablepartstate( "attack", "off" );
        freeattackent( self.jumpattackent );
        self.jumpattackent = undefined;
    }
}

superslasher_dosummonedsawblades()
{
    var_0 = spawnstruct();
    var_0._id_02C5 = ( -5225, 5716, 20 );
    var_0._id_6378 = ( -4087, 3870, -160 );
    var_0.totaltime = 5000;
    var_0.radius = 48;
    var_0.bvertical = 1;
    thread superslasher_dosawblade( var_0 );
    var_0 = spawnstruct();
    var_0._id_02C5 = ( -5687, 3968, 57 );
    var_0._id_6378 = ( -3717, 5209, -203 );
    var_0.totaltime = 5000;
    var_0.radius = 48;
    var_0.bvertical = 1;
    thread superslasher_dosawblade( var_0 );
}

superslasher_dosawfan()
{
    var_0 = 12;
    var_1 = 360 / var_0;
    var_2 = 1500;

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        var_4 = rotatevector( ( 1, 0, 0 ), ( 0, var_1 * var_3, 0 ) );
        var_5 = spawnstruct();
        var_5._id_02C5 = self.origin + var_4 * 40 + ( 0, 0, 48 );
        var_5._id_6378 = var_5._id_02C5 + var_4 * var_2;
        var_5.totaltime = 3000;
        var_5.radius = 48;
        var_5.bvertical = 0;
        thread superslasher_dosawblade( var_5 );

        if ( var_3 % 4 == 0 )
            wait 0.05;
    }
}

superslasher_dosawblade( var_0 )
{
    magicbullet( "zmb_superslasher_sawblade", var_0._id_02C5, var_0._id_6378, self );
}

superslasher_dothrownsaw()
{
    var_0 = self gettagorigin( "j_wrist_ri" );

    if ( isdefined( self._id_1198.throwsawtarget ) )
        var_1 = self._id_1198.throwsawtarget.origin + ( 0, 0, 48 );
    else
        var_1 = self._id_1198.throwsawbackuptargetpos + ( 0, 0, 48 );

    var_2 = vectornormalize( var_1 - var_0 );
    var_3 = vectortoyaw( var_2 );
    var_4 = angleclamp180( var_3 - self.angles[1] );

    if ( var_4 >= 45 || var_4 <= -45 )
    {
        var_1 = self.origin + anglestoforward( self.angles ) * 768;
        var_2 = vectornormalize( var_1 - var_0 );
    }
}

superslasher_dostompattack( var_0 )
{
    level endon( "game_ended" );
    var_1 = 48;
    var_2 = 0.2;
    var_3 = 1024;

    if ( isdefined( var_0 ) )
        var_3 = var_0;

    var_4 = int( var_3 / ( var_1 * 2 ) );
    var_5 = ( var_3 - var_1 * 2 ) / ( var_4 - 1 );
    var_6 = anglestoforward( self.angles );
    var_7 = 50 + var_1;
    var_8 = self.origin + var_6 * var_7;

    for ( var_9 = 0; var_9 < var_4; var_9++ )
    {
        var_10 = var_8 + var_9 * var_5 * var_6;
        thread dosticks( var_10, var_1, 1000 );
        wait( var_2 );
    }
}

dosticks( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    var_15 = allocattackent();
    var_15 setattackentorigin( var_0 );
    var_15 setscriptablepartstate( "attack", "punjisticks" );
    wait( var_2 / 1000 );

    if ( isdefined( var_15 ) )
    {
        var_15 setscriptablepartstate( "attack", "off" );
        freeattackent( var_15 );
    }
}

dostickdamage( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    var_4 = var_2 * var_2;
    var_5 = 90;

    while ( var_3 > 0 )
    {
        foreach ( var_7 in level.players )
        {
            if ( isalive( var_7 ) )
            {
                if ( distance2dsquared( var_7.origin, var_1 ) < var_4 )
                    var_7 _meth_80B0( 0.9 * var_7.maxhealth, var_1, var_0, var_0, "MOD_IMPACT" );
            }
        }

        var_3 = var_3 - 50;
        wait 0.05;
    }
}

dosawsharks( var_0 )
{
    var_1 = level.players.size + 1;
    var_2 = self.origin;

    if ( var_0 == "roof" )
        var_2 = ( -4862, 4788, -138 );

    self.sawsharks = [];
    var_3 = spawnstruct();
    var_3.perplayer = [];

    foreach ( var_5 in level.players )
        var_3.perplayer[var_5 getentitynumber()] = 0;

    var_7 = ( 90, 0, 0 );
    var_8 = 40000;

    for ( var_9 = 0; var_9 < var_1; var_9++ )
    {
        var_10 = var_9 * 360 / var_1;
        var_11 = self.origin + rotatevector( var_7, ( 0, var_10, 0 ) );
        var_12 = spawnsawshark( var_11 );
        self.sawsharks[self.sawsharks.size] = var_12;

        if ( var_0 == "roof" )
            thread dosawshark_followtarget( var_12, var_3, undefined, var_2 + rotatevector( var_7, ( 0, var_10, 0 ) ), var_8 );
        else
            thread dosawshark_followowner( var_12, var_3, var_10, var_8 );

        scripts\engine\utility::waitframe();
    }
}

spawnsawshark( var_0 )
{
    var_1 = spawn( "script_model", var_0 );
    var_1 setmodel( "tag_origin" );
    var_1 thread delayplayingsawsharkvfx( var_1 );
    var_1 playsound( "superslasher_ground_saw_deploy_lr" );
    var_1 playloopsound( "superslasher_ground_saw_deploy_lp" );
    return var_1;
}

delayplayingsawsharkvfx( var_0 )
{
    var_0 endon( "death" );
    var_0 _meth_826D( 90, 0.05 );
    wait 0.2;
    playfxontag( level._effect["super_slasher_saw_shark_spark"], var_0, "tag_origin" );
}

killallsharks( var_0 )
{
    if ( isdefined( var_0.sawsharks ) )
    {
        foreach ( var_2 in var_0.sawsharks )
        {
            if ( isdefined( var_2 ) )
                deletesawshark( var_2 );
        }
    }
}

deletesawshark( var_0 )
{
    playfx( level._effect["super_slasher_saw_shark_hit"], var_0.origin );
    playloopsound( var_0.origin, "superslasher_ground_saw_explode" );
    var_0 delete();
}

updatesawsharkposandangles( var_0, var_1, var_2 )
{
    var_3 = 90;
    var_0.origin = var_1;
    var_0.angles = ( var_2[0], var_2[1], var_3 );
}

getclosesttargetableplayerwithinwithlos( var_0, var_1, var_2 )
{
    var_3 = getclosestpointonnavmesh( var_1 );
    var_4 = undefined;
    var_5 = var_2 * var_2;

    foreach ( var_7 in level.players )
    {
        if ( !isalive( var_7 ) )
            continue;

        if ( var_0.perplayer[var_7 getentitynumber()] >= 2 )
            continue;

        var_8 = distance2dsquared( var_7.origin, var_1 );

        if ( var_8 < var_5 )
        {
            var_9 = getclosestpointonnavmesh( var_7.origin );

            if ( _func_2AC( var_3, var_9 ) )
            {
                var_5 = var_8;
                var_4 = var_7;
            }
        }
    }

    return var_4;
}

dosawshark_followowner( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "kill_sharks" );
    var_4 = ( 80, 0, -3 );
    var_5 = undefined;
    var_6 = undefined;

    while ( var_3 > 0 )
    {
        var_6 = self.origin + rotatevector( var_4, ( 0, var_2, 0 ) );
        var_5 = getclosesttargetableplayerwithinwithlos( var_1, var_6, 512 );

        if ( isdefined( var_5 ) )
            break;

        updatesawsharkposandangles( var_0, var_6, self.angles );
        var_3 = var_3 - 50;
        wait 0.05;
    }

    if ( isdefined( var_5 ) && var_3 > 0 )
        thread dosawshark_followtarget( var_0, var_1, var_5, var_6, var_3 );
    else
        deletesawshark( var_0 );
}

dosawshark_followtarget( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_5 = var_3;
    var_6 = undefined;
    var_7 = 8;
    var_8 = 4;
    var_9 = 32;

    if ( isdefined( var_2 ) )
    {
        var_6 = vectortoyaw( var_2.origin - var_5 );
        var_10 = var_2 getentitynumber();

        if ( isdefined( var_1.perplayer[var_10] ) )
            var_1.perplayer[var_10]++;
    }

    var_11 = scripts\engine\trace::_id_48CC( 1 );

    while ( var_4 > 0 )
    {
        if ( !isdefined( var_2 ) || !isalive( var_2 ) )
        {
            var_2 = getclosesttargetableplayerwithinwithlos( var_1, var_5, 512 );

            if ( isdefined( var_2 ) )
            {
                var_6 = vectortoyaw( var_2.origin - var_5 );
                var_1.perplayer[var_2 getentitynumber()]++;
            }
        }

        if ( isdefined( var_2 ) )
        {
            var_12 = var_2.origin - var_5;
            var_13 = vectortoyaw( var_12 );
            var_14 = angleclamp180( var_13 - var_6 );
            var_14 = clamp( var_14, -1 * var_8, var_8 );
            var_6 = angleclamp180( var_6 + var_14 );
            var_15 = var_5 + rotatevector( ( var_7, 0, 0 ), ( 0, var_6, 0 ) );

            if ( _func_2AC( var_5, var_15 ) )
            {
                var_16 = scripts\engine\trace::_id_DCED( var_15 + ( 0, 0, 24 ), var_15 - ( 0, 0, 24 ), undefined, var_11 );
                var_5 = var_16["position"];

                if ( distance2dsquared( var_5, var_2.origin ) < var_9 * var_9 )
                {
                    var_2 _meth_80B0( 0.8 * var_2.maxhealth, var_5, self, self, "MOD_IMPACT" );
                    break;
                }
            }
            else
                break;

            updatesawsharkposandangles( var_0, var_5, vectortoangles( var_2.origin - var_5 ) );
        }

        var_4 = var_4 - 50;
        wait 0.05;
    }

    deletesawshark( var_0 );
}

allocattackent()
{
    if ( !isdefined( self.attackents ) )
        self.attackents = [];

    var_0 = undefined;

    foreach ( var_2 in self.attackents )
    {
        if ( !var_2.binuse )
        {
            var_0 = var_2;
            break;
        }
    }

    if ( !isdefined( var_0 ) )
    {
        var_0 = spawn( "script_model", self.origin );
        var_0 setmodel( "superslasher_attack_origin" );
        self.attackents[self.attackents.size] = var_0;
    }

    var_0.binuse = 1;
    return var_0;
}

setattackentorigin( var_0 )
{
    self.origin = var_0;
    self dontinterpolate();
}

freeattackent( var_0 )
{
    var_0.binuse = 0;
}
