local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questHeartDLC2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 208 * _1080p, 0, 251 * _1080p )
	self.id = "questHeartDLC2"
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
	newspaper:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1024, _1080p * -257, _1080p * 255 )
	self:addElement( newspaper )
	self.newspaper = newspaper
	
	local heart = nil
	
	heart = LUI.UIImage.new()
	heart.id = "heart"
	heart:setImage( RegisterMaterial( "cp_disco_inventory_heart" ), 0 )
	heart:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 126.6, _1080p * 254.6, _1080p * 8.8, _1080p * 264.8 )
	heart:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ) )
	self:addElement( heart )
	self.heart = heart
	
	local turnstile = nil
	
	turnstile = LUI.UIImage.new()
	turnstile.id = "turnstile"
	turnstile:setImage( RegisterMaterial( "cp_disco_inventory_pipe" ), 0 )
	turnstile:SetUseAA( true )
	turnstile:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21.6, _1080p * 149.6, _1080p * 3.8, _1080p * 259.8 )
	turnstile:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetModel( f1_local1 ) )
	self:addElement( turnstile )
	self.turnstile = turnstile
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		heart:RegisterAnimationSequence( "heartFound", {
			{
				function ()
					return self.heart:SetScale( 0.2, 0 )
				end,
				function ()
					return self.heart:SetScale( 0.5, 250 )
				end,
				function ()
					return self.heart:SetScale( 0, 250 )
				end,
				function ()
					return self.heart:SetScale( 0.25, 250 )
				end,
				function ()
					return self.heart:SetScale( 0, 250 )
				end,
				function ()
					return self.heart:SetScale( 0.13, 250 )
				end,
				function ()
					return self.heart:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.heartFound = function ()
			heart:AnimateSequence( "heartFound" )
		end
		
		turnstile:RegisterAnimationSequence( "posterFound", {
			{
				function ()
					return self.turnstile:SetScale( 0, 0 )
				end,
				function ()
					return self.turnstile:SetScale( 0.5, 250 )
				end,
				function ()
					return self.turnstile:SetScale( 0, 250 )
				end,
				function ()
					return self.turnstile:SetScale( 0.25, 250 )
				end,
				function ()
					return self.turnstile:SetScale( 0, 250 )
				end,
				function ()
					return self.turnstile:SetScale( 0.13, 250 )
				end,
				function ()
					return self.turnstile:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.posterFound = function ()
			turnstile:AnimateSequence( "posterFound" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "heartFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "posterFound" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questHeartDLC2", questHeartDLC2 )
LockTable( _M )
