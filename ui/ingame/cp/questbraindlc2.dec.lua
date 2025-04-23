local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questBrainDLC2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 213 * _1080p, 0, 254 * _1080p )
	self.id = "questBrainDLC2"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local newspaper = nil
	
	newspaper = LUI.UIImage.new()
	newspaper.id = "newspaper"
	newspaper:setImage( RegisterMaterial( "cp_disco_inventory_newspaper_bg" ), 0 )
	newspaper:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1024, _1080p * -257, _1080p * 254 )
	self:addElement( newspaper )
	self.newspaper = newspaper
	
	local brain = nil
	
	brain = LUI.UIImage.new()
	brain.id = "brain"
	brain:setImage( RegisterMaterial( "cp_disco_inventory_brain" ), 0 )
	brain:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 606.02, _1080p * 734.02, _1080p * 85, _1080p * 213 )
	brain:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( brain )
	self.brain = brain
	
	local poster = nil
	
	poster = LUI.UIImage.new()
	poster.id = "poster"
	poster:setImage( RegisterMaterial( "cp_disco_inventory_poster" ), 0 )
	poster:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 533.02, _1080p * 661.02, _1080p * 82, _1080p * 210 )
	poster:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( poster )
	self.poster = poster
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		poster:RegisterAnimationSequence( "pipeFound", {
			{
				function ()
					return self.poster:SetScale( 0, 0 )
				end,
				function ()
					return self.poster:SetScale( 0.5, 250 )
				end,
				function ()
					return self.poster:SetScale( 0, 250 )
				end,
				function ()
					return self.poster:SetScale( 0.4, 250 )
				end,
				function ()
					return self.poster:SetScale( 0, 250 )
				end,
				function ()
					return self.poster:SetScale( 0.2, 250 )
				end,
				function ()
					return self.poster:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.pipeFound = function ()
			poster:AnimateSequence( "pipeFound" )
		end
		
		brain:RegisterAnimationSequence( "brainFound", {
			{
				function ()
					return self.brain:SetScale( 0, 0 )
				end,
				function ()
					return self.brain:SetScale( 0.4, 250 )
				end,
				function ()
					return self.brain:SetScale( 0, 250 )
				end,
				function ()
					return self.brain:SetScale( 0.4, 250 )
				end,
				function ()
					return self.brain:SetScale( 0, 250 )
				end,
				function ()
					return self.brain:SetScale( 0.2, 250 )
				end,
				function ()
					return self.brain:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.brainFound = function ()
			brain:AnimateSequence( "brainFound" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "pipeFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "brainFound" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questBrainDLC2", questBrainDLC2 )
LockTable( _M )
