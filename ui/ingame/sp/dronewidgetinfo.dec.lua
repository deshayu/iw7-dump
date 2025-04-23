local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DroneWidgetInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 270 * _1080p, 0, 88 * _1080p )
	self.id = "DroneWidgetInfo"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local AmmoCount = nil
	
	AmmoCount = LUI.UIText.new()
	AmmoCount.id = "AmmoCount"
	AmmoCount:setText( "10", 0 )
	AmmoCount:SetFontSize( 36 * _1080p )
	AmmoCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AmmoCount:SetAlignment( LUI.Alignment.Center )
	AmmoCount:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 11, _1080p * 60.85, _1080p * -39, _1080p * -3 )
	self:addElement( AmmoCount )
	self.AmmoCount = AmmoCount
	
	local DroneName = nil
	
	DroneName = LUI.UIText.new()
	DroneName.id = "DroneName"
	DroneName:setText( Engine.Localize( "EQUIPMENT_SUPPORTDRONE" ), 0 )
	DroneName:SetFontSize( 24 * _1080p )
	DroneName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DroneName:SetAlignment( LUI.Alignment.Right )
	DroneName:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 60.85, _1080p * 174, _1080p * -33, _1080p * -9 )
	self:addElement( DroneName )
	self.DroneName = DroneName
	
	local TrophyLabel = nil
	
	TrophyLabel = LUI.UIText.new()
	TrophyLabel.id = "TrophyLabel"
	TrophyLabel:SetAlpha( 0.8, 0 )
	TrophyLabel:setText( "TROPHY SYSTEM:", 0 )
	TrophyLabel:SetFontSize( 16 * _1080p )
	TrophyLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TrophyLabel:SetAlignment( LUI.Alignment.Right )
	TrophyLabel:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 5.54, _1080p * 122, _1080p * 19, _1080p * 35 )
	self:addElement( TrophyLabel )
	self.TrophyLabel = TrophyLabel
	
	local DroneWidgetAmmoBar0 = nil
	
	DroneWidgetAmmoBar0 = MenuBuilder.BuildRegisteredType( "DroneWidgetAmmoBar", {
		controllerIndex = f1_local1
	} )
	DroneWidgetAmmoBar0.id = "DroneWidgetAmmoBar0"
	DroneWidgetAmmoBar0:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 11, _1080p * 175, _1080p * -8, _1080p * 8 )
	self:addElement( DroneWidgetAmmoBar0 )
	self.DroneWidgetAmmoBar0 = DroneWidgetAmmoBar0
	
	local TrophyStatus = nil
	
	TrophyStatus = LUI.UIText.new()
	TrophyStatus.id = "TrophyStatus"
	TrophyStatus:SetRGBFromInt( 6277069, 0 )
	TrophyStatus:setText( "ONLINE", 0 )
	TrophyStatus:SetFontSize( 16 * _1080p )
	TrophyStatus:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TrophyStatus:SetAlignment( LUI.Alignment.Left )
	TrophyStatus:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 126, _1080p * 184.27, _1080p * 19, _1080p * 35 )
	self:addElement( TrophyStatus )
	self.TrophyStatus = TrophyStatus
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AmmoCount:RegisterAnimationSequence( "AmmoChange", {
			{
				function ()
					return self.AmmoCount:SetScale( 0, 0 )
				end,
				function ()
					return self.AmmoCount:SetScale( 0.5, 80 )
				end,
				function ()
					return self.AmmoCount:SetScale( 0, 80 )
				end
			}
		} )
		self._sequences.AmmoChange = function ()
			AmmoCount:AnimateSequence( "AmmoChange" )
		end
		
		AmmoCount:RegisterAnimationSequence( "AmmoLow", {
			{
				function ()
					return self.AmmoCount:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.AmmoCount:SetRGBFromInt( 12557109, 160 )
				end
			}
		} )
		DroneWidgetAmmoBar0:RegisterAnimationSequence( "AmmoLow", {
			{
				function ()
					return self.DroneWidgetAmmoBar0.AmmoBarFill:SetRGBFromInt( 6277069, 0 )
				end,
				function ()
					return self.DroneWidgetAmmoBar0.AmmoBarFill:SetRGBFromInt( 12557109, 160 )
				end
			}
		} )
		self._sequences.AmmoLow = function ()
			AmmoCount:AnimateSequence( "AmmoLow" )
			DroneWidgetAmmoBar0:AnimateSequence( "AmmoLow" )
		end
		
		AmmoCount:RegisterAnimationSequence( "AmmoNormal", {
			{
				function ()
					return self.AmmoCount:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		DroneWidgetAmmoBar0:RegisterAnimationSequence( "AmmoNormal", {
			{
				function ()
					return self.DroneWidgetAmmoBar0.AmmoBarFill:SetRGBFromInt( 6277069, 0 )
				end
			}
		} )
		self._sequences.AmmoNormal = function ()
			AmmoCount:AnimateSequence( "AmmoNormal" )
			DroneWidgetAmmoBar0:AnimateSequence( "AmmoNormal" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "DroneWidgetInfo", DroneWidgetInfo )
LockTable( _M )
