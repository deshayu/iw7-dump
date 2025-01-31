// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    level._id_26A0 = [];
    level.player_character_info = [];
    level thread _id_50C9();
}

_id_50C9()
{
    wait 4.5;
    setomnvar( "zm_player_photo", 0 );
    setomnvar( "zm_player_status", 0 );
    setomnvar( "zm_player_character", 4095 );
}

_id_8361( var_0, var_1 )
{
    if ( !isdefined( level._id_CA60 ) )
        _id_958F();

    var_2 = self;
    var_2._id_3C64 = undefined;
    var_2 takeallweapons();

    if ( !scripts\engine\utility::_id_9CEE( var_2.keep_perks ) )
        var_2 _id_0A77::_id_11AA();

    var_2 thread delayreturningperks( var_2 );
    var_2 _id_0A77::_id_11D7();
    var_2._id_108EF = 0;

    if ( isdefined( var_2._id_8C98 ) )
        var_2._id_8C98 = undefined;

    var_3 = _id_7B89();

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    var_2 thread _id_F7A2( var_3 );
    var_4 = _id_8078();
    var_5 = var_2 _id_8070( var_4 );
    var_2 _meth_82C6( var_5 );
    scripts\engine\utility::_id_6E4C( "introscreen_over" );

    if ( isdefined( level._id_BC70 ) )
        self [[ level._id_BC70 ]]();
    else
        _id_12ED5();

    var_2.primaryweapon = "none";
    var_2 thread _id_0A6B::_id_FB18();
    var_2 notify( "giveLoadout" );
    var_2 _id_0A77::giveperk( "specialty_pistoldeath" );
    var_2 _id_0A77::giveperk( "specialty_sprintreload" );
    var_2 _id_0A77::giveperk( "specialty_gung_ho" );
    var_2._id_BCF6 = var_2 _id_0CFF::_id_D878();

    if ( isdefined( var_0 ) && var_0 )
        return;

    var_6 = var_2.melee_weapon;

    if ( isdefined( var_2._id_501B ) )
    {
        var_2.melee_weapon = var_2._id_501B;
        var_6 = var_2._id_501B;
    }

    var_2 giveweapon( var_6 );
    var_2._id_501B = var_6;
    var_2._id_4BF5 = var_6;

    if ( isdefined( var_2.starting_weapon ) )
        var_2._id_501C = var_2.starting_weapon;
    else if ( isdefined( level._id_502E ) )
        var_2._id_501C = level._id_502E;
    else
        var_2._id_501C = "iw7_g18_zmr";

    var_7 = _id_0A77::_id_80D8( var_2._id_501C );
    var_2._id_501C = return_wbk_version_of_weapon( var_2, var_7, var_2._id_501C );

    if ( isdefined( level._id_A913 ) )
        var_2._id_A913 = level._id_A913;
    else
        var_2._id_A913 = var_2._id_501C;

    var_8 = _id_0A77::_id_80D8( var_2._id_501C );
    var_2 _id_0A77::_id_12C6( var_2._id_501C, undefined, undefined, 1 );
    var_2 [[ level._id_BC70 ]]();
    var_9 = spawnstruct();
    var_9._id_B111 = _id_785A( var_2, var_8 );
    var_2._id_C8A2[var_8] = var_9;
    var_2 giveweapon( "super_default_zm" );
    var_2 _meth_84C2( "super_default_zm" );
    var_2._id_10967 = "super_default_zm";

    if ( _func_114() )
        var_2 thread _id_1358A( var_2._id_501C );
    else
        var_2 setspawnweapon( var_2._id_501C, 1 );

    if ( isdefined( level.force_used_clip ) )
        var_2 setweaponammoclip( var_2._id_501C, int( level.force_used_clip / 100 * weaponclipsize( var_2._id_501C ) ) );

    if ( isdefined( level.force_starting_ammo ) )
        var_2 setweaponammostock( var_2._id_501C, level.force_starting_ammo );

    if ( isdefined( level.additional_loadout_func ) )
        [[ level.additional_loadout_func ]]( var_2 );

    var_2 notify( "weapon_level_changed" );
    var_2 _id_F53D();
    var_2 notify( "loadout_given" );
}

return_wbk_version_of_weapon( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );

    if ( !scripts\engine\utility::_id_9CEE( var_0.weaponkitinitialized ) )
        var_0 waittill( "player_weapon_build_kit_initialized" );

    if ( isdefined( var_0._id_13C00[var_1] ) )
        return var_0._id_13C00[var_1];
    else
        return var_2;
}

delayreturningperks( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 waittill( "spawned_player" );
    wait 1;

    if ( scripts\engine\utility::_id_9CEE( var_0.keep_perks ) )
    {
        if ( isdefined( var_0._id_13FA4 ) )
        {
            var_1 = getarraykeys( var_0._id_13FA4 );

            foreach ( var_3 in var_1 )
            {
                if ( isdefined( level._id_462C ) && isdefined( level._id_462C[var_3] ) && isdefined( level._id_462C[var_3]._id_F286 ) )
                    var_0 [[ level._id_462C[var_3]._id_F286 ]]();
            }
        }

        var_0.keep_perks = undefined;
    }
}

release_character_number( var_0 )
{
    var_1 = var_0._id_CFC4;

    if ( !scripts\engine\utility::array_contains( level._id_26A0, var_1 ) && var_1 != 5 && var_1 != 6 )
        level._id_26A0 = scripts\engine\utility::_id_2279( level._id_26A0, var_1 );
}

_id_785A( var_0, var_1 )
{
    if ( isdefined( var_0._id_C8A2[var_1] ) )
        return var_0._id_C8A2[var_1]._id_B111;
    else
        return 1;
}

_id_F7A2( var_0 )
{
    level endon( "game_ended" );
    var_1 = level.player_character_info[var_0];
    self._id_134FD = var_1._id_134FD;
    self.vo_suffix = var_1.vo_suffix;
    self.pap_gesture = var_1.pap_gesture;
    self.pap_gesture_anim = var_1.pap_gesture_anim;
    self.revive_gesture = var_1.revive_gesture;
    self._id_6BA3 = var_1._id_6BA3;
    self.intro_music = var_1.intro_music;
    self.intro_gesture = var_1.intro_gesture;
    self.melee_weapon = var_1.melee_weapon;
    self.starting_weapon = var_1.starting_weapon;
    wait 0.05;
    _id_F68D( var_1.body_model, var_1.head_model, var_1.view_model, var_1.hair_model );
    thread _id_F7F3( self, var_1.photo_index );

    if ( isdefined( var_1.post_setup_func ) )
        [[ var_1.post_setup_func ]]( self );
}

_id_7B89()
{
    var_1 = getdvar( "ui_mapname" );

    if ( isdefined( self._id_CFC4 ) )
        return self._id_CFC4;

    var_2 = scripts\engine\utility::_id_DC6B( level._id_26A0 );

    switch ( var_1 )
    {
        case "cp_zmb":
            if ( self getrankedplayerdata( "cp", "zombiePlayerLoadout", "characterSelect" ) == 1 )
            {
                var_2 = 5;
                self setrankedplayerdata( "cp", "zombiePlayerLoadout", "characterSelect", 0 );
            }
            else if ( self getrankedplayerdata( "cp", "zombiePlayerLoadout", "characterSelect" ) == 5 )
            {
                var_2 = 6;
                self setrankedplayerdata( "cp", "zombiePlayerLoadout", "characterSelect", 0 );
            }

            level._id_26A0 = scripts\engine\utility::array_remove( level._id_26A0, var_2 );
            break;
        case "cp_rave":
            if ( self getrankedplayerdata( "cp", "zombiePlayerLoadout", "characterSelect" ) == 2 )
            {
                var_2 = 5;
                self setrankedplayerdata( "cp", "zombiePlayerLoadout", "characterSelect", 0 );
            }
            else
                level._id_26A0 = scripts\engine\utility::array_remove( level._id_26A0, var_2 );

            break;
        case "cp_disco":
            if ( self getrankedplayerdata( "cp", "zombiePlayerLoadout", "characterSelect" ) == 3 )
            {
                var_2 = 5;
                self setrankedplayerdata( "cp", "zombiePlayerLoadout", "characterSelect", 0 );
            }
            else
                level._id_26A0 = scripts\engine\utility::array_remove( level._id_26A0, var_2 );

            break;
        case "cp_town":
            if ( self getrankedplayerdata( "cp", "zombiePlayerLoadout", "characterSelect" ) == 4 )
            {
                var_2 = 5;
                self setrankedplayerdata( "cp", "zombiePlayerLoadout", "characterSelect", 0 );
            }
            else
                level._id_26A0 = scripts\engine\utility::array_remove( level._id_26A0, var_2 );

            break;
        default:
            level._id_26A0 = scripts\engine\utility::array_remove( level._id_26A0, var_2 );
    }

    self._id_CFC4 = var_2;
    return var_2;
}

_id_F7F3( var_0, var_1 )
{
    var_0 endon( "disconnect" );
    var_2 = var_0 getentitynumber();

    if ( var_2 == 4 )
        var_2 = 0;

    var_0._id_2B17 = _id_786B( var_2 );
    var_0._id_CFC3 = var_1;
    wait 5.0;
    _id_F53E( var_0, "zm_player_character", _id_789E( var_1 ) );
    _id_F53F( var_0, "healthy" );
}

_id_F53F( var_0, var_1 )
{
    _id_F53E( var_0, "zm_player_status", _id_7CAB( var_1 ) );
}

_id_F53E( var_0, var_1, var_2 )
{
    if ( isdefined( var_0._id_2B17 ) )
    {
        _func_1C1( var_1, var_0._id_2B17._id_2B16, var_2._id_2B16 );
        _func_1C1( var_1, var_0._id_2B17._id_2B15, var_2._id_2B15 );
        _func_1C1( var_1, var_0._id_2B17._id_2B14, var_2._id_2B14 );
        var_0.photosetup = 1;
    }
}

_id_786B( var_0 )
{
    var_1 = spawnstruct();

    switch ( var_0 )
    {
        case 3:
            var_1._id_2B16 = 11;
            var_1._id_2B15 = 10;
            var_1._id_2B14 = 9;
            break;
        case 2:
            var_1._id_2B16 = 8;
            var_1._id_2B15 = 7;
            var_1._id_2B14 = 6;
            break;
        case 1:
            var_1._id_2B16 = 5;
            var_1._id_2B15 = 4;
            var_1._id_2B14 = 3;
            break;
        case 0:
            var_1._id_2B16 = 2;
            var_1._id_2B15 = 1;
            var_1._id_2B14 = 0;
            break;
    }

    return var_1;
}

_id_789E( var_0 )
{
    var_1 = spawnstruct();

    switch ( var_0 )
    {
        case 0:
            var_1._id_2B16 = 0;
            var_1._id_2B15 = 0;
            var_1._id_2B14 = 0;
            break;
        case 1:
            var_1._id_2B16 = 0;
            var_1._id_2B15 = 0;
            var_1._id_2B14 = 1;
            break;
        case 2:
            var_1._id_2B16 = 0;
            var_1._id_2B15 = 1;
            var_1._id_2B14 = 0;
            break;
        case 3:
            var_1._id_2B16 = 0;
            var_1._id_2B15 = 1;
            var_1._id_2B14 = 1;
            break;
        case 4:
            var_1._id_2B16 = 1;
            var_1._id_2B15 = 0;
            var_1._id_2B14 = 0;
            break;
        case 5:
            var_1._id_2B16 = 1;
            var_1._id_2B15 = 0;
            var_1._id_2B14 = 1;
            break;
    }

    return var_1;
}

_id_7CAB( var_0 )
{
    var_1 = spawnstruct();

    switch ( var_0 )
    {
        case "healthy":
            var_1._id_2B16 = 0;
            var_1._id_2B15 = 0;
            var_1._id_2B14 = 0;
            break;
        case "damaged":
            var_1._id_2B16 = 0;
            var_1._id_2B15 = 0;
            var_1._id_2B14 = 1;
            break;
        case "laststand":
            var_1._id_2B16 = 0;
            var_1._id_2B15 = 1;
            var_1._id_2B14 = 0;
            break;
        case "afterlife":
            var_1._id_2B16 = 0;
            var_1._id_2B15 = 1;
            var_1._id_2B14 = 1;
            break;
    }

    return var_1;
}

_id_F68D( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self._id_8C98 ) )
        self _meth_8096( self._id_8C98 );

    self._id_2C14 = var_0;
    self setmodel( var_0 );
    self setviewmodel( var_2 );

    if ( isdefined( var_1 ) )
    {
        self attach( var_1, "", 1 );
        self._id_8C98 = var_1;
    }

    if ( isdefined( var_3 ) )
    {
        self attach( var_3, "", 1 );
        self._id_8862 = var_3;
    }
}

_id_8078()
{
    return 0;
}

_id_8070( var_0 )
{
    return tablelookup( "mp/cac/bodies.csv", 0, var_0, 5 );
}

_id_12ED5()
{
    var_0 = undefined;

    if ( isdefined( self._id_D42F ) )
    {
        var_0 = 1.0;
        var_0 = var_0 + self._id_D42F;
    }
    else
    {
        var_0 = _id_807F( self );

        if ( isdefined( self._id_3D12 ) )
            var_0 = self._id_3D12;
        else if ( isdefined( self._id_101D3 ) )
            var_0 = self._id_101D3;

        var_1 = self._id_3E6B;

        if ( isdefined( var_1 ) && isdefined( var_1._id_109AE ) )
            var_0 = var_0 + var_1._id_109AE;

        if ( isdefined( self._id_109BB ) )
            var_0 = var_0 + self._id_109BB;

        if ( isdefined( self._id_CAB0 ) )
            var_0 = var_0 + self._id_CAB0;

        if ( isdefined( self._id_13C70 ) )
            var_0 = var_0 + self._id_13C70;

        if ( isdefined( self._id_13CB2 ) )
            var_0 = var_0 + self._id_13CB2;

        if ( isdefined( self._id_13CB3 ) )
            var_0 = var_0 + self._id_13CB3;

        var_0 = min( 1.5, var_0 );
    }

    self._id_13CCF = var_0;

    if ( !isdefined( self._id_440B ) )
        self._id_440B = 1;

    self setmovespeedscale( var_0 * self._id_BCF6 * self._id_440B );
}

_id_807F( var_0 )
{
    var_1 = 1.0;
    self._id_13CA0 = self getweaponslistprimaries();

    if ( getdvar( "normalize_movement_speed", "on" ) == "on" )
        return 1.0;

    if ( !self._id_13CA0.size )
        var_1 = 0.9;
    else
    {
        var_2 = self getcurrentweapon();

        if ( _id_0A77::_id_9F8D( var_2 ) )
            var_1 = level._id_112A9[var_2]._id_BCEF;
        else
        {
            var_3 = weaponinventorytype( var_2 );

            if ( var_3 != "primary" && var_3 != "altmode" )
            {
                if ( isdefined( self._id_EB6B ) )
                    var_2 = self._id_EB6B;
                else
                    var_2 = undefined;
            }

            if ( !isdefined( var_2 ) || !self hasweapon( var_2 ) )
                var_1 = _id_8237();
            else
                var_1 = _id_8236( var_2 );
        }
    }

    var_1 = _id_4001( var_1 );
    return var_1;
}

_id_8236( var_0 )
{
    var_1 = _id_0A77::_id_7DF7( var_0 );
    var_2 = level._id_13CA4[var_1];
    return var_2;
}

_id_8237()
{
    var_0 = 2.0;
    self._id_13CA0 = self getweaponslistprimaries();

    if ( self._id_13CA0.size )
    {
        foreach ( var_2 in self._id_13CA0 )
        {
            var_3 = _id_8236( var_2 );

            if ( var_3 == 0 )
                continue;

            if ( var_3 < var_0 )
                var_0 = var_3;
        }
    }
    else
        var_0 = 0.9;

    var_0 = _id_4001( var_0 );
    return var_0;
}

_id_4001( var_0 )
{
    return clamp( var_0, 0.0, 1.0 );
}

_id_8226()
{
    var_0 = 1000;
    self._id_13CA0 = self getweaponslistprimaries();

    if ( self._id_13CA0.size )
    {
        foreach ( var_2 in self._id_13CA0 )
        {
            var_3 = _id_823B( var_2 );

            if ( var_3 == 0 )
                continue;

            if ( var_3 < var_0 )
                var_0 = var_3;
        }
    }
    else
        var_0 = 8;

    var_0 = _id_4003( var_0 );
    return var_0;
}

_id_823B( var_0 )
{
    var_1 = undefined;
    var_2 = _id_0A77::_id_7DF7( var_0 );
    var_1 = float( tablelookup( level._id_10E5A, 4, var_2, 8 ) );

    if ( !isdefined( var_1 ) || var_1 < 1 )
        var_1 = float( tablelookup( level._id_7666, 4, var_2, 8 ) );

    if ( !isdefined( var_1 ) || var_1 < 1 )
        var_1 = 10;

    return var_1;
}

_id_4003( var_0 )
{
    return clamp( var_0, 0.0, 11.0 );
}

_id_EBA1( var_0 )
{
    var_1 = _id_3D8F();

    if ( var_1 != 1.0 )
    {
        var_2 = weaponmaxammo( var_0 );
        self setweaponammostock( var_0, int( var_2 * var_1 ) );
    }
}

_id_3D8F()
{
    return _id_0CFF::_id_D876();
}

_id_1358A( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    wait 0.5;

    if ( !self hasweapon( var_0 ) )
        var_0 = self getweaponslistprimaries()[0];

    self setspawnweapon( var_0 );
}

_id_958F()
{
    level._id_CA60 = [];
    level._id_EF86 = [];
    level._id_CA66 = [];
    level._id_EF86["specialty_falldamage"] = 1;
    level._id_EF86["specialty_armorpiercing"] = 1;
    level._id_EF86["specialty_gung_ho"] = 1;
    level._id_EF86["specialty_momentum"] = 1;
    level._id_CA60["specialty_momentum"] = ::_id_F7A4;
    level._id_CA66["specialty_momentum"] = ::_id_12CF2;
    level._id_CA60["specialty_falldamage"] = ::_id_F719;
    level._id_CA66["specialty_falldamage"] = ::_id_12CC1;
}

_id_F7A4()
{
    thread _id_E863();
}

_id_E863()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "momentum_unset" );

    for (;;)
    {
        if ( self _meth_81BD() )
        {
            _id_848B();
            self._id_BCF6 = 1;
            _id_12ED5();
        }

        wait 0.1;
    }
}

_id_848B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "momentum_reset" );
    self endon( "momentum_unset" );
    thread _id_B944();
    thread _id_B943();

    for ( var_0 = 0; var_0 < 0.08; var_0 = var_0 + 0.01 )
    {
        self._id_BCF6 = self._id_BCF6 + 0.01;
        _id_12ED5();
        wait 0.4375;
    }

    self playlocalsound( "ftl_phase_in" );
    self notify( "momentum_max_speed" );
    thread momentum_endaftermax();
    self waittill( "momentum_reset" );
}

momentum_endaftermax()
{
    self endon( "momentum_unset" );
    self waittill( "momentum_reset" );
    self playlocalsound( "ftl_phase_out" );
}

_id_B944()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "momentum_unset" );

    for (;;)
    {
        if ( !self _meth_81BD() || self _meth_81BE() || !self isonground() || self iswallrunning() )
        {
            wait 0.25;

            if ( !self _meth_81BD() || self _meth_81BE() || !self isonground() || self iswallrunning() )
            {
                self notify( "momentum_reset" );
                break;
            }
        }

        scripts\engine\utility::waitframe();
    }
}

_id_B943()
{
    self endon( "death" );
    self endon( "disconnect" );
    self waittill( "damage" );
    self notify( "momentum_reset" );
}

_id_12CF2()
{
    self notify( "momentum_unset" );
}

_id_F719()
{

}

_id_12CC1()
{

}

_id_F53D()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "force_bleed_out" );
    self endon( "last_stand" );
    self endon( "death" );
    self endon( "revive_success" );

    if ( game["state"] != "postgame" )
    {
        wait 0.1;
        var_0 = 1;
        var_1 = 2;
        var_2 = 4;
        var_3 = 8;
        var_4 = 16;
        var_5 = 32;
        var_6 = 64;
        var_7 = 0;
        var_8 = undefined;
        var_9 = undefined;
        var_10 = undefined;
        var_11 = 0;
        var_12 = undefined;
        var_13 = 400;
        var_14 = 1000;
        var_15 = 1500;
        var_16 = _id_7AA8( self );
        var_11 = var_2;

        if ( isdefined( level.player_suit ) )
            self _meth_845A( level.player_suit );
        else
            self _meth_845A( "zom_suit" );

        self._id_111BC = "zom_suit";
        self _meth_8422( 0 );
        self _meth_8427( var_11 & var_2 );
        self _meth_8424( 0 );
        self _meth_8412( 0 );

        if ( isdefined( var_8 ) && isdefined( var_9 ) )
        {
            self _meth_8426( var_7 );
            self _meth_8425( var_7 );
            self _meth_8454( 3 );
        }
        else
        {
            self _meth_8426( var_7 );
            self _meth_8425( var_7 );
            self _meth_8454( 3 );
        }

        thread _id_0D15::_id_41D0();

        if ( isdefined( var_16 ) )
            thread _id_0D15::_id_8397( var_16, "primary", undefined, undefined, undefined, 0, 1 );

        _id_116E( var_11 & var_3 );
        self _meth_842E( 0, var_13 );
        self _meth_842C( 0, var_13 );
        self _meth_8434( 0, var_14 );
        self _meth_8430( 0, var_15 );

        if ( isdefined( var_12 ) )
            self [[ var_12 ]]();
    }

    self _meth_8472( 0 );

    if ( !_id_0A77::_id_9BA0( "grenade_cooldown" ) )
        _id_0D15::_id_D740( 0.0 );

    _id_0A77::giveperk( "specialty_throwback" );
    self notify( "set_player_perks" );
}

_id_7AA8( var_0 )
{
    return "power_frag";
}

_id_23C6()
{
    self.class = "none";
}

_id_116E( var_0 )
{
    if ( var_0 )
        thread _id_0CFD::_id_F65B();
    else
        self notify( "battleSlide_unset" );
}

register_player_character( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16 )
{
    var_17 = spawnstruct();
    var_17.body_model = var_2;
    var_17.view_model = var_3;
    var_17.head_model = var_4;
    var_17.hair_model = var_5;
    var_17._id_134FD = var_6;
    var_17.vo_suffix = var_7;
    var_17.pap_gesture = var_8;
    var_17.revive_gesture = var_9;
    var_17.photo_index = var_10;
    var_17._id_6BA3 = var_11;
    var_17.intro_music = var_12;
    var_17.intro_gesture = var_13;
    var_17.melee_weapon = var_14;
    var_17.starting_weapon = var_16;
    var_17.post_setup_func = var_15;
    level.player_character_info[var_0] = var_17;

    if ( var_1 == "yes" )
        level._id_26A0[level._id_26A0.size] = var_0;
}

_id_D87D()
{
    return _id_7B0E( "nerf_fragile" );
}

_id_D878()
{
    return _id_7B0E( "nerf_move_slower" );
}

_id_D876()
{
    return _id_7B0E( "nerf_min_ammo" );
}

_id_7B0E( var_0 )
{
    return self._id_BEE9[var_0];
}
