local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questBoatDLC1( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 208 * _1080p, 0, 251 * _1080p )
	self.id = "questBoatDLC1"
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
	pictureBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -24, _1080p * 232, _1080p * -1.45, _1080p * 254.55 )
	self:addElement( pictureBacking )
	self.pictureBacking = pictureBacking
	
	local boatBackground = nil
	
	boatBackground = LUI.UIImage.new()
	boatBackground.id = "boatBackground"
	boatBackground:setImage( RegisterMaterial( "zm_polaroid_boat_bg" ), 0 )
	boatBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -23, _1080p * 233, 0, _1080p * 256 )
	self:addElement( boatBackground )
	self.boatBackground = boatBackground
	
	local middle = nil
	
	middle = LUI.UIImage.new()
	middle.id = "middle"
	middle:setImage( RegisterMaterial( "zm_polaroid_boat_motor_middle" ), 0 )
	middle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 72, _1080p * 136, _1080p * 51.8, _1080p * 179.8 )
	middle:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetModel( f1_local1 ) )
	self:addElement( middle )
	self.middle = middle
	
	local propeller = nil
	
	propeller = LUI.UIImage.new()
	propeller.id = "propeller"
	propeller:SetScale( 0.2, 0 )
	propeller:setImage( RegisterMaterial( "zm_polaroid_boat_motor_propeller" ), 0 )
	propeller:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 99.6, _1080p * 163.6, _1080p * 140.8, _1080p * 204.8 )
	propeller:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ) )
	self:addElement( propeller )
	self.propeller = propeller
	
	local top = nil
	
	top = LUI.UIImage.new()
	top.id = "top"
	top:setImage( RegisterMaterial( "zm_polaroid_boat_motor_top" ), 0 )
	top:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56.6, _1080p * 120.6, _1080p * 13.6, _1080p * 77.6 )
	top:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetModel( f1_local1 ) )
	self:addElement( top )
	self.top = top
	
	local bloodyPrint = nil
	
	bloodyPrint = LUI.UIImage.new()
	bloodyPrint.id = "bloodyPrint"
	bloodyPrint:SetZRotation( -58, 0 )
	bloodyPrint:setImage( RegisterMaterial( "zm_polaroid_bloody_finger_print" ), 0 )
	bloodyPrint:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2.6, _1080p * 130.6, _1080p * 119, _1080p * 247 )
	bloodyPrint:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.boatQuestCompleteAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( bloodyPrint )
	self.bloodyPrint = bloodyPrint
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		propeller:RegisterAnimationSequence( "propellerPartFound", {
			{
				function ()
					return self.propeller:SetScale( 0.2, 0 )
				end,
				function ()
					return self.propeller:SetScale( 0.6, 250 )
				end,
				function ()
					return self.propeller:SetScale( 0.2, 250 )
				end,
				function ()
					return self.propeller:SetScale( 0.45, 250 )
				end,
				function ()
					return self.propeller:SetScale( 0.2, 250 )
				end,
				function ()
					return self.propeller:SetScale( 0.3, 250 )
				end,
				function ()
					return self.propeller:SetScale( 0.2, 250 )
				end
			}
		} )
		self._sequences.propellerPartFound = function ()
			propeller:AnimateSequence( "propellerPartFound" )
		end
		
		middle:RegisterAnimationSequence( "middlePartFound", {
			{
				function ()
					return self.middle:SetScale( 0, 0 )
				end,
				function ()
					return self.middle:SetScale( 0.5, 250 )
				end,
				function ()
					return self.middle:SetScale( 0, 250 )
				end,
				function ()
					return self.middle:SetScale( 0.25, 250 )
				end,
				function ()
					return self.middle:SetScale( 0, 250 )
				end,
				function ()
					return self.middle:SetScale( 0.13, 250 )
				end,
				function ()
					return self.middle:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.middlePartFound = function ()
			middle:AnimateSequence( "middlePartFound" )
		end
		
		top:RegisterAnimationSequence( "topPartFound", {
			{
				function ()
					return self.top:SetScale( 0, 0 )
				end,
				function ()
					return self.top:SetScale( 0.5, 250 )
				end,
				function ()
					return self.top:SetScale( 0, 250 )
				end,
				function ()
					return self.top:SetScale( 0.25, 250 )
				end,
				function ()
					return self.top:SetScale( 0, 250 )
				end,
				function ()
					return self.top:SetScale( 0.13, 250 )
				end,
				function ()
					return self.top:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.topPartFound = function ()
			top:AnimateSequence( "topPartFound" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "propellerPartFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "middlePartFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "topPartFound" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questBoatDLC1", questBoatDLC1 )
LockTable( _M )
