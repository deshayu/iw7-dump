local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.updateData = function ( f2_arg0, f2_arg1 )
		local f2_local0 = Game.GetCPScoreboardRowData( f2_arg1 )
		f1_arg0.Image:setImage( RegisterMaterial( ZombiesUtils.GetZombiesPlayerPhoto( DataSources.inGame.CP.playerCharacter:GetValue( f1_arg1 ), DataSources.inGame.CP.playerStatus:GetValue( f1_arg1 ), f2_local0.clientNum ) ), 0 )
		f1_arg0.Player:setText( f2_local0.name )
	end
	
end

function BossPlayer1( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 464 * _1080p, 0, 140 * _1080p )
	self.id = "BossPlayer1"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local nameBox = nil
	
	nameBox = LUI.UIImage.new()
	nameBox.id = "nameBox"
	nameBox:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	nameBox:SetUseAA( true )
	nameBox:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 464, _1080p * 107, _1080p * 140 )
	self:addElement( nameBox )
	self.nameBox = nameBox
	
	local timeBox = nil
	
	timeBox = LUI.UIImage.new()
	timeBox.id = "timeBox"
	timeBox:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	timeBox:SetUseAA( true )
	timeBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 104, _1080p * 334, _1080p * 31, _1080p * 95 )
	self:addElement( timeBox )
	self.timeBox = timeBox
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetScale( 0.12, 0 )
	Image:setImage( RegisterMaterial( "zm_pc_score_team_plyr_1" ), 0 )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7.68, _1080p * 135.68, _1080p * -9, _1080p * 119 )
	self:addElement( Image )
	self.Image = Image
	
	local Player = nil
	
	Player = LUI.UIText.new()
	Player.id = "Player"
	Player:setText( " CLAN  WWWWWWWWWWWWWWWW", 0 )
	Player:SetFontSize( 30 * _1080p )
	Player:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Player:SetAlignment( LUI.Alignment.Left )
	Player:SetOptOutRightToLeftAlignmentFlip( true )
	Player:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 107, _1080p * 137 )
	self:addElement( Player )
	self.Player = Player
	
	local Score = nil
	
	Score = LUI.UIText.new()
	Score.id = "Score"
	Score:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	Score:SetFontSize( 38 * _1080p )
	Score:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Score:SetAlignment( LUI.Alignment.Left )
	Score:SetOptOutRightToLeftAlignmentFlip( true )
	Score:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 144.76, _1080p * 334, _1080p * 44, _1080p * 82 )
	Score:SubscribeToModel( DataSources.inGame.CP.zombies.bossTimePlayer1:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.bossTimePlayer1:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Score:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Score )
	self.Score = Score
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "BossPlayer1", BossPlayer1 )
LockTable( _M )
