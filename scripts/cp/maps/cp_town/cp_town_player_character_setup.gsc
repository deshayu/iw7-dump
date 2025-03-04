// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init_player_characters()
{
    register_player_character( 1, "yes", "body_zmb_hero_schoolgirl", "viewmodel_arms_zmb_hero_schoolgirl", "head_zmb_hero_schoolgirl", undefined, "p1_", "_p1", "iw7_pap_zm_school_girl", "ges_zombies_revive_nerd", 0, "iw7_schoolgirlcard_zm", "mus_zombies_valley_girl", "iw7_loadoutschoolgirl_zm", "iw7_knife_zm_schoolgirl" );
    register_player_character( 2, "yes", "body_zmb_hero_scientist", "viewmodel_arms_zmb_hero_scientist", "head_zmb_hero_scientist", undefined, "p2_", "_p2", "iw7_pap_zm_scientist", "ges_zombies_revive_nerd", 1, "iw7_scientistcard_zm", "mus_zombies_nerd", "iw7_loadoutscientist_zm", "iw7_knife_zm_scientist" );
    register_player_character( 3, "yes", "body_zmb_hero_soldier", "viewmodel_zmb_hero_soldier", "head_zmb_hero_soldier", undefined, "p3_", "_p3", "iw7_pap_zm_soldier", "ges_zombies_revive_nerd", 2, "iw7_soldiercard_zm", "mus_zombies_rapper", "iw7_loadoutsoldier_zm", "iw7_knife_zm_soldier" );
    register_player_character( 4, "yes", "body_zmb_hero_rebel", "viewmodel_arms_zmb_hero_rebel", "head_zmb_hero_rebel", undefined, "p4_", "_p4", "iw7_pap_zm_rebel", "ges_zombies_revive_nerd", 3, "iw7_rebelcard_zm", "mus_zombies_jock", "iw7_loadoutrebel_zm", "iw7_knife_zm_rebel" );
    register_player_character( 5, "no", "fullbody_zmb_hero_elvira_player", "viewmodel_zmb_hero_elvira", undefined, undefined, "p5_", "_p5", "iw7_pap_zm_elvira", "ges_zombies_revive_nerd", 4, "iw7_elviracard_zm", "mus_zombies_elvira", "iw7_loadoutelvira_zm", "iw7_knife_zm_elvira", ::post_elvira_setup_func );
}

register_player_character( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15 )
{
    var_16 = spawnstruct();
    var_16.body_model = var_2;
    var_16.view_model = var_3;
    var_16.head_model = var_4;
    var_16.hair_model = var_5;
    var_16._id_134FD = var_6;
    var_16.vo_suffix = var_7;
    var_16.pap_gesture = var_8;
    var_16.revive_gesture = var_9;
    var_16.photo_index = var_10;
    var_16._id_6BA3 = var_11;
    var_16.intro_music = var_12;
    var_16.intro_gesture = var_13;
    var_16.melee_weapon = var_14;
    var_16.post_setup_func = var_15;

    if ( !isdefined( level.player_character_info ) )
        level.player_character_info = [];

    if ( !isdefined( level._id_26A0 ) )
        level._id_26A0 = [];

    level.player_character_info[var_0] = var_16;

    if ( var_1 == "yes" )
        level._id_26A0[level._id_26A0.size] = var_0;
}

post_elvira_setup_func( var_0 )
{
    var_0 _id_0D2A::_id_12D7C( "MISTRESS_OF_DARK", 1 );

    if ( !isdefined( level.special_character_count ) )
        level.special_character_count = 1;
    else
        level.special_character_count++;
}

post_el_setup_func( var_0 )
{
    if ( !isdefined( level.special_character_count ) )
        level.special_character_count = 1;
    else
        level.special_character_count++;
}
