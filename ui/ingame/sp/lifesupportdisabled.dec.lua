local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LifeSupportDisabled( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 640 * _1080p, 0, 100 * _1080p )
	self.id = "LifeSupportDisabled"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local SystemsRestoredText = nil
	
	SystemsRestoredText = LUI.UIText.new()
	SystemsRestoredText.id = "SystemsRestoredText"
	SystemsRestoredText:SetRGBFromInt( 65280, 0 )
	SystemsRestoredText:setText( Engine.Localize( "SHIP_ASSAULT_SYSTEMS_RESTORED" ), 0 )
	SystemsRestoredText:SetFontSize( 20 * _1080p )
	SystemsRestoredText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	SystemsRestoredText:SetAlignment( LUI.Alignment.Right )
	SystemsRestoredText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -640, 0, _1080p * 32.5, _1080p * 47.5 )
	self:addElement( SystemsRestoredText )
	self.SystemsRestoredText = SystemsRestoredText
	
	local ConnectionLostText = nil
	
	ConnectionLostText = LUI.UIText.new()
	ConnectionLostText.id = "ConnectionLostText"
	ConnectionLostText:setText( Engine.Localize( "SHIP_ASSAULT_CONNECTION_LOST" ), 0 )
	ConnectionLostText:SetFontSize( 30 * _1080p )
	ConnectionLostText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	ConnectionLostText:SetAlignment( LUI.Alignment.Right )
	ConnectionLostText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -640, 0, _1080p * 12.5, _1080p * 27.5 )
	self:addElement( ConnectionLostText )
	self.ConnectionLostText = ConnectionLostText
	
	local ShuttingDownOxygenSupplyText = nil
	
	ShuttingDownOxygenSupplyText = LUI.UIText.new()
	ShuttingDownOxygenSupplyText.id = "ShuttingDownOxygenSupplyText"
	ShuttingDownOxygenSupplyText:SetRGBFromInt( 16738665, 0 )
	ShuttingDownOxygenSupplyText:setText( Engine.Localize( "SHIP_ASSAULT_SHUTTING_DOWN_OXYGEN_SUPPLY" ), 0 )
	ShuttingDownOxygenSupplyText:SetFontSize( 30 * _1080p )
	ShuttingDownOxygenSupplyText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	ShuttingDownOxygenSupplyText:SetAlignment( LUI.Alignment.Right )
	ShuttingDownOxygenSupplyText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -640, 0, _1080p * -7.5, _1080p * 7.5 )
	self:addElement( ShuttingDownOxygenSupplyText )
	self.ShuttingDownOxygenSupplyText = ShuttingDownOxygenSupplyText
	
	local ShuttingDownGravitySystemsText = nil
	
	ShuttingDownGravitySystemsText = LUI.UIText.new()
	ShuttingDownGravitySystemsText.id = "ShuttingDownGravitySystemsText"
	ShuttingDownGravitySystemsText:SetRGBFromInt( 16738665, 0 )
	ShuttingDownGravitySystemsText:setText( Engine.Localize( "SHIP_ASSAULT_SHUTTING_DOWN_GRAVITY_SYSTEMS" ), 0 )
	ShuttingDownGravitySystemsText:SetFontSize( 20 * _1080p )
	ShuttingDownGravitySystemsText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	ShuttingDownGravitySystemsText:SetAlignment( LUI.Alignment.Right )
	ShuttingDownGravitySystemsText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -640, 0, _1080p * -27.5, _1080p * -12.5 )
	self:addElement( ShuttingDownGravitySystemsText )
	self.ShuttingDownGravitySystemsText = ShuttingDownGravitySystemsText
	
	local AccessingLifeSupportText = nil
	
	AccessingLifeSupportText = LUI.UIText.new()
	AccessingLifeSupportText.id = "AccessingLifeSupportText"
	AccessingLifeSupportText:setText( Engine.Localize( "SHIP_ASSAULT_ACCESSING_LIFE_SUPPORT" ), 0 )
	AccessingLifeSupportText:SetFontSize( 20 * _1080p )
	AccessingLifeSupportText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	AccessingLifeSupportText:SetAlignment( LUI.Alignment.Right )
	AccessingLifeSupportText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -640, 0, _1080p * -47.5, _1080p * -32.5 )
	self:addElement( AccessingLifeSupportText )
	self.AccessingLifeSupportText = AccessingLifeSupportText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		SystemsRestoredText:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.SystemsRestoredText:SetAlpha( 0, 0 )
				end
			}
		} )
		ConnectionLostText:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 0 )
				end
			}
		} )
		ShuttingDownOxygenSupplyText:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 990 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 10 )
				end
			}
		} )
		ShuttingDownGravitySystemsText:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 490 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 10 )
				end
			}
		} )
		AccessingLifeSupportText:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.AccessingLifeSupportText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Disabled = function ()
			SystemsRestoredText:AnimateSequence( "Disabled" )
			ConnectionLostText:AnimateSequence( "Disabled" )
			ShuttingDownOxygenSupplyText:AnimateSequence( "Disabled" )
			ShuttingDownGravitySystemsText:AnimateSequence( "Disabled" )
			AccessingLifeSupportText:AnimateSequence( "Disabled" )
		end
		
		SystemsRestoredText:RegisterAnimationSequence( "Restored", {
			{
				function ()
					return self.SystemsRestoredText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SystemsRestoredText:SetAlpha( 0, 2990 )
				end,
				function ()
					return self.SystemsRestoredText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.SystemsRestoredText:SetAlpha( 1, 1500 )
				end,
				function ()
					return self.SystemsRestoredText:SetAlpha( 0, 500 )
				end
			}
		} )
		ConnectionLostText:RegisterAnimationSequence( "Restored", {
			{
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 240 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 240 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 1, 1500 )
				end,
				function ()
					return self.ConnectionLostText:SetAlpha( 0, 500 )
				end
			}
		} )
		ShuttingDownOxygenSupplyText:RegisterAnimationSequence( "Restored", {
			{
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 1, 4500 )
				end,
				function ()
					return self.ShuttingDownOxygenSupplyText:SetAlpha( 0, 500 )
				end
			}
		} )
		ShuttingDownGravitySystemsText:RegisterAnimationSequence( "Restored", {
			{
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 1, 4500 )
				end,
				function ()
					return self.ShuttingDownGravitySystemsText:SetAlpha( 0, 500 )
				end
			}
		} )
		AccessingLifeSupportText:RegisterAnimationSequence( "Restored", {
			{
				function ()
					return self.AccessingLifeSupportText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.AccessingLifeSupportText:SetAlpha( 1, 4500 )
				end,
				function ()
					return self.AccessingLifeSupportText:SetAlpha( 0, 500 )
				end
			}
		} )
		self._sequences.Restored = function ()
			SystemsRestoredText:AnimateSequence( "Restored" )
			ConnectionLostText:AnimateSequence( "Restored" )
			ShuttingDownOxygenSupplyText:AnimateSequence( "Restored" )
			ShuttingDownGravitySystemsText:AnimateSequence( "Restored" )
			AccessingLifeSupportText:AnimateSequence( "Restored" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.wounded.lifeSupportState:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.wounded.lifeSupportState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.wounded.lifeSupportState:GetValue( f1_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Disabled" )
		end
		if DataSources.inGame.SP.wounded.lifeSupportState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.wounded.lifeSupportState:GetValue( f1_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "Restored" )
		end
	end )
	return self
end

MenuBuilder.registerType( "LifeSupportDisabled", LifeSupportDisabled )
LockTable( _M )
