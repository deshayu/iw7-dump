local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WonderCardFillWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 116 * _1080p, 0, 672 * _1080p )
	self.id = "WonderCardFillWidget"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ToggleList0 = nil
	ToggleList0 = LUI.UIDataSourceToggleList.new( nil, {
		listDataSource = DataSources.inGame.CP.zombies.cards.activeCards,
		controlDataSource = DataSources.inGame.CP.zombies.cards.activeCardBits,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "radialActiveCardElement", {
				controllerIndex = f1_local1
			} )
		end,
		controller = f1_local1,
		orderedIndices = true,
		direction = LUI.DIRECTION.vertical,
		horizontalAlignment = LUI.Alignment.None,
		verticalAlignment = LUI.Alignment.Bottom,
		animateInDuration = 250,
		animateOutDuration = 250,
		animationVariance = 0
	} )
	ToggleList0.id = "ToggleList0"
	ToggleList0:SetScale( -0.1, 0 )
	local f1_local4
	if not CONDITIONS.IsSplitscreen( self ) then
		f1_local4 = 705.5
		if not f1_local4 then
		
		else
			ToggleList0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 101, _1080p * 201, _1080p * 35.5, _1080p * f1_local4 )
			self:addElement( ToggleList0 )
			self.ToggleList0 = ToggleList0
			
			return self
		end
	end
	f1_local4 = 805.5
end

MenuBuilder.registerType( "WonderCardFillWidget", WonderCardFillWidget )
LockTable( _M )
