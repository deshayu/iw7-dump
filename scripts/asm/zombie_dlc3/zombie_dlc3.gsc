// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

zombie_dlc3fn0( var_0 )
{
    return _id_0A09::_id_5AEA( var_0, 200 );
}

_id_2AD0()
{
    if ( isdefined( level._id_119E["zombie_dlc3"] ) )
        return;

    var_0 = spawnstruct();
    var_0._id_1581 = [];
    var_0._id_1581[0] = _id_0C2B::_id_98E5;
    var_0._id_1581[1] = scripts\aitypes\zombie_dlc3\behaviors::checkscripteddlc;
    var_0._id_1581[2] = _id_0C2B::_id_10004;
    var_0._id_1581[3] = _id_0C2B::_id_6627;
    var_0._id_1581[4] = _id_0C2B::_id_6628;
    var_0._id_1581[5] = _id_0C2B::_id_6629;
    var_0._id_1581[6] = ::zombie_dlc3fn0;
    var_0._id_1581[7] = _id_0A09::_id_FAF6;
    var_0._id_1581[8] = _id_0C2B::_id_102D4;
    var_0._id_1581[9] = _id_0C2B::_id_3E4F;
    var_0._id_1581[10] = _id_0C2B::_id_3E29;
    var_0._id_1581[11] = scripts\aitypes\zombie_dlc3\behaviors::chaseenemydlc;
    var_0._id_1581[12] = scripts\aitypes\zombie_dlc3\behaviors::seekenemydlc;
    var_0._id_1581[13] = _id_0C2B::_id_C0B6;
    level._id_119E["zombie_dlc3"] = var_0;
}

_id_DEE8()
{
    _id_2AD0();
    _func_2D8( "zombie_dlc3" );
}
