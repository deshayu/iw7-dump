LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT                   _   Ά   Ά             6    6 	 Ά
          2 Ά    Ά  Ά              module          package          seeall        PostLoadFunc 
       Reticle09        MenuBuilder          registerType   
       LockTable          _M                  
          ___  2 Ά                         			        
     @?       DataSources          inGame        player        currentWeapon        adsPercent        SubscribeToModel 	       GetModel                  /         Ά           L        9 L t 
 9 Ά 	        L
 2  L	  9  L        9 L p 	 9 Ά 	        L 2  L	     
       DataModel          GetModelValue 
       isVisible        ACTIONS          AnimateSequence        ADSIN         ADSOUT                    Α       _  Ά              2 2 2 2	 2
 Ά	 

Z 2 Ά	 Z  h  h z  9         
 9 Ά          9  Ά    
4  Ά               2	 2 Ά 	! 2	 2" 2	" 2
" 2" 2 Ά	 #X Ά	 $X Ά	 %X Ά	 &X' 
4 4  Ά              (	) 2
 2	 Ά 
! 2	
 2*	+ Ά, 	.      	" 2
" 2" 2" 2 Ά	 #X Ά	 $X Ά	 %X Ά	 &!X'	 P            ^       /        	0 Ά1 	3      	4      	5      	6      
78  

9 Ά:    
   <          LUI   
       UIElement        new        SetAnchorsAndPosition       ?       _1080p      C       id 
       Reticle09        _animationSets        _sequences        controllerIndex        Engine          InFrontend        getRootController        assert          UIImage        ImageS 	       SetAlpha ΝΜL>	       setImage        RegisterMaterial          hud_reticle_9    ?  \Β  \B  PΒ  hB       addElement        Image ΝΜΜ>       SetBlendMode        BLEND_MODE          addWithAlpha        DefaultAnimationSet        DataSources          inGame        player        currentWeapon        shotCounter        SubscribeToModel 	       GetModel        PostLoadFunc                     u       _     L         h h       L 2  h h    L 2      L        h h    h    L 2  h h    h    L 2	 
	     L        h h	
   	 h
   	 L
 2  h	 h
      	
 h   
	 L	 2 		   
  L
       
	
            _sequences        DefaultSequence        RegisterAnimationSequence        OnFire        ADSIN        ADSOUT                                                           ___   L           2 2 2 2 Ά X Ά X Ά X	 Ά 		X

 2  ,               ImageS        SetAnchorsAndPosition    ?       _1080p     Β  B  Β  B                       !          L           2 2 2 2 Ά X Ά X Ά X	 Ά 		X

 2 Ά               ,               ImageS        SetAnchorsAndPosition    ?       _1080p     \Β  \B  PΒ  hB  HC       LUI          EASING        outQuadratic                           ___   L           2 2 2 2 Ά X Ά X Ά X	 Ά 		X

 2  ,               Image        SetAnchorsAndPosition    ?       _1080p     \Β  \B  PΒ  hB  HC                   	       _   L   2   L   2             AnimateSequence        OnFire                    
       __   L           2 2  ,               ImageS 	       SetScale 
Χ£<  pB                   
       ___   L           2 2  ,               ImageS 	       SetAlpha ΝΜΜ>  pB                   
       ___   L           2 2  ,               Image 	       SetScale       pB                   
          L           2 2  ,               Image 	       SetAlpha ?  pB                   	          L   2   L   2             AnimateSequence        ADSIN                    
       ___   L           2 2  ,               ImageS 	       SetScale Ύ  pB                   
       ___   L           2 2  ,               ImageS 	       SetAlpha ΝΜL>  pB                   
       ___   L           2 2  ,               Image 	       SetAlpha ΝΜΜ=                       
          L           2 2  ,               Image 	       SetAlpha ΝΜΜ>  pB                   
          L           2 2  ,               Image 	       SetScale Ύ  pB                   	          L   2   L   2             AnimateLoop        ADSOUT                    	       __   Ά           L 2             ACTIONS          AnimateSequence        OnFire                    