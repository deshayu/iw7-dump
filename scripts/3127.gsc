// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_3EE5( var_0, var_1, var_2 )
{
    return _id_0F3C::_id_3EF4( var_0, var_1, var_2 );
}

_id_3EE6( var_0, var_1, var_2 )
{
    return _id_0F3C::_id_3EF4( var_0, var_1, var_2 );
}

_id_3EE7( var_0, var_1, var_2 )
{
    return _id_0F3C::_id_3EF4( var_0, var_1, var_2 );
}

_id_3EEB( var_0, var_1, var_2 )
{
    return _id_0F3C::_id_3EF4( var_0, var_1, var_2 );
}

_id_3EEC( var_0, var_1, var_2 )
{
    return _id_0F3C::_id_3EF4( var_0, var_1, var_2 );
}

_id_3EE8( var_0, var_1, var_2 )
{
    return _id_0F3C::_id_3EF4( var_0, var_1, var_2 );
}

_id_CF04( var_0, var_1, var_2, var_3 )
{

}

_id_D4EE( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "terminate_ai_threads" );
    var_4 = anim._id_2303[var_0]._id_10E2F[var_1]._id_71A5;
    var_5 = self [[ var_4 ]]( var_0, var_1, var_3 );

    if ( isdefined( self._id_0233 ) )
    {
        self _meth_8281( "anim deltas" );
        self orientmode( "face angle abs", self.angles );
    }

    scripts\asm\asm_mp::_id_2365( var_0, var_1, var_2, var_5 );
    _id_6CE0( var_0, var_1, var_3 );
}

_id_6CE0( var_0, var_1, var_2 )
{
    self notify( "killanimscript" );
    var_3 = anim._id_2303[var_0]._id_10E2F[var_1];
    var_4 = var_2;

    if ( !isdefined( var_4 ) )
    {
        if ( isdefined( var_3._id_1267B ) && var_3._id_1267B.size > 0 )
            return;

        var_4 = "exposed_idle";
    }

    scripts\asm\asm::_id_2388( var_0, var_1, var_3, var_3._id_116FB );
    scripts\asm\asm::_id_238A( var_0, var_4, 0.2, undefined, undefined, undefined );
}

_id_4109( var_0, var_1, var_2 )
{

}
