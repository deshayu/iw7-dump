local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function skullEntanglerWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 60 * _1080p )
	self.id = "skullEntanglerWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local background = nil
	
	background = LUI.UIImage.new()
	background.id = "background"
	background:SetRGBFromInt( 787717, 0 )
	background:SetAlpha( 0.2, 0 )
	background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 600, 0, _1080p * 60 )
	self:addElement( background )
	self.background = background
	
	local progressBarBorder = nil
	
	progressBarBorder = LUI.UIImage.new()
	progressBarBorder.id = "progressBarBorder"
	progressBarBorder:SetRGBFromInt( 2236448, 0 )
	progressBarBorder:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 32, _1080p * 53.11 )
	progressBarBorder:BindAlphaToModel( DataSources.inGame.CP.zombies.ghost.entanglerWidgetAlpha:GetModel( f1_local1 ) )
	self:addElement( progressBarBorder )
	self.progressBarBorder = progressBarBorder
	
	local progressBar = nil
	
	progressBar = LUI.UIImage.new()
	progressBar.id = "progressBar"
	progressBar:SetAnchors( 0, 1, 0, 1, 0 )
	progressBar:SetLeft( _1080p * 0, 0 )
	progressBar:SetTop( _1080p * 27.11, 0 )
	progressBar:SetBottom( _1080p * 59.11, 0 )
	progressBar:setImage( RegisterMaterial( "cp_zmb_ghost_skull_fill_bar" ), 0 )
	progressBar:SubscribeToModel( DataSources.inGame.CP.zombies.ghost.entanglerProgress:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.ghost.entanglerProgress:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			progressBar:SetRight( _1080p * Multiply( f2_local0, 600 ), 0 )
		end
	end )
	progressBar:BindAlphaToModel( DataSources.inGame.CP.zombies.ghost.entanglerWidgetAlpha:GetModel( f1_local1 ) )
	self:addElement( progressBar )
	self.progressBar = progressBar
	
	local deploySCU = nil
	
	deploySCU = LUI.UIText.new()
	deploySCU.id = "deploySCU"
	deploySCU:setText( Engine.Localize( "CP_ZMB_GHOST_SKULL_DEPLOY" ), 0 )
	deploySCU:SetFontSize( 18 * _1080p )
	deploySCU:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	deploySCU:SetAlignment( LUI.Alignment.Center )
	deploySCU:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -416.5, _1080p * 416.5, 0, _1080p * 18 )
	deploySCU:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeInstructionAlpha:GetModel( f1_local1 ) )
	self:addElement( deploySCU )
	self.deploySCU = deploySCU
	
	local tracking = nil
	
	tracking = LUI.UIText.new()
	tracking.id = "tracking"
	tracking:setText( Engine.Localize( "CP_ZMB_GHOST_TRACKING" ), 0 )
	tracking:SetFontSize( 18 * _1080p )
	tracking:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	tracking:SetAlignment( LUI.Alignment.Center )
	tracking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 190, _1080p * 411, _1080p * 32, _1080p * 49 )
	self:addElement( tracking )
	self.tracking = tracking
	
	local Objective = nil
	
	Objective = LUI.UIText.new()
	Objective.id = "Objective"
	Objective:setText( Engine.Localize( "CP_ZMB_GHOST_OBJECTIVE" ), 0 )
	Objective:SetFontSize( 24 * _1080p )
	Objective:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Objective:SetAlignment( LUI.Alignment.Left )
	Objective:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 99, _1080p * 526, _1080p * -34, _1080p * -10 )
	Objective:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeObjectiveAlpha:GetModel( f1_local1 ) )
	self:addElement( Objective )
	self.Objective = Objective
	
	local oneSkullEscaped = nil
	
	oneSkullEscaped = LUI.UIText.new()
	oneSkullEscaped.id = "oneSkullEscaped"
	oneSkullEscaped:SetRGBFromInt( 16451592, 0 )
	oneSkullEscaped:setText( Engine.Localize( "CP_ZMB_GHOST_ONE_SKULL_ESCAPED" ), 0 )
	oneSkullEscaped:SetFontSize( 24 * _1080p )
	oneSkullEscaped:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	oneSkullEscaped:SetAlignment( LUI.Alignment.Left )
	oneSkullEscaped:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 178.37, _1080p * 421.63, _1080p * -33, _1080p * -9 )
	oneSkullEscaped:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeOneSkullEscapedAlpha:GetModel( f1_local1 ) )
	self:addElement( oneSkullEscaped )
	self.oneSkullEscaped = oneSkullEscaped
	
	local twoSkullsEscaped = nil
	
	twoSkullsEscaped = LUI.UIText.new()
	twoSkullsEscaped.id = "twoSkullsEscaped"
	twoSkullsEscaped:SetRGBFromInt( 16516871, 0 )
	twoSkullsEscaped:setText( Engine.Localize( "CP_ZMB_GHOST_TWO_SKULLS_ESCAPED" ), 0 )
	twoSkullsEscaped:SetFontSize( 24 * _1080p )
	twoSkullsEscaped:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	twoSkullsEscaped:SetAlignment( LUI.Alignment.Left )
	twoSkullsEscaped:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 179.5, _1080p * 445.5, _1080p * -34, _1080p * -10 )
	twoSkullsEscaped:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeTwoSkullsEscapedAlpha:GetModel( f1_local1 ) )
	self:addElement( twoSkullsEscaped )
	self.twoSkullsEscaped = twoSkullsEscaped
	
	local threeSkullsEscaped = nil
	
	threeSkullsEscaped = LUI.UIText.new()
	threeSkullsEscaped.id = "threeSkullsEscaped"
	threeSkullsEscaped:SetRGBFromInt( 16318721, 0 )
	threeSkullsEscaped:setText( Engine.Localize( "CP_ZMB_GHOST_THREE_SKULLS_ESCAPED" ), 0 )
	threeSkullsEscaped:SetFontSize( 24 * _1080p )
	threeSkullsEscaped:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	threeSkullsEscaped:SetAlignment( LUI.Alignment.Left )
	threeSkullsEscaped:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 179, _1080p * 445, _1080p * -34, _1080p * -10 )
	threeSkullsEscaped:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeThreeSkullsEscapedAlpha:GetModel( f1_local1 ) )
	self:addElement( threeSkullsEscaped )
	self.threeSkullsEscaped = threeSkullsEscaped
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		tracking:RegisterAnimationSequence( "flashing", {
			{
				function ()
					return self.tracking:SetAlpha( 1, 200 )
				end,
				function ()
					return self.tracking:SetAlpha( 0, 800 )
				end
			}
		} )
		self._sequences.flashing = function ()
			tracking:AnimateLoop( "flashing" )
		end
		
		tracking:RegisterAnimationSequence( "endFlashing", {
			{
				function ()
					return self.tracking:SetAlpha( 0, 0 )
				end,
				function ()
					return self.tracking:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.endFlashing = function ()
			tracking:AnimateSequence( "endFlashing" )
		end
		
		self._sequences.hideAll = function ()
			threeSkullsEscaped:AnimateSequence( "hideAll" )
		end
		
		background:RegisterAnimationSequence( "cpTown", {
			{
				function ()
					return self.background:SetAlpha( 0, 0 )
				end
			}
		} )
		deploySCU:RegisterAnimationSequence( "cpTown", {
			{
				function ()
					return self.deploySCU:setText( Engine.Localize( "CP_TOWN_GHOST_SKULL_DEPLOY" ), 0 )
				end
			}
		} )
		self._sequences.cpTown = function ()
			background:AnimateSequence( "cpTown" )
			deploySCU:AnimateSequence( "cpTown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.ghost.entanglerFlashingActive:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.ghost.entanglerFlashingActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.ghost.entanglerFlashingActive:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "flashing" )
		end
		if DataSources.inGame.CP.zombies.ghost.entanglerFlashingActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.ghost.entanglerFlashingActive:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "endFlashing" )
		end
	end )
	if CONDITIONS.IsDLC3( self ) then
		ACTIONS.AnimateSequence( self, "cpTown" )
	end
	return self
end

MenuBuilder.registerType( "skullEntanglerWidget", skullEntanglerWidget )
LockTable( _M )
