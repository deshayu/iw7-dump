local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function UpdateFeedSubscriptionHelper( f1_arg0, f1_arg1, f1_arg2 )
	return function ()
		local f2_local0 = 8
		local f2_local1 = f1_arg1:GetValue( f1_arg2 )
		if f2_local1 < 0 or f2_local1 == f1_arg0.lastSeenIndex then
			if f2_local1 < 0 then
				f1_arg0.lastSeenIndex = -1
			end
			return -1
		end
		local f2_local2 = f2_local1 % f2_local0
		assert( f2_local2 < f2_local0 )
		local f2_local3 = (f1_arg0.lastSeenIndex + 1) % f2_local0
		local f2_local4 = (f2_local2 + 1) % f2_local0
		local f2_local5 = f2_local3
		repeat
			DataSources.inGame.MP.scoreEvents.text:SetValue( f1_arg2, Engine.Localize( Engine.TableLookupByRow( CSV.scoreEventTable.file, Game.GetOmnvar( "ui_score_event_list_" .. f2_local5 ), CSV.scoreEventTable.cols.text ) ) )
			DataSources.inGame.MP.scoreEvents.push:SetValue( f1_arg2, true )
			f2_local5 = (f2_local5 + 1) % f2_local0
		until f2_local5 == f2_local4
		f1_arg0.lastSeenIndex = f2_local1
	end
	
end

f0_local0 = function ( f3_arg0, f3_arg1 )
	return function ()
		local f4_local0 = Game.GetCurrentLocalClient()
		Game.SetCurrentLocalClient( f3_arg1 )
		f3_arg0()
		Game.SetCurrentLocalClient( f4_local0 )
	end
	
end

function PostLoadFunc( f5_arg0, f5_arg1 )
	f5_arg0.lastSeenIndex = -1
	local f5_local0 = LUI.DataSourceFromOmnvar.new( "ui_score_event_control" )
	f5_arg0:SubscribeToModel( f5_local0:GetModel( f5_arg1 ), f0_local0( UpdateFeedSubscriptionHelper( f5_arg0, f5_local0, f5_arg1 ), f5_arg1 ), true )
	local f5_local1 = LUI.DataSourceInControllerModel.new( "cg.MP.scoreEvents.push.TTL" )
	f5_local1:SetValue( f5_arg1, 1450 )
end

function ScoreEventFeed( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1200 * _1080p, 0, 154 * _1080p )
	self.id = "ScoreEventFeed"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local Feed = nil
	
	Feed = LUI.UIDataSourceFeed.new( nil, {
		primaryAxis = LUI.DIRECTION.horizontal,
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f6_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ScoreEventLine", {
				controllerIndex = f6_local1
			} )
		end,
		dataSource = DataSources.inGame.MP.scoreEvents,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 1200,
		rowHeight = _1080p * 24,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Feed:SetGlitchEnabled( true )
	Feed:SetGlitchAmount( 1, 0 )
	Feed:SetGlitchBlockWidth( 50, 0 )
	Feed:SetGlitchBlockHeight( 50, 0 )
	Feed:SetGlitchDistortionRange( 16, 0 )
	Feed:SetGlitchScanlinePitch( 1, 0 )
	Feed:SetGlitchMaskPitch( 1, 0 )
	Feed:setUseStencil( false )
	Feed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1200, 0, _1080p * 154 )
	self:addElement( Feed )
	self.Feed = Feed
	
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "ScoreEventFeed", ScoreEventFeed )
LockTable( _M )
