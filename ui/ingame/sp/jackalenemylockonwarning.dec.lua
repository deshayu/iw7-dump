local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalEnemyLockonWarning( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 32 * _1080p )
	self.id = "JackalEnemyLockonWarning"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local missileIncoming = nil
	
	missileIncoming = LUI.UIText.new()
	missileIncoming.id = "missileIncoming"
	missileIncoming:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	missileIncoming:setText( ToUpperCase( Engine.Localize( "JACKAL_ENEMY_LOCKING" ) ), 0 )
	missileIncoming:SetFontSize( 24 * _1080p )
	missileIncoming:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	missileIncoming:SetAlignment( LUI.Alignment.Center )
	missileIncoming:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -5, _1080p * 5, _1080p * 3, _1080p * 27 )
	self:addElement( missileIncoming )
	self.missileIncoming = missileIncoming
	
	local exclaimation1Incoming = nil
	
	exclaimation1Incoming = LUI.UIImage.new()
	exclaimation1Incoming.id = "exclaimation1Incoming"
	exclaimation1Incoming:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	exclaimation1Incoming:setImage( RegisterMaterial( "hud_icon_warning" ), 0 )
	exclaimation1Incoming:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 218, 0, 0, 0 )
	self:addElement( exclaimation1Incoming )
	self.exclaimation1Incoming = exclaimation1Incoming
	
	local exclaimation2Incoming = nil
	
	exclaimation2Incoming = LUI.UIImage.new()
	exclaimation2Incoming.id = "exclaimation2Incoming"
	exclaimation2Incoming:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	exclaimation2Incoming:setImage( RegisterMaterial( "hud_icon_warning" ), 0 )
	exclaimation2Incoming:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -218, 0, 0 )
	self:addElement( exclaimation2Incoming )
	self.exclaimation2Incoming = exclaimation2Incoming
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		exclaimation1Incoming:RegisterAnimationSequence( "incoming_on", {
			{
				function ()
					return self.exclaimation1Incoming:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end,
				function ()
					return self.exclaimation1Incoming:SetRGBFromTable( SWATCHES.jackal.caution, 100 )
				end,
				function ()
					return self.exclaimation1Incoming:SetRGBFromTable( SWATCHES.jackal.warning, 100 )
				end
			},
			{
				function ()
					return self.exclaimation1Incoming:SetAlpha( 1, 0 )
				end,
				function ()
					return self.exclaimation1Incoming:SetAlpha( 1, 200 )
				end
			}
		} )
		exclaimation2Incoming:RegisterAnimationSequence( "incoming_on", {
			{
				function ()
					return self.exclaimation2Incoming:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end,
				function ()
					return self.exclaimation2Incoming:SetRGBFromTable( SWATCHES.jackal.caution, 100 )
				end,
				function ()
					return self.exclaimation2Incoming:SetRGBFromTable( SWATCHES.jackal.warning, 100 )
				end
			},
			{
				function ()
					return self.exclaimation2Incoming:SetAlpha( 1, 0 )
				end,
				function ()
					return self.exclaimation2Incoming:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.incoming_on = function ()
			exclaimation1Incoming:AnimateLoop( "incoming_on" )
			exclaimation2Incoming:AnimateLoop( "incoming_on" )
		end
		
		exclaimation1Incoming:RegisterAnimationSequence( "incoming_off", {
			{
				function ()
					return self.exclaimation1Incoming:SetAlpha( 0, 0 )
				end
			}
		} )
		exclaimation2Incoming:RegisterAnimationSequence( "incoming_off", {
			{
				function ()
					return self.exclaimation2Incoming:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.incoming_off = function ()
			exclaimation1Incoming:AnimateSequence( "incoming_off" )
			exclaimation2Incoming:AnimateSequence( "incoming_off" )
		end
		
		missileIncoming:RegisterAnimationSequence( "lockonOn", {
			{
				function ()
					return self.missileIncoming:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end,
				function ()
					return self.missileIncoming:SetRGBFromInt( 14656918, 100 )
				end,
				function ()
					return self.missileIncoming:SetRGBFromTable( SWATCHES.jackal.warning, 100 )
				end
			},
			{
				function ()
					return self.missileIncoming:SetAlpha( 1, 0 )
				end,
				function ()
					return self.missileIncoming:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.missileIncoming:setText( ToUpperCase( Engine.Localize( "JACKAL_ENEMY_LOCKON" ) ), 0 )
				end
			}
		} )
		self._sequences.lockonOn = function ()
			missileIncoming:AnimateLoop( "lockonOn" )
		end
		
		self._sequences.LockonOff = function ()
			
		end
		
		missileIncoming:RegisterAnimationSequence( "aquiring", {
			{
				function ()
					return self.missileIncoming:SetRGBFromTable( SWATCHES.jackal.caution, 0 )
				end,
				function ()
					return self.missileIncoming:SetRGBFromTable( SWATCHES.jackal.caution, 500 )
				end
			},
			{
				function ()
					return self.missileIncoming:SetAlpha( 1, 0 )
				end,
				function ()
					return self.missileIncoming:SetAlpha( 0.5, 250 )
				end,
				function ()
					return self.missileIncoming:SetAlpha( 1, 250 )
				end
			},
			{
				function ()
					return self.missileIncoming:setText( ToUpperCase( Engine.Localize( "JACKAL_ENEMY_LOCKING" ) ), 0 )
				end
			}
		} )
		self._sequences.aquiring = function ()
			missileIncoming:AnimateLoop( "aquiring" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonAquiring:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "lockonOn" )
		end
		if DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "aquiring" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.jackal.displayCockpitIncomingMissile:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.displayCockpitIncomingMissile:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.displayCockpitIncomingMissile:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "incoming_on" )
		end
		if DataSources.inGame.jackal.displayCockpitIncomingMissile:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.displayCockpitIncomingMissile:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "incoming_off" )
		end
	end )
	return self
end

MenuBuilder.registerType( "JackalEnemyLockonWarning", JackalEnemyLockonWarning )
LockTable( _M )
