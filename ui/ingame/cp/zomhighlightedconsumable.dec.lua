local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ZomHighlightedConsumable( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 172 * _1080p, 0, 248 * _1080p )
	self.id = "ZomHighlightedConsumable"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local WonderCardBacking = nil
	
	WonderCardBacking = MenuBuilder.BuildRegisteredType( "WonderCardBacking", {
		controllerIndex = f1_local1
	} )
	WonderCardBacking.id = "WonderCardBacking"
	WonderCardBacking:SetScale( 0.44, 0 )
	WonderCardBacking.banner:SetAlpha( 0, 0 )
	WonderCardBacking.devilHead:SetScale( -0.35, 0 )
	WonderCardBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19, _1080p * 153, _1080p * 40, _1080p * 208 )
	WonderCardBacking:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSelectIcon:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.consumableDeckSelectIcon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			WonderCardBacking.devilHead:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( WonderCardBacking )
	self.WonderCardBacking = WonderCardBacking
	
	local wonderCardName1 = nil
	
	wonderCardName1 = LUI.UIText.new()
	wonderCardName1.id = "wonderCardName1"
	wonderCardName1:SetRGBFromInt( 16777215, 0 )
	wonderCardName1:SetFontSize( 20 * _1080p )
	wonderCardName1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	wonderCardName1:SetAlignment( LUI.Alignment.Center )
	wonderCardName1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.88, _1080p * 161.12, _1080p * 30, _1080p * 50 )
	wonderCardName1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSelectName:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.consumableDeckSelectName:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			wonderCardName1:setText( f3_local0, 0 )
		end
	end )
	self:addElement( wonderCardName1 )
	self.wonderCardName1 = wonderCardName1
	
	return self
end

MenuBuilder.registerType( "ZomHighlightedConsumable", ZomHighlightedConsumable )
LockTable( _M )
