LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT                   _   Ά   Ά             6    6   	 6 
 Ά         	 2	 Ά    Ά  Ά              module          package          seeall        BuildButtonBar        PostLoadFunc        ShipAssaultShipLog        MenuBuilder          registerType   
       LockTable          _M                     *       __  Ά        2 h Ά 
      !%' h)+-/1579 2  2!A"   #          MenuBuilder          BuildRegisteredType        button_helper_text_main        left_inset            right_inset   πΑ       top_margin        bottom_margin        height        GenericFooterDims          Height        spacing   πA       background_alpha        list_left_inset        left        right        top        bottom        leftAnchor        rightAnchor 
       topAnchor        bottomAnchor        registerAnimationState        default        animateToState        id        buttonHelperText        addElement                            _           9 Ά                    Ά 
                             
       ButtonBar         BuildButtonBar   
       PagedText        SetPageNumDisplayDatasource        DataSources          inGame        SP        shipLog        pageNumText                    ·        Ά              z  9         
 9 Ά	          9  Ά  ! 2  
4  Ά               Ά 	 2	 2 2	 2
 2 2 Ά  X Ά !X Ά "X Ά #X$ 
* 4  Ά %             &'	( 2
 2)	 Ά 		TZ+	, Ά- 	/      
, Ά- 
0      
1      	  2	  Ά 	3      	4      	 2
5 2 25 2 Ά 6X Ά 7X Ά 8X Ά 9!X$	 L 4  Ά :             ;)
 Ά 

xZ+
, Ά- 
/      , Ά- =      1      
  2
  Ά 
3      
4      >
? 2@
A 2B
C 2D
 Ά 

Z
 25 2 25 2 Ά FX Ά GX Ά H!X Ά I#X    	J ΆK 	M      	N      	      	O      
PQ  

$ 
v
 4  Ά %            
 
RST 2 2) Ά ͺZ+, Ά- /      , Ά- =      1        2  Ά 3      V       25 2 25 2 Ά W#X Ά X%X Ά Y'X Ά Z)X  
 J ΆK M      N            [      PQ  $ 
€\] 2   \^ 2    Ύ\` 2_         Ά a            b$ Ζ\` 2   c       \d 2   c       \e 2   c       \f 2   	   J ΆK M      N            g      PQ  h Άi       k          LUI   
       UIElement        new        id        ShipAssaultShipLog        controllerIndex        Engine          InFrontend        getRootController        assert   	       soundSet        shipLog 
       playSound 
       menu_open        UIImage        Frame 	       setImage        RegisterMaterial          ship_log_bg            SetAnchorsAndPosition        _1080p    	D 	Δ  XB  XΒ       addElement        UIText 
       ButtonBar        setText                SetFontSize   \B       SetFont        FONTS          GetFont        Dev        File        SetAlignment 
       Alignment        Left   ?
w+D ΐ§DΧmDμ~D       UIPagedText 
       PagedText   4B       MainMedium        SetDecodeLetterLength   ΘA       SetDecodeMaxRandChars   @@       SetDecodeUpdatesPerLetter    @       SetTextPageHeight  @D  D  ₯DαϊCαϊ―C       DataSources          inGame        SP        text        SubscribeToModel 	       GetModel        PageNumText        SetRGBFromInt ΓΓCK   B       Center  1D @DΧbDΧΓiD       pageNumText        addEventHandler        next_page_success        prev_page_success        addButtonHelperFunction        menu_create        UIBindButton        selfBindButton        bindButton        button_shoulderr        button_shoulderl        button_secondary        showShipLog        PostLoadFunc       
                     _   Ά                                    L   9 L	
 Ά    2            DataSources          inGame        SP        shipLog        text 	       GetValue         setText        LocalizeLongString                                 __   Ά                                    L   9 L	  
 2            DataSources          inGame        SP        shipLog        pageNumText 	       GetValue         setText                       !       _            9  L Ά        L 2   Ά        L 2 Ά        L 2              controller        ACTIONS          PlaySoundSetSound 	       nextPage        StopSoundSetSound        decodeText                   !                   9  L Ά        L 2   Ά        L 2 Ά        L 2              controller        ACTIONS          PlaySoundSetSound 	       prevPage        StopSoundSetSound        decodeText                    -         h Ά 
       2
  h Ά 
       2
  h Ά 
       2'
            AddButtonHelperText        helper_text        Engine   	       Localize        LUA_MENU_NEXT_PAGE        button_ref        button_shoulderr        side        right 	       priority   ?
       clickable        LUA_MENU_PREV_PAGE        button_shoulderl    @
       MENU_EXIT        button_ref2        button_secondary                   "       _            9  L Ά        L 2   Ά        L 2 2 Ά        L	 2    
          controller        ACTIONS          PlaySoundSetSound        open        AddBlur        shipLogBlur    @       decodeText                                      9  L Ά        L            controller        ACTIONS   	       NextPage                          __            9  L Ά        L            controller        ACTIONS   	       PrevPage                   !       __            9  L Ά        L 2   Ά        L Ά        2	 2    
          controller        ACTIONS          PlaySoundSetSound        close 
       LeaveMenu        ScriptNotify        shipLogClose   ?                   ?       __   Ά                                    L  * 9   Ά                                    L  	  9 
 Ά          L 2    
 Ά          L  
 Ά          2 2             DataSources          inGame        SP        shipLog        showShipLog 	       GetValue          ACTIONS          PlaySoundSetSound        close 
       LeaveMenu        ScriptNotify        shipLogClose   ?                   