local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questEyeDLC2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 209 * _1080p, 0, 255 * _1080p )
	self.id = "questEyeDLC2"
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
	
	local key = nil
	
	key = LUI.UIImage.new()
	key.id = "key"
	key:setImage( RegisterMaterial( "cp_disco_inventory_key" ), 0 )
	key:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 723, _1080p * 851, _1080p * -1, _1080p * 127 )
	key:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( key )
	self.key = key
	
	local eye = nil
	
	eye = LUI.UIImage.new()
	eye.id = "eye"
	eye:setImage( RegisterMaterial( "cp_disco_inventory_eye" ), 0 )
	eye:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 693, _1080p * 949, _1080p * -27, _1080p * 229 )
	eye:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( eye )
	self.eye = eye
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		eye:RegisterAnimationSequence( "eyeFound", {
			{
				function ()
					return self.eye:SetScale( 0, 0 )
				end,
				function ()
					return self.eye:SetScale( 0.5, 200 )
				end,
				function ()
					return self.eye:SetScale( 0, 200 )
				end,
				function ()
					return self.eye:SetScale( 0.25, 200 )
				end,
				function ()
					return self.eye:SetScale( 0, 200 )
				end,
				function ()
					return self.eye:SetScale( 0.13, 200 )
				end,
				function ()
					return self.eye:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.eyeFound = function ()
			eye:AnimateSequence( "eyeFound" )
		end
		
		key:RegisterAnimationSequence( "keyFound", {
			{
				function ()
					return self.key:SetScale( 0, 0 )
				end,
				function ()
					return self.key:SetScale( 0.5, 200 )
				end,
				function ()
					return self.key:SetScale( 0, 200 )
				end,
				function ()
					return self.key:SetScale( 0.25, 200 )
				end,
				function ()
					return self.key:SetScale( 0, 200 )
				end,
				function ()
					return self.key:SetScale( 0.13, 200 )
				end,
				function ()
					return self.key:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.keyFound = function ()
			key:AnimateSequence( "keyFound" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "keyFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR2Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "eyeFound" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questEyeDLC2", questEyeDLC2 )
LockTable( _M )
