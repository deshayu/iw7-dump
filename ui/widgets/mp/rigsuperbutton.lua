LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT                   _   ¶   ¶               6 ¶	        2 ¶  ¶  ¶             module          package          seeall        RigSuperButton        MenuBuilder          registerType   
       LockTable          _M                     ;         ¶               	
 2   	 2     ¶           9 ¶            2    
	 2    	 2                LUI          UIBindButton        new        id        selfBindButton        addElement        bindButton        addEventHandler        button_over 
       actionSFX        ui_select_screen_return        button_action        CONDITIONS          UseCACBreadCrumbs        assert          NewItemNotification        SubscribeToModelThroughElement        ref        gain_focus        lose_focus                          ___  h            GetCurrentMenu        processEvent        name 
       OverSuper                                      9  L ¶        L  ¶       	       L    
          controller        ACTIONS          EquipRigSuper        LUI          FlowManager        RequestLeaveMenu                           ___   L              L  ¶        L   ¶ 
       2  L                  GetDataSource        ref 	       GetValue        Cac          UpdateNewItemNotification        CSV          rigSuperUnlockTable        super        NewItemNotification                          ___  ¶                 L        L
  	          LUI          FlowManager        GetScopedData        currentSuper        GetDataSource        ref 	       GetValue                	            ¶                ¶         L	       
 ¶        2 L                  LUI          FlowManager        GetScopedData        Cac          ClearNewItemNotification        currentSuper        CSV          rigSuperUnlockTable        super        NewItemNotification                   )      _  ¶              2 2 2 2	 2
 ¶	 

Z 2 ¶	 Z  h  h  z  9         
 9 ¶          9  ¶         	 2
 

 4 ¶        ! 2	 h	" !	 2
 2 2 2 2 2 2 2"	 B 4  ¶ #             $%
 2 2&
 2 2'
( ¶) + 2
 2
 2 2 2 2 2 2 ¶	 ,!X ¶	 -#X"
 H 4	  ¶ 	#      	      	 .	% 2 2		& 2 2		 2 2 2 2 2 2 2 ¶	 ,%X		" 	\	 4
  ¶ 
#      
      
	 	/
&0 2 2

1 21 21 21 2 ¶	 2!X ¶	 3#X ¶	 2%X ¶	 3'X

   	  4 2 
" 	^ 4  ¶ 5             67 ¶	 pZ9: ¶; =      : ¶; >      ?        @  ¶ A      B      CD 2EF 2G 2HD 2IF 2J  ¶ 5      K      L      M 2 2 21 21 2 ¶	 N%X ¶	 O'X ¶	 P)X ¶	 Q+X     R 2 
" l 4 ¶        S 2 h" T 2 2 2 2 ¶	 U)X 2 ¶	 V-X ¶	 /X     W 2 
" ¨ 4 ¶         X 2 h"  X 2 2 2 2 2 2 2 2" °  4  ¶ #"      "       "Y&! 2 2'!( ¶) Z 2 2!1 21 21 21 2 ¶	 [/X ¶	 \1X ¶	 [3X ¶	 \5X"  ² "4] ¶^ `$          $ 9 ¶  $      a 2 h" $a&# 2 2#1 21 21 21 2 ¶	 b1X ¶	 c3X ¶	 b5X ¶	 c7X" "Â  	            È       d&      ef 2   eg 2       h 2 &
ei 2   ej 2	   
    k 2 (
     2 *
  L      l          LUI   	       UIButton        new        SetAnchorsAndPosition       ?       _1080p     RC  C       id        RigSuperButton        _animationSets        _sequences        controllerIndex        Engine          InFrontend        getRootController        assert          setUseStencil        SubscribeToModelThroughElement        rigSuper.isDisabled        MenuBuilder          BuildRegisteredType        GenericItemBackground        addElement        UIImage        ActivateTextMask        SetRGBFromInt 	       SetAlpha 	       setImage        RegisterMaterial          widg_gradient_top_to_bottom   A  ÈB       ActivateTextMaskTop        SuperImage ?   ?  Â  B       rigSuper.fullImage        UIStyledText 
       SuperName        SetFontSize   °A       SetFont        FONTS          GetFont        MainMedium        File        SetAlignment 
       Alignment        Left        SetStartupDelay   zD       SetLineHoldTime   ÈC       SetAnimMoveTime        SetEndDelay        SetCrossfadeTime        SetAutoScrollStyle        AutoScrollStyle        ScrollH        SetMaxVisibleLines   A  Á  ,B  B       rigSuper.name        CaCSelectedMessage 	       Selected   A  C       rigSuper.isEquippedAlpha        GenericButtonSelection        Lock        icon_slot_locked   ÐÁ  ÐA       CONDITIONS          UseCACBreadCrumbs        NewItemNotification    Â   B       DefaultAnimationSet        addEventHandler        button_over 
       button_up        rigSuper.isEquipped        button_disable        button_over_disable        rigSuper.isUnlocked                          __   L                      L   9  L              GetDataSource 	       rigSuper        isDisabled 	       GetValue         SetButtonDisabled                              L                      L   9 L ¶   	 2  
          GetDataSource 	       rigSuper 
       fullImage 	       GetValue  	       setImage        RegisterMaterial                                 _   L                      L   9 L   2            GetDataSource 	       rigSuper        name 	       GetValue         setText                               ___   L                      L   9 L         2            GetDataSource 	       rigSuper        isEquippedAlpha 	       GetValue         EndCapRight 	       SetAlpha                              __     L         h h    h    L 2  h h    h    L 2      L        h h    h    L 2  h h    h	    L 2	 

     L          L       
 	  L	       		 h
 h   
 h   	
 L
 2 

    L       
 h h    h    L 2     L        h h             L	 2  h h             L	 2      L         h h    L#
 2   h h    
L%
 2 "     L &       h h    L) 2 & h h     
L+ 2 (!     L ,       h h"    L/ 2 , h h#    L1 2 .$     L 2                  _sequences        DefaultSequence        RegisterAnimationSequence        ButtonOver 	       ButtonUp        Pulse 
       PulseStop        ButtonOverDisabled        ButtonUpDisabled 	       Activate        Locked 	       Unlocked        StopActivateAnim     %                      ___                         
       ___   L           2 2  ,               SuperImage 	       SetAlpha   ?  HB                   
       ___   L           2 2  ,               SuperImage 	       SetScale ÍÌL=  HB                   
       ___   L           2 2  ,        
       SuperName        SetRGBFromInt ÿÿK                       
       ___   L           2 2  ,        
       SuperName 	       SetAlpha   ?                       	          L   2   L   2             AnimateSequence        ButtonOver                    
       __   L           2 2  ,               SuperImage 	       SetAlpha   ?  HC                   
       ___   L           2 2  ,               SuperImage 	       SetScale       HC                   
       ___   L           2 2  ,        
       SuperName        SetRGBFromInt ÿÿK                       
       ___   L           2 2  ,        
       SuperName 	       SetAlpha   ?                       	          L   2   L   2             AnimateSequence 	       ButtonUp                                                             ___                         
       ___   L           2 2  ,        
       SuperName 	       SetAlpha ÍÌL>  HB                             L           ¶              2  ,        
       SuperName        SetRGBFromTable 	       SWATCHES          genericButton        textDefault   HB                          __   L   2             AnimateSequence        ButtonOverDisabled                           __   L           ¶              2  ,        
       SuperName        SetRGBFromTable 	       SWATCHES          genericButton        textDefault   HC                   
       __   L           2 2  ,        
       SuperName 	       SetAlpha ÍÌL>  HC                             L   2             AnimateSequence        ButtonUpDisabled                    
          L           2 2  ,               ActivateTextMask 	       SetAlpha                        
       __   L           2 2  ,               ActivateTextMask 	       SetAlpha ÍÌL?  ÈB                   
       _   L           2 2  ,               ActivateTextMask 	       SetAlpha ÍÌL?  HD                   
       _   L           2 2  ,               ActivateTextMask 	       SetAlpha       C                   
       _   L           2 2  ,               ActivateTextMaskTop 	       SetAlpha                        
       ___   L           2 2  ,               ActivateTextMaskTop 	       SetAlpha ÍÌL?  ÈB                   
       __   L           2 2  ,               ActivateTextMaskTop 	       SetAlpha ÍÌL?  HD                   
       __   L           2 2  ,               ActivateTextMaskTop 	       SetAlpha       C                   	       __   L   2   L   2             AnimateSequence 	       Activate                    
          L           2 2  ,               SuperImage 	       SetAlpha                        
          L           2 2  ,               Lock 	       SetAlpha   ?                       	       _   L   2   L   2             AnimateSequence        Locked                    
       __   L           2 2  ,               SuperImage 	       SetAlpha   ?                       
       ___   L           2 2  ,               Lock 	       SetAlpha                        	       __   L   2   L   2             AnimateSequence 	       Unlocked                    
          L           2 2  ,               ActivateTextMask 	       SetAlpha                        
       __   L           2 2  ,               ActivateTextMaskTop 	       SetAlpha                        	       ___   L   2   L   2             AnimateSequence        StopActivateAnim                                      9  L ¶        L 2 ¶        L 2            controller        ACTIONS          AnimateSequence        ButtonOver        Pulse                                      9  L ¶        L 2 ¶        L 2            controller        ACTIONS          AnimateSequence 	       ButtonUp 
       PulseStop                    _       __   L                      L    9   L                      L    9  ¶  	         L h   ¶           L 2    L                      L    9   L                      L    9  ¶  	         L h   ¶           L 2             GetDataSource 	       rigSuper        isEquipped 	       GetValue         ACTIONS          AnimateSequenceByElement        elementName 	       Selected        sequenceName 	       Activate        elementPath        AnimateSequence  	       Inactive        StopActivateAnim                          _            9  L ¶        L 2            controller        ACTIONS          AnimateSequence        ButtonUpDisabled                          _            9  L ¶        L 2            controller        ACTIONS          AnimateSequence        ButtonOverDisabled                    I       ___   L                      L   9   L                      L    9  ¶  	         L
 2    L                      L   9   L                      L    9  ¶  	         L 2             GetDataSource 	       rigSuper        isUnlocked 	       GetValue         ACTIONS          AnimateSequence 	       Unlocked         Locked                    I       _   L                      L   9   L                      L    9  ¶  	         L
 2    L                      L   9   L                      L    9  ¶  	         L 2             GetDataSource 	       rigSuper        isDisabled 	       GetValue         ACTIONS          AnimateSequence        ButtonUpDisabled  	       ButtonUp                    