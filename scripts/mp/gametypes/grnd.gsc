// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mapname" ) == "mp_background" )
        return;

    scripts\mp\globallogic::init();
    scripts\mp\globallogic::setupcallbacks();

    if ( isusingmatchrulesdata() )
    {
        level.initializematchrules = ::initializematchrules;
        [[ level.initializematchrules ]]();
        level thread scripts\mp\utility\game::reinitializematchrulesonmigration();
    }
    else
    {
        scripts\mp\utility\game::registerroundswitchdvar( level.gametype, 0, 0, 9 );
        scripts\mp\utility\game::registertimelimitdvar( level.gametype, 10 );
        scripts\mp\utility\game::registerscorelimitdvar( level.gametype, 7500 );
        scripts\mp\utility\game::registerroundlimitdvar( level.gametype, 1 );
        scripts\mp\utility\game::registerwinlimitdvar( level.gametype, 1 );
        scripts\mp\utility\game::registernumlivesdvar( level.gametype, 0 );
        scripts\mp\utility\game::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    updategametypedvars();
    level.teambased = 1;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = scripts\mp\gametypes\koth::getspawnpoint;
    level._id_C577 = scripts\mp\gametypes\koth::_id_C577;
    level._id_C583 = scripts\mp\gametypes\koth::_id_80E9;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = scripts\mp\damage::gamemodemodifyplayerdamage;

    game["dialog"]["gametype"] = "dropzone";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    else if ( getdvarint( "camera_thirdPerson" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_diehard" ) )
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_" + level.gametype + "_promode" ) )
        game["dialog"]["gametype"] = game["dialog"]["gametype"] + "_pro";

    game["dialog"]["offense_obj"] = "capture_obj";
    game["dialog"]["defense_obj"] = "capture_obj";
    thread scripts\mp\gametypes\koth::_id_C56E();
    level._id_4D82["drop_zone"] = 1200;
    level._id_4D83["drop_zone"] = 1190;
    level._id_4D81["drop_zone"] = 0;
    level._id_4D84["drop_zone"] = 1;
}

initializematchrules()
{
    scripts\mp\utility\game::setcommonrulesfrommatchdata();
    setdynamicdvar( "scr_grnd_dropTime", getmatchrulesdata( "grndData", "dropTime" ) );
    setdynamicdvar( "scr_grnd_enableVariantDZ", getmatchrulesdata( "grndData", "enableVariantDZ" ) );
    setdynamicdvar( "scr_grnd_zoneLifetime", getmatchrulesdata( "kothData", "zoneLifetime" ) );
    setdynamicdvar( "scr_grnd_zoneCaptureTime", getmatchrulesdata( "kothData", "zoneCaptureTime" ) );
    setdynamicdvar( "scr_grnd_zoneActivationDelay", getmatchrulesdata( "kothData", "zoneActivationDelay" ) );
    setdynamicdvar( "scr_grnd_randomLocationOrder", getmatchrulesdata( "kothData", "randomLocationOrder" ) );
    setdynamicdvar( "scr_grnd_additiveScoring", getmatchrulesdata( "kothData", "additiveScoring" ) );
    setdynamicdvar( "scr_grnd_pauseTime", getmatchrulesdata( "kothData", "pauseTime" ) );
    setdynamicdvar( "scr_grnd_delayPlayer", getmatchrulesdata( "kothData", "delayPlayer" ) );
    setdynamicdvar( "scr_grnd_useHQRules", getmatchrulesdata( "kothData", "useHQRules" ) );
    setdynamicdvar( "scr_grnd_halftime", 0 );
    scripts\mp\utility\game::registerhalftimedvar( "grnd", 0 );
    setdynamicdvar( "scr_grnd_promode", 0 );
}

onstartgametype()
{
    setclientnamemode( "auto_change" );

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    scripts\mp\utility\game::setobjectivetext( "allies", &"OBJECTIVES_GRND" );
    scripts\mp\utility\game::setobjectivetext( "axis", &"OBJECTIVES_GRND" );

    if ( level._id_10A56 )
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", &"OBJECTIVES_GRND" );
        scripts\mp\utility\game::setobjectivescoretext( "axis", &"OBJECTIVES_GRND" );
    }
    else
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", &"OBJECTIVES_GRND_SCORE" );
        scripts\mp\utility\game::setobjectivescoretext( "axis", &"OBJECTIVES_GRND_SCORE" );
    }

    scripts\mp\utility\game::setobjectivehinttext( "allies", &"OBJECTIVES_DOM_HINT" );
    scripts\mp\utility\game::setobjectivehinttext( "axis", &"OBJECTIVES_DOM_HINT" );
    var_0[0] = level.gametype;
    var_0[1] = "tdm";
    var_0[2] = "hardpoint";
    scripts\mp\gameobjects::main( var_0 );
    level thread scripts\mp\gametypes\koth::_id_FB01();
    level thread scripts\mp\gametypes\koth::_id_FAFF();
    scripts\mp\gametypes\koth::_id_98CE();
    level thread scripts\mp\gametypes\koth::_id_8B4E();

    if ( level._id_5EED > 0 )
        level thread _id_DCAC();
}

updategametypedvars()
{
    scripts\mp\gametypes\common::updategametypedvars();
    level._id_5EED = scripts\mp\utility\game::_id_5F6B( "dropTime", 15, 0, 60 );
    level._id_13FBF = scripts\mp\utility\game::_id_5F6B( "zoneLifetime", 60, 0, 300 );
    level._id_13FBC = scripts\mp\utility\game::_id_5F6B( "zoneCaptureTime", 0, 0, 30 );
    level._id_13FBA = scripts\mp\utility\game::_id_5F6B( "zoneActivationDelay", 0, 0, 60 );
    level._id_13FC3 = scripts\mp\utility\game::_id_5F6D( "randomLocationOrder", 0, 0, 1 );
    level._id_13FBB = scripts\mp\utility\game::_id_5F6D( "additiveScoring", 0, 0, 1 );
    level._id_C9D5 = scripts\mp\utility\game::_id_5F6D( "pauseTime", 1, 0, 1 );
    level._id_5117 = scripts\mp\utility\game::_id_5F6D( "delayPlayer", 0, 0, 1 );
    level._id_13097 = scripts\mp\utility\game::_id_5F6D( "useHQRules", 0, 0, 1 );
    level.enablevariantdrops = scripts\mp\utility\game::_id_5F6D( "enableVariantDZ", 0, 0, 1 );
}

_id_DCAC()
{
    level endon( "game_ended" );
    scripts\mp\utility\game::_id_7670( "prematch_done" );
    level._id_8619 = [];

    for (;;)
    {
        var_0 = _id_7DFF();
        var_1 = 1;

        if ( isdefined( var_0 ) && scripts\mp\utility\game::_id_4BD7() < scripts\mp\utility\game::_id_B4D2() && level._id_6BAA + var_1 < scripts\mp\utility\game::_id_B4D2() && level._id_C223 < 8 )
        {
            scripts\mp\utility\game::_id_D52E( "mp_dropzone_obj_taken", var_0.team );
            scripts\mp\utility\game::_id_D52E( "mp_dropzone_obj_lost", level._id_C74B[var_0.team] );
            var_2 = getnodesintrigger( level.zone.gameobject.trigger );
            var_3 = randomintrange( 0, var_2.size );
            var_4 = var_2[var_3];
            var_5 = _func_2B3( var_4.origin );
            var_6 = var_4.origin;
            var_7 = var_5;
            var_8 = scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 0, 1, 0 );
            var_9 = [];
            var_10 = scripts\engine\trace::_id_DCED( var_6, var_7, var_9, var_8 );
            var_4.droporigin = var_10["position"];
            var_11 = _id_7E88();
            level scripts\mp\killstreaks\airdrop::_id_581F( var_0, var_4, randomfloat( 360 ), "dronedrop_grnd" );
            var_12 = level._id_5EED;
        }
        else
            var_12 = 0.5;

        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_12 );
    }
}

_id_7DFF()
{
    var_0 = undefined;
    var_1 = 0;
    var_2 = level.zone.gameobject scripts\mp\gameobjects::_id_803E();

    if ( var_2 == "neutral" )
        return var_0;

    foreach ( var_4 in level.zone.gameobject._id_11A45[var_2] )
    {
        if ( var_1 == 0 || var_1 > var_4._id_10DFF )
        {
            var_1 = var_4._id_10DFF;
            var_0 = var_4.player;
        }
    }

    return var_0;
}

_id_7E88()
{
    var_0 = undefined;

    if ( !isdefined( level._id_8619["mega"] ) && level._id_C223 == 0 && randomintrange( 0, 100 ) < 5 )
        var_0 = "mega";
    else
    {
        if ( level._id_8619.size )
        {
            for ( var_1 = 200; var_1; var_1-- )
            {
                var_0 = scripts\mp\killstreaks\airdrop::_id_80B6( "dronedrop_grnd" );

                if ( isdefined( level._id_8619[var_0] ) )
                {
                    var_0 = undefined;
                    continue;
                }

                break;
            }
        }

        if ( !isdefined( var_0 ) )
            var_0 = scripts\mp\killstreaks\airdrop::_id_80B6( "dronedrop_grnd" );
    }

    level._id_8619[var_0] = 1;

    if ( level._id_8619.size == 15 )
        level._id_8619 = [];

    return var_0;
}
