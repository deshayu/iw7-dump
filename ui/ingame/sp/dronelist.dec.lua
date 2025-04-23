local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DroneList( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 270 * _1080p, 0, 500 * _1080p )
	self.id = "DroneList"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if not Engine.InFrontend() then
		f1_local3 = LUI.UIDataSourceToggleList.new( nil, {
			listDataSource = DataSources.inGame.SP.droneInfo.activeDrones,
			controlDataSource = DataSources.inGame.SP.droneInfo.activeDroneBits,
			buildChild = function ()
				return MenuBuilder.BuildRegisteredType( "DroneWidget", {
					controllerIndex = f1_local1
				} )
			end,
			controller = f1_local1,
			orderedIndices = false,
			direction = LUI.DIRECTION.vertical,
			horizontalAlignment = LUI.Alignment.Right,
			verticalAlignment = LUI.Alignment.None,
			animateInDuration = 0,
			animateOutDuration = 250,
			animationVariance = 0
		} )
		f1_local3.id = "Drones"
		f1_local3:SetYRotation( -20, 0 )
		f1_local3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -270, 0, 0, _1080p * 480 )
		self:addElement( f1_local3 )
		self.Drones = f1_local3
	end
	return self
end

MenuBuilder.registerType( "DroneList", DroneList )
LockTable( _M )
