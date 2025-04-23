local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ZomPlayerAbilities( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 108 * _1080p, 0, 45 * _1080p )
	self.id = "ZomPlayerAbilities"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local SecondaryAbilityQuantity = nil
	
	SecondaryAbilityQuantity = LUI.UIText.new()
	SecondaryAbilityQuantity.id = "SecondaryAbilityQuantity"
	SecondaryAbilityQuantity:SetScale( 0, 0 )
	SecondaryAbilityQuantity:SetFontSize( 19 * _1080p )
	SecondaryAbilityQuantity:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	SecondaryAbilityQuantity:SetAlignment( LUI.Alignment.Center )
	SecondaryAbilityQuantity:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -6.3, _1080p * 23.7, _1080p * 15.18, _1080p * 34.18 )
	SecondaryAbilityQuantity:BindColorToModel( DataSources.inGame.player.secondaryPower.color:GetModel( f1_local1 ) )
	SecondaryAbilityQuantity:BindAlphaToModel( DataSources.inGame.player.secondaryPower.numAlpha:GetModel( f1_local1 ) )
	SecondaryAbilityQuantity:SubscribeToModel( DataSources.inGame.player.secondaryPower.numCharges:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.secondaryPower.numCharges:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			SecondaryAbilityQuantity:setText( f2_local0, 0 )
		end
	end )
	self:addElement( SecondaryAbilityQuantity )
	self.SecondaryAbilityQuantity = SecondaryAbilityQuantity
	
	local SecondaryAbility = nil
	
	SecondaryAbility = MenuBuilder.BuildRegisteredType( "ZomPlayerAbilityBase", {
		controllerIndex = f1_local1
	} )
	SecondaryAbility.id = "SecondaryAbility"
	SecondaryAbility:SetScale( -0.75, 0 )
	SecondaryAbility:SetDataSource( DataSources.inGame.player.secondaryPower, f1_local1 )
	SecondaryAbility:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -34.1, _1080p * 95.9, _1080p * -39, _1080p * 86 )
	SecondaryAbility:BindAlphaToModel( DataSources.inGame.player.secondaryPower.iconAlpha:GetModel( f1_local1 ) )
	SecondaryAbility:SubscribeToModel( DataSources.inGame.player.secondaryPower.icon:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.secondaryPower.icon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			SecondaryAbility.AbilityIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( SecondaryAbility )
	self.SecondaryAbility = SecondaryAbility
	
	local PrimaryAbility = nil
	
	PrimaryAbility = MenuBuilder.BuildRegisteredType( "ZomPlayerAbilityBase", {
		controllerIndex = f1_local1
	} )
	PrimaryAbility.id = "PrimaryAbility"
	PrimaryAbility:SetScale( -0.75, 0 )
	PrimaryAbility:SetDataSource( DataSources.inGame.player.primaryPower, f1_local1 )
	PrimaryAbility:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -97.75, _1080p * 32.25, _1080p * -39, _1080p * 86 )
	PrimaryAbility:BindAlphaToModel( DataSources.inGame.player.primaryPower.iconAlpha:GetModel( f1_local1 ) )
	PrimaryAbility:SubscribeToModel( DataSources.inGame.player.primaryPower.icon:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.primaryPower.icon:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			PrimaryAbility.AbilityIcon:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( PrimaryAbility )
	self.PrimaryAbility = PrimaryAbility
	
	local PrimaryAbilityQuantity = nil
	
	PrimaryAbilityQuantity = LUI.UIText.new()
	PrimaryAbilityQuantity.id = "PrimaryAbilityQuantity"
	PrimaryAbilityQuantity:SetScale( 0, 0 )
	PrimaryAbilityQuantity:SetFontSize( 19 * _1080p )
	PrimaryAbilityQuantity:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PrimaryAbilityQuantity:SetAlignment( LUI.Alignment.Center )
	PrimaryAbilityQuantity:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -25.5, _1080p * 4.5, _1080p * 14.46, _1080p * 33.46 )
	PrimaryAbilityQuantity:BindColorToModel( DataSources.inGame.player.primaryPower.color:GetModel( f1_local1 ) )
	PrimaryAbilityQuantity:BindAlphaToModel( DataSources.inGame.player.primaryPower.numAlpha:GetModel( f1_local1 ) )
	PrimaryAbilityQuantity:SubscribeToModel( DataSources.inGame.player.primaryPower.numCharges:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.primaryPower.numCharges:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			PrimaryAbilityQuantity:setText( f5_local0, 0 )
		end
	end )
	self:addElement( PrimaryAbilityQuantity )
	self.PrimaryAbilityQuantity = PrimaryAbilityQuantity
	
	SecondaryAbility:SetDataSource( DataSources.inGame.player.secondaryPower, f1_local1 )
	PrimaryAbility:SetDataSource( DataSources.inGame.player.primaryPower, f1_local1 )
	return self
end

MenuBuilder.registerType( "ZomPlayerAbilities", ZomPlayerAbilities )
LockTable( _M )
