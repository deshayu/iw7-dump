local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WonderCards( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 219 * _1080p, 0, 284 * _1080p )
	self.id = "WonderCards"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Fire = nil
	
	Fire = LUI.UIImage.new()
	Fire.id = "Fire"
	Fire:setImage( RegisterMaterial( "zm_wc_fire_loop" ), 0 )
	Fire:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -13.5, _1080p * 204, _1080p * -124, _1080p * 107.16 )
	self:addElement( Fire )
	self.Fire = Fire
	
	local DownContainer = nil
	
	DownContainer = LUI.UIImage.new()
	DownContainer.id = "DownContainer"
	DownContainer:SetZRotation( 90, 0 )
	DownContainer:SetScale( -0.66, 0 )
	DownContainer:setImage( RegisterMaterial( "zm_wc_empty_tab" ), 0 )
	DownContainer:SetUseAA( true )
	DownContainer:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -97.23, _1080p * 48.23, _1080p * 65.9, _1080p * 222.2 )
	self:addElement( DownContainer )
	self.DownContainer = DownContainer
	
	local UpContainer = nil
	
	UpContainer = LUI.UIImage.new()
	UpContainer.id = "UpContainer"
	UpContainer:SetZRotation( -90, 0 )
	UpContainer:SetScale( -0.66, 0 )
	UpContainer:setImage( RegisterMaterial( "zm_wc_empty_tab" ), 0 )
	UpContainer:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -93.9, _1080p * 48.55, _1080p * -184.59, _1080p * -24.84 )
	self:addElement( UpContainer )
	self.UpContainer = UpContainer
	
	local ZomHighlightedConsumable = nil
	
	ZomHighlightedConsumable = MenuBuilder.BuildRegisteredType( "ZomHighlightedConsumable", {
		controllerIndex = f1_local1
	} )
	ZomHighlightedConsumable.id = "ZomHighlightedConsumable"
	ZomHighlightedConsumable:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 136, _1080p * 39.29, _1080p * 228.29 )
	self:addElement( ZomHighlightedConsumable )
	self.ZomHighlightedConsumable = ZomHighlightedConsumable
	
	local WonderCardsSelectionWidget = nil
	
	WonderCardsSelectionWidget = MenuBuilder.BuildRegisteredType( "WonderCardsSelectionWidget", {
		controllerIndex = f1_local1
	} )
	WonderCardsSelectionWidget.id = "WonderCardsSelectionWidget"
	WonderCardsSelectionWidget:SetAlpha( 0, 0 )
	WonderCardsSelectionWidget:SetScale( -0.37, 0 )
	WonderCardsSelectionWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 140, _1080p * 268, _1080p * -199.18, _1080p * 155.24 )
	self:addElement( WonderCardsSelectionWidget )
	self.WonderCardsSelectionWidget = WonderCardsSelectionWidget
	
	local WonderCardDevil = nil
	
	WonderCardDevil = MenuBuilder.BuildRegisteredType( "WonderCardDevil", {
		controllerIndex = f1_local1
	} )
	WonderCardDevil.id = "WonderCardDevil"
	WonderCardDevil:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 172, _1080p * 39, _1080p * 287 )
	self:addElement( WonderCardDevil )
	self.WonderCardDevil = WonderCardDevil
	
	local WonderCardWidgetRadialCopy = nil
	
	WonderCardWidgetRadialCopy = MenuBuilder.BuildRegisteredType( "WonderCardWidget", {
		controllerIndex = f1_local1
	} )
	WonderCardWidgetRadialCopy.id = "WonderCardWidgetRadialCopy"
	WonderCardWidgetRadialCopy:SetAlpha( 0, 0 )
	WonderCardWidgetRadialCopy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 108, _1080p * 95, _1080p * 233 )
	self:addElement( WonderCardWidgetRadialCopy )
	self.WonderCardWidgetRadialCopy = WonderCardWidgetRadialCopy
	
	local WonderCardWidgetRadialWorking = nil
	
	WonderCardWidgetRadialWorking = MenuBuilder.BuildRegisteredType( "WonderCardWidget", {
		controllerIndex = f1_local1
	} )
	WonderCardWidgetRadialWorking.id = "WonderCardWidgetRadialWorking"
	WonderCardWidgetRadialWorking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -6, _1080p * 107, _1080p * 91, _1080p * 233 )
	self:addElement( WonderCardWidgetRadialWorking )
	self.WonderCardWidgetRadialWorking = WonderCardWidgetRadialWorking
	
	local devilJaw = nil
	
	devilJaw = LUI.UIImage.new()
	devilJaw.id = "devilJaw"
	devilJaw:SetScale( 0.1, 0 )
	devilJaw:setImage( RegisterMaterial( "zm_wc_devil_head_bottom" ), 0 )
	devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 22, _1080p * 150, _1080p * 164.29, _1080p * 292.29 )
	self:addElement( devilJaw )
	self.devilJaw = devilJaw
	
	local devilHead = nil
	
	devilHead = LUI.UIImage.new()
	devilHead.id = "devilHead"
	devilHead:SetScale( 0.1, 0 )
	devilHead:setImage( RegisterMaterial( "zm_wc_devil_head_top" ), 0 )
	devilHead:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20.02, _1080p * 148.02, _1080p * 104.68, _1080p * 232.68 )
	self:addElement( devilHead )
	self.devilHead = devilHead
	
	local RemainingCount = nil
	
	RemainingCount = LUI.UIText.new()
	RemainingCount.id = "RemainingCount"
	RemainingCount:SetFontSize( 20 * _1080p )
	RemainingCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RemainingCount:SetAlignment( LUI.Alignment.Left )
	RemainingCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 92.83, _1080p * 118.83, _1080p * 21.95, _1080p * 41.95 )
	RemainingCount:SubscribeToModel( DataSources.inGame.CP.zombies.consumablesRemaining:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.consumablesRemaining:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			RemainingCount:setText( f2_local0, 0 )
		end
	end )
	self:addElement( RemainingCount )
	self.RemainingCount = RemainingCount
	
	local SlotCount = nil
	
	SlotCount = LUI.UIText.new()
	SlotCount.id = "SlotCount"
	SlotCount:SetFontSize( 20 * _1080p )
	SlotCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SlotCount:SetAlignment( LUI.Alignment.Left )
	SlotCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 69, _1080p * 93, _1080p * 21.95, _1080p * 41.95 )
	SlotCount:SubscribeToModel( DataSources.inGame.CP.zombies.consumablesSlotCount:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.consumablesSlotCount:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			SlotCount:setText( f3_local0, 0 )
		end
	end )
	self:addElement( SlotCount )
	self.SlotCount = SlotCount
	
	local SlashMark = nil
	
	SlashMark = LUI.UIText.new()
	SlashMark.id = "SlashMark"
	SlashMark:setText( "/", 0 )
	SlashMark:SetFontSize( 20 * _1080p )
	SlashMark:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SlashMark:SetAlignment( LUI.Alignment.Left )
	SlashMark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 82, _1080p * 103.83, _1080p * 21.95, _1080p * 41.95 )
	self:addElement( SlashMark )
	self.SlashMark = SlashMark
	
	local slotIconArrow = nil
	
	slotIconArrow = LUI.UIImage.new()
	slotIconArrow.id = "slotIconArrow"
	slotIconArrow:SetAlpha( 0, 0 )
	slotIconArrow:SetScale( -0.79, 0 )
	slotIconArrow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 127.28, _1080p * 255.28, _1080p * 107.16, _1080p * 235.16 )
	slotIconArrow:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSelectIcon:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.consumableDeckSelectIcon:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			slotIconArrow:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( slotIconArrow )
	self.slotIconArrow = slotIconArrow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.cardReset = function ()
			
		end
		
		DownContainer:RegisterAnimationSequence( "MeterFullFlip", {
			{
				function ()
					return self.DownContainer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DownContainer:SetAlpha( 0, 210 )
				end,
				function ()
					return self.DownContainer:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.DownContainer:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -90.71, _1080p * 39.75, _1080p * 77.98, _1080p * 206.02, 219 )
				end
			}
		} )
		UpContainer:RegisterAnimationSequence( "MeterFullFlip", {
			{
				function ()
					return self.UpContainer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.UpContainer:SetAlpha( 0, 210 )
				end,
				function ()
					return self.UpContainer:SetAlpha( 1, 10 )
				end
			}
		} )
		ZomHighlightedConsumable:RegisterAnimationSequence( "MeterFullFlip", {
			{
				function ()
					return self.ZomHighlightedConsumable:SetYRotation( 180, 0 )
				end,
				function ()
					return self.ZomHighlightedConsumable:SetYRotation( 360, 220 )
				end
			},
			{
				function ()
					return self.ZomHighlightedConsumable:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ZomHighlightedConsumable:SetAlpha( 0, 110 )
				end,
				function ()
					return self.ZomHighlightedConsumable:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.ZomHighlightedConsumable:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 35, _1080p * 171, _1080p * 39.29, _1080p * 228.29, 0 )
				end,
				function ()
					return self.ZomHighlightedConsumable:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.25, _1080p * 133.75, _1080p * 40.29, _1080p * 229.29, 219 )
				end
			}
		} )
		WonderCardsSelectionWidget:RegisterAnimationSequence( "MeterFullFlip", {
			{
				function ()
					return self.WonderCardsSelectionWidget:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WonderCardsSelectionWidget:SetAlpha( 0, 220 )
				end
			},
			{
				function ()
					return self.WonderCardsSelectionWidget:SetScale( -0.37, 0 )
				end
			},
			{
				function ()
					return self.WonderCardsSelectionWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 137, _1080p * 265, _1080p * -199.18, _1080p * 155.24, 0 )
				end
			}
		} )
		WonderCardDevil:RegisterAnimationSequence( "MeterFullFlip", {
			{
				function ()
					return self.WonderCardDevil:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WonderCardDevil:SetAlpha( 1, 110 )
				end,
				function ()
					return self.WonderCardDevil:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.WonderCardDevil:SetYRotation( 0, 0 )
				end,
				function ()
					return self.WonderCardDevil:SetYRotation( 180, 220 )
				end
			},
			{
				function ()
					return self.WonderCardDevil:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1, _1080p * 171, _1080p * 39, _1080p * 287, 0 )
				end
			}
		} )
		WonderCardWidgetRadialCopy:RegisterAnimationSequence( "MeterFullFlip", {
			{
				function ()
					return self.WonderCardWidgetRadialCopy:SetYRotation( 0, 0 )
				end,
				function ()
					return self.WonderCardWidgetRadialCopy:SetYRotation( 180, 220 )
				end
			}
		} )
		WonderCardWidgetRadialWorking:RegisterAnimationSequence( "MeterFullFlip", {
			{
				function ()
					return self.WonderCardWidgetRadialWorking:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WonderCardWidgetRadialWorking:SetAlpha( 0, 110 )
				end
			},
			{
				function ()
					return self.WonderCardWidgetRadialWorking:SetYRotation( 0, 0 )
				end
			}
		} )
		devilJaw:RegisterAnimationSequence( "MeterFullFlip", {
			{
				function ()
					return self.devilJaw:SetYRotation( 0, 0 )
				end,
				function ()
					return self.devilJaw:SetYRotation( 180, 220 )
				end
			},
			{
				function ()
					return self.devilJaw:SetAlpha( 1, 110 )
				end,
				function ()
					return self.devilJaw:SetAlpha( 0, 10 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "MeterFullFlip", {
			{
				function ()
					return self.devilHead:SetYRotation( 0, 0 )
				end,
				function ()
					return self.devilHead:SetYRotation( 180, 220 )
				end
			},
			{
				function ()
					return self.devilHead:SetAlpha( 1, 0 )
				end,
				function ()
					return self.devilHead:SetAlpha( 1, 110 )
				end,
				function ()
					return self.devilHead:SetAlpha( 0, 10 )
				end
			}
		} )
		RemainingCount:RegisterAnimationSequence( "MeterFullFlip", {
			{
				function ()
					return self.RemainingCount:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RemainingCount:SetAlpha( 0, 210 )
				end,
				function ()
					return self.RemainingCount:SetAlpha( 1, 10 )
				end
			}
		} )
		SlotCount:RegisterAnimationSequence( "MeterFullFlip", {
			{
				function ()
					return self.SlotCount:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SlotCount:SetAlpha( 0, 210 )
				end,
				function ()
					return self.SlotCount:SetAlpha( 1, 10 )
				end
			}
		} )
		SlashMark:RegisterAnimationSequence( "MeterFullFlip", {
			{
				function ()
					return self.SlashMark:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SlashMark:SetAlpha( 0, 210 )
				end,
				function ()
					return self.SlashMark:SetAlpha( 1, 10 )
				end
			}
		} )
		slotIconArrow:RegisterAnimationSequence( "MeterFullFlip", {
			{
				function ()
					return self.slotIconArrow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.slotIconArrow:SetAlpha( 0, 210 )
				end,
				function ()
					return self.slotIconArrow:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.MeterFullFlip = function ()
			DownContainer:AnimateSequence( "MeterFullFlip" )
			UpContainer:AnimateSequence( "MeterFullFlip" )
			ZomHighlightedConsumable:AnimateSequence( "MeterFullFlip" )
			WonderCardsSelectionWidget:AnimateSequence( "MeterFullFlip" )
			WonderCardDevil:AnimateSequence( "MeterFullFlip" )
			WonderCardWidgetRadialCopy:AnimateSequence( "MeterFullFlip" )
			WonderCardWidgetRadialWorking:AnimateSequence( "MeterFullFlip" )
			devilJaw:AnimateSequence( "MeterFullFlip" )
			devilHead:AnimateSequence( "MeterFullFlip" )
			RemainingCount:AnimateSequence( "MeterFullFlip" )
			SlotCount:AnimateSequence( "MeterFullFlip" )
			SlashMark:AnimateSequence( "MeterFullFlip" )
			slotIconArrow:AnimateSequence( "MeterFullFlip" )
		end
		
		DownContainer:RegisterAnimationSequence( "CardActivatedFlip", {
			{
				function ()
					return self.DownContainer:SetAlpha( 0, 0 )
				end
			}
		} )
		UpContainer:RegisterAnimationSequence( "CardActivatedFlip", {
			{
				function ()
					return self.UpContainer:SetAlpha( 0, 0 )
				end
			}
		} )
		ZomHighlightedConsumable:RegisterAnimationSequence( "CardActivatedFlip", {
			{
				function ()
					return self.ZomHighlightedConsumable:SetYRotation( 0, 0 )
				end,
				function ()
					return self.ZomHighlightedConsumable:SetYRotation( 180, 220 )
				end
			},
			{
				function ()
					return self.ZomHighlightedConsumable:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ZomHighlightedConsumable:SetAlpha( 1, 110 )
				end,
				function ()
					return self.ZomHighlightedConsumable:SetAlpha( 0, 10 )
				end
			}
		} )
		WonderCardsSelectionWidget:RegisterAnimationSequence( "CardActivatedFlip", {
			{
				function ()
					return self.WonderCardsSelectionWidget:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WonderCardsSelectionWidget:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.WonderCardsSelectionWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 138, _1080p * 266, _1080p * -199.18, _1080p * 155.24, 0 )
				end
			}
		} )
		WonderCardDevil:RegisterAnimationSequence( "CardActivatedFlip", {
			{
				function ()
					return self.WonderCardDevil:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WonderCardDevil:SetAlpha( 0, 110 )
				end,
				function ()
					return self.WonderCardDevil:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.WonderCardDevil:SetYRotation( -180, 0 )
				end,
				function ()
					return self.WonderCardDevil:SetYRotation( 0, 220 )
				end
			}
		} )
		WonderCardWidgetRadialCopy:RegisterAnimationSequence( "CardActivatedFlip", {
			{
				function ()
					return self.WonderCardWidgetRadialCopy:SetYRotation( -180, 0 )
				end,
				function ()
					return self.WonderCardWidgetRadialCopy:SetYRotation( 0, 220 )
				end
			},
			{
				function ()
					return self.WonderCardWidgetRadialCopy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 105, _1080p * 91, _1080p * 233, 0 )
				end
			}
		} )
		WonderCardWidgetRadialWorking:RegisterAnimationSequence( "CardActivatedFlip", {
			{
				function ()
					return self.WonderCardWidgetRadialWorking:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WonderCardWidgetRadialWorking:SetAlpha( 0, 220 )
				end,
				function ()
					return self.WonderCardWidgetRadialWorking:SetAlpha( 1, 40 )
				end
			},
			{
				function ()
					return self.WonderCardWidgetRadialWorking:SetYRotation( 0, 220 )
				end
			}
		} )
		devilJaw:RegisterAnimationSequence( "CardActivatedFlip", {
			{
				function ()
					return self.devilJaw:SetYRotation( -180, 0 )
				end,
				function ()
					return self.devilJaw:SetYRotation( 0, 220 )
				end
			},
			{
				function ()
					return self.devilJaw:SetAlpha( 0, 0 )
				end,
				function ()
					return self.devilJaw:SetAlpha( 0, 110 )
				end,
				function ()
					return self.devilJaw:SetAlpha( 1, 10 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "CardActivatedFlip", {
			{
				function ()
					return self.devilHead:SetAlpha( 0, 0 )
				end,
				function ()
					return self.devilHead:SetAlpha( 0, 110 )
				end,
				function ()
					return self.devilHead:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.devilHead:SetYRotation( -180, 0 )
				end,
				function ()
					return self.devilHead:SetYRotation( 0, 220 )
				end
			}
		} )
		RemainingCount:RegisterAnimationSequence( "CardActivatedFlip", {
			{
				function ()
					return self.RemainingCount:SetAlpha( 0, 0 )
				end
			}
		} )
		SlotCount:RegisterAnimationSequence( "CardActivatedFlip", {
			{
				function ()
					return self.SlotCount:SetAlpha( 0, 0 )
				end
			}
		} )
		SlashMark:RegisterAnimationSequence( "CardActivatedFlip", {
			{
				function ()
					return self.SlashMark:SetAlpha( 0, 0 )
				end
			}
		} )
		slotIconArrow:RegisterAnimationSequence( "CardActivatedFlip", {
			{
				function ()
					return self.slotIconArrow:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.CardActivatedFlip = function ()
			DownContainer:AnimateSequence( "CardActivatedFlip" )
			UpContainer:AnimateSequence( "CardActivatedFlip" )
			ZomHighlightedConsumable:AnimateSequence( "CardActivatedFlip" )
			WonderCardsSelectionWidget:AnimateSequence( "CardActivatedFlip" )
			WonderCardDevil:AnimateSequence( "CardActivatedFlip" )
			WonderCardWidgetRadialCopy:AnimateSequence( "CardActivatedFlip" )
			WonderCardWidgetRadialWorking:AnimateSequence( "CardActivatedFlip" )
			devilJaw:AnimateSequence( "CardActivatedFlip" )
			devilHead:AnimateSequence( "CardActivatedFlip" )
			RemainingCount:AnimateSequence( "CardActivatedFlip" )
			SlotCount:AnimateSequence( "CardActivatedFlip" )
			SlashMark:AnimateSequence( "CardActivatedFlip" )
			slotIconArrow:AnimateSequence( "CardActivatedFlip" )
		end
		
		Fire:RegisterAnimationSequence( "InitialSequence", {
			{
				function ()
					return self.Fire:SetAlpha( 0, 220 )
				end
			}
		} )
		UpContainer:RegisterAnimationSequence( "InitialSequence", {
			{
				function ()
					return self.UpContainer:SetAlpha( 0, 0 )
				end
			}
		} )
		ZomHighlightedConsumable:RegisterAnimationSequence( "InitialSequence", {
			{
				function ()
					return self.ZomHighlightedConsumable:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardsSelectionWidget:RegisterAnimationSequence( "InitialSequence", {
			{
				function ()
					return self.WonderCardsSelectionWidget:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardDevil:RegisterAnimationSequence( "InitialSequence", {
			{
				function ()
					return self.WonderCardDevil:SetAlpha( 1, 0 )
				end
			}
		} )
		WonderCardWidgetRadialCopy:RegisterAnimationSequence( "InitialSequence", {
			{
				function ()
					return self.WonderCardWidgetRadialCopy:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardWidgetRadialWorking:RegisterAnimationSequence( "InitialSequence", {
			{
				function ()
					return self.WonderCardWidgetRadialWorking:SetAlpha( 1, 0 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "InitialSequence", {
			{
				function ()
					return self.devilHead:SetAlpha( 1, 0 )
				end
			}
		} )
		RemainingCount:RegisterAnimationSequence( "InitialSequence", {
			{
				function ()
					return self.RemainingCount:SetAlpha( 0, 0 )
				end
			}
		} )
		SlotCount:RegisterAnimationSequence( "InitialSequence", {
			{
				function ()
					return self.SlotCount:SetAlpha( 0, 0 )
				end
			}
		} )
		SlashMark:RegisterAnimationSequence( "InitialSequence", {
			{
				function ()
					return self.SlashMark:SetAlpha( 0, 0 )
				end
			}
		} )
		slotIconArrow:RegisterAnimationSequence( "InitialSequence", {
			{
				function ()
					return self.slotIconArrow:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.InitialSequence = function ()
			Fire:AnimateSequence( "InitialSequence" )
			UpContainer:AnimateSequence( "InitialSequence" )
			ZomHighlightedConsumable:AnimateSequence( "InitialSequence" )
			WonderCardsSelectionWidget:AnimateSequence( "InitialSequence" )
			WonderCardDevil:AnimateSequence( "InitialSequence" )
			WonderCardWidgetRadialCopy:AnimateSequence( "InitialSequence" )
			WonderCardWidgetRadialWorking:AnimateSequence( "InitialSequence" )
			devilHead:AnimateSequence( "InitialSequence" )
			RemainingCount:AnimateSequence( "InitialSequence" )
			SlotCount:AnimateSequence( "InitialSequence" )
			SlashMark:AnimateSequence( "InitialSequence" )
			slotIconArrow:AnimateSequence( "InitialSequence" )
		end
		
		Fire:RegisterAnimationSequence( "FireLoopOn", {
			{
				function ()
					return self.Fire:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Fire:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.FireLoopOn = function ()
			Fire:AnimateSequence( "FireLoopOn" )
		end
		
		Fire:RegisterAnimationSequence( "FireLoopOff", {
			{
				function ()
					return self.Fire:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.FireLoopOff = function ()
			Fire:AnimateSequence( "FireLoopOff" )
		end
		
		self._sequences.upArrowPulse = function ()
			
		end
		
		self._sequences.upArrowHide = function ()
			
		end
		
		devilJaw:RegisterAnimationSequence( "Chomp", {
			{
				function ()
					return self.devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 22, _1080p * 150, _1080p * 166, _1080p * 294, 0 )
				end,
				function ()
					return self.devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 22, _1080p * 150, _1080p * 172, _1080p * 300, 90 )
				end,
				function ()
					return self.devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 22, _1080p * 150, _1080p * 166, _1080p * 294, 90 )
				end
			}
		} )
		self._sequences.Chomp = function ()
			devilJaw:AnimateSequence( "Chomp" )
		end
		
		WonderCardWidgetRadialWorking:RegisterAnimationSequence( "NoCardsLeft", {
			{
				function ()
					return self.WonderCardWidgetRadialWorking:SetAlpha( 0, 0 )
				end
			}
		} )
		devilJaw:RegisterAnimationSequence( "NoCardsLeft", {
			{
				function ()
					return self.devilJaw:SetAlpha( 0, 0 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "NoCardsLeft", {
			{
				function ()
					return self.devilHead:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoCardsLeft = function ()
			WonderCardWidgetRadialWorking:AnimateSequence( "NoCardsLeft" )
			devilJaw:AnimateSequence( "NoCardsLeft" )
			devilHead:AnimateSequence( "NoCardsLeft" )
		end
		
		WonderCardWidgetRadialWorking:RegisterAnimationSequence( "GotMoreCards", {
			{
				function ()
					return self.WonderCardWidgetRadialWorking:SetAlpha( 1, 0 )
				end
			}
		} )
		devilJaw:RegisterAnimationSequence( "GotMoreCards", {
			{
				function ()
					return self.devilJaw:SetAlpha( 1, 0 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "GotMoreCards", {
			{
				function ()
					return self.devilHead:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.GotMoreCards = function ()
			WonderCardWidgetRadialWorking:AnimateSequence( "GotMoreCards" )
			devilJaw:AnimateSequence( "GotMoreCards" )
			devilHead:AnimateSequence( "GotMoreCards" )
		end
		
		self._sequences.otherUpArrowPulse = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetValue( f1_local1 ) == -1 then
			ACTIONS.AnimateSequence( self, "cardReset" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSelectReady:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.consumableDeckSelectReady:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.consumableDeckSelectReady:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "CardActivatedFlip" )
			ACTIONS.AnimateSequence( self, "FireLoopOff" )
		end
		if DataSources.inGame.CP.zombies.consumableDeckSelectReady:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.consumableDeckSelectReady:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "MeterFullFlip" )
			ACTIONS.AnimateSequence( self, "FireLoopOn" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.consumablesRemainingAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.consumablesRemainingAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.consumablesRemainingAlphaFilter:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "NoCardsLeft" )
		end
		if DataSources.inGame.CP.zombies.consumablesRemainingAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.consumablesRemainingAlphaFilter:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "GotMoreCards" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dpadUpFillPercent:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "Chomp" )
	end )
	ACTIONS.AnimateSequence( self, "InitialSequence" )
	return self
end

MenuBuilder.registerType( "WonderCards", WonderCards )
LockTable( _M )
