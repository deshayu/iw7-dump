local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ZomPowerupIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ZomPowerupIcon"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PowerupIcon = nil
	
	PowerupIcon = LUI.UIImage.new()
	PowerupIcon.id = "PowerupIcon"
	PowerupIcon:SetAlpha( 0, 0 )
	PowerupIcon:SubscribeToModelThroughElement( self, "powerIcon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.powerIcon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			PowerupIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( PowerupIcon )
	self.PowerupIcon = PowerupIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PowerupIcon:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.PowerupIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 0, 970 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 1, 60 )
				end
			}
		} )
		self._sequences.FadeIn = function ()
			PowerupIcon:AnimateSequence( "FadeIn" )
		end
		
		PowerupIcon:RegisterAnimationSequence( "Flash", {
			{
				function ()
					return self.PowerupIcon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 0, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 1, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 0, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 1, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 0, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 1, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 0, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 1, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 0, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 1, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 0, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 1, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 0, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 1, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 0, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 1, 240 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 0, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 1, 260 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 0, 250 )
				end,
				function ()
					return self.PowerupIcon:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.Flash = function ()
			PowerupIcon:AnimateSequence( "Flash" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PowerupIcon:SubscribeToModelThroughElement( self, "powerIcon", function ()
		ACTIONS.AnimateSequence( self, "FadeIn" )
	end )
	self:addEventHandler( "togglelist_bitfield_animate", function ( f32_arg0, f32_arg1 )
		local f32_local0 = f32_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Flash" )
	end )
	return self
end

MenuBuilder.registerType( "ZomPowerupIcon", ZomPowerupIcon )
LockTable( _M )
