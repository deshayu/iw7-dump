local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LocationSelectorGrid( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1024 * _1080p, 0, 1024 * _1080p )
	self.id = "LocationSelectorGrid"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GridLayout = nil
	
	GridLayout = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 8,
		maxVisibleRows = 8,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "LocationSelectorGridCell", {
				controllerIndex = f1_local1
			} )
		end,
		refreshChild = function ( f3_arg0, f3_arg1, f3_arg2 )
			
		end,
		numRows = 8,
		numColumns = 8,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 128,
		rowHeight = _1080p * 128,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	GridLayout.id = "GridLayout"
	GridLayout:setUseStencil( false )
	self:addElement( GridLayout )
	self.GridLayout = GridLayout
	
	return self
end

MenuBuilder.registerType( "LocationSelectorGrid", LocationSelectorGrid )
LockTable( _M )
