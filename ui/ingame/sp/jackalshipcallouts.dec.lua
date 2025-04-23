local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	none = 0,
	allyJackal = 1,
	enemyJackal = 2,
	enemyDogfight = 3,
	allyCapitalship = 4,
	enemyCapitalship = 5,
	enemyAce = 6,
	enemyAceDogfight = 7,
	allyJackalUnloc = 8
}
f0_local1 = {
	minScale = 0.75,
	maxScale = 1.2,
	naturalDistance = 5000,
	screenOffsetX = 0,
	screenOffsetY = 0
}
f0_local2 = function ()
	local f1_local0 = MenuBuilder.BuildRegisteredType( "JackalShipCallout_allyJackal" )
	f1_local0:SetupAnchoredElement( f0_local1 )
	return f1_local0
end

local f0_local3 = function ()
	local f2_local0 = MenuBuilder.BuildRegisteredType( "JackalShipCallout_allyJackalUnloc" )
	f2_local0:SetupAnchoredElement( f0_local1 )
	return f2_local0
end

local f0_local4 = function ()
	local f3_local0 = MenuBuilder.BuildRegisteredType( "JackalShipCallout_enemyJackal" )
	f3_local0:SetupAnchoredElement( f0_local1 )
	return f3_local0
end

local f0_local5 = function ()
	local f4_local0 = MenuBuilder.BuildRegisteredType( "JackalShipCallout_enemyDogFight" )
	f4_local0:SetupAnchoredElement( f0_local1 )
	return f4_local0
end

local f0_local6 = function ()
	local f5_local0 = MenuBuilder.BuildRegisteredType( "JackalShipCallout_allyCapitalShip" )
	f5_local0:SetupAnchoredElement( f0_local1 )
	return f5_local0
end

local f0_local7 = function ()
	local f6_local0 = MenuBuilder.BuildRegisteredType( "JackalShipCallout_enemyCapitalShip" )
	f6_local0:SetupAnchoredElement( f0_local1 )
	return f6_local0
end

local f0_local8 = function ()
	local f7_local0 = MenuBuilder.BuildRegisteredType( "JackalShipCallout_enemyAce" )
	f7_local0:SetupAnchoredElement( f0_local1 )
	return f7_local0
end

local f0_local9 = function ()
	local f8_local0 = MenuBuilder.BuildRegisteredType( "JackalShipCallout_enemyAceDogfight" )
	f8_local0:SetupAnchoredElement( f0_local1 )
	return f8_local0
end

function JackalShipCallouts()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "JackalShipCallouts"
	self.callouts = {}
	local f9_local1 = LUI.LUIElementPool.new( {
		buildElement = f0_local6,
		initialPoolSize = 1,
		id = "allyCapitalShip"
	} )
	local f9_local2 = LUI.LUIElementPool.new( {
		buildElement = f0_local2,
		initialPoolSize = 1,
		id = "allyJackal"
	} )
	local f9_local3 = LUI.LUIElementPool.new( {
		buildElement = f0_local9,
		initialPoolSize = 1,
		id = "enemyAceDogfight"
	} )
	local f9_local4 = LUI.LUIElementPool.new( {
		buildElement = f0_local8,
		initialPoolSize = 1,
		id = "enemyAce"
	} )
	local f9_local5 = LUI.LUIElementPool.new( {
		buildElement = f0_local7,
		initialPoolSize = 1,
		id = "enemyCapitalShip"
	} )
	local f9_local6 = LUI.LUIElementPool.new( {
		buildElement = f0_local5,
		initialPoolSize = 1,
		id = "enemyDogFight"
	} )
	local f9_local7 = LUI.LUIElementPool.new( {
		buildElement = f0_local4,
		initialPoolSize = 1,
		id = "enemyJackal"
	} )
	local f9_local8 = LUI.LUIElementPool.new( {
		buildElement = f0_local3,
		initialPoolSize = 1,
		id = "allyJackalUnloc"
	} )
	local f9_local9 = self:getRootController()
	local f9_local10 = #DataSources.inGame.jackal.shipCallouts
	for f9_local11 = 0, f9_local10 - 1, 1 do
		local f9_local14 = f9_local11
		local f9_local15 = DataSources.inGame.jackal.shipCallouts[f9_local14 + 1]
		self:SubscribeToModel( f9_local15.changed:GetModel( f9_local9 ), function ( f10_arg0 )
			local f10_local0 = Game.GetOmnvar( "ui_jackal_ship_callout_" .. f9_local14 )
			if f10_local0 == GameScriptConstants.EntityNumNone then
				if self.callouts[f9_local14] then
					self.callouts[f9_local14].pool:DeallocateElement( self.callouts[f9_local14] )
					self.callouts[f9_local14]:RemoveFromParent()
					self.callouts[f9_local14]:UnsubscribeFromAllModels()
					self.callouts[f9_local14] = nil
				end
			else
				local f10_local1 = Game.GetOmnvar( "ui_jackal_ship_callout_type_" .. f9_local14 )
				local f10_local2 = Engine.GetSpaceshipTargetTag( Game.GetOmnvar( "ui_jackal_ship_callout_sstarget_" .. f9_local14 ) )
				if self.callouts[f9_local14] ~= nil and self.callouts[f9_local14].lastType ~= f10_local1 then
					self.callouts[f9_local14].pool:DeallocateElement( self.callouts[f9_local14] )
					self.callouts[f9_local14]:RemoveFromParent()
					self.callouts[f9_local14]:UnsubscribeFromAllModels()
					self.callouts[f9_local14] = nil
				end
				if not self.callouts[f9_local14] then
					local f10_local3 = nil
					if f10_local1 == f0_local0.allyJackal then
						f10_local3 = f9_local2:AllocateElement()
						f10_local3.pool = f9_local2
					elseif f10_local1 == f0_local0.enemyJackal then
						f10_local3 = f9_local7:AllocateElement()
						f10_local3.pool = f9_local7
					elseif f10_local1 == f0_local0.enemyDogfight then
						f10_local3 = f9_local6:AllocateElement()
						f10_local3.pool = f9_local6
					elseif f10_local1 == f0_local0.allyCapitalship then
						f10_local3 = f9_local1:AllocateElement()
						f10_local3.pool = f9_local1
					elseif f10_local1 == f0_local0.enemyCapitalship then
						f10_local3 = f9_local5:AllocateElement()
						f10_local3.pool = f9_local5
					elseif f10_local1 == f0_local0.enemyAce then
						f10_local3 = f9_local4:AllocateElement()
						f10_local3.pool = f9_local4
					elseif f10_local1 == f0_local0.enemyAceDogfight then
						f10_local3 = f9_local3:AllocateElement()
						f10_local3.pool = f9_local3
					elseif f10_local1 == f0_local0.allyJackalUnloc then
						f10_local3 = f9_local8:AllocateElement()
						f10_local3.pool = f9_local8
					else
						DebugPrint( "Unsupported callout type: " .. f10_local1 )
					end
					if f10_local3 ~= nil then
						self.callouts[f9_local14] = f10_local3
						self:addElement( f10_local3 )
						if CONDITIONS.IsPC( self ) then
							f10_local3:processEvent( {
								name = "refresh_jackal_callouts"
							} )
						end
					end
				end
				if self.callouts[f9_local14] then
					self.callouts[f9_local14].id = "callout" .. f9_local14
					self.callouts[f9_local14].lastType = f10_local1
					self.callouts[f9_local14]:SetEntityTag( f10_local2 )
					self.callouts[f9_local14]:SetEntityNum( f10_local0 )
					self.callouts[f9_local14]:SetDataSource( f9_local15, f9_local9 )
				end
			end
		end, true )
	end
	return self
end

MenuBuilder.registerType( "JackalShipCallouts", JackalShipCallouts )
LockTable( _M )
