local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questFullScreenSplashDLC1( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "questFullScreenSplashDLC1"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self.soundSet = "quests"
	local f1_local2 = self
	local white = nil
	
	white = LUI.UIImage.new()
	white.id = "white"
	white:SetAlpha( 0, 0 )
	white:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( white )
	self.white = white
	
	local questBoatDLC1 = nil
	
	questBoatDLC1 = MenuBuilder.BuildRegisteredType( "questBoatDLC1", {
		controllerIndex = f1_local1
	} )
	questBoatDLC1.id = "questBoatDLC1"
	questBoatDLC1:SetAlpha( 0, 0 )
	questBoatDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 172, _1080p * 380, _1080p * 241, _1080p * 492 )
	self:addElement( questBoatDLC1 )
	self.questBoatDLC1 = questBoatDLC1
	
	local questHarpoonDLC1 = nil
	
	questHarpoonDLC1 = MenuBuilder.BuildRegisteredType( "questHarpoonDLC1", {
		controllerIndex = f1_local1
	} )
	questHarpoonDLC1.id = "questHarpoonDLC1"
	questHarpoonDLC1:SetAlpha( 0, 0 )
	questHarpoonDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 171, _1080p * 384, _1080p * 241, _1080p * 495 )
	self:addElement( questHarpoonDLC1 )
	self.questHarpoonDLC1 = questHarpoonDLC1
	
	local questPapDLC1 = nil
	
	questPapDLC1 = MenuBuilder.BuildRegisteredType( "questMemory1", {
		controllerIndex = f1_local1
	} )
	questPapDLC1.id = "questPapDLC1"
	questPapDLC1:SetAlpha( 0, 0 )
	questPapDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173, _1080p * 382, _1080p * 237, _1080p * 492 )
	self:addElement( questPapDLC1 )
	self.questPapDLC1 = questPapDLC1
	
	local questJayDLC1 = nil
	
	questJayDLC1 = MenuBuilder.BuildRegisteredType( "questMemory2", {
		controllerIndex = f1_local1
	} )
	questJayDLC1.id = "questJayDLC1"
	questJayDLC1:SetAlpha( 0, 0 )
	questJayDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 172, _1080p * 381, _1080p * 237, _1080p * 492 )
	self:addElement( questJayDLC1 )
	self.questJayDLC1 = questJayDLC1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		white:RegisterAnimationSequence( "HarpoonPieceFound", {
			{
				function ()
					return self.white:SetAlpha( 0.7, 0 )
				end,
				function ()
					return self.white:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.white:playSound( "polaroid", false, 0 )
				end
			},
			{
				function ()
					return self.white:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080, 0 )
				end
			}
		} )
		questHarpoonDLC1:RegisterAnimationSequence( "HarpoonPieceFound", {
			{
				function ()
					return self.questHarpoonDLC1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questHarpoonDLC1:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questHarpoonDLC1:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.questHarpoonDLC1:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.questHarpoonDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 171, _1080p * 384, _1080p * 241, _1080p * 495, 0 )
				end,
				function ()
					return self.questHarpoonDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 171, _1080p * 384, _1080p * 212, _1080p * 467, 150 )
				end
			}
		} )
		self._sequences.HarpoonPieceFound = function ()
			white:AnimateSequence( "HarpoonPieceFound" )
			questHarpoonDLC1:AnimateSequence( "HarpoonPieceFound" )
		end
		
		white:RegisterAnimationSequence( "boatPieceFound", {
			{
				function ()
					return self.white:playSound( "polaroid", false, 0 )
				end
			},
			{
				function ()
					return self.white:SetAlpha( 0.7, 0 )
				end,
				function ()
					return self.white:SetAlpha( 0, 150 )
				end
			}
		} )
		questBoatDLC1:RegisterAnimationSequence( "boatPieceFound", {
			{
				function ()
					return self.questBoatDLC1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questBoatDLC1:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questBoatDLC1:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.questBoatDLC1:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.questBoatDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 172, _1080p * 380, _1080p * 241, _1080p * 492, 0 )
				end,
				function ()
					return self.questBoatDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 172, _1080p * 380, _1080p * 212, _1080p * 467, 150 )
				end
			}
		} )
		self._sequences.boatPieceFound = function ()
			white:AnimateSequence( "boatPieceFound" )
			questBoatDLC1:AnimateSequence( "boatPieceFound" )
		end
		
		white:RegisterAnimationSequence( "papPieceFound", {
			{
				function ()
					return self.white:SetAlpha( 0.7, 0 )
				end,
				function ()
					return self.white:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.white:playSound( "polaroid", false, 0 )
				end
			}
		} )
		questPapDLC1:RegisterAnimationSequence( "papPieceFound", {
			{
				function ()
					return self.questPapDLC1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questPapDLC1:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questPapDLC1:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.questPapDLC1:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.questPapDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173, _1080p * 382, _1080p * 237, _1080p * 492, 0 )
				end,
				function ()
					return self.questPapDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173, _1080p * 382, _1080p * 212, _1080p * 467, 150 )
				end
			}
		} )
		self._sequences.papPieceFound = function ()
			white:AnimateSequence( "papPieceFound" )
			questPapDLC1:AnimateSequence( "papPieceFound" )
		end
		
		white:RegisterAnimationSequence( "jayPieceFound", {
			{
				function ()
					return self.white:SetAlpha( 0.7, 0 )
				end,
				function ()
					return self.white:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.white:playSound( "polaroid", false, 0 )
				end
			}
		} )
		questJayDLC1:RegisterAnimationSequence( "jayPieceFound", {
			{
				function ()
					return self.questJayDLC1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questJayDLC1:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questJayDLC1:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.questJayDLC1:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.questJayDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 172, _1080p * 381, _1080p * 237, _1080p * 492, 0 )
				end,
				function ()
					return self.questJayDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 172, _1080p * 381, _1080p * 212, _1080p * 467, 150 )
				end
			}
		} )
		self._sequences.jayPieceFound = function ()
			white:AnimateSequence( "jayPieceFound" )
			questJayDLC1:AnimateSequence( "jayPieceFound" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	questBoatDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "boatPieceFound" )
		end
	end )
	questBoatDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "boatPieceFound" )
		end
	end )
	questBoatDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "boatPieceFound" )
		end
	end )
	questHarpoonDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "HarpoonPieceFound" )
		end
	end )
	questHarpoonDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "HarpoonPieceFound" )
		end
	end )
	questHarpoonDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "HarpoonPieceFound" )
		end
	end )
	questHarpoonDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "HarpoonPieceFound" )
		end
	end )
	questHarpoonDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "HarpoonPieceFound" )
		end
	end )
	questHarpoonDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "HarpoonPieceFound" )
		end
	end )
	questHarpoonDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "HarpoonPieceFound" )
		end
	end )
	questPapDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "papPieceFound" )
		end
	end )
	questPapDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "papPieceFound" )
		end
	end )
	questPapDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "papPieceFound" )
		end
	end )
	questJayDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "jayPieceFound" )
		end
	end )
	questJayDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "jayPieceFound" )
		end
	end )
	questJayDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "jayPieceFound" )
		end
	end )
	questJayDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "jayPieceFound" )
		end
	end )
	questJayDLC1:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "jayPieceFound" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questFullScreenSplashDLC1", questFullScreenSplashDLC1 )
LockTable( _M )
