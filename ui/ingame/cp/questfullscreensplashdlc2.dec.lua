local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questFullScreenSplashDLC2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "questFullScreenSplashDLC2"
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
	
	local questHeartDLC2 = nil
	
	questHeartDLC2 = MenuBuilder.BuildRegisteredType( "questHeartDLC2", {
		controllerIndex = f1_local1
	} )
	questHeartDLC2.id = "questHeartDLC2"
	questHeartDLC2:SetAlpha( 0, 0 )
	questHeartDLC2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 172, _1080p * 380, _1080p * 241, _1080p * 492 )
	self:addElement( questHeartDLC2 )
	self.questHeartDLC2 = questHeartDLC2
	
	local questBrainDLC2 = nil
	
	questBrainDLC2 = MenuBuilder.BuildRegisteredType( "questBrainDLC2", {
		controllerIndex = f1_local1
	} )
	questBrainDLC2.id = "questBrainDLC2"
	questBrainDLC2:SetAlpha( 0, 0 )
	questBrainDLC2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 171, _1080p * 384, _1080p * 241, _1080p * 495 )
	self:addElement( questBrainDLC2 )
	self.questBrainDLC2 = questBrainDLC2
	
	local questPapDLC2 = nil
	
	questPapDLC2 = MenuBuilder.BuildRegisteredType( "questPAPDLC2", {
		controllerIndex = f1_local1
	} )
	questPapDLC2.id = "questPapDLC2"
	questPapDLC2:SetAlpha( 0, 0 )
	questPapDLC2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173, _1080p * 382, _1080p * 237, _1080p * 492 )
	self:addElement( questPapDLC2 )
	self.questPapDLC2 = questPapDLC2
	
	local questEyeDLC2 = nil
	
	questEyeDLC2 = MenuBuilder.BuildRegisteredType( "questEyeDLC2", {
		controllerIndex = f1_local1
	} )
	questEyeDLC2.id = "questEyeDLC2"
	questEyeDLC2:SetAlpha( 0, 0 )
	questEyeDLC2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 172, _1080p * 381, _1080p * 237, _1080p * 492 )
	self:addElement( questEyeDLC2 )
	self.questEyeDLC2 = questEyeDLC2
	
	local inventoryBottomDLC2 = nil
	
	inventoryBottomDLC2 = MenuBuilder.BuildRegisteredType( "inventoryBottomDLC2", {
		controllerIndex = f1_local1
	} )
	inventoryBottomDLC2.id = "inventoryBottomDLC2"
	inventoryBottomDLC2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 630.5, _1080p * 1110.5 )
	self:addElement( inventoryBottomDLC2 )
	self.inventoryBottomDLC2 = inventoryBottomDLC2
	
	self._animationSets.DefaultAnimationSet = function ()
		inventoryBottomDLC2:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.inventoryBottomDLC2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			inventoryBottomDLC2:AnimateSequence( "DefaultSequence" )
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
		inventoryBottomDLC2:RegisterAnimationSequence( "pieceFound", {
			{
				function ()
					return self.inventoryBottomDLC2.inventoryBacking:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.inventoryBottomDLC2.chiTree:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.inventoryBottomDLC2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.inventoryBottomDLC2:SetAlpha( 1, 150 )
				end,
				function ()
					return self.inventoryBottomDLC2:SetAlpha( 1, 1450 )
				end,
				function ()
					return self.inventoryBottomDLC2:SetAlpha( 0, 180 )
				end
			}
		} )
		self._sequences.pieceFound = function ()
			white:AnimateSequence( "pieceFound" )
			inventoryBottomDLC2:AnimateSequence( "pieceFound" )
		end
		
		inventoryBottomDLC2:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.inventoryBottomDLC2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.inventoryBottomDLC2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 651.5, _1080p * 1131.5, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			inventoryBottomDLC2:AnimateSequence( "Splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	questHeartDLC2:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	questHeartDLC2:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	questBrainDLC2:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	questBrainDLC2:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	questPapDLC2:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	questPapDLC2:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	questPapDLC2:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	questEyeDLC2:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	questEyeDLC2:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pieceFound" )
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "questFullScreenSplashDLC2", questFullScreenSplashDLC2 )
LockTable( _M )
