local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalEnemyLockonShipAnimation( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 62 * _1080p, 0, 62 * _1080p )
	self.id = "JackalEnemyLockonShipAnimation"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local JackalEnemyLockonShip0 = nil
	
	JackalEnemyLockonShip0 = MenuBuilder.BuildRegisteredType( "JackalEnemyLockonShip", {
		controllerIndex = f1_local1
	} )
	JackalEnemyLockonShip0.id = "JackalEnemyLockonShip0"
	JackalEnemyLockonShip0:SetYRotation( 180, 0 )
	JackalEnemyLockonShip0:SetZRotation( 45, 0 )
	JackalEnemyLockonShip0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( JackalEnemyLockonShip0 )
	self.JackalEnemyLockonShip0 = JackalEnemyLockonShip0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		JackalEnemyLockonShip0:RegisterAnimationSequence( "on", {
			{
				function ()
					return self.JackalEnemyLockonShip0:SetXRotation( 0, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetXRotation( 2, 800 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetXRotation( -4, 1100 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetXRotation( 0, 1250 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShip0:SetYRotation( 180, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetYRotation( 182.5, 800 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetYRotation( 180, 1860 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetYRotation( 180, 490 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShip0:SetZRotation( 45, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetZRotation( 58, 330 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetZRotation( 49.78, 480 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetZRotation( 38.09, 960 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetZRotation( 49.49, 540 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetZRotation( 39.58, 640 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetZRotation( 45, 200 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShip0:SetDepth( 0, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetDepth( 50, 700 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetDepth( -50, 620 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetDepth( 50, 750 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetDepth( 0, 540 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetDepth( 0, 540 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShip0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -8, _1080p * -8, _1080p * 15, _1080p * 15, 529 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 19, _1080p * 19, _1080p * -12, _1080p * -12, 970 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -24, _1080p * -24, 0, 0, 990 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 660 )
				end
			}
		} )
		self._sequences.on = function ()
			JackalEnemyLockonShip0:AnimateLoop( "on" )
		end
		
		JackalEnemyLockonShip0:RegisterAnimationSequence( "off", {
			{
				function ()
					return self.JackalEnemyLockonShip0:SetXRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShip0:SetYRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShip0:SetZRotation( 45, 0 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShip0:SetDepth( 0, 0 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShip0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end
			}
		} )
		self._sequences.off = function ()
			JackalEnemyLockonShip0:AnimateSequence( "off" )
		end
		
		JackalEnemyLockonShip0:RegisterAnimationSequence( "shooting", {
			{
				function ()
					return self.JackalEnemyLockonShip0:SetRGBFromInt( 16744038, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetRGBFromInt( 16712704, 20 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetRGBFromInt( 16744038, 120 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShip0:SetScale( 0, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetScale( 0.1, 20 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetScale( 0, 120 )
				end
			}
		} )
		self._sequences.shooting = function ()
			JackalEnemyLockonShip0:AnimateLoop( "shooting" )
		end
		
		JackalEnemyLockonShip0:RegisterAnimationSequence( "notShooting", {
			{
				function ()
					return self.JackalEnemyLockonShip0:SetRGBFromInt( 16219489, 0 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShip0:SetScale( 0, 0 )
				end
			}
		} )
		self._sequences.notShooting = function ()
			JackalEnemyLockonShip0:AnimateSequence( "notShooting" )
		end
		
		JackalEnemyLockonShip0:RegisterAnimationSequence( "init", {
			{
				function ()
					return self.JackalEnemyLockonShip0:SetScale( 1, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetScale( 0, 230 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShip0:SetRGBFromInt( 14850834, 0 )
				end
			}
		} )
		self._sequences.init = function ()
			JackalEnemyLockonShip0:AnimateSequence( "init" )
		end
		
		JackalEnemyLockonShip0:RegisterAnimationSequence( "notShootAquiring", {
			{
				function ()
					return self.JackalEnemyLockonShip0:SetRGBFromInt( 14850834, 0 )
				end
			}
		} )
		self._sequences.notShootAquiring = function ()
			JackalEnemyLockonShip0:AnimateSequence( "notShootAquiring" )
		end
		
		JackalEnemyLockonShip0:RegisterAnimationSequence( "aquired", {
			{
				function ()
					return self.JackalEnemyLockonShip0:SetRGBFromInt( 14850834, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetRGBFromInt( 16219489, 60 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShip0:SetScale( 0, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetScale( 0, 30 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetScale( 0, 30 )
				end
			}
		} )
		self._sequences.aquired = function ()
			JackalEnemyLockonShip0:AnimateSequence( "aquired" )
		end
		
		JackalEnemyLockonShip0:RegisterAnimationSequence( "missile", {
			{
				function ()
					return self.JackalEnemyLockonShip0:SetRGBFromInt( 14856210, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetRGBFromInt( 14839570, 100 )
				end,
				function ()
					return self.JackalEnemyLockonShip0:SetRGBFromInt( 14856210, 90 )
				end
			}
		} )
		self._sequences.missile = function ()
			JackalEnemyLockonShip0:AnimateLoop( "missile" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonActive:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.enemyLockonActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonActive:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "on" )
			ACTIONS.AnimateSequence( self, "init" )
		end
		if DataSources.inGame.jackal.enemyLockonActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonActive:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "off" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonIsfiring:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "shooting" )
		end
		if DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) == false and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "notShooting" )
		end
		if DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) == false and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "notShootAquiring" )
		end
	end )
	local f1_local4 = function ()
		if DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == false and DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "aquired" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonAquiring:GetModel( f1_local1 ), f1_local4 )
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonIsfiring:GetModel( f1_local1 ), f1_local4 )
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonMissile:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "missile" )
		end
		if DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "notShooting" )
		end
	end )
	return self
end

MenuBuilder.registerType( "JackalEnemyLockonShipAnimation", JackalEnemyLockonShipAnimation )
LockTable( _M )
