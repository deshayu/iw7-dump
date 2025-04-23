local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Game.GetNumPlayersOnTeam( Teams.allies )
	f1_arg0.ghostShotZomPlayer0.updateData( ghostShotZomPlayer0, 0 )
	if f1_local0 > 1 then
		f1_arg0.ghostShotZomPlayer1.updateData( ghostShotZomPlayer1, 1 )
	end
	if f1_local0 > 2 then
		f1_arg0.ghostShotZomPlayer2.updateData( ghostShotZomPlayer2, 2 )
	end
	if f1_local0 > 3 then
		f1_arg0.ghostShotZomPlayer3.updateData( ghostShotZomPlayer3, 3 )
	end
	local f1_local1 = LUI.DataSourceFromOmnvar.new( "zm_boss_id" )
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		local f2_local1 = Engine.GetDvarString( "ui_mapname" )
		if f2_local1 == "cp_final" and f2_local0 ~= 6 then
			f1_arg0.boss:setImage( RegisterMaterial( "cp_final_boss_rhino" ), 0 )
		elseif f2_local1 == "cp_final" and f2_local0 == 6 then
			f1_arg0.boss:setImage( RegisterMaterial( "cp_final_boss_meph" ), 0 )
		end
	end )
end

function BossSplash( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "BossSplash"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local blackBkgnd = nil
	
	blackBkgnd = LUI.UIImage.new()
	blackBkgnd.id = "blackBkgnd"
	blackBkgnd:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -68, _1080p * 1965, _1080p * -113, _1080p * 1199 )
	self:addElement( blackBkgnd )
	self.blackBkgnd = blackBkgnd
	
	local RedGlow = nil
	
	RedGlow = LUI.UIImage.new()
	RedGlow.id = "RedGlow"
	RedGlow:SetAlpha( 0.8, 0 )
	RedGlow:setImage( RegisterMaterial( "cp_menu_pause_red_glow" ), 0 )
	RedGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 581, _1080p * 1361, _1080p * 74.5, _1080p * 854.5 )
	self:addElement( RedGlow )
	self.RedGlow = RedGlow
	
	local Spinner = nil
	
	Spinner = LUI.UIImage.new()
	Spinner.id = "Spinner"
	Spinner:SetAlpha( 0.3, 0 )
	Spinner:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 502, _1080p * 1406, _1080p * -38, _1080p * 866 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local Triangle = nil
	
	Triangle = LUI.UIImage.new()
	Triangle.id = "Triangle"
	Triangle:SetAlpha( 0.15, 0 )
	Triangle:setImage( RegisterMaterial( "cp_menu_pause_devil_head_triangle" ), 0 )
	Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 728, _1080p * 1194, _1080p * 245.5, _1080p * 683.5 )
	self:addElement( Triangle )
	self.Triangle = Triangle
	
	local boss = nil
	
	boss = LUI.UIImage.new()
	boss.id = "boss"
	boss:setImage( RegisterMaterial( "cp_final_boss_alien" ), 0 )
	boss:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 561, _1080p * 817, _1080p * 251, _1080p * 507 )
	self:addElement( boss )
	self.boss = boss
	
	local bestTimes = nil
	
	bestTimes = LUI.UIText.new()
	bestTimes.id = "bestTimes"
	bestTimes:SetRGBFromInt( 0, 0 )
	bestTimes:setText( ToUpperCase( Engine.Localize( "DIRECT_BOSS_FIGHT_BEST_TIMES" ) ), 0 )
	bestTimes:SetFontSize( 48 * _1080p )
	bestTimes:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	bestTimes:SetAlignment( LUI.Alignment.Center )
	bestTimes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 655, _1080p * 1287, _1080p * 540, _1080p * 588 )
	self:addElement( bestTimes )
	self.bestTimes = bestTimes
	
	local ghostShotZomPlayer0 = nil
	
	ghostShotZomPlayer0 = MenuBuilder.BuildRegisteredType( "BossPlayer1", {
		controllerIndex = f3_local1
	} )
	ghostShotZomPlayer0.id = "ghostShotZomPlayer0"
	ghostShotZomPlayer0:SetScale( -0.25, 0 )
	ghostShotZomPlayer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 598, _1080p * 870, _1080p * 598, _1080p * 710 )
	self:addElement( ghostShotZomPlayer0 )
	self.ghostShotZomPlayer0 = ghostShotZomPlayer0
	
	local ghostShotZomPlayer1 = nil
	
	ghostShotZomPlayer1 = MenuBuilder.BuildRegisteredType( "BossPlayer2", {
		controllerIndex = f3_local1
	} )
	ghostShotZomPlayer1.id = "ghostShotZomPlayer1"
	ghostShotZomPlayer1:SetScale( -0.25, 0 )
	ghostShotZomPlayer1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1006, _1080p * 1278, _1080p * 598, _1080p * 710 )
	self:addElement( ghostShotZomPlayer1 )
	self.ghostShotZomPlayer1 = ghostShotZomPlayer1
	
	local ghostShotZomPlayer2 = nil
	
	ghostShotZomPlayer2 = MenuBuilder.BuildRegisteredType( "BossPlayer3", {
		controllerIndex = f3_local1
	} )
	ghostShotZomPlayer2.id = "ghostShotZomPlayer2"
	ghostShotZomPlayer2:SetScale( -0.25, 0 )
	ghostShotZomPlayer2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 598, _1080p * 870, _1080p * 742, _1080p * 854 )
	self:addElement( ghostShotZomPlayer2 )
	self.ghostShotZomPlayer2 = ghostShotZomPlayer2
	
	local ghostShotZomPlayer3 = nil
	
	ghostShotZomPlayer3 = MenuBuilder.BuildRegisteredType( "BossPlayer4", {
		controllerIndex = f3_local1
	} )
	ghostShotZomPlayer3.id = "ghostShotZomPlayer3"
	ghostShotZomPlayer3:SetScale( -0.25, 0 )
	ghostShotZomPlayer3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1006, _1080p * 1278, _1080p * 742, _1080p * 854 )
	self:addElement( ghostShotZomPlayer3 )
	self.ghostShotZomPlayer3 = ghostShotZomPlayer3
	
	local Logo = nil
	
	Logo = LUI.UIImage.new()
	Logo.id = "Logo"
	Logo:SetScale( 0.96, 0 )
	Logo:setImage( RegisterMaterial( "zm_spaceland_zombies" ), 0 )
	Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 859, _1080p * 1115, _1080p * 317.56, _1080p * 445.56 )
	self:addElement( Logo )
	self.Logo = Logo
	
	local bossBattleText = nil
	
	bossBattleText = LUI.UIText.new()
	bossBattleText.id = "bossBattleText"
	bossBattleText:SetRGBFromInt( 5170433, 0 )
	bossBattleText:setText( ToUpperCase( Engine.Localize( "DIRECT_BOSS_FIGHT_BOSS_BATTLE" ) ), 0 )
	bossBattleText:SetFontSize( 80 * _1080p )
	bossBattleText:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	bossBattleText:SetAlignment( LUI.Alignment.Center )
	bossBattleText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 433.49, _1080p * 1528.51, _1080p * 434, _1080p * 514 )
	self:addElement( bossBattleText )
	self.bossBattleText = bossBattleText
	
	self._animationSets.DefaultAnimationSet = function ()
		blackBkgnd:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.blackBkgnd:SetAlpha( 0, 0 )
				end,
				function ()
					return self.blackBkgnd:SetAlpha( 1, 110 )
				end,
				function ()
					return self.blackBkgnd:SetAlpha( 1, 1910 )
				end,
				function ()
					return self.blackBkgnd:SetAlpha( 0, 900 )
				end
			}
		} )
		RedGlow:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0, 240 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0.8, 70 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0.8, 2740 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0, 360 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0, 240 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0.3, 70 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0.3, 2740 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0, 360 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Triangle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Triangle:SetAlpha( 0, 240 )
				end,
				function ()
					return self.Triangle:SetAlpha( 0.15, 70 )
				end,
				function ()
					return self.Triangle:SetAlpha( 0.15, 2740 )
				end,
				function ()
					return self.Triangle:SetAlpha( 0, 360 )
				end
			}
		} )
		boss:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.boss:SetAlpha( 0, 0 )
				end,
				function ()
					return self.boss:SetAlpha( 0, 240 )
				end,
				function ()
					return self.boss:SetAlpha( 1, 70 )
				end,
				function ()
					return self.boss:SetAlpha( 1, 2740 )
				end,
				function ()
					return self.boss:SetAlpha( 0, 360 )
				end
			},
			{
				function ()
					return self.boss:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 571, _1080p * 827, _1080p * 224, _1080p * 480, 3049 )
				end
			}
		} )
		bestTimes:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.bestTimes:SetAlpha( 0, 0 )
				end,
				function ()
					return self.bestTimes:SetAlpha( 0, 640 )
				end,
				function ()
					return self.bestTimes:SetAlpha( 1, 80 )
				end,
				function ()
					return self.bestTimes:SetAlpha( 1, 2330 )
				end,
				function ()
					return self.bestTimes:SetAlpha( 0, 360 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Logo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Logo:SetAlpha( 0, 240 )
				end,
				function ()
					return self.Logo:SetAlpha( 1, 70 )
				end,
				function ()
					return self.Logo:SetAlpha( 1, 2740 )
				end,
				function ()
					return self.Logo:SetAlpha( 0, 360 )
				end
			}
		} )
		bossBattleText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.bossBattleText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.bossBattleText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.bossBattleText:SetAlpha( 0, 200 )
				end,
				function ()
					return self.bossBattleText:SetAlpha( 1, 60 )
				end,
				function ()
					return self.bossBattleText:SetAlpha( 1, 2550 )
				end,
				function ()
					return self.bossBattleText:SetAlpha( 0, 360 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			blackBkgnd:AnimateSequence( "DefaultSequence" )
			RedGlow:AnimateSequence( "DefaultSequence" )
			Spinner:AnimateSequence( "DefaultSequence" )
			Triangle:AnimateSequence( "DefaultSequence" )
			boss:AnimateSequence( "DefaultSequence" )
			bestTimes:AnimateSequence( "DefaultSequence" )
			Logo:AnimateSequence( "DefaultSequence" )
			bossBattleText:AnimateSequence( "DefaultSequence" )
		end
		
		ghostShotZomPlayer0:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 0, 660 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 1, 40 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 1, 2600 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 0, 100 )
				end
			}
		} )
		ghostShotZomPlayer1:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 0, 660 )
				end,
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 1, 40 )
				end,
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 1, 2600 )
				end,
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 0, 100 )
				end
			}
		} )
		ghostShotZomPlayer2:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 0, 660 )
				end,
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 1, 40 )
				end,
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 1, 2600 )
				end,
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 0, 100 )
				end
			}
		} )
		ghostShotZomPlayer3:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.ghostShotZomPlayer3:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ghostShotZomPlayer3:SetAlpha( 0, 660 )
				end,
				function ()
					return self.ghostShotZomPlayer3:SetAlpha( 1, 40 )
				end,
				function ()
					return self.ghostShotZomPlayer3:SetAlpha( 1, 2600 )
				end,
				function ()
					return self.ghostShotZomPlayer3:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.FourPlayer = function ()
			ghostShotZomPlayer0:AnimateSequence( "FourPlayer" )
			ghostShotZomPlayer1:AnimateSequence( "FourPlayer" )
			ghostShotZomPlayer2:AnimateSequence( "FourPlayer" )
			ghostShotZomPlayer3:AnimateSequence( "FourPlayer" )
		end
		
		ghostShotZomPlayer0:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 0, 640 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 1, 60 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 1, 2600 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 0, 100 )
				end
			}
		} )
		ghostShotZomPlayer1:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 0, 640 )
				end,
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 1, 60 )
				end,
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 1, 2600 )
				end,
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 0, 100 )
				end
			}
		} )
		ghostShotZomPlayer2:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 0, 640 )
				end,
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 1, 60 )
				end,
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 1, 2600 )
				end,
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.ghostShotZomPlayer2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 812, _1080p * 1084, _1080p * 742, _1080p * 854, 0 )
				end
			}
		} )
		ghostShotZomPlayer3:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.ghostShotZomPlayer3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ThreePlayer = function ()
			ghostShotZomPlayer0:AnimateSequence( "ThreePlayer" )
			ghostShotZomPlayer1:AnimateSequence( "ThreePlayer" )
			ghostShotZomPlayer2:AnimateSequence( "ThreePlayer" )
			ghostShotZomPlayer3:AnimateSequence( "ThreePlayer" )
		end
		
		ghostShotZomPlayer0:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 0, 660 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 1, 40 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 1, 2600 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 0, 100 )
				end
			}
		} )
		ghostShotZomPlayer1:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 0, 660 )
				end,
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 1, 40 )
				end,
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 1, 2600 )
				end,
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 0, 100 )
				end
			}
		} )
		ghostShotZomPlayer2:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 0, 0 )
				end
			}
		} )
		ghostShotZomPlayer3:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.ghostShotZomPlayer3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.TwoPlayer = function ()
			ghostShotZomPlayer0:AnimateSequence( "TwoPlayer" )
			ghostShotZomPlayer1:AnimateSequence( "TwoPlayer" )
			ghostShotZomPlayer2:AnimateSequence( "TwoPlayer" )
			ghostShotZomPlayer3:AnimateSequence( "TwoPlayer" )
		end
		
		ghostShotZomPlayer0:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 0, 670 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 1, 30 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 1, 2350 )
				end,
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 0, 360 )
				end
			},
			{
				function ()
					return self.ghostShotZomPlayer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 777, _1080p * 1049, _1080p * 598, _1080p * 710, 0 )
				end
			}
		} )
		ghostShotZomPlayer1:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 0, 0 )
				end
			}
		} )
		ghostShotZomPlayer2:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 0, 0 )
				end
			}
		} )
		ghostShotZomPlayer3:RegisterAnimationSequence( "OnePlayer", {
			{
				function ()
					return self.ghostShotZomPlayer3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.OnePlayer = function ()
			ghostShotZomPlayer0:AnimateSequence( "OnePlayer" )
			ghostShotZomPlayer1:AnimateSequence( "OnePlayer" )
			ghostShotZomPlayer2:AnimateSequence( "OnePlayer" )
			ghostShotZomPlayer3:AnimateSequence( "OnePlayer" )
		end
		
		boss:RegisterAnimationSequence( "cp_rave", {
			{
				function ()
					return self.boss:setImage( RegisterMaterial( "cp_final_boss_slasher" ), 0 )
				end
			},
			{
				function ()
					return self.boss:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 571, _1080p * 827, _1080p * 200, _1080p * 456, 0 )
				end,
				function ()
					return self.boss:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 558, _1080p * 814, _1080p * 200, _1080p * 456, 3049 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "cp_rave", {
			{
				function ()
					return self.Logo:setImage( RegisterMaterial( "zm_rave_logo" ), 0 )
				end
			},
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 859, _1080p * 1115, _1080p * 249.56, _1080p * 377.56, 0 )
				end
			}
		} )
		bossBattleText:RegisterAnimationSequence( "cp_rave", {
			{
				function ()
					return self.bossBattleText:SetRGBFromInt( 1864361, 0 )
				end
			}
		} )
		self._sequences.cp_rave = function ()
			boss:AnimateSequence( "cp_rave" )
			Logo:AnimateSequence( "cp_rave" )
			bossBattleText:AnimateSequence( "cp_rave" )
		end
		
		boss:RegisterAnimationSequence( "cp_disco", {
			{
				function ()
					return self.boss:setImage( RegisterMaterial( "cp_final_boss_ratking" ), 0 )
				end
			},
			{
				function ()
					return self.boss:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 525, _1080p * 781, _1080p * 149, _1080p * 405, 0 )
				end,
				function ()
					return self.boss:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 551, _1080p * 807, _1080p * 198, _1080p * 454, 3049 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "cp_disco", {
			{
				function ()
					return self.Logo:setImage( RegisterMaterial( "zm_disco_logo" ), 0 )
				end
			},
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 859, _1080p * 1115, _1080p * 253.56, _1080p * 381.56, 0 )
				end
			}
		} )
		bossBattleText:RegisterAnimationSequence( "cp_disco", {
			{
				function ()
					return self.bossBattleText:SetRGBFromInt( 16571402, 0 )
				end
			}
		} )
		self._sequences.cp_disco = function ()
			boss:AnimateSequence( "cp_disco" )
			Logo:AnimateSequence( "cp_disco" )
			bossBattleText:AnimateSequence( "cp_disco" )
		end
		
		boss:RegisterAnimationSequence( "cp_town", {
			{
				function ()
					return self.boss:setImage( RegisterMaterial( "cp_final_boss_crog" ), 0 )
				end
			},
			{
				function ()
					return self.boss:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 557, _1080p * 813, _1080p * 185, _1080p * 441, 0 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "cp_town", {
			{
				function ()
					return self.Logo:setImage( RegisterMaterial( "cp_town_logo" ), 0 )
				end
			},
			{
				function ()
					return self.Logo:SetScale( 0.3, 0 )
				end
			},
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 704, _1080p * 1216, _1080p * 158.38, _1080p * 414.38, 0 )
				end
			}
		} )
		bossBattleText:RegisterAnimationSequence( "cp_town", {
			{
				function ()
					return self.bossBattleText:SetRGBFromInt( 192770, 0 )
				end
			}
		} )
		self._sequences.cp_town = function ()
			boss:AnimateSequence( "cp_town" )
			Logo:AnimateSequence( "cp_town" )
			bossBattleText:AnimateSequence( "cp_town" )
		end
		
		boss:RegisterAnimationSequence( "cp_final", {
			{
				function ()
					return self.boss:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 570, _1080p * 826, _1080p * 185, _1080p * 441, 0 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "cp_final", {
			{
				function ()
					return self.Logo:setImage( RegisterMaterial( "cp_final_logo" ), 0 )
				end
			},
			{
				function ()
					return self.Logo:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.Logo:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 704, _1080p * 1216, _1080p * 211.38, _1080p * 467.38, 0 )
				end
			}
		} )
		bossBattleText:RegisterAnimationSequence( "cp_final", {
			{
				function ()
					return self.bossBattleText:SetRGBFromInt( 11147520, 0 )
				end
			}
		} )
		self._sequences.cp_final = function ()
			boss:AnimateSequence( "cp_final" )
			Logo:AnimateSequence( "cp_final" )
			bossBattleText:AnimateSequence( "cp_final" )
		end
		
		Spinner:RegisterAnimationSequence( "spinner", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( -53.66, 5980 )
				end
			}
		} )
		self._sequences.spinner = function ()
			Spinner:AnimateLoop( "spinner" )
		end
		
		blackBkgnd:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.blackBkgnd:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 2910, 0, _1080p * 1090, 0 )
				end
			}
		} )
		RedGlow:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 798.12, _1080p * 1578.12, _1080p * -159.5, _1080p * 620.5, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 719.12, _1080p * 1623.12, _1080p * -272, _1080p * 632, 0 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 945.12, _1080p * 1411.12, _1080p * 11.5, _1080p * 449.5, 0 )
				end
			}
		} )
		boss:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.boss:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 778.12, _1080p * 1034.12, _1080p * 17, _1080p * 273, 0 )
				end
			}
		} )
		bestTimes:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.bestTimes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 872.12, _1080p * 1504.12, _1080p * 337, _1080p * 385, 0 )
				end
			}
		} )
		ghostShotZomPlayer0:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.ghostShotZomPlayer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 815.12, _1080p * 1087.12, _1080p * 364, _1080p * 476, 0 )
				end
			}
		} )
		ghostShotZomPlayer1:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.ghostShotZomPlayer1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1223.12, _1080p * 1495.12, _1080p * 364, _1080p * 476, 0 )
				end
			}
		} )
		ghostShotZomPlayer2:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.ghostShotZomPlayer2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 815.12, _1080p * 1087.12, _1080p * 508, _1080p * 620, 0 )
				end
			}
		} )
		ghostShotZomPlayer3:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.ghostShotZomPlayer3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1223.12, _1080p * 1495.12, _1080p * 508, _1080p * 620, 0 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1076.12, _1080p * 1332.12, _1080p * 83.56, _1080p * 211.56, 0 )
				end
			}
		} )
		bossBattleText:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.bossBattleText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 656.61, _1080p * 1751.63, _1080p * 271, _1080p * 351, 0 )
				end
			}
		} )
		self._sequences.splitscreen = function ()
			blackBkgnd:AnimateSequence( "splitscreen" )
			RedGlow:AnimateSequence( "splitscreen" )
			Spinner:AnimateSequence( "splitscreen" )
			Triangle:AnimateSequence( "splitscreen" )
			boss:AnimateSequence( "splitscreen" )
			bestTimes:AnimateSequence( "splitscreen" )
			ghostShotZomPlayer0:AnimateSequence( "splitscreen" )
			ghostShotZomPlayer1:AnimateSequence( "splitscreen" )
			ghostShotZomPlayer2:AnimateSequence( "splitscreen" )
			ghostShotZomPlayer3:AnimateSequence( "splitscreen" )
			Logo:AnimateSequence( "splitscreen" )
			bossBattleText:AnimateSequence( "splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequence( self, "spinner" )
	if CONDITIONS.NumberOfPlayers( f3_local1, "1" ) then
		ACTIONS.AnimateSequence( self, "OnePlayer" )
	end
	if CONDITIONS.NumberOfPlayers( f3_local1, "3" ) then
		ACTIONS.AnimateSequence( self, "ThreePlayer" )
	end
	if CONDITIONS.NumberOfPlayers( f3_local1, "4" ) then
		ACTIONS.AnimateSequence( self, "FourPlayer" )
	end
	if CONDITIONS.NumberOfPlayers( f3_local1, "2" ) then
		ACTIONS.AnimateSequence( self, "TwoPlayer" )
	end
	if CONDITIONS.IsRave( self ) then
		ACTIONS.AnimateSequence( self, "cp_rave" )
	end
	if CONDITIONS.IsDLC2( self ) then
		ACTIONS.AnimateSequence( self, "cp_disco" )
	end
	if CONDITIONS.IsDLC3( self ) then
		ACTIONS.AnimateSequence( self, "cp_town" )
	end
	if CONDITIONS.IsDLC4( self ) then
		ACTIONS.AnimateSequence( self, "cp_final" )
	end
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "BossSplash", BossSplash )
LockTable( _M )
