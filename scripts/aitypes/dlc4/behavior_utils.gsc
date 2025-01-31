// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

pickbetterenemy( var_0, var_1 )
{
    var_2 = self _meth_805F( var_0 );
    var_3 = self _meth_805F( var_1 );

    if ( var_2 != var_3 )
    {
        if ( var_2 )
            return var_0;

        return var_1;
    }

    var_4 = distancesquared( self.origin, var_0.origin );
    var_5 = distancesquared( self.origin, var_1.origin );

    if ( var_4 < var_5 )
        return var_0;

    return var_1;
}

shouldignoreenemy( var_0 )
{
    if ( !isalive( var_0 ) )
        return 1;

    if ( var_0._id_0184 || isdefined( var_0.owner ) && var_0.owner._id_0184 )
        return 1;

    if ( _id_0F74::_id_1002C( var_0 ) )
        return 1;

    return 0;
}

_id_12E8A()
{
    if ( isdefined( self.myenemy ) && !shouldignoreenemy( self.myenemy ) )
    {
        if ( gettime() - self.myenemystarttime < 3000 )
            return self.myenemy;
    }

    var_0 = undefined;

    foreach ( var_2 in level.players )
    {
        if ( shouldignoreenemy( var_2 ) )
            continue;

        if ( scripts\engine\utility::_id_9CEE( var_2.isfasttravelling ) )
            continue;

        if ( !isdefined( var_0 ) )
        {
            var_0 = var_2;
            continue;
        }

        var_0 = pickbetterenemy( var_0, var_2 );
    }

    if ( !isdefined( var_0 ) )
    {
        self.myenemy = undefined;
        return undefined;
    }

    if ( !isdefined( self.myenemy ) || var_0 != self.myenemy )
    {
        self.myenemy = var_0;
        self.myenemystarttime = gettime();
    }
}

getpredictedenemypos( var_0, var_1 )
{
    var_2 = var_0 _meth_816B();
    var_3 = length2d( var_2 );
    var_4 = var_0.origin + var_2 * var_1;
    return var_4;
}

facepoint( var_0 )
{
    var_1 = scripts\engine\utility::_id_824D( var_0 );

    if ( abs( var_1 ) < 8 )
    {
        var_2 = ( self.angles[0], self.angles[1] + var_1, self.angles[2] );
        self orientmode( "face angle abs", var_2 );
        return;
    }

    self.desiredyaw = var_1;
}
