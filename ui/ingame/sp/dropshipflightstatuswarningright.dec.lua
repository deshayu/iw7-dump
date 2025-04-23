local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DropshipFlightStatusWarningRight( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 184 * _1080p, 0, 64 * _1080p )
	self.id = "DropshipFlightStatusWarningRight"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local WarningIconRight = nil
	
	WarningIconRight = LUI.UIImage.new()
	WarningIconRight.id = "WarningIconRight"
	WarningIconRight:setImage( RegisterMaterial( "dropship_hud_warning_icon_1" ), 0 )
	WarningIconRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -64, 0, 0, 0 )
	self:addElement( WarningIconRight )
	self.WarningIconRight = WarningIconRight
	
	local WarningBoxRight = nil
	
	WarningBoxRight = LUI.UIImage.new()
	WarningBoxRight.id = "WarningBoxRight"
	WarningBoxRight:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -64, _1080p * -15, _1080p * 15 )
	self:addElement( WarningBoxRight )
	self.WarningBoxRight = WarningBoxRight
	
	local Fuel = nil
	
	Fuel = LUI.UIText.new()
	Fuel.id = "Fuel"
	Fuel:SetRGBFromTable( SWATCHES.dropship.warningText, 0 )
	Fuel:setText( ToUpperCase( Engine.Localize( "DROPSHIP_PRESSURE" ) ), 0 )
	Fuel:SetFontSize( 20 * _1080p )
	Fuel:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Fuel:SetAlignment( LUI.Alignment.Center )
	Fuel:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -64, _1080p * -10, _1080p * 10 )
	self:addElement( Fuel )
	self.Fuel = Fuel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WarningIconRight:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.WarningIconRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WarningIconRight:SetAlpha( 0.5, 500 )
				end,
				function ()
					return self.WarningIconRight:SetAlpha( 1, 500 )
				end
			}
		} )
		WarningBoxRight:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.WarningBoxRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WarningBoxRight:SetAlpha( 0.5, 500 )
				end,
				function ()
					return self.WarningBoxRight:SetAlpha( 1, 500 )
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
			WarningIconRight:AnimateLoop( "Pulse" )
			WarningBoxRight:AnimateLoop( "Pulse" )
			Fuel:AnimateLoop( "Pulse" )
		end
		
		WarningIconRight:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.WarningIconRight:SetAlpha( 0, 0 )
				end
			}
		} )
		WarningBoxRight:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.WarningBoxRight:SetAlpha( 0, 0 )
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
			WarningIconRight:AnimateSequence( "Default" )
			WarningBoxRight:AnimateSequence( "Default" )
			Fuel:AnimateSequence( "Default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "DropshipFlightStatusWarningRight", DropshipFlightStatusWarningRight )
LockTable( _M )
