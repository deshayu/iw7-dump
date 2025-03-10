// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_CEB5( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    var_4 = scripts\asm\asm_mp::_id_2337( var_0, var_1 );
    self._id_2303._id_4C86._id_697F = undefined;

    if ( !isdefined( var_4 ) )
    {
        scripts\asm\asm::_id_2330( var_1, "code_move", undefined );
        return;
    }

    _id_D53A( var_0, var_1, var_4, var_2 );
    scripts\asm\asm::_id_2330( var_1, "code_move", undefined );
}

_id_3E9F( var_0, var_1, var_2 )
{
    if ( !_id_3E57() )
        return undefined;

    var_3 = _id_53CA( var_1 );
    return var_3;
}

_id_8162( var_0 )
{
    var_1 = [];

    if ( scripts\asm\asm::_id_2346( var_0, "1" ) )
        var_1[7] = scripts\asm\asm::_id_2358( var_0, "1" );

    if ( scripts\asm\asm::_id_2346( var_0, "2" ) )
    {
        var_1[0] = scripts\asm\asm::_id_2358( var_0, "2" );
        var_1[8] = var_1[0];
    }

    if ( scripts\asm\asm::_id_2346( var_0, "3" ) )
        var_1[1] = scripts\asm\asm::_id_2358( var_0, "3" );

    if ( scripts\asm\asm::_id_2346( var_0, "4" ) )
        var_1[6] = scripts\asm\asm::_id_2358( var_0, "4" );

    if ( scripts\asm\asm::_id_2346( var_0, "6" ) )
        var_1[2] = scripts\asm\asm::_id_2358( var_0, "6" );

    if ( scripts\asm\asm::_id_2346( var_0, "7" ) )
        var_1[5] = scripts\asm\asm::_id_2358( var_0, "7" );

    if ( scripts\asm\asm::_id_2346( var_0, "8" ) )
        var_1[4] = scripts\asm\asm::_id_2358( var_0, "8" );

    if ( scripts\asm\asm::_id_2346( var_0, "9" ) )
        var_1[3] = scripts\asm\asm::_id_2358( var_0, "9" );

    return var_1;
}

_id_53CA( var_0 )
{
    var_1 = self _meth_8148();

    if ( isdefined( var_1 ) )
        var_2 = var_1.origin;
    else
        var_2 = self._id_0233;

    var_3 = scripts\asm\asm_mp::_id_7EA3();
    var_4 = self _meth_813A();
    var_5 = vectortoangles( var_4 );

    if ( isdefined( var_3 ) )
        var_6 = var_3.angles;
    else
        var_6 = self.angles;

    var_7 = angleclamp180( var_5[1] - self.angles[1] );
    var_8 = self _meth_816B();

    if ( length2dsquared( var_8 ) > 16 )
    {
        var_9 = vectortoangles( var_8 );

        if ( abs( angleclamp180( var_9[1] - var_5[1] ) ) < 45 )
            return;
    }

    if ( distancesquared( var_2, self.origin ) < 22500 )
        return;

    if ( isdefined( self._id_2303._id_4C86 ) && isdefined( self._id_2303._id_4C86._id_697F ) )
        var_10 = _id_8162( self._id_2303._id_4C86._id_697F );
    else
        var_10 = _id_8162( var_0 );

    var_11 = _func_2F8( var_7 );
    var_12 = undefined;
    var_13 = undefined;

    for ( var_14 = 0; var_14 < var_11.size; var_14++ )
    {
        var_15 = var_11[var_14];

        if ( !isdefined( var_10[var_15] ) )
            continue;

        var_12 = self getanimentry( var_0, var_10[var_15] );
        var_16 = getmovedelta( var_12 );
        var_17 = rotatevector( var_16, self.angles ) + self.origin;

        if ( !_func_272( self.origin, var_17, self ) )
        {
            var_13 = var_10[var_15];
            break;
        }
    }

    return var_13;
}

_id_D53A( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    var_4 = vectortoangles( self _meth_813A() );
    var_5 = angleclamp180( var_4[1] - self.angles[1] );
    var_6 = self getanimentry( var_1, var_2 );
    var_7 = getnotetracktimes( var_6, "code_move" );
    var_8 = 1;

    if ( var_7.size > 0 )
        var_8 = var_7[0];

    var_9 = _func_079( var_6, 0, var_8 );
    self _meth_8281( "anim deltas" );
    var_10 = angleclamp180( var_4[1] - var_9[1] );
    var_11 = ( 0, var_10, 0 );
    self orientmode( "face angle abs", var_11 );
    var_12 = getanimlength( var_6 ) * var_8;
    var_13 = 0.01 + abs( angleclamp180( var_5 - var_9[1] ) ) / var_12 / 1000;

    if ( var_13 < 0.01 )
        var_13 = 0.01;

    self._id_D8C4 = self._id_0358;
    self._id_0358 = var_13;
    scripts\asm\asm_mp::_id_2365( var_0, var_1, var_3, var_2, self._id_BCD6 );
    self._id_0358 = self._id_D8C4;
    self._id_D8C4 = undefined;
    self _meth_8281( "code_move" );
    self orientmode( "face motion" );
}

_id_3E57()
{
    if ( !isdefined( self._id_0233 ) )
        return 0;

    if ( !self _meth_8380() )
        return 0;

    if ( isdefined( self._id_010C ) && scripts\asm\asm_bb::_id_298E() )
        return 0;

    if ( isdefined( self._id_55ED ) && self._id_55ED )
        return 0;

    if ( distancesquared( self.origin, self._id_0233 ) < 10000 )
        return 0;

    return 1;
}

_id_3B1F( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3[2] ) || !scripts\asm\asm_bb::_id_2956( var_3[2] ) )
        return 0;

    return _id_FFF8( var_0, var_1, var_2, var_3 );
}

_id_FFF8( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self._id_C189 ) && self._id_C189 )
        return 0;

    if ( isdefined( self._id_932E ) && self._id_932E )
        return 0;

    var_4 = scripts\asm\asm::_id_233B( var_0 );
    var_5 = scripts\asm\asm::_id_233F( var_4, "sharp_turn" );

    if ( !isdefined( var_5 ) )
        return 0;

    var_6 = 100;
    var_7 = gettime();

    if ( var_7 - var_5._id_7686 > var_6 )
        return 0;

    if ( isarray( var_3 ) )
        var_8 = var_3[0];
    else
        var_8 = var_3;

    var_9 = var_5._id_C8F0[0];
    var_10 = var_5._id_C8F0[1];
    var_11 = _id_371C( var_4, var_2, var_9, var_10 );

    if ( !isdefined( var_11 ) )
        return 0;

    self._id_FC61 = var_11;
    return 1;
}

_id_371C( var_0, var_1, var_2, var_3 )
{
    var_4 = 10;

    if ( var_3 )
        var_4 = 30;

    var_5 = vectortoangles( var_2 );
    var_6 = angleclamp180( var_5[1] - self.angles[1] );

    if ( var_3 )
    {
        if ( abs( var_6 ) < 30 )
            return undefined;
    }

    var_7 = _func_2F8( var_6, var_4 );

    if ( scripts\engine\utility::_id_9CEE( self._id_AB3F ) )
        var_8 = _id_8117( var_1, 0 );
    else
        var_8 = _id_8117( var_1, 1 );

    foreach ( var_10 in var_7 )
    {
        if ( var_10 == 4 )
            continue;

        if ( var_10 < 0 || var_10 > 8 )
            continue;

        var_11 = self getanimentry( var_1, var_8[var_10] );
        var_12 = _func_078( var_11 );
        var_13 = ( 0, angleclamp180( var_5[1] - var_12 ), 0 );

        if ( _id_38B1( var_11, var_13, var_10 == 3 || var_10 == 5 ) )
            return var_8[var_10];
    }

    return undefined;
}

_id_3EF5( var_0, var_1, var_2, var_3 )
{
    return self._id_FC61;
}

_id_D514( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    var_4 = scripts\asm\asm_mp::_id_2337( var_0, var_1 );
    self._id_FC61 = undefined;
    scripts\asm\asm_mp::_id_237E( "anim deltas" );
    scripts\asm\asm_mp::_id_237F( "face current" );
    scripts\asm\asm_mp::_id_2365( var_0, var_1, var_2, var_4, self._id_BCD6 );
    scripts\asm\asm_mp::_id_237E( "code_move" );
    scripts\asm\asm_mp::_id_237F( "face motion" );
}

_id_38B1( var_0, var_1, var_2 )
{
    if ( !isdefined( self._id_0233 ) )
        return 0;

    if ( scripts\asm\asm_bb::_id_298E() )
        return 0;

    var_3 = getnotetracktimes( var_0, "code_move" );

    if ( var_3.size == 0 )
        var_3[0] = 1.0;

    var_4 = var_3[0];
    var_5 = getmovedelta( var_0, 0, var_4 );
    var_6 = self localtoworldcoords( var_5 );
    var_7 = self._id_0233;
    var_8 = self _meth_8148();

    if ( isdefined( var_8 ) )
        var_7 = var_8.origin;

    if ( isdefined( self._id_22F0 ) )
    {
        if ( squared( self._id_22F0 ) > distancesquared( var_7, var_6 ) )
            return 0;
    }
    else if ( distancesquared( var_7, var_6 ) < 7056 )
        return 0;

    var_5 = getmovedelta( var_0, 0, 1 );
    var_9 = self localtoworldcoords( var_5 );
    var_9 = var_6 + vectornormalize( var_9 - var_6 ) * 20;
    var_10 = _func_272( var_6, var_9, self );

    if ( var_10 )
        return 0;

    if ( isdefined( self._id_7198 ) )
        return self [[ self._id_7198 ]]( var_0, var_1, var_2 );

    return 1;
}

_id_8118( var_0, var_1 )
{
    var_2 = [];
    var_3 = "";

    if ( isdefined( var_1 ) && var_1 && self._id_2303._id_7257._id_7254 == "right" )
        var_3 = "right";
    else
        var_3 = "left";

    var_2[0] = scripts\asm\asm::_id_2358( var_0, var_3 + "2" );
    var_2[1] = scripts\asm\asm::_id_2358( var_0, var_3 + "3" );
    var_2[2] = scripts\asm\asm::_id_2358( var_0, var_3 + "6" );
    var_2[3] = scripts\asm\asm::_id_2358( var_0, var_3 + "9" );
    var_2[5] = scripts\asm\asm::_id_2358( var_0, var_3 + "7" );
    var_2[6] = scripts\asm\asm::_id_2358( var_0, var_3 + "4" );
    var_2[7] = scripts\asm\asm::_id_2358( var_0, var_3 + "1" );
    var_2[8] = scripts\asm\asm::_id_2358( var_0, var_3 + "2" );
    return var_2;
}

_id_8117( var_0, var_1 )
{
    if ( isdefined( self._id_7C54 ) )
        return [[ self._id_7C54 ]]( var_0, var_1 );

    return _id_8118( var_0, var_1 );
}

_id_4EAB( var_0 )
{

}

_id_D4E5( var_0, var_1, var_2, var_3 )
{
    _id_98A2( var_0, var_1, var_2, var_3 );
    _id_BCFC( var_0, var_1, var_2 );
}

_id_98A2( var_0, var_1, var_2, var_3 )
{

}

_id_BCFC( var_0, var_1, var_2 )
{
    self endon( var_1 + "_finished" );
    var_3 = scripts\asm\asm::_id_2358( var_1, "f" );
    var_4 = scripts\asm\asm::_id_2358( var_1, "l" );
    var_5 = scripts\asm\asm::_id_2358( var_1, "r" );
    var_6 = scripts\asm\asm::_id_2358( var_1, "b" );
    self _meth_8281( "code_move" );
    var_7 = -1;
    var_8 = -1;

    for (;;)
    {
        var_9 = scripts\anim\utility_common::_id_DB51( self _meth_813E() );

        if ( var_9["back"] == 1.0 )
            var_8 = var_6;
        else if ( var_9["left"] == 1.0 )
            var_8 = var_4;
        else if ( var_9["right"] == 1.0 )
            var_8 = var_5;
        else
            var_8 = var_3;

        if ( var_8 != var_7 )
            self setanimstate( var_1, var_8 );

        var_7 = var_8;
        wait 0.25;
    }
}
