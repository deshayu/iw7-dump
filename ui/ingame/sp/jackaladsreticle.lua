LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT                   _   Ά   Ά             6    6 	 Ά
          2 Ά    Ά  Ά              module          package          seeall        PostLoadFunc        JackalADSReticle        MenuBuilder          registerType   
       LockTable          _M                     F         Ά                           Ά                     Ά 
      
      	
        Ά             
                    	   	
	 2 	            DataSources          inGame        player        currentWeapon 
       inFullADS        jackal        mode 
       autopilot        noGunsModeActive        inADS 	       soundSet        SubscribeToModel 	       GetModel        addEventHandler        menu_create               	   Q       __  L  L L  L L  L Ά          9   L  L    9   9   9   9 
L         9 Ά 	       
L
 2 
L 2 
L  9   9   9    9 
L          9 Ά 	       
L 2 
L 2 
L     	       GetValue        JackalModes          landing        inADS        ACTIONS          AnimateSequence        show 
       playSound        adsOn        hide        adsOff                    	         Ά         L 2            ACTIONS          AnimateSequence        default                           __  Ά              2 2 2 2	 2
 Ά	 

Z 2 Ά	 Z  h  h z  9         
 9 Ά          9  Ά    
4  Ά               Ά              	 2! 2	 2"# Ά$ 	& 2	 2' 
4 4  Ά              (!	 2
 2"	# Ά$ 
) 2	
 2'	 P            T       *      + Ά, 	 
     .          LUI   
       UIElement        new        SetAnchorsAndPosition       ?       _1080p      D       id        JackalADSReticle        _animationSets        _sequences        controllerIndex        Engine          InFrontend        getRootController        assert          UIImage        TickedRing        SetRGBFromTable 	       SWATCHES          jackal        stable 	       SetAlpha 	       setImage        RegisterMaterial   #       hud_jackal_reticule_piece_ads_tics        addElement        TickedRingSmall )       hud_jackal_reticule_piece_ads_tics_small        DefaultAnimationSet        PostLoadFunc                                 L         h h       h       L 2  h h       h       L 2 	     L        h h
       h       L 2  h h       h   	    L 2	 
     L        h h	    L
 2   	  L	       	
	 h
 h      
	
 L
 2 

    L       
 h h    L 2     L                   _sequences        DefaultSequence        RegisterAnimationSequence        show        hide        default        locking        locked                           _                         
       ___   L           2 2  ,               TickedRing 	       SetScale   >                              ___   L           2 2 Ά               
,     	          TickedRing 	       SetScale 
Χ£Ό  ΘC       LUI          EASING        outBack                    
       ___   L           2 2  ,               TickedRing 	       SetAlpha                                  L           2 2 Ά               
,     	          TickedRing 	       SetAlpha   ?  ΘC       LUI          EASING        outBack                    
       ___   L           2 2  ,               TickedRingSmall 	       SetAlpha                               ___   L           2 2 Ά               
,     	          TickedRingSmall 	       SetAlpha   ?  ΘC       LUI          EASING        outBack                    
       __   L           2 2  ,               TickedRingSmall 	       SetScale   @?                              __   L           2 2 Ά               
,     	          TickedRingSmall 	       SetScale 
Χ£Ό  ΘC       LUI          EASING        outBack                    	       __   L   2   L   2             AnimateSequence        show                    
          L           2 2  ,               TickedRing 	       SetScale                                  L           2 2 Ά               
,     	          TickedRing 	       SetScale   >  ΘC       LUI          EASING        outBack                    
       ___   L           2 2  ,               TickedRing 	       SetAlpha   ?                              ___   L           2 2 Ά               
,     	          TickedRing 	       SetAlpha       ΘC       LUI          EASING        outBack                    
       ___   L           2 2  ,               TickedRingSmall 	       SetAlpha   ?                              __   L           2 2 Ά               
,     	          TickedRingSmall 	       SetAlpha       ΘC       LUI          EASING        outBack                    
       __   L           2 2  ,               TickedRingSmall 	       SetScale                               ___   L           2 2 Ά               
,     	          TickedRingSmall 	       SetScale 33³>  ΘC       LUI          EASING        outBack                    	       __   L   2   L   2             AnimateSequence        hide                    
          L           2 2  ,               TickedRing 	       SetAlpha                                  L   2             AnimateSequence        default                    
       _   L           2 2  ,               TickedRingSmall        SetZRotation                        
       ___   L           2 2  ,               TickedRingSmall        SetZRotation   ΄Γ ΤΑF                          __   L   2             AnimateLoop        locking                    
       _   L           2 2  ,               TickedRingSmall        SetZRotation                               ___   L   2             AnimateSequence        locked                    