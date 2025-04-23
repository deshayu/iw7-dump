local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Game.GetPlayerClientnum()
	local f1_local1 = DataSources.inGame.CP.players:GetDataSourceAtIndex( f1_local0, f1_arg0 )
	f1_local1 = f1_local1.image
	local f1_local2 = DataSources.inGame.CP.players:GetDataSourceAtIndex( f1_local0, f1_arg0 )
	f1_local2 = f1_local2.bigImage
	assert( f1_local1 )
	f1_arg1:SubscribeToModel( f1_local1:GetModel( f1_arg0 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 then
			f1_arg1:setImage( RegisterMaterial( string.gsub( f2_local0, "team", "main" ) ) )
		end
	end )
end

f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.PlayerIcon )
	f0_local0( f3_arg1, f3_arg0.PlayerIcon, f3_arg0 )
end

function MainPlayerInfoDLC3( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 282 * _1080p, 0, 219 * _1080p )
	self.id = "MainPlayerInfoDLC3"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local box = nil
	
	box = LUI.UIImage.new()
	box.id = "box"
	box:SetAlpha( 0.5, 0 )
	box:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	box:SetUseAA( true )
	box:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 140.5, _1080p * 271, _1080p * 178.63, _1080p * 216 )
	self:addElement( box )
	self.box = box
	
	local elementBox = nil
	
	elementBox = LUI.UIImage.new()
	elementBox.id = "elementBox"
	elementBox:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	elementBox:SetUseAA( true )
	elementBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 131.5, _1080p * 317, _1080p * 151.98, _1080p * 177.33 )
	elementBox:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc3.elementBackingAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( elementBox )
	self.elementBox = elementBox
	
	local elementName = nil
	
	elementName = LUI.UIText.new()
	elementName.id = "elementName"
	elementName:SetFontSize( 22 * _1080p )
	elementName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	elementName:SetAlignment( LUI.Alignment.Left )
	elementName:SetOptOutRightToLeftAlignmentFlip( true )
	elementName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 200.5, _1080p * 457.5, _1080p * 152.94, _1080p * 174.94 )
	elementName:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc3.elementIndexAlphaFilter:GetModel( f4_local1 ) )
	elementName:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.elementIndexNameFilter:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.dlc3.elementIndexNameFilter:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			elementName:setText( f5_local0, 0 )
		end
	end )
	self:addElement( elementName )
	self.elementName = elementName
	
	local elementIcon = nil
	
	elementIcon = LUI.UIImage.new()
	elementIcon.id = "elementIcon"
	elementIcon:SetScale( -0.61, 0 )
	elementIcon:SetUseAA( true )
	elementIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 110.5, _1080p * 238.5, _1080p * 88.98, _1080p * 216.98 )
	elementIcon:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc3.elementIndexAlphaFilter:GetModel( f4_local1 ) )
	elementIcon:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.elementIndexIconFilter:GetModel( f4_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.dlc3.elementIndexIconFilter:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			elementIcon:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( elementIcon )
	self.elementIcon = elementIcon
	
	local PlayerCash = nil
	
	PlayerCash = LUI.UIText.new()
	PlayerCash.id = "PlayerCash"
	PlayerCash:SetFontSize( 38 * _1080p )
	PlayerCash:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PlayerCash:SetAlignment( LUI.Alignment.Left )
	PlayerCash:SetOptOutRightToLeftAlignmentFlip( true )
	PlayerCash:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 167.5, _1080p * 298, _1080p * 179.63, _1080p * 217.63 )
	PlayerCash:SubscribeToModel( DataSources.inGame.CP.currentPlayerCash:GetModel( f4_local1 ), function ()
		local f7_local0 = DataSources.inGame.CP.currentPlayerCash:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			PlayerCash:setText( f7_local0, 0 )
		end
	end )
	self:addElement( PlayerCash )
	self.PlayerCash = PlayerCash
	
	local PlayerIcon = nil
	
	PlayerIcon = LUI.UIImage.new()
	PlayerIcon.id = "PlayerIcon"
	PlayerIcon:SetScale( -0.42, 0 )
	PlayerIcon:setImage( RegisterMaterial( "zm_main_plyr_2_dlc1" ), 0 )
	PlayerIcon:SetUseAA( true )
	PlayerIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -57.59, _1080p * 198.41, _1080p * -75.46, _1080p * 295.54 )
	self:addElement( PlayerIcon )
	self.PlayerIcon = PlayerIcon
	
	local dollarSign = nil
	
	dollarSign = LUI.UIText.new()
	dollarSign.id = "dollarSign"
	dollarSign:setText( "$", 0 )
	dollarSign:SetFontSize( 38 * _1080p )
	dollarSign:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	dollarSign:SetAlignment( LUI.Alignment.Left )
	dollarSign:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 144.5, _1080p * 165.5, _1080p * 179.63, _1080p * 217.63 )
	self:addElement( dollarSign )
	self.dollarSign = dollarSign
	
	local souvenir = nil
	
	souvenir = MenuBuilder.BuildRegisteredType( "souvenir", {
		controllerIndex = f4_local1
	} )
	souvenir.id = "souvenir"
	souvenir:SetScale( -0.2, 0 )
	souvenir:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 191, _1080p * 301, _1080p * 39.96, _1080p * 149.96 )
	self:addElement( souvenir )
	self.souvenir = souvenir
	
	local InventorySlot1 = nil
	
	InventorySlot1 = LUI.UIImage.new()
	InventorySlot1.id = "InventorySlot1"
	InventorySlot1:SetScale( -0.52, 0 )
	InventorySlot1:SetUseAA( true )
	InventorySlot1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 126, _1080p * 254, _1080p * 25.32, _1080p * 153.32 )
	InventorySlot1:BindAlphaToModel( DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Alpha:GetModel( f4_local1 ) )
	InventorySlot1:SubscribeToModel( DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Icon:GetModel( f4_local1 ), function ()
		local f8_local0 = DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Icon:GetValue( f4_local1 )
		if f8_local0 ~= nil then
			InventorySlot1:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( InventorySlot1 )
	self.InventorySlot1 = InventorySlot1
	
	local Skull = nil
	
	Skull = LUI.UIImage.new()
	Skull.id = "Skull"
	Skull:SetScale( -0.68, 0 )
	Skull:setImage( RegisterMaterial( "cp_town_battery" ), 0 )
	Skull:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100.48, _1080p * 228.48, _1080p * 4.5, _1080p * 132.5 )
	Skull:BindAlphaToModel( DataSources.inGame.CP.zombies.ghost.ghostAfterLifeIconAlpha:GetModel( f4_local1 ) )
	self:addElement( Skull )
	self.Skull = Skull
	
	local emptyFuseCopy = nil
	
	emptyFuseCopy = LUI.UIImage.new()
	emptyFuseCopy.id = "emptyFuseCopy"
	emptyFuseCopy:SetScale( -0.63, 0 )
	emptyFuseCopy:setImage( RegisterMaterial( "zm_empty_fuse" ), 0 )
	emptyFuseCopy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136.5, _1080p * 264.5, _1080p * -40.32, _1080p * 87.68 )
	emptyFuseCopy:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.djToneAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( emptyFuseCopy )
	self.emptyFuseCopy = emptyFuseCopy
	
	local FusesCopy = nil
	
	FusesCopy = LUI.UIImage.new()
	FusesCopy.id = "FusesCopy"
	FusesCopy:SetScale( -0.63, 0 )
	FusesCopy:setImage( RegisterMaterial( "cp_zmb_sticker_fuse" ), 0 )
	FusesCopy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136.5, _1080p * 264.5, _1080p * -40.32, _1080p * 87.68 )
	FusesCopy:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questFuseAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( FusesCopy )
	self.FusesCopy = FusesCopy
	
	local emptyFuse = nil
	
	emptyFuse = LUI.UIImage.new()
	emptyFuse.id = "emptyFuse"
	emptyFuse:SetScale( -0.63, 0 )
	emptyFuse:setImage( RegisterMaterial( "zm_empty_fuse" ), 0 )
	emptyFuse:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 108.5, _1080p * 236.5, _1080p * -40.32, _1080p * 87.68 )
	emptyFuse:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.djToneAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( emptyFuse )
	self.emptyFuse = emptyFuse
	
	local FusesCopy0 = nil
	
	FusesCopy0 = LUI.UIImage.new()
	FusesCopy0.id = "FusesCopy0"
	FusesCopy0:SetScale( -0.63, 0 )
	FusesCopy0:setImage( RegisterMaterial( "cp_zmb_sticker_fuse" ), 0 )
	FusesCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 108.5, _1080p * 236.5, _1080p * -40.32, _1080p * 87.68 )
	FusesCopy0:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questFuseAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( FusesCopy0 )
	self.FusesCopy0 = FusesCopy0
	
	local f4_local17 = nil
	if CONDITIONS.IsDirectorsCutOn( f4_local1 ) then
		f4_local17 = LUI.UIImage.new()
		f4_local17.id = "star"
		f4_local17:SetScale( -0.57, 0 )
		f4_local17:setImage( RegisterMaterial( "zm_directors_cut_star" ), 0 )
		f4_local17:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -47.95, _1080p * 80.05, _1080p * -46, _1080p * 82 )
		self:addElement( f4_local17 )
		self.star = f4_local17
	end
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "MainPlayerInfoDLC3", MainPlayerInfoDLC3 )
LockTable( _M )
