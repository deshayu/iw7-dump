local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalEnemyLockonIndicator( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "JackalEnemyLockonIndicator"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local JackalEnemyLockonShipandReticule0 = nil
	
	JackalEnemyLockonShipandReticule0 = MenuBuilder.BuildRegisteredType( "JackalEnemyLockonShipandReticule", {
		controllerIndex = f1_local1
	} )
	JackalEnemyLockonShipandReticule0.id = "JackalEnemyLockonShipandReticule0"
	JackalEnemyLockonShipandReticule0:SetAlpha( Add( Multiply( 1, 0 ), DataSources.inGame.jackal.enemyLockonUiAlpha:GetValue( f1_local1 ) ), 0 )
	JackalEnemyLockonShipandReticule0:SetXRotation( Add( Multiply( 0, 0 ), DataSources.inGame.jackal.enemyLockonRotX:GetValue( f1_local1 ) ), 0 )
	JackalEnemyLockonShipandReticule0:SetYRotation( Add( Multiply( 45, 0 ), DataSources.inGame.jackal.enemyLockonRotY:GetValue( f1_local1 ) ), 0 )
	JackalEnemyLockonShipandReticule0:SetScale( Add( Multiply( 0, 0 ), DataSources.inGame.jackal.enemyLockonUiScale:GetValue( f1_local1 ) ), 0 )
	JackalEnemyLockonShipandReticule0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -94, _1080p * 94, _1080p * -94, _1080p * 94 )
	JackalEnemyLockonShipandReticule0:SubscribeToModel( DataSources.inGame.jackal.enemyLockonX1:GetModel( f1_local1 ), function ()
		JackalEnemyLockonShipandReticule0:SetLeft( _1080p * Add( Add( Multiply( -94, 0 ), DataSources.inGame.jackal.enemyLockonX1:GetValue( f1_local1 ) ), -94 ), 0 )
	end )
	JackalEnemyLockonShipandReticule0:SubscribeToModel( DataSources.inGame.jackal.enemyLockonX1:GetModel( f1_local1 ), function ()
		JackalEnemyLockonShipandReticule0:SetRight( _1080p * Add( Add( Multiply( 94, 0 ), DataSources.inGame.jackal.enemyLockonX1:GetValue( f1_local1 ) ), 94 ), 0 )
	end )
	JackalEnemyLockonShipandReticule0:SubscribeToModel( DataSources.inGame.jackal.enemyLockonY1:GetModel( f1_local1 ), function ()
		JackalEnemyLockonShipandReticule0:SetTop( _1080p * Add( Add( Multiply( -94, 0 ), DataSources.inGame.jackal.enemyLockonY1:GetValue( f1_local1 ) ), -94 ), 0 )
	end )
	JackalEnemyLockonShipandReticule0:SubscribeToModel( DataSources.inGame.jackal.enemyLockonY1:GetModel( f1_local1 ), function ()
		JackalEnemyLockonShipandReticule0:SetBottom( _1080p * Add( Add( Multiply( 94, 0 ), DataSources.inGame.jackal.enemyLockonY1:GetValue( f1_local1 ) ), 94 ), 0 )
	end )
	JackalEnemyLockonShipandReticule0:SubscribeToModel( DataSources.inGame.jackal.enemyLockonUiAlpha:GetModel( f1_local1 ), function ()
		JackalEnemyLockonShipandReticule0:SetAlpha( Add( Multiply( 1, 0 ), DataSources.inGame.jackal.enemyLockonUiAlpha:GetValue( f1_local1 ) ), 0 )
	end )
	JackalEnemyLockonShipandReticule0:SubscribeToModel( DataSources.inGame.jackal.enemyLockonRotX:GetModel( f1_local1 ), function ()
		JackalEnemyLockonShipandReticule0:SetXRotation( Add( Multiply( 0, 0 ), DataSources.inGame.jackal.enemyLockonRotX:GetValue( f1_local1 ) ), 0 )
	end )
	JackalEnemyLockonShipandReticule0:SubscribeToModel( DataSources.inGame.jackal.enemyLockonRotY:GetModel( f1_local1 ), function ()
		JackalEnemyLockonShipandReticule0:SetYRotation( Add( Multiply( 45, 0 ), DataSources.inGame.jackal.enemyLockonRotY:GetValue( f1_local1 ) ), 0 )
	end )
	JackalEnemyLockonShipandReticule0:SubscribeToModel( DataSources.inGame.jackal.enemyLockonUiScale:GetModel( f1_local1 ), function ()
		JackalEnemyLockonShipandReticule0:SetScale( Add( Multiply( 0, 0 ), DataSources.inGame.jackal.enemyLockonUiScale:GetValue( f1_local1 ) ), 0 )
	end )
	self:addElement( JackalEnemyLockonShipandReticule0 )
	self.JackalEnemyLockonShipandReticule0 = JackalEnemyLockonShipandReticule0
	
	return self
end

MenuBuilder.registerType( "JackalEnemyLockonIndicator", JackalEnemyLockonIndicator )
LockTable( _M )
