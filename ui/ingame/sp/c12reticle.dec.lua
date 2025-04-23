local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function C12Reticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 60 * _1080p )
	self.id = "C12Reticle"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Box = nil
	
	Box = LUI.UIImage.new()
	Box.id = "Box"
	Box:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	Box:setImage( RegisterMaterial( "hud_c12_reticle_lock_no_ammo" ), 0 )
	Box:SetBlendMode( BLEND_MODE.addWithAlpha )
	Box:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16 )
	self:addElement( Box )
	self.Box = Box
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Box:RegisterAnimationSequence( "Targetable", {
			{
				function ()
					return self.Box:SetScale( 1, 0 )
				end,
				function ()
					return self.Box:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Targetable = function ()
			Box:AnimateSequence( "Targetable" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "lockState", function ()
		local f7_local0 = self:GetDataSource()
		if f7_local0.lockState:GetValue( f1_local1 ) ~= nil then
			f7_local0 = self:GetDataSource()
			if f7_local0.lockState:GetValue( f1_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "Targetable" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "C12Reticle", C12Reticle )
LockTable( _M )
