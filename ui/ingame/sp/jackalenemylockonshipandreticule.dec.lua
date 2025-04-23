local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.enemyLockonActive:GetModel( f1_arg1 ), function ()
		if DataSources.inGame.jackal.enemyLockonActive:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.enemyLockonActive:GetValue( f1_arg1 ) == true then
			ACTIONS.AnimateSequence( f1_arg0, "init" )
		end
		if DataSources.inGame.jackal.enemyLockonActive:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.enemyLockonActive:GetValue( f1_arg1 ) == false then
			ACTIONS.AnimateSequence( f1_arg0, "lockBreak" )
		end
	end, true )
end

function JackalEnemyLockonShipandReticule( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 188 * _1080p, 0, 188 * _1080p )
	self.id = "JackalEnemyLockonShipandReticule"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local JackalEnemyLockonCenter0 = nil
	
	JackalEnemyLockonCenter0 = MenuBuilder.BuildRegisteredType( "JackalEnemyLockonCenter", {
		controllerIndex = f3_local1
	} )
	JackalEnemyLockonCenter0.id = "JackalEnemyLockonCenter0"
	JackalEnemyLockonCenter0:SetAlpha( 0, 0 )
	JackalEnemyLockonCenter0:SetDepth( 400, 0 )
	JackalEnemyLockonCenter0:SetScale( 1, 0 )
	JackalEnemyLockonCenter0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 188, 0, _1080p * 188 )
	self:addElement( JackalEnemyLockonCenter0 )
	self.JackalEnemyLockonCenter0 = JackalEnemyLockonCenter0
	
	local JackalEnemyLockonMid0 = nil
	
	JackalEnemyLockonMid0 = MenuBuilder.BuildRegisteredType( "JackalEnemyLockonMid", {
		controllerIndex = f3_local1
	} )
	JackalEnemyLockonMid0.id = "JackalEnemyLockonMid0"
	JackalEnemyLockonMid0:SetAlpha( 0, 0 )
	JackalEnemyLockonMid0:SetDepth( 200, 0 )
	JackalEnemyLockonMid0:SetScale( 0.35, 0 )
	JackalEnemyLockonMid0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( JackalEnemyLockonMid0 )
	self.JackalEnemyLockonMid0 = JackalEnemyLockonMid0
	
	local JackalEnemyLockonLast0 = nil
	
	JackalEnemyLockonLast0 = MenuBuilder.BuildRegisteredType( "JackalEnemyLockonLast", {
		controllerIndex = f3_local1
	} )
	JackalEnemyLockonLast0.id = "JackalEnemyLockonLast0"
	JackalEnemyLockonLast0:SetAlpha( 0, 0 )
	JackalEnemyLockonLast0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( JackalEnemyLockonLast0 )
	self.JackalEnemyLockonLast0 = JackalEnemyLockonLast0
	
	local JackalEnemyLockonShipAnimation0 = nil
	
	JackalEnemyLockonShipAnimation0 = MenuBuilder.BuildRegisteredType( "JackalEnemyLockonShipAnimation", {
		controllerIndex = f3_local1
	} )
	JackalEnemyLockonShipAnimation0.id = "JackalEnemyLockonShipAnimation0"
	JackalEnemyLockonShipAnimation0:SetAlpha( 0, 0 )
	JackalEnemyLockonShipAnimation0:SetDepth( -180, 0 )
	JackalEnemyLockonShipAnimation0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -31, _1080p * 31, _1080p * -31, _1080p * 31 )
	self:addElement( JackalEnemyLockonShipAnimation0 )
	self.JackalEnemyLockonShipAnimation0 = JackalEnemyLockonShipAnimation0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		JackalEnemyLockonCenter0:RegisterAnimationSequence( "init", {
			{
				function ()
					return self.JackalEnemyLockonCenter0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.JackalEnemyLockonCenter0:SetAlpha( 1, 250 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonCenter0:SetScale( 5, 0 )
				end,
				function ()
					return self.JackalEnemyLockonCenter0:SetScale( 0.8, 250 )
				end,
				function ()
					return self.JackalEnemyLockonCenter0:SetScale( 1, 70 )
				end
			}
		} )
		JackalEnemyLockonMid0:RegisterAnimationSequence( "init", {
			{
				function ()
					return self.JackalEnemyLockonMid0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.JackalEnemyLockonMid0:SetAlpha( 1, 250 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonMid0:SetScale( 3, 0 )
				end,
				function ()
					return self.JackalEnemyLockonMid0:SetScale( 0.21, 250 )
				end,
				function ()
					return self.JackalEnemyLockonMid0:SetScale( 0.35, 70 )
				end
			}
		} )
		JackalEnemyLockonLast0:RegisterAnimationSequence( "init", {
			{
				function ()
					return self.JackalEnemyLockonLast0:SetScale( 2, 0 )
				end,
				function ()
					return self.JackalEnemyLockonLast0:SetScale( -0.12, 250 )
				end,
				function ()
					return self.JackalEnemyLockonLast0:SetScale( 0, 70 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonLast0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.JackalEnemyLockonLast0:SetAlpha( 1, 250 )
				end
			}
		} )
		JackalEnemyLockonShipAnimation0:RegisterAnimationSequence( "init", {
			{
				function ()
					return self.JackalEnemyLockonShipAnimation0:SetScale( 1.1, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShipAnimation0:SetScale( -0.2, 250 )
				end,
				function ()
					return self.JackalEnemyLockonShipAnimation0:SetScale( 0, 70 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShipAnimation0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShipAnimation0:SetAlpha( 0.75, 250 )
				end,
				function ()
					return self.JackalEnemyLockonShipAnimation0:SetAlpha( 0.75, 70 )
				end
			}
		} )
		self._sequences.init = function ()
			JackalEnemyLockonCenter0:AnimateSequence( "init" )
			JackalEnemyLockonMid0:AnimateSequence( "init" )
			JackalEnemyLockonLast0:AnimateSequence( "init" )
			JackalEnemyLockonShipAnimation0:AnimateSequence( "init" )
		end
		
		JackalEnemyLockonCenter0:RegisterAnimationSequence( "lockBreak", {
			{
				function ()
					return self.JackalEnemyLockonCenter0:SetScale( 1, 0 )
				end,
				function ()
					return self.JackalEnemyLockonCenter0:SetScale( 5, 290 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonCenter0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.JackalEnemyLockonCenter0:SetAlpha( 0, 290 )
				end
			}
		} )
		JackalEnemyLockonMid0:RegisterAnimationSequence( "lockBreak", {
			{
				function ()
					return self.JackalEnemyLockonMid0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.JackalEnemyLockonMid0:SetAlpha( 0, 290 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonMid0:SetScale( 0.35, 0 )
				end,
				function ()
					return self.JackalEnemyLockonMid0:SetScale( 3, 290 )
				end
			}
		} )
		JackalEnemyLockonLast0:RegisterAnimationSequence( "lockBreak", {
			{
				function ()
					return self.JackalEnemyLockonLast0:SetScale( 0, 0 )
				end,
				function ()
					return self.JackalEnemyLockonLast0:SetScale( 2, 290 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonLast0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.JackalEnemyLockonLast0:SetAlpha( 0, 290 )
				end
			}
		} )
		JackalEnemyLockonShipAnimation0:RegisterAnimationSequence( "lockBreak", {
			{
				function ()
					return self.JackalEnemyLockonShipAnimation0:SetScale( 0, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShipAnimation0:SetScale( 1.1, 290 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonShipAnimation0:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.JackalEnemyLockonShipAnimation0:SetAlpha( 0, 290 )
				end
			}
		} )
		self._sequences.lockBreak = function ()
			JackalEnemyLockonCenter0:AnimateSequence( "lockBreak" )
			JackalEnemyLockonMid0:AnimateSequence( "lockBreak" )
			JackalEnemyLockonLast0:AnimateSequence( "lockBreak" )
			JackalEnemyLockonShipAnimation0:AnimateSequence( "lockBreak" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalEnemyLockonShipandReticule", JackalEnemyLockonShipandReticule )
LockTable( _M )
