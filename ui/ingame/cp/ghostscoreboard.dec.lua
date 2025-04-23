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
end

function ghostScoreBoard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ghostScoreBoard"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local youFailed = nil
	
	youFailed = LUI.UIText.new()
	youFailed.id = "youFailed"
	youFailed:setText( ToUpperCase( Engine.Localize( "CP_ZMB_GHOST_YOU_FAILED" ) ), 0 )
	youFailed:SetFontSize( 80 * _1080p )
	youFailed:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	youFailed:SetAlignment( LUI.Alignment.Center )
	youFailed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 603.5, _1080p * 1299.5, _1080p * 145, _1080p * 225 )
	youFailed:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeYouFailedAlpha:GetModel( f2_local1 ) )
	self:addElement( youFailed )
	self.youFailed = youFailed
	
	local youWon = nil
	
	youWon = LUI.UIText.new()
	youWon.id = "youWon"
	youWon:setText( ToUpperCase( Engine.Localize( "CP_ZMB_GHOST_YOU_WON" ) ), 0 )
	youWon:SetFontSize( 80 * _1080p )
	youWon:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	youWon:SetAlignment( LUI.Alignment.Center )
	youWon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 635.5, _1080p * 1267.5, _1080p * 145, _1080p * 225 )
	youWon:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeYouWonAlpha:GetModel( f2_local1 ) )
	self:addElement( youWon )
	self.youWon = youWon
	
	local ghostShotZomPlayer0 = nil
	
	ghostShotZomPlayer0 = MenuBuilder.BuildRegisteredType( "ghostShotZomPlayer", {
		controllerIndex = f2_local1
	} )
	ghostShotZomPlayer0.id = "ghostShotZomPlayer0"
	ghostShotZomPlayer0:SetScale( -0.25, 0 )
	ghostShotZomPlayer0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 839.5, _1080p * 1111.5, _1080p * 197, _1080p * 309 )
	self:addElement( ghostShotZomPlayer0 )
	self.ghostShotZomPlayer0 = ghostShotZomPlayer0
	
	local ghostShotZomPlayer1 = nil
	
	ghostShotZomPlayer1 = MenuBuilder.BuildRegisteredType( "ghostShotZomPlayer", {
		controllerIndex = f2_local1
	} )
	ghostShotZomPlayer1.id = "ghostShotZomPlayer1"
	ghostShotZomPlayer1:SetScale( -0.25, 0 )
	ghostShotZomPlayer1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 839.5, _1080p * 1111.5, _1080p * 253, _1080p * 365 )
	self:addElement( ghostShotZomPlayer1 )
	self.ghostShotZomPlayer1 = ghostShotZomPlayer1
	
	local ghostShotZomPlayer2 = nil
	
	ghostShotZomPlayer2 = MenuBuilder.BuildRegisteredType( "ghostShotZomPlayer", {
		controllerIndex = f2_local1
	} )
	ghostShotZomPlayer2.id = "ghostShotZomPlayer2"
	ghostShotZomPlayer2:SetScale( -0.25, 0 )
	ghostShotZomPlayer2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 839.5, _1080p * 1111.5, _1080p * 308.84, _1080p * 420.84 )
	self:addElement( ghostShotZomPlayer2 )
	self.ghostShotZomPlayer2 = ghostShotZomPlayer2
	
	local ghostShotZomPlayer3 = nil
	
	ghostShotZomPlayer3 = MenuBuilder.BuildRegisteredType( "ghostShotZomPlayer", {
		controllerIndex = f2_local1
	} )
	ghostShotZomPlayer3.id = "ghostShotZomPlayer3"
	ghostShotZomPlayer3:SetScale( -0.25, 0 )
	ghostShotZomPlayer3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 839.5, _1080p * 1111.5, _1080p * 363.84, _1080p * 475.84 )
	self:addElement( ghostShotZomPlayer3 )
	self.ghostShotZomPlayer3 = ghostShotZomPlayer3
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ghostShotZomPlayer0:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.ghostShotZomPlayer0:SetAlpha( 1, 0 )
				end
			}
		} )
		ghostShotZomPlayer1:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 1, 0 )
				end
			}
		} )
		ghostShotZomPlayer2:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 1, 0 )
				end
			}
		} )
		ghostShotZomPlayer3:RegisterAnimationSequence( "FourPlayer", {
			{
				function ()
					return self.ghostShotZomPlayer3:SetAlpha( 1, 0 )
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
					return self.ghostShotZomPlayer0:SetAlpha( 1, 0 )
				end
			}
		} )
		ghostShotZomPlayer1:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 1, 0 )
				end
			}
		} )
		ghostShotZomPlayer2:RegisterAnimationSequence( "ThreePlayer", {
			{
				function ()
					return self.ghostShotZomPlayer2:SetAlpha( 1, 0 )
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
					return self.ghostShotZomPlayer0:SetAlpha( 1, 0 )
				end
			}
		} )
		ghostShotZomPlayer1:RegisterAnimationSequence( "TwoPlayer", {
			{
				function ()
					return self.ghostShotZomPlayer1:SetAlpha( 1, 0 )
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
					return self.ghostShotZomPlayer0:SetAlpha( 1, 0 )
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
		
		self._sequences.initial = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	if CONDITIONS.NumberOfPlayers( f2_local1, "1" ) then
		ACTIONS.AnimateSequence( self, "OnePlayer" )
	end
	if CONDITIONS.NumberOfPlayers( f2_local1, "3" ) then
		ACTIONS.AnimateSequence( self, "ThreePlayer" )
	end
	if CONDITIONS.NumberOfPlayers( f2_local1, "4" ) then
		ACTIONS.AnimateSequence( self, "FourPlayer" )
	end
	if CONDITIONS.NumberOfPlayers( f2_local1, "2" ) then
		ACTIONS.AnimateSequence( self, "TwoPlayer" )
	end
	return self
end

MenuBuilder.registerType( "ghostScoreBoard", ghostScoreBoard )
LockTable( _M )
