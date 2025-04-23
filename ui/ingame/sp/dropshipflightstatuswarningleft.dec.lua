local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DropshipFlightStatusWarningLeft( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 184 * _1080p, 0, 64 * _1080p )
	self.id = "DropshipFlightStatusWarningLeft"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local WarningIconLeft = nil
	
	WarningIconLeft = LUI.UIImage.new()
	WarningIconLeft.id = "WarningIconLeft"
	WarningIconLeft:setImage( RegisterMaterial( "dropship_hud_warning_icon_1" ), 0 )
	WarningIconLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 64, 0, 0 )
	self:addElement( WarningIconLeft )
	self.WarningIconLeft = WarningIconLeft
	
	local WarningBoxLeft = nil
	
	WarningBoxLeft = LUI.UIImage.new()
	WarningBoxLeft.id = "WarningBoxLeft"
	WarningBoxLeft:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 64, 0, _1080p * -15, _1080p * 15 )
	self:addElement( WarningBoxLeft )
	self.WarningBoxLeft = WarningBoxLeft
	
	local Fuel = nil
	
	Fuel = LUI.UIText.new()
	Fuel.id = "Fuel"
	Fuel:SetRGBFromTable( SWATCHES.dropship.warningText, 0 )
	Fuel:setText( ToUpperCase( Engine.Localize( "DROPSHIP_FUEL" ) ), 0 )
	Fuel:SetFontSize( 20 * _1080p )
	Fuel:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Fuel:SetAlignment( LUI.Alignment.Center )
	Fuel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 64, 0, _1080p * -10, _1080p * 10 )
	self:addElement( Fuel )
	self.Fuel = Fuel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WarningIconLeft:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.WarningIconLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WarningIconLeft:SetAlpha( 0.5, 500 )
				end,
				function ()
					return self.WarningIconLeft:SetAlpha( 1, 500 )
				end
			}
		} )
		WarningBoxLeft:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.WarningBoxLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WarningBoxLeft:SetAlpha( 0.5, 500 )
				end,
				function ()
					return self.WarningBoxLeft:SetAlpha( 1, 500 )
				end
			}
		} )
		Fuel:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.Fuel:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Fuel:SetAlpha( 1, 500 )
				end,
				function ()
					return self.Fuel:SetAlpha( 1, 500 )
				end
			}
		} )
		self._sequences.Pulse = function ()
			WarningIconLeft:AnimateLoop( "Pulse" )
			WarningBoxLeft:AnimateLoop( "Pulse" )
			Fuel:AnimateLoop( "Pulse" )
		end
		
		WarningIconLeft:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.WarningIconLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		WarningBoxLeft:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.WarningBoxLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		Fuel:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Fuel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			WarningIconLeft:AnimateSequence( "Default" )
			WarningBoxLeft:AnimateSequence( "Default" )
			Fuel:AnimateSequence( "Default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "DropshipFlightStatusWarningLeft", DropshipFlightStatusWarningLeft )
LockTable( _M )
