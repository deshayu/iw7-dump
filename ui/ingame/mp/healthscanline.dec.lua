local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HealthScanline( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HealthScanline"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Scanline0 = nil
	
	Scanline0 = MenuBuilder.BuildRegisteredType( "Scanline", {
		controllerIndex = f1_local1
	} )
	Scanline0.id = "Scanline0"
	Scanline0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 1048, _1080p * 1080 )
	self:addElement( Scanline0 )
	self.Scanline0 = Scanline0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Scanline0:RegisterAnimationSequence( "animate_full_up", {
			{
				function ()
					return self.Scanline0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Scanline0:SetAlpha( 0.5, 100 )
				end,
				function ()
					return self.Scanline0:SetAlpha( 0.5, 250 )
				end,
				function ()
					return self.Scanline0:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.Scanline0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 1080, _1080p * 1746.02, 0 )
				end,
				function ()
					return self.Scanline0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * -721.02, 0, 349 )
				end
			}
		} )
		self._sequences.animate_full_up = function ()
			Scanline0:AnimateSequence( "animate_full_up" )
		end
		
		Scanline0:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.Scanline0:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hide = function ()
			Scanline0:AnimateSequence( "hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.suits.HealthRegenHud:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.suits.HealthRegenHud:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.HealthRegenHud:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "animate_full_up" )
		end
	end )
	self:addEventHandler( "menu_create", function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "hide" )
	end )
	return self
end

MenuBuilder.registerType( "HealthScanline", HealthScanline )
LockTable( _M )
