local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalADSReticleRing( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "JackalADSReticleRing"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local StaticRing = nil
	
	StaticRing = LUI.UIImage.new()
	StaticRing.id = "StaticRing"
	StaticRing:SetAlpha( 0, 0 )
	StaticRing:setImage( RegisterMaterial( "hud_jackal_reticule_piece_ads_circle" ), 0 )
	self:addElement( StaticRing )
	self.StaticRing = StaticRing
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		StaticRing:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.StaticRing:SetZRotation( 0, 0 )
				end,
				function ()
					return self.StaticRing:SetZRotation( 180, 2000 )
				end
			}
		} )
		self._sequences.Loop = function ()
			StaticRing:AnimateLoop( "Loop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "menu_create", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Loop" )
	end )
	return self
end

MenuBuilder.registerType( "JackalADSReticleRing", JackalADSReticleRing )
LockTable( _M )
