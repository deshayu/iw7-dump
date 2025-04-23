local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questHarpoonDLC1( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 213 * _1080p, 0, 254 * _1080p )
	self.id = "questHarpoonDLC1"
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
	pictureBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -22, _1080p * 234, _1080p * -1, _1080p * 255 )
	self:addElement( pictureBacking )
	self.pictureBacking = pictureBacking
	
	local boatBackground = nil
	
	boatBackground = LUI.UIImage.new()
	boatBackground.id = "boatBackground"
	boatBackground:setImage( RegisterMaterial( "zm_polaroid_harpoon_bg" ), 0 )
	boatBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -23, _1080p * 233, 0, _1080p * 256 )
	self:addElement( boatBackground )
	self.boatBackground = boatBackground
	
	local harpoonLock1 = nil
	
	harpoonLock1 = LUI.UIImage.new()
	harpoonLock1.id = "harpoonLock1"
	harpoonLock1:setImage( RegisterMaterial( "zm_polaroid_harpoon_chain_1" ), 0 )
	harpoonLock1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 134, _1080p * 81, _1080p * 209 )
	harpoonLock1:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.harpoonLock1Alpha:GetModel( f1_local1 ) )
	self:addElement( harpoonLock1 )
	self.harpoonLock1 = harpoonLock1
	
	local harpoonLock2 = nil
	
	harpoonLock2 = LUI.UIImage.new()
	harpoonLock2.id = "harpoonLock2"
	harpoonLock2:setImage( RegisterMaterial( "zm_polaroid_harpoon_chain_2" ), 0 )
	harpoonLock2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 80, _1080p * 208, _1080p * 81, _1080p * 205 )
	harpoonLock2:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.harpoonLock2Alpha:GetModel( f1_local1 ) )
	self:addElement( harpoonLock2 )
	self.harpoonLock2 = harpoonLock2
	
	local harpoonLock3 = nil
	
	harpoonLock3 = LUI.UIImage.new()
	harpoonLock3.id = "harpoonLock3"
	harpoonLock3:setImage( RegisterMaterial( "zm_polaroid_harpoon_chain_3" ), 0 )
	harpoonLock3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -23, _1080p * 233, _1080p * 98, _1080p * 226 )
	harpoonLock3:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.harpoonLock3Alpha:GetModel( f1_local1 ) )
	self:addElement( harpoonLock3 )
	self.harpoonLock3 = harpoonLock3
	
	local wolf1 = nil
	
	wolf1 = LUI.UIImage.new()
	wolf1.id = "wolf1"
	wolf1:setImage( RegisterMaterial( "zm_polaroid_harpoon_wolf" ), 0 )
	wolf1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 144.02, _1080p * 208.02, _1080p * 22.96, _1080p * 86.96 )
	wolf1:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( wolf1 )
	self.wolf1 = wolf1
	
	local owl1 = nil
	
	owl1 = LUI.UIImage.new()
	owl1.id = "owl1"
	owl1:setImage( RegisterMaterial( "zm_polaroid_harpoon_owl" ), 0 )
	owl1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 112.02, _1080p * 144.02, _1080p * 25.96, _1080p * 89.96 )
	owl1:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( owl1 )
	self.owl1 = owl1
	
	local deer1 = nil
	
	deer1 = LUI.UIImage.new()
	deer1.id = "deer1"
	deer1:setImage( RegisterMaterial( "zm_polaroid_harpoon_deer" ), 0 )
	deer1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 41, _1080p * 105, _1080p * 29, _1080p * 93 )
	deer1:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetModel( f1_local1 ) )
	self:addElement( deer1 )
	self.deer1 = deer1
	
	local eagle1 = nil
	
	eagle1 = LUI.UIImage.new()
	eagle1.id = "eagle1"
	eagle1:setImage( RegisterMaterial( "zm_polaroid_harpoon_eagle" ), 0 )
	eagle1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11.5, _1080p * 43.5, _1080p * 34, _1080p * 98 )
	eagle1:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetModel( f1_local1 ) )
	self:addElement( eagle1 )
	self.eagle1 = eagle1
	
	local bloodyPrint = nil
	
	bloodyPrint = LUI.UIImage.new()
	bloodyPrint.id = "bloodyPrint"
	bloodyPrint:SetZRotation( -23, 0 )
	bloodyPrint:setImage( RegisterMaterial( "zm_polaroid_bloody_finger_print" ), 0 )
	bloodyPrint:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 36.5, _1080p * 164.5, _1080p * 122, _1080p * 250 )
	bloodyPrint:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.harpoonQuestCompleteAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( bloodyPrint )
	self.bloodyPrint = bloodyPrint
	
	local lock1 = nil
	
	lock1 = LUI.UIImage.new()
	lock1.id = "lock1"
	lock1:SetScale( -0.5, 0 )
	lock1:setImage( RegisterMaterial( "zm_polaroid_harpoon_lock" ), 0 )
	lock1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19.5, _1080p * 83.5, _1080p * 129, _1080p * 193 )
	lock1:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.harpoonLock1Alpha:GetModel( f1_local1 ) )
	self:addElement( lock1 )
	self.lock1 = lock1
	
	local lock2 = nil
	
	lock2 = LUI.UIImage.new()
	lock2.id = "lock2"
	lock2:SetScale( -0.5, 0 )
	lock2:setImage( RegisterMaterial( "zm_polaroid_harpoon_lock" ), 0 )
	lock2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 128, _1080p * 192, _1080p * 137, _1080p * 201 )
	lock2:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.harpoonLock2Alpha:GetModel( f1_local1 ) )
	self:addElement( lock2 )
	self.lock2 = lock2
	
	local lock3 = nil
	
	lock3 = LUI.UIImage.new()
	lock3.id = "lock3"
	lock3:SetScale( -0.5, 0 )
	lock3:setImage( RegisterMaterial( "zm_polaroid_harpoon_lock" ), 0 )
	lock3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 73, _1080p * 137, _1080p * 145, _1080p * 209 )
	lock3:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.harpoonLock3Alpha:GetModel( f1_local1 ) )
	self:addElement( lock3 )
	self.lock3 = lock3
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		harpoonLock1:RegisterAnimationSequence( "frontPartFound", {
			{
				function ()
					return self.harpoonLock1:SetScale( 0, 0 )
				end,
				function ()
					return self.harpoonLock1:SetScale( 0.5, 250 )
				end,
				function ()
					return self.harpoonLock1:SetScale( 0, 250 )
				end,
				function ()
					return self.harpoonLock1:SetScale( 0.4, 250 )
				end,
				function ()
					return self.harpoonLock1:SetScale( 0, 250 )
				end,
				function ()
					return self.harpoonLock1:SetScale( 0.2, 250 )
				end,
				function ()
					return self.harpoonLock1:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.frontPartFound = function ()
			harpoonLock1:AnimateSequence( "frontPartFound" )
		end
		
		harpoonLock2:RegisterAnimationSequence( "middlePartFound", {
			{
				function ()
					return self.harpoonLock2:SetScale( 0, 0 )
				end,
				function ()
					return self.harpoonLock2:SetScale( 0.5, 250 )
				end,
				function ()
					return self.harpoonLock2:SetScale( 0, 250 )
				end,
				function ()
					return self.harpoonLock2:SetScale( 0.4, 250 )
				end,
				function ()
					return self.harpoonLock2:SetScale( 0, 250 )
				end,
				function ()
					return self.harpoonLock2:SetScale( 0.2, 250 )
				end,
				function ()
					return self.harpoonLock2:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.middlePartFound = function ()
			harpoonLock2:AnimateSequence( "middlePartFound" )
		end
		
		harpoonLock3:RegisterAnimationSequence( "backPartFound", {
			{
				function ()
					return self.harpoonLock3:SetScale( 0, 0 )
				end,
				function ()
					return self.harpoonLock3:SetScale( 0.5, 250 )
				end,
				function ()
					return self.harpoonLock3:SetScale( 0, 250 )
				end,
				function ()
					return self.harpoonLock3:SetScale( 0.4, 250 )
				end,
				function ()
					return self.harpoonLock3:SetScale( 0, 250 )
				end,
				function ()
					return self.harpoonLock3:SetScale( 0.2, 250 )
				end,
				function ()
					return self.harpoonLock3:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.backPartFound = function ()
			harpoonLock3:AnimateSequence( "backPartFound" )
		end
		
		eagle1:RegisterAnimationSequence( "eaglePartFound", {
			{
				function ()
					return self.eagle1:SetScale( 0, 0 )
				end,
				function ()
					return self.eagle1:SetScale( 0.5, 250 )
				end,
				function ()
					return self.eagle1:SetScale( 0, 250 )
				end,
				function ()
					return self.eagle1:SetScale( 0.4, 250 )
				end,
				function ()
					return self.eagle1:SetScale( 0, 250 )
				end,
				function ()
					return self.eagle1:SetScale( 0.2, 250 )
				end,
				function ()
					return self.eagle1:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.eaglePartFound = function ()
			eagle1:AnimateSequence( "eaglePartFound" )
		end
		
		deer1:RegisterAnimationSequence( "deerPartFound", {
			{
				function ()
					return self.deer1:SetScale( 0, 0 )
				end,
				function ()
					return self.deer1:SetScale( 0.5, 250 )
				end,
				function ()
					return self.deer1:SetScale( 0, 250 )
				end,
				function ()
					return self.deer1:SetScale( 0.4, 250 )
				end,
				function ()
					return self.deer1:SetScale( 0, 250 )
				end,
				function ()
					return self.deer1:SetScale( 0.2, 250 )
				end,
				function ()
					return self.deer1:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.deerPartFound = function ()
			deer1:AnimateSequence( "deerPartFound" )
		end
		
		owl1:RegisterAnimationSequence( "owlPartFound", {
			{
				function ()
					return self.owl1:SetScale( 0, 0 )
				end,
				function ()
					return self.owl1:SetScale( 0.5, 250 )
				end,
				function ()
					return self.owl1:SetScale( 0, 250 )
				end,
				function ()
					return self.owl1:SetScale( 0.4, 250 )
				end,
				function ()
					return self.owl1:SetScale( 0, 250 )
				end,
				function ()
					return self.owl1:SetScale( 0.2, 250 )
				end,
				function ()
					return self.owl1:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.owlPartFound = function ()
			owl1:AnimateSequence( "owlPartFound" )
		end
		
		wolf1:RegisterAnimationSequence( "wolfPartFound", {
			{
				function ()
					return self.wolf1:SetScale( 0, 0 )
				end,
				function ()
					return self.wolf1:SetScale( 0.4, 250 )
				end,
				function ()
					return self.wolf1:SetScale( 0, 250 )
				end,
				function ()
					return self.wolf1:SetScale( 0.4, 250 )
				end,
				function ()
					return self.wolf1:SetScale( 0, 250 )
				end,
				function ()
					return self.wolf1:SetScale( 0.2, 250 )
				end,
				function ()
					return self.wolf1:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.wolfPartFound = function ()
			wolf1:AnimateSequence( "wolfPartFound" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "eaglePartFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "frontPartFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "deerPartFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "middlePartFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkRedAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "backPartFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "owlPartFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "wolfPartFound" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questHarpoonDLC1", questHarpoonDLC1 )
LockTable( _M )
