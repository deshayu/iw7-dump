local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questMemory1( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 209 * _1080p, 0, 255 * _1080p )
	self.id = "questMemory1"
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
	
	local background = nil
	
	background = LUI.UIImage.new()
	background.id = "background"
	background:setImage( RegisterMaterial( "zm_polaroid_pap_bg" ), 0 )
	background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -21.5, _1080p * 232.5, _1080p * 2.04, _1080p * 256.04 )
	self:addElement( background )
	self.background = background
	
	local frontReel = nil
	
	frontReel = LUI.UIImage.new()
	frontReel.id = "frontReel"
	frontReel:setImage( RegisterMaterial( "zm_polaroid_pap_reel1" ), 0 )
	frontReel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 68, _1080p * 196, _1080p * 1.2, _1080p * 129.2 )
	frontReel:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetModel( f1_local1 ) )
	self:addElement( frontReel )
	self.frontReel = frontReel
	
	local backReel = nil
	
	backReel = LUI.UIImage.new()
	backReel.id = "backReel"
	backReel:setImage( RegisterMaterial( "zm_polaroid_pap_reel2" ), 0 )
	backReel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4, _1080p * 68, _1080p * 31, _1080p * 159 )
	backReel:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( backReel )
	self.backReel = backReel
	
	local bloodyPrint = nil
	
	bloodyPrint = LUI.UIImage.new()
	bloodyPrint.id = "bloodyPrint"
	bloodyPrint:SetZRotation( 28, 0 )
	bloodyPrint:setImage( RegisterMaterial( "zm_polaroid_bloody_finger_print" ), 0 )
	bloodyPrint:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 55.5, _1080p * 183.5, _1080p * 129, _1080p * 257 )
	bloodyPrint:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.papQuestCompleteAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( bloodyPrint )
	self.bloodyPrint = bloodyPrint
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		frontReel:RegisterAnimationSequence( "foundFrontReel", {
			{
				function ()
					return self.frontReel:SetScale( 0, 0 )
				end,
				function ()
					return self.frontReel:SetScale( 0.5, 200 )
				end,
				function ()
					return self.frontReel:SetScale( 0, 200 )
				end,
				function ()
					return self.frontReel:SetScale( 0.25, 210 )
				end,
				function ()
					return self.frontReel:SetScale( 0, 190 )
				end,
				function ()
					return self.frontReel:SetScale( 0.13, 200 )
				end,
				function ()
					return self.frontReel:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundFrontReel = function ()
			frontReel:AnimateSequence( "foundFrontReel" )
		end
		
		backReel:RegisterAnimationSequence( "foundBackReel", {
			{
				function ()
					return self.backReel:SetScale( 0, 0 )
				end,
				function ()
					return self.backReel:SetScale( 0.5, 200 )
				end,
				function ()
					return self.backReel:SetScale( 0, 200 )
				end,
				function ()
					return self.backReel:SetScale( 0.25, 200 )
				end,
				function ()
					return self.backReel:SetScale( 0, 200 )
				end,
				function ()
					return self.backReel:SetScale( 0.13, 200 )
				end,
				function ()
					return self.backReel:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundBackReel = function ()
			backReel:AnimateSequence( "foundBackReel" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundFrontReel" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundBackReel" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questMemory1", questMemory1 )
LockTable( _M )
