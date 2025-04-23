local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questFullScreenSplash( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 88 * _1080p )
	self.id = "questFullScreenSplash"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local questRobotWidget = nil
	
	questRobotWidget = MenuBuilder.BuildRegisteredType( "questRobotWidget", {
		controllerIndex = f1_local1
	} )
	questRobotWidget.id = "questRobotWidget"
	questRobotWidget:SetAlpha( 0, 0 )
	questRobotWidget:SetScale( -0.47, 0 )
	questRobotWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -57.29, _1080p * 242.71, _1080p * -21.72, _1080p * 110.28 )
	self:addElement( questRobotWidget )
	self.questRobotWidget = questRobotWidget
	
	local questArkWidget = nil
	
	questArkWidget = MenuBuilder.BuildRegisteredType( "questArkWidget", {
		controllerIndex = f1_local1
	} )
	questArkWidget.id = "questArkWidget"
	questArkWidget:SetAlpha( 0, 0 )
	questArkWidget:SetScale( -0.49, 0 )
	questArkWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -145.29, _1080p * 496.71, _1080p * -23.22, _1080p * 111.78 )
	self:addElement( questArkWidget )
	self.questArkWidget = questArkWidget
	
	local questTooth = nil
	
	questTooth = MenuBuilder.BuildRegisteredType( "questTooth", {
		controllerIndex = f1_local1
	} )
	questTooth.id = "questTooth"
	questTooth:SetAlpha( 0, 0 )
	questTooth:SetScale( -0.46, 0 )
	questTooth:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -18.77, _1080p * 109.23, _1080p * -19.72, _1080p * 108.28 )
	self:addElement( questTooth )
	self.questTooth = questTooth
	
	local questWOR1Widget = nil
	
	questWOR1Widget = MenuBuilder.BuildRegisteredType( "questWOR1Widget", {
		controllerIndex = f1_local1
	} )
	questWOR1Widget.id = "questWOR1Widget"
	questWOR1Widget:SetAlpha( 0, 0 )
	questWOR1Widget:SetScale( -0.25, 0 )
	questWOR1Widget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -20.5, _1080p * 143.5, _1080p * -14.25, _1080p * 99.75 )
	self:addElement( questWOR1Widget )
	self.questWOR1Widget = questWOR1Widget
	
	local questRecorderWidget = nil
	
	questRecorderWidget = MenuBuilder.BuildRegisteredType( "questRecorderWidget", {
		controllerIndex = f1_local1
	} )
	questRecorderWidget.id = "questRecorderWidget"
	questRecorderWidget:SetAlpha( 0, 0 )
	questRecorderWidget:SetScale( -0.47, 0 )
	questRecorderWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -63.68, _1080p * 248.32, _1080p * -10.25, _1080p * 95.75 )
	self:addElement( questRecorderWidget )
	self.questRecorderWidget = questRecorderWidget
	
	local questWOR2Widget = nil
	
	questWOR2Widget = MenuBuilder.BuildRegisteredType( "questWOR2Widget", {
		controllerIndex = f1_local1
	} )
	questWOR2Widget.id = "questWOR2Widget"
	questWOR2Widget:SetAlpha( 0, 0 )
	questWOR2Widget:SetScale( -0.25, 0 )
	questWOR2Widget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -24.63, _1080p * 180.38, _1080p * -12.72, _1080p * 101.28 )
	self:addElement( questWOR2Widget )
	self.questWOR2Widget = questWOR2Widget
	
	local questWOR3Widget = nil
	
	questWOR3Widget = MenuBuilder.BuildRegisteredType( "questWOR3Widget", {
		controllerIndex = f1_local1
	} )
	questWOR3Widget.id = "questWOR3Widget"
	questWOR3Widget:SetAlpha( 0, 0 )
	questWOR3Widget:SetScale( -0.25, 0 )
	questWOR3Widget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -24.63, _1080p * 180.38, _1080p * -12.72, _1080p * 101.28 )
	self:addElement( questWOR3Widget )
	self.questWOR3Widget = questWOR3Widget
	
	local questWOR4Widget = nil
	
	questWOR4Widget = MenuBuilder.BuildRegisteredType( "questWOR4Widget", {
		controllerIndex = f1_local1
	} )
	questWOR4Widget.id = "questWOR4Widget"
	questWOR4Widget:SetAlpha( 0, 0 )
	questWOR4Widget:SetScale( -0.25, 0 )
	questWOR4Widget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -24.63, _1080p * 180.38, _1080p * -12.72, _1080p * 101.28 )
	self:addElement( questWOR4Widget )
	self.questWOR4Widget = questWOR4Widget
	
	local questSetiComWidget = nil
	
	questSetiComWidget = MenuBuilder.BuildRegisteredType( "questSetiComWidget", {
		controllerIndex = f1_local1
	} )
	questSetiComWidget.id = "questSetiComWidget"
	questSetiComWidget:SetAlpha( 0, 0 )
	questSetiComWidget:SetScale( -0.25, 0 )
	questSetiComWidget:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 198, _1080p * -38.5, _1080p * 214.5 )
	self:addElement( questSetiComWidget )
	self.questSetiComWidget = questSetiComWidget
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		questArkWidget:RegisterAnimationSequence( "ArkPieceFound", {
			{
				function ()
					return self.questArkWidget:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questArkWidget:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questArkWidget:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.questArkWidget:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.ArkPieceFound = function ()
			questArkWidget:AnimateSequence( "ArkPieceFound" )
		end
		
		questRobotWidget:RegisterAnimationSequence( "robotPieceFound", {
			{
				function ()
					return self.questRobotWidget:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questRobotWidget:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questRobotWidget:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.questRobotWidget:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.robotPieceFound = function ()
			questRobotWidget:AnimateSequence( "robotPieceFound" )
		end
		
		questTooth:RegisterAnimationSequence( "questToothFound", {
			{
				function ()
					return self.questTooth:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questTooth:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questTooth:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.questTooth:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.questToothFound = function ()
			questTooth:AnimateSequence( "questToothFound" )
		end
		
		questWOR1Widget:RegisterAnimationSequence( "WOR1PieceFound", {
			{
				function ()
					return self.questWOR1Widget:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questWOR1Widget:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questWOR1Widget:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.questWOR1Widget:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.WOR1PieceFound = function ()
			questWOR1Widget:AnimateSequence( "WOR1PieceFound" )
		end
		
		questRecorderWidget:RegisterAnimationSequence( "recorderPieceFound", {
			{
				function ()
					return self.questRecorderWidget:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questRecorderWidget:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questRecorderWidget:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.questRecorderWidget:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.recorderPieceFound = function ()
			questRecorderWidget:AnimateSequence( "recorderPieceFound" )
		end
		
		questWOR2Widget:RegisterAnimationSequence( "WOR2PieceFound", {
			{
				function ()
					return self.questWOR2Widget:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questWOR2Widget:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questWOR2Widget:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.questWOR2Widget:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.WOR2PieceFound = function ()
			questWOR2Widget:AnimateSequence( "WOR2PieceFound" )
		end
		
		questWOR3Widget:RegisterAnimationSequence( "WOR3PieceFound", {
			{
				function ()
					return self.questWOR3Widget:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questWOR3Widget:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questWOR3Widget:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.questWOR3Widget:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.WOR3PieceFound = function ()
			questWOR3Widget:AnimateSequence( "WOR3PieceFound" )
		end
		
		questWOR4Widget:RegisterAnimationSequence( "WOR4PieceFound", {
			{
				function ()
					return self.questWOR4Widget:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questWOR4Widget:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questWOR4Widget:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.questWOR4Widget:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.WOR4PieceFound = function ()
			questWOR4Widget:AnimateSequence( "WOR4PieceFound" )
		end
		
		questSetiComWidget:RegisterAnimationSequence( "SetiComFound", {
			{
				function ()
					return self.questSetiComWidget:SetAlpha( 0, 0 )
				end,
				function ()
					return self.questSetiComWidget:SetAlpha( 1, 150 )
				end,
				function ()
					return self.questSetiComWidget:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.questSetiComWidget:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.SetiComFound = function ()
			questSetiComWidget:AnimateSequence( "SetiComFound" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	questRobotWidget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "robotPieceFound" )
		end
	end )
	questRobotWidget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "robotPieceFound" )
		end
	end )
	questRobotWidget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "robotPieceFound" )
		end
	end )
	questArkWidget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ArkPieceFound" )
		end
	end )
	questArkWidget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ArkPieceFound" )
		end
	end )
	questArkWidget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ArkPieceFound" )
		end
	end )
	questArkWidget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ArkPieceFound" )
		end
	end )
	questArkWidget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ArkPieceFound" )
		end
	end )
	questTooth:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questToothAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questToothAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questToothAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "questToothFound" )
		end
	end )
	questWOR1Widget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "WOR1PieceFound" )
		end
	end )
	questWOR1Widget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "WOR1PieceFound" )
		end
	end )
	questWOR1Widget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "WOR1PieceFound" )
		end
	end )
	questRecorderWidget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "recorderPieceFound" )
		end
	end )
	questRecorderWidget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "recorderPieceFound" )
		end
	end )
	questRecorderWidget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "recorderPieceFound" )
		end
	end )
	questWOR2Widget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "WOR2PieceFound" )
		end
	end )
	questWOR2Widget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "WOR2PieceFound" )
		end
	end )
	questWOR2Widget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "WOR2PieceFound" )
		end
	end )
	questWOR3Widget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "WOR3PieceFound" )
		end
	end )
	questWOR3Widget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "WOR3PieceFound" )
		end
	end )
	questWOR3Widget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "WOR3PieceFound" )
		end
	end )
	questWOR4Widget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "WOR4PieceFound" )
		end
	end )
	questWOR4Widget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "WOR4PieceFound" )
		end
	end )
	questWOR4Widget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "WOR4PieceFound" )
		end
	end )
	questSetiComWidget:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questSetiComAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questSetiComAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questSetiComAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "SetiComFound" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questFullScreenSplash", questFullScreenSplash )
LockTable( _M )
