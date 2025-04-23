local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Marker1 and f1_arg0.Marker1Fill )
	assert( f1_arg0.Marker2 and f1_arg0.Marker2Fill )
	assert( f1_arg0.Marker3 and f1_arg0.Marker3Fill )
	assert( f1_arg0.Marker4 and f1_arg0.Marker4Fill )
	local f1_local0 = {
		{
			marker = f1_arg0.Marker4,
			fill = f1_arg0.Marker4Fill
		},
		{
			marker = f1_arg0.Marker3,
			fill = f1_arg0.Marker3Fill
		},
		{
			marker = f1_arg0.Marker2,
			fill = f1_arg0.Marker2Fill
		},
		{
			marker = f1_arg0.Marker1,
			fill = f1_arg0.Marker1Fill
		}
	}
	local f1_local1 = DataSources.inGame.MP.scorestreakHuds.bombardmentMapSelectUses
	local f1_local2 = DataSources.inGame.MP.scorestreakHuds.bombardmentMapSelectCount
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local2:GetValue( f1_arg1 )
		local f2_local1 = f1_local1:GetValue( f1_arg1 )
		local f2_local2 = f2_local0 > 3
		if f2_local1 == -1 then
			ACTIONS.AnimateSequence( f1_arg0, "HideMarkers" )
		elseif f2_local1 < f2_local0 then
			local f2_local3
			if f2_local2 then
				f2_local3 = 1
				if not f2_local3 then
				
				else
					f1_local0[f2_local1 + f2_local3].marker:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
					f1_local0[f2_local1 + f2_local3].fill:SetAlpha( 0.4, 0 )
				end
			end
			f2_local3 = 2
		end
	end )
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		local f3_local0 = f1_local2:GetValue( f1_arg1 ) > 3
		ACTIONS.AnimateSequence( f1_arg0, "MarkersDefault" )
		if f3_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "FourMarkerSetup" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "ThreeMarkerSetup" )
		end
	end )
end

function LocationSelectorInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 200 * _1080p )
	self.id = "LocationSelectorInfo"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local CornerNodes = nil
	
	CornerNodes = MenuBuilder.BuildRegisteredType( "GenericFrameCornerNodes", {
		controllerIndex = f4_local1
	} )
	CornerNodes.id = "CornerNodes"
	CornerNodes:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
	CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( CornerNodes )
	self.CornerNodes = CornerNodes
	
	local Marker1Fill = nil
	
	Marker1Fill = LUI.UIImage.new()
	Marker1Fill.id = "Marker1Fill"
	Marker1Fill:SetRGBFromTable( SWATCHES.locationSelection.Warning, 0 )
	Marker1Fill:SetAlpha( 0, 0 )
	Marker1Fill:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -60, _1080p * -24, _1080p * 92, _1080p * 127 )
	self:addElement( Marker1Fill )
	self.Marker1Fill = Marker1Fill
	
	local Marker2Fill = nil
	
	Marker2Fill = LUI.UIImage.new()
	Marker2Fill.id = "Marker2Fill"
	Marker2Fill:SetRGBFromTable( SWATCHES.locationSelection.Warning, 0 )
	Marker2Fill:SetAlpha( 0, 0 )
	Marker2Fill:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -18, _1080p * 18, _1080p * 92, _1080p * 127 )
	self:addElement( Marker2Fill )
	self.Marker2Fill = Marker2Fill
	
	local Marker3Fill = nil
	
	Marker3Fill = LUI.UIImage.new()
	Marker3Fill.id = "Marker3Fill"
	Marker3Fill:SetRGBFromTable( SWATCHES.locationSelection.Warning, 0 )
	Marker3Fill:SetAlpha( 0, 0 )
	Marker3Fill:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 24, _1080p * 60, _1080p * 92, _1080p * 127 )
	self:addElement( Marker3Fill )
	self.Marker3Fill = Marker3Fill
	
	local Marker4Fill = nil
	
	Marker4Fill = LUI.UIImage.new()
	Marker4Fill.id = "Marker4Fill"
	Marker4Fill:SetRGBFromTable( SWATCHES.locationSelection.Warning, 0 )
	Marker4Fill:SetAlpha( 0, 0 )
	Marker4Fill:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 66, _1080p * 102, _1080p * 92, _1080p * 127 )
	self:addElement( Marker4Fill )
	self.Marker4Fill = Marker4Fill
	
	local Marker1 = nil
	
	Marker1 = LUI.UIImage.new()
	Marker1.id = "Marker1"
	Marker1:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
	Marker1:setImage( RegisterMaterial( "hud_location_selector_marked" ), 0 )
	Marker1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -74, _1080p * -10, _1080p * 78, _1080p * 142 )
	self:addElement( Marker1 )
	self.Marker1 = Marker1
	
	local Marker2 = nil
	
	Marker2 = LUI.UIImage.new()
	Marker2.id = "Marker2"
	Marker2:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
	Marker2:setImage( RegisterMaterial( "hud_location_selector_marked" ), 0 )
	Marker2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, _1080p * 78, _1080p * 142 )
	self:addElement( Marker2 )
	self.Marker2 = Marker2
	
	local Marker3 = nil
	
	Marker3 = LUI.UIImage.new()
	Marker3.id = "Marker3"
	Marker3:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
	Marker3:setImage( RegisterMaterial( "hud_location_selector_marked" ), 0 )
	Marker3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 10, _1080p * 74, _1080p * 78, _1080p * 142 )
	self:addElement( Marker3 )
	self.Marker3 = Marker3
	
	local Marker4 = nil
	
	Marker4 = LUI.UIImage.new()
	Marker4.id = "Marker4"
	Marker4:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
	Marker4:SetAlpha( 0, 0 )
	Marker4:setImage( RegisterMaterial( "hud_location_selector_marked" ), 0 )
	Marker4:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 52, _1080p * 116, _1080p * 78, _1080p * 142 )
	self:addElement( Marker4 )
	self.Marker4 = Marker4
	
	local BottomLineWithNodes = nil
	
	BottomLineWithNodes = MenuBuilder.BuildRegisteredType( "AccentLineWithNodes", {
		controllerIndex = f4_local1
	} )
	BottomLineWithNodes.id = "BottomLineWithNodes"
	BottomLineWithNodes:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
	BottomLineWithNodes:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 30, _1080p * -30, _1080p * 150, _1080p * 154 )
	self:addElement( BottomLineWithNodes )
	self.BottomLineWithNodes = BottomLineWithNodes
	
	local TopLineWithNodes = nil
	
	TopLineWithNodes = MenuBuilder.BuildRegisteredType( "AccentLineWithNodes", {
		controllerIndex = f4_local1
	} )
	TopLineWithNodes.id = "TopLineWithNodes"
	TopLineWithNodes:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
	TopLineWithNodes:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 30, _1080p * -30, _1080p * 82, _1080p * 86 )
	self:addElement( TopLineWithNodes )
	self.TopLineWithNodes = TopLineWithNodes
	
	local TimerFrame = nil
	
	TimerFrame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	TimerFrame.id = "TimerFrame"
	TimerFrame:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
	TimerFrame:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 6, _1080p * -6, _1080p * 12, _1080p * 60 )
	self:addElement( TimerFrame )
	self.TimerFrame = TimerFrame
	
	local MarkedAreasText = nil
	
	MarkedAreasText = LUI.UIText.new()
	MarkedAreasText.id = "MarkedAreasText"
	MarkedAreasText:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
	MarkedAreasText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_SCORESTREAK_MAP_MARKED_AREAS" ) ), 0 )
	MarkedAreasText:SetFontSize( 18 * _1080p )
	MarkedAreasText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	MarkedAreasText:SetAlignment( LUI.Alignment.Center )
	MarkedAreasText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 63, _1080p * 81 )
	self:addElement( MarkedAreasText )
	self.MarkedAreasText = MarkedAreasText
	
	local NumText = nil
	
	NumText = LUI.UIText.new()
	NumText.id = "NumText"
	NumText:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
	NumText:SetFontSize( 18 * _1080p )
	NumText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	NumText:SetAlignment( LUI.Alignment.Center )
	NumText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 131, _1080p * 149 )
	NumText:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.bombardmentMapSelectUsesText:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.MP.scorestreakHuds.bombardmentMapSelectUsesText:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			NumText:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( NumText )
	self.NumText = NumText
	
	local CountdownTimer = nil
	
	CountdownTimer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f4_local1
	} )
	CountdownTimer.id = "CountdownTimer"
	CountdownTimer:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
	CountdownTimer:SetFontSize( 38 * _1080p )
	CountdownTimer:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	CountdownTimer:SetAlignment( LUI.Alignment.Center )
	CountdownTimer:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 15, _1080p * -15, _1080p * 17, _1080p * 55 )
	CountdownTimer:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.locationSelectionCountdown:GetModel( f4_local1 ), function ()
		local f6_local0 = DataSources.inGame.MP.scorestreakHuds.locationSelectionCountdown:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			CountdownTimer:setEndTime( f6_local0 )
		end
	end )
	self:addElement( CountdownTimer )
	self.CountdownTimer = CountdownTimer
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BottomLineWithNodes:RegisterAnimationSequence( "MarkersDefault", {
			{
				function ()
					return self.BottomLineWithNodes:SetAlpha( 1, 0 )
				end
			}
		} )
		TopLineWithNodes:RegisterAnimationSequence( "MarkersDefault", {
			{
				function ()
					return self.TopLineWithNodes:SetAlpha( 1, 0 )
				end
			}
		} )
		MarkedAreasText:RegisterAnimationSequence( "MarkersDefault", {
			{
				function ()
					return self.MarkedAreasText:SetAlpha( 1, 0 )
				end
			}
		} )
		NumText:RegisterAnimationSequence( "MarkersDefault", {
			{
				function ()
					return self.NumText:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
				end
			},
			{
				function ()
					return self.NumText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.MarkersDefault = function ()
			BottomLineWithNodes:AnimateSequence( "MarkersDefault" )
			TopLineWithNodes:AnimateSequence( "MarkersDefault" )
			MarkedAreasText:AnimateSequence( "MarkersDefault" )
			NumText:AnimateSequence( "MarkersDefault" )
		end
		
		Marker1Fill:RegisterAnimationSequence( "HideMarkers", {
			{
				function ()
					return self.Marker1Fill:SetAlpha( 0, 0 )
				end
			}
		} )
		Marker2Fill:RegisterAnimationSequence( "HideMarkers", {
			{
				function ()
					return self.Marker2Fill:SetAlpha( 0, 0 )
				end
			}
		} )
		Marker3Fill:RegisterAnimationSequence( "HideMarkers", {
			{
				function ()
					return self.Marker3Fill:SetAlpha( 0, 0 )
				end
			}
		} )
		Marker4Fill:RegisterAnimationSequence( "HideMarkers", {
			{
				function ()
					return self.Marker4Fill:SetAlpha( 0, 0 )
				end
			}
		} )
		Marker1:RegisterAnimationSequence( "HideMarkers", {
			{
				function ()
					return self.Marker1:SetAlpha( 0, 0 )
				end
			}
		} )
		Marker2:RegisterAnimationSequence( "HideMarkers", {
			{
				function ()
					return self.Marker2:SetAlpha( 0, 0 )
				end
			}
		} )
		Marker3:RegisterAnimationSequence( "HideMarkers", {
			{
				function ()
					return self.Marker3:SetAlpha( 0, 0 )
				end
			}
		} )
		Marker4:RegisterAnimationSequence( "HideMarkers", {
			{
				function ()
					return self.Marker4:SetAlpha( 0, 0 )
				end
			}
		} )
		BottomLineWithNodes:RegisterAnimationSequence( "HideMarkers", {
			{
				function ()
					return self.BottomLineWithNodes:SetAlpha( 0, 0 )
				end
			}
		} )
		TopLineWithNodes:RegisterAnimationSequence( "HideMarkers", {
			{
				function ()
					return self.TopLineWithNodes:SetAlpha( 0, 0 )
				end
			}
		} )
		MarkedAreasText:RegisterAnimationSequence( "HideMarkers", {
			{
				function ()
					return self.MarkedAreasText:SetAlpha( 0, 0 )
				end
			}
		} )
		NumText:RegisterAnimationSequence( "HideMarkers", {
			{
				function ()
					return self.NumText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideMarkers = function ()
			Marker1Fill:AnimateSequence( "HideMarkers" )
			Marker2Fill:AnimateSequence( "HideMarkers" )
			Marker3Fill:AnimateSequence( "HideMarkers" )
			Marker4Fill:AnimateSequence( "HideMarkers" )
			Marker1:AnimateSequence( "HideMarkers" )
			Marker2:AnimateSequence( "HideMarkers" )
			Marker3:AnimateSequence( "HideMarkers" )
			Marker4:AnimateSequence( "HideMarkers" )
			BottomLineWithNodes:AnimateSequence( "HideMarkers" )
			TopLineWithNodes:AnimateSequence( "HideMarkers" )
			MarkedAreasText:AnimateSequence( "HideMarkers" )
			NumText:AnimateSequence( "HideMarkers" )
		end
		
		Marker1Fill:RegisterAnimationSequence( "ThreeMarkerSetup", {
			{
				function ()
					return self.Marker1Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Marker1Fill:SetRGBFromTable( SWATCHES.locationSelection.Warning, 0 )
				end
			},
			{
				function ()
					return self.Marker1Fill:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -60, _1080p * -24, _1080p * 92, _1080p * 127, 0 )
				end
			}
		} )
		Marker2Fill:RegisterAnimationSequence( "ThreeMarkerSetup", {
			{
				function ()
					return self.Marker2Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Marker2Fill:SetRGBFromTable( SWATCHES.locationSelection.Warning, 0 )
				end
			},
			{
				function ()
					return self.Marker2Fill:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -18, _1080p * 18, _1080p * 92, _1080p * 127, 0 )
				end
			}
		} )
		Marker3Fill:RegisterAnimationSequence( "ThreeMarkerSetup", {
			{
				function ()
					return self.Marker3Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Marker3Fill:SetRGBFromTable( SWATCHES.locationSelection.Warning, 0 )
				end
			},
			{
				function ()
					return self.Marker3Fill:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 24, _1080p * 60, _1080p * 92, _1080p * 127, 0 )
				end
			}
		} )
		Marker4Fill:RegisterAnimationSequence( "ThreeMarkerSetup", {
			{
				function ()
					return self.Marker4Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Marker4Fill:SetRGBFromTable( SWATCHES.locationSelection.Warning, 0 )
				end
			}
		} )
		Marker1:RegisterAnimationSequence( "ThreeMarkerSetup", {
			{
				function ()
					return self.Marker1:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
				end
			},
			{
				function ()
					return self.Marker1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Marker1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -74, _1080p * -10, _1080p * 78, _1080p * 142, 0 )
				end
			}
		} )
		Marker2:RegisterAnimationSequence( "ThreeMarkerSetup", {
			{
				function ()
					return self.Marker2:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
				end
			},
			{
				function ()
					return self.Marker2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Marker2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, _1080p * 78, _1080p * 142, 0 )
				end
			}
		} )
		Marker3:RegisterAnimationSequence( "ThreeMarkerSetup", {
			{
				function ()
					return self.Marker3:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
				end
			},
			{
				function ()
					return self.Marker3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Marker3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 10, _1080p * 74, _1080p * 78, _1080p * 142, 0 )
				end
			}
		} )
		Marker4:RegisterAnimationSequence( "ThreeMarkerSetup", {
			{
				function ()
					return self.Marker4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Marker4:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
				end
			}
		} )
		self._sequences.ThreeMarkerSetup = function ()
			Marker1Fill:AnimateSequence( "ThreeMarkerSetup" )
			Marker2Fill:AnimateSequence( "ThreeMarkerSetup" )
			Marker3Fill:AnimateSequence( "ThreeMarkerSetup" )
			Marker4Fill:AnimateSequence( "ThreeMarkerSetup" )
			Marker1:AnimateSequence( "ThreeMarkerSetup" )
			Marker2:AnimateSequence( "ThreeMarkerSetup" )
			Marker3:AnimateSequence( "ThreeMarkerSetup" )
			Marker4:AnimateSequence( "ThreeMarkerSetup" )
		end
		
		Marker1Fill:RegisterAnimationSequence( "FourMarkerSetup", {
			{
				function ()
					return self.Marker1Fill:SetRGBFromTable( SWATCHES.locationSelection.Warning, 0 )
				end
			},
			{
				function ()
					return self.Marker1Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Marker1Fill:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -81, _1080p * -45, _1080p * 92, _1080p * 127, 0 )
				end
			}
		} )
		Marker2Fill:RegisterAnimationSequence( "FourMarkerSetup", {
			{
				function ()
					return self.Marker2Fill:SetRGBFromTable( SWATCHES.locationSelection.Warning, 0 )
				end
			},
			{
				function ()
					return self.Marker2Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Marker2Fill:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -39, _1080p * -3, _1080p * 92, _1080p * 127, 0 )
				end
			}
		} )
		Marker3Fill:RegisterAnimationSequence( "FourMarkerSetup", {
			{
				function ()
					return self.Marker3Fill:SetRGBFromTable( SWATCHES.locationSelection.Warning, 0 )
				end
			},
			{
				function ()
					return self.Marker3Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Marker3Fill:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 3, _1080p * 39, _1080p * 92, _1080p * 127, 0 )
				end
			}
		} )
		Marker4Fill:RegisterAnimationSequence( "FourMarkerSetup", {
			{
				function ()
					return self.Marker4Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Marker4Fill:SetRGBFromTable( SWATCHES.locationSelection.Warning, 0 )
				end
			},
			{
				function ()
					return self.Marker4Fill:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 45, _1080p * 81, _1080p * 92, _1080p * 127, 0 )
				end
			}
		} )
		Marker1:RegisterAnimationSequence( "FourMarkerSetup", {
			{
				function ()
					return self.Marker1:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
				end
			},
			{
				function ()
					return self.Marker1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Marker1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -95, _1080p * -31, _1080p * 78, _1080p * 142, 0 )
				end
			}
		} )
		Marker2:RegisterAnimationSequence( "FourMarkerSetup", {
			{
				function ()
					return self.Marker2:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
				end
			},
			{
				function ()
					return self.Marker2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Marker2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -53, _1080p * 11, _1080p * 78, _1080p * 142, 0 )
				end
			}
		} )
		Marker3:RegisterAnimationSequence( "FourMarkerSetup", {
			{
				function ()
					return self.Marker3:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
				end
			},
			{
				function ()
					return self.Marker3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Marker3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -11, _1080p * 53, _1080p * 78, _1080p * 142, 0 )
				end
			}
		} )
		Marker4:RegisterAnimationSequence( "FourMarkerSetup", {
			{
				function ()
					return self.Marker4:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Marker4:SetRGBFromTable( SWATCHES.locationSelection.Normal, 0 )
				end
			},
			{
				function ()
					return self.Marker4:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 31, _1080p * 95, _1080p * 78, _1080p * 142, 0 )
				end
			}
		} )
		self._sequences.FourMarkerSetup = function ()
			Marker1Fill:AnimateSequence( "FourMarkerSetup" )
			Marker2Fill:AnimateSequence( "FourMarkerSetup" )
			Marker3Fill:AnimateSequence( "FourMarkerSetup" )
			Marker4Fill:AnimateSequence( "FourMarkerSetup" )
			Marker1:AnimateSequence( "FourMarkerSetup" )
			Marker2:AnimateSequence( "FourMarkerSetup" )
			Marker3:AnimateSequence( "FourMarkerSetup" )
			Marker4:AnimateSequence( "FourMarkerSetup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "LocationSelectorInfo", LocationSelectorInfo )
LockTable( _M )
