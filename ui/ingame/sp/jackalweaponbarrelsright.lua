LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT                   _   ¶   ¶             6    6 	 ¶
          2 ¶    ¶  ¶              module          package          seeall        PostLoadFunc        JackalWeaponBarrelsRight        MenuBuilder          registerType   
       LockTable          _M                     j              ¶                      
      ¶ 
      
      
      
 	 
 
      ¶             	      
 
  
    	  ¶ 	      	      	
      
   


      ¶                      
            DataSources          inGame        jackal        weaponSecondary        SubscribeToModel 	       GetModel        barrelWarnPrimaryR        barrelOverheatPrimaryR        barrelWarnSecondaryR        barrelOverheatSecondaryR                   	       ___         L h            name        datasource_event                  X       ___           9  ¶  ¶                   	  L
  9 ¶                   	  L   9 ¶        L 2 ¶                   	  L
  9 ¶                   	  L   9 ¶        L 2            controller          DataSources          inGame        jackal        weaponSecondary 	       GetValue         ACTIONS          AnimateSequence        primaryToSecondary         secondaryToPrimary                    	       __         L h            name        datasource_event                  ^       ___           9  ¶  ¶                   	  L
  9 ¶                   	  L  
 9 ¶        L h!%) ¶                   	  L
  9 ¶                   	  L  
 9 ¶        L h!%)            controller          DataSources          inGame        jackal        barrelWarnPrimaryR 	       GetValue          ACTIONS          AnimateSequenceByElement        elementName        PrimaryTempBar        sequenceName        cool        elementPath        warning                    	       ___         L h            name        datasource_event                  ~       ___           9  ¶  ¶                   	  L
  9 ¶                   	  L  
 9 ¶        L h!%) ¶                   	  L
 : 9 ¶                   	  L  * 9 ¶                   	  L
  9 ¶                   	  L  
 9 ¶        L h!%)            controller          DataSources          inGame        jackal        barrelOverheatPrimaryR 	       GetValue         ACTIONS          AnimateSequenceByElement        elementName        PrimaryTempBar        sequenceName 	       overheat        elementPath         barrelWarnPrimaryR        warning                    	       ___         L h            name        datasource_event                  ^       ___           9  ¶  ¶                   	  L
  9 ¶                   	  L  
 9 ¶        L h!%) ¶                   	  L
  9 ¶                   	  L  
 9 ¶        L h!%)            controller          DataSources          inGame        jackal        barrelWarnSecondaryR 	       GetValue          ACTIONS          AnimateSequenceByElement        elementName        SecondaryTempBar        sequenceName        cool        elementPath        warning                    	       ___         L h            name        datasource_event                  ~       ___           9  ¶  ¶                   	  L
  9 ¶                   	  L  
 9 ¶        L h!%) ¶                   	  L
 : 9 ¶                   	  L  * 9 ¶                   	  L
  9 ¶                   	  L  
 9 ¶        L h!%)            controller          DataSources          inGame        jackal        barrelOverheatSecondaryR 	       GetValue         ACTIONS          AnimateSequenceByElement        elementName        SecondaryTempBar        sequenceName 	       overheat        elementPath         barrelWarnSecondaryR        warning                    "      _  ¶              2 2 2 2	 2
 ¶	 

Z 2 ¶	 Z  h  h  z  9         
 9 ¶          9  ¶    
4 ¶        2 h"  ! 2	 2"
       # 2	 2
$ 2$ 2 2"
       % ¶	 &X	 2'
       (  ¶ )      *       2	 2
 2 2 ¶	 +X 2 2 ¶	 ,X    - ¶. 0      1      2      3
4 
    	- ¶. 	0      	1      	5      
34  

6 

>
 4 ¶        2 h"
 
789 2 2 : 2 2"       # 2 2$ 2$ 2 2"       % ¶	 &X 2'       (  ¶ )      *       2 2 2 2 ¶	 +#X 2 ¶	 ;'X 2  
 - ¶. 0      1      <      34    
 - ¶. 0      1      =      34  6 
n   
        |       >       ? ¶@       B          LUI   
       UIElement        new        SetAnchorsAndPosition       ?       _1080p     ¯C  B       id        JackalWeaponBarrelsRight        _animationSets        _sequences        controllerIndex        Engine          InFrontend        getRootController        assert          MenuBuilder          BuildRegisteredType        JackalBarrelTempBar        PrimaryTempBar 	       SetDepth    Á       Fill        SetAnchors    ?	       SetRight    À       WeaponName        SetAlignment 
       Alignment        Right   ¯Ã   A       DataSources          inGame        jackal        barrelTempPrimaryR        SubscribeToModel 	       GetModel        equippedPrimary        addElement        SecondaryTempBar 	       SetAlpha   >   A   Á       barrelTempSecondaryR        equippedSecondary        DefaultAnimationSet        PostLoadFunc                     $          ¶                            L   9 L      	
 ¶  ¶  ¶    2 2X 2            DataSources          inGame        jackal        barrelTempPrimaryR 	       GetValue         Fill        SetLeft        _1080p   	       Subtract   	       Multiply     ªÃ   @                              _   ¶                            L  
 9 L      	
 ¶    2            DataSources          inGame        jackal        equippedPrimary 	       GetValue         WeaponName        setText        LocalizeString                          $          ¶                            L   9 L      	
 ¶  ¶  ¶    2 2X 2            DataSources          inGame        jackal        barrelTempSecondaryR 	       GetValue         Fill        SetLeft        _1080p   	       Subtract   	       Multiply     ªÃ   @                              ___   ¶                            L  
 9 L      	
 ¶    2            DataSources          inGame        jackal        equippedSecondary 	       GetValue         WeaponName        setText        LocalizeString                          «       __     L         h h             h             h	   
          L 2  h h             h             h         	    L 2      L        h h         	    h      	    
!    h"   	#   
$   %    L 2  h h&   '   	(   
)    h*   	+   
,   -    h	.   
/   0   1    L 2	 
2     L                   _sequences        DefaultSequence        RegisterAnimationSequence        primaryToSecondary        secondaryToPrimary     3                      ___                         
       ___   L           2 2  ,               PrimaryTempBar 	       SetDepth    Á                       
       ___   L           2 2  ,               PrimaryTempBar 	       SetDepth       C                   
       ___   L           2 2  ,               PrimaryTempBar 	       SetDepth       ÈB                   
       ___   L           2 2  ,               PrimaryTempBar 	       SetDepth    A  C                   
       ___   L           2 2  ,               PrimaryTempBar 	       SetAlpha   ?                       
       ___   L           2 2  ,               PrimaryTempBar 	       SetAlpha   >  C                   
       ___   L           2 2  ,               PrimaryTempBar 	       SetAlpha   >  ÈB                   
       ___   L           2 2  ,               PrimaryTempBar 	       SetAlpha   >  C                          ___   L           2 2 2 2 ¶ X 2 2	 ¶ 	X
 2  ,     	          PrimaryTempBar        SetAnchorsAndPosition   ?           _1080p     ¯Ã   A                          __   L           2 2 2 2 ¶ X ¶ X ¶ 	X	 ¶ 	
X
 2  ,               PrimaryTempBar        SetAnchorsAndPosition   ?           _1080p     ÈÃ  HÂ   A   B  C                          ___   L           2 2 2 2 ¶ X ¶ X ¶ 	X	 ¶ 	
X
 2  ,               PrimaryTempBar        SetAnchorsAndPosition   ?           _1080p     ÈÃ  HÂ   A   B  ÆB                          ___   L           2 2 2 2 ¶ X 2 ¶ X	 ¶ 		X

 2  ,               PrimaryTempBar        SetAnchorsAndPosition   ?           _1080p     ¯Ã   B  pB C                   
          L           2 2  ,               SecondaryTempBar 	       SetDepth    A                       
       _   L           2 2  ,               SecondaryTempBar 	       SetDepth       C                   
       _   L           2 2  ,               SecondaryTempBar 	       SetDepth       ÈB                   
       _   L           2 2  ,               SecondaryTempBar 	       SetDepth    Á  C                   
       _   L           2 2  ,               SecondaryTempBar 	       SetAlpha   >                       
       _   L           2 2  ,               SecondaryTempBar 	       SetAlpha   >  C                   
       _   L           2 2  ,               SecondaryTempBar 	       SetAlpha   >  ÈB                   
       _   L           2 2  ,               SecondaryTempBar 	       SetAlpha   ?  C                          _   L           2 2 2 2 ¶ X 2 ¶ X	 2
 2  ,     	          SecondaryTempBar        SetAnchorsAndPosition   ?           _1080p     ¯Ã   Á                             L           2 2 2 2 ¶ X ¶ X ¶ 	X	 ¶ 	
X
 2  ,               SecondaryTempBar        SetAnchorsAndPosition   ?           _1080p     Ã  HB   Â   Á  C                          _   L           2 2 2 2 ¶ X ¶ X ¶ 	X	 ¶ 	
X
 2  ,               SecondaryTempBar        SetAnchorsAndPosition   ?           _1080p     Ã  HB   Â   Á  ÆB                          _   L           2 2 2 2 ¶ X 2 ¶ X	 ¶ 		X

 2  ,               SecondaryTempBar        SetAnchorsAndPosition   ?           _1080p     ¯Ã  pÂ   Â C                   	       __   L   2   L   2             AnimateSequence        primaryToSecondary                    
       __   L           2 2  ,               PrimaryTempBar 	       SetDepth    A                       
       ___   L           2 2  ,               PrimaryTempBar 	       SetDepth       C                   
       ___   L           2 2  ,               PrimaryTempBar 	       SetDepth       ÈB                   
       ___   L           2 2  ,               PrimaryTempBar 	       SetDepth    Á  C                   
       ___   L           2 2  ,               PrimaryTempBar 	       SetAlpha   >                       
       ___   L           2 2  ,               PrimaryTempBar 	       SetAlpha   >  C                   
       ___   L           2 2  ,               PrimaryTempBar 	       SetAlpha   >  ÈB                   
       ___   L           2 2  ,               PrimaryTempBar 	       SetAlpha   ?  C                          ___   L           2 2 2 2 ¶ X 2 ¶ X	 ¶ 		X
 2  ,     
          PrimaryTempBar        SetAnchorsAndPosition   ?           _1080p     ¯Ã   B  pB                          _   L           2 2 2 2 ¶ X ¶ X ¶ 	X	 ¶ 	
X
 2  ,               PrimaryTempBar        SetAnchorsAndPosition   ?           _1080p     ÈÃ  HÂ   A   B  C                          ___   L           2 2 2 2 ¶ X ¶ X ¶ 	X	 ¶ 	
X
 2  ,               PrimaryTempBar        SetAnchorsAndPosition   ?           _1080p     ÈÃ  HÂ   A   B  ÆB                          ___   L           2 2 2 2 ¶ X 2 2	 ¶ 	X
	 2  ,     
          PrimaryTempBar        SetAnchorsAndPosition   ?           _1080p     ¯Ã   A C                   
       _   L           2 2  ,               SecondaryTempBar 	       SetDepth    Á                       
       _   L           2 2  ,               SecondaryTempBar 	       SetDepth       C                   
       _   L           2 2  ,               SecondaryTempBar 	       SetDepth       ÈB                   
       _   L           2 2  ,               SecondaryTempBar 	       SetDepth    A  C                   
       _   L           2 2  ,               SecondaryTempBar 	       SetAlpha   ?                       
       _   L           2 2  ,               SecondaryTempBar 	       SetAlpha   >  C                   
       _   L           2 2  ,               SecondaryTempBar 	       SetAlpha   >  ÈB                   
       _   L           2 2  ,               SecondaryTempBar 	       SetAlpha   >  C                          _   L           2 2 2 2 ¶ X 2 ¶ X	 ¶ 		X
 2  ,     
          SecondaryTempBar        SetAnchorsAndPosition   ?           _1080p     ¯Ã  pÂ   Â                          ___   L           2 2 2 2 ¶ X ¶ X ¶ 	X	 ¶ 	
X
 2  ,               SecondaryTempBar        SetAnchorsAndPosition   ?           _1080p     Ã  HB   Â   Á  C                          _   L           2 2 2 2 ¶ X ¶ X ¶ 	X	 ¶ 	
X
 2  ,               SecondaryTempBar        SetAnchorsAndPosition   ?           _1080p     Ã  HB   Â   Á  ÆB                          _   L           2 2 2 2 ¶ X 2 ¶ X	 2
	 2  ,     
          SecondaryTempBar        SetAnchorsAndPosition   ?           _1080p     ¯Ã   Á C                   	       ___   L   2   L   2             AnimateSequence        secondaryToPrimary                    