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

function MainPlayerInfoDLC4( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 282 * _1080p, 0, 219 * _1080p )
	self.id = "MainPlayerInfoDLC4"
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
	
	local PlayerCash = nil
	
	PlayerCash = LUI.UIText.new()
	PlayerCash.id = "PlayerCash"
	PlayerCash:SetFontSize( 38 * _1080p )
	PlayerCash:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PlayerCash:SetAlignment( LUI.Alignment.Left )
	PlayerCash:SetOptOutRightToLeftAlignmentFlip( true )
	PlayerCash:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 167.5, _1080p * 298, _1080p * 179.63, _1080p * 217.63 )
	PlayerCash:SubscribeToModel( DataSources.inGame.CP.currentPlayerCash:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.currentPlayerCash:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			PlayerCash:setText( f5_local0, 0 )
		end
	end )
	self:addElement( PlayerCash )
	self.PlayerCash = PlayerCash
	
	local PlayerIcon = nil
	
	PlayerIcon = LUI.UIImage.new()
	PlayerIcon.id = "PlayerIcon"
	PlayerIcon:SetScale( 0.53, 0 )
	PlayerIcon:setImage( RegisterMaterial( "zm_pc_score_main_plyr_1" ), 0 )
	PlayerIcon:SetUseAA( true )
	PlayerIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26.81, _1080p * 119.28, _1080p * 37.63, _1080p * 179.63 )
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
	
	local InventorySlot1 = nil
	
	InventorySlot1 = LUI.UIImage.new()
	InventorySlot1.id = "InventorySlot1"
	InventorySlot1:SetScale( -0.64, 0 )
	InventorySlot1:SetUseAA( true )
	InventorySlot1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 111.22, _1080p * 239.22, _1080p * 76.22, _1080p * 204.22 )
	InventorySlot1:BindAlphaToModel( DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Alpha:GetModel( f4_local1 ) )
	InventorySlot1:SubscribeToModel( DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Icon:GetModel( f4_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Icon:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			InventorySlot1:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( InventorySlot1 )
	self.InventorySlot1 = InventorySlot1
	
	local f4_local8 = nil
	if CONDITIONS.IsDirectorsCutOn( f4_local1 ) then
		f4_local8 = LUI.UIImage.new()
		f4_local8.id = "star"
		f4_local8:SetScale( -0.57, 0 )
		f4_local8:setImage( RegisterMaterial( "zm_directors_cut_star" ), 0 )
		f4_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -47.95, _1080p * 80.05, _1080p * -46, _1080p * 82 )
		self:addElement( f4_local8 )
		self.star = f4_local8
	end
	local emptyFuseCopy = nil
	
	emptyFuseCopy = LUI.UIImage.new()
	emptyFuseCopy.id = "emptyFuseCopy"
	emptyFuseCopy:SetScale( -0.63, 0 )
	emptyFuseCopy:setImage( RegisterMaterial( "zm_empty_fuse" ), 0 )
	emptyFuseCopy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136.5, _1080p * 264.5, _1080p * -40.32, _1080p * 87.68 )
	emptyFuseCopy:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.djToneAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( emptyFuseCopy )
	self.emptyFuseCopy = emptyFuseCopy
	
	local FusesCopyCopy0 = nil
	
	FusesCopyCopy0 = LUI.UIImage.new()
	FusesCopyCopy0.id = "FusesCopyCopy0"
	FusesCopyCopy0:SetScale( -0.63, 0 )
	FusesCopyCopy0:setImage( RegisterMaterial( "cp_zmb_sticker_fuse" ), 0 )
	FusesCopyCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136.5, _1080p * 264.5, _1080p * -40.32, _1080p * 87.68 )
	FusesCopyCopy0:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questFuseAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( FusesCopyCopy0 )
	self.FusesCopyCopy0 = FusesCopyCopy0
	
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
	
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "MainPlayerInfoDLC4", MainPlayerInfoDLC4 )
LockTable( _M )
