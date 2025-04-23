local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Loadouts )
	if CONDITIONS.IsSplitscreen( f1_arg0 ) then
		assert( f1_arg0.ListCount )
		f1_arg0.Loadouts:AddItemNumbers( f1_arg0.ListCount )
	end
end

function InGameLoadoutList( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 360 * _1080p, 0, 390 * _1080p )
	self.id = "InGameLoadoutList"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Loadouts = nil
	
	Loadouts = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = SubtractForSplitscreen( 10, 4 ),
		controllerIndex = f2_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "InGameSelectLoadoutButtonWrapper", {
				controllerIndex = f2_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 360,
		rowHeight = _1080p * 30,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Loadouts.id = "Loadouts"
	Loadouts:setUseStencil( false )
	Loadouts:SetGridDataSourceThroughElement( self, nil )
	self:addElement( Loadouts )
	self.Loadouts = Loadouts
	
	local f2_local4 = nil
	if CONDITIONS.IsSplitscreen( self ) then
		f2_local4 = LUI.UIText.new()
		f2_local4.id = "ListCount"
		f2_local4:setText( "1/15", 0 )
		f2_local4:SetFontSize( 24 * _1080p )
		f2_local4:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f2_local4:SetAlignment( LUI.Alignment.Center )
		f2_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 107.5, _1080p * 252.5, _1080p * 231, _1080p * 255 )
		self:addElement( f2_local4 )
		self.ListCount = f2_local4
	end
	local f2_local5 = nil
	if CONDITIONS.IsSplitscreen( self ) then
		f2_local5 = MenuBuilder.BuildRegisteredType( "ArrowUp", {
			controllerIndex = f2_local1
		} )
		f2_local5.id = "ArrowUp"
		f2_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 252.5, _1080p * 272.5, _1080p * 223, _1080p * 263 )
		self:addElement( f2_local5 )
		self.ArrowUp = f2_local5
	end
	local f2_local6 = nil
	if CONDITIONS.IsSplitscreen( self ) then
		f2_local6 = MenuBuilder.BuildRegisteredType( "ArrowDown", {
			controllerIndex = f2_local1
		} )
		f2_local6.id = "ArrowDown"
		f2_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 87.5, _1080p * 107.5, _1080p * 222, _1080p * 262 )
		self:addElement( f2_local6 )
		self.ArrowDown = f2_local6
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Loadouts:RegisterAnimationSequence( "OpenLoadoutEdit", {
			{
				function ()
					return self.Loadouts:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1036.93, _1080p * -516.93, _1080p * 66, _1080p * 957, 500 )
				end
			}
		} )
		self._sequences.OpenLoadoutEdit = function ()
			Loadouts:AnimateSequence( "OpenLoadoutEdit" )
		end
		
		Loadouts:RegisterAnimationSequence( "CloseLoadoutEdit", {
			{
				function ()
					return self.Loadouts:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 143.07, _1080p * 663.07, _1080p * 66, _1080p * 957, 500 )
				end
			}
		} )
		self._sequences.CloseLoadoutEdit = function ()
			Loadouts:AnimateSequence( "CloseLoadoutEdit" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "InGameLoadoutList", InGameLoadoutList )
LockTable( _M )
