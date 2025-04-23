local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ThorMissileGrid( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 56 * _1080p )
	self.id = "ThorMissileGrid"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BackgroundFrames = nil
	
	BackgroundFrames = LUI.UIImage.new()
	BackgroundFrames.id = "BackgroundFrames"
	BackgroundFrames:SetAlpha( 0.45, 0 )
	BackgroundFrames:setImage( RegisterMaterial( "hud_scorestreak_thor_missile_frames" ), 0 )
	BackgroundFrames:SetBlendMode( BLEND_MODE.addWithAlpha )
	BackgroundFrames:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -32, _1080p * 32 )
	self:addElement( BackgroundFrames )
	self.BackgroundFrames = BackgroundFrames
	
	local Grid = nil
	
	Grid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 5,
		maxVisibleRows = 1,
		controllerIndex = f1_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ThorMissile", {
				controllerIndex = f1_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 126,
		rowHeight = _1080p * 112,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Grid.id = "Grid"
	Grid:SetScale( -0.5, 0 )
	Grid:setUseStencil( false )
	Grid:SetGridDataSource( DataSources.inGame.MP.scorestreakHuds.thorMissiles, f1_local1 )
	Grid:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -315, _1080p * 315, _1080p * -56, _1080p * 56 )
	self:addElement( Grid )
	self.Grid = Grid
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Grid:RegisterAnimationSequence( "ThorIntro", {
			{
				function ()
					return self.Grid:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Grid:SetAlpha( 0, 600 )
				end,
				function ()
					return self.Grid:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Grid:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Grid:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Grid:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Grid:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.ThorIntro = function ()
			Grid:AnimateSequence( "ThorIntro" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.thorMissilesVisible:GetModel( f1_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.thorMissilesVisible:GetValue( f1_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.thorMissilesVisible:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ThorIntro" )
		end
	end )
	return self
end

MenuBuilder.registerType( "ThorMissileGrid", ThorMissileGrid )
LockTable( _M )
