local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function skullStrikeIconWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "skullStrikeIconWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetRGBFromInt( 16250871, 0 )
	Frame:setImage( RegisterMaterial( "cp_disco_buster_x" ), 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local icon = nil
	
	icon = LUI.UIImage.new()
	icon.id = "icon"
	icon:setImage( RegisterMaterial( "cp_disco_buster_x" ), 0 )
	self:addElement( icon )
	self.icon = icon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Frame:RegisterAnimationSequence( "cpTown", {
			{
				function ()
					return self.Frame:setImage( RegisterMaterial( "zm_hud_pixel_skull" ), 0 )
				end
			}
		} )
		icon:RegisterAnimationSequence( "cpTown", {
			{
				function ()
					return self.icon:setImage( RegisterMaterial( "zm_hud_pixel_skull" ), 0 )
				end
			}
		} )
		self._sequences.cpTown = function ()
			Frame:AnimateSequence( "cpTown" )
			icon:AnimateSequence( "cpTown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsDLC3( self ) then
		ACTIONS.AnimateSequence( self, "cpTown" )
	end
	return self
end

MenuBuilder.registerType( "skullStrikeIconWidget", skullStrikeIconWidget )
LockTable( _M )
