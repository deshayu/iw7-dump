LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT            {       _   h   6  h     
  ¶  h#'+/37; ?"C$G&K(O*S,W.[0_2c4g6k8o:s<w>{@ hBD hE"G"I"K"M"    ¶       ¶       ¶        	  ¶ 
	   	
¢	  ¶ 

 	
¤	  ¶ 
   	
¦	  ¶ 
   	
¨	  ¶ 
 	
ª	  ¶ 
 	
¬	 
  ¶  	 
®
  ¶  	 
°
  ¶  	 
²
  ¶   
´  [          OPTIONS        thumbstick_default        MENU_DEFAULT        thumbstick_southpaw        MENU_SOUTHPAW        thumbstick_legacy        MENU_LEGACY        thumbstick_southpaw_ns        MENU_SOUTHPAW_NS        thumbstick_legacysouthpaw_ns        MENU_LEGACY_SOUTHPAW_NS          buttonLayoutStrings        buttons_default        buttons_tactical        MENU_TACTICAL        buttons_lefty        MENU_LEFTY        buttons_nomad        MENU_NOMAD        buttons_nomad_tactical        MENU_NOMAD_TACTICAL        buttons_nomad_lefty        MENU_NOMAD_LEFTY        buttons_bumper_jumper        MENU_BUMPER_JUMPER        buttons_bumper_jumper_tac        MENU_BUMPER_JUMPER_TACTICAL        buttons_charlie        MENU_CHARLIE        buttons_one_hand_gun        MENU_ONE_HAND_GUN        buttons_stick_move        MENU_STICK_MOVE        buttons_brawler        MENU_BRAWLER        buttons_beast        MENU_BEAST        buttons_default_alt        MENU_DEFAULT_ALT        buttons_tactical_alt        MENU_TACTICAL_ALT        buttons_lefty_alt        MENU_LEFTY_ALT        buttons_nomad_alt        MENU_NOMAD_ALT        buttons_nomad_tactical_alt        MENU_NOMAD_TACTICAL_ALT        buttons_nomad_lefty_alt        MENU_NOMAD_LEFTY_ALT        buttons_bumper_jumper_alt        MENU_BUMPER_JUMPER_ALT        buttons_bumper_jumper_tac_alt         MENU_BUMPER_JUMPER_TACTICAL_ALT        buttons_charlie_alt        MENU_CHARLIE_ALT        buttons_one_hand_gun_alt        MENU_ONE_HAND_GUN_ALT        buttons_stick_move_alt        MENU_STICK_MOVE_ALT        buttons_brawler_alt        MENU_BRAWLER_ALT        buttons_beast_alt        MENU_BEAST_ALT 	       DISABLED   ?       ENABLED    @	       MENU_LOW   @@       MENU_MEDIUM   à@
       MENU_HIGH   PA       MENU_VERY_HIGH    A       MENU_INSANE        CreateColorblindFilterLogic        CreateFPSCounterLogic        CreateBrightnessSliderLogic        CreateSubtitleLogic        CreateVolumeLogic        CreateMPVoiceLogic        CreateMPPlayerReactionLogic        BuildGenericButton        BuildGenericDualLabelButton        GetCurrentAudioMixPreset        CreateAudioMixPresetButtons        CreateAudioMixPreset        CreateGender                            ¶                    Engine          ToggleRenderColorBlind                   4       _  ¶        2  h h  ¶ 
       2  ¶        2  
  L    9 L         9 L       ¶                       Engine          GetProfileData        renderColorBlind        labels 	       Localize        LUA_MENU_DISABLED        LUA_MENU_ENABLED        action        defaultValue        ENABLED 	       DISABLED        wrapAround        LUI          AddUIArrowTextButtonLogic                           ___  ¶        2  ¶        2 l            Engine          SetDvarBool        cg_fpsCounter        GetDvarBool                   3         ¶        2 h h  ¶ 
       2  ¶        2  
  L    9 L         9 L       ¶                       Engine          GetDvarBool        cg_fpsCounter        labels 	       Localize        LUA_MENU_DISABLED        LUA_MENU_ENABLED        action        defaultValue        ENABLED 	       DISABLED        wrapAround        LUI          AddUIArrowTextButtonLogic                           _                            )       ___  ¶    ¶              ¶ 
      
      	 ¶
        2 	 ¶
          L h!            Mirror          SliderBounds          Brightness        Min        Max        Engine          SetDvarFloat        profileMenuOption_blacklevel        MenuDvarsFinish        dispatchEventToCurrentMenu        name        brightness_updated                	   u       __  ¶        2 ¶   ¶	 
      
       ¶	              ¶         ¶	              ¶	              	 h%  L  (*- ¶	 
      
      0 ¶	 
      
      2 ¶	 
      
      4 ¶	 
      
      8         
      <!" 2     ¶ #
            $          Engine          GetDvarFloat        profileMenuOption_blacklevel        Mirror          SliderBounds          Brightness        Min        Max        LUI          clamp        decimalPlacesToRound   @@       action        defaultValue        wrapAround         max        min        step        Step        pcstep        PCStep        fillElement        GenericFillBar        Fill        addEventHandler        optimal_video_update        AddUIArrowFillBarButtonLogic                         __  ¶  ¶        2 ¶	              ¶	 
      
        L             Mirror          Engine          GetDvarFloat        profileMenuOption_blacklevel        SliderBounds          Brightness        Min        Max        SetCurrentValue                             ¶         l  ¶                     Engine          SubtitlesEnabled        SetSubtitlesEnabled                           __  ¶                    Engine          ToggleMPVoice                          __  L            9   ¶        2             ENABLED        Engine          SetDvarBool        snd_mute_player_dialogue                   8       _  ¶    ¶        2  h h ¶ 	
      
 2 ¶ 	       2    L    9 L         9 L      ! ¶                       assert          Engine          GetProfileData 
       subtitles        labels 	       Localize        LUA_MENU_DISABLED        LUA_MENU_ENABLED        action        defaultValue        ENABLED 	       DISABLED        wrapAround        LUI          AddUIArrowTextButtonLogic                 
   W         ¶     ¶           ¶                    ¶        	 h
 ¶              ¶             * ¶             . ¶             2              6 ¶          	 
             assert          GenericFillBar        Fill        Engine          GetDvarFloat        decimalPlacesToRound    @       action        defaultValue        wrapAround         max        SliderBounds          Volume        Max        min        Min        step        Step        pcstep        PCStep        fillElement        LUI          AddUIArrowFillBarButtonLogic                         __  ¶         L    ¶        L            Engine          SetDvarFloat        MenuDvarsFinish                   8       __  ¶    ¶        2  h h ¶ 	
      
 2 ¶ 	       2    L    9 L         9 L      ! ¶                       assert          Engine          GetProfileData        snd_mpVoiceEnabled        labels 	       Localize        LUA_MENU_DISABLED        LUA_MENU_ENABLED        action        defaultValue        ENABLED 	       DISABLED        wrapAround        LUI          AddUIArrowTextButtonLogic                   8       ___  ¶    ¶        2 l h h ¶ 	
      
 2 ¶ 	       2    L    9 L         9 L      ! ¶                       assert          Engine          GetDvarBool        snd_mute_player_dialogue        labels 	       Localize        LUA_MENU_DISABLED        LUA_MENU_ENABLED        action        defaultValue        ENABLED 	       DISABLED        wrapAround        LUI          AddUIArrowTextButtonLogic                    >         ¶        2 h
 	 2 2	 2
	 2 2 2 2
 ¶ X 2 ¶ 
               ¶  ¶       	    2        ¶                          MenuBuilder          BuildRegisteredType        GenericButton        controllerIndex        id        SetAnchorsAndPosition       ?       _1080p     ğA       buttonDescription        Engine   	       Localize        Text        setText        ToUpperCase          SetAlignment        LUI   
       Alignment        Left                    N         ¶ 
       2 h
  2	 2
 2	 2 2 2 2
 ¶ X 2 ¶        
        ¶ 	 ¶ 	      
 	  	 2
        ¶             
        ¶ 	 ¶ 	      
 	  	 2             MenuBuilder          BuildRegisteredType        GenericDualLabelButton        controllerIndex        id        SetAnchorsAndPosition       ?       _1080p     HB       buttonDescription        Engine   	       Localize        Text        setText        ToUpperCase          SetAlignment        LUI   
       Alignment        Left        DynamicText                            __  h h h h h	     
          label        LUA_MENU_DEFAULT        value            LUA_MENU_MEDIUM_SPEAKERS   @@       LUA_MENU_SMALL_SPEAKERS   ?       LUA_MENU_HEADPHONES    @                   "       ___   L   ¶        2 2  n 2 }                 9                îÿ~ 2	 2   
          Engine          GetDvarInt        profileMenuOption_presetMix   ?       value        label                               /       __  h  L      2 n  2! }	 ¶ 	      
 2 
x                	

 2   	 

	 ¶
 
        
	    Üÿ~        ?       OPTIONS          BuildGenericButton 
       MixPreset        label        addEventHandler        button_action        table          insert                           ¶        2  L                ¶        L            Engine          SetDvarInt        profileMenuOption_presetMix        value        MenuDvarsFinish                   	         L L L  h            dispatchEventToCurrentMenu        name        subcategory_option_selected                   B         ¶     L      h 2 ¶        2 2 n	 2 }	 ¶
         ¶       
               
                 9 âÿ~ h "$' ¶       	  
              assert     ?       Engine          GetDvarInt        profileMenuOption_presetMix        table          insert 	       Localize        label        value        labels        action        defaultValue        wrapAround        LUI          AddUIArrowTextButtonLogic                         __  ¶        2  L                ¶        L            Engine          SetDvarInt        profileMenuOption_presetMix        value        MenuDvarsFinish                	   @         ¶      ¶         ¶ 

      
       2 h h ¶        2 ¶        2  "    9  L
         9  L
      $+ ¶ 
                      assert          Engine          GetPlayerDataEx        CoD          StatsGroup        Common        gender        labels 	       Localize        LUA_MENU_MP_MALE        LUA_MENU_MP_FEMALE        action        defaultValue        ENABLED 	       DISABLED        wrapAround        LUI          AddUIArrowTextButtonLogic                   6       __  ¶         ¶             	 2    9  ¶ 
        ¶             	 2  
  9  ¶ 
        ¶             	 2 
            Engine          GetPlayerDataEx        CoD          StatsGroup        Common        gender        SetPlayerDataEx                    