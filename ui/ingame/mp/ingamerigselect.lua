LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT            -       _   ¶   ¶          2      6     	 6
 ¶       	 2	 ¶  ¶             	 2  ¶  ¶             module          package          seeall        inGame.MP.rigSelect.rigs        BecomeActiveRigSelectMenu        InGameRigSelect        MenuBuilder          registerType          LUI          FlowManager        RegisterStackPopBehaviour 
       LockTable          _M                            ___   ¶   L             WipeControllerModelsAtPath                             _  ¶                     ¶ 

       2   ¶          2            DataSources          inGame        MP        rigSelectTitle 	       SetValue        Engine   	       Localize $       LUA_MENU_MP_INGAME_RIG_SELECT_TITLE        ACTIONS          AnimateSequence        DefaultSequence                            ¶                     ¶ 
       2   ¶    ¶               h  ¶        ¶               ¶                    ¶ 
      
       .  ¶                            :  ¶                            <  ¶                           ! 2   ¶ "             h$G%	'M(   )          DataSources          inGame        MP        rigSelectTitle 	       SetValue        Engine   	       Localize $       LUA_MENU_MP_INGAME_RIG_SELECT_TITLE        becomeActiveRigSelectMenu        BecomeActiveRigSelectMenu   
       rigSelect        TableGetRowCount        CSV          battleRigs        file        rigs        LUI          DataSourceFromList        new        GetDefaultFocusIndex        MakeDataSourceAtIndex        SetDataSource        addEventHandler        super_select_closed 
       UIElement 
       worldBlur    @       setupWorldBlur        id        blur        addElement                   ?       __   ¶          2  2 2 ¶ 	      
                    LT 2 } ¶ 	      
                   
	  L ¶        
  L      9 
   9ßÿ~             Game   
       GetOmnvar        ui_selected_archetype            DataSources          inGame        MP 
       rigSelect        rigs        GetCountValue   ?       GetDataSourceAtIndex 	       tonumber          index 	       GetValue                          _  ¶        ¶              ¶ 
      	
      

        ¶        ¶ 
        ¶ 
      
        L 2 x        ¶               L 2	 	x
        ¶               L	 2
 
x	  ¶ 	      
       	   ¶             	  L
 2 	x
  ¶ 
             
  	 ¶ 	      	      
  L 2 
x  ¶         2        	 
 2 ¶ !      
 h$,0	D
F   $          Engine          TableLookupGetRowNum        CSV          battleRigs        file        cols        index        ReadRow        LUI          DataSourceInControllerModel        new        .ref        ref        .index        .name 	       Localize        name        .desc        desc        .isUnlocked        IsUnlocked        rig        Filter 	       headshot        Cac          GetRigHeadshot        isUnlocked        rigHeadshot                            ¶     L            BecomeActiveRigSelectMenu                           __  ¶               h  h z  9	         
 9
 ¶          9  ¶    L    2  
4  ¶               2	 2 2	 2 2	 2
 2 2 ¶ X 2 2 2 
* 4 h!A# ¶$ 	& 2
' 2D   P*S*W ¶ -XX ¶ -X\ ¶ 0X^ ¶ 2Xb!g!i6k  ¶ 8      9      n  ¶ 8      ;      t=y?}  ¶ @            	 4
  AB
 C
  4
 2! 2 2! 2 ¶ DX ¶ EX ¶ F!X ¶ G#X
  4	H ¶I 	K      
L 2 h	 L	M       	NO 2 2		P       	Q ¶ RX 2		P       	S ¶ TX 2		 2! 2 2! 2 ¶ UX ¶ V!X ¶ W#X ¶ X%X		   
Y ¶Z 
\      
]      
^      _`    4H ¶I K      a 2 h a 2 2! 2 2 2 2 ¶ b)X 2 Â 4H ¶I K      c 2 h c 2 2 2! 2 2! 2 ¶ d'X ¶ e)X ¶ f+X ¶ g-X Æ 4H ¶I K      h 2 h h 2 2 2! 2 2! 2 ¶ i)X ¶ j+X ¶ k-X ¶ l/X Ð 4  ¶ m             n 2 2No 2 2p ¶ âZrs ¶t v"      s ¶t w$      x$        y  ¶ 8"      z"       2! 2 2! 2 ¶ {+X ¶ |-X ¶ }/X ¶ ~1X Ü              þ               2        2         ¶                        # 2    2    ¶ "        2 ¶ "           9 ¶ "        2             LUI   
       UIElement        new        id        InGameRigSelect        _animationSets        _sequences        controllerIndex        Engine          InFrontend        getRootController        assert   
       playSound 
       menu_open        UIImage        Background        SetRGBFromInt     	       SetAlpha    ?       SetAnchorsAndPosition        _1080p      @       addElement        maxVisibleColumns   ?       maxVisibleRows        SubtractForSplitscreen     À@  @@       buildChild        wrapX        wrapY 	       spacingX    A	       spacingY        columnWidth   ¯C
       rowHeight   ÈB       scrollingThresholdX        scrollingThresholdY        adjustSizeToContent         horizontalAlignment 
       Alignment        Left        verticalAlignment        Top        springCoefficient   ÈC       maxVelocity  @E       UIDataSourceGrid        DataSourcedGridLayout        setUseStencil         SetGridDataSourceThroughElement   C  ðC  XC XD       MenuBuilder          BuildRegisteredType 
       MenuTitle        MenuBreadcrumbs        setText                Icon        SetTop   äÁ
       SetBottom   vB  ÀB  äD  XB  C       DataSources          inGame        MP        rigSelectTitle        SubscribeToModel 	       GetModel        ButtonHelperBar   ªÂ       ArrowUp   ½C  ÇC ýC ÀD
       ArrowDown   UC  iC  ýC D       UIText 
       ListCount        1/15        SetFontSize   ÀA       SetFont        FONTS          GetFont        MainMedium        File        SetAlignment        Center  hC À¼C  D D       DefaultAnimationSet        addEventHandler        gain_focus 	       AddArrow        AddItemNumbers        addButtonHelperFunction        menu_create        UIBindButton        selfBindButton        bindButton        button_secondary        lose_focus        ACTIONS          AnimateSequence        DefaultSequence        CONDITIONS          IsSplitscreen        Splitscreen                             ¶          2 h  L
  ,               MenuBuilder          BuildRegisteredType        InGameRigSelectButton        controllerIndex                           ___   ¶                            L   9 L      	  
 2            DataSources          inGame        MP        rigSelectTitle 	       GetValue  
       MenuTitle        setText                        g         h h      L  2      L       h h    L  2     L       h h    L  2  h h    h    L  2	 
 h h    h	    L 	 2
  h h		   	 h

   	 
L 
 2      	  L	      	            RegisterAnimationSequence        DefaultSequence        _sequences        BackgroundMenu        Splitscreen                   
       __   L           2 2  ,               Background 	       SetAlpha    ?                              ___   L   2             AnimateSequence        DefaultSequence                    
       _   L           2 2  ,               Background 	       SetAlpha                                  L   2             AnimateSequence        BackgroundMenu                           __   L           2 2 2 2 ¶ X ¶ X ¶ 	X	 ¶ 	
X
 2  ,               DataSourcedGridLayout        SetAnchorsAndPosition       ?       _1080p     C  ðC  *C  MD                   
       _   L           2 2  ,               ArrowUp 	       SetAlpha   ?                              __   L           2 2 2 2 ¶ X ¶ X ¶ 	X	 ¶ 	
X
 2  ,               ArrowUp        SetAnchorsAndPosition       ?       _1080p     ½C  ÇC ýC ÀD                   
       ___   L           2 2  ,        
       ArrowDown 	       SetAlpha   ?                                 L           2 2 2 2 ¶ X ¶ X ¶ 	X	 ¶ 	
X
 2  ,        
       ArrowDown        SetAnchorsAndPosition       ?       _1080p     UC  iC  ýC D                   
       _   L           2 2  ,        
       ListCount 	       SetAlpha   ?                                 L           2 2 2 2 ¶ X ¶ X ¶ 	X	 ¶ 	
X
 2  ,        
       ListCount        SetAnchorsAndPosition       ?       _1080p     hC ¼C  D D                          _   L   2   L   2   L   2   L   2             AnimateSequence        Splitscreen                          _            9  L ¶        L 2            controller        ACTIONS          AnimateSequence        DefaultSequence                           __  h ¶ 
       2
  h ¶ 
       2
            AddButtonHelperText        helper_text        Engine   	       Localize 
       MENU_BACK        button_ref        button_secondary        side        left 
       clickable        LUA_MENU_SELECT        button_primary 	       priority    Á                         ___            9  L ¶        L            controller        ACTIONS   
       LeaveMenu                          _            9  L ¶        L 2            controller        ACTIONS          AnimateSequence        BackgroundMenu                    