local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questMemory5( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 209 * _1080p, 0, 255 * _1080p )
	self.id = "questMemory5"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local pictureBacking = nil
	
	pictureBacking = LUI.UIImage.new()
	pictureBacking.id = "pictureBacking"
	pictureBacking:setImage( RegisterMaterial( "zm_dlc1_inventory_polaroid" ), 0 )
	pictureBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -22.37, _1080p * 233.63, _1080p * 0.66, _1080p * 256.66 )
	self:addElement( pictureBacking )
	self.pictureBacking = pictureBacking
	
	local Calculator = nil
	
	Calculator = LUI.UIImage.new()
	Calculator.id = "Calculator"
	Calculator:setImage( RegisterMaterial( "cp_zmb_sticker_calculator" ), 0 )
	Calculator:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -12.37, _1080p * 115.63, _1080p * 77.46, _1080p * 205.46 )
	Calculator:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetModel( f1_local1 ) )
	self:addElement( Calculator )
	self.Calculator = Calculator
	
	local Radio = nil
	
	Radio = LUI.UIImage.new()
	Radio.id = "Radio"
	Radio:SetScale( 0.2, 0 )
	Radio:setImage( RegisterMaterial( "cp_zmb_sticker_radio" ), 0 )
	Radio:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.24, _1080p * 153.24, _1080p * 13.46, _1080p * 141.46 )
	Radio:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetModel( f1_local1 ) )
	self:addElement( Radio )
	self.Radio = Radio
	
	local Umbrella = nil
	
	Umbrella = LUI.UIImage.new()
	Umbrella.id = "Umbrella"
	Umbrella:setImage( RegisterMaterial( "cp_zmb_sticker_umbrella" ), 0 )
	Umbrella:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 69, _1080p * 197, _1080p * 87.66, _1080p * 215.66 )
	Umbrella:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetModel( f1_local1 ) )
	self:addElement( Umbrella )
	self.Umbrella = Umbrella
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Calculator:RegisterAnimationSequence( "Part1", {
			{
				function ()
					return self.Calculator:SetScale( 0, 350 )
				end,
				function ()
					return self.Calculator:SetScale( 0.5, 200 )
				end,
				function ()
					return self.Calculator:SetScale( 0, 200 )
				end,
				function ()
					return self.Calculator:SetScale( 0.25, 200 )
				end,
				function ()
					return self.Calculator:SetScale( 0, 200 )
				end,
				function ()
					return self.Calculator:SetScale( 0.13, 200 )
				end,
				function ()
					return self.Calculator:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.Part1 = function ()
			Calculator:AnimateSequence( "Part1" )
		end
		
		Radio:RegisterAnimationSequence( "Part2", {
			{
				function ()
					return self.Radio:SetScale( 0.2, 350 )
				end,
				function ()
					return self.Radio:SetScale( 0.6, 200 )
				end,
				function ()
					return self.Radio:SetScale( 0.2, 200 )
				end,
				function ()
					return self.Radio:SetScale( 0.45, 200 )
				end,
				function ()
					return self.Radio:SetScale( 0.2, 200 )
				end,
				function ()
					return self.Radio:SetScale( 0.3, 200 )
				end,
				function ()
					return self.Radio:SetScale( 0.2, 200 )
				end
			}
		} )
		self._sequences.Part2 = function ()
			Radio:AnimateSequence( "Part2" )
		end
		
		Umbrella:RegisterAnimationSequence( "Part3", {
			{
				function ()
					return self.Umbrella:SetScale( 0, 350 )
				end,
				function ()
					return self.Umbrella:SetScale( 0.5, 200 )
				end,
				function ()
					return self.Umbrella:SetScale( 0, 200 )
				end,
				function ()
					return self.Umbrella:SetScale( 0.25, 200 )
				end,
				function ()
					return self.Umbrella:SetScale( 0, 200 )
				end,
				function ()
					return self.Umbrella:SetScale( 0.13, 200 )
				end,
				function ()
					return self.Umbrella:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.Part3 = function ()
			Umbrella:AnimateSequence( "Part3" )
		end
		
		self._sequences.questComplete = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Part1" )
		end
		if DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "questComplete" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Part2" )
		end
		if DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "questComplete" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Part3" )
		end
		if DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "questComplete" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questMemory5", questMemory5 )
LockTable( _M )
