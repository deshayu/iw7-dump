local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ZomConsumableSmall( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 244 * _1080p, 0, 336 * _1080p )
	self.id = "ZomConsumableSmall"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local cardBacking = nil
	
	cardBacking = LUI.UIImage.new()
	cardBacking.id = "cardBacking"
	cardBacking:SetUseAA( true )
	cardBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -7.5, _1080p * 248.5, _1080p * 2, _1080p * 514 )
	cardBacking:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			cardBacking:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( cardBacking )
	self.cardBacking = cardBacking
	
	local cardImageCopy0 = nil
	
	cardImageCopy0 = LUI.UIImage.new()
	cardImageCopy0.id = "cardImageCopy0"
	cardImageCopy0:SetScale( 0.23, 0 )
	cardImageCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56.5, _1080p * 184.5, _1080p * 96.72, _1080p * 224.72 )
	cardImageCopy0:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			cardImageCopy0:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( cardImageCopy0 )
	self.cardImageCopy0 = cardImageCopy0
	
	local radialAlphaLarge = nil
	
	radialAlphaLarge = MenuBuilder.BuildRegisteredType( "radialAlphaLarge", {
		controllerIndex = f1_local1
	} )
	radialAlphaLarge.id = "radialAlphaLarge"
	radialAlphaLarge:SetScale( 0.32, 0 )
	radialAlphaLarge.circleFill:SetProgress( 0 )
	radialAlphaLarge:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 29, _1080p * 212, _1080p * 68, _1080p * 251 )
	self:addElement( radialAlphaLarge )
	self.radialAlphaLarge = radialAlphaLarge
	
	return self
end

MenuBuilder.registerType( "ZomConsumableSmall", ZomConsumableSmall )
LockTable( _M )
