LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT                   _   ¶   ¶             6      6	 ¶
        2 ¶  ¶  ¶             module          package          seeall 
       ExitPopup !       GameBattlesUnregisteredUserPopup        MenuBuilder          registerType   
       LockTable          _M                            ___  ¶        2   ¶       	          
          Engine          SetDvarBool        cg_mlg_gamebattles_match        LUI          FlowManager        RequestLeaveMenu                 	   L         ¶                9   9 ¶	  ¶ 
       2 2   9 ¶                 	 ¶        2           	 2 ¶  ¶              "C	# 2 ¶ $   %          DataSources   	       frontEnd        primaryPlayerUserName 	       GetValue                 ToUpperCase          Engine   	       Localize        XBOXLIVE_NOTSIGNEDIN            MarkLocalized        TextBoxTitle        setText        LocalizeLong $       PLATFORM_GAMEBATTLES_REGISTER_POPUP        PopupButton        registerEventHandler        button_down 
       ExitPopup          LUI          UIBindButton        new        id $       GameBattlesUnregisteredUserPopup_id        button_secondary        addElement                   ź       _  ¶              2 2 2 2	 2
 ¶	 

Z 2 ¶	 Z z  9         
 9 ¶          9  ¶    
4  ¶               ¶       	 2	 2 ¶	 <Z  ¶! #      	  ¶! 	$      	%        &  ¶ '      (       2	 2
 2 2 ¶	 )X ¶	 *X ¶	 +X ¶	 ,X- 
2 4. ¶/ 1      2 2	 h	 23       	4 ¶5 
 ¶ 
      7 2
 	 
 23       &	  ¶ 	'      	(      	 2
 2 2 2 2 ¶	 X ¶	 8X ¶	 9!X-	 d 4. ¶/ 1      	: 2
 h
 ;<       =
> ¶? A 2
 2
 2 2 2 2 ¶	 BX ¶	 CX ¶	 D!X ¶	 E#X-
 v  L	 
     F          LUI          UIVerticalNavigator        new        SetAnchorsAndPosition       ?       _1080p     HD Ą$D       id !       GameBattlesUnregisteredUserPopup        controllerIndex        Engine          InFrontend        getRootController        assert          UIText        TextBoxTitle        setText 	       Localize $       PLATFORM_GAMEBATTLES_REGISTER_POPUP        SetFontSize   ĄA       SetFont        FONTS          GetFont        MainMedium        File        SetAlignment 
       Alignment        Left   øA  @D  äA  RB       addElement        MenuBuilder          BuildRegisteredType        PopupButton        Label        ToUpperCase   
       MENU_EXIT  @D Ą#D       CallingCardImage #       CallingCardRegisteredToGamebattles        CallingCardTexture 	       setImage        RegisterMaterial          ui_playercard_696   C Ą D ĒC D                   