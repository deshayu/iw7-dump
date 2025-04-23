local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalInteriorDisplayOverlayMed( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "JackalInteriorDisplayOverlayMed"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local WarningImage = nil
	
	WarningImage = LUI.UIImage.new()
	WarningImage.id = "WarningImage"
	WarningImage:SetAlpha( 0, 0 )
	WarningImage:setImage( RegisterMaterial( "hud_jackal_interior_warning_sm" ), 0 )
	WarningImage:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( WarningImage )
	self.WarningImage = WarningImage
	
	local IncomingImage = nil
	
	IncomingImage = LUI.UIImage.new()
	IncomingImage.id = "IncomingImage"
	IncomingImage:setImage( RegisterMaterial( "hud_jackal_interior_caution_sm" ), 0 )
	IncomingImage:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( IncomingImage )
	self.IncomingImage = IncomingImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WarningImage:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.WarningImage:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WarningImage:SetAlpha( 0, 120 )
				end,
				function ()
					return self.WarningImage:SetAlpha( 1, 120 )
				end
			}
		} )
		IncomingImage:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.IncomingImage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Warning = function ()
			WarningImage:AnimateLoop( "Warning" )
			IncomingImage:AnimateLoop( "Warning" )
		end
		
		WarningImage:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.WarningImage:SetAlpha( 0, 0 )
				end
			}
		} )
		IncomingImage:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.IncomingImage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			WarningImage:AnimateSequence( "Default" )
			IncomingImage:AnimateSequence( "Default" )
		end
		
		WarningImage:RegisterAnimationSequence( "Incoming", {
			{
				function ()
					return self.WarningImage:SetAlpha( 0, 0 )
				end
			}
		} )
		IncomingImage:RegisterAnimationSequence( "Incoming", {
			{
				function ()
					return self.IncomingImage:SetAlpha( 1, 0 )
				end,
				function ()
					return self.IncomingImage:SetAlpha( 0, 120 )
				end,
				function ()
					return self.IncomingImage:SetAlpha( 1, 120 )
				end
			}
		} )
		self._sequences.Incoming = function ()
			WarningImage:AnimateLoop( "Incoming" )
			IncomingImage:AnimateLoop( "Incoming" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "JackalInteriorDisplayOverlayMed", JackalInteriorDisplayOverlayMed )
LockTable( _M )
