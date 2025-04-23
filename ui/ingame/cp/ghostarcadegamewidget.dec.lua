local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ghostArcadeGameWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 401 * _1080p, 0, 132 * _1080p )
	self.id = "ghostArcadeGameWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ghostArcadeGameCircle = nil
	
	ghostArcadeGameCircle = MenuBuilder.BuildRegisteredType( "ghostArcadeGameCircle", {
		controllerIndex = f1_local1
	} )
	ghostArcadeGameCircle.id = "ghostArcadeGameCircle"
	ghostArcadeGameCircle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 270, _1080p * 398, _1080p * 12, _1080p * 140 )
	ghostArcadeGameCircle.icon:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostWaveTarget3EscapedAlpha:GetModel( f1_local1 ) )
	self:addElement( ghostArcadeGameCircle )
	self.ghostArcadeGameCircle = ghostArcadeGameCircle
	
	local ghostArcadeGameCircleCopy0 = nil
	
	ghostArcadeGameCircleCopy0 = MenuBuilder.BuildRegisteredType( "ghostArcadeGameCircle", {
		controllerIndex = f1_local1
	} )
	ghostArcadeGameCircleCopy0.id = "ghostArcadeGameCircleCopy0"
	ghostArcadeGameCircleCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3, _1080p * 131, _1080p * 13, _1080p * 140 )
	ghostArcadeGameCircleCopy0.icon:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostWaveTarget1EscapedAlpha:GetModel( f1_local1 ) )
	self:addElement( ghostArcadeGameCircleCopy0 )
	self.ghostArcadeGameCircleCopy0 = ghostArcadeGameCircleCopy0
	
	local ghostArcadeGameCircleCopy1 = nil
	
	ghostArcadeGameCircleCopy1 = MenuBuilder.BuildRegisteredType( "ghostArcadeGameCircle", {
		controllerIndex = f1_local1
	} )
	ghostArcadeGameCircleCopy1.id = "ghostArcadeGameCircleCopy1"
	ghostArcadeGameCircleCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136.25, _1080p * 264.25, _1080p * 12, _1080p * 140 )
	ghostArcadeGameCircleCopy1.icon:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostWaveTarget2EscapedAlpha:GetModel( f1_local1 ) )
	self:addElement( ghostArcadeGameCircleCopy1 )
	self.ghostArcadeGameCircleCopy1 = ghostArcadeGameCircleCopy1
	
	local GameOver = nil
	
	GameOver = LUI.UIText.new()
	GameOver.id = "GameOver"
	GameOver:SetRGBFromInt( 16721703, 0 )
	GameOver:setText( ToUpperCase( Engine.Localize( "CP_ZMB_GHOST_GAME_OVER" ) ), 0 )
	GameOver:SetFontSize( 20 * _1080p )
	GameOver:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	GameOver:SetAlignment( LUI.Alignment.Center )
	GameOver:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 283.75, _1080p * 388.25, _1080p * 66, _1080p * 86 )
	self:addElement( GameOver )
	self.GameOver = GameOver
	
	local SkullEscaped = nil
	
	SkullEscaped = LUI.UIText.new()
	SkullEscaped.id = "SkullEscaped"
	SkullEscaped:setText( ToUpperCase( Engine.Localize( "CP_ZMB_GHOST_SKULL_ESCAPED" ) ), 0 )
	SkullEscaped:SetFontSize( 24 * _1080p )
	SkullEscaped:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	SkullEscaped:SetAlignment( LUI.Alignment.Left )
	SkullEscaped:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 39.75, _1080p * 398, 0, _1080p * 24 )
	self:addElement( SkullEscaped )
	self.SkullEscaped = SkullEscaped
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ghostArcadeGameCircle:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.ghostArcadeGameCircle:SetAlpha( 0, 0 )
				end
			}
		} )
		ghostArcadeGameCircleCopy0:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.ghostArcadeGameCircleCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		ghostArcadeGameCircleCopy1:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.ghostArcadeGameCircleCopy1:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.ghostArcadeGameCircleCopy1:SetXRotation( 3, 0 )
				end
			}
		} )
		GameOver:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.GameOver:SetAlpha( 0, 0 )
				end
			}
		} )
		SkullEscaped:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.SkullEscaped:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			ghostArcadeGameCircle:AnimateSequence( "initial" )
			ghostArcadeGameCircleCopy0:AnimateSequence( "initial" )
			ghostArcadeGameCircleCopy1:AnimateSequence( "initial" )
			GameOver:AnimateSequence( "initial" )
			SkullEscaped:AnimateSequence( "initial" )
		end
		
		ghostArcadeGameCircle:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.ghostArcadeGameCircle:SetAlpha( 1, 0 )
				end
			}
		} )
		ghostArcadeGameCircleCopy0:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.ghostArcadeGameCircleCopy0:SetAlpha( 1, 0 )
				end
			}
		} )
		ghostArcadeGameCircleCopy1:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.ghostArcadeGameCircleCopy1:SetAlpha( 1, 0 )
				end
			}
		} )
		GameOver:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.GameOver:SetAlpha( 1, 0 )
				end
			}
		} )
		SkullEscaped:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.SkullEscaped:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.activate = function ()
			ghostArcadeGameCircle:AnimateSequence( "activate" )
			ghostArcadeGameCircleCopy0:AnimateSequence( "activate" )
			ghostArcadeGameCircleCopy1:AnimateSequence( "activate" )
			GameOver:AnimateSequence( "activate" )
			SkullEscaped:AnimateSequence( "activate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "activate" )
		end
		if DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "initial" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.showGhostArcadeScores:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.showGhostArcadeScores:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.showGhostArcadeScores:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "initial" )
		end
	end )
	ACTIONS.AnimateSequence( self, "initial" )
	return self
end

MenuBuilder.registerType( "ghostArcadeGameWidget", ghostArcadeGameWidget )
LockTable( _M )
