local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.CP.players:GetDataSourceAtIndex( Game.GetPlayerClientnum(), f1_arg0 )
	f1_local0 = f1_local0.image
	assert( f1_local0 )
	f1_arg1:SubscribeToModel( f1_local0:GetModel( f1_arg0 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 then
			f1_arg1:setImage( RegisterMaterial( string.gsub( f2_local0, "team", "main" ) ) )
		end
	end )
end

f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.PlayerIcon )
	f0_local0( f3_arg1, f3_arg0.PlayerIcon )
end

function MainPlayerInfoDLC2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 282 * _1080p, 0, 196 * _1080p )
	self.id = "MainPlayerInfoDLC2"
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
	box:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3.32, _1080p * 157.82, _1080p * 154.5, _1080p * 191.87 )
	self:addElement( box )
	self.box = box
	
	local MajongTile = nil
	
	MajongTile = MenuBuilder.BuildRegisteredType( "MajongTile", {
		controllerIndex = f4_local1
	} )
	MajongTile.id = "MajongTile"
	MajongTile:SetScale( -0.3, 0 )
	MajongTile:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 208.18, _1080p * 336.18, _1080p * 46.87, _1080p * 174.87 )
	self:addElement( MajongTile )
	self.MajongTile = MajongTile
	
	local PlayerCash = nil
	
	PlayerCash = LUI.UIText.new()
	PlayerCash.id = "PlayerCash"
	PlayerCash:SetFontSize( 38 * _1080p )
	PlayerCash:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PlayerCash:SetAlignment( LUI.Alignment.Left )
	PlayerCash:SetOptOutRightToLeftAlignmentFlip( true )
	PlayerCash:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30.32, _1080p * 160.82, _1080p * 155.5, _1080p * 193.5 )
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
	PlayerIcon:SetScale( -0.42, 0 )
	PlayerIcon:setImage( RegisterMaterial( "zm_main_plyr_1_dlc2" ), 0 )
	PlayerIcon:SetUseAA( true )
	PlayerIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -136.98, _1080p * 375.02, _1080p * -52.24, _1080p * 203.76 )
	self:addElement( PlayerIcon )
	self.PlayerIcon = PlayerIcon
	
	local dollarSign = nil
	
	dollarSign = LUI.UIText.new()
	dollarSign.id = "dollarSign"
	dollarSign:setText( "$", 0 )
	dollarSign:SetFontSize( 38 * _1080p )
	dollarSign:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	dollarSign:SetAlignment( LUI.Alignment.Left )
	dollarSign:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7.32, _1080p * 28.32, _1080p * 155.5, _1080p * 193.5 )
	self:addElement( dollarSign )
	self.dollarSign = dollarSign
	
	local emptyFuseCopy = nil
	
	emptyFuseCopy = LUI.UIImage.new()
	emptyFuseCopy.id = "emptyFuseCopy"
	emptyFuseCopy:SetScale( -0.63, 0 )
	emptyFuseCopy:setImage( RegisterMaterial( "zm_empty_fuse" ), 0 )
	emptyFuseCopy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 218.18, _1080p * 346.18, _1080p * -39.75, _1080p * 88.25 )
	emptyFuseCopy:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.djToneAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( emptyFuseCopy )
	self.emptyFuseCopy = emptyFuseCopy
	
	local FusesCopy = nil
	
	FusesCopy = LUI.UIImage.new()
	FusesCopy.id = "FusesCopy"
	FusesCopy:SetScale( -0.63, 0 )
	FusesCopy:setImage( RegisterMaterial( "cp_zmb_sticker_fuse" ), 0 )
	FusesCopy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 218.18, _1080p * 346.18, _1080p * -39.75, _1080p * 88.25 )
	FusesCopy:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questFuseAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( FusesCopy )
	self.FusesCopy = FusesCopy
	
	local emptyFuse = nil
	
	emptyFuse = LUI.UIImage.new()
	emptyFuse.id = "emptyFuse"
	emptyFuse:SetScale( -0.63, 0 )
	emptyFuse:setImage( RegisterMaterial( "zm_empty_fuse" ), 0 )
	emptyFuse:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 194.18, _1080p * 322.18, _1080p * -39.75, _1080p * 88.25 )
	emptyFuse:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.djToneAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( emptyFuse )
	self.emptyFuse = emptyFuse
	
	local Fuses = nil
	
	Fuses = LUI.UIImage.new()
	Fuses.id = "Fuses"
	Fuses:SetScale( -0.63, 0 )
	Fuses:setImage( RegisterMaterial( "cp_zmb_sticker_fuse" ), 0 )
	Fuses:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 194.18, _1080p * 322.18, _1080p * -39.75, _1080p * 88.25 )
	Fuses:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questFuseAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( Fuses )
	self.Fuses = Fuses
	
	local DeliriumPower = nil
	
	DeliriumPower = LUI.UIImage.new()
	DeliriumPower.id = "DeliriumPower"
	DeliriumPower:SetZRotation( 39, 0 )
	DeliriumPower:SetScale( -0.69, 0 )
	DeliriumPower:setImage( RegisterMaterial( "zm_powder_bag" ), 0 )
	DeliriumPower:SetUseAA( true )
	DeliriumPower:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 282.18, _1080p * 410.18, _1080p * -39.75, _1080p * 88.25 )
	DeliriumPower:BindAlphaToModel( DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory2Alpha:GetModel( f4_local1 ) )
	self:addElement( DeliriumPower )
	self.DeliriumPower = DeliriumPower
	
	local Skull = nil
	
	Skull = LUI.UIImage.new()
	Skull.id = "Skull"
	Skull:SetScale( -0.82, 0 )
	Skull:setImage( RegisterMaterial( "zm_hud_pixel_skull" ), 0 )
	Skull:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 259.14, _1080p * 515.14, _1080p * -103.17, _1080p * 152.83 )
	Skull:BindAlphaToModel( DataSources.inGame.CP.zombies.ghost.ghostAfterLifeIconAlpha:GetModel( f4_local1 ) )
	self:addElement( Skull )
	self.Skull = Skull
	
	local chiStyle = nil
	
	chiStyle = MenuBuilder.BuildRegisteredType( "chiStyle", {
		controllerIndex = f4_local1
	} )
	chiStyle.id = "chiStyle"
	chiStyle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 140.23, _1080p * 178.23, _1080p * 131.5, _1080p * 170.5 )
	self:addElement( chiStyle )
	self.chiStyle = chiStyle
	
	local f4_local15 = nil
	if CONDITIONS.IsDirectorsCutOn( f4_local1 ) then
		f4_local15 = LUI.UIImage.new()
		f4_local15.id = "star"
		f4_local15:SetScale( -0.57, 0 )
		f4_local15:setImage( RegisterMaterial( "zm_directors_cut_star" ), 0 )
		f4_local15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -47.95, _1080p * 80.05, _1080p * -46, _1080p * 82 )
		self:addElement( f4_local15 )
		self.star = f4_local15
	end
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "MainPlayerInfoDLC2", MainPlayerInfoDLC2 )
LockTable( _M )
