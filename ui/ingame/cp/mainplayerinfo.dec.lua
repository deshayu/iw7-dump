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

function MainPlayerInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 282 * _1080p, 0, 219 * _1080p )
	self.id = "MainPlayerInfo"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local ZomTickets = nil
	
	ZomTickets = MenuBuilder.BuildRegisteredType( "ZomTickets", {
		controllerIndex = f4_local1
	} )
	ZomTickets.id = "ZomTickets"
	ZomTickets:SetZRotation( 1, 0 )
	ZomTickets:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 140.5, _1080p * 268.5, _1080p * 132.63, _1080p * 162.63 )
	self:addElement( ZomTickets )
	self.ZomTickets = ZomTickets
	
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
	
	local souvenir = nil
	
	souvenir = MenuBuilder.BuildRegisteredType( "souvenir", {
		controllerIndex = f4_local1
	} )
	souvenir.id = "souvenir"
	souvenir:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 251.75, _1080p * 361.75, _1080p * 124.63, _1080p * 234.63 )
	self:addElement( souvenir )
	self.souvenir = souvenir
	
	local Fuses = nil
	
	Fuses = LUI.UIImage.new()
	Fuses.id = "Fuses"
	Fuses:SetScale( -0.5, 0 )
	Fuses:setImage( RegisterMaterial( "cp_zmb_sticker_fuse" ), 0 )
	Fuses:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 118.26, _1080p * 246.26, _1080p * 3.63, _1080p * 131.63 )
	Fuses:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questFuseAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( Fuses )
	self.Fuses = Fuses
	
	local FusesCopy = nil
	
	FusesCopy = LUI.UIImage.new()
	FusesCopy.id = "FusesCopy"
	FusesCopy:SetScale( -0.5, 0 )
	FusesCopy:setImage( RegisterMaterial( "cp_zmb_sticker_fuse" ), 0 )
	FusesCopy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 145.82, _1080p * 273.82, _1080p * 25.39, _1080p * 153.39 )
	FusesCopy:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questFuseAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( FusesCopy )
	self.FusesCopy = FusesCopy
	
	local djTone = nil
	
	djTone = LUI.UIImage.new()
	djTone.id = "djTone"
	djTone:SetZRotation( 39, 0 )
	djTone:SetScale( -0.3, 0 )
	djTone:setImage( RegisterMaterial( "cp_zmb_djtone" ), 0 )
	djTone:SetUseAA( true )
	djTone:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 134, _1080p * 262, _1080p * 14.5, _1080p * 142.5 )
	djTone:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.djToneAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( djTone )
	self.djTone = djTone
	
	local f4_local12 = nil
	if CONDITIONS.IsDirectorsCutOn( f4_local1 ) then
		f4_local12 = LUI.UIImage.new()
		f4_local12.id = "star"
		f4_local12:SetScale( -0.57, 0 )
		f4_local12:setImage( RegisterMaterial( "zm_directors_cut_star" ), 0 )
		f4_local12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -47.95, _1080p * 80.05, _1080p * -46, _1080p * 82 )
		self:addElement( f4_local12 )
		self.star = f4_local12
	end
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "MainPlayerInfo", MainPlayerInfo )
LockTable( _M )
