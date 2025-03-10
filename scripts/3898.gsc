// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_FFE6()
{
    if ( isdefined( self._id_55B0 ) && self._id_55B0 )
        return 0;

    if ( isdefined( self._id_010C ) && scripts\asm\asm_bb::_id_298E() )
        return 0;

    return 1;
}

_id_C186( var_0, var_1, var_2, var_3 )
{
    return !_id_1008A( var_0, var_1, var_3 );
}

_id_7F95( var_0 )
{
    return 256.0;
}

_id_1008A( var_0, var_1, var_2, var_3 )
{
    if ( !_id_FFE6() )
        return 0;

    if ( !isdefined( self._id_0233 ) )
        return 0;

    if ( isdefined( self._id_0205 ) && ( self._id_0205.type == "Cover Prone" || self._id_0205.type == "Conceal Prone" ) )
        return 0;

    if ( !scripts\asm\asm::_id_232B( var_1, "cover_approach" ) )
        return 0;

    if ( !isdefined( self._id_20EE ) )
        return 0;

    if ( isdefined( var_3 ) )
    {
        if ( !isarray( var_3 ) )
            var_4 = var_3;
        else if ( var_3.size < 1 )
            var_4 = "Exposed";
        else
            var_4 = var_3[0];
    }
    else
        var_4 = "Exposed";

    if ( !_id_9D4C( var_0, var_1, var_2, var_4 ) )
        return 0;

    var_5 = 0;

    if ( isdefined( var_3 ) && isarray( var_3 ) && var_3.size >= 2 && var_3[1] )
        var_5 = 1;

    self._id_2303._id_7360 = scripts\asm\asm_bb::_id_293B();
    self._id_2303._id_11068 = _id_3721( var_0, var_2, var_4, var_5 );

    if ( !isdefined( self._id_2303._id_11068 ) )
        return 0;

    return 1;
}

_id_FFD4( var_0, var_1, var_2, var_3 )
{
    if ( !_id_FFE6() )
        return 0;

    if ( !isdefined( self._id_0233 ) )
        return 0;

    if ( isdefined( self._id_0205 ) && ( self._id_0205.type == "Cover Prone" || self._id_0205.type == "Conceal Prone" ) )
        return 0;

    if ( !scripts\asm\asm::_id_232B( var_1, "cover_approach" ) )
        return 0;

    return 1;
}

_id_10093( var_0, var_1, var_2, var_3 )
{
    return _id_1008A( var_0, var_1, var_2, var_3 );
}

_id_10095( var_0, var_1, var_2, var_3 )
{
    return _id_1008A( var_0, var_1, var_2, var_3 );
}

_id_10091( var_0, var_1, var_2, var_3 )
{
    if ( scripts\asm\asm_bb::_id_2941() )
        return 0;

    return _id_1008A( var_0, var_1, var_2, var_3 );
}

_id_9D4C( var_0, var_1, var_2, var_3 )
{
    var_4 = var_3;

    if ( isdefined( self._id_2303._id_4C86._id_22F1 ) )
        return var_4 == "Custom";

    if ( !isdefined( self._id_0205 ) )
        return var_4 == "Exposed";

    switch ( var_4 )
    {
        case "Exposed":
            return ( self._id_0205.type == "Path" || self._id_0205.type == "Exposed" ) && self._id_0205 doesnodeallowstance( "stand" );
        case "Exposed Crouch":
            if ( scripts\asm\asm_bb::_id_292C() != "crouch" )
                return 0;

            return ( self._id_0205.type == "Path" || self._id_0205.type == "Exposed" ) && self._id_0205 doesnodeallowstance( "crouch" );
        case "Cover Crouch":
            return self._id_0205.type == "Cover Crouch" || self._id_0205.type == "Conceal Crouch";
        case "Cover Stand":
            return self._id_0205.type == "Cover Stand" || self._id_0205.type == "Conceal Stand";
        case "Cover Prone":
            return self._id_0205.type == "Cover Prone" || self._id_0205.type == "Conceal Prone";
        case "Cover Left":
            return self._id_0205.type == "Cover Left" && self._id_0205 doesnodeallowstance( "stand" );
        case "Cover Left Crouch":
            return self._id_0205.type == "Cover Left" && self._id_0205 doesnodeallowstance( "crouch" );
        case "Cover Right":
            return self._id_0205.type == "Cover Right" && self._id_0205 doesnodeallowstance( "stand" );
        case "Cover Right Crouch":
            return self._id_0205.type == "Cover Right" && self._id_0205 doesnodeallowstance( "crouch" );
    }

    return var_4 == self._id_0205.type;
}

_id_3E97( var_0, var_1, var_2 )
{
    return self._id_2303._id_11068;
}

_id_3721( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_7DD6();

    if ( isdefined( var_4 ) )
        var_5 = var_4.origin;
    else
        var_5 = self._id_0233;

    var_6 = _id_7E54();
    var_7 = self._id_20EE;
    var_8 = vectortoangles( var_7 );

    if ( isdefined( var_6 ) )
        var_9 = angleclamp180( var_6[1] - var_8[1] );
    else if ( isdefined( var_4 ) && var_4.type != "Path" )
        var_9 = angleclamp180( var_4.angles[1] - var_8[1] );
    else
    {
        var_10 = var_5 - self.origin;
        var_11 = vectortoangles( var_10 );
        var_9 = angleclamp180( var_11[1] - var_8[1] );
    }

    var_12 = getangleindex( var_9, 22.5 );
    var_13 = var_1;

    if ( var_2 == "Custom" )
    {
        var_14 = _id_8174( self._id_2303._id_4C86._id_22F1, undefined, self._id_2303._id_4C86._id_22F6 );
        var_13 = self._id_2303._id_4C86._id_22F1;
    }
    else
        var_14 = _id_8174( var_1, undefined, var_3 );

    var_15 = _id_8177();
    var_16 = var_5 - self.origin;
    var_17 = lengthsquared( var_16 );
    var_18 = var_14[var_12];

    if ( !isdefined( var_18 ) )
        return undefined;

    var_19 = self getanimentry( var_13, var_18 );
    var_20 = getmovedelta( var_19 );
    var_21 = _func_078( var_19 );
    var_22 = length( self _meth_816B() );
    var_23 = var_22 * 0.053;
    var_24 = length( var_16 );
    var_25 = length( var_20 );

    if ( abs( var_24 - var_25 ) > var_23 )
        return undefined;

    if ( var_17 < lengthsquared( var_20 ) )
        return undefined;

    var_26 = _id_36D9( var_15._id_D699, var_15._id_0130[1], var_20, var_21 );
    var_27 = getclosestpointonnavmesh( var_15._id_D699, self );
    var_28 = _id_36D9( var_27, var_15._id_0130[1], var_20, var_21 );
    var_29 = self _meth_84AC();
    var_30 = var_2 == "Cover Left" || var_2 == "Cover Right" || var_2 == "Cover Left Crouch" || var_2 == "Cover Right Crouch";

    if ( var_30 && ( var_12 == 0 || var_12 == 8 || var_12 == 7 || var_12 == 1 ) )
    {
        var_31 = undefined;
        var_32 = undefined;
        var_33 = getnotetracktimes( var_19, "corner" );

        if ( var_33.size > 0 )
        {
            var_31 = getmovedelta( var_19, 0, var_33[0] );
            var_32 = var_33[0];
        }
        else
        {
            var_34 = undefined;
            var_35 = undefined;

            if ( var_2 == "Cover Left" || var_2 == "Cover Left Crouch" )
            {
                var_34 = "left";

                if ( var_12 == 7 )
                    var_35 = "7";
                else if ( var_12 == 0 || var_12 == 8 )
                    var_35 = "8";
            }
            else if ( var_2 == "Cover Right" || var_2 == "Cover Right Crouch" )
            {
                var_34 = "right";

                if ( var_12 == 0 || var_12 == 8 )
                    var_35 = "8";
                else if ( var_12 == 1 )
                    var_35 = "9";
            }

            if ( isdefined( var_34 ) && isdefined( var_35 ) )
            {
                var_31 = _id_81DF( var_0, var_1, var_35, var_3 );
                var_32 = _id_814C( var_0, var_1, var_35, var_3 );
            }
        }

        if ( isdefined( var_31 ) )
        {
            var_31 = rotatevector( var_31, ( 0, var_15._id_0130[1] - var_21, 0 ) );
            var_31 = var_28 + var_31;
            var_36 = _func_272( var_29, var_31, self, 1 );

            if ( var_36["fraction"] >= 0.9 || _func_2AC( var_29, var_31, self ) )
            {
                var_37 = spawnstruct();
                var_37._id_11060 = var_18;
                var_37._id_003F = var_12;
                var_37._id_02C5 = var_26;
                var_37._id_003E = var_21;
                var_37.angles = var_15.angles;
                var_37._id_0130 = var_15._id_0130;
                var_37._id_01F3 = var_20;
                var_37._id_0357 = var_31;
                var_37._id_02BD = var_32;
                return var_37;
            }
        }
    }
    else
    {
        var_36 = _func_272( var_29, var_27, self, 1 );
        var_38 = var_36["fraction"] >= 0.9 || _func_2AC( var_29, var_27, self );

        if ( !var_38 )
        {
            var_39 = self _meth_841E();
            var_38 = var_39 < distance( var_29, var_27 ) + 8.0;
        }

        if ( var_38 )
        {
            var_37 = spawnstruct();
            var_37._id_11060 = var_18;
            var_37._id_003F = var_12;
            var_37._id_02C5 = var_26;
            var_37._id_003E = var_21;
            var_37.angles = var_15.angles;
            var_37._id_0130 = var_15._id_0130;
            var_37._id_11069 = var_20;
            var_37._id_22ED = var_5;
            return var_37;
        }
    }

    return undefined;
}

_id_CECA( var_0, var_1 )
{
    self endon( "runto_arrived" );
    self endon( var_1 + "_finished" );
    var_2 = self._id_015B;

    for (;;)
    {
        self waittill( "path_set" );
        var_3 = self._id_015B;

        if ( !self._id_015D )
            break;

        if ( distancesquared( var_2, var_3 ) > 1 )
            break;

        var_2 = var_3;
    }

    scripts\asm\asm::_id_2330( var_1, "abort" );
}

_id_CEC9( var_0, var_1 )
{
    self endon( "runto_arrived" );
    self endon( var_1 + "_finished" );

    for (;;)
    {
        if ( !isdefined( self._id_0233 ) )
            break;

        wait 0.05;
    }

    scripts\asm\asm::_id_2330( var_1, "abort" );
}

_id_136F5( var_0 )
{
    self endon( var_0 + "_finished" );
    self endon( "waypoint_reached" );
    self endon( "waypoint_aborted" );
    wait 2;
}

_id_CEAA( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    var_4 = _id_7DD6();
    var_5 = scripts\asm\asm_mp::_id_2337( var_0, var_1 );

    if ( !isdefined( var_5 ) )
    {
        scripts\asm\asm::_id_2330( var_1, "abort", undefined );
        return;
    }

    var_6 = scripts\asm\asm::_id_2340();

    if ( !isdefined( var_6 ) )
        var_6 = 1.0;

    var_7 = var_5._id_0130;
    var_8 = var_5._id_003F;
    var_9 = ( 0, var_7[1] - var_5._id_003E, 0 );
    var_10 = self getanimentry( var_1, var_5._id_11060 );
    var_11 = getanimlength( var_10 );
    var_11 = var_11 * ( 1 / var_6 );
    self _meth_8396( var_5._id_02C5, var_9[1], var_11 );
    scripts\asm\asm_mp::_id_2365( var_0, var_1, var_2, var_5._id_11060, var_6 );
}

_id_22EA()
{
    self endon( "killanimscript" );
    self waittill( self._id_22E5 + "_finished" );
}

_id_7DD6()
{
    if ( isdefined( self._id_028B ) )
        return self._id_028B;

    if ( isdefined( self._id_0205 ) )
        return self._id_0205;

    if ( isdefined( self._id_024A ) && isdefined( self._id_0233 ) && distance2dsquared( self._id_024A.origin, self._id_0233 ) < 36 )
        return self._id_024A;

    return undefined;
}

_id_7E54()
{
    if ( isdefined( self._id_2303._id_4C86._id_22E3 ) )
        return self._id_2303._id_4C86._id_22E3;

    return undefined;
}

_id_8177()
{
    var_0 = spawnstruct();
    var_1 = _id_7DD6();

    if ( isdefined( var_1 ) && var_1.type != "Path" )
    {
        var_0._id_D699 = var_1.origin;
        var_0.angles = var_1.angles;
        var_0._id_0130 = ( 0, scripts\asm\shared\utility::_id_7FF7( var_1 ), 0 );
    }
    else
    {
        var_0._id_D699 = self._id_0233;
        var_2 = self _meth_816B();
        var_3 = self _meth_813A();

        if ( lengthsquared( var_2 ) > 1 )
            var_0.angles = vectortoangles( var_0._id_D699 - self.origin );
        else
            var_0.angles = vectortoangles( var_3 );

        var_0._id_0130 = var_0.angles;
    }

    var_4 = _id_7E54();

    if ( isdefined( var_4 ) )
    {
        var_0.angles = var_4;
        var_0._id_0130 = var_0.angles;
    }

    return var_0;
}

_id_36D9( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1 - var_3;
    var_5 = ( 0, var_4, 0 );
    var_6 = rotatevector( var_2, var_5 );
    return var_0 - var_6;
}

_id_8174( var_0, var_1, var_2 )
{
    var_3 = [];
    var_3[5] = scripts\asm\asm::_id_235C( 1, var_0, var_2 );
    var_3[4] = scripts\asm\asm::_id_235C( 2, var_0, var_2 );
    var_3[3] = scripts\asm\asm::_id_235C( 3, var_0, var_2 );
    var_3[6] = scripts\asm\asm::_id_235C( 4, var_0, var_2 );
    var_3[2] = scripts\asm\asm::_id_235C( 6, var_0, var_2 );
    var_3[7] = scripts\asm\asm::_id_235C( 7, var_0, var_2 );
    var_3[0] = scripts\asm\asm::_id_235C( 8, var_0, var_2 );
    var_3[1] = scripts\asm\asm::_id_235C( 9, var_0, var_2 );
    var_3[8] = var_3[0];
    return var_3;
}

_id_814C( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_4["cover_left_arrival"]["7"] = 0.369369;
    var_4["cover_left_crouch_arrival"]["7"] = 0.321321;
    var_4["cqb_cover_left_crouch_arrival"]["7"] = 0.2002;
    var_4["cqb_cover_left_arrival"]["7"] = 0.275275;
    var_4["cover_left_arrival"]["8"] = 0.525526;
    var_4["cover_left_crouch_arrival"]["8"] = 0.448448;
    var_4["cqb_cover_left_crouch_arrival"]["8"] = 0.251251;
    var_4["cqb_cover_left_arrival"]["8"] = 0.335335;
    var_4["cover_right_arrival"]["8"] = 0.472472;
    var_4["cover_right_crouch_arrival"]["8"] = 0.248248;
    var_4["cqb_cover_right_arrival"]["8"] = 0.345345;
    var_4["cqb_cover_right_crouch_arrival"]["8"] = 0.428428;
    var_4["cover_right_arrival"]["9"] = 0.551552;
    var_4["cover_right_crouch_arrival"]["9"] = 0.2002;
    var_4["cqb_cover_right_arrival"]["9"] = 0.3003;
    var_4["cqb_cover_right_crouch_arrival"]["9"] = 0.224224;
    return var_4[var_1][var_2];
}

_id_81DF( var_0, var_1, var_2, var_3 )
{
    return undefined;
}

_id_1008F( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self._id_20EE ) )
        return 0;

    var_4 = undefined;

    if ( isdefined( var_3 ) )
    {
        if ( !isarray( var_3 ) )
            var_4 = var_3;
        else if ( var_3.size < 1 )
            var_4 = "Exposed";
        else
            var_4 = var_3[0];
    }
    else
        var_4 = "Exposed";

    if ( !_id_9D4C( var_0, var_1, var_2, var_4 ) )
        return 0;

    var_5 = distance( self.origin, self._id_0233 );
    var_6 = _id_7F95( var_4 );

    if ( var_5 > var_6 )
        return 0;

    var_7 = 0;

    if ( isdefined( var_3 ) && var_3.size >= 2 )
        var_7 = 1;

    self._id_2303._id_7360 = scripts\asm\asm_bb::_id_293B();
    self._id_2303._id_11068 = _id_3721( var_0, var_2, var_4, var_7 );

    if ( !isdefined( self._id_2303._id_11068 ) )
        return 0;

    return 1;
}
