LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT            ó       _   ¶   ¶          ¶  
                2 h 2   ¶  h%)-1 "  ¶  h79 4  ¶  ;  ¶  ?  ¶  A  ¶  "C  ¶  G  ¶  I  ¶  ¶              J  ¶  M ' 2      ( ¶) +      , 2   - 6 . 6 / 6 0 6 1 6	 2 6
 3 6 4 6 5 6 6 6 7 6 8 6 9 6 : 6 ; 6 < 6 = 6 > 6 ? 6 @ 6 A 6 B 6 C 6 D 6 E 6 F 6 G 6   ! "   	#  
$   % H 6& I 6' J 6 4(  4) * + , - . / 0 1 2 3 4   	 
         5   K 66 7  L 68  M 69 N 6: O 6; P 6< =   Q 6>   R 6?         S 6@  6( ¶) +4       2 ¶T  ¶ 
4      V4       2Q ¶W Y ¶Z \ ¶]   _          module          package          seeall        LUI          FlowManager        RegisterFenceGroup        EmblemEditorMenu        canCreateEmblem        EmblemEditor          ColorPickerMode        CLOSED            COLOR_GRID   ?       COLOR_MIXER    @       MATERIAL_PICKER   @@
       ScaleMode        FIXED_SCALE        FREE_SCALE        gridVisible         useAlternateGridColor        gridLineWidth        maximumGridLines    A       dirty        layerIconChanged        colorPickerMode        selectingFavoriteColors &       frontEnd.MP.headQuarters.emblemEditor        MenuBuilder          registerType        EditorOptionsPopup        HandleEditLayer        HandleClearLayer        HandleCopyLayer        HandleCutLayer        HandlePasteLayer        HandleChooseLayerIcon        HandleBackConfirmation        HandleDuplicateLayer        HandleDoneEditingLayer        HandleGroupLayer        HandleUngroupLayer        HandleResetMaterial        ShouldShowPasteButtonHelper !       ShouldShowGroupLayerButtonHelper %       ShouldShowAddToFavoritesButtonHelper #       ShouldShowRemoveColorFromFavorites #       ShouldShowUngroupLayerButtonHelper %       ShouldShowDuplicateLayerButtonHelper        SetColorPickerMode        OpenColorMixerPanel        AddColorToFavorites        RemoveColorFromFavorites        SwitchToFavorites        SwitchToColors        OpenColorPicker        OpenMaterialPicker        CloseToolPanel        OpenOptionsPopup        UpdateLayersUI        SelectLayer        UpdateButtonHelper        StartEditingLayer        StopEditingLayer        PauseEditingLayer        ResumeEditingLayer        UpdateMenuTitle        PopFunc        PreLoadFunc        PostLoadFunc          RegisterStackPopBehaviour   
       LockTable          _M       A                     __  ¶   ¶         h	 ¶
              2            EmblemEditor          gridVisible        dispatchEventToRoot        name        grid_modified 
       immediate        LUI          FlowManager        RequestLeaveMenuByName        EditorOptionsPopup                           ___  ¶   ¶         h	 ¶
              2            EmblemEditor          useAlternateGridColor        dispatchEventToRoot        name        grid_modified 
       immediate        LUI          FlowManager        RequestLeaveMenuByName        EditorOptionsPopup                	   ^       _          h ¶        2
 h h ¶           9 ¶        2   9 ¶        2$    2 h ¶           9 ¶        2   9 ¶        2$  2 ¶        :" ¶ !      " 2 $G   %          controllerIndex        title        Engine   	       Localize $       MP_EMBLEM_EDITOR_OPTIONS_MENU_TITLE        width   ÈC       message                defaultFocusIndex   ?       cancelClosesPopup        buttonsClosePopup         buttons        label        EmblemEditor          gridVisible !       MP_EMBLEM_EDITOR_TOGGLE_GRID_OFF         MP_EMBLEM_EDITOR_TOGGLE_GRID_ON        action        useAlternateGridColor +       MP_EMBLEM_EDITOR_TOGGLE_GRID_ALT_COLOR_OFF *       MP_EMBLEM_EDITOR_TOGGLE_GRID_ALT_COLOR_ON 	       disabled        MenuBuilder          BuildRegisteredType        PopupMessageAndButtons        id        EditorOptionsPopup                         _  L                                  ___  L                                   ___  ¶              2      ¶              2               LUI          FlowManager        RegisterStackPushBehaviour        EditorOptionsPopup        RegisterStackPopBehaviour                             ¶           L             EmblemEditor          EndEdit                           __   ¶           L             EmblemEditor   
       BeginEdit                    4         ¶                       ¶               9	 ¶
       	 ¶
            9 ¶      9 ¶                       LUI          UIGrid        GetFocusPosition        LayersGrid 
       DIRECTION        horizontal         EmblemEditor          GetSelectedLayerIndex        IsLayerEmpty        HandleChooseLayerIcon          StartEditingLayer          controller                    ;       ___  ¶                       ¶              # 9	 ¶
  2	 ¶
       	 ¶
        	 ¶
                ¶                      LUI          UIGrid        GetFocusPosition        LayersGrid 
       DIRECTION        horizontal         EmblemEditor          dirty 
       playSound        clearLayer        GetSelectedLayerIndex        ClearLayer        CreateEmblemEditorDataModel        controller        UpdateButtonHelper                      7         ¶                       ¶               9	 ¶
       	 ¶
           9 2	 ¶
         ¶                      LUI          UIGrid        GetFocusPosition        LayersGrid 
       DIRECTION        horizontal         EmblemEditor          GetSelectedLayerIndex        IsLayerEmpty 
       playSound 
       copyLayer 
       CopyLayer        UpdateButtonHelper          controller                           __  ¶     ¶                HandleCopyLayer          HandleClearLayer                      ;         ¶                       ¶              # 9	
 2 ¶  ¶        ¶         ¶                ¶                      LUI          UIGrid        GetFocusPosition        LayersGrid 
       DIRECTION        horizontal  
       playSound        pasteLayer        EmblemEditor          dirty        GetSelectedLayerIndex        PasteLayer        CreateEmblemEditorDataModel        controller        UpdateButtonHelper                   
   .         ¶         $ 9 ¶             	         ¶ 
              9 ¶              2   ¶  4	             EmblemEditorUtils          IsEditingLayer        LUI          UIGrid        GetFocusPosition        LayersGrid 
       DIRECTION        horizontal         FlowManager        RequestAddMenu        EmblemDecalLibraryMenu        controllerIndex                      t       _  ¶           9 ¶           ¶	          2        W 9 ¶          F 9                        9 2 *r  9 ¶                2          	 h
 ¶ 
      
	
8 % 9 ¶                2          	 4 ¶                	 9 ¶                            EmblemEditorUtils          IsEditingLayer        StopEditingLayer          controller        ACTIONS   
       GainFocus        LayersGrid        EmblemEditor          dirty        GetDataSource        selectedEmblem        layersUsed 	       GetValue            LUI          FlowManager        RequestPopupMenu        EmblemEditorSavePopup        emblemName        GetEmblemName        EmblemEmptyLayersPopup        RequestLeaveMenu                    `       _ 4                    9 2 ¶       PT  
 2 }
` ¶ 	           9    9òÿ~
 7 9 ¶  ¶        ¶          ¶         ¶          	          h(+	  ¶                ¶                      layersGridCountDataSource 	       GetValue        controller            EmblemEditor          GetSelectedLayerIndex   ?       IsLayerEmpty         dirty 
       CopyLayer        PasteLayer        SelectLayer          LayersGrid        SetPosition        x        y        CreateEmblemEditorDataModel        UpdateButtonHelper                             _  ¶           ¶          2	 ¶
             StopEditingLayer          controller        ACTIONS   
       GainFocus        LayersGrid        controllerIndex                             __  ¶         ¶        2        ¶            
          EmblemEditor          SetLayerGroupIndex        GetSelectedLayerIndex   ?       controller        UpdateButtonHelper                             _  ¶         ¶        2        ¶            
          EmblemEditor          SetLayerGroupIndex        GetSelectedLayerIndex            controller        UpdateButtonHelper                      
       _  ¶                          EmblemEditor          ResetLayerMaterial        controller                     	       ___   ¶             l              EmblemEditor          IsClipboardEmpty                            _   ¶           ¶             l              EmblemEditor          IsLayerGrouped        GetSelectedLayerIndex                             ¶                    EmblemEditor          CanAddColorToFavorites                    %       ___                 9                  9    9       	   9               FavoriteColorsPanel        ColorsGrid        GetFocusPositionIndex         GetGridDataSource        GetDataSourceAtIndex        valid 	       GetValue                               ¶           ¶           ,               EmblemEditor          IsLayerGrouped        GetSelectedLayerIndex                    $            9        
 9                  9 2        	     9 2p   9               GetDataSource        selectedEmblem         layersUsed 	       GetValue            layersGridCountDataSource                 	   P       _  ¶   ¶           9 2   ¶        	        
                   z  9  ¶              
 9  ¶                9   ¶ 
                   9 ¶     ¶                EmblemEditor          colorPickerMode        originalLayerColor        GetSelectedLayerColor   ¿       originalMaterialID        GetSelectedLayerMaterialID        EmblemEditorToolPanel        SetColorPickerMode        ColorPickerMode        COLOR_GRID        COLOR_MIXER        EmblemEditorUtils          SetVisibleAndEnabled        FavoriteColorsPanel        PauseEditingLayer          UpdateButtonHelper                             __  ¶           ¶ 
      
      	 ¶
                  SetColorPickerMode          controller        EmblemEditor          ColorPickerMode        COLOR_MIXER        UpdateMenuTitle                               ¶         ¶                ¶            	          EmblemEditor          GetLayerColor        AddColorToFavorites        controller        UpdateButtonHelper                             _                 9 ¶               	 ¶
                      FavoriteColorsPanel        ColorsGrid        GetFocusPositionIndex         EmblemEditor          RemoveColorFromFavorites        controller        UpdateButtonHelper                             __  ¶          h	         h
 ¶                      EmblemEditor          selectingFavoriteColors        FavoriteColorsPanel        processEvent        name        gain_focus        EmblemEditorToolPanel        lose_focus        UpdateButtonHelper          controller                    B       __  ¶         ¶                9 ¶ 	      
               2         9 ¶ 	      
               2                h%  ¶ ) ¶                      EmblemEditor          colorPickerMode        ColorPickerMode        COLOR_GRID        ACTIONS   
       GainFocus        EmblemEditorToolPanel        ColorPickerGrid        SelectedColor        controller        ColorMixerPanel        Red        FavoriteColorsPanel        processEvent        name        lose_focus        selectingFavoriteColors         UpdateButtonHelper                               ¶           ¶ 
      
      	 ¶
                  SetColorPickerMode          controller        EmblemEditor          ColorPickerMode        COLOR_GRID        UpdateMenuTitle                             _  ¶           ¶ 
      
       ¶ 	             
 ¶                  SetColorPickerMode          controller        EmblemEditor          ColorPickerMode        MATERIAL_PICKER        BeginEditMaterial        UpdateMenuTitle                      j       _  ¶         ¶                9  ¶                ¶   ¶               ¶ 
         ¶          2        ¶          2        ¶            ¶ 
                 2 ¶                  ¶           ¶      "          EmblemEditor          colorPickerMode        ColorPickerMode        MATERIAL_PICKER        EndEditMaterial        controller        CLOSED        selectingFavoriteColors         EmblemEditorToolPanel        CloseToolPanel        ACTIONS   
       LoseFocus        FavoriteColorsPanel        ResumeEditingLayer          GetSelectedLayerIndex 	       SetAlpha            EmblemEditorUtils          SetVisibleAndEnabled        UpdateButtonHelper          UpdateMenuTitle                             __  ¶          ¶         2            EmblemEditor          ResetLayerMaterial        SetLayerMaterial   ¿                                       9 ¶           ¶              	       
              
            originalLayerColor        GetColorTableFromIntColor          EmblemEditor          SetLayerColor        r        g        b        controller                           __             9 ¶                                   originalMaterialID        EmblemEditor          SetLayerMaterial        controller                   	       _  L    L                           
       ___  L     ¶                CloseToolPanel                            _  L    L     ¶                CloseToolPanel                             _  ¶                2            h	 4
              LUI          FlowManager        RequestPopupMenu        EditorOptionsPopup        controller                           _                   9 2                   9 2        	     9 2 p   9P ¶ 

       2 ¶ P ¶ 	            
         
 ¶            9               ¶ 	 ¶ 	
      
 2	      9               ¶ 	 ¶ 	
      
 2	     ¶ 
       2 ¶ 	 	 ¶ 
 	             
	 2  !          GetDataSource        selectedEmblem        selectedLayer 	       GetValue            layersUsed        layersGridCountDataSource        Engine   	       Localize        MP_EMBLEM_EDITOR_LAYER_X_OF_Y 	       tostring     ?       ArrowsWithLabel        UpdateLabel        GridItemText        setText        EmblemEditor          IsLayerEmpty        EditLabelButton        Label        ToUpperCase          MP_EMBLEM_EDITOR_CREATE_NEW        MP_EMBLEM_EDITOR_EDIT_LAYER        MP_EMBLEM_EDITOR_LAYERS_USED        LayersUsedLabel                             ¶         ¶                EmblemEditor          SelectLayer        UpdateLayersUI                               ¶     ¶ 
           	          StartEditingLayer          EmblemEditor          GetSelectedLayerIndex        editLayerTimer                     D       __          < 9 ¶           3 9         9         	   % 9          9           9	        
	       
       9          
 9	        
	       
        Éÿ8             buttonHelpers         pairs   
       condition        binding        button_ref        bindButton        registerEventHandler        button_ref2        refreshTimer                  
       ___  L        L               binding                   
       __  L        L               binding                     &       __   ¶            ¶                 9      9 ¶ 	      
 2   9 ¶ 	       2             EmblemEditor          GetScaleMode 
       ScaleMode        FIXED_SCALE        Engine   	       Localize $       @MP_EMBLEM_EDITOR_SCALE_LAYER_FIXED #       @MP_EMBLEM_EDITOR_SCALE_LAYER_FREE                               ¶           ¶           X              EmblemEditor          GetLayerOpacity        GetSelectedLayerIndex   ÈB                           __   ¶           ¶           ,               EmblemEditor          GetLayerRotation        GetSelectedLayerIndex                           __  ¶         ¶       \            EmblemEditor          SetLayerOpacity        GetSelectedLayerIndex   ÈB                          __  ¶         ¶                     EmblemEditor          SetLayerRotation        GetSelectedLayerIndex                            __   ¶           ¶           ,               EmblemEditor          GetLayerMaterialRotation        GetSelectedLayerIndex                           __  ¶         ¶                     EmblemEditor          SetLayerMaterialRotation        GetSelectedLayerIndex                            __   ¶           ¶                      EmblemEditor          ToggleOutline        GetSelectedLayerIndex                            _   ¶           ¶                      EmblemEditor          ToggleFlip        GetSelectedLayerIndex                                                               ___   ¶              9   ¶           L             EmblemEditor          HasGroupedLayers        ToggleScaleMode                   Î        ¶                h h ¶ 

       2! ¶ $-1 h ¶ 
       2! ¶ $-1 h ¶ 
       2!  ¶! $$ ¶% F-1
 h h ¶ 

      ( 2! ¶ $-1 h ¶ 
       2! ¶ $-1 h ¶ 
      ) 2*!+ ¶, $-1 h ¶ 
      	. 2/!0 ¶1 $-1 h	 ¶ 	
      
3 2		4!	5 ¶6 	$-1	 h
 ¶ 

       2
	
			!
  ¶! 	
$
$ ¶% 	
F	-	1
 h ¶ 
      8 2

9

!: ¶; 
$
-
1 h ¶ 
      = 2>!? ¶@ $B ¶C F-1 h ¶ 
      E 2F!G ¶H $J ¶K F-1N h h ¶ 

       2!N ¶O $-1 h ¶ 
      Q 2!R ¶S $-1 h ¶ 
      U 2V!-1 h ¶ 
      	W 2XZ³!-1 h	  L	¶\!»-1	 h
 ¶ 

      ^ 2
	
	4		!	-	1
 h ¶ 
      _ 2

/

! L
$
-
1 h ¶ 
      ` 2ab³!-1 h ¶ 
      c 2F>³!-1 h ¶ 
      d 2*!e ¶f $-1 h ¶ 
      h 2i!-1 h ¶ 
       j 2k!l ¶m $-1 
h h ¶ 

      p 2!q%-1 h ¶ 
      r 2! L$-1 h ¶ 
      s 24!t ¶u $-1 h ¶ 
      	w 2*!x ¶y F{ ¶| $-1 h	 ¶ 	
      
~ 2		/!	 ¶ 	$-1
Þ 
h h ¶ 

      p 2! ¶ $-1 h ¶ 
      r 2! ¶ $-1 h ¶ 
       24!e ¶f $-1 h ¶ 
      	w 2*!x ¶y F{ ¶| $-1 h	 ¶ 	
      
~ 2		/!	 ¶ 	$-1
 h h ¶ 

       2!q%-1 h ¶ 
      r 2! L$-1 h ¶ 
       2*! ¶ F ¶ $-1 h ¶ 
      	 2/! ¶ $-1 
h h ¶ 

       2!q%-1 h ¶ 
      r 2! L$-1 h ¶ 
       2XZ³!-1 h  L¶\!-1 h	 ¶ 	
      
 2		/!	 ¶ 	$-1
& ¶          á9 h h ¶ 

       2!N ¶O $-1 h ¶ 
      Q 2!R ¶S $-1 h ¶ 
       29=-1 h ¶ 
      	 2ab³=-1 h	  L	¶A»¡9	 L
 		$-1	 h
 ¶ 

      ¢ 2
	
	A
 
L	
$	!	-	1
 h ¶ 
      £ 2

A
/ L
$
-
1 h ¶ 
      ¤ 2A*e ¶f $-1 h ¶ 
      ¥ 2Ai¦ ¶§ $-1 h ¶ 
      © 2Al ¶m $-1 h ¶ 
      ª 2W­Y¯] L` Lb-1 h ¶ 
       ² 2W­Y³] L` Lb-14 h h ¶ 

       2! ¶ $-1 h ¶ 
       2! ¶ $-1 h ¶ 
      µ 2A  ¶! $$ ¶% F-1h h h ¶ 

      · 2! ¶ $-1 h ¶ 
      ¸ 2! ¶ $-1 h ¶ 
      ¹ 2*A+ ¶, $-1 h ¶ 
      	º 2/A0 ¶1 $-1 h	 ¶ 	
      
» 2		4A	5 ¶6 	$-1	 h
 ¶ 

      µ 2
	
		A
  ¶! 	
$
$ ¶% 	
F	-	1
 h ¶ 
      ¼ 2

9
A: ¶; 
$
-
1 h ¶ 
      ½ 2>A? ¶@ $B ¶C F-1 h ¶ 
      ¾ 2FAG ¶H $J ¶K F-1l 
h h ¶ 

      ¸ 2!q%-1 h ¶ 
      À 2! L$-1 h ¶ 
      Á 2W­Y³] L` Lb-1 h  L¶A¡9 L	 $-1 h	 ¶ 	
      
 2		A/	 ¶ 	$-1
~  Â          LUI          FlowManager        GetScopedData        layerEmptySelectButtonHelpers        helper_text        Engine   	       Localize        MP_EMBLEM_EDITOR_CREATE_NEW        button_ref        button_primary        side        left 
       clickable        binding        HandleEditLayer          control_panel_only         button_helper_only        @MENU_DONE        button_secondary        HandleBackConfirmation          @MP_EMBLEM_EDITOR_PASTE_LAYER        button_start        HandlePasteLayer   
       condition        ShouldShowPasteButtonHelper          layerSelectButtonHelpers        @MP_EMBLEM_EDITOR_EDIT_LAYER        @MP_EMBLEM_EDITOR_CHANGE_LAYER        button_alt2        HandleChooseLayerIcon          @MP_EMBLEM_EDITOR_CLEAR_LAYER        button_alt1        HandleClearLayer          @MP_EMBLEM_EDITOR_COPY_LAYER        button_select        HandleCopyLayer          @MP_EMBLEM_EDITOR_CUT_LAYER        button_dpad_down        HandleCutLayer          @MP_EMBLEM_EDITOR_GROUP_LAYER        button_shoulderr        HandleGroupLayer   !       ShouldShowGroupLayerButtonHelper           @MP_EMBLEM_EDITOR_UNGROUP_LAYER        button_shoulderl        HandleUngroupLayer   #       ShouldShowUngroupLayerButtonHelper          layerEditButtonHelpers        HandleDoneEditingLayer          @MP_EMBLEM_EDITOR_OPTIONS        OpenOptionsPopup          @MP_EMBLEM_EDITOR_MOVE        button_stickl_updown        @MP_EMBLEM_EDITOR_ROTATE        button_left_trigger        button_ref2        button_right_trigger        helper_text_func 
       button_r3        ignoreGroupedLayers        @MP_EMBLEM_EDITOR_FLIP        @MP_EMBLEM_EDITOR_OUTLINE %       @MP_EMBLEM_EDITOR_CHANGE_LAYER_ORDER        button_dpad_left        button_dpad_right !       @MP_EMBLEM_EDITOR_CHANGE_OPACITY        @MP_EMBLEM_EDITOR_COLOR_PICKER        OpenColorPicker   "       @MP_EMBLEM_EDITOR_MATERIAL_PICKER        button_dpad_up "       @MP_EMBLEM_EDITOR_DUPLICATE_LAYER        button_left_stick        HandleDuplicateLayer          colorPickerButtonHelpers        @LUA_MENU_SELECT         @MENU_BACK %       @MP_EMBLEM_EDITOR_TOGGLE_COLOR_MIXER        OpenColorMixerPanel   #       @MP_EMBLEM_EDITOR_ADD_TO_FAVORITES %       ShouldShowAddToFavoritesButtonHelper          AddColorToFavorites   &       @MP_EMBLEM_EDITOR_SWITCH_TO_FAVORITES        SwitchToFavorites          colorMixerButtonHelpers        CloseToolPanel   &       @MP_EMBLEM_EDITOR_TOGGLE_COLOR_PICKER        favoriteColorsButtonHelpers (       @MP_EMBLEM_EDITOR_REMOVE_FROM_FAVORITES #       ShouldShowRemoveColorFromFavorites          RemoveColorFromFavorites   #       @MP_EMBLEM_EDITOR_SWITCH_TO_COLORS        SwitchToColors          materialPickerButtonHelpers "       @MP_EMBLEM_EDITOR_ROTATE_MATERIAL         MP_EMBLEM_EDITOR_RESET_MATERIAL        HandleResetMaterial          IsPC        layerEditMouseHelpers        MP_EMBLEM_EDITOR_MOVE 
       imageIcon        ui_button_pc_click_left        mouse_control_panel $       MP_EMBLEM_EDITOR_CHANGE_LAYER_ORDER 	       isButton        ui_button_pc_click_right        MP_EMBLEM_EDITOR_FLIP        MP_EMBLEM_EDITOR_OUTLINE        MP_EMBLEM_EDITOR_COLOR_PICKER !       MP_EMBLEM_EDITOR_MATERIAL_PICKER        OpenMaterialPicker   !       MP_EMBLEM_EDITOR_DUPLICATE_LAYER         MP_EMBLEM_EDITOR_CHANGE_OPACITY 	       isSlider 
       sliderMin     
       sliderMax   ÈB       sliderValueFunc        sliderAction        MP_EMBLEM_EDITOR_ROTATE   ´C       layerEmptySelectMouseHelpers        MP_EMBLEM_EDITOR_PASTE_LAYER        layerSelectMouseHelpers        MP_EMBLEM_EDITOR_EDIT_LAYER 
       MENU_DONE        MP_EMBLEM_EDITOR_CHANGE_LAYER        MP_EMBLEM_EDITOR_CLEAR_LAYER        MP_EMBLEM_EDITOR_COPY_LAYER        MP_EMBLEM_EDITOR_CUT_LAYER        MP_EMBLEM_EDITOR_GROUP_LAYER        MP_EMBLEM_EDITOR_UNGROUP_LAYER        materialPickerMouseHelpers 
       MENU_BACK !       MP_EMBLEM_EDITOR_ROTATE_MATERIAL                   ³        ¶                         9  L    4        	 a 9        		 h            9        		 h ¶          E 9	       	   9	       	   
 9	                      	
	       	   
 9	                      	
	         9	       	    9	        	        4		       	    9	        	        4	  ·ÿ8 ¶           9 ¶            9!          9"        # ¶$ &        ' 2 ´ 9( ¶) +      ( ¶) ,
      -
       \ 9# ¶$ &        . 2( ¶) /          90          9( ¶) +      ( ¶) ,
      1
         92         } 9( ¶) +      ( ¶) ,
      3
         94         i 9( ¶) +      ( ¶) ,
      5
        Z 9 ¶            96          97         H 9( ¶) 8      9	  9( ¶) :      ( ¶) 8
            9# ¶$ &        . 2 ¶            9          9;          9# ¶$ &        . 2 ¶            9<          9=                	 I 9 ¶          @ 9	>         9	>       
   	 ? 3 9	@       	    9	@       			       	   9	B         		C       	   9	 	D	
F       
    9
        
    9
        
	 
  9
        
	 
  ¼ÿ8G           9HI 2 G                K          LUI          FlowManager        GetScopedData        layerEmptySelectButtonHelpers        buttonHelpers         EmblemEditorControls        processEvent        name #       clear_control_panel_button_helpers        EmblemEditorMouseControls        pairs          control_panel_only        button_ref "       RemoveButtonHelperTextFromElement        ButtonHelperBar        side        button_ref2        binding        bindButton        registerEventHandler        EmblemEditorUtils          IsEditingLayer        CONDITIONS          IsGamepadEnabled        layerEditButtonHelpers        layerEditMouseHelpers        ACTIONS          AnimateSequence        CanvasHighlightOn        EmblemEditor          colorPickerMode        ColorPickerMode        CLOSED        CanvasHighlightOff        selectingFavoriteColors        favoriteColorsButtonHelpers        COLOR_GRID        colorPickerButtonHelpers        COLOR_MIXER        colorMixerButtonHelpers        MATERIAL_PICKER        materialPickerButtonHelpers        materialPickerMouseHelpers        GetSelectedLayerIndex   ¿       IsLayerEmpty        layerEmptySelectMouseHelpers        layerSelectButtonHelpers        layerSelectMouseHelpers 
       condition        helper_text_func        helper_text        AddButtonHelperTextToElement        button_helper_only         add_control_panel_button_helper        controllerIndex        mouse_control_panel        refreshTimer        Wait   C       onComplete                          ___   L L L  ,                                   ___               SetArrowsEnabled        SetDirectionalInputEnabled                   h       _  ¶  ¶   L	          
         2         2         2           ¶          2  ¶         	 2          2 ¶          2         h5  ¶         ¶      ¶!   #            9#        $ 2 2  %          EmblemEditor          dirty        EmblemEditorUtils          EmblemLayerBeingEdited        LayersGrid 
       ArrowLeft 	       SetAlpha            ArrowRight        EditLabelButton        SetHandleMouse        ACTIONS   
       GainFocus        EmblemPreview 
       LoseFocus        EmblemClipboard        AnimateSequence 	       BorderOn        processEvent        name        button_over 
       BeginEdit        UpdateButtonHelper          UpdateMenuTitle          EmblemEditorMouseControls   ?                  \       _  ¶   L                  2	         2
         2
          ¶          2  ¶                 2 ¶          2         h3 ¶     ¶   !            9!        " 2" 2  #          EmblemEditorUtils          EmblemLayerBeingEdited   ¿       LayersGrid 
       ArrowLeft 	       SetAlpha   ?       ArrowRight        EditLabelButton        SetHandleMouse        ACTIONS   
       LoseFocus        EmblemPreview        EmblemEditor          EndEdit        EmblemClipboard        AnimateSequence 
       BorderOff        processEvent        name 
       button_up        UpdateButtonHelper          UpdateMenuTitle          EmblemEditorMouseControls                        (       ___  ¶   ¶  ¶ 
         2  ¶         ¶                9         2 2            EmblemEditorUtils          EmblemLayerBeingEdited   ¿       ToolPanelOpen        ACTIONS   
       LoseFocus        EmblemPreview        EmblemEditor          EndEdit        UpdateButtonHelper          EmblemEditorMouseControls 	       SetAlpha                        .       __  ¶  ¶         ¶ 	
 ¶          2  ¶         ¶                9         2 2            EmblemEditorUtils          EmblemLayerBeingEdited        EmblemEditor          GetSelectedLayerIndex        ToolPanelOpen         ACTIONS   
       GainFocus        EmblemPreview 
       BeginEdit        UpdateButtonHelper          EmblemEditorMouseControls 	       SetAlpha   ?                              _  ¶         ¶                9               ¶	        2 2 h 9  ¶         ¶                9               ¶	        2 2 H 9  ¶         ¶                9               ¶	        2 2 ( 9 ¶           9               ¶	        2 2  9               ¶	        2 2            EmblemEditor          colorPickerMode        ColorPickerMode        COLOR_GRID 
       MenuTitle        setText        Engine   	       Localize        MP_EMBLEM_EDITOR_COLOR_PICKER            COLOR_MIXER        MP_EMBLEM_EDITOR_COLOR_MIXER        MATERIAL_PICKER !       MP_EMBLEM_EDITOR_MATERIAL_PICKER        EmblemEditorUtils          IsEditingLayer "       MP_EMBLEM_EDITOR_EDIT_LAYER_TITLE        LUA_MENU_TITLE_EMBLEM_EDITOR                    g       _  ¶            1 9                                   9	
                
                      
               * 9
           9	        	        	        	                                                    CONDITIONS          IsGamepadEnabled        removeElement 
       ArrowLeft        ArrowRight        GridItemText        EditLabelButton        addElement        ArrowsWithLabel        LayersGrid 	       AddArrow                    	       ___   ¶   L   ¶   L             WipeGlobalModelsAtPath          WipeControllerModelsAtPath                     5      ___  L  2x  2x ¶               L 2
x         		 
 2 ¶                           ¶ 
      
        L ¶              
        ¶              	 2	x
        ¶              	 2	x 
        ¶              	 2	x$
        ¶              	 2	x(  L 2x h ¶             	 
 2	
x0 ¶             	 
 2	
x4 ¶             	 
 2	
x8 ¶             	 
 2	
x<.
       @ 4 h"C$GJ	  	L	   	N)Q+U$Y.[	0 ¶1 	3X	^	0 ¶1 	5X	h	0 ¶1 	7X	l	0 ¶1 	7X	p:s$w+y	 ¶ 	>      	?      	z	 ¶ 	>      	A      	CE	F ¶G 	I      		    9JCKs	 ¶ 	L      	      
 4 	 N	O  		PQ 2Q 2Q 2$ 20 ¶1 RX0 ¶1 S!X0 ¶1 T#X0 ¶1 U%X		V 	 	N        
     	
®	N        
 	
°	Y 
 	  Z          .selectedEmblem        .layers        layersGridCountDataSource        LUI          DataSourceInControllerModel        new        .layersGridCount 	       SetValue   B       DataSourceFromList        MakeDataSourceAtIndex        selectedEmblem        layersUsed        .layersUsed        layersCount        .layersCount        selectedLayer        .selectedLayer 
       scaleMode        .scaleMode        .layerDetails        layerDetails 	       position 
       .position 	       rotation 
       .rotation        scale        .scale        opacity 	       .opacity        layers        maxVisibleColumns   A       maxVisibleRows   ?       controllerIndex        buildChild        refreshChild        wrapX        wrapY         numRows        numColumns  	       spacingX        _1080p     ðA	       spacingY   A       columnWidth   HC
       rowHeight        scrollingThresholdX   @       scrollingThresholdY        adjustSizeToContent        horizontalAlignment 
       Alignment        Center        verticalAlignment        Middle        springCoefficient   ÈC       maxVelocity  @E       Engine          IsPC   à@  @@       UIGrid        id        LayersGrid        setUseStencil        SetAnchorsAndPosition       @Á  @A  4D  fD       addElement        SetFocusedPosition        GetDefaultFocus        SetDataSource               	   J       ___  L            9 2` h ¶              L	 2 
 2
x ¶              L	 2  2
x ¶              L	 2  2
x ¶              L	 2  2
x             layersGridCountDataSource 	       GetValue            number        LUI          DataSourceInControllerModel        new        .        .number        iconId        .iconId        groupIndex        .groupIndex        color        .color                           ___   ¶          2 h  L
  ,               MenuBuilder          BuildRegisteredType        EmblemLayer        controllerIndex                	          _ `  L	  L  L       B       GetDataSourceAtIndex        SetDataSource                	   0       _  ¶               L          L                9  L                   L	  L  L
      	  L  
          LUI          UIGrid        SetFocusedPosition        LayersGrid        _targetPosition        x        GetDataSourceAtIndex        SetDataSource                           ___  ¶           9 2 h
             EmblemEditor          GetSelectedLayerIndex            x        y                   Ú      _  L                 L    2             2         2         2	
 2 ¶  ¶                 	 2     ¶             1  6 L 2x L 2x ¶ 
      
        2x  2 ¶              ! 2x  2 ¶ "               F$        %      &
 ' ¶( 	  
   2* ¶+ -      	 
. ¶/ 
1          	2  3 2 	
	2  4 2 	
	2  5 2 	
	2  6 2    	
	78         4    	
	9        	:      	;8         4		29        <      =      > 2     	
	9        	<      	?      		@ 2    		9        	A      	?      		@ 2    		9        	<      	?      	 2	    		9        	A      	?      	 2
    		2$        %      > 2     	
	B 2     		C 2   		D 2  		E 2     		F 2    		2$        %      G 2    	
	H 2   		I ¶J 
   * ¶+ L      M      		     
 hN 2O 2P 2Q 2
 4R ¶S    9 ¶ U$      $       &4 h¬ hY±´\·º\½® ¾ $  æÿ8Y 2 * ¶+ `          9* ¶+ aÁb           9c 2 Äb             Èe ¶f   h        i      jk ¶l n ¶o q       r 2s 2t 2  2   2  u ¶v    x ¶y {            9 ¶ |             h~û1             EmblemPreview        Background        SetupEmblem        registerEventHandler        refresh_button_helper 	       SetAlpha   ?	       Emblembg        EmblemClipboard        addEventHandler        edit_emblem_layer        HandleEditLayer          assert          EditLabelButton        button_action        LUI          UIBindButton        new        id        selfBindButton        addElement        bindButton        .selectedEmblem        .favoriteColors        DataSourceInControllerModel        .count            .total        DataSourceFromList        MakeDataSourceAtIndex        FavoriteColorsPanel        ColorsGrid        SetGridDataSource        SelectLayer          EmblemEditor          CreateEmblemEditorDataModel        EmblemEditorUtils          SelectedEmblem        SubscribeToModelThroughElement        selectedEmblem.layersUsed        selectedEmblem.layersCount        selectedEmblem.selectedLayer        selectedEmblem.scaleMode $       SubscribeToDataSourceThroughElement        LayersGrid        EmblemEditorToolPanel        ColorMixerPanel        SetDataSourceThroughElement        ColorPickerGrid        Grid        color        SelectedColor        gain_focus        MaterialPickerPanel        focused_on_layer_color        focused_on_layer_swatch        focused_on_layer_material        color_picker_color_selected "       material_picker_material_selected        valid        grid_modified        SetColorPickerMode          ColorPickerMode        CLOSED 
       shoulderl 
       shoulderr        left        right        ipairs          UIButtonRepeater        buttonName        event        name        gamepad_button        button        down        controller 
       immediate        eventTarget        layerIconChanged         editLayerTimer        Wait        onComplete        UpdateMenuTitle   
       MenuTitle        MenuBreadcrumbs        setText        ToUpperCase          Engine   	       Localize        LUA_MENU_BREADCRUMB_2_ITEMS        MENU_MULTIPLAYER        LUA_MENU_PUBLIC_MATCH_CAPS        UpdateButtonHelper          CONDITIONS          IsMultiplayer 
       UIElement 
       worldBlur    @       setupWorldBlur        blur                         _  L                                   ___  L  h L            processEvent        name        edit_emblem_layer        controller                	   !        h ¶               L 2  2
x  ¶               L 2 	 2
x   
          color        LUI          DataSourceInControllerModel        new        .        .color        valid        .valid                           _   ¶   L L             UpdateLayersUI                             _   ¶   L L             UpdateButtonHelper                     1       _  L        ¶               L       L    9	 2`
 ¶   L L  ¶        L ¶        ¶   L L            LayersGrid        GetFocusPosition        LUI   
       DIRECTION        horizontal        layersGridCountDataSource 	       GetValue            SelectLayer          EmblemEditor          CreateEmblemEditorDataModel        EmblemEditorUtils          SelectedEmblem        UpdateButtonHelper                      K       __   ¶           ¶                : 9   L                         	
 ¶                   9  2  L                  	
 ¶                 9 2  ¶           L L  L L            EmblemEditor          colorPickerMode        ColorPickerMode        COLOR_GRID        EmblemEditorToolPanel        ColorPickerGrid        Grid        GetFocusPosition        LUI   
       DIRECTION        horizontal     	       vertical        SetLayerColorFromSwatch                          ___  L L                                  ___  L L                                  ___  L L   ¶  L               CloseToolPanel                            _  L L   ¶  L               CloseToolPanel                      \       _   ¶             S 9   L                             L     B 9  L            	        L
 ¶    ¶                             L
 L  L L  ¶         ¶                9  L                               EmblemEditor          selectingFavoriteColors        FavoriteColorsPanel        ColorsGrid        GetDataSource        valid 	       GetValue        color        GetColorTableFromIntColor          SetLayerColor        r        g        b        colorPickerMode        ColorPickerMode        COLOR_MIXER        EmblemEditorToolPanel        ColorMixerPanel        SelectedColor        SetRGBFromInt                   ,         ¶         ¶              	       
         L
 L    L L                                       GetColorTableFromIntColor          color        EmblemEditor          SetLayerColor        r        g        b        EmblemEditorToolPanel        ColorMixerPanel        SelectedColor        SetRGBFromInt                          _                ¶           L L    L       
       swatchRow 
       swatchCol        EmblemEditor          SetLayerColorFromSwatch                                      9 ¶         L         ¶        2 2 2  L
              materialID        EmblemEditor          SetLayerMaterial        SetLayerColor   ?                         _  L   L  ¶  L               CloseToolPanel                            _  ¶        2 2 2  L
 ¶  L               EmblemEditor          SetLayerColor   ?       CloseToolPanel                             _   ¶   L L             UpdateButtonHelper                     E       _  ¶          	 9  L              9  L              ¶           9  L            	
 ¶               9  L            	
 ¶                         EmblemEditor          gridVisible        EmblemPreview        Grid        show        hide        useAlternateGridColor        SetRGBFromTable 	       SWATCHES          emblemEditor        gridColorAlt 
       gridColor                   ï       __          9           9   ¶        ¶ 
         ­ 9        	 Î 9        	  9    9 ¶        ¶ 
         º 9        	  9    9 ¶        ¶ 
         ¦ 9        	 	 9    9 ¶   L h L4  9        	  9 L  9        	 / 9   - 9 ¶               2   | 9  L       	 h ¶       B#E   L$	 h&K       4  L      $	 h'K Z 9        (	 U 9   S 9 ¶              ) 2   G 9  L       	 h ¶       B#E   L$	 h*K       4  L      $	 h'K % 9 ¶ +       ¶ ,
      -
         9        	  9        	  9    9. ¶/   L   9  L1	  ,    2   
       qualifier        dpad 	       keyboard        CONDITIONS          IsGamepadEnabled        EmblemEditorUtils          IsEditingLayer        down        button 
       shoulderl        EmblemEditor          DecreaseLayerOpacity        GetSelectedLayerIndex 
       shoulderr        IncreaseLayerOpacity        up        OpenMaterialPicker          controller        select        left        ChangeLayerOrder   ¿       LayersGrid        SetPosition        x        y            processEvent        name        arrow_button_left_moved        lose_focus        right   ?       arrow_button_right_moved        colorPickerMode        ColorPickerMode        CLOSED        HandleCutLayer          dispatchEventToChildren                           ___   L L L  ,                                  ___  ¶              9  L            UpdateButtonHelper          controller                 #   ©      _  ¶               h  h z  9	         
 9
 ¶          9  ¶   ¶    + 2  
4 ¶        2 h  2	  2
 2  2! ¶" $X! ¶" %X! ¶" &X! ¶" 'X( 
: 4 ¶       ) 2	 h	 )	 2
  2 2  2 2! ¶" *X! ¶" +X! ¶" ,!X(	 R 4 ¶       	- 2
 h
 -.
 / 2
  2 2 2  2! ¶" 0X! ¶" 1X! ¶" 2!X! ¶" 3#X(
 Z 4	  ¶ 	4      	      	 5	6
 ¶ 7      8 2 2		9! ¶" tZ		;< ¶= ?      < ¶= @      A       	 	B  ¶ C      D      		 2  2 2  2! ¶" EX! ¶" F!X! ¶" G#X! ¶" H%X		( 	j	 4
 ¶ 
      I 2 h
	 	I
 2  2 2  2! ¶" J!X! ¶" K#X! ¶" L%X! ¶" ''X

( 
	
 4
 ¶ M        $ 9 ¶       N 2 h
 
OP 2 2 2  2 2  2! ¶" Q#X! ¶" R%X! ¶" J'X! ¶" S)X( 
 4 ¶       N 2 h N 2  2 2  2! ¶" Q%X! ¶" R'X! ¶" T)X! ¶" U+X(  4 ¶       V 2 h WPX 2 2 2  2 2  2! ¶" $'X! ¶" %)X! ¶" &+X! ¶" '-X( ® 4 ¶       Y 2 h YY       6Z 2 2[       6Z 2 2\       ]! ¶" ^!X 2\       _! ¶" `!X 2 2  2 2  2! ¶" a)X! ¶" b+X! ¶" c-X! ¶" d/X( ² 4 ¶       e 2 h e 2  2 2  2! ¶" f+X! ¶" g-X! ¶" h/X! ¶" '1X( Ê 4 ¶        i 2 h  i 2  2 2  2! ¶" j-X! ¶" k/X! ¶" h1X! ¶" '3X( Ò  4 h! ¶" m%XØ! ¶" m%XÜ! ¶" m%XÞ! ¶" m%Xà  ¶ q$      $       " $rP! 2 2s!t 2 2u!! ¶" m)X 2v!! ¶" m)X 2w!! ¶" m)X 2x!! ¶" m)X 2! 2  2 2  2! ¶" y1X! ¶" z3X! ¶" {5X! ¶" |7X(  ä $4 h! ¶" m)XØ! ¶" m)XÜ! ¶" m)XÞ! ¶" m)Xà  ¶ q(      (       & (}P% 2 2u%! ¶" m-X 2v%! ¶" m-X 2w%! ¶" m-X 2x%! ¶" m-X 2% 2  2 2  2! ¶" ~5X! ¶" 7X! ¶" 9X! ¶" ;X( $ú (4 ¶ *       2 h *) 2  2 2  2! ¶" 7X! ¶" 9X! ¶" ;X! ¶" =X( ( *4 ¶ ,       2 h ,+ 2  2 2  2! ¶" a9X! ¶" ;X! ¶" =X! ¶" ?X( * ,4 ¶ .       2 h .- 2  2 2  2! ¶" ;X! ¶" =X! ¶" ?X ! ¶"  AX( , .4  ¶ 40      0       06/
 ¶ 74       2 29/! ¶"  [;/< ¶= ?4      < ¶= @6      A6        B/  ¶ C4      4      / 2 2 2  2! ¶" =X! ¶" ?X ! ¶"  AX!! ¶" !'CX( . 04 ¶ 2       2 h 20       63 ¶ Z 2 20       B3  ¶ C6      6      1 2 2 2  2! ¶" y?X ! ¶"  AX!! ¶" !CX"! ¶" "EX( 0.            @        4      . / 2¡ ¶¢       ¤          LUI   
       UIElement        new        id        EmblemEditorMenu        _animationSets        _sequences        controllerIndex        Engine          InFrontend        getRootController        assert          PreLoadFunc   	       soundSet        emblemEditor 
       playSound 
       menu_open        MenuBuilder          BuildRegisteredType 	       Emblembg        SetAnchorsAndPosition       ?       _1080p    @.D  D  (C  /D       addElement        ButtonHelperBar   ðD |D  D       LayerDetails        SetDataSourceThroughElement        layerDetails  @(Ä  ®Ã  C  ¶C       UIText        LayersUsedLabel        setText 	       Localize        MP_EMBLEM_EDITOR_LAYERS_USED        SetFontSize   A       SetFont        FONTS          GetFont        MainMedium        File        SetAlignment 
       Alignment        Left  àD @ÃD  8C  KC       EmblemClipboard   úC¤ )D×£÷C       IsConsoleGame        EmblemEditorControls        EmblemEditorMouseControls 	       SetAlpha   C  )D "DR¸C  ïC       EmblemEditorEmblemPreview        EmblemPreview {®>
       MenuTitle                MenuBreadcrumbs        Icon        SetTop   äÁ
       SetBottom   vB  ÀB  D  XB  C       FavoriteColorsPanel  àD  ¦D  éC       EmblemEditorToolPanel  §D ãD       borderThicknessLeft    @       borderThicknessRight        borderThicknessTop        borderThicknessBottom 	       UIBorder        LayerBorder 	       SetScale ÍÌÌ=       SetBorderThicknessLeft        SetBorderThicknessRight        SetBorderThicknessTop        SetBorderThicknessBottom   WD D à3D àeD       CanvasHighlight  À-D àD  &C /D       ArrowsWithLabel  @2D  D `hD àtD
       ArrowLeft    C  =D  ]D       ArrowRight   ÜD  äD       GridItemText 	       MENU_NEW   ðA       Right    ?  PÄ  òÃ 'D       PopupButton        EditLabelButton        Label        ToUpperCase          Center   WÄ àjD `rD       DefaultAnimationSet        PostLoadFunc                     i       __     L         h h       h    L 2     L        h h       h       L	 2 	    L 
       h h
       h   	    L 2	 
    L       
 h h	   	 h
   	 L
 2   	  L	       	            _sequences        DefaultSequence        RegisterAnimationSequence 	       BorderOn 
       BorderOff        CanvasHighlightOn        CanvasHighlightOff                           ___                         
       ___   L           2 2  ,               LayerBorder 	       SetScale                               ___   L           2 2 ¶               
,     	          LayerBorder 	       SetScale ÍÌÌ=  HC       LUI          EASING        outBack                    
       __   L           2 2  ,               LayerBorder 	       SetAlpha ÍÌÌ>                              __   L   2             AnimateSequence 	       BorderOn                    
          L           2 2  ,               LayerBorder 	       SetScale ÍÌÌ=                       
       __   L           2 2  ,               LayerBorder 	       SetScale       HC                   
       __   L           2 2  ,               LayerBorder 	       SetAlpha ÍÌÌ>                       
       __   L           2 2  ,               LayerBorder 	       SetAlpha       HC                          __   L   2             AnimateSequence 
       BorderOff                    
       ___   L           2 2  ,               CanvasHighlight        SetRGBFromInt ÿÿK                              _   L           ¶              2  ,               CanvasHighlight        SetRGBFromTable 	       SWATCHES          genericButton 
       highlight   ÈB                   
       __   L           2 2  ,               CanvasHighlight 	       SetAlpha                        
       ___   L           2 2  ,               CanvasHighlight 	       SetAlpha   ?  ÈB                          __   L   2             AnimateSequence        CanvasHighlightOn                    
       ___   L           2 2  ,               CanvasHighlight        SetRGBFromInt ÿÿK  ÈB                   
       _   L           2 2  ,               CanvasHighlight 	       SetAlpha       ÈB                          __   L   2             AnimateSequence        CanvasHighlightOff                    