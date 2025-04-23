local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function fateInventory5CardWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 591 * _1080p, 0, 102 * _1080p )
	self.id = "fateInventory5CardWidget"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local FateCard5 = nil
	
	FateCard5 = MenuBuilder.BuildRegisteredType( "ZomConsumableSmall", {
		controllerIndex = f1_local1
	} )
	FateCard5.id = "FateCard5"
	FateCard5:SetScale( -0.5, 0 )
	FateCard5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 418, _1080p * 662, _1080p * -114, _1080p * 222 )
	FateCard5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			FateCard5.cardBacking:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	FateCard5.cardImageCopy0:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot5Alpha:GetModel( f1_local1 ) )
	FateCard5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			FateCard5.cardImageCopy0:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	FateCard5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5FillPercent:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5FillPercent:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			FateCard5.radialAlphaLarge.circleFill:SetProgress( f4_local0 )
		end
	end )
	self:addElement( FateCard5 )
	self.FateCard5 = FateCard5
	
	local FateCard4 = nil
	
	FateCard4 = MenuBuilder.BuildRegisteredType( "ZomConsumableSmall", {
		controllerIndex = f1_local1
	} )
	FateCard4.id = "FateCard4"
	FateCard4:SetScale( -0.5, 0 )
	FateCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 296, _1080p * 540, _1080p * -113, _1080p * 223 )
	FateCard4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4Backing:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4Backing:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			FateCard4.cardBacking:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	FateCard4.cardImageCopy0:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot4Alpha:GetModel( f1_local1 ) )
	FateCard4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4Icon:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4Icon:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			FateCard4.cardImageCopy0:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	FateCard4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4FillPercent:GetModel( f1_local1 ), function ()
		local f7_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4FillPercent:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			FateCard4.radialAlphaLarge.circleFill:SetProgress( f7_local0 )
		end
	end )
	self:addElement( FateCard4 )
	self.FateCard4 = FateCard4
	
	local FateCard3 = nil
	
	FateCard3 = MenuBuilder.BuildRegisteredType( "ZomConsumableSmall", {
		controllerIndex = f1_local1
	} )
	FateCard3.id = "FateCard3"
	FateCard3:SetScale( -0.5, 0 )
	FateCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 174, _1080p * 418, _1080p * -112.53, _1080p * 223.48 )
	FateCard3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3Backing:GetModel( f1_local1 ), function ()
		local f8_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3Backing:GetValue( f1_local1 )
		if f8_local0 ~= nil then
			FateCard3.cardBacking:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	FateCard3.cardImageCopy0:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot3Alpha:GetModel( f1_local1 ) )
	FateCard3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3Icon:GetModel( f1_local1 ), function ()
		local f9_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3Icon:GetValue( f1_local1 )
		if f9_local0 ~= nil then
			FateCard3.cardImageCopy0:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	FateCard3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3FillPercent:GetModel( f1_local1 ), function ()
		local f10_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3FillPercent:GetValue( f1_local1 )
		if f10_local0 ~= nil then
			FateCard3.radialAlphaLarge.circleFill:SetProgress( f10_local0 )
		end
	end )
	self:addElement( FateCard3 )
	self.FateCard3 = FateCard3
	
	local FateCard2 = nil
	
	FateCard2 = MenuBuilder.BuildRegisteredType( "ZomConsumableSmall", {
		controllerIndex = f1_local1
	} )
	FateCard2.id = "FateCard2"
	FateCard2:SetScale( -0.5, 0 )
	FateCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 52, _1080p * 296, _1080p * -112.53, _1080p * 223.48 )
	FateCard2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2Backing:GetModel( f1_local1 ), function ()
		local f11_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2Backing:GetValue( f1_local1 )
		if f11_local0 ~= nil then
			FateCard2.cardBacking:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	FateCard2.cardImageCopy0:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot2Alpha:GetModel( f1_local1 ) )
	FateCard2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2Icon:GetModel( f1_local1 ), function ()
		local f12_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2Icon:GetValue( f1_local1 )
		if f12_local0 ~= nil then
			FateCard2.cardImageCopy0:setImage( RegisterMaterial( f12_local0 ), 0 )
		end
	end )
	FateCard2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2FillPercent:GetModel( f1_local1 ), function ()
		local f13_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2FillPercent:GetValue( f1_local1 )
		if f13_local0 ~= nil then
			FateCard2.radialAlphaLarge.circleFill:SetProgress( f13_local0 )
		end
	end )
	self:addElement( FateCard2 )
	self.FateCard2 = FateCard2
	
	local FateCard1 = nil
	
	FateCard1 = MenuBuilder.BuildRegisteredType( "ZomConsumableSmall", {
		controllerIndex = f1_local1
	} )
	FateCard1.id = "FateCard1"
	FateCard1:SetScale( -0.5, 0 )
	FateCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -70, _1080p * 174, _1080p * -112.53, _1080p * 223.48 )
	FateCard1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Backing:GetModel( f1_local1 ), function ()
		local f14_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Backing:GetValue( f1_local1 )
		if f14_local0 ~= nil then
			FateCard1.cardBacking:setImage( RegisterMaterial( f14_local0 ), 0 )
		end
	end )
	FateCard1.cardImageCopy0:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot1Alpha:GetModel( f1_local1 ) )
	FateCard1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Icon:GetModel( f1_local1 ), function ()
		local f15_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Icon:GetValue( f1_local1 )
		if f15_local0 ~= nil then
			FateCard1.cardImageCopy0:setImage( RegisterMaterial( f15_local0 ), 0 )
		end
	end )
	FateCard1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1FillPercent:GetModel( f1_local1 ), function ()
		local f16_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1FillPercent:GetValue( f1_local1 )
		if f16_local0 ~= nil then
			FateCard1.radialAlphaLarge.circleFill:SetProgress( f16_local0 )
		end
	end )
	self:addElement( FateCard1 )
	self.FateCard1 = FateCard1
	
	return self
end

MenuBuilder.registerType( "fateInventory5CardWidget", fateInventory5CardWidget )
LockTable( _M )
