local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.DataSourcedGridLayout:SetGridDataSource( DataSources.inGame.CP.zombies.dlc3.elements[f1_arg1 - 1] )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "zm_ui_blackboard_" .. f1_arg1 .. "_ent" ) )
		f2_arg0:SetEntityTag( "equipment_whiteboard_stand" )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( -1, 0, 31.5 )
		f2_arg0:SetTagSpaceRoll( 0 )
		if f1_arg1 == 6 then
			f2_arg0:SetTagSpaceYaw( -91 )
			f2_arg0:SetTagSpacePosition( -1, -1, 31.5 )
		elseif f1_arg1 == 2 then
			f2_arg0:SetTagSpaceYaw( 11 )
			f2_arg0:SetTagSpacePosition( 0, -1, 31.5 )
		elseif f1_arg1 == 3 then
			f2_arg0:SetTagSpaceYaw( 185 )
			f2_arg0:SetTagSpacePosition( -0.5, 1, 31.5 )
		elseif f1_arg1 == 4 then
			f2_arg0:SetTagSpaceYaw( 90 )
			f2_arg0:SetTagSpacePosition( 1, 1, 30.5 )
		elseif f1_arg1 == 1 then
			f2_arg0:SetTagSpaceYaw( 22 )
			f2_arg0:SetTagSpacePosition( 1, -1, 31.5 )
		elseif f1_arg1 == 5 then
			f2_arg0:SetTagSpaceYaw( -83 )
			f2_arg0:SetTagSpacePosition( -1, 0, 31.5 )
		end
	end
	
	f1_arg0:registerOmnvarHandler( "zm_ui_blackboard_" .. f1_arg1 .. "_ent", f1_local0 )
	f1_local0( f1_arg0, {} )
end

function PostLoadFunc( f3_arg0, f3_arg1 )
	f3_arg0:SetupInWorldElement( {} )
	f3_arg0:SetInWorldScale( 0.1 )
	f3_arg0.SetupBlackboard = f0_local0
end

function blackboard1( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 759 * _1080p, 0, 561 * _1080p )
	self.id = "blackboard1"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local box = nil
	
	box = LUI.UIImage.new()
	box.id = "box"
	box:SetAlpha( 0, 0 )
	box:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 759, 0, _1080p * 561 )
	self:addElement( box )
	self.box = box
	
	local DataSourcedGridLayout = nil
	
	DataSourcedGridLayout = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "elementItem", {
				controllerIndex = f4_local1
			} )
		end,
		refreshChild = function ( f6_arg0, f6_arg1, f6_arg2 )
			f6_arg0.index = {
				f6_arg1,
				f6_arg2
			}
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 15,
		spacingY = _1080p * 15,
		columnWidth = _1080p * 747,
		rowHeight = _1080p * 80,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	DataSourcedGridLayout.id = "DataSourcedGridLayout"
	DataSourcedGridLayout:setUseStencil( true )
	DataSourcedGridLayout:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 747, 0, _1080p * 555 )
	self:addElement( DataSourcedGridLayout )
	self.DataSourcedGridLayout = DataSourcedGridLayout
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "blackboard1", blackboard1 )
LockTable( _M )
