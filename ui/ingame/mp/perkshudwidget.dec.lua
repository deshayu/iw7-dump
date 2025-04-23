local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:registerEventHandler( "bootup_hud", function ( element, event )
		ACTIONS.AnimateSequence( f1_arg0, "ShowPerks" )
	end )
end

function PerksHUDWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 305 * _1080p )
	self.id = "PerksHUDWidget"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local PerkListGrid = nil
	
	PerkListGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 6,
		controllerIndex = f3_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PerksHUDWidgetInfo", {
				controllerIndex = f3_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 50,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	PerkListGrid.id = "PerkListGrid"
	PerkListGrid:SetAlpha( 0, 0 )
	PerkListGrid:setUseStencil( true )
	PerkListGrid:SetGridDataSource( DataSources.inGame.player.perkList, f3_local1 )
	PerkListGrid:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 305 )
	self:addElement( PerkListGrid )
	self.PerkListGrid = PerkListGrid
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PerkListGrid:RegisterAnimationSequence( "ShowPerks", {
			{
				function ()
					return self.PerkListGrid:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PerkListGrid:SetAlpha( 1, 300 )
				end,
				function ()
					return self.PerkListGrid:SetAlpha( 1, 2700 )
				end,
				function ()
					return self.PerkListGrid:SetAlpha( 0, 500 )
				end
			}
		} )
		self._sequences.ShowPerks = function ()
			PerkListGrid:AnimateSequence( "ShowPerks" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.spawnCount:GetModel( f3_local1 ), function ()
		ACTIONS.AnimateSequence( self, "ShowPerks" )
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "PerksHUDWidget", PerksHUDWidget )
LockTable( _M )
