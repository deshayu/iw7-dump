local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function charmsHUDWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 637 * _1080p, 0, 64 * _1080p )
	self.id = "charmsHUDWidget"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PerkList = nil
	
	PerkList = LUI.UIDataSourceToggleList.new( nil, {
		listDataSource = DataSources.inGame.CP.zombies.charms.activeCharms,
		controlDataSource = DataSources.inGame.CP.zombies.charms.activeCharmBits,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "charmIcon", {
				controllerIndex = f1_local1
			} )
		end,
		controller = f1_local1,
		orderedIndices = false,
		direction = LUI.DIRECTION.horizontal,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.None,
		animateInDuration = 500,
		animateOutDuration = 500,
		animationVariance = 100
	} )
	PerkList.id = "PerkList"
	PerkList:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 3, 0, 0, _1080p * -64 )
	self:addElement( PerkList )
	self.PerkList = PerkList
	
	return self
end

MenuBuilder.registerType( "charmsHUDWidget", charmsHUDWidget )
LockTable( _M )
