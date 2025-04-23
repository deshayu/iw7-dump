local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function skullStrikesWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 401 * _1080p, 0, 132 * _1080p )
	self.id = "skullStrikesWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ghostArcadeGameCircle = nil
	
	ghostArcadeGameCircle = MenuBuilder.BuildRegisteredType( "skullStrikeIconWidget", {
		controllerIndex = f1_local1
	} )
	ghostArcadeGameCircle.id = "ghostArcadeGameCircle"
	ghostArcadeGameCircle:SetScale( -0.2, 0 )
	ghostArcadeGameCircle.Frame:SetAlpha( 0.2, 0 )
	ghostArcadeGameCircle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 266, _1080p * 394, _1080p * -12.8, _1080p * 115.2 )
	ghostArcadeGameCircle.icon:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostWaveTarget3EscapedAlpha:GetModel( f1_local1 ) )
	self:addElement( ghostArcadeGameCircle )
	self.ghostArcadeGameCircle = ghostArcadeGameCircle
	
	local ghostArcadeGameCircleCopy1 = nil
	
	ghostArcadeGameCircleCopy1 = MenuBuilder.BuildRegisteredType( "skullStrikeIconWidget", {
		controllerIndex = f1_local1
	} )
	ghostArcadeGameCircleCopy1.id = "ghostArcadeGameCircleCopy1"
	ghostArcadeGameCircleCopy1:SetScale( -0.2, 0 )
	ghostArcadeGameCircleCopy1.Frame:SetAlpha( 0.2, 0 )
	ghostArcadeGameCircleCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 132.25, _1080p * 260.25, _1080p * -12.8, _1080p * 115.2 )
	ghostArcadeGameCircleCopy1.icon:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostWaveTarget2EscapedAlpha:GetModel( f1_local1 ) )
	self:addElement( ghostArcadeGameCircleCopy1 )
	self.ghostArcadeGameCircleCopy1 = ghostArcadeGameCircleCopy1
	
	local ghostArcadeGameCircleCopy0 = nil
	
	ghostArcadeGameCircleCopy0 = MenuBuilder.BuildRegisteredType( "skullStrikeIconWidget", {
		controllerIndex = f1_local1
	} )
	ghostArcadeGameCircleCopy0.id = "ghostArcadeGameCircleCopy0"
	ghostArcadeGameCircleCopy0:SetScale( -0.2, 0 )
	ghostArcadeGameCircleCopy0.Frame:SetAlpha( 0.2, 0 )
	ghostArcadeGameCircleCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1, _1080p * 127, _1080p * -11.8, _1080p * 115.2 )
	ghostArcadeGameCircleCopy0.icon:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostWaveTarget1EscapedAlpha:GetModel( f1_local1 ) )
	self:addElement( ghostArcadeGameCircleCopy0 )
	self.ghostArcadeGameCircleCopy0 = ghostArcadeGameCircleCopy0
	
	local GameOver = nil
	
	GameOver = LUI.UIText.new()
	GameOver.id = "GameOver"
	GameOver:SetRGBFromInt( 1607874, 0 )
	GameOver:setText( ToUpperCase( Engine.Localize( "CP_ZMB_GHOST_SKULL_GAME_OVER" ) ), 0 )
	GameOver:SetFontSize( 20 * _1080p )
	GameOver:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	GameOver:SetAlignment( LUI.Alignment.Center )
	GameOver:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 283.75, _1080p * 388.25, _1080p * 31.2, _1080p * 51.2 )
	self:addElement( GameOver )
	self.GameOver = GameOver
	
	local SkullEscaped = nil
	
	SkullEscaped = LUI.UIText.new()
	SkullEscaped.id = "SkullEscaped"
	SkullEscaped:SetRGBFromInt( 1607874, 0 )
	SkullEscaped:setText( ToUpperCase( Engine.Localize( "CP_ZMB_GHOST_SKULL_STRIKES" ) ), 0 )
	SkullEscaped:SetFontSize( 30 * _1080p )
	SkullEscaped:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	SkullEscaped:SetAlignment( LUI.Alignment.Left )
	SkullEscaped:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 374.25, _1080p * 103.2, _1080p * 133.2 )
	self:addElement( SkullEscaped )
	self.SkullEscaped = SkullEscaped
	
	local Border = nil
	
	Border = LUI.UIImage.new()
	Border.id = "Border"
	Border:setImage( RegisterMaterial( "cp_disco_buster_hudline" ), 0 )
	Border:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -13.48, _1080p * 405.98, _1080p * 75.2, _1080p * 107.2 )
	self:addElement( Border )
	self.Border = Border
	
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
		ghostArcadeGameCircleCopy0:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.ghostArcadeGameCircleCopy0:SetAlpha( 0, 0 )
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
		Border:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Border:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			ghostArcadeGameCircle:AnimateSequence( "initial" )
			ghostArcadeGameCircleCopy1:AnimateSequence( "initial" )
			ghostArcadeGameCircleCopy0:AnimateSequence( "initial" )
			GameOver:AnimateSequence( "initial" )
			SkullEscaped:AnimateSequence( "initial" )
			Border:AnimateSequence( "initial" )
		end
		
		ghostArcadeGameCircle:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.ghostArcadeGameCircle:SetAlpha( 1, 0 )
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
		ghostArcadeGameCircleCopy0:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.ghostArcadeGameCircleCopy0:SetAlpha( 1, 0 )
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
		Border:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.Border:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.activate = function ()
			ghostArcadeGameCircle:AnimateSequence( "activate" )
			ghostArcadeGameCircleCopy1:AnimateSequence( "activate" )
			ghostArcadeGameCircleCopy0:AnimateSequence( "activate" )
			GameOver:AnimateSequence( "activate" )
			SkullEscaped:AnimateSequence( "activate" )
			Border:AnimateSequence( "activate" )
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

MenuBuilder.registerType( "skullStrikesWidget", skullStrikesWidget )
LockTable( _M )
