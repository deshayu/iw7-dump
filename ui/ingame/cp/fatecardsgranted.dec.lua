local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FateCardsGranted( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "FateCardsGranted"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Card5 = nil
	
	Card5 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f1_local1
	} )
	Card5.id = "Card5"
	Card5:SetScale( -0.5, 0 )
	Card5.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( 0 )
	Card5:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171 )
	Card5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Card5.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	Card5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Card5.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	Card5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Name:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Name:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			Card5.wonderCardName1:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Card5 )
	self.Card5 = Card5
	
	local Card4 = nil
	
	Card4 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f1_local1
	} )
	Card4.id = "Card4"
	Card4:SetScale( -0.5, 0 )
	Card4.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( 0 )
	Card4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171 )
	Card4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4Backing:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4Backing:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			Card4.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	Card4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4Icon:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4Icon:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			Card4.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	Card4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4Name:GetModel( f1_local1 ), function ()
		local f7_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4Name:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			Card4.wonderCardName1:setText( f7_local0, 0 )
		end
	end )
	self:addElement( Card4 )
	self.Card4 = Card4
	
	local Card3 = nil
	
	Card3 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f1_local1
	} )
	Card3.id = "Card3"
	Card3:SetScale( -0.5, 0 )
	Card3.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( 0 )
	Card3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171 )
	Card3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3Backing:GetModel( f1_local1 ), function ()
		local f8_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3Backing:GetValue( f1_local1 )
		if f8_local0 ~= nil then
			Card3.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	Card3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3Icon:GetModel( f1_local1 ), function ()
		local f9_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3Icon:GetValue( f1_local1 )
		if f9_local0 ~= nil then
			Card3.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	Card3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3Name:GetModel( f1_local1 ), function ()
		local f10_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3Name:GetValue( f1_local1 )
		if f10_local0 ~= nil then
			Card3.wonderCardName1:setText( f10_local0, 0 )
		end
	end )
	self:addElement( Card3 )
	self.Card3 = Card3
	
	local Card2 = nil
	
	Card2 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f1_local1
	} )
	Card2.id = "Card2"
	Card2:SetScale( -0.5, 0 )
	Card2.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( 0 )
	Card2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171 )
	Card2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2Backing:GetModel( f1_local1 ), function ()
		local f11_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2Backing:GetValue( f1_local1 )
		if f11_local0 ~= nil then
			Card2.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	Card2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2Icon:GetModel( f1_local1 ), function ()
		local f12_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2Icon:GetValue( f1_local1 )
		if f12_local0 ~= nil then
			Card2.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f12_local0 ), 0 )
		end
	end )
	Card2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2Name:GetModel( f1_local1 ), function ()
		local f13_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2Name:GetValue( f1_local1 )
		if f13_local0 ~= nil then
			Card2.wonderCardName1:setText( f13_local0, 0 )
		end
	end )
	self:addElement( Card2 )
	self.Card2 = Card2
	
	local Card1 = nil
	
	Card1 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f1_local1
	} )
	Card1.id = "Card1"
	Card1:SetScale( -0.5, 0 )
	Card1.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( 0 )
	Card1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171 )
	Card1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Backing:GetModel( f1_local1 ), function ()
		local f14_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Backing:GetValue( f1_local1 )
		if f14_local0 ~= nil then
			Card1.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f14_local0 ), 0 )
		end
	end )
	Card1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Icon:GetModel( f1_local1 ), function ()
		local f15_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Icon:GetValue( f1_local1 )
		if f15_local0 ~= nil then
			Card1.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f15_local0 ), 0 )
		end
	end )
	Card1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Name:GetModel( f1_local1 ), function ()
		local f16_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Name:GetValue( f1_local1 )
		if f16_local0 ~= nil then
			Card1.wonderCardName1:setText( f16_local0, 0 )
		end
	end )
	self:addElement( Card1 )
	self.Card1 = Card1
	
	local DoubleXPNotifications = nil
	
	DoubleXPNotifications = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
		controllerIndex = f1_local1
	} )
	DoubleXPNotifications.id = "DoubleXPNotifications"
	DoubleXPNotifications:SetScale( -0.5, 0 )
	DoubleXPNotifications:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 769, _1080p * 1284, _1080p * 305, _1080p * 433 )
	self:addElement( DoubleXPNotifications )
	self.DoubleXPNotifications = DoubleXPNotifications
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Card5:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Card5:SetAlpha( 0, 0 )
				end
			}
		} )
		Card4:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Card4:SetAlpha( 0, 0 )
				end
			}
		} )
		Card3:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Card3:SetAlpha( 0, 0 )
				end
			}
		} )
		Card2:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Card2:SetAlpha( 0, 0 )
				end
			}
		} )
		Card1:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Card1:SetAlpha( 0, 0 )
				end
			}
		} )
		DoubleXPNotifications:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.DoubleXPNotifications:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			Card5:AnimateSequence( "initial" )
			Card4:AnimateSequence( "initial" )
			Card3:AnimateSequence( "initial" )
			Card2:AnimateSequence( "initial" )
			Card1:AnimateSequence( "initial" )
			DoubleXPNotifications:AnimateSequence( "initial" )
		end
		
		Card5:RegisterAnimationSequence( "cardsGranted", {
			{
				function ()
					return self.Card5:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Card5:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Card5:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Card5:SetAlpha( 1, 40 )
				end,
				function ()
					return self.Card5:SetAlpha( 1, 900 )
				end,
				function ()
					return self.Card5:SetAlpha( 0, 50, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Card5:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Card5:SetZRotation( 0, 200 )
				end,
				function ()
					return self.Card5:SetZRotation( 0, 10 )
				end,
				function ()
					return self.Card5:SetZRotation( 0, 40 )
				end,
				function ()
					return self.Card5:SetZRotation( -20, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Card5:SetZRotation( -20, 450 )
				end,
				function ()
					return self.Card5:SetZRotation( 48, 250 )
				end,
				function ()
					return self.Card5:SetZRotation( 0, 50, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Card5:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 0 )
				end,
				function ()
					return self.Card5:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 200 )
				end,
				function ()
					return self.Card5:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 9 )
				end,
				function ()
					return self.Card5:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 40 )
				end,
				function ()
					return self.Card5:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 118, _1080p * 360, _1080p * -126, _1080p * 216, 199, LUI.EASING.outBack )
				end,
				function ()
					return self.Card5:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 118, _1080p * 360, _1080p * -126, _1080p * 216, 449 )
				end,
				function ()
					return self.Card5:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 743, _1080p * 985, _1080p * 259, _1080p * 601, 300, LUI.EASING.inBack )
				end
			}
		} )
		Card4:RegisterAnimationSequence( "cardsGranted", {
			{
				function ()
					return self.Card4:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Card4:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Card4:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Card4:SetAlpha( 1, 40 )
				end,
				function ()
					return self.Card4:SetAlpha( 1, 750 )
				end,
				function ()
					return self.Card4:SetAlpha( 1, 250 )
				end,
				function ()
					return self.Card4:SetAlpha( 0, 50, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Card4:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Card4:SetZRotation( 0, 200 )
				end,
				function ()
					return self.Card4:SetZRotation( 0, 10 )
				end,
				function ()
					return self.Card4:SetZRotation( 0, 40 )
				end,
				function ()
					return self.Card4:SetZRotation( -10, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Card4:SetZRotation( -10, 550 )
				end,
				function ()
					return self.Card4:SetZRotation( 44, 250 )
				end,
				function ()
					return self.Card4:SetZRotation( 0, 50, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Card4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 0 )
				end,
				function ()
					return self.Card4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 200 )
				end,
				function ()
					return self.Card4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 9 )
				end,
				function ()
					return self.Card4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 40 )
				end,
				function ()
					return self.Card4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 3, _1080p * 245, _1080p * -161, _1080p * 181, 199, LUI.EASING.outBack )
				end,
				function ()
					return self.Card4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 3, _1080p * 245, _1080p * -161, _1080p * 181, 550 )
				end,
				function ()
					return self.Card4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 743, _1080p * 985, _1080p * 259, _1080p * 601, 299, LUI.EASING.inBack )
				end
			}
		} )
		Card3:RegisterAnimationSequence( "cardsGranted", {
			{
				function ()
					return self.Card3:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Card3:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Card3:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Card3:SetAlpha( 1, 40 )
				end,
				function ()
					return self.Card3:SetAlpha( 1, 600 )
				end,
				function ()
					return self.Card3:SetAlpha( 1, 250 )
				end,
				function ()
					return self.Card3:SetAlpha( 0, 50, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Card3:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Card3:SetZRotation( 0, 200 )
				end,
				function ()
					return self.Card3:SetZRotation( 0, 10 )
				end,
				function ()
					return self.Card3:SetZRotation( 0, 40 )
				end,
				function ()
					return self.Card3:SetZRotation( 0, 600 )
				end,
				function ()
					return self.Card3:SetZRotation( 45, 250 )
				end,
				function ()
					return self.Card3:SetZRotation( 0, 50, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Card3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 0 )
				end,
				function ()
					return self.Card3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 200 )
				end,
				function ()
					return self.Card3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 9 )
				end,
				function ()
					return self.Card3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 40 )
				end,
				function ()
					return self.Card3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 600 )
				end,
				function ()
					return self.Card3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 743, _1080p * 985, _1080p * 259, _1080p * 601, 299, LUI.EASING.inBack )
				end
			}
		} )
		Card2:RegisterAnimationSequence( "cardsGranted", {
			{
				function ()
					return self.Card2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Card2:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Card2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Card2:SetAlpha( 1, 40 )
				end,
				function ()
					return self.Card2:SetAlpha( 1, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Card2:SetAlpha( 1, 500 )
				end,
				function ()
					return self.Card2:SetAlpha( 1, 250 )
				end,
				function ()
					return self.Card2:SetAlpha( 0, 50, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Card2:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Card2:SetZRotation( 0, 200 )
				end,
				function ()
					return self.Card2:SetZRotation( 0, 10 )
				end,
				function ()
					return self.Card2:SetZRotation( 0, 40 )
				end,
				function ()
					return self.Card2:SetZRotation( 10, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Card2:SetZRotation( 10, 500 )
				end,
				function ()
					return self.Card2:SetZRotation( 50, 250 )
				end,
				function ()
					return self.Card2:SetZRotation( 0, 50, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Card2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 0 )
				end,
				function ()
					return self.Card2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 200 )
				end,
				function ()
					return self.Card2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 9 )
				end,
				function ()
					return self.Card2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 40 )
				end,
				function ()
					return self.Card2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -245, _1080p * -3, _1080p * -161, _1080p * 181, 199, LUI.EASING.outBack )
				end,
				function ()
					return self.Card2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -245, _1080p * -3, _1080p * -161, _1080p * 181, 500 )
				end,
				function ()
					return self.Card2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 743, _1080p * 985, _1080p * 259, _1080p * 601, 300, LUI.EASING.inBack )
				end
			}
		} )
		Card1:RegisterAnimationSequence( "cardsGranted", {
			{
				function ()
					return self.Card1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Card1:SetAlpha( 1, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Card1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Card1:SetAlpha( 1, 40 )
				end,
				function ()
					return self.Card1:SetAlpha( 1, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Card1:SetAlpha( 1, 350 )
				end,
				function ()
					return self.Card1:SetAlpha( 1, 250 )
				end,
				function ()
					return self.Card1:SetAlpha( 0, 50, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Card1:SetScale( 1, 0 )
				end,
				function ()
					return self.Card1:SetScale( -0.5, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Card1:SetScale( -0.5, 10 )
				end,
				function ()
					return self.Card1:SetScale( -0.5, 40 )
				end,
				function ()
					return self.Card1:SetScale( -0.5, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Card1:SetScale( -0.5, 350 )
				end
			},
			{
				function ()
					return self.Card1:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Card1:SetZRotation( 0, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Card1:SetZRotation( 0, 10 )
				end,
				function ()
					return self.Card1:SetZRotation( 0, 40 )
				end,
				function ()
					return self.Card1:SetZRotation( 20, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Card1:SetZRotation( 20, 350 )
				end,
				function ()
					return self.Card1:SetZRotation( 40, 250 )
				end,
				function ()
					return self.Card1:SetZRotation( 0, 50, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Card1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 0 )
				end,
				function ()
					return self.Card1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Card1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 9 )
				end,
				function ()
					return self.Card1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * 121, _1080p * -171, _1080p * 171, 40 )
				end,
				function ()
					return self.Card1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -360, _1080p * -118, _1080p * -126, _1080p * 216, 199, LUI.EASING.outBack )
				end,
				function ()
					return self.Card1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -360, _1080p * -118, _1080p * -126, _1080p * 216, 350 )
				end,
				function ()
					return self.Card1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 743, _1080p * 985, _1080p * 259, _1080p * 601, 300, LUI.EASING.inBack )
				end
			}
		} )
		DoubleXPNotifications:RegisterAnimationSequence( "cardsGranted", {
			{
				function ()
					return self.DoubleXPNotifications:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DoubleXPNotifications:SetAlpha( 0, 160 )
				end,
				function ()
					return self.DoubleXPNotifications:SetAlpha( 1, 60 )
				end,
				function ()
					return self.DoubleXPNotifications:SetAlpha( 1, 710 )
				end,
				function ()
					return self.DoubleXPNotifications:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.cardsGranted = function ()
			Card5:AnimateSequence( "cardsGranted" )
			Card4:AnimateSequence( "cardsGranted" )
			Card3:AnimateSequence( "cardsGranted" )
			Card2:AnimateSequence( "cardsGranted" )
			Card1:AnimateSequence( "cardsGranted" )
			DoubleXPNotifications:AnimateSequence( "cardsGranted" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dpadUpActivated:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.dpadUpActivated:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.dpadUpActivated:GetValue( f1_local1 ) == 4 and CONDITIONS.IsFateCardSlotUnlocked( f1_local1, "fate_card_slot_5" ) then
			ACTIONS.AnimateSequence( self, "cardsGranted" )
		end
	end )
	ACTIONS.AnimateSequence( self, "initial" )
	return self
end

MenuBuilder.registerType( "FateCardsGranted", FateCardsGranted )
LockTable( _M )
