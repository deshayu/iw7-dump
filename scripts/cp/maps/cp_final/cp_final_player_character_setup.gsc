// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init_player_characters()
{
    register_player_character( 1, "yes", "body_zmb_hero_sally_dlc4", "viewmodel_zmb_hero_sally_dlc4", "head_zmb_hero_sally_dlc4", undefined, "p1_", "_p1", "iw7_dlc4pap_zm", "ges_zombies_revive_nerd", 0, "iw7_dlc4card_zm", "mus_zombies_generic_char", "iw7_dlc4loadin_zm", "iw7_knife_zm_rapper" );
    register_player_character( 2, "yes", "body_zmb_hero_dexter_dlc4", "viewmodel_zmb_hero_dexter_dlc4", "head_zmb_hero_dexter_dlc4", undefined, "p2_", "_p2", "iw7_dlc4pap_zm", "ges_zombies_revive_nerd", 1, "iw7_dlc4card_zm", "mus_zombies_generic_char", "iw7_dlc4loadin_zm", "iw7_knife_zm_rapper" );
    register_player_character( 3, "yes", "body_zmb_hero_andre_dlc4", "viewmodel_zmb_hero_andre_dlc4", "head_zmb_hero_andre_dlc4", undefined, "p3_", "_p3", "iw7_dlc4pap_zm", "ges_zombies_revive_nerd", 2, "iw7_dlc4card_zm", "mus_zombies_generic_char", "iw7_dlc4loadin_zm", "iw7_knife_zm_rapper" );
    register_player_character( 4, "yes", "body_zmb_hero_aj_dlc4", "viewmodel_zmb_hero_aj_dlc4", "head_zmb_hero_aj_dlc4", undefined, "p4_", "_p4", "iw7_dlc4pap_zm", "ges_zombies_revive_nerd", 3, "iw7_dlc4card_zm", "mus_zombies_generic_char", "iw7_dlc4loadin_zm", "iw7_knife_zm_rapper" );
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
