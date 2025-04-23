local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questMemory3( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 209 * _1080p, 0, 255 * _1080p )
	self.id = "questMemory3"
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
	pictureBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -23.5, _1080p * 232.5, _1080p * 1, _1080p * 257 )
	self:addElement( pictureBacking )
	self.pictureBacking = pictureBacking
	
	local battery = nil
	
	battery = LUI.UIImage.new()
	battery.id = "battery"
	battery:SetZRotation( -19, 0 )
	battery:setImage( RegisterMaterial( "cp_zmb_sticker_battery" ), 0 )
	battery:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 74, _1080p * 202 )
	battery:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( battery )
	self.battery = battery
	
	local disco = nil
	
	disco = LUI.UIImage.new()
	disco.id = "disco"
	disco:setImage( RegisterMaterial( "cp_zmb_sticker_discoball" ), 0 )
	disco:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 44.47, _1080p * 172.47, _1080p * 1, _1080p * 129 )
	disco:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( disco )
	self.disco = disco
	
	local crystal = nil
	
	crystal = LUI.UIImage.new()
	crystal.id = "crystal"
	crystal:SetZRotation( 15, 0 )
	crystal:setImage( RegisterMaterial( "cp_zmb_sticker_crystal_green" ), 0 )
	crystal:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 92.47, _1080p * 220.47, _1080p * 82, _1080p * 210 )
	crystal:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetModel( f1_local1 ) )
	self:addElement( crystal )
	self.crystal = crystal
	
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
		
		disco:RegisterAnimationSequence( "foundPart1", {
			{
				function ()
					return self.disco:SetScale( 0, 0 )
				end,
				function ()
					return self.disco:SetScale( 0.5, 200 )
				end,
				function ()
					return self.disco:SetScale( 0, 200 )
				end,
				function ()
					return self.disco:SetScale( 0.25, 210 )
				end,
				function ()
					return self.disco:SetScale( 0, 190 )
				end,
				function ()
					return self.disco:SetScale( 0.13, 200 )
				end,
				function ()
					return self.disco:SetScale( -0.25, 200 )
				end
			}
		} )
		self._sequences.foundPart1 = function ()
			disco:AnimateSequence( "foundPart1" )
		end
		
		battery:RegisterAnimationSequence( "foundPart2", {
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
		self._sequences.foundPart2 = function ()
			battery:AnimateSequence( "foundPart2" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart3" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart2" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundPart1" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questMemory3", questMemory3 )
LockTable( _M )
