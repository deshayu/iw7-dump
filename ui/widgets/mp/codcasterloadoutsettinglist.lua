LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT            o       _   ¶   ¶             h h
 h 2 2 h h 2 2 h h 2 2 h h 2	 2 h h	 2
 2 h	 h
 2 2			 h		 
 h 2 2
	
	!
 h
"
# h 2 2

$           % 6& ¶' )      % 2% ¶* , ¶- / ¶0   2          module          package          seeall        Name        CODCASTER_LS_PLAYER_SPECIALIST        Desc $       CODCASTER_LS_PLAYER_SPECIALIST_DESC        Labels 	       MENU_OFF        MENU_ON        SettingName        shoutcaster_lo_specialist '       CODCASTER_LS_SPECIALIST_WEAPON_ABILITY ,       CODCASTER_LS_SPECIALIST_WEAPON_ABILITY_DESC !       shoutcaster_lo_specialist_weapon        CODCASTER_LS_PRIMARY_WEAPON !       CODCASTER_LS_PRIMARY_WEAPON_DESC        shoutcaster_lo_primary (       CODCASTER_LS_PRIMARY_WEAPON_ATTACHMENTS -       CODCASTER_LS_PRIMARY_WEAPON_ATTACHMENTS_DESC "       shoutcaster_lo_primary_attachment        CODCASTER_LS_SECONDARY_WEAPON #       CODCASTER_LS_SECONDARY_WEAPON_DESC        shoutcaster_lo_secondary *       CODCASTER_LS_SECONDARY_WEAPON_ATTACHMENTS /       CODCASTER_LS_SECONDARY_WEAPON_ATTACHMENTS_DESC $       shoutcaster_lo_secondary_attachment        CODCASTER_LS_EQUIPMENT        CODCASTER_LS_EQUIPMENT_DESC        shoutcaster_lo_equipment        CODCASTER_LS_PERKS        CODCASTER_LS_PERKS_DESC        shoutcaster_lo_perks        CodCasterLoadoutSettingList        MenuBuilder          registerType   
       LockTable          _M                  	            ¶ 
        T h	T            MLG          SetShoutcasterProfileVarValue   ?       dispatchEventToRoot        name        codcaster_setting_change 
       immediate        setting_category        loadout        setting_name        setting_value        update_WidgetVisibility                           _  ¶          P             MLG          ShoutcasterProfileVarValue   ?                         ___  ¶  ¶     9    ¶ v   9    ¶  ¶	 
        Lp   9          	 ¶  ¶         L	P	                  ¶         LP
      
        .  h ¶   LP               9	 ¶ 	      
  LP
      
       
      		   ëÿ8 h8        : L   L	P	             <!A" ¶# %         	 
  &          assert          type          number            table          getn        Title        setText        ToUpperCase          Engine   	       Localize   ?       Name        Desc        ipairs          Labels        labels        action        defaultValue        SettingName        wrapAround        LUI          AddUIArrowTextButtonLogic                           L L  L L P
      
                 ?       SettingName                   j       _ 4 h   
    

 ¶ 	X ¶ 	X" ¶ 	X$ ¶ 	X(-/ ¶             0 ¶             <!A#E ¶ $      %       
4  'M() 2 2) 2	 2
) 2* ¶ +X) 2, ¶ -X) 2. ¶ )X) 2/ ¶ 0X) 21  2  N  3          maxVisibleColumns   ?       maxVisibleRows    A       controllerIndex        buildChild        refreshChild        numRows        numColumns        wrapX        wrapY 	       spacingX        _1080p      A	       spacingY        columnWidth  ;D
       rowHeight   ðA       scrollingThresholdX        scrollingThresholdY        horizontalAlignment        LUI   
       Alignment        Left        verticalAlignment        Top        springCoefficient   ÈC       maxVelocity  @E       UIGrid        new        id        SettingsList        SetAnchors            SetLeft   ÈA	       SetRight  ÀAD       SetTop 
       SetBottom   ÍC       setUseStencil        addElement                             ¶          2 h  L
  ,               MenuBuilder          BuildRegisteredType        CodCasterArrowButton        controllerIndex                            L     L
                        
       ___           L               removeElement        SettingsList                          __  ¶              2 2 2 2	 2
 ¶	 

Z 2 ¶	 Z z  9         
 9 ¶          9  ¶    
4 h13   6 8;= ? C ¶	 #XD ¶	 #XH ¶	 &XJ ¶	 (XNSU  ¶ ,      -      V  ¶ ,      /      \1a3e  ¶ 4             4	  56	  	 2
 2 2 2 ¶	 7X ¶	 8X 2 ¶	 9!X:	 
j  L 	 
    ;          LUI   
       UIElement        new        SetAnchorsAndPosition       ?       _1080p    À@D @pD       id        CodCasterLoadoutSettingList        controllerIndex        Engine          InFrontend        getRootController        assert          maxVisibleColumns        maxVisibleRows   à@       buildChild        refreshChild        numRows        numColumns        wrapX        wrapY 	       spacingX    A	       spacingY        columnWidth  ;D
       rowHeight   ðA       scrollingThresholdX        scrollingThresholdY        horizontalAlignment 
       Alignment        Left        verticalAlignment        Top        springCoefficient   ÈC       maxVelocity  @E       UIGrid        SettingsList        setUseStencil   °A  AD  C       addElement                          __   ¶          2 h  L
  ,               MenuBuilder          BuildRegisteredType        CodCasterArrowButton        controllerIndex                                                    