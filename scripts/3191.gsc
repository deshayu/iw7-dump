// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_13F64()
{
    if ( scripts\asm\asm_bb::_id_2956( "fly" ) )
        return 1;

    return 0;
}

_id_13F66()
{
    if ( scripts\asm\asm_bb::_id_2953() )
        return 1;

    return 0;
}

_id_13F67()
{
    if ( scripts\asm\asm_bb::_id_2956( "entangled" ) )
        return 1;

    return 0;
}

_id_13F68()
{
    if ( _id_0C2D::_id_7ED5() == "launched" )
        return 1;

    return 0;
}

_id_13F65()
{
    if ( !isdefined( self._id_8272 ) )
        return 0;

    if ( _id_0C2D::_id_7ED5() == "entangled" )
        return 0;

    var_0 = self._id_8272 - self.origin;
    var_1 = _id_36EE( var_0 );

    if ( isdefined( var_1 ) )
    {
        self._id_6FF5 = var_1;
        return 1;
    }
    else
        return 0;
}

_id_13F6D( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self._id_13F2C ) )
        _id_1299A( self._id_13F2C.origin );

    _id_CECF( var_0, var_1, var_2, var_3 );
    self notify( "ghost_played_melee_anim" );
}

_id_13F63( var_0, var_1, var_2, var_3 )
{
    if ( var_0 == "hit" )
    {
        if ( !isdefined( self._id_13F2C ) )
            return;

        if ( !_id_0A77::isreallyalive( self._id_13F2C ) )
            return;

        if ( self._id_13F2C _id_0A77::_id_9E3A() )
            return;

        if ( _id_0F74::_id_1002C( self._id_13F2C ) )
            return;

        if ( distancesquared( self._id_13F2C.origin, self.origin ) > 9216 )
            return;

        self._id_13F2C _meth_80B0( 45, self.origin, self, self, "MOD_MELEE" );
    }
}

_id_13F6C( var_0, var_1, var_2, var_3 )
{
    _id_CECF( var_0, var_1, var_2, var_3 );
}

_id_13F6A( var_0, var_1, var_2, var_3 )
{
    _id_CECF( var_0, var_1, var_2, var_3 );
}

_id_826A( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( var_1 + "_finished" );

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    self._id_4BDC = var_1;
    var_5 = scripts\asm\asm_mp::_id_2337( var_0, var_1 );
    self._id_4BDB = var_5;
    var_6 = scripts\asm\asm::_id_2341( var_0, var_1 );

    for (;;)
    {
        self setanimstate( var_1, var_5, var_3 );
        scripts\anim\notetracks_mp::_id_1384C( var_1, "end", var_1, var_5, var_6 );
    }
}

_id_13F6E( var_0, var_1, var_2, var_3 )
{

}

_id_13F62()
{
    self endon( "death" );

    for (;;)
    {
        scripts\engine\utility::waitframe();

        if ( isdefined( self._id_8272 ) )
            _id_1299A( self._id_8272 );
    }
}

_id_13F6B( var_0, var_1, var_2, var_3 )
{
    _id_CECF( var_0, var_1, var_2, var_3 );

    if ( isdefined( self._id_8272 ) )
        _id_1299A( self._id_8272 );
}

_id_36EE( var_0 )
{
    var_1 = 10;
    var_2 = vectortoangles( var_0 );
    var_3 = angleclamp180( var_2[1] - self.angles[1] );
    var_4 = getangleindex( var_3, var_1 );

    if ( var_4 == 4 || var_4 < 0 || var_4 > 8 )
        return undefined;

    var_5 = _id_79C4();
    return var_5[var_4];
}

_id_13F61( var_0, var_1, var_2, var_3 )
{
    return self._id_6FF5;
}

_id_79C4()
{
    var_0 = [];
    var_0[0] = 0;
    var_0[1] = 1;
    var_0[2] = 2;
    var_0[3] = 3;
    var_0[5] = 4;
    var_0[6] = 5;
    var_0[7] = 6;
    var_0[8] = 7;
    return var_0;
}

_id_1299A( var_0 )
{
    var_1 = var_0 - self.origin;
    self orientmode( "face angle abs", vectortoangles( var_1 ) );
    self.angles = vectortoangles( var_1 );
}

_id_CECF( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    var_4 = scripts\asm\asm_mp::_id_2337( var_0, var_1 );
    var_5 = scripts\asm\asm::_id_2341( var_0, var_1 );
    self._id_4BDC = var_1;
    self._id_4BDB = var_4;
    scripts\anim\notetracks_mp::_id_CED2( var_1, var_4, self._id_1FC6, var_1, "end", var_5 );
}
