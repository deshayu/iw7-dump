local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DropshipFlightStatusCritical( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 32 * _1080p )
	self.id = "DropshipFlightStatusCritical"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local criticalBar = nil
	
	criticalBar = LUI.UIImage.new()
	criticalBar.id = "criticalBar"
	criticalBar:setImage( RegisterMaterial( "dropship_hud_integrity_box_1" ), 0 )
	self:addElement( criticalBar )
	self.criticalBar = criticalBar
	
	local critical = nil
	
	critical = LUI.UIText.new()
	critical.id = "critical"
	critical:SetRGBFromTable( SWATCHES.dropship.warningText, 0 )
	critical:setText( ToUpperCase( Engine.Localize( "DROPSHIP_CRITICAL" ) ), 0 )
	critical:SetFontSize( 24 * _1080p )
	critical:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	critical:SetAlignment( LUI.Alignment.Center )
	critical:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -11, _1080p * 13 )
	self:addElement( critical )
	self.critical = critical
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		criticalBar:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.criticalBar:SetAlpha( 1, 0 )
				end,
				function ()
					return self.criticalBar:SetAlpha( 0.5, 250 )
				end,
				function ()
					return self.criticalBar:SetAlpha( 1, 250 )
				end
			}
		} )
		critical:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.critical:SetAlpha( 1, 0 )
				end,
				function ()
					return self.critical:SetAlpha( 1, 250 )
				end,
				function ()
					return self.critical:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.Pulse = function ()
			criticalBar:AnimateLoop( "Pulse" )
			critical:AnimateLoop( "Pulse" )
		end
		
		criticalBar:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.criticalBar:SetAlpha( 0, 0 )
				end
			}
		} )
		critical:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.critical:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			criticalBar:AnimateSequence( "Default" )
			critical:AnimateSequence( "Default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "DropshipFlightStatusCritical", DropshipFlightStatusCritical )
LockTable( _M )
