LuaQ            TNIL    	   TBOOLEAN       TLIGHTUSERDATA       TNUMBER       TSTRING       TTABLE    
   TFUNCTION    
   TUSERDATA       TTHREAD 	      TIFUNCTION 
      TCFUNCTION       TUI64       TSTRUCT            �       _   � �  � ��   �   ��    � �  �   �   �  h 
   � �  �   �   � h�
    � �  �   �   �  �    � �  �   �   � �    � �  �   �   � �    � �  �   �   � �     � �  �   �   � � "   � �  �   �   � � $   � �  �   �   � � &   � �  � ��   �   �� (   � �  �   �   � h�
+    � �  �   �   � �    � �  �   �   � � .   � �  �   �   �	 � "   � �  �   �   �
 � 0   � �  �   �   � � 2   � �  �   �   � � 4   � �  �   �   � � 6   � �  �   �   � � 8   � �  �   �   � � :   � �  �   �   � � <            LUI          Fence        Class        fenceTypes        STATE        pass            block   �?       fail    @	       Register        Instantiate        init        Start        Frame        Stop        State        FenceGroup        abort   @@       Reset        Abort        BackOut        Fail        OnPass        OnBlock        OnFail        Passes                   &       ___  � � � �    �   �   9    � � �	 ��   �   ��   �   �    �   � l �	 ��   �   ��   �   �              assert          type          UpdateState 	       function        LUI          Fence        fenceTypes                 	            � ��   �   ��   �   �    �   � � �     �   �      	          LUI          Fence        fenceTypes        assert          new                           __ � ��   �   ��   �   ��   �   �              _state        LUI          Fence        STATE        block                           ___                                ___                                ___                                ___  � �     �   �     �   �             assert          _state                    +       _  � � nr   9    h   � �   9	
 � �	�   �   �	�   �   �
     	

 � �
�   �   �     �   � 
  ��8 '            assert              _fences        _state         ipairs          LUI          Fence        Instantiate        table          insert        _activeFenceIndex                           _      �   �     �   �   �   �    9�              _fences        _activeFenceIndex        Stop        _state                         �      ___      �   �  �   9    � �     �   � � �	�   �   �
�   �   ��   �   �    9   � �     �   � � �	�   �   �
�   �   ��   �   �    9   � �     �   �     �   � p  9      �   �     �   �   �   ��     �   � � �	�   �   �
�   �   ��   �   � � �     �   �   9�	 � �	�   �   �	
�   �   �	�   �   � 	  9	 � �		�   �   �	
�   �   ��   �   �  9	     �   � t   9  9  ��8 � �	�   �   �
�   �   ��   �   � � 9 � �     �   � � 9 � �	     �   �	t   9	 	 �	 � �	�   �   �	
�   �   �	�   �   �	  9		�		�		� 	 � �	�   �   �	
�   �   �	�   �   � 	 ) 9	     �   � 	 � 9	     �   �
     �   �	
   �   �		�	     �   �	P 		     �   �
     �   �
 n 
t z 9	     �   �
     �   �	
   �   �		� n 9	 � �	�   �   �	
�   �   �	�   �   � 	 1 9	 � �		�   �   �	
�   �   ��   �   �	     �   � 	p S 9	     �   �
     �   �
 n 
t 
 9	     �   �
     �   �	
   �   �		� 	     �   �
     �   �	
   �   �		� 2 9 / 9	 � �	�   �   �	
�   �   �	�   �   � 	  9	     �   � 	  9	     �   �
     �   �	
   �   �		� 	 � �		�   �   �	
�   �   ��   �   �  9  9	 � �
   2	  7�8 � �     �   �   9       �   � : 9 
     �   � � �	�   �   �
�   �   ��   �   �   9� & 9     �   � � �	�   �   �
�   �   ��   �   �   9�  9     �   � � �	�   �   �
�   �   ��   �   �   9� � !  "          _busy        assert          _state        LUI          FenceGroup        STATE        fail        abort        _activeFenceIndex   �?       _fences        Start        pass        ipairs          State        Fence        UpdateState        Frame        Stop        block         Unexpected fence state        OnPass        OnBlock        BackOut        Fail                     $       ___      �   �     �   �   �   �   
 9      �   �     �   �   �   �� � ��   �   ��   �   �	�   �   �  
            _fences        _activeFenceIndex        Stop        _state        LUI          FenceGroup        STATE        abort                            ___  2     �   � n  2 }     �   �     �   � nT P
   �   �
    �   �  �  9���~       �?       _fences 
       OnBackOut                           __ � 2     �   � n 2 }     �   �     �   � nTP
   �   �
    �   �  �  9���~            OnFail   �?       _fences 	       PostFail                           ___  � � 2            DebugPrint          Fence passes                           ___  � � 2            DebugPrint          Fence blocks                           ___  � � 2            DebugPrint          Fence failed                           ___      �   � � ��   �   ��   �   ��   �   �   9               _state        LUI          FenceGroup        STATE        pass                    