LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT                   _   ¶   ¶         ¶           ¶          h h
 h h" h& h* h. h4 h=8 h !@ h"#D h$%H h&L h'(N h)*+R h,-++X h./++\ h01+` h234d h534j h634l h738n h938r h:(;t h<=4x h>/?| h@A    ¶               ¶              ¶              ¶              ¶              ¶              ¶              ¶              ¶              ¶         	     ¶         
    M          LUI          UIMessageQueue        Class 
       UIElement        MessageType 
       StartInfo        key 	       priority            displayTime   úD       maxWaitTime  @E       LevelUp    A
       Accolades    A       Killstreaks   ðA       ObjectiveUpdate    B       LocalPlayerSplash  »D  ¿       GlobalPlayerSplash   E       PlayerAwards   zD       isStackable        MiscMessages  @D       JackalWarning   4B       JackalFlightMode   úC       JackalAutopilot        JackalBoosterState   HB       JackalMissileWarning   ÈB ;E       JackalLeavingWarning   ÜB       JackalOverheatWarning   ´B       JackalFlaresWarning   ªB       LocalPlayerZombieSplash    B @E       LocalPlayerZombieSplashDLC1        LocalPlayerZombieSplashDLC2        LocalPlayerZombieSplashDLC3  À(E       LocalPlayerZombieSplashDLC4        WaveNumberSplash  @F       TicketMachine   B       PowerupActivated  'D       ChallengeSplash   E       init 
       AddWidget        AddMessage        RemoveMessagesOfType        GetHighestPriorityIndex        ExecuteMessage        ExecuteNextMessage        OnMessageComplete        OnMessageDisplayFinished        RemoveExpiredMessages        IsNextMessageStackable                   6       ___  ¶                        ¶ 	 ¶
  	   9   ¶          h   h  !                   9 2 $ 2                LUI          UIMessageQueue        super        init        assert          type          table        controller        messageQueue 
       widgetMap        currentMessage         nextMessageDelay   úC       registerEventHandler        level_load                          ___   L    L  h             currentMessage         messageQueue                 
   X         ¶  ¶  	   9    ¶          ¶  ¶	                       l                                                  
                 9                 	         	 
            assert          type          table        messageType        LUI          IsItemInArray 
       widgetMap        key        SubscribeToModel        dataSourcesFrom        push 	       GetModel        controller        clear                	   B       _   L                   L           1 9   h ¶   L         9 L          öÿ8 ¶ 
        L              L         L  L          L
      
            dataSourcesFrom        push 	       GetValue        controller        pairs   
       DataModel          SetModelValue 	       GetModel        AddMessage        messageType        dataSourcesTo                    -       ___   L                   L            9  L   L         
  ¶  	         L             
 L                     dataSourcesFrom        clear 	       GetValue        controller        RemoveMessagesOfType        messageType 
       DataModel          SetModelValue 	       GetModel                 
   E         h  ¶ 
             	       
           9
               	        p  9 ¶  2        2x  	  
                 nP            9            messageType        values        dataSourcesTo        insertTime        Engine          GetMilliseconds        maxWaitTime        displayTime        priorityOverride 	       GetValue        controller            DebugPrint   )       Adding new non-expiring message of type         key        . Removing any previous ones.        RemoveMessagesOfType        messageQueue   ?       currentMessage        ExecuteNextMessage                    R                 n 2 2 }               	         	 9	 ¶ 	      
          	éÿ~            9                 9    9              	       r  9
  9    9  9  9    9                     	 h!            messageQueue   ?  ¿       messageType        table          remove        currentMessage        displayTime        OnMessageComplete        OnMessageDisplayFinished        ExecuteNextMessage 
       widgetMap        key        processEvent        name        message_queue_hide                 	   1       ___  ¶          nr   9   2 2 2         n 2 }                         9          9       	       p  9  äÿ~   
          assert          messageQueue       ¿  ?       priorityOverride        messageType 	       priority                    ¢       ___  ¶                         z  9                	 9                 9   
          ; 9	 2
 ¶          9  9 ¶                      	        êÿ8               9 ¶                    	                                          
          9   9                     
       h1        
 9 ¶  2             x        >r  9             B  "          table          remove        messageQueue        currentMessage        messageType        isStackable        dataSourcesTo        push        pairs   
       DataModel          SetModelValue 	       GetModel        controller        values  
       widgetMap        key        processEvent        name        message_queue_show        DebugPrint   2       WARNING: No widget set to handle message of type         displayTime   ¿       Wait        onComplete                             L             	 9   L          L    9   L              currentMessage        OnMessageDisplayFinished                           _          n r  9          n r  9 ¶ r   9               messageQueue            RemoveExpiredMessages        GetHighestPriorityIndex        assert          ExecuteMessage                    	       __             9             currentMessage         ExecuteNextMessage                    ;       __            % 9                                      9   9                                   h    9  9	
                        IsNextMessageStackable        currentMessage 
       widgetMap        messageType        key        processEvent        name        message_queue_hide        OnMessageComplete        Wait        nextMessageDelay        onComplete                          ___   L               OnMessageComplete                 
   -         ¶                n 2 2 }                      r  9       T        t 	 9	 ¶
               	 
àÿ~            Engine          GetMilliseconds        messageQueue   ?  ¿       maxWaitTime        insertTime        table          remove                    6       __             9                         9         n p  9    ¶ r   9                                         9     
          currentMessage        messageType        isStackable        messageQueue   ?       GetHighestPriorityIndex        assert                          