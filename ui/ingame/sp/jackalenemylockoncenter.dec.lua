local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalEnemyLockonCenter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 188 * _1080p, 0, 188 * _1080p )
	self.id = "JackalEnemyLockonCenter"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local crosshairs = nil
	
	crosshairs = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f1_local1
	} )
	crosshairs.id = "crosshairs"
	crosshairs:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	crosshairs:SetAlpha( 0.4, 0 )
	crosshairs:SetZRotation( 45, 0 )
	crosshairs:SetScale( -0.58, 0 )
	crosshairs.rightLine:SetLeft( _1080p * -94, 0 )
	crosshairs.rightLine:SetTop( _1080p * 2.5, 0 )
	crosshairs.rightLine:SetBottom( _1080p * -2.5, 0 )
	crosshairs.leftLine:SetRight( _1080p * 94, 0 )
	crosshairs.leftLine:SetTop( _1080p * -2.5, 0 )
	crosshairs.leftLine:SetBottom( _1080p * 2.5, 0 )
	crosshairs.bottomLine:SetLeft( _1080p * -2.5, 0 )
	crosshairs.bottomLine:SetRight( _1080p * 2.5, 0 )
	crosshairs.bottomLine:SetTop( _1080p * -92, 0 )
	crosshairs.topLine:SetLeft( _1080p * -2.5, 0 )
	crosshairs.topLine:SetRight( _1080p * 2.5, 0 )
	crosshairs.topLine:SetBottom( _1080p * 92, 0 )
	crosshairs:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( crosshairs )
	self.crosshairs = crosshairs
	
	local outterCircle = nil
	
	outterCircle = LUI.UIImage.new()
	outterCircle.id = "outterCircle"
	outterCircle:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	outterCircle:SetAlpha( 0.75, 0 )
	outterCircle:setImage( RegisterMaterial( "hud_jackal_interior_main_map_circle" ), 0 )
	outterCircle:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 52, _1080p * -52, _1080p * 52, _1080p * -52 )
	self:addElement( outterCircle )
	self.outterCircle = outterCircle
	
	local missileWarning = nil
	
	missileWarning = LUI.UIImage.new()
	missileWarning.id = "missileWarning"
	missileWarning:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	missileWarning:SetAlpha( 0.15, 0 )
	missileWarning:setImage( RegisterMaterial( "hud_jackal_blur_accent" ), 0 )
	missileWarning:SetBlendMode( BLEND_MODE.addWithAlpha )
	missileWarning:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 48, _1080p * -48, _1080p * 48, _1080p * -48 )
	self:addElement( missileWarning )
	self.missileWarning = missileWarning
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		missileWarning:RegisterAnimationSequence( "incomingMissile", {
			{
				function ()
					return self.missileWarning:SetRGBFromInt( 14188089, 0 )
				end,
				function ()
					return self.missileWarning:SetRGBFromTable( SWATCHES.jackal.caution, 150 )
				end,
				function ()
					return self.missileWarning:SetRGBFromInt( 14188089, 150 )
				end
			},
			{
				function ()
					return self.missileWarning:SetAlpha( 0.45, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.6, 150 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.45, 150 )
				end
			}
		} )
		self._sequences.incomingMissile = function ()
			missileWarning:AnimateLoop( "incomingMissile" )
		end
		
		missileWarning:RegisterAnimationSequence( "noincomingMissile", {
			{
				function ()
					return self.missileWarning:SetRGBFromInt( 13861944, 0 )
				end,
				function ()
					return self.missileWarning:SetRGBFromInt( 6067930, 100 )
				end,
				function ()
					return self.missileWarning:SetRGBFromInt( 6067930, 200 )
				end,
				function ()
					return self.missileWarning:SetRGBFromTable( SWATCHES.jackal.warning, 450 )
				end
			},
			{
				function ()
					return self.missileWarning:SetAlpha( 0.48, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.72, 100 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.32, 100 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.72, 100 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.15, 450 )
				end
			}
		} )
		self._sequences.noincomingMissile = function ()
			missileWarning:AnimateSequence( "noincomingMissile" )
		end
		
		crosshairs:RegisterAnimationSequence( "aquiringLock", {
			{
				function ()
					return self.crosshairs:SetAlpha( 0, 0 )
				end
			}
		} )
		outterCircle:RegisterAnimationSequence( "aquiringLock", {
			{
				function ()
					return self.outterCircle:SetAlpha( 0, 0 )
				end
			}
		} )
		missileWarning:RegisterAnimationSequence( "aquiringLock", {
			{
				function ()
					return self.missileWarning:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.aquiringLock = function ()
			crosshairs:AnimateSequence( "aquiringLock" )
			outterCircle:AnimateSequence( "aquiringLock" )
			missileWarning:AnimateSequence( "aquiringLock" )
		end
		
		crosshairs:RegisterAnimationSequence( "aquiredLock", {
			{
				function ()
					return self.crosshairs:SetAlpha( 0, 0 )
				end,
				function ()
					return self.crosshairs:SetAlpha( 0, 280 )
				end,
				function ()
					return self.crosshairs:SetAlpha( 0.65, 340 )
				end
			},
			{
				function ()
					return self.crosshairs:SetScale( -1, 0 )
				end,
				function ()
					return self.crosshairs:SetScale( -1, 280 )
				end,
				function ()
					return self.crosshairs:SetScale( -0.49, 200 )
				end,
				function ()
					return self.crosshairs:SetScale( -0.58, 140 )
				end
			}
		} )
		outterCircle:RegisterAnimationSequence( "aquiredLock", {
			{
				function ()
					return self.outterCircle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.outterCircle:SetAlpha( 0, 280 )
				end,
				function ()
					return self.outterCircle:SetAlpha( 0.75, 340 )
				end
			},
			{
				function ()
					return self.outterCircle:SetScale( -1, 0 )
				end,
				function ()
					return self.outterCircle:SetScale( 7, 280 )
				end,
				function ()
					return self.outterCircle:SetScale( 0.23, 200 )
				end,
				function ()
					return self.outterCircle:SetScale( 0, 140 )
				end
			}
		} )
		missileWarning:RegisterAnimationSequence( "aquiredLock", {
			{
				function ()
					return self.missileWarning:SetAlpha( 0, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0, 280 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.15, 340 )
				end
			},
			{
				function ()
					return self.missileWarning:SetScale( -1, 0 )
				end,
				function ()
					return self.missileWarning:SetScale( 7, 280 )
				end,
				function ()
					return self.missileWarning:SetScale( 0.27, 200 )
				end,
				function ()
					return self.missileWarning:SetScale( 0, 140 )
				end
			}
		} )
		self._sequences.aquiredLock = function ()
			crosshairs:AnimateSequence( "aquiredLock" )
			outterCircle:AnimateSequence( "aquiredLock" )
			missileWarning:AnimateSequence( "aquiredLock" )
		end
		
		missileWarning:RegisterAnimationSequence( "isFiring", {
			{
				function ()
					return self.missileWarning:SetRGBFromInt( 16528154, 0 )
				end
			},
			{
				function ()
					return self.missileWarning:SetAlpha( 0.35, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.55, 80 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.35, 80 )
				end
			}
		} )
		self._sequences.isFiring = function ()
			missileWarning:AnimateSequence( "isFiring" )
		end
		
		missileWarning:RegisterAnimationSequence( "isNotFiring", {
			{
				function ()
					return self.missileWarning:SetRGBFromInt( 16528154, 0 )
				end,
				function ()
					return self.missileWarning:SetRGBFromInt( 15819327, 340 )
				end
			},
			{
				function ()
					return self.missileWarning:SetAlpha( 0.55, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.15, 340 )
				end
			}
		} )
		self._sequences.isNotFiring = function ()
			missileWarning:AnimateSequence( "isNotFiring" )
		end
		
		missileWarning:RegisterAnimationSequence( "noIncomingMissileFail", {
			{
				function ()
					return self.missileWarning:SetRGBFromInt( 13861944, 0 )
				end,
				function ()
					return self.missileWarning:SetRGBFromInt( 16711683, 120 )
				end,
				function ()
					return self.missileWarning:SetRGBFromTable( SWATCHES.jackal.warning, 520 )
				end
			},
			{
				function ()
					return self.missileWarning:SetAlpha( 0.48, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.84, 120 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.15, 520 )
				end
			}
		} )
		self._sequences.noIncomingMissileFail = function ()
			missileWarning:AnimateSequence( "noIncomingMissileFail" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonMissile:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "incomingMissile" )
		end
		if DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "noincomingMissile" )
		end
		if DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) == -1 then
			ACTIONS.AnimateSequence( self, "noIncomingMissileFail" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonAquiring:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "aquiringLock" )
		end
		if DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "aquiredLock" )
		end
	end )
	local f1_local6 = function ()
		if DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) == true and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "isFiring" )
		end
		if DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "isNotFiring" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonIsfiring:GetModel( f1_local1 ), f1_local6 )
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonAquiring:GetModel( f1_local1 ), f1_local6 )
	return self
end

MenuBuilder.registerType( "JackalEnemyLockonCenter", JackalEnemyLockonCenter )
LockTable( _M )
