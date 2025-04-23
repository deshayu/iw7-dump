local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.updateData = function ( f2_arg0, f2_arg1 )
		local f2_local0 = Game.GetCPScoreboardRowData( f2_arg1 )
		f1_arg0.Image:setImage( RegisterMaterial( ZombiesUtils.GetZombiesPlayerPhoto( DataSources.inGame.CP.playerCharacter:GetValue( f1_arg1 ), DataSources.inGame.CP.playerStatus:GetValue( f1_arg1 ), f2_local0.clientNum ) ), 0 )
		f1_arg0.Score:setText( f2_local0.currency )
	end
	
end

function ghostShotZomPlayer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 241 * _1080p, 0, 83 * _1080p )
	self.id = "ghostShotZomPlayer"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Score = nil
	
	Score = LUI.UIText.new()
	Score.id = "Score"
	Score:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	Score:setText( "350", 0 )
	Score:SetFontSize( 38 * _1080p )
	Score:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Score:SetAlignment( LUI.Alignment.Left )
	Score:SetOptOutRightToLeftAlignmentFlip( true )
	Score:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 92.52, _1080p * 241, _1080p * 25.6, _1080p * 63.6 )
	self:addElement( Score )
	self.Score = Score
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetScale( -0.35, 0 )
	Image:setImage( RegisterMaterial( "zm_pc_score_team_plyr_1" ), 0 )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -19.4, _1080p * 108.6, _1080p * -23.4, _1080p * 104.6 )
	self:addElement( Image )
	self.Image = Image
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ghostShotZomPlayer", ghostShotZomPlayer )
LockTable( _M )
