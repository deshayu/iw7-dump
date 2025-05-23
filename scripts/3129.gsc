// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_3EA8( var_0, var_1, var_2 )
{
    return 0;
}

_id_CEC6( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\asm\asm_mp::_id_2337( var_0, var_1 );
    var_5 = _id_7EE8( var_4 );
    var_6 = scripts\asm\asm_bb::_id_2930();

    if ( var_6 == self._id_010C )
        var_7 = _id_128A2( var_0, var_1, var_6, undefined, var_4, var_2, var_5 );
    else
        var_7 = 0;

    if ( !var_7 )
    {
        self endon( var_1 + "_finished" );
        wait 0.2;
        scripts\asm\asm::_id_2330( var_1, "end" );
    }
}

_id_128A2( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isdefined( var_8 ) )
        var_8 = 1;

    var_10 = self._id_1491._id_870D;

    if ( !isdefined( var_4 ) )
        return 0;

    if ( isdefined( var_3 ) )
    {
        if ( !isdefined( var_7 ) )
            var_11 = self _meth_806C( var_6, var_3, var_8, "min energy", "min time", "max time" );
        else
            var_11 = self _meth_806C( var_6, var_3, var_8, "min time", "min energy" );
    }
    else
    {
        var_12 = self._id_DCAF;
        var_13 = distance( var_2.origin, self.origin );

        if ( var_13 < 800 )
        {
            if ( var_13 < 256 )
                var_12 = 0;
            else
                var_12 = var_12 * ( ( var_13 - 256 ) / 544 );
        }

        if ( !isdefined( var_7 ) )
            var_11 = self _meth_806B( var_6, var_12, "min energy", "min time", "max time" );
        else
            var_11 = self _meth_806B( var_6, var_12, "min time", "min energy" );
    }

    self._id_1491._id_BF84 = gettime() + randomintrange( 1000, 2000 );

    if ( isdefined( var_11 ) )
    {
        if ( !isdefined( self._id_C3F3 ) )
            self._id_C3F3 = self._id_0163;

        self._id_0163 = 0;
        var_14 = _id_7E6D();
        _id_F72C( self._id_1652, min( gettime() + 3000, var_14 ) );
        var_15 = 0;

        if ( _id_13116() )
        {
            var_2._id_C231++;
            thread _id_DE37( var_1, var_2 );

            if ( var_2._id_C231 > 1 )
                var_15 = 1;

            if ( self._id_1652._id_1191A == "fraggrenade" )
            {
                if ( var_2._id_C231 <= 1 )
                    var_2._id_A98C = gettime();
            }
        }

        if ( isdefined( var_9 ) )
            thread _id_58BA( var_0, var_1, var_4, var_11, var_5, var_14, var_15 );
        else
            _id_58BA( var_0, var_1, var_4, var_11, var_5, var_14, var_15 );

        return 1;
    }
    else
    {

    }

    return 0;
}

_id_7EE8( var_0 )
{
    var_1 = ( 0, 0, 64 );

    if ( isdefined( var_0 ) )
    {
        foreach ( var_4, var_3 in anim._id_85DF )
        {
            if ( var_0 == var_3 )
            {
                var_1 = anim._id_85E1[var_4];
                break;
            }
        }
    }

    if ( var_1[2] == 64 )
    {
        if ( !isdefined( var_0 ) )
        {

        }
        else
        {

        }
    }

    return var_1;
}

_id_7E6D()
{
    var_0 = undefined;
    var_1 = gettime();

    if ( _id_13116() && isdefined( self._id_1652.player._id_86A9 ) )
    {
        var_2 = self._id_1652.player;
        var_0 = var_1 + var_2._id_86A9._id_D396 + randomint( var_2._id_86A9._id_D397 );
    }
    else
        var_0 = var_1 + 30000 + randomint( 30000 );

    return var_0;
}

_id_13116()
{
    return self._id_1652._id_9EFB;
}

_id_DE37( var_0, var_1 )
{
    self endon( "dont_reduce_giptp_on_killanimscript" );
    self waittill( var_0 + "_finished" );
    var_1._id_C231--;
}

_id_89AD( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "killanimscript" );
    self endon( var_1 + "_finished" );
    var_5 = scripts\anim\utility_common::_id_7EE7();
    var_6 = self _meth_8101( var_1, var_2 );
    var_7 = "none";
    var_8 = 0;

    while ( !var_8 )
    {
        self waittill( var_1, var_9 );

        if ( !isarray( var_9 ) )
            var_9 = [ var_9 ];

        foreach ( var_11 in var_9 )
        {
            if ( var_11 == "grenade_left" || var_11 == "grenade_right" )
            {
                var_7 = _id_2481( var_1, var_5, "tag_accessory_right" );
                self._id_9E33 = 1;
            }

            if ( var_11 == "grenade_throw" || var_11 == "grenade throw" )
            {
                var_8 = 1;
                continue;
            }

            if ( var_11 == "end" )
            {
                self._id_1652.player._id_C231--;
                self notify( "dont_reduce_giptp_on_killanimscript" );
                return 0;
            }
        }
    }

    self notify( "dont_reduce_giptp_on_killanimscript" );

    if ( _id_13116() )
        thread _id_13A98( var_1, self._id_1652.player, var_3 );

    self _meth_83C2();

    if ( !_id_13116() )
        _id_F72C( self._id_1652, var_3 );

    if ( var_4 )
    {
        var_19 = self._id_1652.player;

        if ( var_19._id_C231 > 1 || gettime() - var_19._id_A990 < 2000 )
            var_19._id_85E4["double_grenade"] = gettime() + min( 5000, var_19._id_86A9._id_D382 );
    }

    self notify( "stop grenade check" );

    if ( var_7 != "none" )
        self _meth_8096( var_5, var_7 );
    else
    {

    }

    self._id_9E33 = undefined;
    self._id_0163 = self._id_C3F3;
    self._id_C3F3 = undefined;
}

_id_58BA( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "killanimscript" );
    self endon( var_1 + "_finished" );
    thread _id_89AD( var_0, var_1, var_2, var_5, var_6 );
    scripts\asm\asm_mp::_id_2365( var_0, var_1, var_4, var_2 );
    self waittillmatch( var_1, "end" );
    self notify( "done_grenade_throw" );
    self notify( "weapon_switch_done" );

    if ( !scripts\asm\asm::_id_232B( var_1, "end" ) )
        scripts\asm\asm::_id_2330( var_1, "end" );
}

_id_6B9A()
{
    return 1.5;
}

_id_2481( var_0, var_1, var_2 )
{
    self attach( var_1, var_2 );
    thread _id_5392( var_0, var_1, var_2 );
    return var_2;
}

_id_5392( var_0, var_1, var_2 )
{
    self endon( "stop grenade check" );
    self waittill( var_0 + "_finished" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_C3F3 ) )
    {
        self._id_0163 = self._id_C3F3;
        self._id_C3F3 = undefined;
    }

    self _meth_8096( var_1, var_2 );
}

_id_13A98( var_0, var_1, var_2 )
{
    var_1 endon( "death" );
    _id_13A99( var_0, var_2 );
    var_1._id_C231--;
}

_id_13A99( var_0, var_1 )
{
    var_2 = self._id_1652;
    var_3 = spawnstruct();
    var_3 thread _id_13A9A( 5 );
    var_3 endon( "watchGrenadeTowardsPlayerTimeout" );
    var_4 = self._id_0166;
    var_5 = _id_7EE6( var_0 );

    if ( !isdefined( var_5 ) )
        return;

    _id_F72C( var_2, min( gettime() + 5000, var_1 ) );
    var_6 = 62500;
    var_7 = 160000;

    if ( var_4 == "flash_grenade" )
    {
        var_6 = 810000;
        var_7 = 1690000;
    }

    var_8 = level.players;
    var_9 = var_5.origin;

    for (;;)
    {
        wait 0.1;

        if ( !isdefined( var_5 ) )
            break;

        if ( distancesquared( var_5.origin, var_9 ) < 400 )
        {
            var_10 = [];

            for ( var_11 = 0; var_11 < var_8.size; var_11++ )
            {
                var_12 = var_8[var_11];
                var_13 = distancesquared( var_5.origin, var_12.origin );

                if ( var_13 < var_6 )
                {
                    var_12 _id_85C8( var_2, var_1 );
                    continue;
                }

                if ( var_13 < var_7 )
                    var_10[var_10.size] = var_12;
            }

            var_8 = var_10;

            if ( var_8.size == 0 )
                break;

            var_9 = var_5.origin;
        }
    }
}

_id_85C8( var_0, var_1 )
{
    var_2 = self;
    anim._id_11813 = undefined;

    if ( gettime() - var_2._id_A990 < 3000 )
        var_2._id_85E4["double_grenade"] = gettime() + var_2._id_86A9._id_D382;

    var_2._id_A990 = gettime();
    var_3 = var_2._id_85E4[var_0._id_1191A];
    var_2._id_85E4[var_0._id_1191A] = max( var_1, var_3 );
}

_id_F72C( var_0, var_1 )
{
    if ( var_0._id_9EFB )
    {
        var_2 = var_0.player;
        var_3 = var_2._id_85E4[var_0._id_1191A];
        var_2._id_85E4[var_0._id_1191A] = max( var_1, var_3 );
    }
    else
    {
        var_3 = anim._id_85E4[var_0._id_1191A];
        anim._id_85E4[var_0._id_1191A] = max( var_1, var_3 );
    }
}

_id_7EE6( var_0 )
{
    self endon( "killanimscript" );
    self endon( var_0 + "_finished" );
    self waittill( "grenade_fire", var_1 );
    return var_1;
}

_id_13A9A( var_0 )
{
    wait( var_0 );
    self notify( "watchGrenadeTowardsPlayerTimeout" );
}

_id_7EE9( var_0 )
{
    if ( var_0._id_9EFB )
        return var_0.player._id_85E4[var_0._id_1191A];
    else
        return anim._id_85E4[var_0._id_1191A];
}

_id_C371( var_0 )
{
    var_1 = anglestoforward( self.angles );
    var_2 = anglestoright( self.angles );
    var_3 = anglestoup( self.angles );
    var_1 = var_1 * var_0[0];
    var_2 = var_2 * var_0[1];
    var_3 = var_3 * var_0[2];
    return var_1 + var_2 + var_3;
}
