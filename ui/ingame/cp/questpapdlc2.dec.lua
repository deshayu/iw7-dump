local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questPAPDLC2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 209 * _1080p, 0, 255 * _1080p )
	self.id = "questPAPDLC2"
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
	
	local packapunch = nil
	
	packapunch = LUI.UIImage.new()
	packapunch.id = "packapunch"
	packapunch:setImage( RegisterMaterial( "cp_disco_inventory_packapunch" ), 0 )
	packapunch:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 286.5, _1080p * 542.5, _1080p * 84.5, _1080p * 212.5 )
	packapunch:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.papQuestCompleteAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( packapunch )
	self.packapunch = packapunch
	
	local ticket = nil
	
	ticket = LUI.UIImage.new()
	ticket.id = "ticket"
	ticket:setImage( RegisterMaterial( "cp_disco_inventory_ticket" ), 0 )
	ticket:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 360, _1080p * 488, _1080p * -6.8, _1080p * 121.2 )
	ticket:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( ticket )
	self.ticket = ticket
	
	local token = nil
	
	token = LUI.UIImage.new()
	token.id = "token"
	token:setImage( RegisterMaterial( "cp_disco_inventory_token" ), 0 )
	token:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 278, _1080p * 406, _1080p * -9.8, _1080p * 118.2 )
	token:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( token )
	self.token = token
	
	local reel = nil
	
	reel = LUI.UIImage.new()
	reel.id = "reel"
	reel:setImage( RegisterMaterial( "cp_disco_inventory_reel" ), 0 )
	reel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 438.5, _1080p * 566.5, _1080p * -2.8, _1080p * 125.2 )
	reel:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetModel( f1_local1 ) )
	self:addElement( reel )
	self.reel = reel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		reel:RegisterAnimationSequence( "foundReel", {
			{
				function ()
					return self.reel:SetScale( 0, 0 )
				end,
				function ()
					return self.reel:SetScale( 0.5, 200 )
				end,
				function ()
					return self.reel:SetScale( 0, 200 )
				end,
				function ()
					return self.reel:SetScale( 0.25, 210 )
				end,
				function ()
					return self.reel:SetScale( 0, 190 )
				end,
				function ()
					return self.reel:SetScale( 0.13, 200 )
				end,
				function ()
					return self.reel:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundReel = function ()
			reel:AnimateSequence( "foundReel" )
		end
		
		token:RegisterAnimationSequence( "foundToken", {
			{
				function ()
					return self.token:SetScale( 0, 0 )
				end,
				function ()
					return self.token:SetScale( 0.5, 200 )
				end,
				function ()
					return self.token:SetScale( 0, 200 )
				end,
				function ()
					return self.token:SetScale( 0.25, 200 )
				end,
				function ()
					return self.token:SetScale( 0, 200 )
				end,
				function ()
					return self.token:SetScale( 0.13, 200 )
				end,
				function ()
					return self.token:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundToken = function ()
			token:AnimateSequence( "foundToken" )
		end
		
		ticket:RegisterAnimationSequence( "foundTicket", {
			{
				function ()
					return self.ticket:SetScale( 0, 0 )
				end,
				function ()
					return self.ticket:SetScale( 0.5, 200 )
				end,
				function ()
					return self.ticket:SetScale( 0, 200 )
				end,
				function ()
					return self.ticket:SetScale( 0.25, 200 )
				end,
				function ()
					return self.ticket:SetScale( 0, 190 )
				end,
				function ()
					return self.ticket:SetScale( 0.13, 210 )
				end,
				function ()
					return self.ticket:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.foundTicket = function ()
			ticket:AnimateSequence( "foundTicket" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundReel" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "foundTicket" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "foundToken" )
	end )
	return self
end

MenuBuilder.registerType( "questPAPDLC2", questPAPDLC2 )
LockTable( _M )
