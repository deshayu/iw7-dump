local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questTriggerItem( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 36 * _1080p, 0, 37 * _1080p )
	self.id = "questTriggerItem"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local DpadR = nil
	
	DpadR = LUI.UIImage.new()
	DpadR.id = "DpadR"
	DpadR:SetZRotation( 90, 0 )
	DpadR:SetScale( -0.72, 0 )
	DpadR:setImage( RegisterMaterial( "zm_wc_empty_tab" ), 0 )
	DpadR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -46.08, _1080p * 81.92, _1080p * -45.36, _1080p * 82.64 )
	self:addElement( DpadR )
	self.DpadR = DpadR
	
	local glasses = nil
	
	glasses = LUI.UIImage.new()
	glasses.id = "glasses"
	glasses:SetScale( -0.74, 0 )
	glasses:setImage( RegisterMaterial( "zm_wc_glasses_icon" ), 0 )
	glasses:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -46.08, _1080p * 81.92, _1080p * -48.36, _1080p * 79.64 )
	self:addElement( glasses )
	self.glasses = glasses
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DpadR:RegisterAnimationSequence( "glassesOn", {
			{
				function ()
					return self.DpadR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DpadR:SetAlpha( 1, 1320 )
				end
			}
		} )
		glasses:RegisterAnimationSequence( "glassesOn", {
			{
				function ()
					return self.glasses:SetAlpha( 0, 0 )
				end,
				function ()
					return self.glasses:SetAlpha( 0, 300 )
				end,
				function ()
					return self.glasses:SetAlpha( 1, 240 )
				end
			},
			{
				function ()
					return self.glasses:SetScale( -0.7, 300 )
				end,
				function ()
					return self.glasses:SetScale( -0.8, 240 )
				end,
				function ()
					return self.glasses:SetScale( -0.7, 270 )
				end,
				function ()
					return self.glasses:SetScale( -0.8, 250 )
				end,
				function ()
					return self.glasses:SetScale( -0.7, 260 )
				end
			}
		} )
		self._sequences.glassesOn = function ()
			DpadR:AnimateSequence( "glassesOn" )
			glasses:AnimateSequence( "glassesOn" )
		end
		
		DpadR:RegisterAnimationSequence( "glassesOff", {
			{
				function ()
					return self.DpadR:SetAlpha( 1, 0 )
				end,
				function ()
					return self.DpadR:SetAlpha( 0, 300 )
				end
			}
		} )
		glasses:RegisterAnimationSequence( "glassesOff", {
			{
				function ()
					return self.glasses:SetAlpha( 1, 0 )
				end,
				function ()
					return self.glasses:SetAlpha( 0, 300 )
				end
			}
		} )
		self._sequences.glassesOff = function ()
			DpadR:AnimateSequence( "glassesOff" )
			glasses:AnimateSequence( "glassesOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3GlassesAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3GlassesAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3GlassesAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "glassesOn" )
		end
	end )
	local f1_local5 = function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3GlassesAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3GlassesAlpha:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "glassesOff" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3GlassesAlpha:GetModel( f1_local1 ), f1_local5 )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.craftedWeapon:GetModel( f1_local1 ), f1_local5 )
	return self
end

MenuBuilder.registerType( "questTriggerItem", questTriggerItem )
LockTable( _M )
