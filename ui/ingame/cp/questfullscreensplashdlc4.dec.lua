local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questFullScreenSplashDLC4( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "questFullScreenSplashDLC4"
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
	white:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -1, _1080p * -1, _1080p * -1081, _1080p * -1 )
	self:addElement( white )
	self.white = white
	
	local questBarDLC4 = nil
	
	questBarDLC4 = MenuBuilder.BuildRegisteredType( "QuestBarDLC4", {
		controllerIndex = f1_local1
	} )
	questBarDLC4.id = "questBarDLC4"
	questBarDLC4:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 12, _1080p * 282 )
	self:addElement( questBarDLC4 )
	self.questBarDLC4 = questBarDLC4
	
	self._animationSets.DefaultAnimationSet = function ()
		questBarDLC4:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.questBarDLC4:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			questBarDLC4:AnimateSequence( "DefaultSequence" )
		end
		
		white:RegisterAnimationSequence( "pieceFound", {
			{
				function ()
					return self.white:SetAlpha( 0.7, 0 )
				end,
				function ()
					return self.white:SetAlpha( 0, 150 )
				end
			}
		} )
		questBarDLC4:RegisterAnimationSequence( "pieceFound", {
			{
				function ()
					return self.questBarDLC4:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questBarDLC4:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questBarDLC4:SetAlpha( 1, 1450 )
				end,
				function ()
					return self.questBarDLC4:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.pieceFound = function ()
			white:AnimateSequence( "pieceFound" )
			questBarDLC4:AnimateSequence( "pieceFound" )
		end
		
		white:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.white:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 130, _1080p * -1, _1080p * -1081, _1080p * -1, 0 )
				end
			}
		} )
		questBarDLC4:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.questBarDLC4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1920, _1080p * 12, _1080p * 282, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			white:AnimateSequence( "Splitscreen" )
			questBarDLC4:AnimateSequence( "Splitscreen" )
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
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "questFullScreenSplashDLC4", questFullScreenSplashDLC4 )
LockTable( _M )
