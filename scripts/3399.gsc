// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_952B()
{
    level._id_2159 = [];
    level._id_2158 = [];
    level._id_2158["blue"] = 0;
    level._id_2158["pink"] = 0;
    level._id_2158["red"] = 0;
    level._id_2158["yellow"] = 0;
    level._id_2158["green"] = 0;
    scripts\engine\utility::_id_6E39( "pink_essence_arrived" );
    scripts\engine\utility::_id_6E39( "blue_ark_quest" );
    scripts\engine\utility::_id_6E39( "yellow_ark_quest" );
    scripts\engine\utility::_id_6E39( "pink_ark_quest" );
    scripts\engine\utility::_id_6E39( "red_ark_quest" );
    scripts\engine\utility::_id_6E39( "green_ark_quest" );
    scripts\engine\utility::_id_6E39( "ufo_quest_finished" );
    scripts\engine\utility::_id_6E39( "all_attachments_deposited" );
    level thread _id_1363C();
    level thread _id_135A5();
}

_id_135A5()
{
    scripts\engine\utility::_id_6E4C( "blue_ark_quest" );
    scripts\engine\utility::_id_6E4C( "yellow_ark_quest" );
    scripts\engine\utility::_id_6E4C( "red_ark_quest" );
    scripts\engine\utility::_id_6E4C( "green_ark_quest" );
    var_0 = scripts\engine\utility::_id_817E( "arkpink,pink", "script_noteworthy" );
    var_1 = spawn( "script_model", var_0.origin );
    var_1 setmodel( "tag_origin_ground_essence" );
    var_2 = spawnfx( level._effect["pink_ark_spawn"], var_0.origin );
    triggerfx( var_2 );
    wait 1;
    var_1 setscriptablepartstate( "miniufo", "pink" );
    var_1 thread _id_702F( var_1, var_0, var_2 );
    scripts\engine\utility::_id_6E3E( "all_attachments_deposited" );
    level notify( "all_attachments_deposited" );
    var_3 = getent( "master_arcane_deposit", "targetname" );
    var_3 makeunusable();
    var_4 = _id_8021( "pink" );

    if ( isdefined( var_4 ) )
        level _id_0A77::_id_F55F( var_4 );

    var_5 = scripts\engine\utility::_id_817E( "ark_quest_station", "script_noteworthy" );
    var_5._id_32F8 = var_1;
    _id_1792( var_5 );
}

_id_13D04( var_0 )
{
    for (;;)
    {
        scripts\engine\utility::_id_5B4B( var_0.origin, var_0.origin + ( 0, 0, 200 ), 1, 0, 0, 0.25 );
        wait 0.25;
    }
}

_id_702F( var_0, var_1, var_2 )
{
    var_2 delete();
    playfxontag( level._effect["pink_essense"], var_0, "tag_origin" );
    var_3 = var_1;
    var_4 = scripts\engine\utility::_id_817E( var_3._id_0334, "targetname" );
    var_5 = undefined;

    for (;;)
    {
        var_6 = _id_7AF8( var_0, var_3.origin, var_4.origin, 400 );
        var_0 moveto( var_4.origin, var_6 );
        var_0 waittill( "movedone" );
        var_3 = var_4;

        if ( isdefined( var_5 ) )
        {
            var_0 dontinterpolate();
            var_0.origin = var_5.origin;
            var_3 = var_5;
            var_5 = undefined;
        }

        if ( isdefined( var_3._id_0334 ) )
            var_4 = scripts\engine\utility::_id_817E( var_3._id_0334, "targetname" );
        else
            break;

        if ( isdefined( var_4.script_noteworthy ) && var_4.script_noteworthy == "arcane_struct_portal" )
            var_5 = scripts\engine\utility::_id_817E( var_4._id_0334, "targetname" );
    }

    scripts\engine\utility::_id_6E3E( "pink_essence_arrived" );
}

_id_7AF8( var_0, var_1, var_2, var_3 )
{
    var_4 = distance( var_1, var_2 );

    if ( !isdefined( var_3 ) )
        var_3 = min( 10 + level._id_13BD3 * 5, 150 );

    var_5 = var_4 / var_3;

    if ( var_5 < 0.05 )
        var_5 = 0.05;

    return var_5;
}

_id_1363C()
{
    var_0 = getent( "master_arcane_deposit", "targetname" );
    var_0 makeunusable();
    var_0 makeusable();
    var_0 setcursorhint( "HINT_NODISPLAY" );
    var_1 = scripts\engine\utility::_id_8180( var_0._id_0334, "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.script_noteworthy ) && var_3.script_noteworthy == "arkpink,pink" )
            continue;

        var_3 thread _id_135AC( var_0, var_3 );
    }
}

_id_135AC( var_0, var_1 )
{
    var_1._id_01F1 = spawn( "script_model", var_1.origin );
    var_1._id_01F1 setmodel( "tag_origin" );
    var_2 = strtok( var_1.script_noteworthy, "," );
    var_3 = var_2[1];
    var_4 = undefined;
    scripts\engine\utility::_id_6E4C( var_3 + "_crystal_placed" );
    var_5 = 0;

    for (;;)
    {
        var_0 waittill( "trigger", var_6 );

        if ( !var_5 )
        {
            var_0 playloopsound( "arc_machine_on_idle_lp" );
            var_5 = 1;
        }

        var_7 = var_6 getcurrentweapon();
        level thread _id_0A6A::_id_E01F( "nag_return_arcanecore" );

        if ( _id_0A77::_id_13C90( var_7, var_2[0] ) )
        {
            wait 0.1;
            _id_0D63::_id_412B( var_6 );
            var_6 setscriptablepartstate( "arcane", "arcane_disperse", 0 );
            var_6 _meth_83B8( var_7 );
            var_8 = getweaponattachments( var_7 );
            var_9 = _id_0A77::getcurrentcamoname( var_7 );
            var_10 = var_6 _id_0A6B::_id_E469( var_7, "arcane_base", var_8, undefined, var_9 );
            var_10 = var_6 _id_0A77::_id_12C6( var_10, undefined, undefined, 1 );
            var_6 _meth_83B5( var_10 );

            switch ( var_3 )
            {
                case "blue":
                    var_1._id_01F1 playsound( "arc_machine_place_blue_ark" );
                    break;
                case "green":
                    var_1._id_01F1 playsound( "arc_machine_place_green_ark" );
                    break;
                case "red":
                    var_1._id_01F1 playsound( "arc_machine_place_red_ark" );
                    break;
                case "yellow":
                    var_1._id_01F1 playsound( "arc_machine_place_yellow_ark" );
                    break;
            }

            var_11 = var_1.origin + ( 0, 0, 8 );
            var_12 = spawnfx( level._effect["neil_repair_sparks"], var_11 );
            wait 0.1;
            triggerfx( var_12 );
            wait 0.1;
            var_12 delete();
            var_13 = spawn( "script_model", var_11 );
            var_13 setmodel( "tag_origin_ground_essence" );
            scripts\engine\utility::waitframe();
            var_13 setscriptablepartstate( "miniufo", var_3 );
            break;
        }
        else
            continue;
    }

    var_14 = _id_8021( var_3 );

    if ( isdefined( var_14 ) )
        level _id_0A77::_id_F55F( var_14 );

    var_1._id_01F1 makeunusable();
    var_15 = var_3 + "_ark_quest";
    scripts\engine\utility::_id_6E3E( var_15 );
}

_id_8021( var_0 )
{
    var_1 = undefined;

    switch ( var_0 )
    {
        case "blue":
            var_1 = 1;
            break;
        case "red":
            var_1 = 4;
            break;
        case "pink":
            var_1 = 5;
            break;
        case "yellow":
            var_1 = 3;
            break;
        case "green":
            var_1 = 2;
            break;
        default:
            break;
    }

    return var_1;
}

_id_2157( var_0, var_1 )
{
    if ( isdefined( var_0._id_4AE2 ) && var_0._id_4AE2.size >= 1 )
        return &"CP_QUEST_WOR_PART";
    else
        return level._id_9A12[var_0.script_noteworthy];
}

_id_8BBD( var_0, var_1 )
{
    if ( scripts\engine\utility::_id_9CEE( var_1._id_8BBC ) )
        return;
    else if ( !_id_0A6B::_id_3862( "arkpink", var_1 getcurrentweapon() ) )
        return;
    else
        return level._id_9A12[var_0.script_noteworthy];
}

_id_2154( var_0, var_1 )
{
    if ( !isdefined( var_0._id_4AE2 ) )
        return;

    if ( var_0._id_4AE2.size < 1 )
        return;

    var_2 = 0;
    var_3 = undefined;

    foreach ( var_5 in var_0._id_4AE2 )
    {
        var_6 = strtok( var_5._id_01F1, "_" );
        var_7 = var_6[3];
        var_5 makeunusable();
        var_5 setmodel( "tag_origin" );
        scripts\engine\utility::_id_6E3E( var_7 + "_crystal_placed" );
        var_0._id_4AE2 = undefined;
    }
}

_id_1793( var_0, var_1 )
{
    var_2 = var_1 getcurrentweapon();
    var_3 = var_1 _id_0A6B::_id_169D( "arkpink", var_2 );

    if ( !var_3 )
        return;

    var_1 _meth_80AB();

    while ( var_1 _meth_81C2() )
        wait 0.05;

    var_1 enableweaponswitch();
    var_1._id_8BBC = 1;
    _id_0D45::log_pink_ark_obtained( level._id_13BD3 );
    level thread play_exquisite_essence_vo( var_1 );
    var_1 _id_0D2A::_id_12D7C( "BATTERIES_NOT_INCLUDED", 1 );
    var_1 thread _id_13A59( var_1 );
    var_1 thread _id_13A30( var_1 );
}

play_exquisite_essence_vo( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "death" );

    if ( randomint( 100 ) > 70 )
    {
        var_0 thread _id_0A6A::_id_12885( "quest_arcane_pink_essence", "zmb_comment_vo", "highest", 10, 1, 0, 0, 100 );
        wait( _id_0A6A::_id_7C76( var_0._id_134FD + "quest_arcane_pink_essence" ) );
    }
    else
    {
        var_0 thread _id_0A6A::_id_12885( "part_collect_exquisite", "zmb_comment_vo", "low", 10, 0, 0, 0, 45 );
        wait( _id_0A6A::_id_7C76( var_0._id_134FD + "part_collect_exquisite" ) );
    }

    level thread _id_0A6A::_id_12885( "ww_arcane_exquisiteattach_complete", "zmb_ww_vo", "high", 60, 0, 0, 1 );
}

_id_13A59( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_1 = 1;

    while ( scripts\engine\utility::_id_9CEE( var_0._id_8BBC ) )
    {
        if ( !var_1 )
        {
            var_0._id_8BBC = undefined;
            break;
        }

        var_2 = undefined;
        var_0 waittill( "last_stand" );
        var_1 = 0;
        var_3 = var_0 scripts\engine\utility::_id_13735( "player_entered_ala", "revive" );

        if ( var_3 == "player_entered_ala" )
            var_2 = var_0 scripts\engine\utility::_id_13734( "lost_and_found_collected", "lost_and_found_time_out" );

        if ( isdefined( var_2 ) && var_2 == "lost_and_found_time_out" )
            continue;

        var_4 = var_0 _meth_8173();

        foreach ( var_6 in var_4 )
        {
            if ( issubstr( var_6, "arkpink" ) )
            {
                var_7 = 1;
                var_0 thread _id_13A30( var_0 );
                break;
            }
        }
    }
}

_id_13A30( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "last_stand" );
    var_0 endon( "disconnect" );
    var_1 = 1;

    while ( scripts\engine\utility::_id_9CEE( var_0._id_8BBC ) )
    {
        if ( !var_1 )
        {
            var_0._id_8BBC = undefined;
            break;
        }

        var_0 scripts\engine\utility::waittill_any( "weapon_purchased", "mule_munchies_sold" );
        var_1 = 0;
        var_2 = var_0 _meth_8173();

        foreach ( var_4 in var_2 )
        {
            if ( issubstr( var_4, "arkpink" ) )
            {
                var_1 = 1;
                break;
            }
        }
    }
}

_id_1792( var_0 )
{
    _id_0A59::_id_E019( var_0 );
    scripts\engine\utility::_id_6E4C( "pink_essence_arrived" );
    var_0.script_noteworthy = "white_ark";
    _id_0A59::_id_175C( var_0 );
}

_id_9D4A( var_0, var_1, var_2 )
{
    return var_0 == "poison_ammo_mp" || var_0 == "incendiary_ammo_mp" || var_0 == "stun_ammo_mp" || var_0 == "slayer_ammo_mp" || issubstr( var_0, "emcpap" ) || var_1 == "yellow" && var_2 == "MOD_EXPLOSIVE_BULLET" || scripts\engine\utility::_id_9D74( var_2 ) && var_1 == "pink";
}
