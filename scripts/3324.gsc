// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_95C1()
{
    self._id_CA2F = [];
    self._id_CA2F["health"] = _id_0CFD::_id_96C2();
    self._id_CA2F["damagemod"] = _id_0CFD::_id_96BF();
    self._id_CA2F["medic"] = _id_0CFD::_id_96C8();
    self._id_CA2F["rigger"] = _id_0CFD::_id_96CB();
    self._id_CA2F["robotics"] = _id_0CFD::_id_96CC();
    self._id_CA2F["demolition"] = _id_0CFD::_id_96C0();
    self._id_CA2F["gunslinger"] = _id_0CFD::_id_96C1();
    self._id_CA2F["hybrid"] = _id_0CFD::_id_96C3();
    self._id_CA2F["pistol"] = _id_0CFD::_id_96CA();
    self._id_CA2F["pistol"] = _id_0CFD::_id_96CA();
    self._id_CA2F["pistol"] = _id_0CFD::_id_96CA();
    self._id_CA2F["pistol"] = _id_0CFD::_id_96CA();
    self._id_CA2F["none"] = _id_0CFD::_id_96C9();
}

_id_CA3A()
{
    return self._id_CA2F["health"]._id_B5AF;
}

_id_CA39()
{
    return self._id_CA2F["health"]._id_B43C;
}

_id_CA32()
{
    return self._id_CA2F["damagemod"]._id_3237;
}

_id_CA41()
{
    return self._id_CA2F["medic"]._id_E4A5;
}

_id_CA37()
{
    return self._id_CA2F["medic"]._id_76AC;
}

_id_CA3B()
{
    return self._id_CA2F["medic"]._id_BC6F;
}

_id_CA40()
{
    return self._id_CA2F["medic"]._id_E496;
}

_id_CA34()
{
    return self._id_CA2F["rigger"]._id_5B99;
}

_id_CA35()
{
    return self._id_CA2F["rigger"]._id_5BB8;
}

_id_CA42()
{
    return self._id_CA2F["rigger"]._id_1269D;
}

_id_CA43()
{
    return self._id_CA2F["rigger"]._id_1269E;
}

_id_CA44()
{
    return self._id_CA2F["rigger"]._id_1269F;
}

_id_CA33()
{
    return self._id_CA2F["rigger"]._id_4B35;
}

_id_CA3F()
{
    return self._id_CA2F["rigger"]._id_E18F;
}

_id_CA30()
{
    return self._id_CA2F["robotics"]._id_2180;
}

_id_CA31()
{
    return self._id_CA2F["robotics"]._id_2181;
}

_id_CA36()
{
    return self._id_CA2F["demolition"]._id_69F9;
}

_id_CA3C()
{
    return self._id_CA2F["demolition"]._id_C32A;
}

_id_CA38()
{
    return self._id_CA2F["demolition"]._id_AAAA;
}

_id_CA3E()
{
    return self._id_CA2F["pistol"]._id_CBDC;
}

_id_CA3D()
{
    return self._id_CA2F["pistol"]._id_CBDB;
}

_id_7C4D()
{

}

_id_7C4E()
{
    var_0 = "perk_none";
    return var_0;
}

_id_E2BC()
{
    var_0 = _id_7C4D();
    var_1 = _id_7B75();
    _id_0A63::_id_F4CA( _id_7B79( "perk_0", var_0, var_1 ) );
    var_2 = _id_7C4E();

    if ( var_2 != "perk_none" )
    {
        var_3 = level._id_1B8E["perk_0"][var_2];
        _id_0A63::_id_F4CA( _id_7B79( "perk_0", var_3._id_DE3F, var_1 ) );
    }
}

_id_7B79( var_0, var_1, var_2 )
{
    return level._id_1B8E[var_0][var_1]._id_12F7A[var_2]._id_DE3F;
}

_id_7B75()
{
    return self getrankedplayerdata( "cp", "alienSession", "perk_0_level" );
}

_id_7B76()
{
    return self getrankedplayerdata( "cp", "alienSession", "perk_1_level" );
}

_id_7B77()
{
    return self getrankedplayerdata( "cp", "alienSession", "perk_2_level" );
}
