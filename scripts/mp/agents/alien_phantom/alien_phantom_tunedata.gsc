// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

setuptunedata()
{
    if ( !isdefined( level.agenttunedata ) )
        level.agenttunedata = [];

    level.agenttunedata["alien_phantom"] = spawnstruct();
    setupmytunedata( level.agenttunedata["alien_phantom"] );
}

setupmytunedata( var_0 )
{
    scripts\mp\agents\alien_goon\alien_goon_tunedata::setupmytunedata( var_0 );
    var_0.goon_health_multiplier = 7;
    var_0.force_melee_attack_damage_radius_sq = 1024;
    var_0.teleport_chance = 100;
    var_0.min_dist_to_teleport_sq = 90000;
    var_0.max_leap_distance_sq = 1000000;
}
