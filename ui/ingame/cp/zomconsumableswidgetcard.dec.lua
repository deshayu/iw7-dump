local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ZomConsumablesWidgetCard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 242 * _1080p, 0, 342 * _1080p )
	self.id = "ZomConsumablesWidgetCard"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ZomConsumableSmall = nil
	
	ZomConsumableSmall = MenuBuilder.BuildRegisteredType( "ZomConsumableSmall", {
		controllerIndex = f1_local1
	} )
	ZomConsumableSmall.id = "ZomConsumableSmall"
	ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( 0 )
	ZomConsumableSmall:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -3.12, _1080p * -104.12, _1080p * 4.08, _1080p * 138.08 )
	ZomConsumableSmall:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	ZomConsumableSmall:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( ZomConsumableSmall )
	self.ZomConsumableSmall = ZomConsumableSmall
	
	local wonderCardName1 = nil
	
	wonderCardName1 = LUI.UIText.new()
	wonderCardName1.id = "wonderCardName1"
	wonderCardName1:SetRGBFromInt( 16776958, 0 )
	wonderCardName1:SetAlpha( 0, 0 )
	wonderCardName1:SetFontSize( 26 * _1080p )
	wonderCardName1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	wonderCardName1:SetAlignment( LUI.Alignment.Center )
	wonderCardName1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9, _1080p * 229.5, _1080p * 11.08, _1080p * 37.08 )
	wonderCardName1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Name:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Name:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			wonderCardName1:setText( f4_local0, 0 )
		end
	end )
	self:addElement( wonderCardName1 )
	self.wonderCardName1 = wonderCardName1
	
	return self
end

MenuBuilder.registerType( "ZomConsumablesWidgetCard", ZomConsumablesWidgetCard )
LockTable( _M )
