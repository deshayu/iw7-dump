local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.updateData = function ( f2_arg0, f2_arg1 )
		local f2_local0 = Game.GetCPScoreboardRowData( f2_arg1 )
		if f2_local0 then
			local f2_local1 = ZombiesUtils.GetZombiesBigPhoto( DataSources.inGame.CP.playerCharacter:GetValue( f1_arg1 ), f2_local0.clientNum )
			local f2_local2 = Game.GetOmnvar( "zm_boss_splash" )
			if f2_local2 == 5 or f2_local2 == 7 then
				f2_local1 = ZombiesUtils.GetZombiesWinPhoto( DataSources.inGame.CP.playerCharacter:GetValue( f1_arg1 ), f2_local0.clientNum )
			end
			f1_arg0.Image:setImage( RegisterMaterial( f2_local1 ), 0 )
			f1_arg0.Score:setText( f2_local0.score )
			f1_arg0.Player:setText( f2_local0.name )
		else
			f1_arg0.Score:setText( "" )
			f1_arg0.Player:setText( "" )
		end
	end
	
end

function BroShotZomPlayer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 466 * _1080p, 0, 563 * _1080p )
	self.id = "BroShotZomPlayer"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local scoreBoxCopy = nil
	
	scoreBoxCopy = LUI.UIImage.new()
	scoreBoxCopy.id = "scoreBoxCopy"
	scoreBoxCopy:SetZRotation( 180, 0 )
	scoreBoxCopy:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	scoreBoxCopy:SetUseAA( true )
	scoreBoxCopy:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -170, _1080p * 0.5, _1080p * 44, _1080p * 108 )
	self:addElement( scoreBoxCopy )
	self.scoreBoxCopy = scoreBoxCopy
	
	local scoreBox = nil
	
	scoreBox = LUI.UIImage.new()
	scoreBox.id = "scoreBox"
	scoreBox:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	scoreBox:SetUseAA( true )
	scoreBox:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, 0, _1080p * 170, _1080p * 44, _1080p * 108 )
	self:addElement( scoreBox )
	self.scoreBox = scoreBox
	
	local nameBoxCopy = nil
	
	nameBoxCopy = LUI.UIImage.new()
	nameBoxCopy.id = "nameBoxCopy"
	nameBoxCopy:SetZRotation( 180, 0 )
	nameBoxCopy:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	nameBoxCopy:SetUseAA( true )
	nameBoxCopy:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -170, _1080p * 0.5, _1080p * 473, _1080p * 537 )
	self:addElement( nameBoxCopy )
	self.nameBoxCopy = nameBoxCopy
	
	local nameBox = nil
	
	nameBox = LUI.UIImage.new()
	nameBox.id = "nameBox"
	nameBox:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	nameBox:SetUseAA( true )
	nameBox:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, 0, _1080p * 170, _1080p * 473, _1080p * 537 )
	self:addElement( nameBox )
	self.nameBox = nameBox
	
	local Player = nil
	
	Player = LUI.UIText.new()
	Player.id = "Player"
	Player:setText( " CLAN  WWWWWWWWWWWWWWWW", 0 )
	Player:SetFontSize( 30 * _1080p )
	Player:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Player:SetAlignment( LUI.Alignment.Center )
	Player:SetOptOutRightToLeftAlignmentFlip( true )
	Player:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 490, _1080p * 520 )
	self:addElement( Player )
	self.Player = Player
	
	local Score = nil
	
	Score = LUI.UIText.new()
	Score.id = "Score"
	Score:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	Score:setText( "9000000", 0 )
	Score:SetFontSize( 60 * _1080p )
	Score:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Score:SetAlignment( LUI.Alignment.Center )
	Score:SetOptOutRightToLeftAlignmentFlip( true )
	Score:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 46, _1080p * 106 )
	self:addElement( Score )
	self.Score = Score
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:setImage( RegisterMaterial( "zm_pc_score_main_plyr_1" ), 0 )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -128.64, _1080p * 127.36, _1080p * 105, _1080p * 476 )
	self:addElement( Image )
	self.Image = Image
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		scoreBoxCopy:RegisterAnimationSequence( "cpDiscoSizing", {
			{
				function ()
					return self.scoreBoxCopy:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -170, _1080p * 0.5, _1080p * 133, _1080p * 197, 0 )
				end
			}
		} )
		scoreBox:RegisterAnimationSequence( "cpDiscoSizing", {
			{
				function ()
					return self.scoreBox:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, 0, _1080p * 170, _1080p * 133, _1080p * 197, 0 )
				end
			}
		} )
		nameBoxCopy:RegisterAnimationSequence( "cpDiscoSizing", {
			{
				function ()
					return self.nameBoxCopy:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -170, _1080p * 0.5, _1080p * 384, _1080p * 448, 0 )
				end
			}
		} )
		nameBox:RegisterAnimationSequence( "cpDiscoSizing", {
			{
				function ()
					return self.nameBox:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, 0, _1080p * 170, _1080p * 384, _1080p * 448, 0 )
				end
			}
		} )
		Player:RegisterAnimationSequence( "cpDiscoSizing", {
			{
				function ()
					return self.Player:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 401, _1080p * 431, 0 )
				end
			}
		} )
		Score:RegisterAnimationSequence( "cpDiscoSizing", {
			{
				function ()
					return self.Score:SetAnchors( 0, 0, 0, 1, 0 )
				end
			},
			{
				function ()
					return self.Score:SetLeft( _1080p * 0, 0 )
				end
			},
			{
				function ()
					return self.Score:SetRight( _1080p * 0, 0 )
				end
			},
			{
				function ()
					return self.Score:SetTop( _1080p * 135, 0 )
				end
			},
			{
				function ()
					return self.Score:SetBottom( _1080p * 195, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "cpDiscoSizing", {
			{
				function ()
					return self.Image:SetScale( -0.25, 0 )
				end
			},
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256.64, _1080p * 255.36, _1080p * 162.5, _1080p * 418.5, 0 )
				end
			}
		} )
		self._sequences.cpDiscoSizing = function ()
			scoreBoxCopy:AnimateSequence( "cpDiscoSizing" )
			scoreBox:AnimateSequence( "cpDiscoSizing" )
			nameBoxCopy:AnimateSequence( "cpDiscoSizing" )
			nameBox:AnimateSequence( "cpDiscoSizing" )
			Player:AnimateSequence( "cpDiscoSizing" )
			Score:AnimateSequence( "cpDiscoSizing" )
			Image:AnimateSequence( "cpDiscoSizing" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	if CONDITIONS.IsDLC2( self ) then
		ACTIONS.AnimateSequence( self, "cpDiscoSizing" )
	end
	return self
end

MenuBuilder.registerType( "BroShotZomPlayer", BroShotZomPlayer )
LockTable( _M )
