local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 1250
function AddToAwardQueue( f1_arg0, f1_arg1, f1_arg2 )
	DataSources.inGame.MP.awardQueue.text:SetValue( f1_arg0, f1_arg1 )
	DataSources.inGame.MP.awardQueue.icon:SetValue( f1_arg0, f1_arg2 )
	DataSources.inGame.MP.awardQueue.push:SetValue( f1_arg0, true )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	return function ()
		if Engine.GetDvarInt( "scr_hide_medals" ) == 1 then
			return 
		end
		local f3_local0 = f2_arg0.name:GetValue( f2_arg1 )
		local f3_local1 = f2_arg0.icon:GetValue( f2_arg1 )
		local f3_local2 = f2_arg0.count:GetValue( f2_arg1 )
		local f3_local3 = f3_local2 - f2_arg0.lastCount:GetValue( f2_arg1 )
		for f3_local4 = 1, f3_local3, 1 do
			local f3_local7 = f3_local4
			AddToAwardQueue( f2_arg1, f3_local0, f3_local1 )
		end
		f2_arg0.lastCount:SetValue( f2_arg1, f3_local2 )
	end
	
end

f0_local2 = -1
local f0_local3 = 4
local f0_local4 = function ( f4_arg0, f4_arg1 )
	return function ()
		if not MLG.IsMLGSpectator() then
			return 
		end
		local f5_local0 = f4_arg0:GetValue( f4_arg1 )
		if f0_local2 == f5_local0 then
			return 
		elseif not MLG.ShoutcasterProfileVarBool( f4_arg1, "shoutcaster_playernotifications" ) then
			return 
		end
		f0_local2 = f5_local0
		local f5_local1 = f0_local2 % f0_local3
		f5_local0 = (f5_local0 + 1) % f0_local3
		repeat
			local f5_local2 = DataSources.inGame.MP.awards:GetDataSourceAtIndex( MLG.GetSpectatorAwardIDByIndex( f5_local1 ), f4_arg1 )
			if f5_local2.notifyDuringMatch:GetValue( f4_arg1 ) then
				AddToAwardQueue( f4_arg1, f5_local2.name:GetValue( f4_arg1 ), f5_local2.icon:GetValue( f4_arg1 ) )
			end
			f5_local1 = (f5_local1 + 1) % f0_local3
		until f5_local1 == f5_local0
	end
	
end

local f0_local5 = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = DataSources.inGame.MP.awards:GetCountValue( f6_arg1 )
	for f6_local1 = 0, f6_local0 - 1, 1 do
		local f6_local4 = DataSources.inGame.MP.awards:GetDataSourceAtIndex( f6_local1, f6_arg1 )
		if f6_local4.notifyDuringMatch:GetValue( f6_arg1 ) then
			f6_arg0:SubscribeToModel( f6_local4.count:GetModel( f6_arg1 ), f0_local1( f6_local4, f6_arg1 ), true )
		end
	end
	f0_local2 = -1
	DataSources.inGame.MP.awardQueue.push:SetValue( f6_arg1, false )
	DataModel.SetModelValue( DataSources.inGame.MP.awardEvents:GetTTLModel( f6_arg1 ), f0_local0 )
	if Engine.GetDvarBool( "com_codcasterEnabled" ) then
		local f6_local2 = LUI.DataSourceFromOmnvar.new( "ui_spectating_award_event_index" )
		f6_arg0:SubscribeToModel( f6_local2:GetModel( f6_arg1 ), f0_local4( f6_local2, f6_arg1 ) )
	end
end

function AwardFeed( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 227 * _1080p )
	self.id = "AwardFeed"
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local Feed = nil
	
	Feed = LUI.UIDataSourceFeed.new( nil, {
		primaryAxis = LUI.DIRECTION.vertical,
		maxVisibleColumns = 4,
		maxVisibleRows = 1,
		controllerIndex = f7_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "Award", {
				controllerIndex = f7_local1
			} )
		end,
		dataSource = DataSources.inGame.MP.awardEvents,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 300,
		rowHeight = _1080p * 227,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 1000
	} )
	Feed:setUseStencil( true )
	Feed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1200, 0, _1080p * 227 )
	self:addElement( Feed )
	self.Feed = Feed
	
	f0_local5( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "AwardFeed", AwardFeed )
LockTable( _M )
