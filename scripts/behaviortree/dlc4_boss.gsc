// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_2AD0()
{
    if ( isdefined( level._id_119E["dlc4_boss"] ) )
        return;

    var_0 = spawnstruct();
    var_0._id_1581 = [];
    var_0._id_1581[0] = scripts\aitypes\dlc4_boss\behaviors::initbehaviors;
    var_0._id_1581[1] = scripts\aitypes\dlc4_boss\behaviors::entrance_tick;
    var_0._id_1581[2] = scripts\aitypes\dlc4_boss\behaviors::entrance_begin;
    var_0._id_1581[3] = scripts\aitypes\dlc4_boss\behaviors::entrance_end;
    var_0._id_1581[4] = scripts\aitypes\dlc4_boss\behaviors::updateeveryframe;
    var_0._id_1581[5] = _id_0C2B::_id_3E48;
    var_0._id_1581[6] = scripts\aitypes\dlc4_boss\behaviors::decideaction;
    var_0._id_1581[7] = scripts\aitypes\dlc4\bt_action_api::doaction_tick;
    var_0._id_1581[8] = scripts\aitypes\dlc4\bt_action_api::doaction_begin;
    var_0._id_1581[9] = scripts\aitypes\dlc4\bt_action_api::doaction_end;
    level._id_119E["dlc4_boss"] = var_0;
}

_id_DEE8()
{
    _id_2AD0();
    _func_2D8( "dlc4_boss" );
}
