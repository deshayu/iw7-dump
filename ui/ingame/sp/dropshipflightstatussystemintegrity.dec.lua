local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DropshipFlightStatusSystemIntegrity( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 64 * _1080p )
	self.id = "DropshipFlightStatusSystemIntegrity"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local systemIntegrityBar = nil
	
	systemIntegrityBar = LUI.UIImage.new()
	systemIntegrityBar.id = "systemIntegrityBar"
	systemIntegrityBar:setImage( RegisterMaterial( "dropship_hud_integrity_box_1" ), 0 )
	self:addElement( systemIntegrityBar )
	self.systemIntegrityBar = systemIntegrityBar
	
	local systemText = nil
	
	systemText = LUI.UIText.new()
	systemText.id = "systemText"
	systemText:SetRGBFromTable( SWATCHES.dropship.warningText, 0 )
	systemText:setText( ToUpperCase( Engine.Localize( "DROPSHIP_SYSTEM_INTEGRITY" ) ), 0 )
	systemText:SetFontSize( 32 * _1080p )
	systemText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	systemText:SetAlignment( LUI.Alignment.Center )
	systemText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 16, _1080p * 48 )
	self:addElement( systemText )
	self.systemText = systemText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		systemIntegrityBar:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.systemIntegrityBar:SetAlpha( 1, 0 )
				end,
				function ()
					return self.systemIntegrityBar:SetAlpha( 0.5, 250 )
				end,
				function ()
					return self.systemIntegrityBar:SetAlpha( 1, 250 )
				end
			}
		} )
		systemText:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.systemText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.systemText:SetAlpha( 1, 250 )
				end,
				function ()
					return self.systemText:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.Pulse = function ()
			systemIntegrityBar:AnimateLoop( "Pulse" )
			systemText:AnimateLoop( "Pulse" )
		end
		
		systemIntegrityBar:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.systemIntegrityBar:SetAlpha( 0, 0 )
				end
			}
		} )
		systemText:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.systemText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			systemIntegrityBar:AnimateSequence( "Default" )
			systemText:AnimateSequence( "Default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "DropshipFlightStatusSystemIntegrity", DropshipFlightStatusSystemIntegrity )
LockTable( _M )
