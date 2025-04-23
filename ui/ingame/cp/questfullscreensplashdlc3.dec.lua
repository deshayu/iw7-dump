local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questFullScreenSplashDLC3( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "questFullScreenSplashDLC3"
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
	white:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1, _1080p * 1919, _1080p * -1, _1080p * 1079 )
	self:addElement( white )
	self.white = white
	
	local questBarDLC3 = nil
	
	questBarDLC3 = MenuBuilder.BuildRegisteredType( "questBarDLC3", {
		controllerIndex = f1_local1
	} )
	questBarDLC3.id = "questBarDLC3"
	questBarDLC3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( questBarDLC3 )
	self.questBarDLC3 = questBarDLC3
	
	self._animationSets.DefaultAnimationSet = function ()
		questBarDLC3:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.questBarDLC3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			questBarDLC3:AnimateSequence( "DefaultSequence" )
		end
		
		white:RegisterAnimationSequence( "pieceFound", {
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
					return self.white:playSound( "newspaper", false, 0 )
				end
			}
		} )
		questBarDLC3:RegisterAnimationSequence( "pieceFound", {
			{
				function ()
					return self.questBarDLC3:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questBarDLC3:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questBarDLC3:SetAlpha( 1, 1450 )
				end,
				function ()
					return self.questBarDLC3:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.pieceFound = function ()
			white:AnimateSequence( "pieceFound" )
			questBarDLC3:AnimateSequence( "pieceFound" )
		end
		
		self._sequences.Splitscreen = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questToothAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questToothAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questToothAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.boatQuestCompleteAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.boatQuestCompleteAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.boatQuestCompleteAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.papQuestCompleteAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.papQuestCompleteAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.papQuestCompleteAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.harpoonQuestCompleteAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.harpoonQuestCompleteAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.harpoonQuestCompleteAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.jayQuestCompleteAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.jayQuestCompleteAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.jayQuestCompleteAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.liferayCompleteAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.liferayCompleteAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.liferayCompleteAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.chemBeakerPlacedAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.chemBeakerPlacedAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.chemBeakerPlacedAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.chemBurnerPlacedAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.chemBurnerPlacedAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.chemBurnerPlacedAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.chemClampPlacedAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.chemClampPlacedAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.chemClampPlacedAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "questFullScreenSplashDLC3", questFullScreenSplashDLC3 )
LockTable( _M )
