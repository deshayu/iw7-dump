local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questMemory2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 209 * _1080p, 0, 255 * _1080p )
	self.id = "questMemory2"
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
	pictureBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -24, _1080p * 232, _1080p * 1.95, _1080p * 257.95 )
	self:addElement( pictureBacking )
	self.pictureBacking = pictureBacking
	
	local background = nil
	
	background = LUI.UIImage.new()
	background.id = "background"
	background:setImage( RegisterMaterial( "zm_polaroid_jay_bg" ), 0 )
	background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -23.5, _1080p * 232.5, _1080p * 1.95, _1080p * 257.95 )
	self:addElement( background )
	self.background = background
	
	local skull = nil
	
	skull = LUI.UIImage.new()
	skull.id = "skull"
	skull:setImage( RegisterMaterial( "zm_polaroid_jay_skull" ), 0 )
	skull:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 49.1, _1080p * 177.1, _1080p * 21, _1080p * 149 )
	skull:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetModel( f1_local1 ) )
	self:addElement( skull )
	self.skull = skull
	
	local bobScratch = nil
	
	bobScratch = LUI.UIImage.new()
	bobScratch.id = "bobScratch"
	bobScratch:setImage( RegisterMaterial( "zm_polaroid_jay_bob_scratch" ), 0 )
	bobScratch:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 120, _1080p * 82, _1080p * 210 )
	bobScratch:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( bobScratch )
	self.bobScratch = bobScratch
	
	local bob = nil
	
	bob = LUI.UIImage.new()
	bob.id = "bob"
	bob:setImage( RegisterMaterial( "zm_polaroid_jay_bob" ), 0 )
	bob:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 120, _1080p * 82, _1080p * 210 )
	bob:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( bob )
	self.bob = bob
	
	local jayScratch = nil
	
	jayScratch = LUI.UIImage.new()
	jayScratch.id = "jayScratch"
	jayScratch:setImage( RegisterMaterial( "zm_polaroid_jay_scratch" ), 0 )
	jayScratch:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88, _1080p * 216, _1080p * 85, _1080p * 213 )
	jayScratch:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( jayScratch )
	self.jayScratch = jayScratch
	
	local jay = nil
	
	jay = LUI.UIImage.new()
	jay.id = "jay"
	jay:setImage( RegisterMaterial( "zm_polaroid_jay" ), 0 )
	jay:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88, _1080p * 216, _1080p * 85, _1080p * 213 )
	jay:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( jay )
	self.jay = jay
	
	local bloodyPrint = nil
	
	bloodyPrint = LUI.UIImage.new()
	bloodyPrint.id = "bloodyPrint"
	bloodyPrint:SetZRotation( -63, 0 )
	bloodyPrint:setImage( RegisterMaterial( "zm_polaroid_bloody_finger_print" ), 0 )
	bloodyPrint:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40, _1080p * 168, _1080p * 121, _1080p * 249 )
	bloodyPrint:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.jayQuestCompleteAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( bloodyPrint )
	self.bloodyPrint = bloodyPrint
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		skull:RegisterAnimationSequence( "foundSkull", {
			{
				function ()
					return self.skull:SetScale( 0, 0 )
				end,
				function ()
					return self.skull:SetScale( 0.5, 200 )
				end,
				function ()
					return self.skull:SetScale( 0, 200 )
				end,
				function ()
					return self.skull:SetScale( 0.25, 200 )
				end,
				function ()
					return self.skull:SetScale( 0, 200 )
				end,
				function ()
					return self.skull:SetScale( 0.13, 200 )
				end,
				function ()
					return self.skull:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundSkull = function ()
			skull:AnimateSequence( "foundSkull" )
		end
		
		jayScratch:RegisterAnimationSequence( "foundJayScratch", {
			{
				function ()
					return self.jayScratch:SetScale( 0, 0 )
				end,
				function ()
					return self.jayScratch:SetScale( 0.5, 200 )
				end,
				function ()
					return self.jayScratch:SetScale( 0, 200 )
				end,
				function ()
					return self.jayScratch:SetScale( 0.25, 200 )
				end,
				function ()
					return self.jayScratch:SetScale( 0, 200 )
				end,
				function ()
					return self.jayScratch:SetScale( 0.13, 200 )
				end,
				function ()
					return self.jayScratch:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundJayScratch = function ()
			jayScratch:AnimateSequence( "foundJayScratch" )
		end
		
		bobScratch:RegisterAnimationSequence( "foundBobScratch", {
			{
				function ()
					return self.bobScratch:SetScale( 0, 0 )
				end,
				function ()
					return self.bobScratch:SetScale( 0.5, 200 )
				end,
				function ()
					return self.bobScratch:SetScale( 0, 200 )
				end,
				function ()
					return self.bobScratch:SetScale( 0.25, 200 )
				end,
				function ()
					return self.bobScratch:SetScale( 0, 200 )
				end,
				function ()
					return self.bobScratch:SetScale( 0.13, 200 )
				end,
				function ()
					return self.bobScratch:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundBobScratch = function ()
			bobScratch:AnimateSequence( "foundBobScratch" )
		end
		
		bob:RegisterAnimationSequence( "foundBob", {
			{
				function ()
					return self.bob:SetScale( 0, 0 )
				end,
				function ()
					return self.bob:SetScale( 0.5, 200 )
				end,
				function ()
					return self.bob:SetScale( 0, 200 )
				end,
				function ()
					return self.bob:SetScale( 0.25, 200 )
				end,
				function ()
					return self.bob:SetScale( 0, 200 )
				end,
				function ()
					return self.bob:SetScale( 0.13, 200 )
				end,
				function ()
					return self.bob:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundBob = function ()
			bob:AnimateSequence( "foundBob" )
		end
		
		jay:RegisterAnimationSequence( "foundJay", {
			{
				function ()
					return self.jay:SetScale( 0, 0 )
				end,
				function ()
					return self.jay:SetScale( 0.5, 200 )
				end,
				function ()
					return self.jay:SetScale( 0, 200 )
				end,
				function ()
					return self.jay:SetScale( 0.25, 200 )
				end,
				function ()
					return self.jay:SetScale( 0, 200 )
				end,
				function ()
					return self.jay:SetScale( 0.13, 200 )
				end,
				function ()
					return self.jay:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundJay = function ()
			jay:AnimateSequence( "foundJay" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundSkull" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundBobScratch" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundJayScratch" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundJay" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundBob" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questMemory2", questMemory2 )
LockTable( _M )
