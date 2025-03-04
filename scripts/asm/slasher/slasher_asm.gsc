// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

slasherinit( var_0, var_1, var_2, var_3 )
{
    _id_0C75::_id_13F9A( var_0, var_1, var_2, var_3 );
    self._id_71D0 = scripts\mp\agents\slasher\slasher_agent::shouldslasherplaypainanim;
    self setscriptablepartstate( "slasher_audio", "normal" );
}

isvalidslasheraction( var_0 )
{
    switch ( var_0 )
    {
        case "grenade_throw":
        case "melee_spin":
        case "swipe_attack":
        case "block":
        case "ram_attack":
        case "sawblade_attack":
        case "summon":
        case "teleport":
        case "ground_pound":
        case "taunt":
            return 1;
    }

    return 0;
}

setslasheraction( var_0 )
{
    self.requested_action = var_0;
}

clearslasheraction()
{
    self.requested_action = undefined;
}

issawbladeattackdone( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self.requested_action ) )
        return 1;

    if ( self.requested_action != "sawblade_attack" )
        return 1;

    return 0;
}

shouldendblock( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self.requested_action ) || self.requested_action != "block" )
        return 1;

    return 0;
}

shouldshootsawblade( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self.requested_action ) )
        return 0;

    if ( !scripts\asm\asm_bb::_id_291C() )
        return 0;

    return 1;
}

shouldstopshootingsawblade( var_0, var_1, var_2, var_3 )
{
    return !shouldshootsawblade( var_0, var_1, var_2, var_3 );
}

shouldplayentranceanim( var_0, var_1, var_2, var_3 )
{
    return 0;
}

playanimandlookatenemy( var_0, var_1, var_2, var_3 )
{
    thread _id_0C73::_id_6A6A( var_1, scripts\mp\agents\slasher\slasher_agent::getenemy() );
    var_4 = scripts\asm\asm_mp::_id_2337( var_0, var_1 );
    scripts\asm\asm_mp::_id_2365( var_0, var_1, var_2, var_4, 1 );
}

isanimdone( var_0, var_1, var_2, var_3 )
{
    if ( scripts\asm\asm::_id_232B( var_1, "end" ) )
        return 1;

    if ( scripts\asm\asm::_id_232B( var_1, "early_end" ) )
        return 1;

    if ( scripts\asm\asm::_id_232B( var_1, "finish_early" ) )
        return 1;

    if ( scripts\asm\asm::_id_232B( var_1, "code_move" ) )
        return 1;

    return 0;
}

playtauntanim( var_0, var_1, var_2, var_3 )
{
    self notify( "taunt" );
    thread _id_0C73::_id_6A6A( var_1, scripts\mp\agents\slasher\slasher_agent::getenemy() );
    scripts\asm\asm_mp::_id_2364( var_0, var_1, var_2, var_3 );
}

dosummonspawn()
{

}

dogroundpounddamage( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
        self endon( var_0 + "_finished" );

    if ( isdefined( var_1 ) )
        wait( var_1 );

    var_2 = scripts\mp\agents\slasher\slasher_tunedata::gettunedata();

    foreach ( var_4 in level.players )
    {
        if ( isalive( var_4 ) )
        {
            if ( distancesquared( self.origin, var_4.origin ) < var_2.ground_pound_damage_radius_sq )
                _id_0C73::_id_5904( var_4, self.ground_pound_damage, "MOD_IMPACT" );
        }
    }
}

groundpoundnotehandler( var_0, var_1, var_2, var_3 )
{
    if ( var_0 == "groundpound" )
        dogroundpounddamage();
}

playgroundpound( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    thread dogroundpounddamage( var_1, 0.75 );
    scripts\asm\asm_mp::_id_2364( var_0, var_1, var_2, var_3 );
}

summonnotehandler( var_0, var_1, var_2, var_3 )
{
    if ( var_0 == "start_summon_zombies" )
        dosummonspawn();
}

meleenotehandler( var_0, var_1, var_2, var_3 )
{
    if ( var_0 == "hit" )
    {
        var_4 = scripts\mp\agents\slasher\slasher_agent::getenemy();

        if ( isdefined( var_4 ) )
        {
            if ( distancesquared( var_4.origin, self.origin ) < 40000 )
            {
                self notify( "attack_hit", var_4 );
                _id_0C73::_id_5904( var_4, self._id_B601, "MOD_IMPACT" );
            }
            else
                self notify( "attack_miss", var_4 );
        }

        if ( !scripts\engine\utility::_id_9CEE( self.bmovingmelee ) )
        {
            self notify( "stop_melee_face_enemy" );
            return;
        }
    }
    else if ( var_0 == "spin_attack_damage_begin" )
        thread startspinattackdamage( var_1 );
    else if ( var_0 == "spin_attack_damage_end" )
        stopspinattackdamage();
}

shouldstartramanim( var_0, var_1, var_2, var_3 )
{
    if ( scripts\asm\asm_bb::_id_2953( var_0, var_1, var_2, var_3 ) )
        return 1;

    return 0;
}

_id_100AD( var_0, var_1, var_2, var_3 )
{
    if ( !scripts\asm\asm_bb::_id_298A() )
        return 0;

    return 1;
}

_id_2481( var_0, var_1, var_2 )
{
    self attach( var_1, var_2 );
    thread _id_5392( var_0, var_1, var_2 );
    return var_2;
}

_id_5392( var_0, var_1, var_2 )
{
    self endon( "stop grenade check" );
    self waittill( var_0 + "_finished" );

    if ( !isdefined( self ) )
        return;

    self _meth_8096( var_1, var_2 );
}

grenadethrownotehandler( var_0, var_1, var_2, var_3 )
{
    switch ( var_0 )
    {
        case "grenade_right":
        case "grenade_left":
            break;
        case "grenade_throw":
            if ( scripts\engine\utility::_id_9CEE( self.grenade_thrown ) )
                return;

            self.grenade_thrown = 1;
            self notify( "stop grenade check" );
            var_4 = scripts\asm\asm_bb::_id_2930();

            if ( isdefined( var_4 ) )
            {
                var_5 = self._id_01B2;
                var_6 = self _meth_806C( scripts\mp\agents\slasher\slasher_agent::getslashergrenadehandoffset(), var_5, 0, "min time", "min energy" );

                if ( isdefined( var_6 ) )
                {
                    self _meth_83C2();
                    scripts\asm\asm::_id_232F( "grenade_throw", "thrown" );
                }
                else if ( isdefined( self.enemygrenadepos ) )
                {
                    var_6 = self _meth_806C( scripts\mp\agents\slasher\slasher_agent::getslashergrenadehandoffset(), self.enemygrenadepos, 0, "min time", "min energy" );

                    if ( isdefined( var_6 ) )
                    {
                        self _meth_83C2();
                        scripts\asm\asm::_id_232F( "grenade_throw", "thrown" );
                    }
                }
            }

            break;
    }
}

playgrenadethrowanim( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    scripts\mp\agents\slasher\slasher_agent::lookatslasherenemy();
    scripts\asm\asm_mp::_id_2364( var_0, var_1, var_2, var_3 );
}

grenadethrowterminate( var_0, var_1, var_2 )
{
    self.grenade_thrown = undefined;
}

shouldabortaction( var_0, var_1, var_2, var_3 )
{
    if ( scripts\engine\utility::_id_9CEE( self.btraversalteleport ) )
        return 0;

    if ( !isdefined( self.requested_action ) )
        return 1;

    if ( isdefined( var_3 ) )
    {
        if ( self.requested_action != var_3 )
            return 1;
    }

    return 0;
}

shoulddoaction( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self.requested_action ) )
        return 0;

    if ( self.requested_action == var_2 )
        return 1;

    return 0;
}

firebladeburst( var_0, var_1, var_2 )
{
    self endon( var_0 + "_finished" );
    var_3 = scripts\mp\agents\slasher\slasher_tunedata::gettunedata();
    var_4 = randomintrange( var_3.min_burst_count, var_3.max_burst_count );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
    {
        var_6 = ( randomfloatrange( var_3.sawblade_min_offset, var_3.sawblade_max_offset ), randomfloatrange( var_3.sawblade_min_offset, var_3.sawblade_max_offset ), randomfloatrange( var_3.sawblade_min_offset, var_3.sawblade_max_offset ) );
        var_7 = magicbullet( "iw7_slasher_sawblade_mp", var_1, var_2 + var_6, self );
        var_8 = getdvar( "ui_mapname" );

        if ( var_8 != "cp_final" )
            var_7 thread hide_and_show_blade();

        wait( var_3.sawblade_burst_interval );
    }
}

fireblades( var_0 )
{
    self endon( var_0 + "_finished" );
    wait 0.2;
    var_1 = scripts\mp\agents\slasher\slasher_tunedata::gettunedata();

    for (;;)
    {
        var_2 = scripts\mp\agents\slasher\slasher_agent::getenemy();

        if ( isdefined( var_2 ) && isdefined( self._id_01C2 ) )
        {
            var_3 = self gettagorigin( "j_wrist_ri" );
            var_4 = self._id_01C2;

            if ( randomint( 100 ) < var_1.sawblade_burst_chance )
            {
                self notify( "attack_shoot", var_2 );
                firebladeburst( var_0, var_3, var_4 );
            }
            else
            {
                var_5 = ( randomfloatrange( var_1.sawblade_min_offset, var_1.sawblade_max_offset ), randomfloatrange( var_1.sawblade_min_offset, var_1.sawblade_max_offset ), randomfloatrange( var_1.sawblade_min_offset, var_1.sawblade_max_offset ) );
                var_6 = magicbullet( "iw7_slasher_sawblade_mp", var_3, var_4 + var_5, self );
                var_7 = getdvar( "ui_mapname" );

                if ( var_7 != "cp_final" )
                    var_6 thread hide_and_show_blade();
            }

            var_8 = randomfloatrange( var_1.min_sawblade_fire_interval, var_1.max_sawblade_fire_interval );
            wait( var_8 );
            continue;
        }

        wait 0.1;
    }
}

hide_and_show_blade()
{
    level endon( "game_ended" );
    self endon( "death" );

    foreach ( var_1 in level.players )
    {
        if ( !scripts\engine\utility::_id_9CEE( var_1._id_DCEB ) )
            self _meth_8429( var_1 );
    }
}

shootsawblades( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    thread fireblades( var_1 );
    scripts\asm\asm_mp::_id_2364( var_0, var_1, var_2, var_3 );
}

playanimwithplaybackrate( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    var_4 = var_3;
    var_5 = scripts\asm\asm_mp::_id_2337( var_0, var_1 );
    scripts\asm\asm_mp::_id_2365( var_0, var_1, var_2, var_5, var_4 );
}

playblockanim( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    var_4 = vectortoangles( self.damageaccumulator.lastdir * -1 );
    var_4 = ( 0, var_4[1], 0 );
    self orientmode( "face angle abs", var_4 );
    self _meth_8281( "anim deltas" );
    scripts\asm\asm_mp::_id_2364( var_0, var_1, var_2, var_3 );
}

_id_BEA0( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;
    var_5 = scripts\mp\agents\slasher\slasher_agent::getenemy();

    if ( isdefined( self._id_1198._id_FECD ) && isdefined( self._id_1198._id_FECD._id_65D3 ) )
        var_4 = self._id_1198._id_FECD._id_65D3.origin;
    else if ( isdefined( self._id_1198._id_FECD ) && isdefined( self._id_1198._id_FECD._id_D699 ) )
        var_4 = self._id_1198._id_FECD._id_D699;
    else if ( isdefined( var_5 ) )
        var_4 = var_5.origin;

    if ( !isdefined( var_4 ) )
        return 0;

    var_6 = self.angles[1] - vectortoyaw( var_4 - self.origin );
    var_7 = distancesquared( self.origin, var_4 );

    if ( var_7 < 65536 )
    {
        var_8 = sqrt( var_7 );

        if ( var_8 > 3 )
            var_6 = var_6 + atan( -3 / var_8 );
    }

    if ( abs( angleclamp180( var_6 ) ) > self._id_129AF )
        return 1;

    return 0;
}

_id_81DE()
{
    var_0 = 0.25;
    var_1 = undefined;
    var_2 = undefined;

    if ( isdefined( self._id_1198._id_FECD ) )
    {
        if ( isdefined( self._id_1198._id_FECD._id_65D3 ) )
            var_1 = self._id_1198._id_FECD._id_65D3;
        else if ( isdefined( self._id_1198._id_FECD._id_D699 ) )
            var_2 = self._id_1198._id_FECD._id_D699;
    }

    var_3 = scripts\mp\agents\slasher\slasher_agent::getenemy();

    if ( isdefined( var_3 ) )
    {
        if ( !isdefined( var_1 ) && !isdefined( var_2 ) )
            var_1 = var_3;
    }

    if ( isdefined( var_1 ) && !issentient( var_1 ) )
        var_0 = 1.5;

    var_4 = scripts\engine\utility::_id_8094( var_0, var_1, var_2 );
    return var_4;
}

_id_3F0A( var_0, var_1, var_2 )
{
    var_3 = _id_81DE();

    if ( var_3 < 0 )
        var_4 = "right";
    else
        var_4 = "left";

    var_3 = abs( var_3 );
    var_5 = 0;

    if ( var_3 > 157.5 )
        var_5 = 180;
    else if ( var_3 > 112.5 )
        var_5 = 135;
    else if ( var_3 > 67.5 )
        var_5 = 90;
    else
        var_5 = 45;

    var_6 = var_4 + "_" + var_5;
    var_7 = scripts\asm\asm::_id_2358( var_1, var_6 );
    var_8 = self _meth_8101( var_1, var_7 );
    return var_7;
}

_id_D56A( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    var_4 = scripts\asm\asm_mp::_id_2337( var_0, var_1 );
    var_5 = self._id_0233;
    self orientmode( "face angle abs", self.angles );
    self _meth_8281( "anim deltas" );
    scripts\asm\asm_mp::_id_2365( var_0, var_1, var_2, var_4 );

    if ( !isdefined( var_5 ) && isdefined( self._id_0233 ) )
        self _meth_841F();

    scripts\asm\asm_mp::_id_237F( "face current" );
    scripts\asm\asm_mp::_id_237E( "code_move" );
}

doramattackdamage( var_0 )
{
    var_0 endon( "death" );

    if ( scripts\engine\utility::_id_9CEE( self.bramattackdamageoccured ) )
        return;

    var_1 = vectornormalize( self _meth_816B() );
    var_2 = scripts\mp\agents\slasher\slasher_tunedata::gettunedata();
    self.bramattackdamageoccured = 1;
    var_0 _meth_84DC( var_1, var_2.ram_attack_push );
    wait 0.2;
    var_3 = int( var_2.ram_attack_damage / 100 * var_0.maxhealth );
    _id_0C73::_id_5904( var_0, var_3, "MOD_IMPACT" );
}

ramattacknotehandler( var_0, var_1, var_2, var_3 )
{
    if ( var_0 == "hit" )
    {
        if ( isdefined( self._id_4B26 ) )
        {
            var_4 = scripts\mp\agents\slasher\slasher_tunedata::gettunedata();
            var_5 = distancesquared( self.origin, self._id_4B26.origin );

            if ( var_5 < var_4.ram_attack_melee_dist_sq && _id_0C73::_id_9DD7( self._id_4B26, var_4.ram_attack_dot ) )
                thread doramattackdamage( self._id_4B26 );
        }
    }
}

handleramattackprocessing( var_0, var_1, var_2 )
{
    self endon( var_0 + "_finished" );

    if ( !isdefined( var_1 ) )
        return;

    self setscriptablepartstate( "slasher_audio", "charge" );
    var_3 = 1;
    var_4 = scripts\mp\agents\slasher\slasher_tunedata::gettunedata();
    self notify( "attack_charge" );

    for (;;)
    {
        var_5 = distance2dsquared( self.origin, var_1.origin );

        if ( var_3 && var_5 > var_4.ram_attack_go_straight_radius_sq )
        {
            var_6 = var_1 _meth_816B();
            var_7 = var_1.origin + var_6 * 0.15;
            var_8 = var_7 - self.origin;
            var_8 = ( var_8[0], var_8[1], 0 );
            var_8 = vectornormalize( var_8 );
            self orientmode( "face angle abs", vectortoangles( var_8 ) );
        }
        else if ( var_3 )
            var_3 = 0;

        if ( var_2 && var_5 < var_4.ram_attack_collision_dist_sq )
        {
            if ( _id_0C73::_id_9DD7( var_1, var_4.ram_attack_dot ) )
            {
                thread doramattackdamage( var_1 );
                break;
            }
        }

        scripts\engine\utility::waitframe();

        if ( !isdefined( var_1 ) || !isalive( var_1 ) )
            break;
    }

    self setscriptablepartstate( "slasher_audio", "normal" );
}

playramattackanim( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    thread handleramattackprocessing( var_1, self._id_4B26, 0 );
    playanimwithplaybackrate( var_0, var_1, var_2, var_3 );
    self setscriptablepartstate( "slasher_audio", "normal" );
}

playramattackloop( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    thread handleramattackprocessing( var_1, self._id_4B26, 1 );
    playanimwithplaybackrate( var_0, var_1, var_2, var_3 );
}

playmeleeattack( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    thread _id_0C73::_id_6A6A( var_1, self._id_4B26 );
    var_4 = scripts\asm\asm_mp::_id_2337( var_0, var_1 );
    scripts\asm\asm_mp::_id_2365( var_0, var_1, var_2, var_4 );
}

playmeleespinattack( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    thread _id_0C73::_id_6A6A( var_1, self._id_4B26 );
    var_4 = scripts\asm\asm_mp::_id_2337( var_0, var_1 );
    scripts\asm\asm_mp::_id_2365( var_0, var_1, var_2, var_4 );
}

startspinattackdamage( var_0 )
{
    self endon( var_0 + "_finished" );
    self endon( "StopSpinAttackDamage" );
    var_1 = [];
    var_2 = scripts\mp\agents\slasher\slasher_tunedata::gettunedata();

    for (;;)
    {
        var_3 = self gettagangles( "tag_eye" );
        var_3 = ( 0, var_3[1], 0 );
        var_4 = anglestoforward( var_3 );

        foreach ( var_6 in level.players )
        {
            if ( _id_0F74::_id_1002C( var_6 ) )
                continue;

            if ( !isalive( var_6 ) )
                continue;

            var_7 = distance2dsquared( var_6.origin, self.origin );

            if ( var_7 > var_2.slasher_spin_damage_range_sq )
                continue;

            var_8 = var_1[var_6 getentitynumber()];

            if ( isdefined( var_8 ) )
            {
                if ( gettime() - var_8 < 250 )
                    continue;
            }

            var_9 = abs( var_6.origin[2] - self.origin[2] );

            if ( var_9 > 64 )
                continue;

            var_10 = ( var_6.origin - self.origin ) * ( 1, 1, 0 );
            var_11 = vectornormalize( var_10 );
            var_12 = vectordot( var_11, var_4 );

            if ( var_12 < 0.966 )
                continue;

            var_1[var_6 getentitynumber()] = gettime();
            _id_0C73::_id_5904( var_6, var_2.slasher_spin_damage_amt, "MOD_IMPACT" );
        }

        scripts\engine\utility::waitframe();
    }
}

stopspinattackdamage()
{
    self notify( "StopSpinAttackDamage" );
}

slasherplaysharpturnanim( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    scripts\asm\asm::_id_237B( 1.5 );
    _id_0F3B::_id_D514( var_0, var_1, var_2, var_3 );
    scripts\asm\asm::_id_237B( 1.0 );
}

slashershouldstartarrival( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\mp\agents\slasher\slasher_agent::getenemy();

    if ( isdefined( var_4 ) )
    {
        var_5 = distancesquared( self.origin, var_4.origin );

        if ( var_5 < 65536 )
            return 0;
    }

    return _id_0C75::_id_10092( var_0, var_1, var_2, var_3 );
}

choosemeleeattack( var_0, var_1, var_2 )
{
    if ( scripts\asm\asm_bb::_id_2955() )
        var_3 = scripts\asm\asm::_id_2358( var_1, "attack_moving" );
    else
        var_3 = scripts\asm\asm::_id_2358( var_1, "attack" );

    return var_3;
}

_id_3EE4( var_0, var_1, var_2 )
{
    return _id_0F3C::_id_3EF4( var_0, var_1, var_2 );
}

playmovingpainanim( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );

    if ( !isdefined( self._id_0233 ) || self _meth_841E() < scripts\mp\agents\slasher\slasher_tunedata::gettunedata().min_moving_pain_dist )
    {
        var_4 = _id_3EE4( var_0, "pain_generic", var_3 );
        self orientmode( "face angle abs", self.angles );
        scripts\asm\asm_mp::_id_2365( var_0, "pain_generic", var_2, var_4, 1 );
        return;
    }

    scripts\asm\asm_mp::_id_2364( var_0, var_1, var_2, var_3 );
}

playteleportout( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    var_4 = scripts\asm\asm_mp::_id_2337( var_0, var_1 );
    var_5 = scripts\mp\agents\slasher\slasher_agent::getenemy();
    self setscriptablepartstate( "teleport", "hide" );

    if ( soundexists( "slasher_teleport_in" ) )
        play_teleport_sound_to_players( "slasher_teleport_in" );

    wait 0.1;
    self hide();
    self setorigin( self.teleportpos, 0 );

    if ( isdefined( var_5 ) )
        self.angles = vectortoangles( var_5.origin - self.origin );

    self.teleportpos = undefined;
    self _meth_8286( self.origin );
    self _meth_841F();
    thread showmelater();

    if ( !scripts\engine\utility::_id_9CEE( self.btraversalteleport ) )
        scripts\mp\agents\slasher\slasher_agent::lookatslasherenemy();

    scripts\asm\asm_mp::_id_2365( var_0, var_1, var_2, var_4, 1.5 );

    if ( scripts\engine\utility::_id_9CEE( self.btraversalteleport ) )
    {
        self._id_9CEC = undefined;
        self.btraversalteleport = undefined;
        self notify( "traverse_end" );
        scripts\asm\asm::_id_237C( "decide_idle", var_3 );
    }
}

showmelater()
{
    wait 0.1;

    if ( soundexists( "slasher_teleport_out" ) )
        play_teleport_sound_to_players( "slasher_teleport_out" );

    self setscriptablepartstate( "teleport", "show" );
    self show();
}

play_teleport_sound_to_players( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( !self _meth_85B8() || scripts\engine\utility::_id_9CEE( var_2._id_DCEB ) )
            self playsoundtoplayer( var_0, var_2 );
    }
}

ontraversalteleport( var_0, var_1, var_2, var_3 )
{
    self.teleportpos = self _meth_8146();
    self.btraversalteleport = 1;
    return 1;
}

ram_attack_anim_terminate( var_0, var_1, var_2 )
{
    self setscriptablepartstate( "slasher_audio", "normal" );
}

ram_attack_start_terminate( var_0, var_1, var_2 )
{
    self setscriptablepartstate( "slasher_audio", "normal" );
}

ram_attack_loop_terminate( var_0, var_1, var_2 )
{
    self setscriptablepartstate( "slasher_audio", "normal" );
}
