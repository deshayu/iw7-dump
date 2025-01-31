// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_6B8F()
{
    _id_95D9();
    level._id_6B90 = [];
    level.zipline_negotiation = getnode( "zombie_zipline", "script_noteworthy" );
    var_0 = getentarray( "zipline_trigger", "targetname" );
    level.zipline_traversals = [];
    level.ziplines_achievement_trigger_list = [];
    level.ziplines_achievement_trigger_list = var_0;

    foreach ( var_2 in var_0 )
        var_2 thread _id_97AD();

    level thread watch_for_zipline_achievement();
}

watch_for_zipline_achievement()
{
    level endon( "game_ended" );
    level endon( "zipline_achievement_done" );

    while ( level.ziplines_achievement_trigger_list.size > 0 )
        scripts\engine\utility::waitframe();

    foreach ( var_1 in level.players )
        var_1 _id_0D2A::_id_12D7C( "RIDE_FOR_YOUR_LIFE", 4 );

    level notify( "zipline_achievement_done" );
}

_id_95D9()
{
    level._id_28C9 = loadfx( "vfx/core/mp/core/vfx_battle_slide_camera" );
}

_id_97AD()
{
    level endon( "game_ended" );
    self._id_0019 = 0;
    self._id_13EFC = scripts\engine\utility::_id_817E( self._id_0334, "targetname" );

    for ( var_0 = scripts\engine\utility::_id_817E( self._id_13EFC._id_0334, "targetname" ); isdefined( var_0._id_0334 ); var_0 = scripts\engine\utility::_id_817E( var_0._id_0334, "targetname" ) )
    {

    }

    self._id_13EFB = var_0;
    scripts\engine\utility::_id_6E4C( "init_spawn_volumes_done" );
    self._id_164A = undefined;

    foreach ( var_2 in level._id_10816 )
    {
        if ( ispointinvolume( self._id_13EFB.origin, var_2 ) )
        {
            self._id_164A = var_2;
            break;
        }
    }

    if ( !isdefined( self._id_164A ) )
        return;
    else
    {

    }

    self._id_13EFC._id_62E4 = self._id_13EFB;
    self._id_13EFC.trigger = self;
    self._id_13EFB._id_10CBA = self._id_13EFC;
    self._id_13EFB.trigger = self;

    for (;;)
    {
        level waittill( "volume_activated", var_4 );

        if ( var_4 == self._id_164A._id_28AB )
        {
            activate_zipline();
            break;
        }
    }
}

activate_zipline()
{
    self._id_0019 = 1;
    thread _id_AD5D();

    if ( isdefined( level.zipline_negotiation ) )
    {
        var_0 = scripts\engine\utility::_id_5D14( self._id_13EFC.origin, 0, -512 );
        var_1 = scripts\engine\utility::_id_5D14( self._id_13EFB.origin, 0, -512 );
        level.zipline_traversals[level.zipline_traversals.size] = self;
        self.traversal_start = var_0;
        self.traversal_end = var_1;
        createnavlink( self._id_0334, var_0, var_1, level.zipline_negotiation, 64, 1 );
    }
}

_id_AD5D()
{
    var_0 = 0.1;
    var_1 = gettime();
    var_2 = [];

    for (;;)
    {
        self waittill( "trigger", var_3 );

        if ( isplayer( var_3 ) )
        {
            var_3 _meth_80F4( &"CP_RAVE_USE_ZIPLINE" );
            var_3 thread handle_zipline_hint( self );

            if ( var_3 isjumping() )
            {
                if ( !scripts\engine\utility::_id_9CEE( var_3._id_9BE1 ) )
                {
                    scripts\engine\utility::_id_12778();
                    var_3._id_9BE1 = 1;
                    thread player_zipline_travel( var_3, var_1 );
                    var_3 _id_0A5E::_id_D9AD( "mt_dlc1_all_ziplines" );

                    if ( scripts\engine\utility::array_contains( level.ziplines_achievement_trigger_list, self ) )
                        level.ziplines_achievement_trigger_list = scripts\engine\utility::array_remove( level.ziplines_achievement_trigger_list, self );

                    var_1 = gettime() + 500;
                    wait 1;
                    scripts\engine\utility::_id_1277A();
                }
            }
        }

        wait( var_0 );
    }
}

handle_zipline_hint( var_0 )
{
    self endon( "disconnect" );

    if ( isdefined( self.zipline_hint ) )
        return;

    self.zipline_hint = 1;

    while ( !_id_0A5B::_id_D0EF( self ) && !scripts\engine\utility::_id_9CEE( self._id_9BE1 ) && self istouching( var_0 ) )
        wait 0.05;

    self.zipline_hint = undefined;
    self _meth_80F3();
}

_id_5591( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_0._id_3859 = 0;
    var_0 waittill( var_2 );
    wait( var_1 );
    var_0._id_3859 = 1;
    var_0 notify( "can_teleport" );
}

player_zipline_travel( var_0, var_1 )
{
    var_0 endon( "disconnect" );
    var_0 thread _id_0A6A::_id_12885( "zipline_use", "rave_comment_vo" );
    var_0 _meth_85B3( "zipline", 1 );
    var_0 scripts\engine\utility::_id_1C40( 0 );
    var_0 scripts\engine\utility::_id_1C60( 0 );
    var_0 _meth_80A4();
    var_0._id_5511 = 1;
    var_0 scripts\engine\utility::_id_1C35( 0 );
    var_0 scripts\engine\utility::_id_1C4E( 0 );
    var_0 scripts\engine\utility::_id_1C53( 0 );
    var_0 scripts\engine\utility::_id_1C62( 0 );
    var_0 _meth_809C();
    var_0 scripts\engine\utility::_id_1C76( 0 );
    var_0 _meth_857E( 1 );
    var_2 = player_zipline( var_0, var_1 );
    var_0 _meth_8553( "zombiedefault" );
    wait 0.1;
    var_0 scripts\engine\utility::_id_1C35( 1 );
    var_0 scripts\engine\utility::_id_1C4E( 1 );
    var_0 scripts\engine\utility::_id_1C53( 1 );
    var_0 scripts\engine\utility::_id_1C62( 1 );
    var_0 scripts\engine\utility::_id_1C40( 1 );
    var_0 scripts\engine\utility::_id_1C60( 1 );
    var_0 _meth_80C9();
    var_0 scripts\engine\utility::_id_1C76( 1 );
    var_0 _meth_857E( 0 );
    var_0 notify( "fast_travel_complete" );
    var_0 thread _id_0A6A::_id_12885( "zipline_exit", "rave_comment_vo" );
}

delay_nearby_zombie_cleanup()
{
    var_0 = _id_0A4A::_id_7DB0( "axis" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_010C ) && var_2._id_010C == self && distancesquared( var_2.origin, self.origin ) < 272144 )
            var_2.delay_cleanup_until = gettime() + 12000;
    }
}

player_zipline( var_0, var_1 )
{
    var_0 endon( "disconnect" );
    var_0 _meth_844F( 0.3, 0.2, var_0.origin, 200 );
    var_0 playsound( "rave_zipline_start" );
    var_2 = self._id_13EFC;
    var_3 = self._id_13EFB;
    var_0 _meth_805B();
    var_4 = var_2.origin + ( 0, 0, -45 );
    var_5 = var_3.origin + ( 0, 0, -45 );
    var_0.zipline = self;
    var_0 delay_nearby_zombie_cleanup();
    var_0 setorigin( var_4 + ( 0, 0, -45 ) );
    var_0 setplayerangles( var_2.angles );
    var_6 = spawn( "script_model", var_4 );
    var_6.angles = var_2.angles;
    var_6 setmodel( "tag_origin" );
    var_7 = getent( "zipline_cord", "targetname" );

    if ( isdefined( var_7 ) )
        var_7 linkto( var_6 );

    var_8 = getent( "zipline_handle", "targetname" );

    if ( isdefined( var_8 ) )
        var_8 linkto( var_6 );

    var_0 _meth_823A( var_6, undefined, 0.5, 20, 10, 50, 40 );
    var_6 playloopsound( "rave_zipline_lp" );
    var_0 playlocalsound( "rave_zipline_wind_lr" );
    var_0 _meth_8234();
    var_0 _meth_8441( "ges_zipline" );

    while ( var_1 > gettime() )
        wait 0.05;

    wait 1;
    var_0 _meth_8553( "zombiearcade" );
    var_9 = var_0 _meth_816D();
    var_0 setviewmodel( "viewmodel_arms_invisi" );
    var_10 = var_2;
    var_11 = scripts\engine\utility::_id_8180( var_10._id_0334, "targetname" );
    var_12 = scripts\engine\utility::_id_DC6B( var_11 );
    var_13 = distance( var_10.origin, var_5 );
    var_1 = var_13 / 500;
    var_6 moveto( var_5, var_1 );
    var_0 thread _id_ECC7( var_1 );
    wait( var_1 );

    for ( var_10 = var_12; isdefined( var_10._id_0334 ); var_10 = var_12 )
    {
        var_11 = scripts\engine\utility::_id_8180( var_10._id_0334, "targetname" );
        var_12 = scripts\engine\utility::_id_DC6B( var_11 );
        var_5 = var_12.origin;
        var_13 = distance( var_10.origin, var_5 );
        var_1 = var_13 / 500;
        var_6 moveto( var_5, var_1 );
        var_0 thread _id_ECC7( var_1 );
        wait( var_1 );
    }

    var_0 _meth_8442( "ges_zipline", 0.1, 0 );
    var_0 playsound( "rave_zipline_stop" );
    var_6 stoploopsound( "rave_zipline_lp" );
    var_0 setviewmodel( var_9 );
    var_0._id_9BE1 = undefined;
    var_0.zipline = undefined;
    var_0 _meth_855A( 1 );
    var_0._id_13EFD = vectornormalize( anglestoforward( var_0.angles ) ) * 500 * 0.1;
    var_0 unlink();
    var_0 stopolcalsound( "rave_zipline_wind_lr" );
    var_0 stopolcalsound( "rave_zipline_wind_lsrs" );
    var_0 _meth_85B3( "zipline", 0 );
    var_0 _meth_8366( var_0._id_13EFD );
    var_0._id_5511 = undefined;
    var_0 _meth_80D6();
    var_6 notify( "stop_sway" );
    wait 0.5;
    var_6 delete();
    var_0 _meth_855A( 0 );
    var_0 thread clear_zipline_landing_area();
}

clear_zipline_landing_area()
{
    self endon( "disconnect" );

    while ( !self isonground() )
    {
        foreach ( var_1 in level.players )
        {
            if ( var_1 == self )
                continue;

            if ( distance2d( var_1.origin, self.origin ) < 24 )
                var_1 _meth_8366( ( -50, -100, 0 ) );
        }

        wait 0.1;
    }
}

_id_11325( var_0, var_1, var_2 )
{
    self endon( "stop_sway" );
    var_3 = 10;
    var_4 = 0.5;
    var_5 = self.angles;
    var_6 = int( var_0 );
    var_7 = 1;

    for ( var_8 = 0; var_8 < var_6; var_8++ )
    {
        if ( var_7 )
        {
            var_7 = 0;
            self _meth_8271( var_3, var_4, 0.2, 0.2 );
            wait( var_4 );
            wait 0.1;
            self _meth_8271( var_3 * -1, var_4, 0.2, 0.2 );
            wait( var_4 );
            continue;
        }

        var_7 = 1;
        self _meth_8271( var_3 * -1, var_4, 0.2, 0.2 );
        wait( var_4 );
        wait 0.1;
        self _meth_8271( var_3, var_4, 0.2, 0.2 );
        wait( var_4 );
    }

    self rotateto( var_5, 1 );
}

_id_ECC7( var_0 )
{
    var_1 = gettime();
    var_2 = gettime() + var_0 * 1000;

    for ( var_3 = spawnfxforclient( level._id_28C9, self geteye(), self ); var_1 < var_2; var_1 = gettime() )
    {
        var_3.origin = self geteye();
        triggerfx( var_3 );
        earthquake( 0.2, 0.25, self.origin, 96 );
        self playrumbleonentity( "slide_loop" );
        scripts\engine\utility::waitframe();
    }

    if ( isdefined( var_3 ) )
        var_3 delete();
}

_id_1164E( var_0 )
{
    var_1 = undefined;

    while ( !isdefined( var_1 ) )
    {
        foreach ( var_3 in self._id_62EF )
        {
            if ( !positionwouldtelefrag( var_3.origin ) )
                var_1 = var_3;
        }

        wait 0.1;
    }

    var_0 unlink();
    var_0 dontinterpolate();
    var_0 setorigin( var_1.origin );
    var_0 setplayerangles( var_1.angles );
    var_0._id_5511 = undefined;
    var_0 _meth_80D6();
}
