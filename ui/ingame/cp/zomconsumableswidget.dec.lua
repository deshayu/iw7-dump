local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ZomConsumablesWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1471 * _1080p, 0, 345 * _1080p )
	self.id = "ZomConsumablesWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ZomConsumablesWidgetCard5 = nil
	
	ZomConsumablesWidgetCard5 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f1_local1
	} )
	ZomConsumablesWidgetCard5.id = "ZomConsumablesWidgetCard5"
	ZomConsumablesWidgetCard5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1228.44, _1080p * 1339.44, 0, _1080p * 160 )
	ZomConsumablesWidgetCard5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ZomConsumablesWidgetCard5.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	ZomConsumablesWidgetCard5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ZomConsumablesWidgetCard5.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	ZomConsumablesWidgetCard5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5FillPercent:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5FillPercent:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			ZomConsumablesWidgetCard5.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( f4_local0 )
		end
	end )
	ZomConsumablesWidgetCard5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Name:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Name:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			ZomConsumablesWidgetCard5.wonderCardName1:setText( f5_local0, 0 )
		end
	end )
	self:addElement( ZomConsumablesWidgetCard5 )
	self.ZomConsumablesWidgetCard5 = ZomConsumablesWidgetCard5
	
	local ZomConsumablesWidgetCard4 = nil
	
	ZomConsumablesWidgetCard4 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f1_local1
	} )
	ZomConsumablesWidgetCard4.id = "ZomConsumablesWidgetCard4"
	ZomConsumablesWidgetCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 918.44, _1080p * 1029.44, 0, _1080p * 160 )
	ZomConsumablesWidgetCard4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			ZomConsumablesWidgetCard4.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	ZomConsumablesWidgetCard4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4Icon:GetModel( f1_local1 ), function ()
		local f7_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4Icon:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			ZomConsumablesWidgetCard4.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	ZomConsumablesWidgetCard4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4FillPercent:GetModel( f1_local1 ), function ()
		local f8_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4FillPercent:GetValue( f1_local1 )
		if f8_local0 ~= nil then
			ZomConsumablesWidgetCard4.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( f8_local0 )
		end
	end )
	ZomConsumablesWidgetCard4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4Name:GetModel( f1_local1 ), function ()
		local f9_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4Name:GetValue( f1_local1 )
		if f9_local0 ~= nil then
			ZomConsumablesWidgetCard4.wonderCardName1:setText( f9_local0, 0 )
		end
	end )
	self:addElement( ZomConsumablesWidgetCard4 )
	self.ZomConsumablesWidgetCard4 = ZomConsumablesWidgetCard4
	
	local ZomConsumablesWidgetCard3 = nil
	
	ZomConsumablesWidgetCard3 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f1_local1
	} )
	ZomConsumablesWidgetCard3.id = "ZomConsumablesWidgetCard3"
	ZomConsumablesWidgetCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 609, _1080p * 716, 0, _1080p * 160 )
	ZomConsumablesWidgetCard3:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot3Alpha:GetModel( f1_local1 ) )
	ZomConsumablesWidgetCard3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetModel( f1_local1 ), function ()
		local f10_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetValue( f1_local1 )
		if f10_local0 ~= nil then
			ZomConsumablesWidgetCard3.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	ZomConsumablesWidgetCard3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3Icon:GetModel( f1_local1 ), function ()
		local f11_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3Icon:GetValue( f1_local1 )
		if f11_local0 ~= nil then
			ZomConsumablesWidgetCard3.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	ZomConsumablesWidgetCard3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3FillPercent:GetModel( f1_local1 ), function ()
		local f12_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3FillPercent:GetValue( f1_local1 )
		if f12_local0 ~= nil then
			ZomConsumablesWidgetCard3.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( f12_local0 )
		end
	end )
	ZomConsumablesWidgetCard3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3Name:GetModel( f1_local1 ), function ()
		local f13_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3Name:GetValue( f1_local1 )
		if f13_local0 ~= nil then
			ZomConsumablesWidgetCard3.wonderCardName1:setText( f13_local0, 0 )
		end
	end )
	self:addElement( ZomConsumablesWidgetCard3 )
	self.ZomConsumablesWidgetCard3 = ZomConsumablesWidgetCard3
	
	local ZomConsumablesWidgetCard2 = nil
	
	ZomConsumablesWidgetCard2 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f1_local1
	} )
	ZomConsumablesWidgetCard2.id = "ZomConsumablesWidgetCard2"
	ZomConsumablesWidgetCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 305, _1080p * 416, 0, _1080p * 160 )
	ZomConsumablesWidgetCard2:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot2Alpha:GetModel( f1_local1 ) )
	ZomConsumablesWidgetCard2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetModel( f1_local1 ), function ()
		local f14_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetValue( f1_local1 )
		if f14_local0 ~= nil then
			ZomConsumablesWidgetCard2.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f14_local0 ), 0 )
		end
	end )
	ZomConsumablesWidgetCard2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2Icon:GetModel( f1_local1 ), function ()
		local f15_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2Icon:GetValue( f1_local1 )
		if f15_local0 ~= nil then
			ZomConsumablesWidgetCard2.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f15_local0 ), 0 )
		end
	end )
	ZomConsumablesWidgetCard2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2FillPercent:GetModel( f1_local1 ), function ()
		local f16_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2FillPercent:GetValue( f1_local1 )
		if f16_local0 ~= nil then
			ZomConsumablesWidgetCard2.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( f16_local0 )
		end
	end )
	ZomConsumablesWidgetCard2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2Name:GetModel( f1_local1 ), function ()
		local f17_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2Name:GetValue( f1_local1 )
		if f17_local0 ~= nil then
			ZomConsumablesWidgetCard2.wonderCardName1:setText( f17_local0, 0 )
		end
	end )
	self:addElement( ZomConsumablesWidgetCard2 )
	self.ZomConsumablesWidgetCard2 = ZomConsumablesWidgetCard2
	
	local ZomConsumablesWidgetCard1 = nil
	
	ZomConsumablesWidgetCard1 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f1_local1
	} )
	ZomConsumablesWidgetCard1.id = "ZomConsumablesWidgetCard1"
	ZomConsumablesWidgetCard1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 111, 0, _1080p * 160 )
	ZomConsumablesWidgetCard1:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot1Alpha:GetModel( f1_local1 ) )
	ZomConsumablesWidgetCard1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetModel( f1_local1 ), function ()
		local f18_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetValue( f1_local1 )
		if f18_local0 ~= nil then
			ZomConsumablesWidgetCard1.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f18_local0 ), 0 )
		end
	end )
	ZomConsumablesWidgetCard1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Icon:GetModel( f1_local1 ), function ()
		local f19_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Icon:GetValue( f1_local1 )
		if f19_local0 ~= nil then
			ZomConsumablesWidgetCard1.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f19_local0 ), 0 )
		end
	end )
	ZomConsumablesWidgetCard1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1FillPercent:GetModel( f1_local1 ), function ()
		local f20_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1FillPercent:GetValue( f1_local1 )
		if f20_local0 ~= nil then
			ZomConsumablesWidgetCard1.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( f20_local0 )
		end
	end )
	ZomConsumablesWidgetCard1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Name:GetModel( f1_local1 ), function ()
		local f21_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Name:GetValue( f1_local1 )
		if f21_local0 ~= nil then
			ZomConsumablesWidgetCard1.wonderCardName1:setText( f21_local0, 0 )
		end
	end )
	self:addElement( ZomConsumablesWidgetCard1 )
	self.ZomConsumablesWidgetCard1 = ZomConsumablesWidgetCard1
	
	self._animationSets.DefaultAnimationSet = function ()
		ZomConsumablesWidgetCard5:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ZomConsumablesWidgetCard5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1228.44, _1080p * 1339.44, 0, _1080p * 160, 0 )
				end
			}
		} )
		ZomConsumablesWidgetCard4:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ZomConsumablesWidgetCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 918.44, _1080p * 1029.44, 0, _1080p * 160, 0 )
				end
			}
		} )
		ZomConsumablesWidgetCard3:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ZomConsumablesWidgetCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 609, _1080p * 716, 0, _1080p * 160, 0 )
				end
			}
		} )
		ZomConsumablesWidgetCard2:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ZomConsumablesWidgetCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 305, _1080p * 416, 0, _1080p * 160, 0 )
				end
			}
		} )
		ZomConsumablesWidgetCard1:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ZomConsumablesWidgetCard1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 111, 0, _1080p * 160, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			ZomConsumablesWidgetCard5:AnimateSequence( "DefaultSequence" )
			ZomConsumablesWidgetCard4:AnimateSequence( "DefaultSequence" )
			ZomConsumablesWidgetCard3:AnimateSequence( "DefaultSequence" )
			ZomConsumablesWidgetCard2:AnimateSequence( "DefaultSequence" )
			ZomConsumablesWidgetCard1:AnimateSequence( "DefaultSequence" )
		end
		
		self._sequences.initial = function ()
			
		end
		
		ZomConsumablesWidgetCard5:RegisterAnimationSequence( "cardSlot4Locked", {
			{
				function ()
					return self.ZomConsumablesWidgetCard5:SetAlpha( 0, 0 )
				end
			}
		} )
		ZomConsumablesWidgetCard4:RegisterAnimationSequence( "cardSlot4Locked", {
			{
				function ()
					return self.ZomConsumablesWidgetCard4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.ZomConsumablesWidgetCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 915.44, _1080p * 1026.44, 0, _1080p * 160, 0 )
				end
			}
		} )
		ZomConsumablesWidgetCard3:RegisterAnimationSequence( "cardSlot4Locked", {
			{
				function ()
					return self.ZomConsumablesWidgetCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 928.5, _1080p * 1035.5, 0, _1080p * 160, 0 )
				end
			}
		} )
		ZomConsumablesWidgetCard2:RegisterAnimationSequence( "cardSlot4Locked", {
			{
				function ()
					return self.ZomConsumablesWidgetCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 624.5, _1080p * 735.5, 0, _1080p * 160, 0 )
				end
			}
		} )
		ZomConsumablesWidgetCard1:RegisterAnimationSequence( "cardSlot4Locked", {
			{
				function ()
					return self.ZomConsumablesWidgetCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 319.5, _1080p * 430.5, 0, _1080p * 160, 0 )
				end
			}
		} )
		self._sequences.cardSlot4Locked = function ()
			ZomConsumablesWidgetCard5:AnimateSequence( "cardSlot4Locked" )
			ZomConsumablesWidgetCard4:AnimateSequence( "cardSlot4Locked" )
			ZomConsumablesWidgetCard3:AnimateSequence( "cardSlot4Locked" )
			ZomConsumablesWidgetCard2:AnimateSequence( "cardSlot4Locked" )
			ZomConsumablesWidgetCard1:AnimateSequence( "cardSlot4Locked" )
		end
		
		ZomConsumablesWidgetCard5:RegisterAnimationSequence( "cardSlot5Locked", {
			{
				function ()
					return self.ZomConsumablesWidgetCard5:SetAlpha( 0, 0 )
				end
			}
		} )
		ZomConsumablesWidgetCard4:RegisterAnimationSequence( "cardSlot5Locked", {
			{
				function ()
					return self.ZomConsumablesWidgetCard4:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ZomConsumablesWidgetCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1075.44, _1080p * 1186.44, 0, _1080p * 160, 0 )
				end
			}
		} )
		ZomConsumablesWidgetCard3:RegisterAnimationSequence( "cardSlot5Locked", {
			{
				function ()
					return self.ZomConsumablesWidgetCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 766, _1080p * 873, 0, _1080p * 160, 0 )
				end
			}
		} )
		ZomConsumablesWidgetCard2:RegisterAnimationSequence( "cardSlot5Locked", {
			{
				function ()
					return self.ZomConsumablesWidgetCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 462, _1080p * 573, 0, _1080p * 160, 0 )
				end
			}
		} )
		ZomConsumablesWidgetCard1:RegisterAnimationSequence( "cardSlot5Locked", {
			{
				function ()
					return self.ZomConsumablesWidgetCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 157, _1080p * 268, 0, _1080p * 160, 0 )
				end
			}
		} )
		self._sequences.cardSlot5Locked = function ()
			ZomConsumablesWidgetCard5:AnimateSequence( "cardSlot5Locked" )
			ZomConsumablesWidgetCard4:AnimateSequence( "cardSlot5Locked" )
			ZomConsumablesWidgetCard3:AnimateSequence( "cardSlot5Locked" )
			ZomConsumablesWidgetCard2:AnimateSequence( "cardSlot5Locked" )
			ZomConsumablesWidgetCard1:AnimateSequence( "cardSlot5Locked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if not CONDITIONS.IsFateCardSlotUnlocked( f1_local1, "fate_card_slot_4" ) and not CONDITIONS.IsFateCardSlotUnlocked( f1_local1, "fate_card_slot_5" ) then
		ACTIONS.AnimateSequence( self, "cardSlot4Locked" )
	end
	if CONDITIONS.IsFateCardSlotUnlocked( f1_local1, "fate_card_slot_4" ) and not CONDITIONS.IsFateCardSlotUnlocked( f1_local1, "fate_card_slot_5" ) then
		ACTIONS.AnimateSequence( self, "cardSlot5Locked" )
	end
	return self
end

MenuBuilder.registerType( "ZomConsumablesWidget", ZomConsumablesWidget )
LockTable( _M )
