local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questMemory4( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 209 * _1080p, 0, 255 * _1080p )
	self.id = "questMemory4"
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
	pictureBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -24, _1080p * 232, 0, _1080p * 256 )
	self:addElement( pictureBacking )
	self.pictureBacking = pictureBacking
	
	local crystal = nil
	
	crystal = LUI.UIImage.new()
	crystal.id = "crystal"
	crystal:SetZRotation( 10, 0 )
	crystal:setImage( RegisterMaterial( "cp_zmb_sticker_crystal_red" ), 0 )
	crystal:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88.5, _1080p * 216.5, _1080p * 77, _1080p * 205 )
	crystal:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetModel( f1_local1 ) )
	self:addElement( crystal )
	self.crystal = crystal
	
	local angryMike = nil
	
	angryMike = LUI.UIImage.new()
	angryMike.id = "angryMike"
	angryMike:SetZRotation( -25, 0 )
	angryMike:setImage( RegisterMaterial( "cp_zmb_sticker_angry_mike" ), 0 )
	angryMike:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 55, _1080p * 183, _1080p * 5, _1080p * 133 )
	angryMike:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( angryMike )
	self.angryMike = angryMike
	
	local battery = nil
	
	battery = LUI.UIImage.new()
	battery.id = "battery"
	battery:SetZRotation( 23, 0 )
	battery:setImage( RegisterMaterial( "cp_zmb_sticker_battery" ), 0 )
	battery:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 129, _1080p * 72, _1080p * 200 )
	battery:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( battery )
	self.battery = battery
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		crystal:RegisterAnimationSequence( "foundPart3", {
			{
				function ()
					return self.crystal:SetScale( 0, 0 )
				end,
				function ()
					return self.crystal:SetScale( 0.5, 200 )
				end,
				function ()
					return self.crystal:SetScale( 0, 200 )
				end,
				function ()
					return self.crystal:SetScale( 0.25, 200 )
				end,
				function ()
					return self.crystal:SetScale( 0, 200 )
				end,
				function ()
					return self.crystal:SetScale( 0.13, 200 )
				end,
				function ()
					return self.crystal:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundPart3 = function ()
			crystal:AnimateSequence( "foundPart3" )
		end
		
		battery:RegisterAnimationSequence( "foundPart1", {
			{
				function ()
					return self.battery:SetScale( 0, 0 )
				end,
				function ()
					return self.battery:SetScale( 0.5, 200 )
				end,
				function ()
					return self.battery:SetScale( 0, 200 )
				end,
				function ()
					return self.battery:SetScale( 0.25, 200 )
				end,
				function ()
					return self.battery:SetScale( 0, 200 )
				end,
				function ()
					return self.battery:SetScale( 0.13, 200 )
				end,
				function ()
					return self.battery:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundPart1 = function ()
			battery:AnimateSequence( "foundPart1" )
		end
		
		angryMike:RegisterAnimationSequence( "foundPart2", {
			{
				function ()
					return self.angryMike:SetScale( 0.2, 0 )
				end,
				function ()
					return self.angryMike:SetScale( 0.6, 200 )
				end,
				function ()
					return self.angryMike:SetScale( 0.2, 200 )
				end,
				function ()
					return self.angryMike:SetScale( 0.45, 200 )
				end,
				function ()
					return self.angryMike:SetScale( 0.2, 200 )
				end,
				function ()
					return self.angryMike:SetScale( 0.3, 200 )
				end,
				function ()
					return self.angryMike:SetScale( 0.2, 200 )
				end
			}
		} )
		self._sequences.foundPart2 = function ()
			angryMike:AnimateSequence( "foundPart2" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart3" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart2" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart1" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questMemory4", questMemory4 )
LockTable( _M )
