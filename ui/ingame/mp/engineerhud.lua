LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT            G       _   ถ   ถ          ถ  
        ถ    2 2 2 2 2 2    	 
     	             
 	 
    ถ "       2   ถ "       2  ถ  ถ             module          package          seeall        CoD          PrintModuleLoad        _NAME      B  B  A  C       MenuBuilder          registerType        engineerOverlayDef        shoulderCannonOverlayDef 
       LockTable          _M                  
   I       ___         r = 9 2 2           9 2 ถ 
       h h 2 2 h 2 2  	 2           9 ถ 
       h h 2 2 h 2 2 h 2	 2   9 	 2 2            value            animateToState        active        played_flash        getFirstDescendentById        shoulder_cannon_flash_image_id        MBh          AnimateSequence        closing   ๚C#       shoulder_cannon_ammo_back_image_id   ?       default        opening   zC                 
   '       ___  ถ        2  r  9 ถ 
       h h 2 2 h 2 2 h 2	 2    9 2            Game   
       GetOmnvar        ui_shoulder_cannon_ammo        setText            MBh          AnimateSequence        default   ศB       hidden        animateToState                    O       ___  ถ        2 2   9 2  9   9	 2  9 
  9 2  9   9 2  9   9 2  9   9 2  9   9 2   9 2 ถ           r  9 ถ        
h h 2 2 h  2	! 2 h	 2
! 2	 h
  2! 2	
 h 2! 2

    "          Game   
       GetOmnvar        ui_shoulder_cannon_state             !       @LUA_MENU_MP_PLAYER_TURRET_READY   ?        @LUA_MENU_MP_PLAYER_TURRET_LOCK    @"       @LUA_MENU_MP_PLAYER_TURRET_FIRING   @@#       @LUA_MENU_MP_PLAYER_TURRET_OFFLINE   @$       @LUA_MENU_MP_ENGINEER_DRONE_ASSAULT    @$       @LUA_MENU_MP_ENGINEER_DRONE_DEFENSE   ภ@$       @LUA_MENU_MP_ENGINEER_DRONE_SUPPORT !       @LUA_MENU_MP_PLAYER_TURRET_EMPTY        setText        Engine   	       Localize        MBh          AnimateSequence        default   C       hidden   ศB                   A       __  ถ        2 2   9 2 
 9   9 2  9 	  9
 2  9    9 2 ถ           r  9 ถ        
h h 2 2 h 2	 2 h	 2
 2	 h
 2 2	
 h 2 2

              Game   
       GetOmnvar        ui_eng_drone_ammo_type               ?)       @LUA_MENU_MP_PLAYER_SHOULDER_CANNON_AMMO    @        @LUA_MENU_MP_PLAYER_TROPHY_AMMO   @@       @LUA_MENU_MP_PLAYER_RADAR        setText        Engine   	       Localize        MBh          AnimateSequence        default   C       hidden   ศB                	            ถ                    2	 h

#  LX& L*- 2 2  ถ              2 ถ        !       2 h

"# ถ #      $      %      &&+ ถ #      $      (      N  ถ *      +      R-Y. 2 hY 2 2  ถ             / 2 ถ  
      !
       2 h

01# ถ #      $      %      &&+ ถ #      $      (      N  ถ *      +      R-Y. 2 hY 2 2  ถ             2 2 ถ        !       2 h

4g6k ถ #      $      %      &7+ ถ #      $      (      N  ถ *      +      R-Y. 2 hY 2 289 2 L8: 2 L8; 2 L< < <     =          LUI   
       UIElement        new        id        shoulder_cannon_ammo_container        registerAnimationState        default 
       topAnchor        leftAnchor         bottomAnchor        rightAnchor        top            right    ภ       height    @       width        spacing        animateToState        UIText        shoulder_cannon_ammo_count_id        setText                setTextStyle        CoD   
       TextStyle 	       Shadowed   *C       TextSettings        HudEuroMedSmallFont        Height   C       font        Font 
       alignment 
       Alignment        Left        alpha   ?       hidden        shoulder_cannon_state_id   HB  >C       shoulder_cannon_ammo_text_id        bottom   A       left   าย  bC       registerOmnvarHandler        ui_shoulder_cannon_ammo        ui_shoulder_cannon_state        ui_eng_drone_ammo_type        addElement                    >                  9 2 2 ถ             	         & 9         
  9 2 2 h  9           9 2 2 ถ             	         h            value            animateToState        default        LUI          UITimer        Stop        positionTimer    @       dim        dispatchEventToChildren        name        reticleLocked   ?       active        Reset        reticleLocking                     d       _   ถ  2  ถ             
 2 h!#%)+/ 037 2 h7 2 h7  2 2! 2"# 2$ ถ% '       
h h	 2
 	 h
 2 	
 h 2 
 h 2  h 2 
  "( 2$ ถ% '       h h	 2
 	 h
 2 	
 h 2 
     )          RegisterMaterial          hud_fofbox_hostile        LUI          UIImage        new        id        shoulderCannonHudReticleId        registerAnimationState        default 
       topAnchor         leftAnchor        bottomAnchor        rightAnchor        top            left        height    B       width 	       material        zRot   4B       alpha        active   ?       dim   >       animateToState   HB       registerEventHandler        reticleLocked        MBh          AnimateSequence        reticleLocking                    H          ถ                    2	 h

#%)+ 2 h+ 2 2  ถ              4 h3 h96=ACE
G$ J& ' 2  () 2  L L&     *          LUI   
       UIElement        new        id !       shoulderCannonReticleContainerId        registerAnimationState        default 
       topAnchor        leftAnchor        bottomAnchor         rightAnchor        top            left        width   ?       height        alpha        active        animateToState        UITimer 	       interval   A       event        name        updateTargetPos        timerGroup         disposable        eventTarget        deferNextFrame        stopped        shoulderCannonReticleTimerId        positionTimer        addElement        registerEventHandler        registerOmnvarHandler        ui_shoulder_cannon_hud_reticle                   K       _  ถ        2 
r @ 9  ถ         2   6 9   4 9 4 ถ	  ถ                      ถ       	 
 2 
  ถ       	 
 2  
 2	 h/359	T: T>"C#
 2 2  $          Game   
       GetOmnvar        ui_shoulder_cannon_target_ent   ฟ       GetScreenLocation        j_spineupper        ScreenResolution          currentScreenResolution          width        height        LUI          clamp            registerAnimationState 	       position 
       topAnchor        leftAnchor        bottomAnchor         rightAnchor        top    A       left    A       alpha   ?       animateToState                    ๛       _   ถ  2   ถ  2  ถ  2 ถ 	      
       2	 h#%')-/13 2 2 2 h3 2  L  2  L ถ !      
      "	 2
 h####%#'	 L	 j	(	 L	 j	,	 L	.	 L	0H3	 2 2	 2	 h####%#'	 L	 j	(	 L	 j	,	 L	.	 L	03	% 2	 h####%#'	 L	 j	&X	(	 L	 j	'X	,	 L	&X	.	 L	'X	03 ถ !
      

      ( 2	
 h	#	##	#%	'	))	*-	'/
 L	
V	 H	3 2	 2, 2		 h	#	##	#%	'
 L
-X

RV
.T	
(	/-
 L
-X

NR
.P	
.
 L	
V	3 2		 h	#	##	#%	'
 L
-X

RV	
(	*-
 L
-X

NR	
.
 L	
V	3 ถ !      
      0	 2
 h
#
##
%
'
)/
1-
3e
4W ถ 6      7      
j
H
-3	 2
 28	 8	 
L	  8	 8	 
   9          RegisterMaterial          apache_mg_back_mp        pointflash        cranked_back_1_flipped        LUI   
       UIElement        new        id %       shoulder_cannon_overlay_container_id        registerAnimationState        default 
       topAnchor        leftAnchor        bottomAnchor        rightAnchor        top            left        bottom        right        alpha        animateToState        active   ?       registerOmnvarHandler        ui_shoulder_cannon        registerEventHandler        init_overlay        UIImage        shoulder_cannon_flash_image_id  	       material        closing    ภ  ศB#       shoulder_cannon_ammo_back_image_id   าB  Hร       width        opening    ?   B   ร       shoulder_cannon_timer_bg   ๚ย       height   9C  C
       alignment 
       Alignment        Left        addElement                            __          
 9          9 2 2   9          	 9          9 2 2             value   ?       current_state        active        animateToState            default                    N       __   ถ  2  ถ             
 2	 h!#%)+-/ 2 2 2 h/ 2  L 2  L ถ               2 h!# B/ 2 2 L" "    #          RegisterMaterial          apache_visor_mp        LUI   
       UIElement        new        id        engineer_overlay_container_id        registerAnimationState        default 
       topAnchor        leftAnchor        bottomAnchor        rightAnchor        top            left        bottom        right        alpha        animateToState        active   ?       registerOmnvarHandler        ui_engineer_hud        registerEventHandler        init_overlay        UIImage        trophy_visor_image_id 	       material        addElement                    