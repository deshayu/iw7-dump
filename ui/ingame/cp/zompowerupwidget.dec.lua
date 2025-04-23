local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ZomPowerupWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 515 * _1080p, 0, 64 * _1080p )
	self.id = "ZomPowerupWidget"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ZomPowerupWidget = nil
	
	ZomPowerupWidget = LUI.UIDataSourceToggleList.new( nil, {
		listDataSource = DataSources.inGame.CP.zombies.powerups.activePowerups,
		controlDataSource = DataSources.inGame.CP.zombies.powerups.activePowerupBits,
		animationDataSource = DataSources.inGame.CP.zombies.powerups.activePowerupAnimationBits,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ZomPowerupIcon", {
				controllerIndex = f1_local1
			} )
		end,
		controller = f1_local1,
		orderedIndices = false,
		direction = LUI.DIRECTION.horizontal,
		horizontalAlignment = LUI.Alignment.Right,
		verticalAlignment = LUI.Alignment.None,
		animateInDuration = 500,
		animateOutDuration = 500,
		animationVariance = 100
	} )
	ZomPowerupWidget.id = "ZomPowerupWidget"
	ZomPowerupWidget:SetZRotation( 8, 0 )
	ZomPowerupWidget:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -3, 0, 0 )
	self:addElement( ZomPowerupWidget )
	self.ZomPowerupWidget = ZomPowerupWidget
	
	return self
end

MenuBuilder.registerType( "ZomPowerupWidget", ZomPowerupWidget )
LockTable( _M )
